Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361F6F517
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 04:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OtDhpX9B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701836019; x=1733372019;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8r8SvioYkh0V9fg5ZDhsYOmVK4Xbo+lcyPeyGgNsAzU=;
  b=OtDhpX9BE1PUpF6ErRdLmPWahTPt7bIYvRn3uP7oYEpSCLA9uGKLZKOd
   +GlD9xGGUjxVcFXUgfXMKQDMiczyJNIcqKXP/8SxjPH53vFf9DhhzFc2P
   /geWpArqvS7XI23kGg3aZDDLSS2e88wzUU+VNNqoDDD+QiKjG03BOy8P+
   mejixP1wSsdyCD/xMmWtTRrvZPUyoFBh8ABHEmNI1/GA4an5WkU4JzhAn
   gYqsix55Z0XzegybuiA8RwylcbvDqBUK8pgcuKzexS9l4k0XzNhHayC8C
   2fQFsqL4lqCVjUtd+dZQncd+4hhwsFBHQYteK38QdNxDkBNY3qYV0uK+J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="458325933"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="458325933"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 20:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="894599845"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="894599845"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 05 Dec 2023 20:13:34 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAjHw-000AEk-1n;
	Wed, 06 Dec 2023 04:13:32 +0000
Date: Wed, 6 Dec 2023 12:13:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yajun Deng <yajun.deng@linux.dev>, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Yajun Deng <yajun.deng@linux.dev>
Subject: Re: [PATCH 2/2] sched/rt: Return NULL when rt entity isn't a task in
 rt_task_of()
Message-ID: <202312061220.T02aFFcy-lkp@intel.com>
References: <20231201022704.3526377-3-yajun.deng@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231201022704.3526377-3-yajun.deng@linux.dev>

Hi Yajun,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on next-20231205]
[cannot apply to linus/master v6.7-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yajun-Deng/sched-fair-Return-NULL-when-entity-isn-t-a-task-in-task_of/20231201-103036
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231201022704.3526377-3-yajun.deng%40linux.dev
patch subject: [PATCH 2/2] sched/rt: Return NULL when rt entity isn't a task in rt_task_of()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20231206/202312061220.T02aFFcy-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061220.T02aFFcy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061220.T02aFFcy-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:45:
   kernel/sched/rt.c: In function 'rt_se_prio':
>> kernel/sched/rt.c:947:29: error: 'struct rt_rq' has no member named 'highest_prio'
     947 |                 return rt_rq->highest_prio.curr;
         |                             ^~


vim +947 kernel/sched/rt.c

ac086bc22997a2 kernel/sched_rt.c Peter Zijlstra  2008-04-19  941  
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  942  static inline int rt_se_prio(struct sched_rt_entity *rt_se)
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  943  {
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  944  	struct rt_rq *rt_rq = group_rt_rq(rt_se);
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  945  
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  946  	if (rt_rq)
e864c499d9e578 kernel/sched_rt.c Gregory Haskins 2008-12-29 @947  		return rt_rq->highest_prio.curr;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  948  
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  949  	return rt_task_of(rt_se)->prio;
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  950  }
6f505b16425a51 kernel/sched_rt.c Peter Zijlstra  2008-01-25  951  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
