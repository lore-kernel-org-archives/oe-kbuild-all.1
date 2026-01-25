Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C382BD58A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 17:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769361932; cv=none; b=i7NX+UVgG6WLx0/d2vwt+Z2AKL4ySdgbcPqNBxWClM3Ra1dRCNU+3PG7uMJl/xnyOfHz2fM8XqkrfYwpD+A0NNxzfcPQpJ4+aGRlEKP6tA9hTETo2vikuCf3C187djHcCLhEFhqkYX+CoTtOW3uH0B09ng3krxL12Aa2cXP9TSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769361932; c=relaxed/simple;
	bh=gT8ovZMQXJ0Jpd7mseTA+uOT+PN7A6EOrDJjMiQl/zE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q+U5eSsKffaZyozPaL4CS8gNg1326jYNfdH9w9vxlA9FhYLm5yxYssswrBMEOfnjTZ2ynonS1k30n0gKpwekmJSzogR55IBL+uHKNgyz/q6V2YBZTGvMssl4sRRyvjbLt5ITNPbhBNQ/96H/GR/PICT1gJh7XkJqAKbaa9SszPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4IfwBwC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4IfwBwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769361931; x=1800897931;
  h=date:from:to:cc:subject:message-id;
  bh=gT8ovZMQXJ0Jpd7mseTA+uOT+PN7A6EOrDJjMiQl/zE=;
  b=l4IfwBwCXQrrWWe4M59JWFM60cyGMN3EuP3eXMDs81lAiIU7z6DCahkO
   GIevhtbfPLxS0E7fJ8dV8GPyXbQHKQBH6DAbV4eqqBNcUMXcNJW+AkQFG
   QQ+FvolyFkBHoRC+wM9rnWHXX1ndTO8RNqYXWSlIRUrC4owg8AtKdWHSX
   lf9xTS8R25iRRnMOD4uDgrxtCaS+8wMJ6pH2BYhg8+dnovS4h1CcCMaqs
   3r59/DMifA7xb4gPLNrKnSdHhwJhUDfezx4RRo+1YHN1GfCsZMHILcFBz
   6iie4nCCwrsMyerwnEDXhlYIaGo3V02nfGTxKqIAimQs05nUjsAgzlQzb
   Q==;
X-CSE-ConnectionGUID: BZbrP3URQHqldh39ZTR8uQ==
X-CSE-MsgGUID: 0BnnuNaLRlicvmxUskLfMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70521500"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70521500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 09:25:31 -0800
X-CSE-ConnectionGUID: UWWi8F0MTcuf3G+TlXh/Zg==
X-CSE-MsgGUID: dfF3i2ZfRleK7ISQbAddQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207521595"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Jan 2026 09:25:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk3ra-00000000WIQ-1vdT;
	Sun, 25 Jan 2026 17:25:26 +0000
Date: Mon, 26 Jan 2026 01:25:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-main 120/120]
 drivers/net/pcs/pcs-airoha.c:2537:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202601260147.hMktLz6U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-main
head:   f447ce9b159ce17f5b24dec013664fa745717235
commit: dd015b832d721b09d105cbaa4b10d7d1eee57d55 [120/120] net: pcs: airoha: add PCS driver for Airoha SoC
config: sparc64-allmodconfig (https://download.01.org/0day-ci/archive/20260126/202601260147.hMktLz6U-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260147.hMktLz6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260147.hMktLz6U-lkp@intel.com/

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
