# AST-IQAD and SRQE
This is the source code for the IEEE TCSVT paper "Quality Evaluation of Arbitrary Style Transfer: Subjective Study and Objective Metric".

##  📋 Table of content
1. 📎  [Paper Link](#-paper-link)
2. 💡 [Abstract](#-abstract)
3. 📃 [Requirement](#-requirement)
4. 📁 [AST-IQAD](#-AST-IQAD)
5. 🍎 [SRQE](#-SRQE)
6. ✨ [Statement](#-statement)
7. 💎 [Acknowledgement](#-acknowledgement)
8. 🔍 [Citation](#-citation)
## 📎 Paper Link
- **Article title**: [Quality Evaluation of Arbitrary Style Transfer: Subjective Study and Objective Metric](https://ieeexplore.ieee.org/document/9994780/)
- **Authors**: Hangwei chen, Feng Shao, Xiongli chai, Yuese Gu, Qiuping Jinag, Xiangchao Meng, Yo-Sung Ho
- **Institution**: The School of Information Science and Engineering, Ningbo University
## 💡 Abstract
Arbitrary neural style transfer is a vital topic with great research value and wide industrial application, which strives to render the structure of one image using the style of another. Recent researches have devoted great efforts on the task of arbitrary style transfer (AST) for improving the stylization quality. However, there are very few explorations about the quality evaluation of AST images, even it can potentially guide the design of different algorithms. In this paper, we first
construct a new AST images quality assessment database (AST-IQAD), which consists 150 content-style image pairs and the corresponding 1200 stylized images produced by eight typical AST algorithms. Then, a subjective study is conducted on our AST-IQAD database, which obtains the subjective rating scores of all stylized images on the three subjective evaluations, i.e., content preservation (CP), style resemblance (SR), and overall vision (OV). To quantitatively measure the quality of AST image,
we propose a new sparse representation-based method, which computes the quality according to the sparse feature similarity. Experimental results on our AST-IQAD have demonstrated the superiority of the proposed method.
## 📃 Requirement
- **Matlab** >=2020
## 📁 AST-IQAD
You can download the AST-IQAD database at [Baidu Cloud](https://pan.baidu.com/s/1imaLNEeh9YmZkCNtSgzrXw). (password: j71y) 

## 🍎 SRQE
1. Please run 'demo.m'.
2. You can obtain three quality scores (i.e., CP, SR, OV). Higher scores mean better quality.

## 💎 Acknowledgement
Our code is borrowed parts from [DISTS](https://github.com/dingkeyan93/DISTS) and [PCRL](https://web.xidian.edu.cn/ldli/paper.html). Thanks to them!

## ✨ Statement
This project is for research purpose only, please contact us for the licence of commercial use. For any other questions please contact 1010075746@qq.com or shaofeng@nbu.edu.cn

## 🔍 Citation
If our datasets and criteria are helpful, please consider citing the following papers.
H. Chen et al., "Quality Evaluation of Arbitrary Style Transfer: Subjective Study and Objective Metric," IEEE Transactions on Circuits and Systems for Video Technology, doi: 10.1109/TCSVT.2022.3231041.
