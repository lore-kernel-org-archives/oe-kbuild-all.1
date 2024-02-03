Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C89168B1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 23:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707001324; cv=none; b=HhAQn+BDCOTmiwL+JghVRBcMN1fzn9lsEKf8DMaiMlNqvFgjYjTnuVzl1XkPLk101kyLIr5KKP7RtcCjFthboMMXZwHrlpLyjlho+7hsHSf8aic6dNQA0CGv0hxjsHRmZF9ML8jTATabPPGMlodQPZuRBa8AP+fQ2zLeskRrPbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707001324; c=relaxed/simple;
	bh=wLyNmBdAm1MeSkKDxYTlRPMwZWiZhv8MGDrLD9h+mBk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnFOh0XFbM7vWrvwSJY/lKBH5KmMvpDioia0jHyGrsAQH5LEiThH4EAAlsfpFwYvcnumtl8pVI8/8pyaVHmmPNI3m0T5BhXGYgv5Z2JwSJJWalIoV/m/k4RfIfyv35mQc8RJnSmr1wrEEJ9+80hAcA7zyAcezR5DxFyEEjZPeN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYBj1bcM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYBj1bcM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707001322; x=1738537322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wLyNmBdAm1MeSkKDxYTlRPMwZWiZhv8MGDrLD9h+mBk=;
  b=QYBj1bcM19L0HHyU1sORGO/3fWv58i7rywem0aqJUjZkXNH+ajdqoYVx
   HAoAxNQ0ppev1mNMAQCNic3uY89gbkL6pZZ9aCEX0tiGH/tnD7N47/F2P
   IhhotfkYSQ+Rmh3MwBz5VXgL3OEYhLyZnFr26tCsEyABX3kgSyqc0/UCW
   zvtSDylm++mv0o3DKNT2cxanpFbr5Ir8dw2k1uunwxjyTburmLLZmBWlq
   a7Tdfbj6JtPuUSSSXiYuy5wAmZHlOecwEGyt7TNgf5DCbrqPZf19b2jXd
   WdUBVg3Yvv22TShVKA16ROkBWqbuLpTyWZZJRktk3WsaA89eOypdCQ3Fg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="22821071"
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="22821071"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 15:02:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,241,1701158400"; 
   d="scan'208";a="672702"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 03 Feb 2024 15:02:00 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWP1J-0005hm-2h;
	Sat, 03 Feb 2024 23:01:57 +0000
Date: Sun, 4 Feb 2024 07:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/5] sched/fair: Delete cfs_rq_throttled_loose(),
 use cfs_rq->throttle_pending instead
Message-ID: <202402040651.KMZz9c3q-lkp@intel.com>
References: <20240202080920.3337862-4-vschneid@redhat.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240202080920.3337862-4-vschneid@redhat.com>

Hi Valentin,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tip/core/entry tip/master linus/master v6.8-rc2 next-20240202]
[cannot apply to tip/auto-latest]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Valentin-Schneider/sched-fair-Only-throttle-CFS-tasks-on-return-to-userspace/20240202-162620
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20240202080920.3337862-4-vschneid%40redhat.com
patch subject: [RFC PATCH v2 3/5] sched/fair: Delete cfs_rq_throttled_loose(), use cfs_rq->throttle_pending instead
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20240204/202402040651.KMZz9c3q-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402040651.KMZz9c3q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402040651.KMZz9c3q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'enqueue_task_fair':
   kernel/sched/fair.c:6942:17: error: implicit declaration of function 'unthrottle_on_enqueue' [-Werror=implicit-function-declaration]
    6942 |                 unthrottle_on_enqueue(p);
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'dequeue_task_fair':
   kernel/sched/fair.c:6959:46: error: 'struct sched_entity' has no member named 'kernel_node'
    6959 |         bool kernel_task = !list_empty(&p->se.kernel_node);
         |                                              ^
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:13303:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13303 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13305:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13305 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13310:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13310 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13312:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13312 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:6750:13: warning: 'cfs_rq_throttled_loose' defined but not used [-Wunused-function]
    6750 | static bool cfs_rq_throttled_loose(struct cfs_rq *cfs_rq)
         |             ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/cfs_rq_throttled_loose +6750 kernel/sched/fair.c

ab84d31e15502f kernel/sched_fair.c Paul Turner       2011-07-21  6730  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra    2011-10-25  6731  static inline struct cfs_bandwidth *tg_cfs_bandwidth(struct task_group *tg)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra    2011-10-25  6732  {
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra    2011-10-25  6733  	return NULL;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra    2011-10-25  6734  }
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra    2011-10-25  6735  static inline void destroy_cfs_bandwidth(struct cfs_bandwidth *cfs_b) {}
0e59bdaea75f12 kernel/sched/fair.c Kirill Tkhai      2014-06-25  6736  static inline void update_runtime_enabled(struct rq *rq) {}
a4c96ae319b804 kernel/sched/fair.c Peter Boonstoppel 2012-08-09  6737  static inline void unthrottle_offline_cfs_rqs(struct rq *rq) {}
88c56cfeaec464 kernel/sched/fair.c Phil Auld         2023-07-12  6738  #ifdef CONFIG_CGROUP_SCHED
88c56cfeaec464 kernel/sched/fair.c Phil Auld         2023-07-12  6739  bool cfs_task_bw_constrained(struct task_struct *p)
88c56cfeaec464 kernel/sched/fair.c Phil Auld         2023-07-12  6740  {
88c56cfeaec464 kernel/sched/fair.c Phil Auld         2023-07-12  6741  	return false;
88c56cfeaec464 kernel/sched/fair.c Phil Auld         2023-07-12  6742  }
88c56cfeaec464 kernel/sched/fair.c Phil Auld         2023-07-12  6743  #endif
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6744  static void enqueue_kernel(struct cfs_rq *cfs_rq, struct sched_entity *se, int count) {}
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6745  static void dequeue_kernel(struct cfs_rq *cfs_rq, struct sched_entity *se, int count) {}
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6746  static inline bool is_kernel_task(struct task_struct *p)
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6747  {
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6748  	return false;
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6749  }
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02 @6750  static bool cfs_rq_throttled_loose(struct cfs_rq *cfs_rq)
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6751  {
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6752  	return false;
f3743713c72187 kernel/sched/fair.c Benjamin Segall   2024-02-02  6753  }
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra    2011-10-25  6754  #endif /* CONFIG_CFS_BANDWIDTH */
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra    2011-10-25  6755  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
