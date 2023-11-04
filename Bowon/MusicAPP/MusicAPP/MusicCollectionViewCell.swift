//
//  MusicCollectionViewCell.swift
//  MusicAPP
//
//  Created by Bowon Han on 11/1/23.
//

import UIKit
import SnapKit

class MusicCollectionViewCell : UICollectionViewCell {
    var musicImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil")

        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setLayout(){
        addSubview(musicImageView)
        
        musicImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func requestImageURL(data: Music) {
        guard let url = URL(string: data.imageName) else { return }
        
        Task {
            guard
                let imageURL = try? await self.fetchImage(requestURL: url),
                let url = URL(string: imageURL),
                let data = try? Data(contentsOf: url)
            else { return }
            DispatchQueue.main.async{
                self.musicImageView.image = UIImage(data: data)
            }
        }
    }
    
    func fetchImage(requestURL: URL) async throws -> String {
        let (data, _) = try await URLSession.shared.data(from: requestURL)
        return try JSONDecoder().decode(Music.self, from: data).imageName
    }
}

// MARK: - UICollectionViewCell extension
extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
