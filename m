Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 959993A7F68
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 21:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793835; cv=none; b=jmQ1UL0uI5/4fCGrXu0tWbhHOIDJ73L4Bga82ZosqU1RbX6o31yJPigsdbP74LCCsgipaowUC3DoSsu+n+aJ4ZPt9+/C5+J+Eb4KrsLE63yYzQwPiV28SQocTvj0015C0TXH39gKoTpiFAkh6J9+d+E1glcNuyDD9e2YBF/OhTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793835; c=relaxed/simple;
	bh=ZqIcP4O7jZteikZp2cSpYJLYEfa3bCZRE9uH3Nslncc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FMa904QQMYd4fwl8ROgK15/b8kYBVYpoXrkDO1iP15X4YUmjIMFzmOlTiA5lGfs0/EbYxHgRw4Lp6zxgOVHH6OI4F7yVmct6RVCGJAv06hgG3eNBAqAvY8G/itErJprUOERRms9WZrgt9gUGN5PVISqwfXPSlVu0z7n6zxsmxlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hglsAg8k; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hglsAg8k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778793833; x=1810329833;
  h=date:from:to:cc:subject:message-id;
  bh=ZqIcP4O7jZteikZp2cSpYJLYEfa3bCZRE9uH3Nslncc=;
  b=hglsAg8koudOcJ5VInn84jPT7VrVA9PTUPJhosV6gFN+h6Nyra+foXCZ
   QfmY20u2kRGz1sMtsIiJk10vTdcxmxXMgl2dDU92obxEzG+RP74xg1vYO
   aDbxRHGoBlwuRb7VZWWD6j0ohRc59owXtEGR3wr3IiP71nuqlZhphXwKC
   GRIcqrFxwPd7/TUzNjd3bjKTTXDDksGwEQJCcK0oljAftXISz0IAvT4dz
   2c+YKNjZQSui8b3oTa+RyA3hS+osYU77OcvVmL94I95v50Q9ORwZ0i+ug
   S3H6sLnSxMHumI7HBCcX54RsCm4rHp9HZIxQ1Au/TGWVx8croKsLrt43A
   w==;
X-CSE-ConnectionGUID: UrqlNSZ6QD6zfz3XhGWrmw==
X-CSE-MsgGUID: 5uzxgot5R6iGF2m+HiRmjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79603399"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79603399"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 14:23:52 -0700
X-CSE-ConnectionGUID: JFG40Uw9S9iZ/n3shHZfyg==
X-CSE-MsgGUID: LHhNk4SQR7mVK0rmEju87w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235458956"
Received: from lkp-server02.sh.intel.com (HELO 7a33ad3e7d27) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 14:23:51 -0700
Received: from kbuild by 7a33ad3e7d27 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNdX2-0000000001e-3zbx;
	Thu, 14 May 2026 21:23:48 +0000
Date: Fri, 15 May 2026 05:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 78/154]
 drivers/net/ethernet/mediatek/mtk_eth_soc.c:5638:6: warning: variable 'flags'
 set but not used
Message-ID: <202605150545.i950eo4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   767536110bfe28c94ae2e150c083d29f827655cf
commit: 188fbd9a282fbed6a7a43430ab5d611dacfee1c5 [78/154] net: pcs: mtk-lynxi: add phya tx rx clock path
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605150545.i950eo4c-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150545.i950eo4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150545.i950eo4c-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/mediatek/mtk_eth_soc.c:5638:6: warning: variable 'flags' set but not used [-Wunused-but-set-variable]
    5638 |         u32 flags = 0;
         |             ^
   1 warning generated.


vim +/flags +5638 drivers/net/ethernet/mediatek/mtk_eth_soc.c

  5633	
  5634	static int mtk_sgmii_init(struct mtk_eth *eth)
  5635	{
  5636		struct device_node *np;
  5637		struct regmap *regmap;
> 5638		u32 flags = 0;
  5639		int i;
  5640	
  5641		for (i = 0; i < MTK_MAX_DEVS; i++) {
  5642			np = of_parse_phandle(eth->dev->of_node, "mediatek,sgmiisys", i);
  5643			if (!np)
  5644				break;
  5645	
  5646			regmap = syscon_node_to_regmap(np);
  5647			if (IS_ERR(regmap)) {
  5648				of_node_put(np);
  5649	
  5650			if (of_property_read_bool(np->parent, "mediatek,phya_trx_ck"))
  5651				flags |= MTK_SGMII_FLAG_PHYA_TRX_CK;
  5652	
  5653			of_node_put(np);
  5654	
  5655			if (IS_ERR(regmap))
  5656				return PTR_ERR(regmap);
  5657			}
  5658	
  5659			eth->sgmii_pcs[i] = mtk_pcs_lynxi_create(eth->dev,
  5660								 of_fwnode_handle(np),
  5661								 regmap,
  5662								 eth->soc->ana_rgc3);
  5663			of_node_put(np);
  5664		}
  5665	
  5666		return 0;
  5667	}
  5668	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
