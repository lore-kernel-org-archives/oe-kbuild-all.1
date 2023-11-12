Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3502217729
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 20:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhLoaRRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699819275; x=1731355275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8aqKMkX8/WHDBGjsYPZDCx0KJCx1JVnkq7F97tlGWco=;
  b=DhLoaRRNEz+UZI/QEE/yuu42kMFLScgYDStWGtThZP3qKTDp3S5AzuPH
   xcahBslBWQOhGlGV7zJmu9/tXK7SKWkxDvRLf4TGVeNZOo7CYEAr7C/oe
   e+aIKq9SHbdNLaZkMvGYZlB1iJnrjwXIu8lAwUoTUoX+WSmHTq6HFmO8r
   e3PievEKATBJr+BRqLhja4Y46Fvx7Bbgqz2urdzueL4iQ9HOSox7hu8lJ
   jFigRFRKk3yFZ1pXPMwVRqO7nxlHRLDj4bffRBNVb34xIivyj37s/4zOE
   zsWxq3qoEMu6x1kgX5Dh3C+Kipt1KJ8wsXixLBFLOnfbQ91Nnn2lsri4J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="476573253"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="476573253"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2023 12:01:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="937585399"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="937585399"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 12 Nov 2023 12:01:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2Gdq-000BTs-1R;
	Sun, 12 Nov 2023 20:01:10 +0000
Date: Mon, 13 Nov 2023 04:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.6.y-rt-rebase 142/184]
 kernel/printk/printk.c:2381:22: error: 'printk_threads_enabled' undeclared
Message-ID: <202311130313.Y13FKhwn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.6.y-rt-rebase
head:   7f644692ce0f1f283a272dff7543f45eb7ba37d8
commit: 91dc74f04c8f125c4e42796aff7a4e8d45a8cca3 [142/184] atomic print in printk context sometimes
config: i386-randconfig-002-20231111 (https://download.01.org/0day-ci/archive/20231113/202311130313.Y13FKhwn-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311130313.Y13FKhwn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311130313.Y13FKhwn-lkp@intel.com/

Note: the rt-devel/linux-6.6.y-rt-rebase HEAD 7f644692ce0f1f283a272dff7543f45eb7ba37d8 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/printk/printk.c: In function 'vprintk_emit':
>> kernel/printk/printk.c:2381:22: error: 'printk_threads_enabled' undeclared (first use in this function)
    2381 |                 if (!printk_threads_enabled ||
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2381:22: note: each undeclared identifier is reported only once for each function it appears in


vim +/printk_threads_enabled +2381 kernel/printk/printk.c

  2324	
  2325	asmlinkage int vprintk_emit(int facility, int level,
  2326				    const struct dev_printk_info *dev_info,
  2327				    const char *fmt, va_list args)
  2328	{
  2329		static atomic_t panic_noise_count = ATOMIC_INIT(0);
  2330	
  2331		int printed_len;
  2332		bool in_sched = false;
  2333	
  2334		/* Suppress unimportant messages after panic happens */
  2335		if (unlikely(suppress_printk))
  2336			return 0;
  2337	
  2338		if (other_cpu_in_panic()) {
  2339			if (unlikely(suppress_panic_printk))
  2340				return 0;
  2341	
  2342			/*
  2343			 * The messages on the panic CPU are the most important. If
  2344			 * non-panic CPUs are generating many messages, the panic
  2345			 * messages could get lost. Limit the number of non-panic
  2346			 * messages to approximately 1/4 of the ringbuffer.
  2347			 */
  2348			if (atomic_inc_return_relaxed(&panic_noise_count) >
  2349			    (1 << (prb->desc_ring.count_bits - 2))) {
  2350				suppress_panic_printk = 1;
  2351				return 0;
  2352			}
  2353		}
  2354	
  2355		if (level == LOGLEVEL_SCHED) {
  2356			level = LOGLEVEL_DEFAULT;
  2357			in_sched = true;
  2358		}
  2359	
  2360		printk_delay(level);
  2361	
  2362		printed_len = vprintk_store(facility, level, dev_info, fmt, args);
  2363	
  2364		/*
  2365		 * There are 3 situations where nbcon atomic printing should happen in
  2366		 * the printk() caller context:
  2367		 *
  2368		 * 1. When booting, before the printing threads have been started.
  2369		 *
  2370		 * 2. During shutdown, since the printing threads may not get a
  2371		 *    chance to print the final messages.
  2372		 *
  2373		 * 3. When this CPU is in panic.
  2374		 *
  2375		 * Note that if boot consoles are registered (have_boot_console), the
  2376		 * console_lock/console_unlock dance must be relied upon instead
  2377		 * because nbcon consoles cannot print simultaneously with boot
  2378		 * consoles.
  2379		 */
  2380		if (!have_boot_console) {
> 2381			if (!printk_threads_enabled ||
  2382			    (system_state > SYSTEM_RUNNING) ||
  2383			    this_cpu_in_panic()) {
  2384				preempt_disable();
  2385				nbcon_atomic_flush_all();
  2386				preempt_enable();
  2387			}
  2388		}
  2389	
  2390		nbcon_wake_threads();
  2391	
  2392		/* If called from the scheduler, we can not call up(). */
  2393		if (!in_sched) {
  2394			/*
  2395			 * The caller may be holding system-critical or
  2396			 * timing-sensitive locks. Disable preemption during
  2397			 * printing of all remaining records to all consoles so that
  2398			 * this context can return as soon as possible. Hopefully
  2399			 * another printk() caller will take over the printing.
  2400			 */
  2401			preempt_disable();
  2402			if (nbcon_get_default_prio() != NBCON_PRIO_EMERGENCY) {
  2403				/*
  2404				 * Try to acquire and then immediately release the
  2405				 * console semaphore. The release will print out
  2406				 * buffers. With the spinning variant, this context
  2407				 * tries to take over the printing from another
  2408				 * printing context.
  2409				 */
  2410				if (console_trylock_spinning())
  2411					console_unlock();
  2412			}
  2413			preempt_enable();
  2414		}
  2415	
  2416		if (in_sched)
  2417			defer_console_output();
  2418		else
  2419			wake_up_klogd();
  2420	
  2421		return printed_len;
  2422	}
  2423	EXPORT_SYMBOL(vprintk_emit);
  2424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
