Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CED2EB84D
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 09:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756805586; cv=none; b=Y4W8TNLyvaNnSBhXUJ4xAg37Xsc/NSVBnMWMH3Hj82vsmBN265rYb1LjNt6L81texH/P7XXfgSQ2TRNiahHll9tOrIFLaYEvV0tpWHT/7Jrp0rHl5CNrKM2ewFFqVrH/WPUl02a54S9n1BDnTNsoGxddFeAeSo/RmvvYi9fCfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756805586; c=relaxed/simple;
	bh=Ix/VM4KkP4tZxNH02t986ORZTjxH0caJldZY5UWRimo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XCYSXM5Eb0KhzC+oSYuFENDMIrs0Bs2yk5izc1PzPeGcnbA44z4YmWzlHP/MzwuRLqqTsp8KKmRY2EV+FZuAtJeKDjM4nO9pX7GKchzVZm3G6y6KbGz/UIKVm9HYwdW/wgPw/iP6qZ+2HTxOwvL3AFzm7saOe0GgznqLfLQOEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WK497Df1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WK497Df1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756805585; x=1788341585;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ix/VM4KkP4tZxNH02t986ORZTjxH0caJldZY5UWRimo=;
  b=WK497Df1iGiz2iznaPBax3AMINuVlSgY6T3SmKzxTHiwQ/ZMthL+oP3o
   zmBucvz+/nzLK8n6titDMMPBJliWTPjBmEd/2XEJYgTFW/ulJHhOlM9vu
   cGoIRBPzAQKBtR+LJ3eLt/wrYQDvW2Y3Eh5LqiaagC0UjyqTDtAQ7x5nl
   lQ05RkhyzxOt+2UsfxW3q/eimYsJJXq999IxoHr1dUXBwjCP2l0iPjO2I
   Eh0y4sc+7rx3FvEmBsBNsJ8z1vxoj04InKS30j6iLWyzAFkI+wp+eSoOF
   jkeOmPUETUWJ7Awk3icqyOsmZTIwBGHhGfKLqsDMX2VDMtCvyVrl6qR1d
   A==;
X-CSE-ConnectionGUID: Ta9v+LXoSRSRZkPswvjIqQ==
X-CSE-MsgGUID: /jwRDdWORC22Ut7T/IwWoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="59008256"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="59008256"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2025 02:33:05 -0700
X-CSE-ConnectionGUID: yXX9xSiwQsCL2AbnFbdLjw==
X-CSE-MsgGUID: qD8zlrYQQxCYvH8wMsnkxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="170788032"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 02 Sep 2025 02:33:03 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utNN3-0001m3-2v;
	Tue, 02 Sep 2025 09:32:25 +0000
Date: Tue, 2 Sep 2025 17:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 42/52] include/linux/compiler.h:55:45: error: wrong
 type argument to unary exclamation mark
Message-ID: <202509021731.saYtPlSz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   9c0f18d0751c1cb9ae4c4ab13d15c258abdbd16e
commit: 002b13d3c973ea17120533306a8312314f2af162 [42/52] serial: drv->state -> xarray
config: arm64-randconfig-001-20250902 (https://download.01.org/0day-ci/archive/20250902/202509021731.saYtPlSz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509021731.saYtPlSz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509021731.saYtPlSz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/err.h:5,
                    from include/linux/clk.h:12,
                    from drivers/tty/serial/sh-sci.c:20:
   drivers/tty/serial/sh-sci.c: In function 'sci_exit':
>> include/linux/compiler.h:55:45: error: wrong type argument to unary exclamation mark
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                ^
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                       ^~~~
   drivers/tty/serial/sh-sci.c:3812:2: note: in expansion of macro 'if'
     if (sci_uart_driver.state)
     ^~
>> include/linux/compiler.h:55:45: error: wrong type argument to unary exclamation mark
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                ^
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
    #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
                                                                ^~~~
   drivers/tty/serial/sh-sci.c:3812:2: note: in expansion of macro 'if'
     if (sci_uart_driver.state)
     ^~
>> include/linux/compiler.h:55:45: error: wrong type argument to unary exclamation mark
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                                                ^
   include/linux/compiler.h:68:3: note: in definition of macro '__trace_if_value'
     (cond) ?     \
      ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
    #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
                               ^~~~~~~~~~~~~~
   drivers/tty/serial/sh-sci.c:3812:2: note: in expansion of macro 'if'
     if (sci_uart_driver.state)
     ^~


vim +55 include/linux/compiler.h

2bcd521a684cc94 Steven Rostedt 2008-11-21  49  
2bcd521a684cc94 Steven Rostedt 2008-11-21  50  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc94 Steven Rostedt 2008-11-21  51  /*
2bcd521a684cc94 Steven Rostedt 2008-11-21  52   * "Define 'is'", Bill Clinton
2bcd521a684cc94 Steven Rostedt 2008-11-21  53   * "Define 'if'", Steven Rostedt
2bcd521a684cc94 Steven Rostedt 2008-11-21  54   */
a15fd609ad53a63 Linus Torvalds 2019-03-20 @55  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a63 Linus Torvalds 2019-03-20  56  

:::::: The code at line 55 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
