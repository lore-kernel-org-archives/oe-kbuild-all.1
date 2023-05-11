Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0C78F56
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 20:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683838325; x=1715374325;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X6RMg9D/lXqXLrL7y1HHjwv5s4gB33qFx7uWsqkvSjA=;
  b=ULH/lY/gNmD1TcS08ShDcUhydGwgFpcDOa6u7E8gl+12+pZVV/G0rg5g
   HrC4LnLtTMZo5WRanZ4YS8xD6fqHcOFMby1kJ7/Wz18Y9eQnozEw/bpKc
   X72nyPjY5VJgtZZquQHEB97+79l2To01TrqB5qePv6AVU0ity321PxpKd
   +N4xBNyH24JsF/TlRaaKk2QqGDIdmu1qRycga5kqQxcN+5ds/lYru8/qH
   TR6WBC/AEgqpbFQW+k8sPmpC5I5WAIqX/zH5IxTeqXPFXAS+12x7niMvr
   TuNl9YrBfCouZ8EYSKjMUMCX8TyoAxB/aKUGev/YkMexvyLm6ySZc4QEU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="416250030"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="416250030"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 13:52:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="789530838"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="789530838"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 May 2023 13:52:04 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxDGd-0004FM-1n;
	Thu, 11 May 2023 20:52:03 +0000
Date: Fri, 12 May 2023 04:51:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 14965/29506]
 kernel/sched/stubs.c:8:5: warning: no previous prototype for
 'sched_isolate_cpu'
Message-ID: <202305120424.iBA6MuEE-lkp@intel.com>
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
head:   7cf5d82154dcd64ff75b69f3dc8dbff4ed2d2816
commit: eead51495c8760858c32d9ad0332ffc94397aa82 [14965/29506] ANDROID: GKI: sched: stub sched_isolate symbols
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230512/202305120424.iBA6MuEE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android-4.19-stable
        git checkout eead51495c8760858c32d9ad0332ffc94397aa82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/nvmem/ kernel/sched/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120424.iBA6MuEE-lkp@intel.com/

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
