Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FDC30F94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 07:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695887592; x=1727423592;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9jG+EMn0dA/h2sKAgTnFKUyQyUD0iwBJtT86r8rPMQE=;
  b=L5BYvr8uq3qd8NvJIalDKBBBsy08KaqMg9saUSWBHK7MZb+hvzq5GJmP
   4Vrc8qVajkXI22vileLiM+TY8c8/GSpcRynpsmpJg1J/J/eKYoB3Km81u
   hA/t8jtq5Px5kQuT5p1UUJWtMZV5LtqO6HBdgIys1lKENVhqbEUc5LRZ4
   voKBCP6AHQEoykj4fdD7nsWWjKWmjlFggJm/zydmo1Rru5WTxWf4EtDZl
   Cv6VoZWn6tW4whaR3TwN0FYp8HjLwOTAcXvNaUy4xCwb2rnV8z+e29E1H
   dJX02LYl7dmFbbH7Jtglt0TjW2PEjPWq1VO604JHo/agCit7q8f+tEnPs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="381909553"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="381909553"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2023 00:53:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="784611843"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="784611843"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 28 Sep 2023 00:53:03 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qllpV-0001FR-1c;
	Thu, 28 Sep 2023 07:53:01 +0000
Date: Thu, 28 Sep 2023 15:52:33 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaobing Li <xiaobing.li@samsung.com>, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	axboe@kernel.dk, asml.silence@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
	kun.dou@samsung.com, peiwei.li@samsung.com, joshi.k@samsung.com,
	kundan.kumar@samsung.com, wenwen.chen@samsung.com,
	ruyi.zhang@samsung.com, Xiaobing Li <xiaobing.li@samsung.com>
Subject: Re: [PATCH 1/3] SCHEDULER: Add an interface for counting real
 utilization.
Message-ID: <202309281554.CwGBQGhe-lkp@intel.com>
References: <20230928022228.15770-2-xiaobing.li@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230928022228.15770-2-xiaobing.li@samsung.com>

Hi Xiaobing,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master v6.6-rc3 next-20230928]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiaobing-Li/SCHEDULER-Add-an-interface-for-counting-real-utilization/20230928-103219
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230928022228.15770-2-xiaobing.li%40samsung.com
patch subject: [PATCH 1/3] SCHEDULER: Add an interface for counting real utilization.
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230928/202309281554.CwGBQGhe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281554.CwGBQGhe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281554.CwGBQGhe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:52:
>> kernel/sched/cputime.c:482:6: warning: no previous prototype for 'get_sqthread_util' [-Wmissing-prototypes]
     482 | void get_sqthread_util(struct task_struct *p)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/cputime.c: In function 'get_sqthread_util':
   kernel/sched/cputime.c:484:56: error: 'struct kernel_cpustat' has no member named 'sq_util'
     484 |         struct task_struct **sqstat = kcpustat_this_cpu->sq_util;
         |                                                        ^~
   kernel/sched/cputime.c:486:29: error: 'MAX_SQ_NUM' undeclared (first use in this function)
     486 |         for (int i = 0; i < MAX_SQ_NUM; i++) {
         |                             ^~~~~~~~~~
   kernel/sched/cputime.c:486:29: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/cputime.c:495:31: error: 'struct kernel_cpustat' has no member named 'flag'
     495 |         if (!kcpustat_this_cpu->flag) {
         |                               ^~
   kernel/sched/cputime.c:497:42: error: 'struct kernel_cpustat' has no member named 'sq_util'
     497 |                         kcpustat_this_cpu->sq_util[j] = NULL;
         |                                          ^~
   kernel/sched/cputime.c:498:34: error: 'struct kernel_cpustat' has no member named 'flag'
     498 |                 kcpustat_this_cpu->flag = true;
         |                                  ^~


vim +/get_sqthread_util +482 kernel/sched/cputime.c

   481	
 > 482	void get_sqthread_util(struct task_struct *p)
   483	{
   484		struct task_struct **sqstat = kcpustat_this_cpu->sq_util;
   485	
   486		for (int i = 0; i < MAX_SQ_NUM; i++) {
   487			if (sqstat[i] && (task_cpu(sqstat[i]) != task_cpu(p)
   488			|| sqstat[i]->__state == TASK_DEAD))
   489				sqstat[i] = NULL;
   490		}
   491	
   492		if (strncmp(p->comm, "iou-sqp", 7))
   493			return;
   494	
   495		if (!kcpustat_this_cpu->flag) {
   496			for (int j = 0; j < MAX_SQ_NUM; j++)
   497				kcpustat_this_cpu->sq_util[j] = NULL;
   498			kcpustat_this_cpu->flag = true;
   499		}
   500		int index = MAX_SQ_NUM;
   501		bool flag = true;
   502	
   503		for (int i = 0; i < MAX_SQ_NUM; i++) {
   504			if (sqstat[i] == p)
   505				flag = false;
   506			if (!sqstat[i] || task_cpu(sqstat[i]) != task_cpu(p)) {
   507				sqstat[i] = NULL;
   508				if (i < index)
   509					index = i;
   510			}
   511		}
   512		if (flag && index < MAX_SQ_NUM)
   513			sqstat[index] = p;
   514	}
   515	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
