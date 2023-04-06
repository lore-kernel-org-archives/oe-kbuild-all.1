Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257DC363
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Apr 2023 00:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680739533; x=1712275533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vb20XP8PRCz8cjO5AGV4udGkr1ITuNlRAPz1daqml8I=;
  b=Xi6oLrxP3D9l1mBe9id7he+PepoWqJnHLx3BV5MWFXB2GILmD7KZzxHl
   1Y1cBAi443XVVcCcf7X62TwsTGze+Iuzhr1vuO9Xp5ooaIJdEsjYdj2wO
   rPTI+iBP8bYgnJk6C4kkvCL1UeYAzrtIOnvrIVu/DlTyLxpfpo5x1hkaI
   j9d2KdKGQ9+ZGhlX4f/IhydIxaBP4IHlhfLua3454a2XLXC4IqXiHMKiO
   NcIV79WKzBM2hBhFwA2EDv5xZrbji1pfa4Tdte31dRp9Wj8NCjn7TGvUU
   3S+LIbohNqy8ZATEr0O25wPyJ+SWDxdRNIscQ3n+lUkEjsjxQtNhtBFXP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="331208252"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="331208252"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 17:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="798110597"
X-IronPort-AV: E=Sophos;i="5.98,322,1673942400"; 
   d="scan'208";a="798110597"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2023 17:05:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkD86-000QvW-1v;
	Thu, 06 Apr 2023 00:05:30 +0000
Date: Thu, 6 Apr 2023 08:04:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14965/29326]
 kernel/sched/stubs.c:8:5: warning: no previous prototype for function
 'sched_isolate_cpu'
Message-ID: <202304060720.9qnIbTPg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   c1102a2e31cd2371b5f9ed2b3b5a4f8ac735cd87
commit: eead51495c8760858c32d9ad0332ffc94397aa82 [14965/29326] ANDROID: GKI: sched: stub sched_isolate symbols
config: x86_64-randconfig-r005-20230403 (https://download.01.org/0day-ci/archive/20230406/202304060720.9qnIbTPg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout eead51495c8760858c32d9ad0332ffc94397aa82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvmem/ kernel/sched/ lib/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060720.9qnIbTPg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/stubs.c:8:5: warning: no previous prototype for function 'sched_isolate_cpu' [-Wmissing-prototypes]
   int sched_isolate_cpu(int cpu)
       ^
   kernel/sched/stubs.c:8:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_isolate_cpu(int cpu)
   ^
   static 
>> kernel/sched/stubs.c:14:5: warning: no previous prototype for function 'sched_unisolate_cpu_unlocked' [-Wmissing-prototypes]
   int sched_unisolate_cpu_unlocked(int cpu)
       ^
   kernel/sched/stubs.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_unisolate_cpu_unlocked(int cpu)
   ^
   static 
>> kernel/sched/stubs.c:20:5: warning: no previous prototype for function 'sched_unisolate_cpu' [-Wmissing-prototypes]
   int sched_unisolate_cpu(int cpu)
       ^
   kernel/sched/stubs.c:20:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int sched_unisolate_cpu(int cpu)
   ^
   static 
>> kernel/sched/stubs.c:26:5: warning: no previous prototype for function 'set_task_boost' [-Wmissing-prototypes]
   int set_task_boost(int boost, u64 period)
       ^
   kernel/sched/stubs.c:26:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_task_boost(int boost, u64 period)
   ^
   static 
   4 warnings generated.


vim +/sched_isolate_cpu +8 kernel/sched/stubs.c

     7	
   > 8	int sched_isolate_cpu(int cpu)
     9	{
    10		return -EINVAL;
    11	}
    12	EXPORT_SYMBOL_GPL(sched_isolate_cpu);
    13	
  > 14	int sched_unisolate_cpu_unlocked(int cpu)
    15	{
    16		return -EINVAL;
    17	}
    18	EXPORT_SYMBOL_GPL(sched_unisolate_cpu_unlocked);
    19	
  > 20	int sched_unisolate_cpu(int cpu)
    21	{
    22		return -EINVAL;
    23	}
    24	EXPORT_SYMBOL_GPL(sched_unisolate_cpu);
    25	
  > 26	int set_task_boost(int boost, u64 period)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
