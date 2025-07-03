Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022EF2853E3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 04:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751515346; cv=none; b=ZvZHnFc9gFFt8tgC12Z7qqZkcOhg1fMqOPVIGcKpGHhYVhE6/ADL0CPVgDGzOX/cy2j5WIdmchED2j2d+02tz3lHxvoZUX0A08VKSx6WPuImavU0g7eJxaLpI1sZ0Wiq2okzOjrtJFiDh0oa5a2pF5yC+KylRvaEpqmb3DP4a/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751515346; c=relaxed/simple;
	bh=4Lpx9zmCAe+V9zhaSDl11OV2Ybn5HsCwfuWifYODQvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OrvYpvdxUD4K2TXw3P09Ge/9ppMOyE4h+hpBs6CJ50cIoLn1SBfU2REok+tjossVUR6VhA90TKRWVEJoIYTXw8/CTgABvwW9titFbzWOqUXV4VwrftCrLl+w8QMJWjUL6seLkz4fVJgIcPPUPfd5HssZwb+WKuxP4n8bRH5UDQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EXDKqjxl; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EXDKqjxl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751515344; x=1783051344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Lpx9zmCAe+V9zhaSDl11OV2Ybn5HsCwfuWifYODQvw=;
  b=EXDKqjxl0V7j1oALyXnLjy6UOfQ2cCr+eycp+dOVXQm0ls7YZJ68+bI1
   HTDzHzMvMhS1iRX4r6GRNXQO6Zt3bE4jsf6ChA+9QeFXS40dpdGK+Aq7B
   3ZhXLjL65bo5DuSyMhCB1piC9qGRxAQi+NMeWK43s6rc4NkGbjerx1exN
   smler8eouoXc7iX9N4P6JbLfdua5CtXMlifzwV3mL7qIR0VBCEPHNCEsG
   xf+hHBgQwnVsTBMf/TqqkwnV+hB4o7/gdWj0pliHRGYWj0Nr/c402r5IU
   w+v1mVsewPNC0m0sp56kr3xzmMV9l3prt1DRE56NkBaxHDqH+uuBqa+J5
   g==;
X-CSE-ConnectionGUID: /1JtlDkKQFarjUsF49/HoA==
X-CSE-MsgGUID: 1BRpCaDdQImBVq0G5kjVSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="79264070"
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="79264070"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 21:02:23 -0700
X-CSE-ConnectionGUID: kYG7eHMlTYm7X9W3CaEFKQ==
X-CSE-MsgGUID: beGGJ30lS6m8EY/1vJyvLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,283,1744095600"; 
   d="scan'208";a="158815705"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2025 21:02:22 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXB9P-0000Oj-2U;
	Thu, 03 Jul 2025 04:02:19 +0000
Date: Thu, 3 Jul 2025 06:01:29 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 6/10]
 samples/ftrace/ftrace-direct.c:210:16: error: too few arguments to function
 'register_ftrace_direct'
Message-ID: <202507030611.rhRhIU5m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   b288c6b15d20122d59ddf3bce2fb86afe6ed56c3
commit: 60f053ac0f246163e7330460f249edf54905e8cc [6/10] ftrace: Use direct hash interface in direct functions
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20250703/202507030611.rhRhIU5m-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250703/202507030611.rhRhIU5m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507030611.rhRhIU5m-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   samples/ftrace/ftrace-direct.c: In function 'ftrace_direct_init':
>> samples/ftrace/ftrace-direct.c:210:16: error: too few arguments to function 'register_ftrace_direct'
     210 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from samples/ftrace/ftrace-direct.c:5:
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct.c: In function 'ftrace_direct_exit':
>> samples/ftrace/ftrace-direct.c:215:9: error: too few arguments to function 'unregister_ftrace_direct'
     215 |         unregister_ftrace_direct(&direct, (unsigned long)my_tramp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct.c: In function 'ftrace_direct_init':
>> samples/ftrace/ftrace-direct.c:211:1: warning: control reaches end of non-void function [-Wreturn-type]
     211 | }
         | ^
--
   samples/ftrace/ftrace-direct-too.c: In function 'ftrace_direct_init':
>> samples/ftrace/ftrace-direct-too.c:243:16: error: too few arguments to function 'register_ftrace_direct'
     243 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from samples/ftrace/ftrace-direct-too.c:5:
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-too.c: In function 'ftrace_direct_exit':
>> samples/ftrace/ftrace-direct-too.c:248:9: error: too few arguments to function 'unregister_ftrace_direct'
     248 |         unregister_ftrace_direct(&direct, (unsigned long)my_tramp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-too.c: In function 'ftrace_direct_init':
>> samples/ftrace/ftrace-direct-too.c:244:1: warning: control reaches end of non-void function [-Wreturn-type]
     244 | }
         | ^
--
   samples/ftrace/ftrace-direct-modify.c: In function 'simple_thread':
>> samples/ftrace/ftrace-direct-modify.c:305:23: error: too few arguments to function 'modify_ftrace_direct'
     305 |                 ret = modify_ftrace_direct(&direct, tramps[t]);
         |                       ^~~~~~~~~~~~~~~~~~~~
   In file included from samples/ftrace/ftrace-direct-modify.c:4:
   include/linux/ftrace.h:542:5: note: declared here
     542 | int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr, bool lock_direct_mutex);
         |     ^~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-modify.c: In function 'ftrace_direct_init':
>> samples/ftrace/ftrace-direct-modify.c:321:15: error: too few arguments to function 'register_ftrace_direct'
     321 |         ret = register_ftrace_direct(&direct, my_tramp);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-modify.c: In function 'ftrace_direct_exit':
>> samples/ftrace/ftrace-direct-modify.c:331:9: error: too few arguments to function 'unregister_ftrace_direct'
     331 |         unregister_ftrace_direct(&direct, my_tramp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/register_ftrace_direct +210 samples/ftrace/ftrace-direct.c

23edf48309b14a Florent Revest          2023-03-21  205  
b06457c83af669 Steven Rostedt (VMware  2019-11-08  206) static int __init ftrace_direct_init(void)
b06457c83af669 Steven Rostedt (VMware  2019-11-08  207) {
23edf48309b14a Florent Revest          2023-03-21  208  	ftrace_set_filter_ip(&direct, (unsigned long) wake_up_process, 0, 0);
23edf48309b14a Florent Revest          2023-03-21  209  
da8bdfbd422333 Florent Revest          2023-03-21 @210  	return register_ftrace_direct(&direct, (unsigned long) my_tramp);
b06457c83af669 Steven Rostedt (VMware  2019-11-08 @211) }
b06457c83af669 Steven Rostedt (VMware  2019-11-08  212) 
b06457c83af669 Steven Rostedt (VMware  2019-11-08  213) static void __exit ftrace_direct_exit(void)
b06457c83af669 Steven Rostedt (VMware  2019-11-08  214) {
da8bdfbd422333 Florent Revest          2023-03-21 @215  	unregister_ftrace_direct(&direct, (unsigned long)my_tramp, true);
b06457c83af669 Steven Rostedt (VMware  2019-11-08  216) }
b06457c83af669 Steven Rostedt (VMware  2019-11-08  217) 

:::::: The code at line 210 was first introduced by commit
:::::: da8bdfbd422333fbb7c85ac1d7f18592d17d6665 ftrace: Rename _ftrace_direct_multi APIs to _ftrace_direct APIs

:::::: TO: Florent Revest <revest@chromium.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
