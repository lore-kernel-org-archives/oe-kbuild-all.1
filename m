Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875412B56F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 18:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692730332; x=1724266332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nteG2Cax6JFS1QHA8uO9uoaZmpIOTJtYRpL/vL/baqY=;
  b=lg/LJNsHefLoJBKQMj6E+d9qeiHTFzFRfYbSJd3wBDPoVOwOr/QkjsDQ
   VhdgctPUQNJWf4tvsDt9sDCuJEvat0BOZojxebt8TrYm5QJlbJp7V7Q7W
   +9KZE2BoTj/M9pnjqnrfarhxym+Y4jk+GBRMdE8u8Y2KgffVWwO7a8kSa
   YxFhlzmajGNfA+ht4exH9lEr7VSY0mLx3DywmKX/MZocC897AuBCdN+XZ
   fnsx3br+43g0KSwAeQNnGu1f92N1PpOWDTWsLhtyR5dv5uVj5MoIjJJ52
   hFi4u4dU+RbziL9c5Xc0JuZBYYJccbPSKBkv/VSSqnooQBtf5v8jGoBEi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373941811"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="373941811"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 11:52:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="860049022"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="860049022"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 22 Aug 2023 11:52:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYWU1-0000Rk-2y;
	Tue, 22 Aug 2023 18:52:06 +0000
Date: Wed, 23 Aug 2023 02:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.14-stable 9831/29943]
 drivers/net/wireless/virt_wifi.c:432:31: warning: variable 'w_priv' set but
 not used
Message-ID: <202308230215.db7dboyn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Cody,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.14-stable
head:   6904826e1ac9739626b937fd85e37cf539fec91b
commit: ccd0de1304be3a8863d97872fbf00b8b3b6c7801 [9831/29943] FROMGIT, BACKPORT: mac80211-next: rtnetlink wifi simulation device
config: i386-randconfig-005-20230822 (https://download.01.org/0day-ci/archive/20230823/202308230215.db7dboyn-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230215.db7dboyn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230215.db7dboyn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/wireless/virt_wifi.c: In function 'virt_wifi_net_device_stop':
>> drivers/net/wireless/virt_wifi.c:432:31: warning: variable 'w_priv' set but not used [-Wunused-but-set-variable]
     struct virt_wifi_wiphy_priv *w_priv;
                                  ^~~~~~


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
