Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444336FA5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 14:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681827264; x=1713363264;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9iOyMLCzLwLv7oDUrzXJ6Jx9mcHEUv2rLwcMo9c9As=;
  b=KGtNwz5rOCCM/7Sm6yVWYD9Xxx+2qEx/lZpwnLnd4JTlbf49i9TLlP7J
   gGRpkk2t8xqv4xuV9aUPLPIL9Wt+3FbMx0OwM+xR4HLtR+PpFuLxSxqi+
   HUBay4Zb5RHBXnbSsMiQriJoAYx/9/pYK8mH3rpOuGBS23G1S0xTd12Ms
   8noCCCXYyd3iyscoRzvXeDp9ugV+oZM/KFQ67cdWHurtZlp5fDIWB0nMY
   T/UlLzzbnkD5+b+d+O3GbdsyQUXCijsQeNWXZJ3tU+7unpB8qIF2P+NCE
   ADtLzP+CXkFIu8C/O4vDj0x5MdJnlkO6xa0+Uqypm0unPE0wT3jRLC9mJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="347029030"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="347029030"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 07:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="760368354"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="760368354"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Apr 2023 07:13:47 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pom5a-000da9-1Y;
	Tue, 18 Apr 2023 14:13:46 +0000
Date: Tue, 18 Apr 2023 22:13:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14965/29414]
 kernel/sched/stubs.c:8:5: warning: no previous prototype for
 'sched_isolate_cpu'
Message-ID: <202304182237.Gee0fcex-lkp@intel.com>
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
config: arm-randconfig-r046-20230416 (https://download.01.org/0day-ci/archive/20230418/202304182237.Gee0fcex-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout eead51495c8760858c32d9ad0332ffc94397aa82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/nvmem/ kernel/sched/ sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304182237.Gee0fcex-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/stubs.c:8:5: warning: no previous prototype for 'sched_isolate_cpu' [-Wmissing-prototypes]
       8 | int sched_isolate_cpu(int cpu)
         |     ^~~~~~~~~~~~~~~~~
>> kernel/sched/stubs.c:14:5: warning: no previous prototype for 'sched_unisolate_cpu_unlocked' [-Wmissing-prototypes]
      14 | int sched_unisolate_cpu_unlocked(int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/stubs.c:20:5: warning: no previous prototype for 'sched_unisolate_cpu' [-Wmissing-prototypes]
      20 | int sched_unisolate_cpu(int cpu)
         |     ^~~~~~~~~~~~~~~~~~~
>> kernel/sched/stubs.c:26:5: warning: no previous prototype for 'set_task_boost' [-Wmissing-prototypes]
      26 | int set_task_boost(int boost, u64 period)
         |     ^~~~~~~~~~~~~~


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
