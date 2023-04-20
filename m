Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC9928F6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 07:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681976493; x=1713512493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q363M+n+3wYyiFIW0ubqYlABLjAcPkPqSy9wxPs8EiE=;
  b=KyWGt+JN6Om5wIE5h6oDuvlS1epVKMZ0f0M/Whv3pLOkhmxRKCdBKwfp
   38phgytqdcFzyI9/CIMf/Gqit4ssgkXiRrOAciYlxcPvtBMrGU9lWbeXB
   57Uf+talLmSnwpSEdjVK56+5sNgkr2+x90KxJG2euEs0W/N2xHPO+VK4E
   OYa/FcST7l+RIOjzzKQ1LjRt5u/7c5j7qjwaUvKUrt38oLIbd7zvtwGVd
   8gRJinIRfz9xxOk2iCa/4IucqRenI0GmyGnEFRCMyEz7BYAVal2QN/TQ1
   5FloxY5nimiUaWIGTTIabLveYs3FywlBryB7MeMdhTIX5PnY4XZJ6foCG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="343142182"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="343142182"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 00:41:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="685253122"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="685253122"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2023 00:41:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppOv4-000fam-31;
	Thu, 20 Apr 2023 07:41:30 +0000
Date: Thu, 20 Apr 2023 15:41:11 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 86/97] kernel/cgroup/cpuset.c:2979:30:
 error: 'cgroup_mutex' undeclared; did you mean 'cgroup_put'?
Message-ID: <202304201543.AET66B40-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   83f10153cf1bcae9eae8aca904a3884c440448bf
commit: 87a891b0fbd7ed130aa20a47cb8f9b66e63af907 [86/97] cgroup/cpuset: Add cpuset_can_fork() and cpuset_cancel_fork() methods
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20230420/202304201543.AET66B40-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=87a891b0fbd7ed130aa20a47cb8f9b66e63af907
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 87a891b0fbd7ed130aa20a47cb8f9b66e63af907
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201543.AET66B40-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rcupdate.h:29,
                    from include/linux/rculist.h:11,
                    from include/linux/pid.h:5,
                    from include/linux/sched.h:14,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/cgroup/cpuset.c:25:
   kernel/cgroup/cpuset.c: In function 'cpuset_can_fork':
>> kernel/cgroup/cpuset.c:2979:30: error: 'cgroup_mutex' undeclared (first use in this function); did you mean 'cgroup_put'?
    2979 |         lockdep_assert_held(&cgroup_mutex);
         |                              ^~~~~~~~~~~~
   include/linux/lockdep.h:415:61: note: in definition of macro 'lockdep_assert_held'
     415 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
         |                                                             ^
   kernel/cgroup/cpuset.c:2979:30: note: each undeclared identifier is reported only once for each function it appears in
    2979 |         lockdep_assert_held(&cgroup_mutex);
         |                              ^~~~~~~~~~~~
   include/linux/lockdep.h:415:61: note: in definition of macro 'lockdep_assert_held'
     415 | #define lockdep_assert_held(l)                  do { (void)(l); } while (0)
         |                                                             ^


vim +2979 kernel/cgroup/cpuset.c

  2961	
  2962	/*
  2963	 * In case the child is cloned into a cpuset different from its parent,
  2964	 * additional checks are done to see if the move is allowed.
  2965	 */
  2966	static int cpuset_can_fork(struct task_struct *task, struct css_set *cset)
  2967	{
  2968		struct cpuset *cs = css_cs(cset->subsys[cpuset_cgrp_id]);
  2969		bool same_cs;
  2970		int ret;
  2971	
  2972		rcu_read_lock();
  2973		same_cs = (cs == task_cs(current));
  2974		rcu_read_unlock();
  2975	
  2976		if (same_cs)
  2977			return 0;
  2978	
> 2979		lockdep_assert_held(&cgroup_mutex);
  2980		percpu_down_write(&cpuset_rwsem);
  2981	
  2982		/* Check to see if task is allowed in the cpuset */
  2983		ret = cpuset_can_attach_check(cs);
  2984		if (ret)
  2985			goto out_unlock;
  2986	
  2987		ret = task_can_attach(task, cs->effective_cpus);
  2988		if (ret)
  2989			goto out_unlock;
  2990	
  2991		ret = security_task_setscheduler(task);
  2992		if (ret)
  2993			goto out_unlock;
  2994	
  2995		/*
  2996		 * Mark attach is in progress.  This makes validate_change() fail
  2997		 * changes which zero cpus/mems_allowed.
  2998		 */
  2999		cs->attach_in_progress++;
  3000	out_unlock:
  3001		percpu_up_write(&cpuset_rwsem);
  3002		return ret;
  3003	}
  3004	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
