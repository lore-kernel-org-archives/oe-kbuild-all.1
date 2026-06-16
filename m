Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05FC37C108
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jun 2026 03:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781580265; cv=none; b=O4YgTxqVPCG2bzTIiahkb7Hhu3HAvUgunM4HC5SVORJXjt68YyW7MRmIzoq1Y3q4+xoArk1web3T7ayYowcczrp/gag0MN694xS/BdhJxkK3yqN2yJv4Qx7t3uD1H+mVtxxod/NMIDVc/aqblXlwvBvARU5AgP2HW+wh7b7DAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781580265; c=relaxed/simple;
	bh=0+nW9jWAV1/X6OkT3T32QoFCWIwY2DgEin7BI5Q9U7I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KwGN6L9D6IlBsRLywLAx+vPxCagZMMwkkIj6tc4QGNH84USUCJ4tibjSHKsIN59ye6vX+AQC5dRYaklcOr1AzaYkCGAoIn7Zgb/jkAy5XzzLjXV7uqOL8KVEBdZ1hp4ffloCLRfyP2gPHJZjPhIDjlsZKQM+T6lLASb0IRfEc1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hMjpa4gg; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hMjpa4gg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781580264; x=1813116264;
  h=date:from:to:cc:subject:message-id;
  bh=0+nW9jWAV1/X6OkT3T32QoFCWIwY2DgEin7BI5Q9U7I=;
  b=hMjpa4ggu6dJh0mxG6+pLeAyh6d8Oa2JZnMOGYD6a6XOJWoONoTPc57q
   pZI7/CHCSoQrelSl5CW0yx9Fl36fXFECHX2N75oxH4zzEcFo1oj0Lfn/c
   yQ1T5EmRXWDhgb7/sNWMl/ifB29xEv5nuxqaP2DJtPcxShg1sbUA/yT+c
   pVUPvmZcPqocP6YmSYLuzAZ6LxDABGtxh9bBLdiMc5DzqQZy7EgwYWrzL
   jwW7pT8i8rcJn5AtzIMphsIl0j/Dic1xbAegIdXKYFDobWKLRhSNFg5pD
   vW/rpDX5xdO3ThRtI2aLXp5W+cfwrxo13PDWfgeR8zOCcunUf720NH4Gg
   A==;
X-CSE-ConnectionGUID: 52qWXrAQQgaAzzIXF199/A==
X-CSE-MsgGUID: uJtNBSkVQmSII5ZJlQdGcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="82440908"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="82440908"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 20:24:23 -0700
X-CSE-ConnectionGUID: u7iO6rPaQbe/o2CnanHPAg==
X-CSE-MsgGUID: lj4x9E7VQ/KC99PiqRghpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="252627380"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Jun 2026 20:24:22 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZKPT-00000000SfG-1Eq7;
	Tue, 16 Jun 2026 03:24:19 +0000
Date: Tue, 16 Jun 2026 11:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.0-main 162/162]
 drivers/net/pcs/pcs-airoha.c:2581:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202606161144.rqDZUaCV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.0-main
head:   5c1d29f589046df832c7a303b9df3afd038366df
commit: 97261a8993cafc1783731841029801c5a41f16af [162/162] net: pcs: airoha: add PCS driver for Airoha SoC
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260616/202606161144.rqDZUaCV-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e19d1f51a2c80b63cd8ca95bcc757b7077112808)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260616/202606161144.rqDZUaCV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606161144.rqDZUaCV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-airoha.c:2581:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2581 |         default:
         |         ^
   drivers/net/pcs/pcs-airoha.c:2581:2: note: insert '__attribute__((fallthrough));' to silence this warning
    2581 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/net/pcs/pcs-airoha.c:2581:2: note: insert 'break;' to avoid fall-through
    2581 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +2581 drivers/net/pcs/pcs-airoha.c

  2560	
  2561	static void airoha_pcs_an_restart(struct phylink_pcs *pcs)
  2562	{
  2563		struct airoha_pcs_priv *priv = phylink_pcs_to_airoha_pcs_port(pcs);
  2564	
  2565		switch (priv->interface) {
  2566		case PHY_INTERFACE_MODE_SGMII:
  2567		case PHY_INTERFACE_MODE_1000BASEX:
  2568		case PHY_INTERFACE_MODE_2500BASEX:
  2569			regmap_set_bits(priv->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
  2570					AIROHA_PCS_HSGMII_AN_SGMII_AN_RESTART);
  2571			udelay(3);
  2572			regmap_clear_bits(priv->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
  2573					  AIROHA_PCS_HSGMII_AN_SGMII_AN_RESTART);
  2574			break;
  2575		case PHY_INTERFACE_MODE_USXGMII:
  2576			regmap_set_bits(priv->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_0,
  2577					AIROHA_PCS_USXGMII_AN_RESTART);
  2578			udelay(3);
  2579			regmap_clear_bits(priv->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_0,
  2580					  AIROHA_PCS_USXGMII_AN_RESTART);
> 2581		default:
  2582			return;
  2583		}
  2584	}
  2585	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
