Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5870B56E045
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 18:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792003902; cv=none; b=lumgcByDaGysEMXE1P1bix1zZ0gju2PeQjp4/GTvDaEfwi2C+RxJuualRl2MkTXfkH2U6awMu4MYvFfPFwr4vsdnxaKsdaLMPP/TDWKYB4YGXObsLBzEiAtPDCWfDCppQm/1ETvLgInnV5nlJZbLMF9DkldM8rNQS5OnED9KxJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792003902; c=relaxed/simple;
	bh=kxE6YIpWJYSPkdTmxW6LL3Rlg5ObiE0M+WeLdwf1Rj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JUjUWFs+Nc8Tp0Oeoz7MVkZrsYXnbMGG2nPaBWk5CBq7J+VO3cG9ik6B8jMY6L6FX99hWi/lFmUEZ+vsqEj2Wm/Zz9u3T2Qm5biZi7vGTUVBdFC8UuTuFbQ4jXIDteixPmrcSle//xymaWAUebzobvMCCMmXUzkBfFirMZF4Byg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMqEAr8m; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMqEAr8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792003901; x=1823539901;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kxE6YIpWJYSPkdTmxW6LL3Rlg5ObiE0M+WeLdwf1Rj4=;
  b=nMqEAr8mLhYWC5ncia4mjMRBovZxt5AwuOLaLS4aKrBKKqXLQZcbYhgE
   PKXRdRL6EtcrjXc5abTjH9L39vgQIs+c9pdRZdFr3XIML60MFNUWy+cYG
   /lDI6kEF9+DibdF15FUmXf/uvJIWpesFu3iBKFpreyvUxxfbtLXGATZXd
   Nsangeci6nTewVMdqf1D9OotUXkNyLRwYl9eV8yzRArLjLKW4oR4mMZSa
   V0SZZWdYIJA45BAvnfWZaR1o4HRmPE2VgqQUIG+18qG+0t7cGIxFoe22U
   vBGQpXQXrMKDQNnww1myLpBb/Ws10Ocbku+LZ0F13lUEGs2+l14kmhBvu
   w==;
X-CSE-ConnectionGUID: bxfK4geIQ9mnIh45EQj0Gg==
X-CSE-MsgGUID: EooGWFTkSXKm4cymIe2dUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11935"; a="667117"
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="667117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 11:51:35 -0700
X-CSE-ConnectionGUID: MDAr3TjBQ6OkLrGRGxFPng==
X-CSE-MsgGUID: VSTaVJACRR2LkUP5DxsKMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,158,1787036400"; 
   d="scan'208";a="1470403"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Oct 2026 11:51:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xH44Z-00000000F4l-1GJ0;
	Wed, 14 Oct 2026 18:51:31 +0000
Date: Thu, 15 Oct 2026 02:50:56 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.3-rsslro2 15/15]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5368:1: warning: unused label
 'err_unreg_netdev'
Message-ID: <202610150247.Uo9xRX54-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/frank-w/BPI-R2-4.14 7.3-rsslro2
head:   0327d4826547afd9459f4696200a87542fa2fc41
commit: c11d093201f64bf1ea6af214a362f7d828b6bf2b [15/15] net: ethernet: mtk=
_eth_soc: fix panic issue with napi_enable in mtk_open
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/202=
61015/202610150247.Uo9xRX54-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd7080=
29e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261015/202610150247.Uo9xRX54-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610150247.Uo9xRX54-lkp@i=
ntel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5368:1: warning: unused labe=
l 'err_unreg_netdev' [-Wunused-label]
    5368 | err_unreg_netdev:
         | ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/err_unreg_netdev +5368 drivers/net/ethernet/mediatek/mtk_eth_soc.c

