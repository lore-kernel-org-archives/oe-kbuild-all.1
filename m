Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D704185E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 11:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Km9BKZ7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697367872; x=1728903872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UZTLHkcFYTnxd6qgSdi4Kz02bDuGQ++kI+b+p54QUL8=;
  b=Km9BKZ7NzoN5CISy5Q29P1exStbOOAUEh2niD3mH37ny07UPGRwRqwj2
   3/LfZANfweF8sJT5rY5Dt8TmRbXWGFdyHi6rYN+yjwFYDq51eBHF5CavT
   jYS8Pr7NbzpKq3MnWR8RPNSOUjRfOAiAGFkZlTpP7qxGBfyXbNUoMFPBH
   x7Ow8lN90h2OKDiLgZqG3MsL9GMwQUe+lH0tnbmfMK4hLaE14U4dvYXD8
   V8d65rB1RgbKB+SIdfaGYcabyKYcKL4NHTZgso1+eeV4qLKRuMI5ADAx/
   C9KvC4VItV6NxgW8pGD1RIzO9URMlIQfu5jAquyVU84va4OVwUIyNi60J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="382610283"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="382610283"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 04:04:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="1002575533"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="1002575533"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 15 Oct 2023 04:04:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qryv5-0007LX-28;
	Sun, 15 Oct 2023 11:04:27 +0000
Date: Sun, 15 Oct 2023 19:03:39 +0800
From: kernel test robot <lkp@intel.com>
To: Baisong Zhong <zhongbaisong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not
 used
Message-ID: <202310151835.jARUbXX7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Baisong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9a3dad63edbe9a2ab2be1e7361a2133f519f855b
commit: 28f152cd0926596e69d412467b11b6fe6fe4e864 sched/rt: fix build error when CONFIG_SYSCTL is disable
date:   1 year, 6 months ago
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20231015/202310151835.jARUbXX7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151835.jARUbXX7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151835.jARUbXX7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:43:
   kernel/sched/rt.c:309:6: warning: no previous prototype for 'unregister_rt_sched_group' [-Wmissing-prototypes]
     309 | void unregister_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:311:6: warning: no previous prototype for 'free_rt_sched_group' [-Wmissing-prototypes]
     311 | void free_rt_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:313:5: warning: no previous prototype for 'alloc_rt_sched_group' [-Wmissing-prototypes]
     313 | int alloc_rt_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c:716:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     716 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/rt.c:9:18: warning: 'max_rt_runtime' defined but not used [-Wunused-const-variable=]
       9 | static const u64 max_rt_runtime = MAX_BW;
         |                  ^~~~~~~~~~~~~~


vim +/max_rt_runtime +9 kernel/sched/rt.c

d505b8af58912a Huaixin Chang  2020-04-25  @9  static const u64 max_rt_runtime = MAX_BW;
ce0dbbbb30aee6 Clark Williams 2013-02-07  10  

:::::: The code at line 9 was first introduced by commit
:::::: d505b8af58912ae1e1a211fabc9995b19bd40828 sched: Defend cfs and rt bandwidth quota against overflow

:::::: TO: Huaixin Chang <changhuaixin@linux.alibaba.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
