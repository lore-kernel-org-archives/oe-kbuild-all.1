Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939E414A92
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 21:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692308124; x=1723844124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YcaV6XsCoyhkQuB/R/HnUStDj8MNyyOfLZM87T8qfPE=;
  b=oCD9n2Py/QTLPlzkH7zpFIo1LRuLSBOoCj7JAfcs5OWfgRfu6NzXoT63
   lR4Ofh3iqPmWyvyQKx0kQzqel/thJncV6QYejCJ14vk1XyMfK8i3Q+Jsc
   mppd2LAqD43odDACnD60jN+oG06BfsszwE61WTJ++QoGWHomoEhLSfT4j
   VGmCM6otL3374usDeq/tSp9u1H6tkYxMeHI1gdgVwBYwvQqPaZtQ79A7S
   9dE7rJ4BmCKky2ZtsMS3SomrZ10v+5k+mO5qOxFi6EwHGeCiL+3k/C1zu
   Hnlpdek5fyX+0B3JPV1TgsRvjBiVkJRgGFxPRONeBtY+W51B9XHxuBEt9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="459296805"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="459296805"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 14:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="878399136"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 17 Aug 2023 14:35:14 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWke5-0001UF-0l;
	Thu, 17 Aug 2023 21:35:09 +0000
Date: Fri, 18 Aug 2023 05:35:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2023-04 12636/26122]
 kernel/sched/pelt.c:35:5: warning: no previous declaration for
 'get_pelt_halflife'
Message-ID: <202308180523.f4MvRnUP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10-2023-04
head:   d0dee14aa54490b7195fc70fa728cbf6023462fa
commit: 1efc36b815769cb8c7dae1d53373b190c017f5d1 [12636/26122] ANDROID: sched: add a helper function to change PELT half-life
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230818/202308180523.f4MvRnUP-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180523.f4MvRnUP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180523.f4MvRnUP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/pelt.c:35:5: warning: no previous declaration for 'get_pelt_halflife' [-Wmissing-declarations]
    int get_pelt_halflife(void)
        ^~~~~~~~~~~~~~~~~
>> kernel/sched/pelt.c:68:5: warning: no previous declaration for 'set_pelt_halflife' [-Wmissing-declarations]
    int set_pelt_halflife(int num)
        ^~~~~~~~~~~~~~~~~


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
