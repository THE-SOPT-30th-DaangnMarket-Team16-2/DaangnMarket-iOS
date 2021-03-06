# DaangnMarket-iOS
๐ฅ16-2์กฐ ๋น๊ทผ๋ง์ผ ์ ์ํ๋ฌ ๊ฐ๋๋ค๐ฅ

</br>

## ๐ฉ๐ปโ๐ป  Developers

| ์ด์คํธ | ์ค์๋น | ๊ฐ์นํ  |
| ----------------- | :-----: | ----- |
| <img src="https://user-images.githubusercontent.com/80062632/170726532-0715d8ac-591f-467d-a22d-dd53993fde8b.png" width="200">|<img src="https://user-images.githubusercontent.com/80062632/170726745-6e417945-1a57-485f-a82e-b558d84f5cb4.png" width="200">|<img src="https://user-images.githubusercontent.com/77208067/170718481-ccb42a24-3118-45b8-ad4f-bcb8f4cbbfe3.jpeg" width="200">|

</br>

## ๐  Simulator

`ํด๋ผ์ด์ธํธ-๋์์ธ: ๋ทฐ ๊ตฌํ`
| PostListVC & Flow | PostDetailVC | PostDetailVC |
| ----------------- | :-----: | ----- |
|<img src = "https://user-images.githubusercontent.com/80062632/170760297-ddb38c38-3b56-4bfd-8557-e3906871919a.gif" width ="250"> |<img src ="https://user-images.githubusercontent.com/80062632/170726094-4707132f-db52-4d45-81fc-77bdf985fee9.gif" width ="250">  |<img src = "https://user-images.githubusercontent.com/77208067/170719101-65798262-f404-4e51-ab7d-0bde355cf0c4.gif" width ="250">|


