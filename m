Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5B31A6B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Oct 2023 14:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696344816; x=1727880816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UzzZrqMVoWN+S6cG2apmAstHXj/dBXfZtkSi023IOdA=;
  b=HqrCW/eW2h/TD8kx+ALsz1R+cYmx41Eoi180VHLTe5D4Be5/8+t73YQa
   t1iBGgx04tNvmBkcPAP+kH7Kzgu1CJBf0bM/0agKUA5XwA9BKx2OuHrPF
   Zn9BPeARAdxOrNGvbm+u1eDN/u2+KRM/s1Nu2aVqRJe54I1F+ngzjDJHB
   25X0HRYFu2iTJCKg8bpGNXlX463ytB+r7wUlYIlWqiGglFmB3ZVUBhd7P
   AwmBNSDTXpd7aQw7CxufutC4OX0jkMk8skIJ/pphyFwOIPv/2r79Q57r5
   8LbqxPZ/JcwfSqDmUyVLiQDkJt15Uf+NNCU+/L3zsbEGK8GTcHmz3wbWG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="1489431"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="1489431"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2023 07:53:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="750947246"
X-IronPort-AV: E=Sophos;i="6.03,197,1694761200"; 
   d="scan'208";a="750947246"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 03 Oct 2023 07:53:34 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qngm9-0007Bp-1F;
	Tue, 03 Oct 2023 14:53:29 +0000
Date: Tue, 3 Oct 2023 22:52:32 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:atomics/stats 3/3] lib/atomic_stats.c:72:12: warning: no
 previous prototype for 'atomic_stats_init'
Message-ID: <202310032246.prIJmJFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git atomics/stats
head:   faac67799e50bb8a7b09f56f10128e6718959467
commit: faac67799e50bb8a7b09f56f10128e6718959467 [3/3] HACK/WIP: locking/atomic: allow statistics to be collected for atomics
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231003/202310032246.prIJmJFZ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231003/202310032246.prIJmJFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310032246.prIJmJFZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/atomic_stats.c:72:12: warning: no previous prototype for 'atomic_stats_init' [-Wmissing-prototypes]
      72 | int __init atomic_stats_init(void)
         |            ^~~~~~~~~~~~~~~~~


vim +/atomic_stats_init +72 lib/atomic_stats.c

    71	
  > 72	int __init atomic_stats_init(void)
    73	{
    74		debugfs_create_file("atomic_stats", 0400, NULL, NULL, &atomic_stats_fops);
    75		return 0;
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
