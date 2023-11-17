Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576B138DF1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Nov 2023 19:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="igZllH8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700250692; x=1731786692;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yTxmtNEZC638iRDw+CuND0SC/pliVjKHtJoEC5MSOj0=;
  b=igZllH8wqy8C+h6YuTqa3r9g+KlT2PoteyhS4YqbDtN6ecWwzDubd16P
   7A4U0bHThEw+E6lMEAdy18wd3jFLRqQ2BSp7XIpxzhok1SurglkOUuICF
   g4MDXLDKyTphHe3T5V4wVKh+5UqlcZYW4Yy7/oagNqZSAq0aQ92Wim4aT
   MoX/YOmJaOl9bHik8QkBbounEIZFLIh6+lHXSaszzw1mFvQLQtAkYAnZP
   x8gaPHQKRu75eQMFqoPmwoazlyMQxIXgUc+HAqeoEgWeXqhszoM0+d+Vt
   zzdeGDtIJXrg0NI5IbGY4EhvPyXv279rJMQ+kVqU+vmI6s3b0WJPTDyxO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="457859779"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="457859779"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 11:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="13586975"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2023 11:51:25 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r44s6-00035j-1I;
	Fri, 17 Nov 2023 19:51:22 +0000
Date: Sat, 18 Nov 2023 03:50:47 +0800
From: kernel test robot <lkp@intel.com>
To: Cruz Zhao <CruzZhao@linux.alibaba.com>, mingo@redhat.com,
	peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
	bristot@redhat.com, vschneid@redhat.com, joel@joelfernandes.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/core: fix incorrect cpustat[CPUTIME_FORCEIDLE]
 update
Message-ID: <202311180359.AFGF0rnk-lkp@intel.com>
References: <20231117125624.16745-1-CruzZhao@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231117125624.16745-1-CruzZhao@linux.alibaba.com>

Hi Cruz,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/sched/core]
[also build test ERROR on linus/master v6.7-rc1 next-20231117]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cruz-Zhao/sched-core-fix-incorrect-cpustat-CPUTIME_FORCEIDLE-update/20231117-205845
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20231117125624.16745-1-CruzZhao%40linux.alibaba.com
patch subject: [PATCH] sched/core: fix incorrect cpustat[CPUTIME_FORCEIDLE] update
config: x86_64-buildonly-randconfig-004-20231118 (https://download.01.org/0day-ci/archive/20231118/202311180359.AFGF0rnk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231118/202311180359.AFGF0rnk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311180359.AFGF0rnk-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
   kernel/sched/cputime.c: In function '__account_forceidle_time':
>> kernel/sched/cputime.c:247:41: error: 'index' undeclared (first use in this function)
     247 |         cgroup_account_cputime_field(p, index, tmp);
         |                                         ^~~~~
   kernel/sched/cputime.c:247:41: note: each undeclared identifier is reported only once for each function it appears in
>> kernel/sched/cputime.c:247:48: error: 'tmp' undeclared (first use in this function); did you mean 'tms'?
     247 |         cgroup_account_cputime_field(p, index, tmp);
         |                                                ^~~
         |                                                tms


vim +/index +247 kernel/sched/cputime.c

   232	
   233	
   234	#ifdef CONFIG_SCHED_CORE
   235	/*
   236	 * Account for forceidle time due to core scheduling.
   237	 *
   238	 * REQUIRES: schedstat is enabled.
   239	 */
   240	void __account_forceidle_time(struct task_struct *p, u64 delta)
   241	{
   242		unsigned int cpu = task_cpu(p);
   243	
   244		__schedstat_add(p->stats.core_forceidle_sum, delta);
   245	
   246		kcpustat_cpu(cpu).cpustat[CPUTIME_FORCEIDLE] += delta;
 > 247		cgroup_account_cputime_field(p, index, tmp);
   248	}
   249	#endif
   250	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
