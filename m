Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4CDC8D2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 05:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I/+tck46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699422999; x=1730958999;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3K/a6x+aEhnFxIEXR21ODPpK6MM4vV5bGP/57BrKybE=;
  b=I/+tck46MpXz7eIzJS8iKJ1rvm/juq+JgtZ6mKsuB5jFIHMHh0MQn6B9
   cUAwRiMQpirUFmQwPRUQKuDcD6Vf5vAQudlhUkSfaxKXKs6nBlRW9PKsL
   bInxeDnDXG4f+4mvS+MeyTsFgyBooeNIUDOqeSxqHpe+GF1DClknzasWC
   Yv6AVI2RctNYFDQFVSp9BgHFlJUHdhOnLsioLXbI9i+801GgAfkzFRdEM
   1apR719fKmAdzVugb1drj3ZHXfMggXL4+IKOUah5TxbLbjRxxGQ5dXxpm
   z9GMDoKr9E8RCPL3wsgksMGnIbdNrEu+ga7KoYN3YRVMfL4aVRDBMz8zH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="8348755"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="8348755"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 21:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="712832519"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="712832519"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Nov 2023 21:56:36 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0bYI-0007im-0P;
	Wed, 08 Nov 2023 05:56:34 +0000
Date: Wed, 8 Nov 2023 13:55:21 +0800
From: kernel test robot <lkp@intel.com>
To: Waiman Long <longman@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202311081340.3k72KKdg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   305230142ae0637213bf6e04f6d9f10bbcb74af8
commit: c0a581d7126c0bbc96163276f585fd7b4e4d8d0e tracing: Disable interrupt or preemption before acquiring arch_spinlock_t
date:   1 year, 1 month ago
config: loongarch-randconfig-r123-20231107 (https://download.01.org/0day-ci/archive/20231108/202311081340.3k72KKdg-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231108/202311081340.3k72KKdg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081340.3k72KKdg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace.c:406:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:406:28: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:406:28: sparse:     got struct trace_export [noderef] __rcu **
   kernel/trace/trace.c:420:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct trace_export **list @@     got struct trace_export [noderef] __rcu ** @@
   kernel/trace/trace.c:420:33: sparse:     expected struct trace_export **list
   kernel/trace/trace.c:420:33: sparse:     got struct trace_export [noderef] __rcu **
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got unsigned int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got unsigned int [noderef] __percpu *
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got int [noderef] __percpu *
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got int [noderef] __percpu *
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got int [noderef] __percpu *
>> kernel/trace/trace.c:2430:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/trace/trace.c:2430:9: sparse:     expected void *ptr
   kernel/trace/trace.c:2430:9: sparse:     got int [noderef] __percpu *
   kernel/trace/trace.c:2879:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct event_filter *filter @@     got struct event_filter [noderef] __rcu *filter @@
   kernel/trace/trace.c:2879:38: sparse:     expected struct event_filter *filter
   kernel/trace/trace.c:2879:38: sparse:     got struct event_filter [noderef] __rcu *filter
   kernel/trace/trace.c:7354:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct ring_buffer_event *[noderef] __percpu * @@
   kernel/trace/trace.c:7354:20: sparse:     expected void *ptr
   kernel/trace/trace.c:7354:20: sparse:     got struct ring_buffer_event *[noderef] __percpu *
   kernel/trace/trace.c:7354:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct ring_buffer_event *[noderef] __percpu * @@
   kernel/trace/trace.c:7354:20: sparse:     expected void *ptr
   kernel/trace/trace.c:7354:20: sparse:     got struct ring_buffer_event *[noderef] __percpu *
   kernel/trace/trace.c:7354:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct ring_buffer_event *[noderef] __percpu * @@
   kernel/trace/trace.c:7354:20: sparse:     expected void *ptr
   kernel/trace/trace.c:7354:20: sparse:     got struct ring_buffer_event *[noderef] __percpu *
   kernel/trace/trace.c:7354:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got struct ring_buffer_event *[noderef] __percpu * @@
   kernel/trace/trace.c:7354:20: sparse:     expected void *ptr
   kernel/trace/trace.c:7354:20: sparse:     got struct ring_buffer_event *[noderef] __percpu *
   kernel/trace/trace.c:360:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:360:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:360:9: sparse:    struct trace_export *
   kernel/trace/trace.c:375:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/trace/trace.c:375:9: sparse:    struct trace_export [noderef] __rcu *
   kernel/trace/trace.c:375:9: sparse:    struct trace_export *

vim +2430 kernel/trace/trace.c

  2410	
  2411	static int trace_save_cmdline(struct task_struct *tsk)
  2412	{
  2413		unsigned tpid, idx;
  2414	
  2415		/* treat recording of idle task as a success */
  2416		if (!tsk->pid)
  2417			return 1;
  2418	
  2419		tpid = tsk->pid & (PID_MAX_DEFAULT - 1);
  2420	
  2421		/*
  2422		 * It's not the end of the world if we don't get
  2423		 * the lock, but we also don't want to spin
  2424		 * nor do we want to disable interrupts,
  2425		 * so if we miss here, then better luck next time.
  2426		 *
  2427		 * This is called within the scheduler and wake up, so interrupts
  2428		 * had better been disabled and run queue lock been held.
  2429		 */
> 2430		lockdep_assert_preemption_disabled();
  2431		if (!arch_spin_trylock(&trace_cmdline_lock))
  2432			return 0;
  2433	
  2434		idx = savedcmd->map_pid_to_cmdline[tpid];
  2435		if (idx == NO_CMDLINE_MAP) {
  2436			idx = (savedcmd->cmdline_idx + 1) % savedcmd->cmdline_num;
  2437	
  2438			savedcmd->map_pid_to_cmdline[tpid] = idx;
  2439			savedcmd->cmdline_idx = idx;
  2440		}
  2441	
  2442		savedcmd->map_cmdline_to_pid[idx] = tsk->pid;
  2443		set_cmdline(idx, tsk->comm);
  2444	
  2445		arch_spin_unlock(&trace_cmdline_lock);
  2446	
  2447		return 1;
  2448	}
  2449	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
