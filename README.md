# CustomView with .xib
This is a complete and elegant example of how to create custom view from .xib


```swift
protocol CustomViewDelegate: class {
    func backButtonPressed()
}

class CustomView: UIView {
    /// To handle backbutton action using delegation
    weak var delegage: CustomViewDelegate?
    
    /// To handle backbutton action using closure
    var backButtonPressed: (() -> Void)?
    @IBOutlet weak var backButton: UIButton!
    /// It is used when the view is created from storyboard/xib. It means setting custom class of a View in storyboard/xib to "CustomView"
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    /// It is used when you create the view programmatically.
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func commonInit() {
        /// Loading the nib
        guard let contentView = self.fromNib()
            else { fatalError("View could not load from nib") }
        addSubview(contentView)
        //Adding layout constraints
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.layoutAttachAll()
        backButton.layer.borderWidth = 2
        backButton.layer.cornerRadius = 8
        backButton.layer.borderColor = #colorLiteral(red: 0.1137254902, green: 0.6, blue: 0.5137254902, alpha: 1)
    }
    
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        if let _backButtonPressed = backButtonPressed {
            _backButtonPressed()
        } else {
            delegage?.backButtonPressed()
        }
    }
}

extension UIView {
    /// Eventhough we already set the file owner in the xib file, where we are setting the file owner again because sending nil will set existing file owner to nil.
    @discardableResult
    func fromNib<T : UIView>() -> T? {
        guard let contentView = Bundle(for: type(of: self))
            .loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
                return nil
        }
        return contentView
    }
}

extension UIView {
    
    /// Attaches all sides of the receiver to its parent view
    func layoutAttachAll(margin : CGFloat = 0.0) {
        let view = superview
        layoutAttachTop(to: view, margin: margin)
        layoutAttachBottom(to: view, margin: margin)
        layoutAttachLeading(to: view, margin: margin)
        layoutAttachTrailing(to: view, margin: margin)
    }
    
    /// Attaches the top of the current view to the given view's top if it's a superview of the current view, or to it's bottom if it's not (assuming this is then a sibling view).
    /// if view is not provided, the current view's super view is used
    @discardableResult
    func layoutAttachTop(to: UIView? = nil, margin : CGFloat = 0.0) -> NSLayoutConstraint {
        
        let view: UIView? = to ?? superview
        let isSuperview = view == superview
        let constraint = NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: view, attribute: isSuperview ? .top : .bottom, multiplier: 1.0, constant: margin)
        superview?.addConstraint(constraint)
        
        return constraint
    }
    
    /// Attaches the bottom of the current view to the given view
    @discardableResult
    func layoutAttachBottom(to: UIView? = nil, margin : CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        
        let view: UIView? = to ?? superview
        let isSuperview = (view == superview) || false
        let constraint = NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: isSuperview ? .bottom : .top, multiplier: 1.0, constant: -margin)
        if let priority = priority {
            constraint.priority = priority
        }
        superview?.addConstraint(constraint)
        
        return constraint
    }
    
    /// Attaches the leading edge of the current view to the given view
    @discardableResult
    func layoutAttachLeading(to: UIView? = nil, margin : CGFloat = 0.0) -> NSLayoutConstraint {
        
        let view: UIView? = to ?? superview
        let isSuperview = (view == superview) || false
        let constraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: view, attribute: isSuperview ? .leading : .trailing, multiplier: 1.0, constant: margin)
        superview?.addConstraint(constraint)
        
        return constraint
    }
    
    /// Attaches the trailing edge of the current view to the given view
    @discardableResult
    func layoutAttachTrailing(to: UIView? = nil, margin : CGFloat = 0.0, priority: UILayoutPriority? = nil) -> NSLayoutConstraint {
        
        let view: UIView? = to ?? superview
        let isSuperview = (view == superview) || false
        let constraint = NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: isSuperview ? .trailing : .leading, multiplier: 1.0, constant: -margin)
        if let priority = priority {
            constraint.priority = priority
        }
        superview?.addConstraint(constraint)
        
        return constraint
    }
}
```