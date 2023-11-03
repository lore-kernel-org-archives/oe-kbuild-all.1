Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A139440
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 18:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lU798lX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699035526; x=1730571526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O7EAHheC9L9PL12t+sot2fvMJwwGKSQ0K5pfqfddiOA=;
  b=lU798lX4oj7eJbC5q3lvEMVAsv07193JtNLpQJi0LuzD6l9vEK+JsXIC
   F5b/b111Z1d7eZtBETR9rh8optwQ1YeV8LM2k+chdCyA441uNs8wPCVnO
   v8SHxru/xjl+yUhcSEc1dNoJwrGfL6wswB8Quy1GqxvShey5Gey08mr9j
   mERq4n7nZecU4L2DDbdcNqxKZwBgY125tza5S+OvZWo6gs8ODBUfDnAFc
   SCew847b/PJmIAmduKhPpyfNq22U4IwKL/C2BAEm4mw1kILbHYM7rKhWI
   I1zHQXPyAzuFpKjcBKEQobFiN76FTQimQhTTIt+ULlvCz7yedTj8ta8Za
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386166813"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="386166813"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 11:18:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852342930"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="852342930"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2023 11:18:44 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyykk-0002oW-12;
	Fri, 03 Nov 2023 18:18:42 +0000
Date: Sat, 4 Nov 2023 02:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 12636/29087]
 kernel/sched/pelt.c:35:5: warning: no previous prototype for function
 'get_pelt_halflife'
Message-ID: <202311040237.XzB3ibdS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   422887ef073ab9748ddbdf4ffe3009e040f93c4c
commit: 1efc36b815769cb8c7dae1d53373b190c017f5d1 [12636/29087] ANDROID: sched: add a helper function to change PELT half-life
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20231104/202311040237.XzB3ibdS-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311040237.XzB3ibdS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040237.XzB3ibdS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/pelt.c:35:5: warning: no previous prototype for function 'get_pelt_halflife' [-Wmissing-prototypes]
   int get_pelt_halflife(void)
       ^
   kernel/sched/pelt.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int get_pelt_halflife(void)
   ^
   static 
>> kernel/sched/pelt.c:68:5: warning: no previous prototype for function 'set_pelt_halflife' [-Wmissing-prototypes]
   int set_pelt_halflife(int num)
       ^
   kernel/sched/pelt.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int set_pelt_halflife(int num)
   ^
   static 
   2 warnings generated.


vim +/get_pelt_halflife +35 kernel/sched/pelt.c

    34	
  > 35	int get_pelt_halflife(void)
    36	{
    37		return pelt_load_avg_period;
    38	}
    39	EXPORT_SYMBOL_GPL(get_pelt_halflife);
    40	
    41	static int __set_pelt_halflife(void *data)
    42	{
    43		int rc = 0;
    44		int num = *(int *)data;
    45	
    46		switch (num) {
    47		case PELT8_LOAD_AVG_PERIOD:
    48			pelt_load_avg_period = PELT8_LOAD_AVG_PERIOD;
    49			pelt_load_avg_max = PELT8_LOAD_AVG_MAX;
    50			pelt_runnable_avg_yN_inv = pelt8_runnable_avg_yN_inv;
    51			pr_info("PELT half life is set to %dms\n", num);
    52			break;
    53		case PELT32_LOAD_AVG_PERIOD:
    54			pelt_load_avg_period = PELT32_LOAD_AVG_PERIOD;
    55			pelt_load_avg_max = PELT32_LOAD_AVG_MAX;
    56			pelt_runnable_avg_yN_inv = pelt32_runnable_avg_yN_inv;
    57			pr_info("PELT half life is set to %dms\n", num);
    58			break;
    59		default:
    60			rc = -EINVAL;
    61			pr_err("Failed to set PELT half life to %dms, the current value is %dms\n",
    62				num, pelt_load_avg_period);
    63		}
    64	
    65		return rc;
    66	}
    67	
  > 68	int set_pelt_halflife(int num)
    69	{
    70		return stop_machine(__set_pelt_halflife, &num, NULL);
    71	}
    72	EXPORT_SYMBOL_GPL(set_pelt_halflife);
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
