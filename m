Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF33617E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Aug 2023 09:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693128885; x=1724664885;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=67klVXnHLrecFTKAgKakNd7RtwG5v+6xqsjUPsQzOjo=;
  b=EYMWQzZlcda85LxUWYqm6bifKAxXcDoVN3K2ck3BieT6fqqttVr+Wnsb
   xubBkuJToLcOqs1fmlmqnnpDzcbIB0mUcw7ZVqm6rFyDvAWl0QwPz0hf2
   NpGUVJ3yhb/gRdJ9vGieCyyJwlhdZGrW7hgtftOWRB1csQBaZLQxOVmpK
   XG9jSBPjQohfWIpd/eMdFclq5mkJiQHvaj6Unx+3Fhvcp7nXt9SJfv1ff
   q2oH5U2prF4vgjxZhsm2ydRsu0XbAx1P1eahww0BsaQlxMZc5Ctdpe4cF
   CYt6g85NcelDzOt6SIcKgxi8kJCSPnVnqzteA/vnYcWVNAa6Ie4VOszsh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="355263064"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="355263064"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2023 02:34:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="741067150"
X-IronPort-AV: E=Sophos;i="6.02,205,1688454000"; 
   d="scan'208";a="741067150"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 27 Aug 2023 02:34:43 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qaCAN-0005ci-0w;
	Sun, 27 Aug 2023 09:34:43 +0000
Date: Sun, 27 Aug 2023 17:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH bpf-next 2/4] bpf: Introduce process open coded
 iterator kfuncs
Message-ID: <202308271718.o79CRvXO-lkp@intel.com>
References: <20230827072057.1591929-3-zhouchuyi@bytedance.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230827072057.1591929-3-zhouchuyi@bytedance.com>

Hi Chuyi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Chuyi-Zhou/bpf-Introduce-css_task-open-coded-iterator-kfuncs/20230827-152340
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230827072057.1591929-3-zhouchuyi%40bytedance.com
patch subject: [RFC PATCH bpf-next 2/4] bpf: Introduce process open coded iterator kfuncs
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230827/202308271718.o79CRvXO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308271718.o79CRvXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308271718.o79CRvXO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/task_iter.c:830:17: warning: no previous prototype for 'bpf_iter_css_task_new' [-Wmissing-prototypes]
     830 | __bpf_kfunc int bpf_iter_css_task_new(struct bpf_iter_css_task *it,
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:846:33: warning: no previous prototype for 'bpf_iter_css_task_next' [-Wmissing-prototypes]
     846 | __bpf_kfunc struct task_struct *bpf_iter_css_task_next(struct bpf_iter_css_task *it)
         |                                 ^~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/task_iter.c:855:18: warning: no previous prototype for 'bpf_iter_css_task_destroy' [-Wmissing-prototypes]
     855 | __bpf_kfunc void bpf_iter_css_task_destroy(struct bpf_iter_css_task *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:869:17: warning: no previous prototype for 'bpf_iter_process_new' [-Wmissing-prototypes]
     869 | __bpf_kfunc int bpf_iter_process_new(struct bpf_iter_process *it)
         |                 ^~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:882:33: warning: no previous prototype for 'bpf_iter_process_next' [-Wmissing-prototypes]
     882 | __bpf_kfunc struct task_struct *bpf_iter_process_next(struct bpf_iter_process *it)
         |                                 ^~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/task_iter.c:891:18: warning: no previous prototype for 'bpf_iter_process_destroy' [-Wmissing-prototypes]
     891 | __bpf_kfunc void bpf_iter_process_destroy(struct bpf_iter_process *it)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_iter_process_new +869 kernel/bpf/task_iter.c

   868	
 > 869	__bpf_kfunc int bpf_iter_process_new(struct bpf_iter_process *it)
   870	{
   871		struct bpf_iter_process_kern *kit = (void *)it;
   872	
   873		BUILD_BUG_ON(sizeof(struct bpf_iter_process_kern) != sizeof(struct bpf_iter_process));
   874		BUILD_BUG_ON(__alignof__(struct bpf_iter_process_kern) !=
   875						__alignof__(struct bpf_iter_process));
   876	
   877		rcu_read_lock();
   878		kit->tsk = &init_task;
   879		return 0;
   880	}
   881	
 > 882	__bpf_kfunc struct task_struct *bpf_iter_process_next(struct bpf_iter_process *it)
   883	{
   884		struct bpf_iter_process_kern *kit = (void *)it;
   885	
   886		kit->tsk = next_task(kit->tsk);
   887	
   888		return kit->tsk == &init_task ? NULL : kit->tsk;
   889	}
   890	
 > 891	__bpf_kfunc void bpf_iter_process_destroy(struct bpf_iter_process *it)
   892	{
   893		rcu_read_unlock();
   894	}
   895	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
