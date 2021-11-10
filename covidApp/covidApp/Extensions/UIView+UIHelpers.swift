//
//  UIView+Helpers.swift
//  classification
//
//  Created by coriv🧑🏻‍💻 on 11/6/21.
//

import Foundation
import UIKit
import SnapKit

extension UIView {
    func removeAllSubviews() {
        self.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}

extension UIView {
    func addScrollableContentView(backgroundColor: UIColor? = nil, margins: UIEdgeInsets) -> UIView {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceVertical = true
        scrollView.isUserInteractionEnabled = true
        scrollView.backgroundColor = backgroundColor
        addSubview(scrollView)
                
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaInsets)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self.safeAreaInsets)
        }

        let content = UIView()
        scrollView.addSubview(content)
        content.snp.makeConstraints { make in
            make.edges.equalTo(scrollView.contentLayoutGuide.snp.edges).inset(margins)
            make.width.equalTo(scrollView.frameLayoutGuide.snp.width).offset(-margins.horizontal)
        }
        
        return content
    }
    
    func appendView(_ view: UIView, spacing: CGFloat = 0, top: ConstraintItem) -> ConstraintItem {
        addSubview(view)
        view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(top).offset(spacing)
        }
        return view.snp.bottom
    }
    
    func appendView(_ view: UIView, insets: UIEdgeInsets, top: ConstraintItem) -> ConstraintItem {
        addSubview(view)
        view.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(insets)
            make.top.equalTo(top).offset(insets.top)
        }
        return view.snp.bottom
    }
    
    @discardableResult
    func layout(appendMaker: ((UIView, UIEdgeInsets?) -> ()) -> ()) -> Self {
        var topAnchor = self.snp.top
        var bottomInset: CGFloat = 0
        
        appendMaker { view, insets in
            var insets = insets ?? UIEdgeInsets()
            insets.top += bottomInset
            topAnchor = appendView(view, insets: insets, top: topAnchor)
            bottomInset = insets.bottom
        }
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(topAnchor).offset(bottomInset)
        }
        
        return self
    }
}

extension UIEdgeInsets {
    init(top: CGFloat? = nil, left: CGFloat? = nil, bottom: CGFloat? = nil, right: CGFloat? = nil) {
        self.init(top: top ?? 0, left: left ?? 0, bottom: bottom ?? 0, right: right ?? 0)
    }

    init(horizontal: CGFloat? = nil, vertical: CGFloat? = nil) {
        self.init(top: vertical ?? 0, left: horizontal ?? 0, bottom: vertical ?? 0, right: horizontal ?? 0)
    }

    init(_ inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }

    var horizontal: CGFloat {
        get { left + right }
    }

    var vertical: CGFloat {
        get { top + bottom }
    }
}
