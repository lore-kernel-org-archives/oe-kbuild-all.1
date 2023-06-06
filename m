Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15597F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jun 2023 01:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686013418; x=1717549418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v3NHCSkoJgoatUGUzPWZmtLFyFmOjggfonYC++g9IBk=;
  b=AwKXpypHT557Lco7vthiRc6ze/YVPCeWZErYwKDo3OJgr1Cx/8IlKNV0
   UPl6b3nvQ3spQVYUla0OvszJLsYc73TGLtD5zJ1NX1QkWHs97GmMaDf3F
   le0jyxgZAFUngyJyIC8x3aItIb4x7fy1JzyMGtHh6+7LNQCQI/zU14pu2
   31Cx/wMyYRm/aJ8saQ0L9QUicxuuMDg5/PUiATdY8m/f6DDaG6eXyiJzL
   Mz+I6U2IKNUQxMjR9giF2DO7vyP4kYhwdWMe/nH3fK5S2mAjT/M9uAZgR
   NNeV+2F+RafSXVMOO5obcAX4+3S/zBPX+dx1mxJPYduVPdqTSmo1hebtB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355378947"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="355378947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 18:03:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738561177"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="738561177"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 18:03:36 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6L6l-0004dD-2K;
	Tue, 06 Jun 2023 01:03:35 +0000
Date: Tue, 6 Jun 2023 09:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 4/7] kernel/sched/core.c:6227:17: error:
 break statement not within loop or switch
Message-ID: <202306060818.oOjHiv66-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   4bfcd2b1530138c36d5d8fab626558123812fc92
commit: aa2d9969b7bd01b144651974835aba310fe909d0 [4/7] sched: Use fancy new guards
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230606/202306060818.oOjHiv66-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=aa2d9969b7bd01b144651974835aba310fe909d0
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout aa2d9969b7bd01b144651974835aba310fe909d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060818.oOjHiv66-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:3444:9: note: in expansion of macro 'guard'
    3444 |         guard(preempt);
         |         ^~~~~
   kernel/sched/core.c: In function 'ttwu_stat':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:3657:17: note: in expansion of macro 'guard'
    3657 |                 guard(rcu);
         |                 ^~~~~
   kernel/sched/core.c: In function 'wake_up_if_idle':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:3865:9: note: in expansion of macro 'guard'
    3865 |         guard(rcu);
         |         ^~~~~
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:3867:17: note: in expansion of macro 'guard'
    3867 |                 guard(rq_lock, rq);
         |                 ^~~~~
   kernel/sched/core.c: In function 'try_to_wake_up':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:4127:9: note: in expansion of macro 'guard'
    4127 |         guard(preempt);
         |         ^~~~~
   kernel/sched/core.c: In function 'try_steal_cookie':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:6222:9: note: in expansion of macro 'guard'
    6222 |         guard(irq);
         |         ^~~~~
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:6223:9: note: in expansion of macro 'guard'
    6223 |         guard(double_rq_lock, dst, src);
         |         ^~~~~
>> kernel/sched/core.c:6227:17: error: break statement not within loop or switch
    6227 |                 break;
         |                 ^~~~~
   kernel/sched/core.c:6230:17: error: break statement not within loop or switch
    6230 |                 break;
         |                 ^~~~~
   kernel/sched/core.c:6234:17: error: break statement not within loop or switch
    6234 |                 break;
         |                 ^~~~~
   kernel/sched/core.c: In function 'sched_core_balance':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:6293:9: note: in expansion of macro 'guard'
    6293 |         guard(preempt);
         |         ^~~~~
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:6294:9: note: in expansion of macro 'guard'
    6294 |         guard(rcu);
         |         ^~~~~
   kernel/sched/core.c: In function 'sched_core_cpu_starting':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:6334:9: note: in expansion of macro 'guard'
    6334 |         guard(core_lock, &cpu);
         |         ^~~~~
   kernel/sched/core.c: In function 'sched_core_cpu_deactivate':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:6373:9: note: in expansion of macro 'guard'
    6373 |         guard(core_lock, &cpu);
         |         ^~~~~
   kernel/sched/core.c: In function 'set_user_nice':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   kernel/sched/core.c:7120:9: note: in expansion of macro 'named_guard'
    7120 |         named_guard(task_rq_lock, rq_guard,  p);
         |         ^~~~~~~~~~~
   kernel/sched/core.c: In function 'find_get_task':
   include/linux/compiler-gcc.h:132:33: error: expected ',' or ';' before '#pragma'
     132 | #define __diag(s)               _Pragma(__diag_str(GCC diagnostic s))
         |                                 ^~~~~~~
   include/linux/guards.h:79:9: note: in expansion of macro '__diag'
      79 |         __diag(pop)
         |         ^~~~~~
   include/linux/guards.h:91:9: note: in expansion of macro 'ptr_guard'
      91 |         ptr_guard(_guard, _name) = guard_init(_guard, _var)
         |         ^~~~~~~~~
   include/linux/guards.h:94:9: note: in expansion of macro 'named_guard'
      94 |         named_guard(_guard, __UNIQUE_ID(guard), _var)
         |         ^~~~~~~~~~~
   kernel/sched/core.c:7420:9: note: in expansion of macro 'guard'
    7420 |         guard(rcu);
         |         ^~~~~


vim +6227 kernel/sched/core.c

  6214	
  6215	static bool try_steal_cookie(int this, int that)
  6216	{
  6217		struct rq *dst = cpu_rq(this), *src = cpu_rq(that);
  6218		struct task_struct *p;
  6219		unsigned long cookie;
  6220		bool success = false;
  6221	
  6222		guard(irq);
> 6223		guard(double_rq_lock, dst, src);
  6224	
  6225		cookie = dst->core->core_cookie;
  6226		if (!cookie)
> 6227			break;
  6228	
  6229		if (dst->curr != dst->idle)
  6230			break;
  6231	
  6232		p = sched_core_find(src, cookie);
  6233		if (!p)
  6234			break;
  6235	
  6236		do {
  6237			if (p == src->core_pick || p == src->curr)
  6238				goto next;
  6239	
  6240			if (!is_cpu_allowed(p, this))
  6241				goto next;
  6242	
  6243			if (p->core_occupation > dst->idle->core_occupation)
  6244				goto next;
  6245			/*
  6246			 * sched_core_find() and sched_core_next() will ensure
  6247			 * that task @p is not throttled now, we also need to
  6248			 * check whether the runqueue of the destination CPU is
  6249			 * being throttled.
  6250			 */
  6251			if (sched_task_is_throttled(p, this))
  6252				goto next;
  6253	
  6254			deactivate_task(src, p, 0);
  6255			set_task_cpu(p, this);
  6256			activate_task(dst, p, 0);
  6257	
  6258			resched_curr(dst);
  6259	
  6260			success = true;
  6261			break;
  6262	
  6263	next:
  6264			p = sched_core_next(p, cookie);
  6265		} while (p);
  6266	
  6267		return success;
  6268	}
  6269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
