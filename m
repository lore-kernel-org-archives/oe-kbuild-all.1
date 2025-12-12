Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B637D1C8FBA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 06:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765520794; cv=none; b=U9sXkMdT1AU0Dnm5jvTKqwqc2E/i0T3Kc+c6bbNSExwKjY7mmQVJIdmvsctunJV9n+FNm2mWRwbLrc7C3iTnjBDqTEiRLgMNgsVKguMWxd+PudepPfgfMm8TxPXsUKLLzDIt+Es19o2PySqftcnhh48G3fpwGIyjgG3PrzNLumA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765520794; c=relaxed/simple;
	bh=gUiepZGEKsdddwcY+LY++IRdXtH8tfUCJwgTrwmrAMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g3lcU7eXE+FDvUrieEyWB2RLcPlcTSjsbT8+KTmH1tyrMZDPeB10+5X+WP+oacfxOt+GZ1yPnwlU/B1IMoyK4Lw5SFwnR5C5w5Nfq6HNr8+x1KQtk/yISqUsg4r3ogGxFfFmqPlIA5bxUJx8CPQGKrFCeRTmR9t9Gi6mlJqP6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rygu2aoX; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rygu2aoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765520792; x=1797056792;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gUiepZGEKsdddwcY+LY++IRdXtH8tfUCJwgTrwmrAMY=;
  b=Rygu2aoXyU+z7tqmj3okaaWOCZByboXUQPYiPEiID4r3wD9w7etSAlhn
   rY8HCWtG7z9twIPzin+dBdIfSniDy5BpxctRiKtGildIA3GkaivSY5YV3
   1uSx+rAufIKKU11ucQuMz5m61c/uXuGrRAYO8CwTT5gDPPSV8YqVrm6ot
   Bgp1zUbRhwnOToSNsP8koSbu78arvEQ61IsIlEmHCW1kowSGzgsoBwmmX
   T1ENc7flM1n61nIuRY3n1YhNf1fi/qagU9yoiZlVpy1e8nPbQE9mYoODz
   XvHvTt45gzLZm8mNkZvuU9bCvw8UhF3+9XaoAlr+PHmMJiZbiMhZzwqFm
   A==;
X-CSE-ConnectionGUID: IY/sEL+QQ2uaEZLsC4XVTg==
X-CSE-MsgGUID: e3oi6bLNQIKIEo3w0HM5og==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="70090556"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="70090556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 22:26:32 -0800
X-CSE-ConnectionGUID: BzoyuKY1T7Wwb/jfg9gGgQ==
X-CSE-MsgGUID: DLYiE0AQQoKyIYJ4/i5z4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227647675"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2025 22:26:32 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTwbl-000000005f7-0DPx;
	Fri, 12 Dec 2025 06:26:29 +0000
Date: Fri, 12 Dec 2025 14:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-netnext-rss2 14/37]
 drivers/net/pcs/pcs-airoha.c:2537:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202512121412.Ovv5FMJ7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-netnext-rss2
head:   9f65663bfdad717c57c939e8289964fd6739884b
commit: 5d0bf23164c5561201ee744a581e8eb90e4ab9d8 [14/37] net: pcs: airoha: add PCS driver for Airoha SoC
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20251212/202512121412.Ovv5FMJ7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121412.Ovv5FMJ7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121412.Ovv5FMJ7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/pcs/pcs-airoha.c:2537:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
    2537 |         default:
         |         ^
   drivers/net/pcs/pcs-airoha.c:2537:2: note: insert '__attribute__((fallthrough));' to silence this warning
    2537 |         default:
         |         ^
         |         __attribute__((fallthrough)); 
   drivers/net/pcs/pcs-airoha.c:2537:2: note: insert 'break;' to avoid fall-through
    2537 |         default:
         |         ^
         |         break; 
   1 warning generated.


vim +2537 drivers/net/pcs/pcs-airoha.c

  2516	
  2517	static void airoha_pcs_an_restart(struct phylink_pcs *pcs)
  2518	{
  2519		struct airoha_pcs_priv *priv = phylink_pcs_to_airoha_pcs_port(pcs);
  2520	
  2521		switch (priv->interface) {
  2522		case PHY_INTERFACE_MODE_SGMII:
  2523		case PHY_INTERFACE_MODE_1000BASEX:
  2524		case PHY_INTERFACE_MODE_2500BASEX:
  2525			regmap_set_bits(priv->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
  2526					AIROHA_PCS_HSGMII_AN_SGMII_AN_RESTART);
  2527			udelay(3);
  2528			regmap_clear_bits(priv->hsgmii_an, AIROHA_PCS_HSGMII_AN_SGMII_REG_AN_0,
  2529					  AIROHA_PCS_HSGMII_AN_SGMII_AN_RESTART);
  2530			break;
  2531		case PHY_INTERFACE_MODE_USXGMII:
  2532			regmap_set_bits(priv->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_0,
  2533					AIROHA_PCS_USXGMII_AN_RESTART);
  2534			udelay(3);
  2535			regmap_clear_bits(priv->usxgmii_pcs, AIROHA_PCS_USXGMII_PCS_AN_CONTROL_0,
  2536					  AIROHA_PCS_USXGMII_AN_RESTART);
> 2537		default:
  2538			return;
  2539		}
  2540	}
  2541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
