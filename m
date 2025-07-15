Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C882376F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Jul 2025 21:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752613602; cv=none; b=GEl+cbOG4KZWzSRUsS5TWEse2FkIXFcugeBwcmqAdtT1Vs4/bKOtMJozc9IINmzrBvnT+PNUVFRX26B+4w3h05xIC19lM+hBx7ytUDnAt3uTN0+ufSiDV2Fsmecp7vvHxFApFOyG9FA0rRMKcvksNUjiTjQiXRsFt9V31nSthUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752613602; c=relaxed/simple;
	bh=heVKCJwJfhpKufMzWyVfH9N6CXcoPK5SevbQ91zeNEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bvOdW1MZ0i8vVetDI+D6haYAaWyE+gfEvAi2r8sbbIqkmG2acawCCcL5KsTfnke6Wwvl3XsnLSMXkxp/UL2uprM/OfMIZyTDyB2EibXsQ/7k/ZPBpGqRASc3ScTNVDRGOK4TqW8YFQu2B7sjFncwhPBUMLE7TLg4i/LC2a8kZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHa8uKAv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHa8uKAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752613600; x=1784149600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=heVKCJwJfhpKufMzWyVfH9N6CXcoPK5SevbQ91zeNEU=;
  b=gHa8uKAv3qBOwIqW1SzbPB+44eXyBFVJ4KSizkJmZIhUXi7zb41y+Q0u
   NXjvuwDbNmhEpYp6UL4ZyKadqrCT0YKzeGWdQo/bT+5CYpyGDVUoPEcTJ
   hjjJcSY6Prc8DoPkRurYh+iPeR+qWf8wgyDpQKAkjtHcZ01FBwVmc1WbJ
   0CBp9Oxvk0VlOP3qyTh/getXPc+zTLm0ROrTiiXgMeeEtlnG7MUfjRyhS
   W4rBs/wSXfzcLGM0DQELaNB2lQde6WzOK/pfdPw7xU8uGr/aqVE6zZ9gh
   DxC3aNKF84LHHWj1dYxu7sHxdQaUeJjPuFcpl17K0hM7FTO40tfJ/h9/B
   Q==;
X-CSE-ConnectionGUID: /JVN8z/LThOJ+mmQX05LxA==
X-CSE-MsgGUID: 3KTRu/CGTDi44rx+KcQPlg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54784750"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="54784750"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 14:06:40 -0700
X-CSE-ConnectionGUID: V4IdyWNiT/C8aEryldda9w==
X-CSE-MsgGUID: O/O0dsmlT6GHSIRUL7LJLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; 
   d="scan'208";a="156732194"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Jul 2025 14:06:38 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubmrE-000BYB-1F;
	Tue, 15 Jul 2025 21:06:36 +0000
Date: Wed, 16 Jul 2025 05:05:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi 6/22]
 samples/ftrace/ftrace-direct.c:210:65: error: too few arguments to function
 call, expected 3, have 2
Message-ID: <202507160434.AbVo4o0Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi
head:   d0503d4013c49a3fde856947dfffe6c80c178eb1
commit: 2db96f9d6613f7591f4b57cedee812b64b5a9f39 [6/22] ftrace: Use direct hash interface in direct functions
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250716/202507160434.AbVo4o0Z-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250716/202507160434.AbVo4o0Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507160434.AbVo4o0Z-lkp@intel.com/

All errors (new ones prefixed by >>):

>> samples/ftrace/ftrace-direct.c:210:65: error: too few arguments to function call, expected 3, have 2
     210 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ~~~~~~~~~~~~~~~~~~~~~~                                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct.c:215:65: error: too few arguments to function call, expected 4, have 3
     215 |         unregister_ftrace_direct(&direct, (unsigned long)my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                                       ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> samples/ftrace/ftrace-direct-too.c:243:65: error: too few arguments to function call, expected 3, have 2
     243 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ~~~~~~~~~~~~~~~~~~~~~~                                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-too.c:248:65: error: too few arguments to function call, expected 4, have 3
     248 |         unregister_ftrace_direct(&direct, (unsigned long)my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                                       ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> samples/ftrace/ftrace-direct-modify.c:305:48: error: too few arguments to function call, expected 4, have 2
     305 |                 ret = modify_ftrace_direct(&direct, tramps[t]);
         |                       ~~~~~~~~~~~~~~~~~~~~                   ^
   include/linux/ftrace.h:542:5: note: 'modify_ftrace_direct' declared here
     542 | int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr, bool lock_direct_mutex);
         |     ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-modify.c:321:48: error: too few arguments to function call, expected 3, have 2
     321 |         ret = register_ftrace_direct(&direct, my_tramp);
         |               ~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-modify.c:331:50: error: too few arguments to function call, expected 4, have 3
     331 |         unregister_ftrace_direct(&direct, my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                        ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   3 errors generated.
--
>> samples/ftrace/ftrace-direct-multi.c:228:65: error: too few arguments to function call, expected 3, have 2
     228 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ~~~~~~~~~~~~~~~~~~~~~~                                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi.c:233:66: error: too few arguments to function call, expected 4, have 3
     233 |         unregister_ftrace_direct(&direct, (unsigned long) my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                                        ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> samples/ftrace/ftrace-direct-multi-modify.c:347:48: error: too few arguments to function call, expected 4, have 2
     347 |                 ret = modify_ftrace_direct(&direct, tramps[t]);
         |                       ~~~~~~~~~~~~~~~~~~~~                   ^
   include/linux/ftrace.h:542:5: note: 'modify_ftrace_direct' declared here
     542 | int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr, bool lock_direct_mutex);
         |     ^                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c:365:48: error: too few arguments to function call, expected 3, have 2
     365 |         ret = register_ftrace_direct(&direct, my_tramp);
         |               ~~~~~~~~~~~~~~~~~~~~~~                  ^
   include/linux/ftrace.h:539:5: note: 'register_ftrace_direct' declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c:375:50: error: too few arguments to function call, expected 4, have 3
     375 |         unregister_ftrace_direct(&direct, my_tramp, true);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~                        ^
   include/linux/ftrace.h:540:5: note: 'unregister_ftrace_direct' declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     541 |                              bool free_filters);
         |                              ~~~~~~~~~~~~~~~~~
   3 errors generated.


vim +210 samples/ftrace/ftrace-direct.c

23edf48309b14a Florent Revest          2023-03-21  205  
b06457c83af669 Steven Rostedt (VMware  2019-11-08  206) static int __init ftrace_direct_init(void)
b06457c83af669 Steven Rostedt (VMware  2019-11-08  207) {
23edf48309b14a Florent Revest          2023-03-21  208  	ftrace_set_filter_ip(&direct, (unsigned long) wake_up_process, 0, 0);
23edf48309b14a Florent Revest          2023-03-21  209  
da8bdfbd422333 Florent Revest          2023-03-21 @210  	return register_ftrace_direct(&direct, (unsigned long) my_tramp);
b06457c83af669 Steven Rostedt (VMware  2019-11-08  211) }
b06457c83af669 Steven Rostedt (VMware  2019-11-08  212) 

:::::: The code at line 210 was first introduced by commit
:::::: da8bdfbd422333fbb7c85ac1d7f18592d17d6665 ftrace: Rename _ftrace_direct_multi APIs to _ftrace_direct APIs

:::::: TO: Florent Revest <revest@chromium.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
