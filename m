Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792619359;
	b=W2PxNfT7fDHJxbfmfLm76Kh0mXxLz67eJqTOuqap/KIHZHac4oaeYUipgwy788lQhxt3
	 bZCRk7wUuQWEfOd3aQqjcPx8ZA6LN8ALk0WDqEMx4u5cEZO+Lue5K2q37bbZFFSdp495/
	 UnASLpaAXpYf5y5shELfV9nzlOKHkYTlLlUjR+wV0epTJTLmmcdu906O6ceF/4/zwR8/k
	 LhAAuD3yZDa+lqsx8xMg+atiN/cwfWcpzZaQg8P9hTd1SbMP0idHn0Wg1myOOVrVmoBRe
	 UBWoZPhTuJtEx0x3nRpCiMUZ1mmiYa1VAlOqdUAUlQC2ieEJ6RXxHkxr8CMtwmZyQGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792619359;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6wI7H0SjszYu0IKFT5EsnSjYhqukLxow+coVX20HKx0=;
	b=TQkeo3X511u9CGSMv11pKZGlhBVxOgIscvOR/ozz0vme9kxCABRuAvUbeao1rk37N/js
	 PW+U9tqPwkgfPmMPnxLamOkL6uBxFFtXDEh6IbaVrXCVDB++/Zu/2vIFlWdXUW2Oeanhz
	 nLULFUSNSu8FPa7ENGy5S0VfkyLeUUNfbtpoIe1sAzcE0w+gqOCznJjhdNdV5x/vfatnW
	 tWDoX/xRxVTtOYJJcRLHi3huxzzhzUetNTlZj8lAe9uP8aLfF/CZMc1R8DmucnurKxq1g
	 3E9Y+2Vt5tLU5KznA7Z4hOQYl24OYyc6N44V6jjC8113kQTRErBXwWP+7OzxlxU9ljA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mF2lBdkL;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA71D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Oct 2026 21:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA71D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mF2lBdkL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792619359; x=1824155359;
  h=date:from:to:cc:subject:message-id;
  bh=jaS6N0cggPO91haO5H9FLdd9mYLllfk5otMQf/LLgy8=;
  b=mF2lBdkL0SsfUXRYu39320y7nflL7IpQ06Mc/3yTEEl3A/utTzxL3/SS
   /goYJJl3pd/eQFXYL+S123NRznFei4R8+q7UqdywrFs+HVmejbjQ/I5sB
   Ij5xQ9POKPal7at1dNrQEYqjwbxZyehr0MkxURIsHQJ22uh9rF6CUlWH5
   t+Qz7KW/OFS46GcAqov/KoAs6M06W+zkwz6PnrIr9EwQH6UThQ02h0E72
   8D9HA9t/1R6i8PxD/dbsYvCiZwSk0ItXAetigVdQyC16c+0Ncp18wght8
   2XWOKADFHb6zui2cgVjKUc7M2qg1mTGtvpnLhAfg7K1FDI80myEgoDZiy
   A==;
X-CSE-ConnectionGUID: hcbf6zpHSOuz06M1sDOlWw==
X-CSE-MsgGUID: oVSYMKJQTXCee4FlT+hKsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1378097"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1378097"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 14:49:18 -0700
X-CSE-ConnectionGUID: Wm/JeYXoSPikHWGpmJklVA==
X-CSE-MsgGUID: QUHwie6BSo2vulOr3l1BCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3202733"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Oct 2026 14:49:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJeBP-00000000Q7i-0KcW;
	Wed, 21 Oct 2026 21:49:15 +0000
Date: Thu, 22 Oct 2026 05:49:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 0/3]
 drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:26: warning: variable
 'priv' set but not used
Message-ID: <202610220534.8tzhlUvv-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Vladimir,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   d071d2b9ad81d1b4a78e728e2eb5664ffcd6635a
commit: 1f080b8caae9bb59d5db89509f41e17f6d41edd2 [0/3] net: enetc: manage ENETC_F_QBV in priv->active_offloads only when enabled
config: i386-buildonly-randconfig-1002-20261022 (https://download.01.org/0day-ci/archive/20261022/202610220534.8tzhlUvv-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 2c419645e808a6667eee9dbb16c828f77e2fd2f0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220534.8tzhlUvv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220534.8tzhlUvv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:26: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     993 |         struct enetc_ndev_priv *priv;
         |                                 ^
   1 warning generated.


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