`ํด๋ผ์ด์ธํธ-์๋ฒ: API ์ฐ๊ฒฐ`
| `List ๋ทฐ ๋ฌดํ์คํฌ๋กค GET ํต์ ` | `Write ๋ทฐ POST ํต์ ` | `Detail ๋ทฐ GET, PUT ํต์ ` |
|:--:|:--:|:--:|
| ![Simulator Screen Recording - iPhone 13 mini - 2022-06-13 at 17 01 50](https://user-images.githubusercontent.com/80062632/173308582-50347ac9-d442-4308-ab5f-29ba0d7e12ab.gif)| ![Simulator Screen Recording - iPhone 13 mini - 2022-06-13 at 17 02 40](https://user-images.githubusercontent.com/80062632/173308672-d81c28ea-3969-4ef1-96c0-f9637b1b9000.gif) | ![Simulator Screen Recording - iPhone 13 mini - 2022-06-13 at 17 03 39](https://user-images.githubusercontent.com/80062632/173308737-d5258758-c511-4523-a8e1-a2607eab75c8.gif) |

</br>

## ๐   Development Environment

<img width="77" alt="์คํฌ๋ฆฐ์ท 2021-11-19 ์คํ 3 52 02" src="https://img.shields.io/badge/iOS-13.0+-silver"> <img width="93" alt="์คํฌ๋ฆฐ์ท 2021-11-19 ์คํ 3 52 02" src="https://img.shields.io/badge/Xcode-13.3.1-blue">

</br>


#### ๐ Library

| ๋ผ์ด๋ธ๋ฌ๋ฆฌ        | Version | Tool |
| ----------------- | :-----: | ----- |
| Alamofire           | `5.6.1` | `CocoaPod` |
| SnapKit           | `5.6.0` | `CocoaPod` |
| RxSwift         | `6.5.0` | `CocoaPod` |
| RxCocoa        | `6.5.0` | `CocoaPod` |
| BSImagePicker       | `3.1` | `CocoaPod` |
| KingFisher       | `5.6.0` | `CocoaPod` |
| JJFloatingActionButton       | `2.5.0` | `CocoaPod` |


</br>

#### ๐ Foldering
```bash
โโโ Application
โ   โโโ Coordinator
โ   โโโ Manager
โ   โโโ Appdelegate
โ   โโโ SceneDelegate
โโโ Global
โ   โโโ Extension
โ   โโโ Literals
โ   โ   โโโ Literal
โ   โ   โโโ String
โ   โโโ Protocols
โ   โโโ Resources
โ   โ   โโโ Assets
โ   โโโ Supporting Files
โ   โ   โโโ Base
โโโโโโโโโโโโโโ LaunchScreen
โโโ Utils
โโโ Data
โ   โโโ Entity
โ   โโโ Network
โ   โโโ Repository
โโโ Domain
โ   โโโ Model
โ   โโโ Usecase
โโโ Presentation
โ   โโโ Scene1
โ   โ   โโโ VC
โ   โ   โโโ SB
โ   โ   โโโ View
โ   โ   โโโ ViewModel
โ   โ   โโโ Cells
โ   โโโ Scene2
โ   โ   โโโ VC
โ   โ   โโโ SB
โ   โ   โโโ View
โ   โ   โโโ ViewModel
โโโโโโโโโโโ Cells

```


</br>

## ๐  Git Branch

๊ฐ๋ณ ๋ธ๋์น ๊ด๋ฆฌ ๋ฐ ๋ณํฉ์ ์์ ์ฑ์ ์ํด `Git Forking WorkFlow`๋ฅผ ์ ์ฉํ์ต๋๋ค.

Branch๋ฅผ ์์ฑํ๊ธฐ ์  Issue๋ฅผ ๋จผ์  ์์ฑํ๊ณ ,

`<Prefix>/#<Issue_Number>` ์ ์์์ ๋ฐ๋ผ ๋ธ๋์น ๋ช์ ์์ฑํฉ๋๋ค.

#### 1๏ธโฃ prefix

- `develop`ย : feature ๋ธ๋์น์์ ๊ตฌํ๋ ๊ธฐ๋ฅ๋ค์ด merge๋  ๋ธ๋์น. **default ๋ธ๋์น์ด๋ค.**
- `feature`ย : ๊ธฐ๋ฅ์ ๊ฐ๋ฐํ๋ ๋ธ๋์น, ์ด์๋ณ/์์๋ณ๋ก ๋ธ๋์น๋ฅผ ์์ฑํ์ฌ ๊ธฐ๋ฅ์ ๊ฐ๋ฐํ๋ค
- `main`ย : ๊ฐ๋ฐ์ด ์๋ฃ๋ ์ฐ์ถ๋ฌผ์ด ์ ์ฅ๋  ๊ณต๊ฐ
- `release`ย : ๋ฆด๋ฆฌ์ฆ๋ฅผ ์ค๋นํ๋ ๋ธ๋์น, ๋ฆด๋ฆฌ์ฆ ์ง์  QA ๊ธฐ๊ฐ์ ์ฌ์ฉํ๋ค
- `bug`ย : ๋ฒ๊ทธ๋ฅผ ์์ ํ๋ ๋ธ๋์น
- `hotfix`ย : ์ ๋ง ๊ธํ๊ฒ, ์ ์ถ ์ง์ ์ ์๋ฌ๊ฐ ๋ ๊ฒฝ์ฐ ์ฌ์ฉํ๋ ๋ธ๋ ์น

#### 2๏ธโฃ Git forking workflow ์ ์ฉ

1. ํ ํ๋ก์ ํธ repo๋ฅผ ํฌํฌํ๋ค.(์ดํ ํ repo)
2. ํฌํฌํ ๊ฐ์ธ repo(์ดํ ๊ฐ์ธ repo)๋ฅผ cloneํ๋ค.
3. ๊ฐ์ธ repo์์ ์์ํ๊ณ  ๊ฐ์ธ repo์ ์๊ฒฉ์ ์ฅ์๋ก pushํ๋ค.
4. pull request๋ฅผ ํตํด์ ํ repo๋ก mergeํ๋ค.
5. pull ๋ฐ์์ผ ํ  ๋์๋ ํ repo์์ pull ๋ฐ๋๋ค.

</br>

## โ ๏ธ  Issue Naming Rule
#### 1๏ธโฃ ๊ธฐ๋ณธ ํ์
`[<PREFIX>] <Description>` ์ ์์์ ์ค์ํ๋, Prefix๋ ํ์ํ๋ฉฐ ๋ง์ถฐ๊ฐ๊ธฐ๋ก ํ๋ค.

#### 2๏ธโฃ ์์
```
[Feat] ํ์๊ฐ์ ๊ตฌํ
[Fix] MainActivity ๋ฒ๊ทธ ์์ 
```

#### 3๏ธโฃ Prefix์ ์๋ฏธ

```bash
[Feat] : ์๋ก์ด ๊ธฐ๋ฅ ๊ตฌํ
[Design] : just ํ๋ฉด. ๋ ์ด์์ ์กฐ์ 
[Fix] : ๋ฒ๊ทธ, ์ค๋ฅ ํด๊ฒฐ, ์ฝ๋ ์์ 
[Add] : Feat ์ด์ธ์ ๋ถ์์ ์ธ ์ฝ๋ ์ถ๊ฐ, ๋ผ์ด๋ธ๋ฌ๋ฆฌ ์ถ๊ฐ, ์๋ก์ด View ์์ฑ
[Del] : ์ธ๋ชจ์๋ ์ฝ๋, ์ฃผ์ ์ญ์ 
[Refactor] : ์ ๋ฉด ์์ ์ด ์์ ๋ ์ฌ์ฉํฉ๋๋ค
[Remove] : ํ์ผ ์ญ์ 
[Chore] : ๊ทธ ์ด์ธ์ ์ก์ผ/ ๋ฒ์  ์ฝ๋ ์์ , ํจํค์ง ๊ตฌ์กฐ ๋ณ๊ฒฝ, ํ์ผ ์ด๋, ํ์ผ์ด๋ฆ ๋ณ๊ฒฝ
[Docs] : README๋ WIKI ๋ฑ์ ๋ฌธ์ ๊ฐ์ 
[Comment] : ํ์ํ ์ฃผ์ ์ถ๊ฐ ๋ฐ ๋ณ๊ฒฝ
[Merge] : ๋จธ์ง
```

</br>

## ๐  Commit Message Convention

#### 1๏ธโฃ ๊ธฐ๋ณธ ํ์
prefix๋ Issue์ ์๋ Prefix์ ๋์ผํ๊ฒ ์ฌ์ฉํ๋ค.
```swift
[prefix] #์ด์๋ฒํธ - ์ด์ ๋ด์ฉ
```

#### 2๏ธโฃ ์์ : ์๋์ ๊ฐ์ด ์์ฑํ๋๋ก ํ๋ค.

```swift
// 1๋ฒ ์ด์์์ ์๋ก์ด ๊ธฐ๋ฅ(Feat)์ ๊ตฌํํ ๊ฒฝ์ฐ
[Feat] #1 - ๊ธฐ๋ฅ ๊ตฌํ
// 1๋ฒ ์ด์์์ ๋ ์ด์์(Design)์ ๊ตฌํํ ๊ฒฝ์ฐ
[Design] #1 - ๋ ์ด์์ ๊ตฌํ
```

</br>

## ๐  Code Covention

[StyleShare/swift-style-guide](https://github.com/StyleShare/swift-style-guide) ๋ฅผ ๊ธฐ๋ณธ์ผ๋ก ๋ฐ๋ฅด๊ณ  ํ์์ ๋ฐ๋ผ ์ถ๊ฐํ๋ค.
