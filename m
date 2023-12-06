Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12C723DBBC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 15:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQIob8uM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701877317; x=1733413317;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cZr7EQRwmsoPaiZLo7tYCOCms5lp75M7M2RJwXaDLQM=;
  b=YQIob8uMso/DPUOy2MXW0UILCl5BwWKQrAorUT5qJunS87071wY1BnCO
   +u/ri4n413xJ5hmEDNbzhnShci0uoh2tgsPAfcWH620RWrQkjmOv3phYx
   CZnxL4WPl6P3k9our9coG3T2AyXpydIIHZnRQmPKT7nDdQqMgMLokRJKq
   vEFHGXbnexiEOKfoEGeDpCmi3E3TM2MXhoLl85VuqhVXw6egU0RS2OoFv
   oellhDhfDykfn62Z4CEGczjnDTMru/oAAMpqebJgKDbWDEofpA0Eicnj3
   r7OEe3MdW3AIy1v5TOXoT4o+Zeyz+RbHS+RfZxgBR/j+lMNRY9MbAvoZZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="373545720"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="373545720"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 07:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="889388431"
X-IronPort-AV: E=Sophos;i="6.04,255,1695711600"; 
   d="scan'208";a="889388431"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2023 07:41:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAu1v-000B16-0Z;
	Wed, 06 Dec 2023 15:41:43 +0000
Date: Wed, 6 Dec 2023 23:39:18 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Chinner <david@fromorbit.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dgc-xfs:vfs-scale 4/11] lib/dlock-list.c:67:16: error: assigning to
 'struct cpumask *' from 'const struct cpumask *' discards qualifiers
Message-ID: <202312062348.Mq7trSIx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dgc/linux-xfs.git vfs-scale
head:   5e5e95a86ea3aa15d83654ec3752451959a689e6
commit: 7a215da6235ea23015452201ae78f1664c27ab8a [4/11] lib/dlock-list: Make sibling CPUs share the same linked list
config: x86_64-buildonly-randconfig-001-20231206 (https://download.01.org/0day-ci/archive/20231206/202312062348.Mq7trSIx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312062348.Mq7trSIx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312062348.Mq7trSIx-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/dlock-list.c:67:16: error: assigning to 'struct cpumask *' from 'const struct cpumask *' discards qualifiers [-Werror,-Wincompatible-pointer-types-discards-qualifiers]
                   sibling_mask = topology_sibling_cpumask(cpu);
                                ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +67 lib/dlock-list.c

    36	
    37	/*
    38	 * Initialize cpu2idx mapping table & nr_dlock_lists.
    39	 *
    40	 * It is possible that a dlock-list can be allocated before the cpu2idx is
    41	 * initialized. In this case, all the cpus are mapped to the first entry
    42	 * before initialization.
    43	 *
    44	 * All the sibling CPUs of a sibling group will map to the same dlock list so
    45	 * as to reduce the number of dlock lists to be maintained while minimizing
    46	 * cacheline contention.
    47	 *
    48	 * As the sibling masks are set up in the core initcall phase, this function
    49	 * has to be done in the postcore phase to get the right data.
    50	 */
    51	static int __init cpu2idx_init(void)
    52	{
    53		int idx, cpu;
    54		struct cpumask *sibling_mask;
    55		static struct cpumask mask __initdata;
    56	
    57		cpumask_clear(&mask);
    58		idx = 0;
    59		for_each_possible_cpu(cpu) {
    60			int scpu;
    61	
    62			if (cpumask_test_cpu(cpu, &mask))
    63				continue;
    64			per_cpu(cpu2idx, cpu) = idx;
    65			cpumask_set_cpu(cpu, &mask);
    66	
  > 67			sibling_mask = topology_sibling_cpumask(cpu);
    68			if (sibling_mask) {
    69				for_each_cpu(scpu, sibling_mask) {
    70					per_cpu(cpu2idx, scpu) = idx;
    71					cpumask_set_cpu(scpu, &mask);
    72				}
    73			}
    74			idx++;
    75		}
    76	
    77		/*
    78		 * nr_dlock_lists can only be set after cpu2idx is properly
    79		 * initialized.
    80		 */
    81		smp_mb();
    82		nr_dlock_lists = idx;
    83		WARN_ON(nr_dlock_lists > nr_cpu_ids);
    84	
    85		pr_info("dlock-list: %d head entries per dlock list.\n",
    86			nr_dlock_lists);
    87		return 0;
    88	}
    89	postcore_initcall(cpu2idx_init);
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
