Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7273E4C95
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 21:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782335268; cv=none; b=u3dD9xsiYN874P6fzJwrBqkwAlAjqNOc5uJT6p0HfIVt7pnIwqA761uOiQWuu6fcaq2TvcPDe0mzQ++RuqgFrT+lA1c6ZWGFQVmBbavpfTu+ZEJZfU3lQ1P+mCqqY86Y91u9zP3U68ocovP9ITBuTMYkdPON92/i/WVnMUCt8Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782335268; c=relaxed/simple;
	bh=6O8o1zUznejAgIAWg2+5C52VogYd9hbOUcpulH8VK5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WOGnx2S3GR+DwhdTCdMd8oGOEIgDrBRnn+AHE7LlFqAXwjWhHXIql5gK0AWlhkilnzEI2eUANhRdRPj0UHOeLBO0PClT9NX4B+Wyb6hnTAlAQJmQOl42QkFwX9biKUQsJXJD5KB+OP3VrRuYBNGluSQY/SxoyFKj/mT719gJ9JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHoXJupD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHoXJupD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782335267; x=1813871267;
  h=date:from:to:cc:subject:message-id;
  bh=6O8o1zUznejAgIAWg2+5C52VogYd9hbOUcpulH8VK5s=;
  b=MHoXJupDdS35gtL7Zih/vlGFqV+EswmQ2fnLJXmT+fBbvvdZpv/sq5XC
   XCLQrBObDhcjUEcyHPDpbgzzZyJVErvWzbGwBQ9CNrXfCjA2Er3JU5NfA
   1QNvNgFuSVrstcwa2wJdUFW1D4h1L7vQcAxJ0gC2jYPFnWN1GzT1uPjOP
   clNzGahafpF80nAnHQSFkCFKNNHHO1Y+l8HzifdCX6xMOM4fv5t+mO5np
   U6xdsBn7qU/Vu5F3EYYKv+C/679+F8D8rWxfTRMcSAmNWfV0o7JRTD0BJ
   HvEnQEg+PA9MEGwe8UPqW+3JVOLaaGW2j5mmToMsdrerJFzl7fyUEnfn2
   A==;
X-CSE-ConnectionGUID: kPUT+8X5ROCkDFRGXm2QsQ==
X-CSE-MsgGUID: ESbANNZqT8CNCGYNVhuD+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="83160836"
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="83160836"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 14:07:47 -0700
X-CSE-ConnectionGUID: Hp7I5/+ZSZu4wpqxPVl+Mw==
X-CSE-MsgGUID: 4W+hDJxIQ2S2pM2GMTxvcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,223,1774335600"; 
   d="scan'208";a="274206077"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 24 Jun 2026 14:07:45 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcUoi-000000003fb-2biw;
	Wed, 24 Jun 2026 21:07:32 +0000
Date: Thu, 25 Jun 2026 05:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:trace/fixes 1/2] kernel/rcu/rcu.h:337:17: error:
 implicit declaration of function 'tracing_off'
