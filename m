Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103BE7ED
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676913628; x=1708449628;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2kBjt+T7eti+B/ynOEkcXSF5gBTYYujf1vaoUCLoRbI=;
  b=I9MQKu2fTjtoljnBokE75//zooJ2KRrLmiyKr6y2kVTDGNNTbNc8NPWd
   rWfasKMcR/i40LLzRHuqn5tVXFUzBuBCzJ2hXyDYWwuhOP2ZrufRXIETX
   klwvQY8h3Chb3q1Jo+wxkA9pjVebexqkiLQve9sML3RKffB+Vs1fhHTJL
   Y4tLpfNQPFi1yv37xFKF5E8lH/owaValgNP9DUTBfDlsjX10nMcysr/+N
   erVKvYQYFT8iGYCuU8Jg9WdzXPkU7DSvH4eWppG0AItfXEMdEfB14DqmA
   s6ifZ2ryg5/aSPb/YOXpKfS71/W3kOmCu0TZsv5ghb2V7hEP69gJH108g
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397133816"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="397133816"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 09:20:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="621219726"
X-IronPort-AV: E=Sophos;i="5.97,313,1669104000"; 
   d="scan'208";a="621219726"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Feb 2023 09:20:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU9pw-000E4n-0H;
	Mon, 20 Feb 2023 17:20:24 +0000
Date: Tue, 21 Feb 2023 01:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Benjamin Berg <benjamin.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: [iwlwifi-next:pending 15/21] (.text+0x1df0): multiple definition of
 `ieee80211_link_debugfs_add'; net/mac80211/driver-ops.o:(.text+0x4a4): first
 defined here
Message-ID: <202302210137.oukYfwog-lkp@intel.com>
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
config: csky-randconfig-s042-20230219 (https://download.01.org/0day-ci/archive/20230221/202302210137.oukYfwog-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git/commit/?id=976fdb8844a790ca65be62f06bdef4d8185004b7
        git remote add iwlwifi-next https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
        git fetch --no-tags iwlwifi-next pending
        git checkout 976fdb8844a790ca65be62f06bdef4d8185004b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302210137.oukYfwog-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_add':
>> (.text+0x1df0): multiple definition of `ieee80211_link_debugfs_add'; net/mac80211/driver-ops.o:(.text+0x4a4): first defined here
   csky-linux-ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_drv_remove':
>> (.text+0x1e08): multiple definition of `ieee80211_link_debugfs_drv_remove'; net/mac80211/driver-ops.o:(.text+0x4bc): first defined here
   csky-linux-ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_remove':
>> (.text+0x1df8): multiple definition of `ieee80211_link_debugfs_remove'; net/mac80211/driver-ops.o:(.text+0x4ac): first defined here
   csky-linux-ld: net/mac80211/iface.o: in function `ieee80211_link_debugfs_drv_add':
>> (.text+0x1e00): multiple definition of `ieee80211_link_debugfs_drv_add'; net/mac80211/driver-ops.o:(.text+0x4b4): first defined here
   csky-linux-ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_add':
   (.text+0x5d4): multiple definition of `ieee80211_link_debugfs_add'; net/mac80211/driver-ops.o:(.text+0x4a4): first defined here
   csky-linux-ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_drv_remove':
   (.text+0x670): multiple definition of `ieee80211_link_debugfs_drv_remove'; net/mac80211/driver-ops.o:(.text+0x4bc): first defined here
   csky-linux-ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_remove':
   (.text+0x660): multiple definition of `ieee80211_link_debugfs_remove'; net/mac80211/driver-ops.o:(.text+0x4ac): first defined here
   csky-linux-ld: net/mac80211/link.o: in function `ieee80211_link_debugfs_drv_add':
   (.text+0x668): multiple definition of `ieee80211_link_debugfs_drv_add'; net/mac80211/driver-ops.o:(.text+0x4b4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
