Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C2738D01E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 17:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779574; cv=none; b=TOmrGS5CjDAMwzA5MfTvTGRUUOsyTbGc3ED8sn+HknImCtQiC+mpkijeJfH3X70is9VWnulfd6jzSYs2Hz3JUBUA7Cev7oTheHrm4bo28IGHni31SiHXtQ+uMqEDtHjfdJGVg+VvN1XRxwX5MOJc7Jdo3o2Q0E1Q63bXdlFnKNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779574; c=relaxed/simple;
	bh=GRrdsThfzQ6VffSH40Q1IYhiRHz1Rieb3eOWiroEqHI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MCaZEqj20eJtH3DjOxLUM4AzQSP6DedtB4ff10rVSIaAcPzK7XfarstReIJAaRSvGgHusdzWMJI3EueigsoOeZwV6Qzf6UJo55PXWmgEffbVha8MjWaY5XkeAVWasmaxVcUzU8gKiSnUUUQZcls2oGVHXGO1FvngRKYPLd562uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab9xCMZY; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab9xCMZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778779573; x=1810315573;
  h=date:from:to:cc:subject:message-id;
  bh=GRrdsThfzQ6VffSH40Q1IYhiRHz1Rieb3eOWiroEqHI=;
  b=Ab9xCMZYXSeOSOxT5aZI7LSnxvwINRyC00zOgDIllJpuICYSwsSL290K
   aOpzvaYfSXT2LCYDVW3zUjagIQ29RkSzdDCwdNicPchQaN1zjX7Qnpx/Y
   qaXyD/w5PorqqBtfwSStEhmz99ZQXZh3FNiR0VX9S0luN9Xr7stNdH2jk
   SUixYS9oVR9w2Nbn75/zvb21xliPQdBfAK0IG3omTdxoHwJrmpce2wkMs
   7b93N61kIDVfkoKK8N9xbw95ri5brdcZSgh7yuqbjfR3a+GukfsPNrJwd
   RAw02b8bIW+MFo33eafpETN4KkxamtmsLTbZSR0dn5ZQn2BLvJHYr0Maf
   A==;
X-CSE-ConnectionGUID: egK1KKb9QZyBHA/rDCSWcA==
X-CSE-MsgGUID: rCUx3Ip/Q4CaEudiERq8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="97156666"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="97156666"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 10:26:12 -0700
X-CSE-ConnectionGUID: W7taK1YpQ9SWIQLoyhY9Eg==
X-CSE-MsgGUID: /ztQQzCkSpqJoWOBoP9vcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="262195356"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 May 2026 10:26:11 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNZp3-000000006qZ-0CIv;
	Thu, 14 May 2026 17:26:09 +0000
Date: Fri, 15 May 2026 01:25:57 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.1-rc 24/154]
 drivers/net/pcs/pcs-airoha.c:2581:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202605150118.EvBKjvNb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.1-rc
head:   767536110bfe28c94ae2e150c083d29f827655cf
commit: 94c584377495cc10276b1eab98802d2ba437099b [24/154] net: pcs: airoha: add PCS driver for Airoha SoC
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20260515/202605150118.EvBKjvNb-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150118.EvBKjvNb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605150118.EvBKjvNb-lkp@intel.com/

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