Message-ID: <202606250523.StK4TvU7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/fixes
head:   9cbc3d9806d31abda2718ceac587ddee3a04849b
commit: b48f507ce7b25e1903d4a7330d9ad6171ba4feed [1/2] tracing: Move non-trace_printk prototypes into trace_controls.h
config: sh-randconfig-002-20260625 (https://download.01.org/0day-ci/archive/20260625/202606250523.StK4TvU7-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260625/202606250523.StK4TvU7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606250523.StK4TvU7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/torture.c:41:
   kernel/torture.c: In function 'torture_shutdown':
>> kernel/rcu/rcu.h:337:17: error: implicit declaration of function 'tracing_off' [-Wimplicit-function-declaration]
     337 |                 tracing_off(); \
         |                 ^~~~~~~~~~~
   kernel/torture.c:665:17: note: in expansion of macro 'rcu_ftrace_dump'
     665 |                 rcu_ftrace_dump(DUMP_ALL);
         |                 ^~~~~~~~~~~~~~~
>> kernel/rcu/rcu.h:339:17: error: implicit declaration of function 'ftrace_dump'; did you mean 'mtree_dup'? [-Wimplicit-function-declaration]
     339 |                 ftrace_dump(oops_dump_mode); \
         |                 ^~~~~~~~~~~
   kernel/torture.c:665:17: note: in expansion of macro 'rcu_ftrace_dump'
     665 |                 rcu_ftrace_dump(DUMP_ALL);
         |                 ^~~~~~~~~~~~~~~
>> kernel/torture.c:665:33: error: 'DUMP_ALL' undeclared (first use in this function)
     665 |                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^~~~~~~~
   kernel/rcu/rcu.h:339:29: note: in definition of macro 'rcu_ftrace_dump'
     339 |                 ftrace_dump(oops_dump_mode); \
         |                             ^~~~~~~~~~~~~~
   kernel/torture.c:665:33: note: each undeclared identifier is reported only once for each function it appears in
   kernel/rcu/rcu.h:339:29: note: in definition of macro 'rcu_ftrace_dump'
     339 |                 ftrace_dump(oops_dump_mode); \
         |                             ^~~~~~~~~~~~~~
--
   In file included from kernel/rcu/rcuscale.c:44:
   kernel/rcu/rcuscale.c: In function 'rcu_scale_writer':
>> kernel/rcu/rcu.h:337:17: error: implicit declaration of function 'tracing_off' [-Wimplicit-function-declaration]
     337 |                 tracing_off(); \
         |                 ^~~~~~~~~~~
   kernel/rcu/rcuscale.c:609:33: note: in expansion of macro 'rcu_ftrace_dump'
     609 |                                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^~~~~~~~~~~~~~~
>> kernel/rcu/rcu.h:339:17: error: implicit declaration of function 'ftrace_dump'; did you mean 'mtree_dup'? [-Wimplicit-function-declaration]
     339 |                 ftrace_dump(oops_dump_mode); \
         |                 ^~~~~~~~~~~
   kernel/rcu/rcuscale.c:609:33: note: in expansion of macro 'rcu_ftrace_dump'
     609 |                                 rcu_ftrace_dump(DUMP_ALL);
         |                                 ^~~~~~~~~~~~~~~
>> kernel/rcu/rcuscale.c:609:49: error: 'DUMP_ALL' undeclared (first use in this function)
     609 |                                 rcu_ftrace_dump(DUMP_ALL);
         |                                                 ^~~~~~~~
   kernel/rcu/rcu.h:339:29: note: in definition of macro 'rcu_ftrace_dump'
     339 |                 ftrace_dump(oops_dump_mode); \
         |                             ^~~~~~~~~~~~~~
   kernel/rcu/rcuscale.c:609:49: note: each undeclared identifier is reported only once for each function it appears in
   kernel/rcu/rcu.h:339:29: note: in definition of macro 'rcu_ftrace_dump'
     339 |                 ftrace_dump(oops_dump_mode); \
         |                             ^~~~~~~~~~~~~~


vim +/tracing_off +337 kernel/rcu/rcu.h

0d75292467b0c85 kernel/rcu.h     Paul E. McKenney 2013-08-17  327  
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  328  /*
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  329   * Dump the ftrace buffer, but only one time per callsite per boot.
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  330   */
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  331  #define rcu_ftrace_dump(oops_dump_mode) \
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  332  do { \
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  333  	static atomic_t ___rfd_beenhere = ATOMIC_INIT(0); \
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  334  	\
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  335  	if (!atomic_read(&___rfd_beenhere) && \
83b6ca1fede773e kernel/rcu/rcu.h Paul E. McKenney 2017-08-31  336  	    !atomic_xchg(&___rfd_beenhere, 1)) { \
83b6ca1fede773e kernel/rcu/rcu.h Paul E. McKenney 2017-08-31 @337  		tracing_off(); \
f22ce09157239aa kernel/rcu/rcu.h Paul E. McKenney 2017-09-01  338  		rcu_ftrace_dump_stall_suppress(); \
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03 @339  		ftrace_dump(oops_dump_mode); \
f22ce09157239aa kernel/rcu/rcu.h Paul E. McKenney 2017-09-01  340  		rcu_ftrace_dump_stall_unsuppress(); \
83b6ca1fede773e kernel/rcu/rcu.h Paul E. McKenney 2017-08-31  341  	} \
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  342  } while (0)
b8989b76052eedc kernel/rcu/rcu.h Paul E. McKenney 2017-05-03  343  

:::::: The code at line 337 was first introduced by commit
:::::: 83b6ca1fede773eebcdfb44f5a94eb410d48b886 rcu: Turn off tracing before dumping trace

:::::: TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
:::::: CC: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
