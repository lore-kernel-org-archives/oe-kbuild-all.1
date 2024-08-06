Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 013562AE68
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Aug 2024 04:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722919969; cv=none; b=Cgajt3wuTy2V7Dw6n1fzE1DP1yBEWmjXLiETZsfzdXl+wndxgZQlyuP4Z7lvGT1yXQZmvINT168/DVSMTw7fu0UX9g/U7BtQSUxTAHH1cbQojea25vHW5VtkTmzMkNfXMjcaPuUWEwZBmNkrQ8orPMmuVxKsCeZ+VCfgHka73OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722919969; c=relaxed/simple;
	bh=CmWLoV4ox51qZ9Wi2LISpkFe1egxEv8Y4Hb0zcgmL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ugWP/5QFKEgfIF64wrJL+8JkJBDaaoK4wg0kBC1w8yyN9yIyfWsRYSn/hO85msukBYkLy+bljJhsoFJuNajFsNdJIbnzIVBjpTV9+smmn+Z2rJ95/ISlAmQ/xJ2B7pE3+tbYIX8ugpBi2B0GgD6hfEQLGye8+wds9eZVYX4jQo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ebzIJe51; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ebzIJe51"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722919968; x=1754455968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CmWLoV4ox51qZ9Wi2LISpkFe1egxEv8Y4Hb0zcgmL1g=;
  b=ebzIJe51ZmOyfCejLfvQ6qDI7RqRt/tAmf8roi174SdlwqBOalIfEyYH
   7Ks9rWHSUbZPQKqtG9KZD54An7/PwvqIWfHi77UvCsXhPFtYe1nTGOgLy
   uYyyhcmDFWLe+ZNi8bnAMph1hnjScdLdOsuFKSvq2FDtnZ7FRGBdDqbav
   E8OA96Pp9xGWL6wtstEWMUXg8srRcC5TxrfuGagv0p2Gd9mJHcwIEqozg
   9Myk8/NvJKi2CX6/SZKrXXN36kdAYj0h8NC2hYcTbr5rXmnf5ejW0/TmU
   o2ou4ljAsqOSSrKYtLc/JrvKcuG77OQJleeyXeXhVF4KdkJBZQBi/1UoR
   A==;
X-CSE-ConnectionGUID: ANu2TkyKShC9pTFQDpk7QQ==
X-CSE-MsgGUID: byXMhV8WRAm7w9M5LLU+Nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="21034771"
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="21034771"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 21:52:47 -0700
X-CSE-ConnectionGUID: fKpu5gPDQ5emleRepkWrJg==
X-CSE-MsgGUID: tyj29pMpRo69jcbYRqf+rQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,266,1716274800"; 
   d="scan'208";a="56315138"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Aug 2024 21:52:44 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbCBd-00049u-1T;
	Tue, 06 Aug 2024 04:52:41 +0000
Date: Tue, 6 Aug 2024 12:51:50 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-misc-updates 11/11]
 include/linux/compiler.h:63:17: warning: '__if_trace' is static but declared
 in inline function 'task_allowed_on_cpu' which is not static
Message-ID: <202408061235.lo1E69Vv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-misc-updates
head:   b561219e25d098ec7bf3dea5342a01c294b5e1a8
commit: b561219e25d098ec7bf3dea5342a01c294b5e1a8 [11/11] sched_ext: Make task_can_run_on_remote_rq() use common task_allowed_on_cpu()
config: arc-randconfig-002-20240806 (https://download.01.org/0day-ci/archive/20240806/202408061235.lo1E69Vv-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240806/202408061235.lo1E69Vv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408061235.lo1E69Vv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
>> include/linux/compiler.h:63:17: warning: '__if_trace' is static but declared in inline function 'task_allowed_on_cpu' which is not static
      63 |                 __if_trace = {                          \
         |                 ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/sched/sched.h:2540:9: note: in expansion of macro 'if'
    2540 |         if (!(p->flags & PF_KTHREAD) && !task_cpu_possible(cpu, p))
         |         ^~
   kernel/sched/sched.h:2536:14: warning: 'cpumask_test_cpu' is static but used in inline function 'task_allowed_on_cpu' which is not static
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |              ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/sched/sched.h:2536:9: note: in expansion of macro 'if'
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |         ^~
>> include/linux/compiler.h:63:17: warning: '__if_trace' is static but declared in inline function 'task_allowed_on_cpu' which is not static
      63 |                 __if_trace = {                          \
         |                 ^~~~~~~~~~
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   kernel/sched/sched.h:2536:9: note: in expansion of macro 'if'
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |         ^~
   kernel/sched/sched.h:2536:14: warning: 'cpumask_test_cpu' is static but used in inline function 'task_allowed_on_cpu' which is not static
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |              ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   kernel/sched/sched.h:2536:9: note: in expansion of macro 'if'
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |         ^~
   kernel/sched/sched.h:2536:14: warning: 'cpumask_test_cpu' is static but used in inline function 'task_allowed_on_cpu' which is not static
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |              ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   kernel/sched/sched.h:2536:9: note: in expansion of macro 'if'
    2536 |         if (!cpumask_test_cpu(cpu, p->cpus_ptr))
         |         ^~


vim +63 include/linux/compiler.h

a15fd609ad53a6 Linus Torvalds 2019-03-20  58  
a15fd609ad53a6 Linus Torvalds 2019-03-20  59  #define __trace_if_value(cond) ({			\
2bcd521a684cc9 Steven Rostedt 2008-11-21  60  	static struct ftrace_branch_data		\
e04462fb82f8dd Miguel Ojeda   2018-09-03  61  		__aligned(4)				\
33def8498fdde1 Joe Perches    2020-10-21  62  		__section("_ftrace_branch")		\
a15fd609ad53a6 Linus Torvalds 2019-03-20 @63  		__if_trace = {				\
2bcd521a684cc9 Steven Rostedt 2008-11-21  64  			.func = __func__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  65  			.file = __FILE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  66  			.line = __LINE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  67  		};					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  68  	(cond) ?					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  69  		(__if_trace.miss_hit[1]++,1) :		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  70  		(__if_trace.miss_hit[0]++,0);		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  71  })
a15fd609ad53a6 Linus Torvalds 2019-03-20  72  

:::::: The code at line 63 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
