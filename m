Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E90F1118
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 01:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681780994; x=1713316994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j/V528+G2cILQv93wRk0HzGl7tTI7OpEsdDyhiRROK8=;
  b=WKNzpn8GaaUWr1SoR9BwetJ6KjakhUb648Wn1dqrqkMVoEMHY0wLKZMM
   VDxUMq1MmdVD2J56cVGxV//zh7a88VVu0mCwwZcUKSn6Z0zdJu0sIemwV
   Yb5gbL3OFuZ4F5tnV7mq4++dw9Ro8en51tOSZN7b0MmFWKl4isPpU+138
   4CwF+cFiTsMAhoMLWYGwu5ZV4dI/GJ7vj8QeDIPenleng5ko6aDMf8Ylh
   afr/GQFC2Av+FW7qNzuaJsfOMQah+HlKpJksVirXwUtNo6xZgcilclL5i
   zzb4N3P2SmXtNwZPglPboVHvxQEM7ER5suou3NCGchXL76hlFx3TstOhX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="410264146"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="410264146"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 18:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="668298835"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="668298835"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Apr 2023 18:23:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poa3p-000co3-1Z;
	Tue, 18 Apr 2023 01:23:09 +0000
Date: Tue, 18 Apr 2023 09:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 12636/26120]
 kernel/sched/pelt.c:35:5: warning: no previous prototype for
 'get_pelt_halflife'
Message-ID: <202304180920.TV43g3IL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi JianMin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   4078681792c3fc0b0e896ee0b53909a5f3595c48
commit: 1efc36b815769cb8c7dae1d53373b190c017f5d1 [12636/26120] ANDROID: sched: add a helper function to change PELT half-life
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230418/202304180920.TV43g3IL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android12-5.10
        git checkout 1efc36b815769cb8c7dae1d53373b190c017f5d1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/sched/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180920.TV43g3IL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/pelt.c:35:5: warning: no previous prototype for 'get_pelt_halflife' [-Wmissing-prototypes]
      35 | int get_pelt_halflife(void)
         |     ^~~~~~~~~~~~~~~~~
>> kernel/sched/pelt.c:68:5: warning: no previous prototype for 'set_pelt_halflife' [-Wmissing-prototypes]
      68 | int set_pelt_halflife(int num)
         |     ^~~~~~~~~~~~~~~~~


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
https://github.com/intel/lkp-tests
