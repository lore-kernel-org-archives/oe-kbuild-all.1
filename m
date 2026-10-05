Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C9323E325
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791172020; cv=none; b=QMeYRbIpFpG9iutMzyGEykDRd43DysLkfewLO06xzrqZGinEzWNs8YMUIf+GBbcqG2gIJmAxQbERhMrdRBvKe7amchUSUO7h3VWGL6hDlP3V1yIBxkVX69ZcLrFyu8NrFwKyUKmWqTc4ZZDkDdGhybzyYLqQAOAbY9cjsG+2GPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791172020; c=relaxed/simple;
	bh=iIbdQV3RgZRtSmVE4rzHfwEW4TI/OecwYmrBTXgU+PY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bspR4A21x64eFqONirsaPyjqK48mqbCEX5Scg9ZKnZe5RzguX8oeG5yTnNAgpw02z/oEVeiB3XIqqjPqPvaODwYhCl1eMmEEINaCJ9LNpE43IXfgu1L1Vb5vp0cJpWyWaVCEN9mrQYVFMfTqcKxePHLdKiRIpn9V+GxPoqQJZ8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTNZGi6r; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTNZGi6r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791172018; x=1822708018;
  h=date:from:to:cc:subject:message-id;
  bh=iIbdQV3RgZRtSmVE4rzHfwEW4TI/OecwYmrBTXgU+PY=;
  b=LTNZGi6r5MNe0jnC+gu9moFctPtT6MkaqnNOnHEpBszzHuBecyg5wb4W
   NwziE4usFL88JCetL20EIVS+20yazLQUAc5X0+alGDJy1X0a+QmCT2Yms
   oqtMBB7R7HK7o0PduZxGqF0IxihhxggOybMooLomV7pFhh82qqQxpiWwx
   68uxGdw0KpqWHFXEOrC+i0NdI6HhuOWn3FDhN9zvc9bCgNNTA74Q03yNC
   p3DrnQq3732wt/VJObxZbUhNtaGWgy77rmUIt2wFf7izAJX4qN9c9id0o
   /o38AIVsde6zQdbDL11RVlZ9BjzIfO40EBJVUm1ZkTkL48NPV/nRMw4XJ
   A==;
X-CSE-ConnectionGUID: ZPKmJTeYRYKFocLaFHxCkA==
X-CSE-MsgGUID: 3CpFQVKYSO2xpnJi2c/pHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90869052"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90869052"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 20:46:57 -0700
X-CSE-ConnectionGUID: hLNMCxe3SCG4MxYrokYFOQ==
X-CSE-MsgGUID: VmkJGkIaTNWQ8WBU8VEx6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="281469821"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Oct 2026 20:46:56 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDZfB-00000000VJd-300P;
	Mon, 05 Oct 2026 03:46:53 +0000
Date: Mon, 05 Oct 2026 11:46:03 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:hardpps-filter-soak 15/23]
 drivers/pps/clients/pps-gpio-spin.c:259:28: error: 'struct pps_event_time'
 has no member named 'ts_raw'; did you mean 'ts_real'?
Message-ID: <202610051157.SbcmBsQA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux hardpps-filter-soak
head:   eef47b09d53ef553d3089bce6c9a0f6a9c792f29
commit: eb57681e2ecf93179ad3e658a98646183bfb9fdf [15/23] [TEST HACKS] mode-3 differential capture instrumentation
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20261005/202610051157.SbcmBsQA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051157.SbcmBsQA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051157.SbcmBsQA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/clock_inlined.h:5,
                    from drivers/pps/clients/pps-gpio-spin.c:52:
>> arch/x86/include/asm/tsc.h:70:28: error: conflicting types for 'cycles_t'; have 'long long unsigned int'
      70 | typedef unsigned long long cycles_t;
         |                            ^~~~~~~~
   In file included from arch/um/include/asm/timex.h:11,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/pps/clients/pps-gpio-spin.c:44:
   include/asm-generic/timex.h:8:23: note: previous declaration of 'cycles_t' with type 'cycles_t' {aka 'long unsigned int'}
       8 | typedef unsigned long cycles_t;
         |                       ^~~~~~~~
