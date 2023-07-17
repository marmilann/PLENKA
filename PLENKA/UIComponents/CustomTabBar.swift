//
//  CustomTabBar.swift
//  PLENKA
//
//  Created by Nariman on 12.07.2023.
//

import SwiftUI
import UIKit

enum CustomTabBarItem: TabBarItemProtocol {
    case home
    case newPost
    case profile

    var tag: Int {
        switch self {
        case .home:
            return 0
        case .newPost:
            return 1
        case .profile:
            return 2
        }
    }

    var imageName: String {
        switch self {
        case .home:
            return "news"
        case .newPost:
            return "camera"
        case .profile:
            return "profile"
        }
    }

    func getContent() -> some View {
        switch self {
        case .home:
            MainScreenView(viewModel: MainScreenViewModel())
            .setupCustomTab(tab: CustomTabBarItem.home)
        case .newPost:
            NewPostView()
            .setupCustomTab(tab: CustomTabBarItem.newPost)
        case .profile:
            ProfileView()
            .setupCustomTab(tab: CustomTabBarItem.profile)
        }
    }
}

public struct CustomTabBar<T: TabBarItemProtocol>: View {

    @State private var selectedTab: T
    private let allCases: [T]

    private var safeAreaInsets: UIEdgeInsets? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets
    }

    public init(selectedTab: T, allCases: [T]) {
        self._selectedTab = State(initialValue: selectedTab)
        self.allCases = allCases
    }

    public var body: some View {
        TabView(selection: $selectedTab) {
            ForEach(allCases, id: \.self) { tab in
                tab.getContent()
            }
        }
        .overlay(alignment: .bottom) {
            let bottomPadding = safeAreaInsets?.bottom  == 0 ? Constants.tabBarBottomPaddingForOlderDevices : 0

            getCustomTabBarView()
                .padding(.bottom, bottomPadding)
        }
        
    }

    @ViewBuilder
    private func getCustomTabBarView() -> some View {
        HStack {
            Spacer(minLength: 0)
            ForEach(allCases, id: \.self) { tab in
                CustomTabButton(currentTab: tab, selectedTab: $selectedTab)
                Spacer(minLength: 0)
            }
        }
        .frame(maxWidth: 600)
        .font(.title2.bold())
        .frame(height: Constants.customTabBarHeight)
        .background(.ultraThinMaterial)
        .clipShape(Capsule())
        .padding(.horizontal, 32)
        .shadow(color: .black.opacity(0.15), radius: 5, x: 5, y: 5)
        .shadow(color: .black.opacity(0.15), radius: 5, x: -5, y: -5)
    }
}

struct CustomTabButton<T: TabBarItemProtocol>: View {
    var currentTab: T
    @Binding var selectedTab: T

    var body: some View {
        Button {
            selectedTab = currentTab
        } label: {
            Image(currentTab.imageName)
                .foregroundColor(selectedTab == currentTab ? Color(uiColor: .systemOrange) : Color.gray.opacity(0.8))
                .padding()
        }
    }
}


struct CustomTabBarViewModifier<V: TabBarItemProtocol>: ViewModifier {
    private let tab: V

    private var safeAreaInsets: UIEdgeInsets? {
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets
    }
    
    init(tab: V) {
        self.tab = tab
    }

    func body(content: Content) -> some View {
        let bottomPadding = safeAreaInsets?.bottom  == 0 ? Constants.tabBarBottomPaddingForOlderDevices : 0

        content
            .safeAreaInset(edge: .bottom, spacing: .zero) {
                Spacer().frame(height: Constants.customTabBarHeight + bottomPadding)
            }
            .tag(tab.tag)
            .onAppear {
                UITabBar.changeTabBarState(shouldHide: true)
            }
    }
}

public extension View {

    func setupCustomTab<V: TabBarItemProtocol>(tab: V) -> some View {
        return modifier(CustomTabBarViewModifier(tab: tab))
    }
}

enum Constants {

    static let customTabBarHeight: CGFloat = 50
    static let tabBarBottomPaddingForOlderDevices: CGFloat = 20
}

public protocol TabBarItemProtocol: CaseIterable, Hashable {
    var tag: Int { get }
    var imageName: String { get }

    associatedtype Content: View
    @ViewBuilder func getContent() -> Content
}

extension UITabBar {

    private static var originalY: Double?

    static public func changeTabBarState(shouldHide: Bool) {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        windowScene?.windows.first(where: { $0.isKeyWindow })?.allSubviews().forEach { view in
            guard let tabBar = view as? UITabBar else {
                return
            }

            if !tabBar.isHidden && shouldHide {
                originalY = (tabBar.superview?.frame.origin.y)!
                tabBar.superview?.frame.origin.y = (tabBar.superview?.frame.origin.y)! + 4.5
            } else if tabBar.isHidden && !shouldHide {
                guard let originalY else {
                    return
                }
                tabBar.superview?.frame.origin.y = originalY
            }

            tabBar.isHidden = shouldHide
            tabBar.superview?.setNeedsLayout()
            tabBar.superview?.layoutIfNeeded()
        }
    }
}

extension UIView {

    func allSubviews() -> [UIView] {
        var allSubviews = subviews
        for subview in subviews {
            allSubviews.append(contentsOf: subview.allSubviews())
        }
        return allSubviews
    }
}