04c7aaccdcf60a Daniel Golle       2025-07-02  5105 =20
656e705243fd0c John Crispin       2016-03-08  5106  static int mtk_probe(st=
ruct platform_device *pdev)
656e705243fd0c John Crispin       2016-03-08  5107  {
04c7aaccdcf60a Daniel Golle       2025-07-02  5108  	struct resource *res =
=3D NULL;
656e705243fd0c John Crispin       2016-03-08  5109  	struct device_node *ma=
c_np;
656e705243fd0c John Crispin       2016-03-08  5110  	struct mtk_eth *eth;
b8fc9f30821ec0 Ren=C3=A9 van Dorst     2019-08-25  5111  	int err, i;
656e705243fd0c John Crispin       2016-03-08  5112 =20
656e705243fd0c John Crispin       2016-03-08  5113  	eth =3D devm_kzalloc(&=
pdev->dev, sizeof(*eth), GFP_KERNEL);
656e705243fd0c John Crispin       2016-03-08  5114  	if (!eth)
656e705243fd0c John Crispin       2016-03-08  5115  		return -ENOMEM;
656e705243fd0c John Crispin       2016-03-08  5116 =20
eda7d46da443e1 Ryder Lee          2018-04-16  5117  	eth->soc =3D of_device=
_get_match_data(&pdev->dev);
2ec50f574e8198 Sean Wang          2017-07-31  5118 =20
549e5495467ac2 Sean Wang          2016-09-01  5119  	eth->dev =3D &pdev->de=
v;
d776a57e4a284b Felix Fietkau      2022-04-05  5120  	eth->dma_dev =3D &pdev=
->dev;
566495de16580a YueHaibing         2019-08-01  5121  	eth->base =3D devm_pla=
tform_ioremap_resource(pdev, 0);
621e49f6d80a73 Vladimir Zapolskiy 2016-03-23  5122  	if (IS_ERR(eth->base))
621e49f6d80a73 Vladimir Zapolskiy 2016-03-23  5123  		return PTR_ERR(eth->b=
ase);
656e705243fd0c John Crispin       2016-03-08  5124 =20
160d3a9b192985 Lorenzo Bianconi   2022-05-20  5125  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_SOC_MT7628))
296c9120752bab Stefan Roese       2019-08-16  5126  		eth->ip_align =3D NET=
_IP_ALIGN;
296c9120752bab Stefan Roese       2019-08-16  5127 =20
2d75891ebc09ba Daniel Golle       2023-08-22  5128  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_36BIT_DMA)) {
cae1f1c36661f2 Daniel Golle       2024-01-24  5129  		err =3D dma_set_mask(=
&pdev->dev, DMA_BIT_MASK(36));
cae1f1c36661f2 Daniel Golle       2024-01-24  5130  		if (!err)
cae1f1c36661f2 Daniel Golle       2024-01-24  5131  			err =3D dma_set_cohe=
rent_mask(&pdev->dev, DMA_BIT_MASK(32));
cae1f1c36661f2 Daniel Golle       2024-01-24  5132 =20
2d75891ebc09ba Daniel Golle       2023-08-22  5133  		if (err) {
2d75891ebc09ba Daniel Golle       2023-08-22  5134  			dev_err(&pdev->dev, =
"Wrong DMA config\n");
2d75891ebc09ba Daniel Golle       2023-08-22  5135  			return -EINVAL;
2d75891ebc09ba Daniel Golle       2023-08-22  5136  		}
2d75891ebc09ba Daniel Golle       2023-08-22  5137  	}
2d75891ebc09ba Daniel Golle       2023-08-22  5138 =20
656e705243fd0c John Crispin       2016-03-08  5139  	spin_lock_init(&eth->p=
age_lock);
5cce0322cf8cd2 John Crispin       2017-06-19  5140  	spin_lock_init(&eth->t=
x_irq_lock);
5cce0322cf8cd2 John Crispin       2017-06-19  5141  	spin_lock_init(&eth->r=
x_irq_lock);
e9229ffd550b2d Felix Fietkau      2021-04-22  5142  	spin_lock_init(&eth->d=
im_lock);
e9229ffd550b2d Felix Fietkau      2021-04-22  5143 =20
e9229ffd550b2d Felix Fietkau      2021-04-22  5144  	eth->rx_dim.mode =3D D=
IM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d Felix Fietkau      2021-04-22  5145  	INIT_WORK(&eth->rx_dim=
.work, mtk_dim_rx);
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5146  	INIT_DELAYED_WORK(&eth=
->reset.monitor_work, mtk_hw_reset_monitor_work);
e9229ffd550b2d Felix Fietkau      2021-04-22  5147 =20
e9229ffd550b2d Felix Fietkau      2021-04-22  5148  	eth->tx_dim.mode =3D D=
IM_CQ_PERIOD_MODE_START_FROM_EQE;
e9229ffd550b2d Felix Fietkau      2021-04-22  5149  	INIT_WORK(&eth->tx_dim=
.work, mtk_dim_tx);
656e705243fd0c John Crispin       2016-03-08  5150 =20
296c9120752bab Stefan Roese       2019-08-16  5151  	if (!MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SOC_MT7628)) {
656e705243fd0c John Crispin       2016-03-08  5152  		eth->ethsys =3D sysco=
n_regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c John Crispin       2016-03-08  5153  							      "mediatek,=
ethsys");
656e705243fd0c John Crispin       2016-03-08  5154  		if (IS_ERR(eth->ethsy=
s)) {
656e705243fd0c John Crispin       2016-03-08  5155  			dev_err(&pdev->dev, =
"no ethsys regmap found\n");
656e705243fd0c John Crispin       2016-03-08  5156  			return PTR_ERR(eth->=
ethsys);
656e705243fd0c John Crispin       2016-03-08  5157  		}
296c9120752bab Stefan Roese       2019-08-16  5158  	}
656e705243fd0c John Crispin       2016-03-08  5159 =20
7093f9d80c7cb8 Sean Wang          2019-06-01  5160  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_INFRA)) {
7093f9d80c7cb8 Sean Wang          2019-06-01  5161  		eth->infra =3D syscon=
_regmap_lookup_by_phandle(pdev->dev.of_node,
7093f9d80c7cb8 Sean Wang          2019-06-01  5162  							     "mediatek,i=
nfracfg");
7093f9d80c7cb8 Sean Wang          2019-06-01  5163  		if (IS_ERR(eth->infra=
)) {
7093f9d80c7cb8 Sean Wang          2019-06-01  5164  			dev_err(&pdev->dev, =
"no infracfg regmap found\n");
7093f9d80c7cb8 Sean Wang          2019-06-01  5165  			return PTR_ERR(eth->=
infra);
7093f9d80c7cb8 Sean Wang          2019-06-01  5166  		}
7093f9d80c7cb8 Sean Wang          2019-06-01  5167  	}
7093f9d80c7cb8 Sean Wang          2019-06-01  5168 =20
d776a57e4a284b Felix Fietkau      2022-04-05  5169  	if (of_dma_is_coherent=
(pdev->dev.of_node)) {
d776a57e4a284b Felix Fietkau      2022-04-05  5170  		struct regmap *cci;
d776a57e4a284b Felix Fietkau      2022-04-05  5171 =20
d776a57e4a284b Felix Fietkau      2022-04-05  5172  		cci =3D syscon_regmap=
_lookup_by_phandle(pdev->dev.of_node,
4263f77a5144f7 Lorenzo Bianconi   2022-04-11  5173  						      "cci-contro=
l-port");
d776a57e4a284b Felix Fietkau      2022-04-05  5174  		/* enable CPU/bus coh=
erency */
d776a57e4a284b Felix Fietkau      2022-04-05  5175  		if (!IS_ERR(cci))
d776a57e4a284b Felix Fietkau      2022-04-05  5176  			regmap_write(cci, 0,=
 3);
d776a57e4a284b Felix Fietkau      2022-04-05  5177  	}
d776a57e4a284b Felix Fietkau      2022-04-05  5178 =20
42c03844e93d56 Sean Wang          2017-07-31  5179  	if (MTK_HAS_CAPS(eth->=
soc->caps, MTK_SGMII)) {
2a3ec7ae313310 Daniel Golle       2023-03-19  5180  		err =3D mtk_sgmii_ini=
t(eth);
9ffee4a8276c73 Sean Wang          2019-06-01  5181 =20
9ffee4a8276c73 Sean Wang          2019-06-01  5182  		if (err)
9ffee4a8276c73 Sean Wang          2019-06-01  5183  			return err;
42c03844e93d56 Sean Wang          2017-07-31  5184  	}
42c03844e93d56 Sean Wang          2017-07-31  5185 =20
243dc5fb4697a0 Sean Wang          2017-12-20  5186  	if (eth->soc->required=
_pctl) {
656e705243fd0c John Crispin       2016-03-08  5187  		eth->pctl =3D syscon_=
regmap_lookup_by_phandle(pdev->dev.of_node,
656e705243fd0c John Crispin       2016-03-08  5188  							    "mediatek,pc=
tl");
656e705243fd0c John Crispin       2016-03-08  5189  		if (IS_ERR(eth->pctl)=
) {
656e705243fd0c John Crispin       2016-03-08  5190  			dev_err(&pdev->dev, =
"no pctl regmap found\n");
2a3ec7ae313310 Daniel Golle       2023-03-19  5191  			err =3D PTR_ERR(eth-=
>pctl);
2a3ec7ae313310 Daniel Golle       2023-03-19  5192  			goto err_destroy_sgm=
ii;
656e705243fd0c John Crispin       2016-03-08  5193  		}
243dc5fb4697a0 Sean Wang          2017-12-20  5194  	}
656e705243fd0c John Crispin       2016-03-08  5195 =20
a008e2a84e6b2b Lorenzo Bianconi   2023-07-25  5196  	if (mtk_is_netsys_v2_o=
r_greater(eth)) {
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5197  		res =3D platform_get_=
resource(pdev, IORESOURCE_MEM, 0);
2a3ec7ae313310 Daniel Golle       2023-03-19  5198  		if (!res) {
2a3ec7ae313310 Daniel Golle       2023-03-19  5199  			err =3D -EINVAL;
2a3ec7ae313310 Daniel Golle       2023-03-19  5200  			goto err_destroy_sgm=
ii;
2a3ec7ae313310 Daniel Golle       2023-03-19  5201  		}
04c7aaccdcf60a Daniel Golle       2025-07-02  5202 =20
ebb1e4f9cf38da Daniel Golle       2023-08-22  5203  		if (MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SRAM)) {
04c7aaccdcf60a Daniel Golle       2025-07-02  5204  			eth->sram_pool =3D o=
f_gen_pool_get(pdev->dev.of_node,
04c7aaccdcf60a Daniel Golle       2025-07-02  5205  							 "sram", 0);
04c7aaccdcf60a Daniel Golle       2025-07-02  5206  			if (!eth->sram_pool)=
 {
04c7aaccdcf60a Daniel Golle       2025-07-02  5207  				if (!mtk_is_netsys_=
v3_or_greater(eth)) {
04c7aaccdcf60a Daniel Golle       2025-07-02  5208  					err =3D mtk_setup_=
legacy_sram(eth, res);
04c7aaccdcf60a Daniel Golle       2025-07-02  5209  					if (err)
04c7aaccdcf60a Daniel Golle       2025-07-02  5210  						goto err_destroy_=
sgmii;
04c7aaccdcf60a Daniel Golle       2025-07-02  5211  				} else {
04c7aaccdcf60a Daniel Golle       2025-07-02  5212  					dev_err(&pdev->dev,
04c7aaccdcf60a Daniel Golle       2025-07-02  5213  						"Could not get SR=
AM pool\n");
ebb1e4f9cf38da Daniel Golle       2023-08-22  5214  					err =3D -EINVAL;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5215  					goto err_destroy_s=
gmii;
ebb1e4f9cf38da Daniel Golle       2023-08-22  5216  				}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5217  			}
ebb1e4f9cf38da Daniel Golle       2023-08-22  5218  		}
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5219  	}
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5220 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5221  	if (eth->soc->offload_=
version) {
804775dfc2885e Felix Fietkau      2022-04-05  5222  		for (i =3D 0;; i++) {
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5223  			struct device_node *=
np;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5224  			phys_addr_t wdma_phy;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5225  			u32 wdma_base;
804775dfc2885e Felix Fietkau      2022-04-05  5226 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5227  			if (i >=3D ARRAY_SIZ=
E(eth->soc->reg_map->wdma_base))
804775dfc2885e Felix Fietkau      2022-04-05  5228  				break;
804775dfc2885e Felix Fietkau      2022-04-05  5229 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5230  			np =3D of_parse_phan=
dle(pdev->dev.of_node,
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5231  					      "mediatek,we=
d", i);
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5232  			if (!np)
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5233  				break;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5234 =20
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5235  			wdma_base =3D eth->s=
oc->reg_map->wdma_base[i];
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5236  			wdma_phy =3D res ? r=
es->start + wdma_base : 0;
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5237  			mtk_wed_add_hw(np, e=
th, eth->base + wdma_base,
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5238  				       wdma_phy, i);
de84a090d99a3b Lorenzo Bianconi   2022-09-20  5239  		}
804775dfc2885e Felix Fietkau      2022-04-05  5240  	}
804775dfc2885e Felix Fietkau      2022-04-05  5241 =20
ee85b483fefbbe Frank Wunderlich   2025-06-19  5242  	err =3D mtk_get_irqs(p=
dev, eth);
ee85b483fefbbe Frank Wunderlich   2025-06-19  5243  	if (err)
b3d0d98179d62f Yang Yingliang     2022-10-17  5244  		goto err_wed_exit;
ee85b483fefbbe Frank Wunderlich   2025-06-19  5245 =20
549e5495467ac2 Sean Wang          2016-09-01  5246  	for (i =3D 0; i < ARRA=
Y_SIZE(eth->clks); i++) {
549e5495467ac2 Sean Wang          2016-09-01  5247  		eth->clks[i] =3D devm=
_clk_get(eth->dev,
549e5495467ac2 Sean Wang          2016-09-01  5248  					    mtk_clks_sourc=
e_name[i]);
549e5495467ac2 Sean Wang          2016-09-01  5249  		if (IS_ERR(eth->clks[=
i])) {
b3d0d98179d62f Yang Yingliang     2022-10-17  5250  			if (PTR_ERR(eth->clk=
s[i]) =3D=3D -EPROBE_DEFER) {
b3d0d98179d62f Yang Yingliang     2022-10-17  5251  				err =3D -EPROBE_DEF=
ER;
b3d0d98179d62f Yang Yingliang     2022-10-17  5252  				goto err_wed_exit;
b3d0d98179d62f Yang Yingliang     2022-10-17  5253  			}
2ec50f574e8198 Sean Wang          2017-07-31  5254  			if (eth->soc->requir=
ed_clks & BIT(i)) {
2ec50f574e8198 Sean Wang          2017-07-31  5255  				dev_err(&pdev->dev,=
 "clock %s not found\n",
2ec50f574e8198 Sean Wang          2017-07-31  5256  					mtk_clks_source_na=
me[i]);
b3d0d98179d62f Yang Yingliang     2022-10-17  5257  				err =3D -EINVAL;
b3d0d98179d62f Yang Yingliang     2022-10-17  5258  				goto err_wed_exit;
2ec50f574e8198 Sean Wang          2017-07-31  5259  			}
2ec50f574e8198 Sean Wang          2017-07-31  5260  			eth->clks[i] =3D NUL=
L;
549e5495467ac2 Sean Wang          2016-09-01  5261  		}
549e5495467ac2 Sean Wang          2016-09-01  5262  	}
656e705243fd0c John Crispin       2016-03-08  5263 =20
656e705243fd0c John Crispin       2016-03-08  5264  	eth->msg_enable =3D ne=
tif_msg_init(mtk_msg_level, MTK_DEFAULT_MSG_ENABLE);
7c78b4ad9bbdbe John Crispin       2016-04-08  5265  	INIT_WORK(&eth->pendin=
g_work, mtk_pending_work);
656e705243fd0c John Crispin       2016-03-08  5266 =20
a9724b9c477f63 Lorenzo Bianconi   2023-01-14  5267  	err =3D mtk_hw_init(et=
h, false);
656e705243fd0c John Crispin       2016-03-08  5268  	if (err)
b3d0d98179d62f Yang Yingliang     2022-10-17  5269  		goto err_wed_exit;
656e705243fd0c John Crispin       2016-03-08  5270 =20
2d14ba7228b0c2 Sean Wang          2018-07-28  5271  	eth->hwlro =3D MTK_HAS=
_CAPS(eth->soc->caps, MTK_HWLRO);
983e1a6c95abf8 Nelson Chang       2016-10-06  5272 =20
656e705243fd0c John Crispin       2016-03-08  5273  	for_each_child_of_node=
(pdev->dev.of_node, mac_np) {
656e705243fd0c John Crispin       2016-03-08  5274  		if (!of_device_is_com=
patible(mac_np,
656e705243fd0c John Crispin       2016-03-08  5275  					     "mediatek,eth=
-mac"))
656e705243fd0c John Crispin       2016-03-08  5276  			continue;
656e705243fd0c John Crispin       2016-03-08  5277 =20
656e705243fd0c John Crispin       2016-03-08  5278  		if (!of_device_is_ava=
ilable(mac_np))
656e705243fd0c John Crispin       2016-03-08  5279  			continue;
656e705243fd0c John Crispin       2016-03-08  5280 =20
656e705243fd0c John Crispin       2016-03-08  5281  		err =3D mtk_add_mac(e=
th, mac_np);
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5282  		if (err) {
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5283  			of_node_put(mac_np);
8a8a9e89f801ce Sean Wang          2016-09-14  5284  			goto err_deinit_hw;
656e705243fd0c John Crispin       2016-03-08  5285  		}
cf36dd2f7793e8 Nishka Dasgupta    2019-07-16  5286  	}
656e705243fd0c John Crispin       2016-03-08  5287 =20
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5288  	if (MTK_HAS_CAPS(=
eth->soc->caps, MTK_SHARED_INT)) {
4981901009923c Frank Wunderlich   2025-06-19  5289  		err =3D devm_request_=
irq(eth->dev, eth->irq[MTK_FE_IRQ_SHARED],
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5290  				       mtk_han=
dle_irq, 0,
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5291  				       dev_nam=
e(eth->dev), eth);
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5292  	} else {
4981901009923c Frank Wunderlich   2025-06-19  5293  		err =3D devm_request_=
irq(eth->dev, eth->irq[MTK_FE_IRQ_TX],
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5294  				       mtk_han=
dle_irq_tx, 0,
85574dbf9d12b3 Sean Wang          2016-09-14  5295  				       dev_name(eth=
->dev), eth);
85574dbf9d12b3 Sean Wang          2016-09-14  5296  		if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5297  			goto err_free_dev;
85574dbf9d12b3 Sean Wang          2016-09-14  5298 =20
4981901009923c Frank Wunderlich   2025-06-19  5299  		err =3D devm_request_=
irq(eth->dev, eth->irq[MTK_FE_IRQ_RX],
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5300  				       mtk_han=
dle_irq_rx, 0,
85574dbf9d12b3 Sean Wang          2016-09-14  5301  				       dev_name(eth=
->dev), eth);
889bcbdeee5737 Bj=C3=B8rn Mork         2019-01-30  5302  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5303  	if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5304  		goto err_free_dev;
85574dbf9d12b3 Sean Wang          2016-09-14  5305 =20
296c9120752bab Stefan Roese       2019-08-16  5306  	/* No MT7628/88 suppor=
t yet */
296c9120752bab Stefan Roese       2019-08-16  5307  	if (!MTK_HAS_CAPS(eth-=
>soc->caps, MTK_SOC_MT7628)) {
85574dbf9d12b3 Sean Wang          2016-09-14  5308  		err =3D mtk_mdio_init=
(eth);
85574dbf9d12b3 Sean Wang          2016-09-14  5309  		if (err)
85574dbf9d12b3 Sean Wang          2016-09-14  5310  			goto err_free_dev;
296c9120752bab Stefan Roese       2019-08-16  5311  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5312 =20
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5313  	if (eth->soc->offload_=
version) {
dee4dd10c79aac Elad Yifee         2024-06-07  5314  		u8 ppe_num =3D eth->s=
oc->ppe_num;
329bce5139cfb0 Lorenzo Bianconi   2022-09-20  5315 =20
dee4dd10c79aac Elad Yifee         2024-06-07  5316  		ppe_num =3D min_t(u8,=
 ARRAY_SIZE(eth->ppe), ppe_num);
dee4dd10c79aac Elad Yifee         2024-06-07  5317  		for (i =3D 0; i < ppe=
_num; i++) {
dee4dd10c79aac Elad Yifee         2024-06-07  5318  			u32 ppe_addr =3D eth=
->soc->reg_map->ppe_base;
4ff1a3fca766aa Lorenzo Bianconi   2022-09-20  5319 =20
dee4dd10c79aac Elad Yifee         2024-06-07  5320  			ppe_addr +=3D (i =3D=
=3D 2 ? 0xc00 : i * 0x400);
3fbe4d8c0e53e4 Daniel Golle       2023-03-19  5321  			eth->ppe[i] =3D mtk_=
ppe_init(eth, eth->base + ppe_addr, i);
3fbe4d8c0e53e4 Daniel Golle       2023-03-19  5322 =20
4ff1a3fca766aa Lorenzo Bianconi   2022-09-20  5323  			if (!eth->ppe[i]) {
1ccc723b5829d6 Felix Fietkau      2022-04-05  5324  				err =3D -ENOMEM;
603ea5e7ffa73c Yan Cangang        2022-11-20  5325  				goto err_deinit_ppe;
1ccc723b5829d6 Felix Fietkau      2022-04-05  5326  			}
dee4dd10c79aac Elad Yifee         2024-06-07  5327  			err =3D mtk_eth_offl=
oad_init(eth, i);
502e84e2382d92 Felix Fietkau      2021-03-24  5328 =20
502e84e2382d92 Felix Fietkau      2021-03-24  5329  			if (err)
603ea5e7ffa73c Yan Cangang        2022-11-20  5330  				goto err_deinit_ppe;
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5331  		}
dee4dd10c79aac Elad Yifee         2024-06-07  5332  	}
ba37b7caf1ed23 Felix Fietkau      2021-03-24  5333 =20
c11d093201f64b Bo-Cun Chen        2026-10-08  5334  	/* we run 2 devices on=
 the same DMA ring so we need a dummy device
c11d093201f64b Bo-Cun Chen        2026-10-08  5335  	 * for NAPI to work
c11d093201f64b Bo-Cun Chen        2026-10-08  5336  	 */
c11d093201f64b Bo-Cun Chen        2026-10-08  5337  	eth->dummy_dev =3D all=
oc_netdev_dummy(0);
c11d093201f64b Bo-Cun Chen        2026-10-08  5338  	if (!eth->dummy_dev) {
c11d093201f64b Bo-Cun Chen        2026-10-08  5339  		err =3D -ENOMEM;
c11d093201f64b Bo-Cun Chen        2026-10-08  5340  		dev_err(eth->dev, "fa=
iled to allocated dummy device\n");
c11d093201f64b Bo-Cun Chen        2026-10-08  5341  		goto err_deinit_ppe;
c11d093201f64b Bo-Cun Chen        2026-10-08  5342  	}
c11d093201f64b Bo-Cun Chen        2026-10-08  5343  	eth->dummy_dev->thread=
ed =3D 1;
c11d093201f64b Bo-Cun Chen        2026-10-08  5344  	strcpy(eth->dummy_dev-=
>name, "mtk_eth");
c11d093201f64b Bo-Cun Chen        2026-10-08  5345  	netif_napi_add(eth->du=
mmy_dev, &eth->tx_napi, mtk_napi_tx);
c11d093201f64b Bo-Cun Chen        2026-10-08  5346  	netif_napi_add(eth->du=
mmy_dev, &eth->rx_napi, mtk_napi_rx);
c11d093201f64b Bo-Cun Chen        2026-10-08  5347 =20
85574dbf9d12b3 Sean Wang          2016-09-14  5348  	for (i =3D 0; i < MTK_=
MAX_DEVS; i++) {
85574dbf9d12b3 Sean Wang          2016-09-14  5349  		if (!eth->netdev[i])
85574dbf9d12b3 Sean Wang          2016-09-14  5350  			continue;
85574dbf9d12b3 Sean Wang          2016-09-14  5351 =20
85574dbf9d12b3 Sean Wang          2016-09-14  5352  		err =3D register_netd=
ev(eth->netdev[i]);
85574dbf9d12b3 Sean Wang          2016-09-14  5353  		if (err) {
85574dbf9d12b3 Sean Wang          2016-09-14  5354  			dev_err(eth->dev, "e=
rror bringing up device\n");
603ea5e7ffa73c Yan Cangang        2022-11-20  5355  			goto err_deinit_ppe;
85574dbf9d12b3 Sean Wang          2016-09-14  5356  		} else
85574dbf9d12b3 Sean Wang          2016-09-14  5357  			netif_info(eth, prob=
e, eth->netdev[i],
85574dbf9d12b3 Sean Wang          2016-09-14  5358  				   "mediatek frame =
engine at 0x%08lx, irq %d\n",
4981901009923c Frank Wunderlich   2025-06-19  5359  				   eth->netdev[i]->=
base_addr, eth->irq[MTK_FE_IRQ_SHARED]);
85574dbf9d12b3 Sean Wang          2016-09-14  5360  	}
85574dbf9d12b3 Sean Wang          2016-09-14  5361 =20
656e705243fd0c John Crispin       2016-03-08  5362  	platform_set_drvdata(p=
dev, eth);
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5363  	schedule_delayed_work(=
&eth->reset.monitor_work,
93b2591ad0d0c1 Lorenzo Bianconi   2023-01-14  5364  			      MTK_DMA_MONITO=
R_TIMEOUT);
656e705243fd0c John Crispin       2016-03-08  5365 =20
656e705243fd0c John Crispin       2016-03-08  5366  	return 0;
656e705243fd0c John Crispin       2016-03-08  5367 =20
b209bd6d0bffb8 Breno Leitao       2024-04-22 @5368  err_unreg_netdev:
b209bd6d0bffb8 Breno Leitao       2024-04-22  5369  	mtk_unreg_dev(eth);
c11d093201f64b Bo-Cun Chen        2026-10-08  5370  	free_netdev(eth->dummy=
_dev);
603ea5e7ffa73c Yan Cangang        2022-11-20  5371  err_deinit_ppe:
c11d093201f64b Bo-Cun Chen        2026-10-08  5372  	mtk_napi_del(eth);
603ea5e7ffa73c Yan Cangang        2022-11-20  5373  	mtk_ppe_deinit(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5374  	mtk_mdio_cleanup(eth);
656e705243fd0c John Crispin       2016-03-08  5375  err_free_dev:
8a8a9e89f801ce Sean Wang          2016-09-14  5376  	mtk_free_dev(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5377  err_deinit_hw:
8a8a9e89f801ce Sean Wang          2016-09-14  5378  	mtk_hw_deinit(eth);
b3d0d98179d62f Yang Yingliang     2022-10-17  5379  err_wed_exit:
b3d0d98179d62f Yang Yingliang     2022-10-17  5380  	mtk_wed_exit();
2a3ec7ae313310 Daniel Golle       2023-03-19  5381  err_destroy_sgmii:
2a3ec7ae313310 Daniel Golle       2023-03-19  5382  	mtk_sgmii_destroy(eth);
8a8a9e89f801ce Sean Wang          2016-09-14  5383 =20
656e705243fd0c John Crispin       2016-03-08  5384  	return err;
656e705243fd0c John Crispin       2016-03-08  5385  }
656e705243fd0c John Crispin       2016-03-08  5386 =20

:::::: The code at line 5368 was first introduced by commit
:::::: b209bd6d0bffb8991aba568e2d9a892c86a1a43c net: mediatek: mtk_eth_sock=
: allocate dummy net_device dynamically

:::::: TO: Breno Leitao <leitao@debian.org>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
