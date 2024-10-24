Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25371175D50
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 06:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729751503; cv=none; b=TZ2Vzg4E9iGCrC9lpFvYHZPi365+ptjPZPiwGkHcau1mcSgqjjJq9JgTjhyUGPnGwFEgKOadnmK59HrDGLA4gFo571Hxj48eCgPLFmbEMlSOxQ8V9GPhYce2spkMLDyc7O9WepjaMla+K9wv3MyU3UMtI9pW5CsmOYRqP7mzJTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729751503; c=relaxed/simple;
	bh=s4SjsVXEVkV4GGfxpmyQxGXOauWM6OuGpfJkVJiSriY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cQtycpJjdNq6uajc9vyjpbmlhtPZo4jpqb29qOmByuIvYA/M5sPtjgOs2g5/wUNpN1gAX+I5QBxw38w/VYgW/YbhvqUJ87WVdL+Mk4vooSOdzkqd/noWLVZg57HbaGI1TRSirtK7c5RkW0QsOttRjhTUpMcVZFZFglc4IjypIu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuPODGsf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuPODGsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729751501; x=1761287501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s4SjsVXEVkV4GGfxpmyQxGXOauWM6OuGpfJkVJiSriY=;
  b=IuPODGsfGvdvQIZfr/wPQn5J8l/5dluH0t6S/3tpCBVDUMwbCCuvmy6f
   yhoFLnrjp4Lil8QJYzZN1DZamvHp3AJS0k08lP2M48xXETjr/KAM01x7+
   xPedjzOB06q7c5IkWCAv1JaJqjg+D3tX6SkaEGDOeOYEJIj0HFYTt4LPx
   8tAX2rJ1zFGfIyiVY3Oj2yqPSUI1rDFTv5W0kcwFxziAgCe3OipbRrCxU
   a0PEAywmCLF4uyuLVfJ/R0Dw/sjOcaT+u6NtX/bGCMuhfCrGFRxU/aGsd
   DG9E62G16lNhCaB2mXEGjr9i+skELFQCG6/VMLZPNigYAd8GONSmuieun
   g==;
X-CSE-ConnectionGUID: ocyP6+zKQQKUo5z0SSSniQ==
X-CSE-MsgGUID: pyux/ysDT6eJ2BNJnDBAkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29142238"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29142238"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 23:31:40 -0700
X-CSE-ConnectionGUID: dov0E/dMQIu0W0ZtiEXWHQ==
X-CSE-MsgGUID: 75D9TT96SAOF2kCD4rK1iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; 
   d="scan'208";a="80905571"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 23:31:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3rNh-000W4i-0B;
	Thu, 24 Oct 2024 06:31:37 +0000
Date: Thu, 24 Oct 2024 14:31:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, sanglipeng <sanglipeng1@jd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 16635/30000]
 drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:33: warning: variable
 'priv' set but not used
Message-ID: <202410241413.UxpYlVKk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   5faf5aae71283199f69c2a60ed91ab2847f3ffd8
commit: a2658f35fecf0534412a2b3125492fa90b253430 [16635/30000] net: enetc: manage ENETC_F_QBV in priv->active_offloads only when enabled
config: arm64-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410241413.UxpYlVKk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410241413.UxpYlVKk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410241413.UxpYlVKk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/enetc/enetc_pf.c: In function 'enetc_pl_mac_link_up':
>> drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:33: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     993 |         struct enetc_ndev_priv *priv;
         |                                 ^~~~


vim +/priv +993 drivers/net/ethernet/freescale/enetc/enetc_pf.c

d0a90192f86821 Vladimir Oltean 2021-03-27   986  
71b77a7a27a338 Claudiu Manoil  2020-10-07   987  static void enetc_pl_mac_link_up(struct phylink_config *config,
71b77a7a27a338 Claudiu Manoil  2020-10-07   988  				 struct phy_device *phy, unsigned int mode,
71b77a7a27a338 Claudiu Manoil  2020-10-07   989  				 phy_interface_t interface, int speed,
71b77a7a27a338 Claudiu Manoil  2020-10-07   990  				 int duplex, bool tx_pause, bool rx_pause)
975d183ef0ca07 Michael Walle   2020-07-20   991  {
71b77a7a27a338 Claudiu Manoil  2020-10-07   992  	struct enetc_pf *pf = phylink_to_enetc_pf(config);
71b77a7a27a338 Claudiu Manoil  2020-10-07  @993  	struct enetc_ndev_priv *priv;
71b77a7a27a338 Claudiu Manoil  2020-10-07   994  
71b77a7a27a338 Claudiu Manoil  2020-10-07   995  	priv = netdev_priv(pf->si->ndev);
a2658f35fecf05 Vladimir Oltean 2022-05-10   996  
a2658f35fecf05 Vladimir Oltean 2022-05-10   997  	if (pf->si->hw_features & ENETC_SI_F_QBV)
71b77a7a27a338 Claudiu Manoil  2020-10-07   998  		enetc_sched_speed_set(priv, speed);
975d183ef0ca07 Michael Walle   2020-07-20   999  
d0a90192f86821 Vladimir Oltean 2021-03-27  1000  	if (!phylink_autoneg_inband(mode) &&
d0a90192f86821 Vladimir Oltean 2021-03-27  1001  	    phy_interface_mode_is_rgmii(interface))
d0a90192f86821 Vladimir Oltean 2021-03-27  1002  		enetc_force_rgmii_mac(&pf->si->hw, speed, duplex);
d0a90192f86821 Vladimir Oltean 2021-03-27  1003  
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
