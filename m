Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173B32F4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 13:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676900000; x=1708436000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+T7pHcw5O2uP5IdKcjtz6dZMeq4HG5DepPdXUpeVFU=;
  b=cFXKNMswjM+tJ5dqNlIfeHZiisix2t9gMl+7/dtVQ0iWqu0GG5TD7erT
   ryq2i/Lc8K0oyRnwGf9kYOKeaV8lxIw+nSwwclqK9Rer2kvhq1pgmueTW
   GEVFUjXlGEzGueKazLmBwmqxK4oAA6lBvP6hdlFPsfraiJDP0SFcmcru4
   2p6+Ly9ULAI2KF5xxvCjnqq3XPYvC1es5vTfbCeLxHNQ/bF/a91wk88SP
   F5xVjXV1+15kVCGpbL2SIDYOCS5paZKPIljIMJXlA1AkClL2SFmmYJZ1P
   WCeQn1XzSYv0/6HumFUb2Rw+WqqpFUUZ3gTW6WNAeO4/cCdVsWruBpypM
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="331065311"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="331065311"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 05:33:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="795176718"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="795176718"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Feb 2023 05:33:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU6I9-000Dwb-12;
	Mon, 20 Feb 2023 13:33:17 +0000
Date: Mon, 20 Feb 2023 21:33:16 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 15/21] iface.c:(.text+0x2164): multiple
 definition of `ieee80211_link_debugfs_add';
 net/mac80211/driver-ops.o:driver-ops.c:(.text+0x0): first defined here
Message-ID: <202302202137.l7Ohamcb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   b550c611e3d7418f1d2944f4bf0e0597044e377d
commit: 976fdb8844a790ca65be62f06bdef4d8185004b7 [15/21] wifi: mac80211: add netdev per-link debugfs data and driver hook
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230220/202302202137.l7Ohamcb-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=976fdb8844a790ca65be62f06bdef4d8185004b7
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 976fdb8844a790ca65be62f06bdef4d8185004b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302202137.l7Ohamcb-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from net/mac80211/driver-ops.c:11:
>> net/mac80211/debugfs_netdev.h:30:6: warning: no previous prototype for 'ieee80211_link_debugfs_add' [-Wmissing-prototypes]
      30 | void ieee80211_link_debugfs_add(struct ieee80211_link_data *link) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/debugfs_netdev.h:31:6: warning: no previous prototype for 'ieee80211_link_debugfs_remove' [-Wmissing-prototypes]
      31 | void ieee80211_link_debugfs_remove(struct ieee80211_link_data *link) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/debugfs_netdev.h:33:6: warning: no previous prototype for 'ieee80211_link_debugfs_drv_add' [-Wmissing-prototypes]
      33 | void ieee80211_link_debugfs_drv_add(struct ieee80211_link_data *link) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> net/mac80211/debugfs_netdev.h:34:6: warning: no previous prototype for 'ieee80211_link_debugfs_drv_remove' [-Wmissing-prototypes]
      34 | void ieee80211_link_debugfs_drv_remove(struct ieee80211_link_data *link) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_add':
>> iface.c:(.text+0x2164): multiple definition of `ieee80211_link_debugfs_add'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0x0): first defined here
   ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_remove':
>> iface.c:(.text+0x2168): multiple definition of `ieee80211_link_debugfs_remove'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0x4): first defined here
   ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_drv_add':
>> iface.c:(.text+0x216c): multiple definition of `ieee80211_link_debugfs_drv_add'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0x8): first defined here
   ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_drv_remove':
>> iface.c:(.text+0x2170): multiple definition of `ieee80211_link_debugfs_drv_remove'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0xc): first defined here
   ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_add':
   link.c:(.text+0x450): multiple definition of `ieee80211_link_debugfs_add'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0x0): first defined here
   ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_remove':
   link.c:(.text+0x454): multiple definition of `ieee80211_link_debugfs_remove'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0x4): first defined here
   ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_drv_add':
   link.c:(.text+0x458): multiple definition of `ieee80211_link_debugfs_drv_add'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0x8): first defined here
   ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_drv_remove':
   link.c:(.text+0x45c): multiple definition of `ieee80211_link_debugfs_drv_remove'; net/mac80211/driver-ops.o:driver-ops.c:(.text+0xc): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
