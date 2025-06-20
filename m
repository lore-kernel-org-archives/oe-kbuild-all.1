Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C86D226D19
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 08:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750409275; cv=none; b=EeZRHyiQb85JSLm8Vn3BhkMHr75sCo8dV6eOmF0VGCtJp2PwoUG7TG+ihdeRyPStVPAtNwUSWPWq66m9jTG2hbVOP940t67YRK6Gt1fxfQGfov1yazUBRI0xzq+ovOt2kkN/RnZWfKlE+0iPF7jhtZK3x9gMfxVSiMkQGGCrGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750409275; c=relaxed/simple;
	bh=oceSphah+d+/oiRw0YEOf0irpsx9lQ7SgVRjsoJCRWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BVrJctO7DLKS5gc7BAHzWXgvMSFcrrhr36uHbv+OYJbvTIMh9XwEY4/yuHGYB7NFFHscgNlaC47ZYfiGZj9Ta0zrKvXQB3heCVAYrKy08i6Fvt/+U66JeHHtj5G6RRz7qhwf0TVAJ6nwtcTd+t/OhRCqkVBQlDCB7oInmEb5pqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Je7uMl7+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Je7uMl7+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750409273; x=1781945273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oceSphah+d+/oiRw0YEOf0irpsx9lQ7SgVRjsoJCRWU=;
  b=Je7uMl7+nwKe0S7l7vpoeWjHIXdocxt21t5YaOAUkGbDLXQ1sVQG5HVQ
   J4vLiMNytMnBCyLO46jsPm5rQEvpUk21aQ1R8fGE4MQOMvYios4OWHyG3
   DOhXSxbuwc9RfibrjafTVsFc1n/dUeVl4cOoQY1Fd6cvCeEGGnSXB4KEY
   TzIyvDghycyijljZTqcXkSItcTkD6XNcY2YJxoAv4G7Fw0Ac9mZG5NoUq
   4loWQoEtG2f5o8sAm6uRjBHA2wRcmPANv09pHo8TngGZte9VbNRWdHktZ
   3GtuI2YhPcrplmL5NeFom3FNAkKnv/Jcy6Qp7Fz0FW0F7k+fZSLjM0025
   w==;
X-CSE-ConnectionGUID: ubR2NZ92QT63+ag/pOs0vA==
X-CSE-MsgGUID: qUyDj9cQTGCsoZXs5FQtVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="55297114"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="55297114"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:47:50 -0700
X-CSE-ConnectionGUID: ICmFrig8QFuDHYKlgne0Ng==
X-CSE-MsgGUID: 8y4uvgyJQnilodKmouHJ4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="156357528"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2025 01:47:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSXPX-000LX1-1M;
	Fri, 20 Jun 2025 08:47:47 +0000
Date: Fri, 20 Jun 2025 16:47:26 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 6/10]
 samples/ftrace/ftrace-direct-modify.c:305:23: error: too few arguments to
 function 'modify_ftrace_direct'
Message-ID: <202506201629.iqqzgKdR-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-005-20250620 (https://download.01.org/0day-ci/archive/20250620/202506201629.iqqzgKdR-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250620/202506201629.iqqzgKdR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506201629.iqqzgKdR-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

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
--
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
   samples/ftrace/ftrace-direct-multi-modify.c: In function 'simple_thread':
>> samples/ftrace/ftrace-direct-multi-modify.c:347:23: error: too few arguments to function 'modify_ftrace_direct'
     347 |                 ret = modify_ftrace_direct(&direct, tramps[t]);
         |                       ^~~~~~~~~~~~~~~~~~~~
   In file included from samples/ftrace/ftrace-direct-multi-modify.c:4:
   include/linux/ftrace.h:542:5: note: declared here
     542 | int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr, bool lock_direct_mutex);
         |     ^~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c: In function 'ftrace_direct_multi_init':
>> samples/ftrace/ftrace-direct-multi-modify.c:365:15: error: too few arguments to function 'register_ftrace_direct'
     365 |         ret = register_ftrace_direct(&direct, my_tramp);
         |               ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi-modify.c: In function 'ftrace_direct_multi_exit':
