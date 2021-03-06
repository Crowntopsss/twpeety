//
//  ProfileHeader.swift
//  twpeety
//
//  Created by Temitope on 24/04/2021.
//

import UIKit

protocol ProfileHeaderDelegate: class {
    func handleDismissal()
    func handleEditProfileFollow(_ header: ProfileHeader)
}

class ProfileHeader: UICollectionReusableView {
  
    
    // MARK: - Properties
    
    var user: User? {
        didSet { configure()  }
    }
    
    weak var delegate: ProfileHeaderDelegate?
    
    private let filterBar = ProfileFilterView()
    
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        view.addSubview(backButton)
        backButton.anchor(top: view.topAnchor, left:view.leftAnchor, paddingTop: 42, paddingLeft: 16)
        backButton.setDimensions(width: 30, height: 30)
        return view
    
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "baseline_arrow_back_white_24dp").withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 80, height: 80)
        iv.layer.cornerRadius = 80/2
        iv.backgroundColor = .lightGray
        iv.layer.borderWidth = 4
        iv.layer.borderColor = UIColor.white.cgColor

        return iv
    }()
    
    private lazy var editProfileFollowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Loading", for: .normal)
        button.layer.borderColor = UIColor.twitterBlue.cgColor
        button.layer.borderWidth = 1.25
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.setTitleColor(.twitterBlue, for: .normal)
        
        button.setDimensions(width: 80, height: 36)
        button.layer.cornerRadius = 32/2
        
        
        button.addTarget(self, action: #selector(handleEditProfileFollow), for: .touchUpInside)
        return button
    }()
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.text = "Eddie Brook"
        return label
    }()
    
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = "@venom"
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 3
        label.text = "This is a user bio that will span more than one line for test purpose"
        return label
    }()
    
    private let underlineView : UIView = {
        let view = UIView()
        view.backgroundColor = .twitterBlue
        return view
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        
        label.text = "0 Following"
        let followTap = UITapGestureRecognizer(target: self, action: #selector(handleFollowersTapped))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(followTap)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray



        return label
    }()
    
    private let followerLabel: UILabel = {
        let label = UILabel()
        
        label.text = "2 Followers"

        let followTap = UITapGestureRecognizer(target: self, action: #selector(handleFollowingTapped))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(followTap)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray


        
        return label
    }()
    
    // MARK: - LifeCycle
    
    override init(frame:CGRect){
        super.init(frame: frame)
        filterBar.delegate = self

        backgroundColor = .white

        addSubview(containerView)
        containerView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, height: 100)
        
        
        addSubview(profileImageView)
        profileImageView.anchor(top: containerView.bottomAnchor, left: leftAnchor, paddingTop: -24, paddingLeft: 8)
        
        addSubview(editProfileFollowButton)
        editProfileFollowButton.anchor(top: containerView.bottomAnchor, right: rightAnchor, paddingTop: 12, paddingRight: 12)
        
        let userDetailsStack = UIStackView(arrangedSubviews: [fullnameLabel,usernameLabel,bioLabel])
        
        userDetailsStack.axis = .vertical
        userDetailsStack.distribution = .fillProportionally
        userDetailsStack.spacing = 4
        
        addSubview(userDetailsStack)
        userDetailsStack.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 12, paddingRight: 12)
        
        let userFollowDetails = UIStackView(arrangedSubviews: [followingLabel,followerLabel])
        
        userFollowDetails.axis = .horizontal
        userFollowDetails.distribution = .fillEqually
        userFollowDetails.spacing = 8
        
        addSubview(userFollowDetails)
        userFollowDetails.anchor(top: userDetailsStack.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 12)
        
        addSubview(filterBar)
        filterBar.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 40)
    
        addSubview(underlineView)
        underlineView.anchor(left: leftAnchor, bottom: bottomAnchor,width: frame.width / 3, height: 2)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleDismissal() {
        delegate?.handleDismissal()
    }
    
    @objc func handleEditProfileFollow() {
        delegate?.handleEditProfileFollow(self)
        
    }
    @objc func handleFollowersTapped() {
        
    }
    @objc func handleFollowingTapped() {
        
    }
    // MARK: - Helpers
    
    func configure() {
        guard let user = user else {return}
        let viewModel = ProfileHeaderViewModel(user: user)
        
        profileImageView.sd_setImage(with: user.profileImageUrl)
        followerLabel.attributedText = viewModel.followersString
        followingLabel.attributedText = viewModel.followingString
        fullnameLabel.text = user.fullname
        usernameLabel.text = "@\(user.username)"
        editProfileFollowButton.setTitle(viewModel.actionButtonTitle, for: .normal)
    }

    
    
}

// MARK: - ProfileFilterViewDelegate


extension ProfileHeader: ProfileFilterViewDelegate {
    func filterView(_ view:ProfileFilterView, didSelect indexPath: IndexPath){
        guard let cell = view.collectionView.cellForItem(at: indexPath) as? ProfileFilterCell else {return}
        
        let xPosition = cell.frame.origin.x
        UIView.animate(withDuration: 0.2) {
            self.underlineView.frame.origin.x = xPosition
        }
    }

}
