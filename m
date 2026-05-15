Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35FF3FF1BD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 16:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778862964; cv=none; b=e1VvpESVcgHC7Scd9ZhoOkBQDPOe/5jylOGU4Y+XiIy+yio7V6ER7njSfQmgDcWma8nagoDF8XcS/o+SR+lDbJ2Mx5O81Aw6VqyV7ipLfbCNKF3ZUvpxQJMGI14+1UB9ktt9Clgr7C14ZBLJRSV02St4qbDCAuSGoLkmc76FFak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778862964; c=relaxed/simple;
	bh=92nxV0LU6PlNUT/77H9hDif09xcWO6+KMl3mloEh54s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GMdo5G2pW+pFxqFk1tL8pTNrvfOqkI+SSFjFje312Aajxn/Jod0wPuZ+89kO34BEh3j7XRGZuSEXUc0nwouirDEfk1qnMKYKmNYpNOnqy93WxhPhHLQeTf2VPlIDGZ4wC+f86vYtoYg8WHNUE2T7EsH61VgOHr7uL6VyOvWrKig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DXg7uJGg; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DXg7uJGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778862963; x=1810398963;
  h=date:from:to:cc:subject:message-id;
  bh=92nxV0LU6PlNUT/77H9hDif09xcWO6+KMl3mloEh54s=;
  b=DXg7uJGgE/vZDbjTZ8fr4u2K9TNiytUedRFpSm+q4Bq7if1VXWFCaFB/
   CjA6oWVlF0QuLlhQCG0c/Tcvbzl5YzY1Qlb1FjNGuDvKq2K6toheqyYHI
   11GSBiQjx5B4rpD4fuvph3waXpe3CS/D5z1B7U0ETi5utvHsnmenSq8rG
   fDUwOlre5bVo/ISfC7ZT9KttFw5CsjcHpvb+BHQ5bBDInh0MW94FCDVqa
   BST7aHCw2uGP3IrEMYq7/sH+LTBRcbYs1xm1Fhs1/CVyeqWMx7Uq6stZU
   W85G2/+orbiDuMasTqdVCnHFB0Lg1eTd9x3QgAflRjMYuZLydj/xXEwXo
   g==;
X-CSE-ConnectionGUID: IycUIPPmRJCNy5m/JgCwWg==
X-CSE-MsgGUID: XO8F70q+QnmqIj8mC5YFUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="67351136"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="67351136"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 09:36:02 -0700
X-CSE-ConnectionGUID: Jrq5m1eNQIqTMUf/fYDClw==
X-CSE-MsgGUID: DfpslXW6TdOgxbhQwaCAHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="240555565"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 May 2026 09:36:01 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNvW2-000000002Hr-41JH;
	Fri, 15 May 2026 16:35:58 +0000
Date: Sat, 16 May 2026 00:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 81/154]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5722 mtk_sgmii_init() warn:
 inconsistent indenting
Message-ID: <202605160011.eVtx3DR1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Frank,

First bad commit (maybe != root cause):

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   767536110bfe28c94ae2e150c083d29f827655cf
commit: 922b961be45c1aee8960f9e8f2a690191353bc5f [81/154] net: ethernet: mtk_eth_soc: rss-changes for mt7987
config: arc-randconfig-r072-20260515 (https://download.01.org/0day-ci/archive/20260516/202605160011.eVtx3DR1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605160011.eVtx3DR1-lkp@intel.com/

New smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:5722 mtk_sgmii_init() warn: inconsistent indenting

Old smatch warnings:
drivers/net/ethernet/mediatek/mtk_eth_soc.c:6024 mtk_probe() error: buffer overflow 'eth->irq_pdma' 4 <= 4

vim +5722 drivers/net/ethernet/mediatek/mtk_eth_soc.c

d776a57e4a284b3 Felix Fietkau   2022-04-05  5705  
2a3ec7ae313310c Daniel Golle    2023-03-19  5706  static int mtk_sgmii_init(struct mtk_eth *eth)
2a3ec7ae313310c Daniel Golle    2023-03-19  5707  {
2a3ec7ae313310c Daniel Golle    2023-03-19  5708  	struct device_node *np;
2a3ec7ae313310c Daniel Golle    2023-03-19  5709  	struct regmap *regmap;
188fbd9a282fbed Bo-Cun Chen     2025-05-06  5710  	u32 flags = 0;
2a3ec7ae313310c Daniel Golle    2023-03-19  5711  	int i;
2a3ec7ae313310c Daniel Golle    2023-03-19  5712  
2a3ec7ae313310c Daniel Golle    2023-03-19  5713  	for (i = 0; i < MTK_MAX_DEVS; i++) {
2a3ec7ae313310c Daniel Golle    2023-03-19  5714  		np = of_parse_phandle(eth->dev->of_node, "mediatek,sgmiisys", i);
2a3ec7ae313310c Daniel Golle    2023-03-19  5715  		if (!np)
2a3ec7ae313310c Daniel Golle    2023-03-19  5716  			break;
2a3ec7ae313310c Daniel Golle    2023-03-19  5717  
2a3ec7ae313310c Daniel Golle    2023-03-19  5718  		regmap = syscon_node_to_regmap(np);
bde1ae2d52ab359 Vladimir Oltean 2026-01-19  5719  		if (IS_ERR(regmap)) {
2a3ec7ae313310c Daniel Golle    2023-03-19  5720  			of_node_put(np);
188fbd9a282fbed Bo-Cun Chen     2025-05-06  5721  
188fbd9a282fbed Bo-Cun Chen     2025-05-06 @5722  		if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
188fbd9a282fbed Bo-Cun Chen     2025-05-06  5723  			flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
188fbd9a282fbed Bo-Cun Chen     2025-05-06  5724  
188fbd9a282fbed Bo-Cun Chen     2025-05-06  5725  		of_node_put(np);
188fbd9a282fbed Bo-Cun Chen     2025-05-06  5726  
188fbd9a282fbed Bo-Cun Chen     2025-05-06  5727  		if (IS_ERR(regmap))
2a3ec7ae313310c Daniel Golle    2023-03-19  5728  			return PTR_ERR(regmap);
bde1ae2d52ab359 Vladimir Oltean 2026-01-19  5729  		}
2a3ec7ae313310c Daniel Golle    2023-03-19  5730  
bde1ae2d52ab359 Vladimir Oltean 2026-01-19  5731  		eth->sgmii_pcs[i] = mtk_pcs_lynxi_create(eth->dev,
bde1ae2d52ab359 Vladimir Oltean 2026-01-19  5732  							 of_fwnode_handle(np),
bde1ae2d52ab359 Vladimir Oltean 2026-01-19  5733  							 regmap,
bde1ae2d52ab359 Vladimir Oltean 2026-01-19  5734  							 eth->soc->ana_rgc3);
bde1ae2d52ab359 Vladimir Oltean 2026-01-19  5735  		of_node_put(np);
2a3ec7ae313310c Daniel Golle    2023-03-19  5736  	}
2a3ec7ae313310c Daniel Golle    2023-03-19  5737  
2a3ec7ae313310c Daniel Golle    2023-03-19  5738  	return 0;
2a3ec7ae313310c Daniel Golle    2023-03-19  5739  }
2a3ec7ae313310c Daniel Golle    2023-03-19  5740  

:::::: The code at line 5722 was first introduced by commit
:::::: 188fbd9a282fbed6a7a43430ab5d611dacfee1c5 net: pcs: mtk-lynxi: add phya tx rx clock path

:::::: TO: Bo-Cun Chen <bc-bocun.chen@mediatek.com>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
