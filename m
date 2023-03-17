Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753D5810
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679042713; x=1710578713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uJ4c588MBnSKqMgiYZ9kUrx3Dubgtt0TVL2kTNXsQZM=;
  b=axY8ACw8WOUtEt/2GUpAb40LcxLtXZQTNo5Femj+Qs1M3a7WD+arDY+5
   Wk9f77QsOigO7MSunsoHyDqg8BFolQxTi8ne9faakkhUaIoj0bOZ45cQp
   0D+pEopmYzmi2r9StxKj97fCeR2GZrHDoHHY6sg+qvlR1YKcU1xAqG365
   S5pjrIxyixaN78BqW7xZ5I90E9hDvd1dFuA68LTTJ5PJLSzBZi/HGQqP7
   5DzE7XEzDRDSu3G624iI1yCOGYLxOPeEeBNTkwgRsEpy1Frq4FPCFKeOI
   6CvvTys7cDW4HLWwEqXDwoV9nA83wmpj13KMIsI8EvgrAxuegG91IN7Aq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="338231286"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="338231286"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 01:45:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10651"; a="712671410"
X-IronPort-AV: E=Sophos;i="5.98,268,1673942400"; 
   d="scan'208";a="712671410"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Mar 2023 01:45:02 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pd5ht-0009EY-30;
	Fri, 17 Mar 2023 08:45:01 +0000
Date: Fri, 17 Mar 2023 16:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-mainline-tracking
 185/202] socket.c:undefined reference to `compat_wext_handle_ioctl'
Message-ID: <202303171624.0HAq73Ia-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-mainline-tracking
head:   d193dfccc484b61f3985b7d648bf09c652e236d0
commit: 3d8d0b099b6a3b78264e62874b73482918a148bf [185/202] NOUPSTREAM: ANDROID: init: GKI: add GKI_HACKS_TO_FIX
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230317/202303171624.0HAq73Ia-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/ammarfaizi2/linux-block/commit/3d8d0b099b6a3b78264e62874b73482918a148bf
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-mainline-tracking
        git checkout 3d8d0b099b6a3b78264e62874b73482918a148bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303171624.0HAq73Ia-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: net/socket.o: in function `sock_ioctl':
   socket.c:(.text+0x7448): undefined reference to `wext_handle_ioctl'
   s390-linux-ld: net/socket.o: in function `compat_sock_ioctl':
>> socket.c:(.text+0x7d06): undefined reference to `compat_wext_handle_ioctl'
   s390-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
>> net-procfs.c:(.text+0x194): undefined reference to `wext_proc_exit'
   s390-linux-ld: net/core/net-procfs.o: in function `dev_proc_net_init':
>> net-procfs.c:(.text+0x306): undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
