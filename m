Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD422E46
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 20:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686082634; x=1717618634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7OwGOmN0SPoX/fNlwG7no6YxZmfbRTyed3hvkTgKUZU=;
  b=ZMeSSd550hfvlHuIIhzBxQbNR/sB1yb1DBo/2f8S/hz/6LvZFYKfvAn9
   iiUyh9GITjV5iqA06du4Gmu3MugkUzxRn0uMLN2lSNerwhUr56u+D17eV
   dSaPyAYtSL7pKLbDoGiG61ey22YSpza6NOqBxZd8cOPLdbso+b57/Nqa9
   bSiFzRxtDQ3Mym5Y39D6oDeaEJeCYvzRzVcpguZctT2uSI8YVrHqyvygL
   p6YvdjAQ3QbzyW0ea3+sRm4kUdQBbCqhfHuas96cyS+eRO0BnooDvA+rf
   X1aVVaI5DvxJ1XeVn5WToqeyaB8oLWyCWg5toDIXe+LMTsXUdgMuIIBBm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="356801970"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="356801970"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2023 13:17:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="686666407"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; 
   d="scan'208";a="686666407"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Jun 2023 13:17:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6d78-0005gz-2r;
	Tue, 06 Jun 2023 20:17:10 +0000
Date: Wed, 7 Jun 2023 04:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Luigi Semenzato <semenzato@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 949/6555] mm/low-mem-notify.c:87:16:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202306070431.tboKShp1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: b7ec7fb624dfc8d07e722cf2e0e72ff82ebaec7b [949/6555] CHROMIUM: low-mem: Fix return type of low_mem_notify_poll
config: sparc-randconfig-s032-20230606 (https://download.01.org/0day-ci/archive/20230607/202306070431.tboKShp1-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/b7ec7fb624dfc8d07e722cf2e0e72ff82ebaec7b
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout b7ec7fb624dfc8d07e722cf2e0e72ff82ebaec7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306070431.tboKShp1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/low-mem-notify.c:87:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int [assigned] ret @@
   mm/low-mem-notify.c:87:16: sparse:     expected restricted __poll_t
   mm/low-mem-notify.c:87:16: sparse:     got unsigned int [assigned] ret

vim +87 mm/low-mem-notify.c

89587e9d1c30b5 Luigi Semenzato 2014-04-03  74  
b7ec7fb624dfc8 Guenter Roeck   2018-11-01  75  static __poll_t low_mem_notify_poll(struct file *file, poll_table *wait)
89587e9d1c30b5 Luigi Semenzato 2014-04-03  76  {
89587e9d1c30b5 Luigi Semenzato 2014-04-03  77  	unsigned int ret = 0;
89587e9d1c30b5 Luigi Semenzato 2014-04-03  78  
89587e9d1c30b5 Luigi Semenzato 2014-04-03  79  	/* Update state to reflect any recent freeing. */
89587e9d1c30b5 Luigi Semenzato 2014-04-03  80  	atomic_set(&low_mem_state, is_low_mem_situation());
89587e9d1c30b5 Luigi Semenzato 2014-04-03  81  
89587e9d1c30b5 Luigi Semenzato 2014-04-03  82  	poll_wait(file, &low_mem_wait, wait);
89587e9d1c30b5 Luigi Semenzato 2014-04-03  83  
1fa6b9516423e6 Luigi Semenzato 2012-04-18  84  	if (low_mem_margin_enabled && atomic_read(&low_mem_state) != 0)
89587e9d1c30b5 Luigi Semenzato 2014-04-03  85  		ret = POLLIN;
89587e9d1c30b5 Luigi Semenzato 2014-04-03  86  
89587e9d1c30b5 Luigi Semenzato 2014-04-03 @87  	return ret;
89587e9d1c30b5 Luigi Semenzato 2014-04-03  88  }
89587e9d1c30b5 Luigi Semenzato 2014-04-03  89  

:::::: The code at line 87 was first introduced by commit
:::::: 89587e9d1c30b5f908d4bfe5f2ee0b920c156c14 CHROMIUM: Add /dev/low-mem device for low-memory notification.

:::::: TO: Luigi Semenzato <semenzato@chromium.org>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
