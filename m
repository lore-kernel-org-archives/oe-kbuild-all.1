Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD517F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 02:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687658968; x=1719194968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Br8ost2/en/FN3+f8THtRkK5yMPz5faJ3OdxYGOsEs=;
  b=GSPRfVxj4z+BDixAucpcWQh60C88+WzZIrXSeDeTDOxt3/2tYvKmckDM
   NM0nzmopHMZxwUsdYwcyMtQs5qh8Pt3GzuBqDpTOPovwMfVmhq0/rfybC
   CFxNycJZEpB+/rWCsqNh74lpIUsZ3cMIqnLMJgSrnRcdLOIB5gLt1pTKV
   7I690Z/TUWdu0qeWhM0DH1maIMmnRqmPG8zaSFPT8vEnE6RYjyAWMB0JW
   XDnOdSU0gvq3f8e17OV7gF+oa0ipc9BD2bpNEnjZIJVZzumjj6M+pkLyk
   SQRg8LFoKadRtt9kKFojN9tL5fon0MV70T7XE4MNfggNqsvQA9D8UQVcU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="363558704"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="363558704"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 19:09:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="860281500"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="860281500"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Jun 2023 19:09:25 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDFBs-0009cv-2r;
	Sun, 25 Jun 2023 02:09:24 +0000
Date: Sun, 25 Jun 2023 10:08:25 +0800
From: kernel test robot <lkp@intel.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-5.10.y 6308/9999]
 drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:33: warning: variable
 'priv' set but not used
Message-ID: <202306251034.ynB12OhK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vladimir,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   ef0d5feb32ab7007d1316e9c5037cd7d9f7febbf
commit: 1f080b8caae9bb59d5db89509f41e17f6d41edd2 [6308/9999] net: enetc: manage ENETC_F_QBV in priv->active_offloads only when enabled
config: arm-randconfig-r046-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251034.ynB12OhK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251034.ynB12OhK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251034.ynB12OhK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/freescale/enetc/enetc_pf.c: In function 'enetc_pl_mac_link_up':
>> drivers/net/ethernet/freescale/enetc/enetc_pf.c:993:33: warning: variable 'priv' set but not used [-Wunused-but-set-variable]
     993 |         struct enetc_ndev_priv *priv;
         |                                 ^~~~


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
