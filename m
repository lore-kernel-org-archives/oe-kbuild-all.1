Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F51F91E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Sep 2025 10:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758623066; cv=none; b=fXiAm+/hVZPxP1Xyjb4ckZAEavEZWFrs7Hvy993c7KsvYuW6pceKkDm/YzcgBNa5mODYXqrfWZpEJFHByNiwvO5mW3a7c93FV9zNZ44nZqpflWCcUcIbo2Ote4cEzj2evM93Kl8i/47WENi3EmwtArmqSgSowTrXzkw2ZYcVYQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758623066; c=relaxed/simple;
	bh=G744atH2U10l6z9eeJKPXGWBJKCpvOAjhNHiiEGiTbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nPYJA9BYEFaVaHubTLFv+DvHxplxHS6WbjJ4FR+cjSkC7FkQxTFZeI0P5HJFWqrdpc68UAwZmqoBajR52MJBkinpS3jumHNuEkYdrsOt8JrcEh5hhFUiIa9aLjFvdqawxhEiZMe8cu5pApgFeJiwiu+oMo72+UPaWos0mrQ9UX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/56spT0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/56spT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758623065; x=1790159065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G744atH2U10l6z9eeJKPXGWBJKCpvOAjhNHiiEGiTbQ=;
  b=D/56spT079z8iVwTMLeLp0yMnl11cEOx43XTsjoDGH0EMEbbkNI1Wyp8
   z6i5q4rzh1XRxsXKgideUe2Hj0Tht8GNfCwfb3sD1iY7ZyrzqZ5x20zaz
   oq2h+nFNREeEASZX2jt+DsQGQ6sRIRw8vWRz46wtc/6Iq5W/gM68/3he0
   uug5axMMHZ7lW6UCyXZ07rB7zWMsfQc6fpgx4G7WJ9HWKRxPy9Z7Xfoz8
   lookAK/KI2sPRbKOP58QyaxzvtNg4QbnUxLqGsQo1CGSsM9bCJC77cCzL
   MxPIKg2AXsqgD2riR8CuJg6awaq86topbAct1DDwtxCEyue/YPFaSPXt3
   g==;
X-CSE-ConnectionGUID: jsvSJ++WTw2U1Q0T/aK6bw==
X-CSE-MsgGUID: 7OoXYucETRq9s6WJZs4OQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64701425"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64701425"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 03:24:24 -0700
X-CSE-ConnectionGUID: c8caDaJZQwGCOBrGClhttA==
X-CSE-MsgGUID: f2oMR0D2RrydjE49zupL5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="181995066"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2025 03:24:22 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v10C4-00030f-1B;
	Tue, 23 Sep 2025 10:24:20 +0000
Date: Tue, 23 Sep 2025 18:24:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Anna Schumaker <anna.schumaker@oracle.com>,
	Chuck Lever <chuck.lever@oracle.com>,
	Simon Horman <horms@kernel.org>
Subject: [linux-next:master 8703/11516] include/linux/kernel.h:321:46: error:
 called object 'strlen' is not a function or function pointer
Message-ID: <202509231815.d1EjWp8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf2602a3cb2381fb1a04bf1c39a290518d2538d1
commit: 87ea8ac837ae5dc09c721d1cc0cd1fa25850bedc [8703/11516] sunrpc: add a Kconfig option to redirect dfprintk() output to trace buffer
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20250923/202509231815.d1EjWp8Y-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231815.d1EjWp8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509231815.d1EjWp8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:11,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from fs/nfsd/nfs4xdr.c:37:
   fs/nfsd/nfs4xdr.c: In function 'nfsd4_encode_components_esc':
