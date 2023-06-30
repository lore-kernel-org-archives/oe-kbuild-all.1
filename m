Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CE9174C8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Jun 2023 17:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688146900; x=1719682900;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sQQ7olb6n/e7XNYpmIqXC4cAZqFVsf4Hh+EBW64znOA=;
  b=HDOYiqvC9qhJTEcqqw6My6lE3vB/KSLzbV04Ax9iOoAt81oAkE/mr3gz
   2S524k3HL8YL0I0LDrrvWtBNNxPQJ5YZnq1WZ4RdGN1/Ox0WrStbCSLJ7
   FfnRWaCoTXUl0edy+cXf/Ufrx1LVtvUqEfrcHWHGFc3gqMcVUPaUc62aY
   I9zDp188pD7RU3rLqOXWXNV3eEvV6xmJlBp2AGdkzKI0QKl2VP5SSbubG
   GcdvY62SpwBm4h1R85nHmEXCbRC67eFLJoCMYjOQopnurtkFy56ewFJww
   f73jbf3ZmWBwHT1FQIcPjxdWfidTy3qbKT3lEeyNCFcZ3lhocnEZf/z8c
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="426138602"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="426138602"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 10:41:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="807856522"
X-IronPort-AV: E=Sophos;i="6.01,171,1684825200"; 
   d="scan'208";a="807856522"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Jun 2023 10:41:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFI7l-000FDj-23;
	Fri, 30 Jun 2023 17:41:37 +0000
Date: Sat, 1 Jul 2023 01:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 9831/29940]
 drivers/net/wireless/virt_wifi.c:432:31: warning: variable 'w_priv' set but
 not used
Message-ID: <202307010151.5N6kwig8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   e8c1340cbb0f24693dd9056f8d5a7808e4597b80
commit: ccd0de1304be3a8863d97872fbf00b8b3b6c7801 [9831/29940] FROMGIT, BACKPORT: mac80211-next: rtnetlink wifi simulation device
config: x86_64-randconfig-x006-20230629 (https://download.01.org/0day-ci/archive/20230701/202307010151.5N6kwig8-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307010151.5N6kwig8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307010151.5N6kwig8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/wireless/virt_wifi.c:432:31: warning: variable 'w_priv' set but not used [-Wunused-but-set-variable]
           struct virt_wifi_wiphy_priv *w_priv;
                                        ^
   1 warning generated.


vim +/w_priv +432 drivers/net/wireless/virt_wifi.c

   427	
   428	/* Called with rtnl lock held. */
   429	static int virt_wifi_net_device_stop(struct net_device *dev)
   430	{
   431		struct virt_wifi_netdev_priv *n_priv = netdev_priv(dev);
 > 432		struct virt_wifi_wiphy_priv *w_priv;
   433	
   434		n_priv->is_up = false;
   435	
   436		if (!dev->ieee80211_ptr)
   437			return 0;
   438		w_priv = wiphy_priv(dev->ieee80211_ptr->wiphy);
   439	
   440		virt_wifi_cancel_scan(dev->ieee80211_ptr->wiphy);
   441		virt_wifi_cancel_connect(dev);
   442		netif_carrier_off(dev);
   443	
   444		return 0;
   445	}
   446	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
