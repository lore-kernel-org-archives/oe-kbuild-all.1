Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C1B187E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 05:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691212339; x=1722748339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cj9QUPnMSC3QzUf5+xKLz0OtlqDYMpjdxbtiP+TM4jY=;
  b=JKp5nHxpHtk9OsonVGR4Lt8wBvLphcK6NvNvNL09YDyP2gbBzk4VmKL8
   WfxNSP4yv3ofs939Y0OCJh/HSQtIp+lXc72GROhJVRwQU/xPXb4nhlmTL
   ul1cgOvqhGOysGq+5eULYgrYYszjelzL2Q3dIgadbhwzp/PkJsb9LA3HU
   lra+b9nekL1a9Y+MJ1llfVeOI8Rlzc4cGdPrKahzGpHmTa0/UcU2GfcXY
   iBQgsk7KpXEI/8wmoqf6A/H6QXO7OwHQcb9XaORN1ryoztUPl2f382Aqm
   PtRxuyak9K8mz4IF97jKdLFfkZIm6OHlZ9lj88orwu7tbjWG3YUUAIP4F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="370280857"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="370280857"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 22:12:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733513796"
X-IronPort-AV: E=Sophos;i="6.01,256,1684825200"; 
   d="scan'208";a="733513796"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2023 22:12:16 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS9aJ-0003Kd-2D;
	Sat, 05 Aug 2023 05:12:15 +0000
Date: Sat, 5 Aug 2023 13:11:16 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 54/56] kernel/watchdog.c:526:25: error:
 too many arguments to function 'trigger_allbutcpu_cpu_backtrace'
Message-ID: <202308051325.L5GexhAl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   b1cb25d092e113f8a4424a37c94b1d41cb430511
commit: 0ca1d340a231ec8e8f2586c4bf2dc8c4f7d4ddc9 [54/56] nmi_backtrace: allow excluding an arbitrary CPU
config: sparc-randconfig-r036-20230731 (https://download.01.org/0day-ci/archive/20230805/202308051325.L5GexhAl-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051325.L5GexhAl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051325.L5GexhAl-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/watchdog.c: In function 'watchdog_timer_fn':
>> kernel/watchdog.c:526:25: error: too many arguments to function 'trigger_allbutcpu_cpu_backtrace'
     526 |                         trigger_allbutcpu_cpu_backtrace(smp_processor_id());
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/watchdog.c:17:
   include/linux/nmi.h:193:20: note: declared here
     193 | static inline bool trigger_allbutcpu_cpu_backtrace(void)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/trigger_allbutcpu_cpu_backtrace +526 kernel/watchdog.c

   441	
   442	/* watchdog kicker functions */
   443	static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
   444	{
   445		unsigned long touch_ts, period_ts, now;
   446		struct pt_regs *regs = get_irq_regs();
   447		int duration;
   448		int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
   449	
   450		if (!watchdog_enabled)
   451			return HRTIMER_NORESTART;
   452	
   453		watchdog_hardlockup_kick();
   454	
   455		/* kick the softlockup detector */
   456		if (completion_done(this_cpu_ptr(&softlockup_completion))) {
   457			reinit_completion(this_cpu_ptr(&softlockup_completion));
   458			stop_one_cpu_nowait(smp_processor_id(),
   459					softlockup_fn, NULL,
   460					this_cpu_ptr(&softlockup_stop_work));
   461		}
   462	
   463		/* .. and repeat */
   464		hrtimer_forward_now(hrtimer, ns_to_ktime(sample_period));
   465	
   466		/*
   467		 * Read the current timestamp first. It might become invalid anytime
   468		 * when a virtual machine is stopped by the host or when the watchog
   469		 * is touched from NMI.
   470		 */
   471		now = get_timestamp();
   472		/*
   473		 * If a virtual machine is stopped by the host it can look to
   474		 * the watchdog like a soft lockup. This function touches the watchdog.
   475		 */
   476		kvm_check_and_clear_guest_paused();
   477		/*
   478		 * The stored timestamp is comparable with @now only when not touched.
   479		 * It might get touched anytime from NMI. Make sure that is_softlockup()
   480		 * uses the same (valid) value.
   481		 */
   482		period_ts = READ_ONCE(*this_cpu_ptr(&watchdog_report_ts));
   483	
   484		/* Reset the interval when touched by known problematic code. */
   485		if (period_ts == SOFTLOCKUP_DELAY_REPORT) {
   486			if (unlikely(__this_cpu_read(softlockup_touch_sync))) {
   487				/*
   488				 * If the time stamp was touched atomically
   489				 * make sure the scheduler tick is up to date.
   490				 */
   491				__this_cpu_write(softlockup_touch_sync, false);
   492				sched_clock_tick();
   493			}
   494	
   495			update_report_ts();
   496			return HRTIMER_RESTART;
   497		}
   498	
   499		/* Check for a softlockup. */
   500		touch_ts = __this_cpu_read(watchdog_touch_ts);
   501		duration = is_softlockup(touch_ts, period_ts, now);
   502		if (unlikely(duration)) {
   503			/*
   504			 * Prevent multiple soft-lockup reports if one cpu is already
   505			 * engaged in dumping all cpu back traces.
   506			 */
   507			if (softlockup_all_cpu_backtrace) {
   508				if (test_and_set_bit_lock(0, &soft_lockup_nmi_warn))
   509					return HRTIMER_RESTART;
   510			}
   511	
   512			/* Start period for the next softlockup warning. */
   513			update_report_ts();
   514	
   515			pr_emerg("BUG: soft lockup - CPU#%d stuck for %us! [%s:%d]\n",
   516				smp_processor_id(), duration,
   517				current->comm, task_pid_nr(current));
   518			print_modules();
   519			print_irqtrace_events(current);
   520			if (regs)
   521				show_regs(regs);
   522			else
   523				dump_stack();
   524	
   525			if (softlockup_all_cpu_backtrace) {
 > 526				trigger_allbutcpu_cpu_backtrace(smp_processor_id());
   527				clear_bit_unlock(0, &soft_lockup_nmi_warn);
   528			}
   529	
   530			add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
   531			if (softlockup_panic)
   532				panic("softlockup: hung tasks");
   533		}
   534	
   535		return HRTIMER_RESTART;
   536	}
   537	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
