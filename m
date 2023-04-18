Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F861C02
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 16:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681834656; x=1713370656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mca7ZGa5m0ywn3fQXrsFXnHhrxI8ZsOm4vYdCGmDsJI=;
  b=f/j+arx3bAzbRWx7W5LnW1zWiUeJRAOanwNE8SJxqj22M/kGuMWHxfS7
   FMV4s2UjE9XH8r6f4yKoXnXd+MvU5mZcLSMrylekphLgA0Q5w/nHVmkca
   D6BltvcZL+4CStpi2OlMVKzloFbLUcZ3JR301vgtKacaAC8BizseysVM1
   YNK59mUuJhNYT29w6CgA2cA0yqWIxxIlp/Lp2SuIAKK7tmqlr0qgesfsX
   JILTvR4w/E6hxROhbFFD+k3JW/eEZo+o0iKyjXZaVCmUyT7imUw1oYHXL
   WDBDJC3w26ES97Mn8Fa8wldPk3N+PSEkHqTCNqvpf2JOheVJ/Yfh2MOtX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="325554154"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="325554154"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 09:16:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="760411407"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="760411407"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2023 09:16:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poo0j-000dj5-3D;
	Tue, 18 Apr 2023 16:16:54 +0000
Date: Wed, 19 Apr 2023 00:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14965/29414]
 kernel/sched/stubs.c:8:5: warning: no previous prototype for function
 'sched_isolate_cpu'
Message-ID: <202304190021.rprNilGb-lkp@intel.com>
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
head:   9b68392a2b5860995364db295d0d869b413fdfdf
commit: eead51495c8760858c32d9ad0332ffc94397aa82 [14965/29414] ANDROID: GKI: sched: stub sched_isolate symbols
config: x86_64-randconfig-r025-20230417 (https://download.01.org/0day-ci/archive/20230419/202304190021.rprNilGb-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvmem/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304190021.rprNilGb-lkp@intel.com/

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
