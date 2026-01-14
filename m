Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A02396D21
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 12:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393124; cv=none; b=ry/KY1rfNdr4tkThZdjs5Sz6xxlXSoqzwxr6HEOtsXKvRdiRRiPTO8gs8FKNARyUmFm9G5kriHIqNtRQYmxlg4OrhyIxaDFFaqwSm/sfdpY3ZfjKP8F7/kZ1ikcDwzYSrHUcNsC2WX+SFmbzpynaWWzE8hMeSE38QpUkjSQKPN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393124; c=relaxed/simple;
	bh=IpoFFz+RODBcc5D+WiI2PoU14Zmyzf8+wpQ2NPUohMM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LDTOWPtVW5+knuOdjn52ReeErIkzWjBtguWFjJI95DnJZOtFEut7QenCUSUhqcM7vwEVsC9N8l4JmoK645y2PM+w983niiLZvGjO7oHKiXLjBpqajTxlSmQ6+MPM/FZx9qxOaojkf24Gy30w5I71nTM6VO6PEubljnczTZgcfYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KO6ttfHZ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KO6ttfHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768393123; x=1799929123;
  h=date:from:to:cc:subject:message-id;
  bh=IpoFFz+RODBcc5D+WiI2PoU14Zmyzf8+wpQ2NPUohMM=;
  b=KO6ttfHZoZ+v5ken58v9vrxwpx3qF0MaAye6YvObeP9VyxgHuqMO5Dku
   /QvqpbBAh2p4qck8/ZKjQP8hbMbHRNxaWshe0+nTI/uYMCdLyH325Ww9l
   g//CYrH1Wuw5lCCvbE1FA/zde/bZpMERJ2VXNSuB5NFtB/ipzUiYuyV46
   AjzPJghz0FmMfm3hetGPTYGE2UlXVSb2s72g5oReQk36Dv0beI/be0xxI
   bd0iaTr5efuqcgbVhy3QYsTXgb5PZn3Cse1RjjbmvonX2e/H0D2CJJnap
   17M9xatQGBSDkDpEc1wYk5mRQWHYAuIg/az72D2MAagXUZMUdkuXx+TFs
   A==;
X-CSE-ConnectionGUID: fk1QKAt1T3uF/HEMDLdMYw==
X-CSE-MsgGUID: YGX1DkjjQ7ylrBlaaGGy5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="68698240"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="68698240"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 04:18:43 -0800
X-CSE-ConnectionGUID: 2mQrAfLbRtKMegGFm9OwRQ==
X-CSE-MsgGUID: PFge5ecZRGKh2nVq3EUOFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="203887944"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jan 2026 04:18:41 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfzpe-00000000GLu-2t7T;
	Wed, 14 Jan 2026 12:18:38 +0000
Date: Wed, 14 Jan 2026 20:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/2]
 drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:26: warning: variable
 'priv' set but not used
Message-ID: <202601142052.w6vOEaS8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vladimir,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   f214164d7105575371cf0b6aefb66dce8be0d63b
commit: 1f080b8caae9bb59d5db89509f41e17f6d41edd2 [0/2] net: enetc: manage ENETC_F_QBV in priv->active_offloads only when enabled
config: x86_64-buildonly-randconfig-006-20260114 (https://download.01.org/0day-ci/archive/20260114/202601142052.w6vOEaS8-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601142052.w6vOEaS8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601142052.w6vOEaS8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:26: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     993 |         struct enetc_ndev_priv *priv;
         |                                 ^
   2 warnings generated.


vim +/priv +993 drivers/net/ethernet/freescale/enetc/enetc_pf.c

63876df5615edf Vladimir Oltean 2021-03-01   986  
71b77a7a27a338 Claudiu Manoil  2020-10-07   987  static void enetc_pl_mac_link_up(struct phylink_config *config,
71b77a7a27a338 Claudiu Manoil  2020-10-07   988  				 struct phy_device *phy, unsigned int mode,
71b77a7a27a338 Claudiu Manoil  2020-10-07   989  				 phy_interface_t interface, int speed,
71b77a7a27a338 Claudiu Manoil  2020-10-07   990  				 int duplex, bool tx_pause, bool rx_pause)
975d183ef0ca07 Michael Walle   2020-07-20   991  {
71b77a7a27a338 Claudiu Manoil  2020-10-07   992  	struct enetc_pf *pf = phylink_to_enetc_pf(config);
71b77a7a27a338 Claudiu Manoil  2020-10-07  @993  	struct enetc_ndev_priv *priv;
71b77a7a27a338 Claudiu Manoil  2020-10-07   994  
71b77a7a27a338 Claudiu Manoil  2020-10-07   995  	priv = netdev_priv(pf->si->ndev);
1f080b8caae9bb Vladimir Oltean 2022-05-10   996  
1f080b8caae9bb Vladimir Oltean 2022-05-10   997  	if (pf->si->hw_features & ENETC_SI_F_QBV)
71b77a7a27a338 Claudiu Manoil  2020-10-07   998  		enetc_sched_speed_set(priv, speed);
975d183ef0ca07 Michael Walle   2020-07-20   999  
63876df5615edf Vladimir Oltean 2021-03-01  1000  	if (!phylink_autoneg_inband(mode) &&
63876df5615edf Vladimir Oltean 2021-03-01  1001  	    phy_interface_mode_is_rgmii(interface))
63876df5615edf Vladimir Oltean 2021-03-01  1002  		enetc_force_rgmii_mac(&pf->si->hw, speed, duplex);
63876df5615edf Vladimir Oltean 2021-03-01  1003  
71b77a7a27a338 Claudiu Manoil  2020-10-07  1004  	enetc_mac_enable(&pf->si->hw, true);
975d183ef0ca07 Michael Walle   2020-07-20  1005  }
975d183ef0ca07 Michael Walle   2020-07-20  1006  

:::::: The code at line 993 was first introduced by commit
:::::: 71b77a7a27a3388c97e754a2c4e282df3f568fd7 enetc: Migrate to PHYLINK and PCS_LYNX

:::::: TO: Claudiu Manoil <claudiu.manoil@nxp.com>
:::::: CC: Jakub Kicinski <kuba@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