>> samples/ftrace/ftrace-direct-multi-modify.c:375:9: error: too few arguments to function 'unregister_ftrace_direct'
     375 |         unregister_ftrace_direct(&direct, my_tramp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
   samples/ftrace/ftrace-direct-multi.c: In function 'ftrace_direct_multi_init':
>> samples/ftrace/ftrace-direct-multi.c:228:16: error: too few arguments to function 'register_ftrace_direct'
     228 |         return register_ftrace_direct(&direct, (unsigned long) my_tramp);
         |                ^~~~~~~~~~~~~~~~~~~~~~
   In file included from samples/ftrace/ftrace-direct-multi.c:5:
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi.c: In function 'ftrace_direct_multi_exit':
>> samples/ftrace/ftrace-direct-multi.c:233:9: error: too few arguments to function 'unregister_ftrace_direct'
     233 |         unregister_ftrace_direct(&direct, (unsigned long) my_tramp, true);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   samples/ftrace/ftrace-direct-multi.c: In function 'ftrace_direct_multi_init':
>> samples/ftrace/ftrace-direct-multi.c:229:1: warning: control reaches end of non-void function [-Wreturn-type]
     229 | }
         | ^
--
   In file included from kernel/trace/trace.c:9078:
   kernel/trace/trace_selftest.c: In function 'trace_selftest_startup_function_graph':
>> kernel/trace/trace_selftest.c:1139:15: error: too few arguments to function 'register_ftrace_direct'
    1139 |         ret = register_ftrace_direct(&direct,
         |               ^~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace.c:31:
   include/linux/ftrace.h:539:5: note: declared here
     539 | int register_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr);
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/trace/trace_selftest.c:1162:15: error: too few arguments to function 'unregister_ftrace_direct'
    1162 |         ret = unregister_ftrace_direct(&direct,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/ftrace.h:540:5: note: declared here
     540 | int unregister_ftrace_direct(struct ftrace_ops *ops, unsigned long ip, unsigned long addr,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~


vim +/modify_ftrace_direct +305 samples/ftrace/ftrace-direct-modify.c

ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  292) 
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  293) static int simple_thread(void *arg)
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  294) {
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  295) 	static int t;
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  296) 	int ret = 0;
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  297) 
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  298) 	while (!kthread_should_stop()) {
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  299) 		set_current_state(TASK_INTERRUPTIBLE);
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  300) 		schedule_timeout(2 * HZ);
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  301) 
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  302) 		if (ret)
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  303) 			continue;
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  304) 		t ^= 1;
da8bdfbd422333 Florent Revest          2023-03-21 @305  		ret = modify_ftrace_direct(&direct, tramps[t]);
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  306) 		if (!ret)
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  307) 			my_tramp = tramps[t];
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  308) 		WARN_ON_ONCE(ret);
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  309) 	}
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  310) 
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  311) 	return 0;
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  312) }
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  313) 
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  314) static struct task_struct *simple_tsk;
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  315) 
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  316) static int __init ftrace_direct_init(void)
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  317) {
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  318) 	int ret;
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  319) 
23edf48309b14a Florent Revest          2023-03-21  320  	ftrace_set_filter_ip(&direct, (unsigned long) my_ip, 0, 0);
da8bdfbd422333 Florent Revest          2023-03-21 @321  	ret = register_ftrace_direct(&direct, my_tramp);
23edf48309b14a Florent Revest          2023-03-21  322  
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  323) 	if (!ret)
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  324) 		simple_tsk = kthread_run(simple_thread, NULL, "event-sample-fn");
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  325) 	return ret;
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  326) }
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  327) 
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  328) static void __exit ftrace_direct_exit(void)
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  329) {
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  330) 	kthread_stop(simple_tsk);
da8bdfbd422333 Florent Revest          2023-03-21 @331  	unregister_ftrace_direct(&direct, my_tramp, true);
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  332) }
ae0cc3b7e7f5e3 Steven Rostedt (VMware  2019-11-14  333) 

:::::: The code at line 305 was first introduced by commit
:::::: da8bdfbd422333fbb7c85ac1d7f18592d17d6665 ftrace: Rename _ftrace_direct_multi APIs to _ftrace_direct APIs

:::::: TO: Florent Revest <revest@chromium.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