>> arch/x86/include/asm/tsc.h:77:24: error: conflicting types for 'get_cycles'; have 'cycles_t(void)' {aka 'long long unsigned int(void)'}
      77 | static inline cycles_t get_cycles(void)
         |                        ^~~~~~~~~~
   include/asm-generic/timex.h:10:24: note: previous definition of 'get_cycles' with type 'cycles_t(void)' {aka 'long unsigned int(void)'}
      10 | static inline cycles_t get_cycles(void)
         |                        ^~~~~~~~~~
   In file included from arch/x86/include/asm/tsc.h:9:
   arch/x86/include/asm/tsc.h: In function 'get_cycles':
   arch/um/include/asm/cpufeature.h:52:39: error: implicit declaration of function 'DISABLED_MASK_BIT_SET' [-Wimplicit-function-declaration]
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : _static_cpu_has(bit))
         |                                       ^~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/tsc.h:79:14: note: in expansion of macro 'cpu_feature_enabled'
      79 |         if (!cpu_feature_enabled(X86_FEATURE_TSC))
         |              ^~~~~~~~~~~~~~~~~~~
   arch/um/include/asm/cpufeature.h:115:17: error: implicit declaration of function '_static_cpu_has'; did you mean '__static_cpu_has'? [-Wimplicit-function-declaration]
     115 |                 _static_cpu_has(bit)                            \
         |                 ^~~~~~~~~~~~~~~
   arch/um/include/asm/cpufeature.h:52:72: note: in expansion of macro '_static_cpu_has'
      52 |         (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0 : _static_cpu_has(bit))
         |                                                                        ^~~~~~~~~~~~~~~
   arch/x86/include/asm/tsc.h:79:14: note: in expansion of macro 'cpu_feature_enabled'
      79 |         if (!cpu_feature_enabled(X86_FEATURE_TSC))
         |              ^~~~~~~~~~~~~~~~~~~
   drivers/pps/clients/pps-gpio-spin.c: In function 'spin_do_spin':
>> drivers/pps/clients/pps-gpio-spin.c:259:28: error: 'struct pps_event_time' has no member named 'ts_raw'; did you mean 'ts_real'?
     259 |                         ts.ts_raw = ktime_to_timespec64(xt.sys_monoraw);
         |                            ^~~~~~
         |                            ts_real
   drivers/pps/clients/pps-gpio-spin.c: In function 'spin3_start_fn':
>> drivers/pps/clients/pps-gpio-spin.c:336:13: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     336 |         d = kzalloc(sizeof(*d), GFP_KERNEL);
         |             ^~~~~~~
>> drivers/pps/clients/pps-gpio-spin.c:336:11: error: assignment to 'struct pps_gpio_spin *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     336 |         d = kzalloc(sizeof(*d), GFP_KERNEL);
         |           ^
>> drivers/pps/clients/pps-gpio-spin.c:342:17: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     342 |                 kfree(d);
         |                 ^~~~~


