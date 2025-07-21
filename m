Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD6A288AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 01:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753059701; cv=none; b=GlDFvg5z/u8pKbWAQyV1bE6YR8Q3AR/a0l3DcfX7GMEejEPxzWyOPTlkTc1vSN7NMnsJ4wnFRwugcJXlGB87X4vqaz1Kds9+ZSGETgVSCJFewE5pJ17ePVcESi+7A6FWbhlQdxIm1P/mLX87Xe8S9E0v6vNUfE7t6SclRlL9fmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753059701; c=relaxed/simple;
	bh=FdYn90X5x91d8lkUA1PCmaMAyg9G6CQ330FqZCzEQ3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SIs1lY+nFrHQeOENvd9200+VpPPTB2vRq/xa+BR78zckBEQ1rVI7XLLbXUygYmG5zPf9+wQADEBIV42ynZu0z0IQmPrwGhr7XxDOmNr2u/PCHqyzzb5Vp0+De0nThbzAPJwyZ7E2ESb+aatbq0bWTM2UheGv2dktqu50JCWlN9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wzrsjk/q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wzrsjk/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753059699; x=1784595699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FdYn90X5x91d8lkUA1PCmaMAyg9G6CQ330FqZCzEQ3Y=;
  b=Wzrsjk/qGha20sfysJ1kSVYp0dBSUwU3nf9Ik6eSIGFeSLtHEsxqgZWS
   abmGfx8/HtGVnp3uI9ex59LKSoAqHbi9SLKXKCJ5Lv5e+EjYbodEtZp9e
   HxD6GsRFpgPqWlwmXdVkoFaff4RJ6Erwh8YeNPUSaP8/zqnwWUegDAhuS
   adoORK0W2Ac3TkagzvA+9AO8W8UTCVmiORm2aL5h02eVM1E5AziSqI8Qk
   FlfjnZ37P4qy4fK8/j2qHwiZ8wkIuvqyAUpl/xast1sS+Owkvwu4v3MJC
   sH/fB2gdLNNjGhSe7b6Z1dakVBNcawf3xQClBpLylpeuFqq2CC8HqQGQ6
   w==;
X-CSE-ConnectionGUID: FqBMR2mqQCiwSWMEWIU0hA==
X-CSE-MsgGUID: JqBw+gleQEelNlMEaas5ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="58928810"
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="58928810"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 18:01:36 -0700
X-CSE-ConnectionGUID: u/TKVAd0Qr6efrjX1jaYEA==
X-CSE-MsgGUID: 4jC1HrKqQVK/UhKNOCHasg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,328,1744095600"; 
   d="scan'208";a="162918064"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 20 Jul 2025 18:01:34 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udeuK-0001K5-1u;
	Mon, 21 Jul 2025 01:01:32 +0000
Date: Mon, 21 Jul 2025 03:01:18 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.16-dualmmc 59/79]
 drivers/net/pcs/pcs-airoha.c:2537:2: warning: unannotated fall-through
 between switch labels
Message-ID: <202507210301.B6NM09ms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.16-dualmmc
head:   61605f260a207bbe9994a325ea9b2d33e29d62de
commit: 65cc15faa14410dfb08f3a921b4ac794ec08f597 [59/79] net: pcs: airoha: add PCS driver for Airoha SoC
config: x86_64-buildonly-randconfig-2001-20250721 (https://download.01.org/0day-ci/archive/20250721/202507210301.B6NM09ms-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250721/202507210301.B6NM09ms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507210301.B6NM09ms-lkp@intel.com/

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

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for FWNODE_PCS
   Depends on [n]: NETDEVICES [=y] && (ACPI [=n] || OF [=n]) && PHYLINK [=m]
   Selected by [y]:
   - PCS_AIROHA [=y] && NETDEVICES [=y]


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