>> include/linux/kernel.h:321:46: error: called object 'strlen' is not a function or function pointer
     321 |                 __trace_puts(_THIS_IP_, str, strlen(str));              \
         |                                              ^~~~~~
   include/linux/kernel.h:265:17: note: in expansion of macro 'trace_puts'
     265 |                 trace_puts(fmt);                        \
         |                 ^~~~~~~~~~
   include/linux/sunrpc/debug.h:34:41: note: in expansion of macro 'trace_printk'
      34 | #  define __sunrpc_printk(fmt, ...)     trace_printk(fmt, ##__VA_ARGS__)
         |                                         ^~~~~~~~~~~~
   include/linux/sunrpc/debug.h:42:17: note: in expansion of macro '__sunrpc_printk'
      42 |                 __sunrpc_printk(fmt, ##__VA_ARGS__);                    \
         |                 ^~~~~~~~~~~~~~~
   include/linux/sunrpc/debug.h:25:9: note: in expansion of macro 'dfprintk'
      25 |         dfprintk(FACILITY, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~
   fs/nfsd/nfs4xdr.c:2646:9: note: in expansion of macro 'dprintk'
    2646 |         dprintk("nfsd4_encode_components(%s)\n", components);
         |         ^~~~~~~
   fs/nfsd/nfs4xdr.c:2643:13: note: declared here
    2643 |         int strlen, count=0;
         |             ^~~~~~


vim +/strlen +321 include/linux/kernel.h

769b0441f438c4 Frederic Weisbecker      2009-03-06  287  
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  288) /**
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  289)  * trace_puts - write a string into the ftrace buffer
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  290)  * @str: the string to record
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  291)  *
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  292)  * Note: __trace_bputs is an internal function for trace_puts and
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  293)  *       the @ip is passed in via the trace_puts macro.
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  294)  *
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  295)  * This is similar to trace_printk() but is made for those really fast
e8c97af0c1f23d Randy Dunlap             2017-10-13  296   * paths that a developer wants the least amount of "Heisenbug" effects,
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  297)  * where the processing of the print format is still too much.
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  298)  *
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  299)  * This function allows a kernel developer to debug fast path sections
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  300)  * that printk is not appropriate for. By scattering in various
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  301)  * printk like tracing in the code, a developer can quickly see
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  302)  * where problems are occurring.
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  303)  *
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  304)  * This is intended as a debugging tool for the developer only.
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  305)  * Please refrain from leaving trace_puts scattered around in
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  306)  * your code. (Extra memory is used for special buffers that are
e8c97af0c1f23d Randy Dunlap             2017-10-13  307   * allocated when trace_puts() is used.)
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  308)  *
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  309)  * Returns: 0 if nothing was written, positive # if string was.
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  310)  *  (1 when __trace_bputs is used, strlen(str) when __trace_puts is used)
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  311)  */
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  312) 
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  313) #define trace_puts(str) ({						\
3debb0a9ddb165 Steven Rostedt (Red Hat  2016-03-22  314) 	static const char *trace_printk_fmt __used			\
33def8498fdde1 Joe Perches              2020-10-21  315  		__section("__trace_printk_fmt") =			\
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  316) 		__builtin_constant_p(str) ? str : NULL;			\
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  317) 									\
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  318) 	if (__builtin_constant_p(str))					\
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  319) 		__trace_bputs(_THIS_IP_, trace_printk_fmt);		\
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  320) 	else								\
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08 @321) 		__trace_puts(_THIS_IP_, str, strlen(str));		\
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  322) })
bcf312cf762f3f Steven Rostedt           2013-05-02  323  extern int __trace_bputs(unsigned long ip, const char *str);
bcf312cf762f3f Steven Rostedt           2013-05-02  324  extern int __trace_puts(unsigned long ip, const char *str, int size);
09ae72348eccb6 Steven Rostedt (Red Hat  2013-03-08  325) 

:::::: The code at line 321 was first introduced by commit
:::::: 09ae72348eccb60e304cf8ce94653f4a78fcd407 tracing: Add trace_puts() for even faster trace_printk() tracing

:::::: TO: Steven Rostedt (Red Hat) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