vim +259 drivers/pps/clients/pps-gpio-spin.c

   168	
   169	/* SPIN phase: IRQs-off busy wait across the edge, timestamp, pps_event */
   170	static ktime_t spin_do_spin(struct pps_gpio_spin *d)
   171	{
   172		struct pps_event_time ts;
   173		u64 c1 = 0, c2 = 0, cstamp = 0, cdone;
   174		unsigned long flags;
   175		ktime_t mono;
   176		long i;
   177		bool edge = false, applied = false;
   178	
   179		local_irq_save(flags);
   180		if (mode == 0) {
   181			pps_get_ts(&ts);	/* cache warm, discarded (as original) */
   182			for (i = 0; i < max_iter; i++) {
   183				if (gpiod_get_value(d->gpiod)) {
   184					edge = true;
   185					break;
   186				}
   187			}
   188			cstamp = arch_inlined_clocksource_read(NULL);
   189			if (edge)
   190				pps_get_ts(&ts);
   191		} else if (mode >= 2 && d->din) {
   192			u32 bit = BIT(din_bit);
   193	
   194			c2 = arch_inlined_clocksource_read(NULL);
   195			for (i = 0; i < max_iter; i++) {
   196				c1 = c2;
   197				if (readl_relaxed(d->din) & bit) {
   198					edge = true;
   199					c2 = arch_inlined_clocksource_read(NULL);
   200					break;
   201				}
   202				c2 = arch_inlined_clocksource_read(NULL);
   203			}
   204			cstamp = c1 + ((c2 - c1) >> 1);
   205		} else {
   206			c2 = arch_inlined_clocksource_read(NULL);
   207			for (i = 0; i < max_iter; i++) {
   208				c1 = c2;
   209				if (gpiod_get_value(d->gpiod)) {
   210					edge = true;
   211					c2 = arch_inlined_clocksource_read(NULL);
   212					break;
   213				}
   214				c2 = arch_inlined_clocksource_read(NULL);
   215			}
   216			cstamp = c1 + ((c2 - c1) >> 1);
   217		}
   218		mono = ktime_get();
   219		local_irq_restore(flags);
   220	
   221		/* i == 0: pulse already high at wake -- not a timed edge */
   222		if (!edge || i == 0) {
   223			pr_info_ratelimited("lost sync (edge=%d i=%ld), re-acquiring\n",
   224					    edge, i);
   225			d->state = ST_POLL;
   226			d->gpio_prev = 1;	/* don't trigger on the current pulse */
   227			d->have_last = false;
   228			return ns_to_ktime((s64)poll_us * 1000);
   229		}
   230	
   231		if (mode == 3) {
   232			/*
   233			 * Differential run: publish the capture for the pps-gpio
   234			 * hardirq (same pulse, runs a few us later on CPU0) and
   235			 * do NOT feed PPS -- the irq driver owns /dev/pps0.
   236			 */
   237			pps_spin3_seq++;
   238			smp_wmb();
   239			pps_spin3_count = cstamp;
   240			pps_spin3_bracket = c2 - c1;
   241			smp_wmb();
   242			pps_spin3_seq++;
   243			goto rearm;
   244		}
   245	
   246		if (mode >= 1) {
   247			struct system_time_snapshot snap;
   248			struct system_counterval_t scv = { };
   249			struct system_device_crosststamp xt;
   250	
   251			ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
   252			scv.cycles = cstamp;
   253			scv.cs_id = snap.cs_id;
   254			xt.clock_id = CLOCK_REALTIME;
   255			if (!get_device_system_crosststamp(spin_get_time, &scv,
   256					d->history_valid ? &d->history_snap : NULL,
   257					&xt)) {
   258				ts.ts_real = ktime_to_timespec64(xt.sys_systime);
 > 259				ts.ts_raw = ktime_to_timespec64(xt.sys_monoraw);
   260				applied = true;
   261			} else {
   262				pps_get_ts(&ts);	/* fallback: stamp now */
   263			}
   264			d->history_snap = snap;
   265			d->history_valid = true;
   266		}
   267	
   268		pps_event(d->pps, &ts, PPS_CAPTUREASSERT, NULL);
   269		cdone = arch_inlined_clocksource_read(NULL);
   270	
   271		/*
   272		 * TEST HACK: feed the per-pulse telemetry ring (same format as the
   273		 * irq driver's) so the bench dump and heartbeat see our pulses.
   274		 */
   275		{
   276			extern s64 pps_ntperr_ring[4096][6];
   277			extern unsigned int pps_ntperr_head;
   278			struct system_time_snapshot snap;
   279	
   280			ktime_get_snapshot_id(CLOCK_REALTIME, &snap);
   281			if (pps_ntperr_head < 4096) {
   282				s64 *row = pps_ntperr_ring[pps_ntperr_head++];
   283				s64 phase = ts.ts_real.tv_nsec;
   284	
   285				if (phase >= NSEC_PER_SEC / 2)
   286					phase -= NSEC_PER_SEC;
   287	
   288				row[0] = snap.ntp_error;
   289				row[1] = snap.tk_ntp_error;
   290				row[2] = snap.ntp_err_frac;
   291				row[3] = snap.cycle_delta;
   292				row[4] = phase;
   293				row[5] = snap.ntp_err_mult;
   294			}
   295		}
   296	
   297		printk_deferred(KERN_INFO "pps-gpio-spin: SPIN iters=%ld lat=%llu mode=%d applied=%d\n",
   298				i, mode == 0 ? cdone - cstamp : (c2 - c1) >> 1,
   299				mode, applied);
   300	
   301	rearm:
   302		/* re-arm: wake spin_us before the next expected edge */
   303		if (d->have_last) {
   304			ktime_t period = ktime_sub(mono, d->last_mono);
   305			s64 pns = ktime_to_ns(period);
   306	
   307			if (pns < (s64)interval_s * NSEC_PER_SEC / 2 ||
   308			    pns > (s64)interval_s * 3 * NSEC_PER_SEC / 2)
   309				period = ktime_set(interval_s, 0);
   310			d->last_mono = mono;
   311			return ktime_sub_ns(period, (s64)spin_us * 1000);
   312		}
   313		d->last_mono = mono;
   314		d->have_last = true;
   315		return ktime_sub_ns(ktime_set(interval_s, 0), (s64)spin_us * 1000);
   316	}
   317	
   318	static enum hrtimer_restart spin_fire(struct hrtimer *t)
   319	{
   320		struct pps_gpio_spin *d = container_of(t, struct pps_gpio_spin, timer);
   321		ktime_t next;
   322	
   323		if (d->state == ST_POLL)
   324			next = spin_do_poll(d);
   325		else
   326			next = spin_do_spin(d);
   327	
   328		hrtimer_forward_now(t, next);
   329		return HRTIMER_RESTART;
   330	}
   331	
   332	static void spin3_start_fn(struct work_struct *w)
   333	{
   334		struct pps_gpio_spin *d;
   335	
 > 336		d = kzalloc(sizeof(*d), GFP_KERNEL);
   337		if (!d)
   338			return;
   339		d->din = ioremap(din_phys, 4);
   340		if (!d->din) {
   341			pr_warn("mode 3: DIN ioremap failed\n");
 > 342			kfree(d);
   343			return;
   344		}
   345		d->state = ST_POLL;
   346		d->gpio_prev = 1;
   347		hrtimer_setup(&d->timer, spin_fire, CLOCK_MONOTONIC,
   348			      HRTIMER_MODE_REL_PINNED_HARD);
   349		spin3 = d;
   350		/* runs on CPU1 (schedule_work_on); PINNED keeps it here */
   351		hrtimer_start(&d->timer, ms_to_ktime(10),
   352			      HRTIMER_MODE_REL_PINNED_HARD);
   353		pr_info("mode 3 differential capture started on CPU%d\n",
   354			smp_processor_id());
   355	}
   356	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
