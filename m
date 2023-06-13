Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D24E522B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 13:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686662579; x=1718198579;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MEaSLZ76WrPWiwzgDstczo8ZeFLY5wZqjQiIZVectSA=;
  b=QW8QFtA0AvU4/JLi1FqVHvUOqzsl2QvzIFA5rNKUxBVNgY9lLYE6hhYK
   STVdTGcvc4vDqjEg/TVrsDoQSWL2w+SbBjYR7cKQhqhCT/Wo38pnNew4E
   uWjCc3wVpIdsXFajmKjC7YQOV7HaGbNJl2qgklC7T778JVk+zQltil6nr
   Hpr2xN72wdExGs/nVsdwg+G4UEFnLJZg4bSdHiDlPs+GhknB/TRCAr6GE
   0ScU4CLIxvC7RCtVg0KMtQVpNbGa1LEZNdJIuLHa+Da3MTD2AchrMXws0
   fdnjEx4riUxLOpCOK0zTATM9m/ufvpe7fKN6jZqqUES7bTN+pLK759Dd5
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361698099"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="361698099"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 06:22:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="744682488"
X-IronPort-AV: E=Sophos;i="6.00,239,1681196400"; 
   d="scan'208";a="744682488"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 13 Jun 2023 06:22:57 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q93z6-0001NP-1y;
	Tue, 13 Jun 2023 13:22:56 +0000
Date: Tue, 13 Jun 2023 21:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 14396/27777]
 drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202306132116.p1W60Tzj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   39a9b92e9828f28d3c1bfae81b3121d973b76ad3
commit: e3919bfeb0066ab9b5f9765e5610b95672990e64 [14396/27777] ANDROID: dma-buf: system_heap: Add deferred freeing to the system heap
config: arm-randconfig-s053-20230611 (https://download.01.org/0day-ci/archive/20230613/202306132116.p1W60Tzj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.4
        git checkout e3919bfeb0066ab9b5f9765e5610b95672990e64
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/dma-buf/heaps/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306132116.p1W60Tzj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
>> drivers/dma-buf/heaps/deferred-free-helper.c:24:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +23 drivers/dma-buf/heaps/deferred-free-helper.c

bd1639945c3029 John Stultz 2020-12-09  20  
bd1639945c3029 John Stultz 2020-12-09  21  static LIST_HEAD(free_list);
bd1639945c3029 John Stultz 2020-12-09  22  static size_t list_nr_pages;
bd1639945c3029 John Stultz 2020-12-09 @23  wait_queue_head_t freelist_waitqueue;
bd1639945c3029 John Stultz 2020-12-09 @24  struct task_struct *freelist_task;
bd1639945c3029 John Stultz 2020-12-09  25  static DEFINE_SPINLOCK(free_list_lock);
bd1639945c3029 John Stultz 2020-12-09  26  

:::::: The code at line 23 was first introduced by commit
:::::: bd1639945c30298e4bea2b611d6b0cd08d3cdd98 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
