Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF78014A4F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Jan 2025 04:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736916643; cv=none; b=QFE5A5ppjmHQYxbIlTkOyUUxmopnBzaVktRButY2G7n9nxMsAj187LmRjn09xbHh8iI9Agx0UNzS5KAPtfzMqkop7uDbHoTV1ifpfhQQWkD1GY+Ruki6xMXa53/L89Q0mwyJxDZUU1U0vEwWsulPyJ0Pf4wMHtemS5d65IVoMrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736916643; c=relaxed/simple;
	bh=ii4GC+t4Bfzd6eEnsHZqT6Cixs9nyqhjentCa0f7TF8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CDJrWoT+gC0dUAFcHVYqTFdXnmKTAqNDqRMew/lucO+OwW65zeHjgmAV4826DLzc9f0OuGGbaa333QL1QD7LgYbtT5bGH5/JUncnvTSS6gchBsY/zW2auC+Qtltf8LIrDAVgO8BXT4MSqg54VIuw0FCZk53GfABlMnlcVPcu63Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lEsbFgiE; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lEsbFgiE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736916641; x=1768452641;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ii4GC+t4Bfzd6eEnsHZqT6Cixs9nyqhjentCa0f7TF8=;
  b=lEsbFgiEl0zhGTOh+GITs/vivXoK8gmCGXvGBoUUvwClH6wooYg8c3BP
   b/Jn4Sso7ad6Cd9ki36u2AC8rRvUorJDadzhZ26eu3rRTmyP7ojs+AXW7
   Rt3hw/CLNDpekRX2WndcNyE4ztuyrXm9Bh7n3E2fvcxADkol2kifRD1Mg
   bovUzV/c4WfSZOWd0ihgOssTw4efHMSQdYV5va2SAPtJtIa3l0xL+1sq1
   f8H2LFa3DKWM0C9ckUQCG5zzO1a/DPtiW16JvfUzKT3IDt8LQt48TBiP5
   0d7HgyNfYO5M2VUBLy6Usnvf2k8MlAC/nfK6ov+6FT80qhRTMmoUcoes3
   w==;
X-CSE-ConnectionGUID: GVTbU+r1QS2QwyXUBdSJ5Q==
X-CSE-MsgGUID: tdznXxDrTuCa7IW6Bdx7Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36449280"
X-IronPort-AV: E=Sophos;i="6.12,316,1728975600"; 
   d="scan'208";a="36449280"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 20:50:40 -0800
X-CSE-ConnectionGUID: Uquz0HWhTHmPq6RsmuOaNw==
X-CSE-MsgGUID: sODfZkkeTXWi8mBS9Lddfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="109636086"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 Jan 2025 20:50:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXvMS-000PTL-2D;
	Wed, 15 Jan 2025 04:50:36 +0000
Date: Wed, 15 Jan 2025 12:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/suspend_notifier_lockdep 7/9]
 arch/x86/kvm/xen.c:176:23: error: 'struct kvm_vcpu_arch' has no member named
 'hv_clock'
Message-ID: <202501151235.zb8W7D89-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/sean-jc/linux x86/suspend_notifier_lockdep
head:   a3037d5fb8b4d3cdf1b29ac3eddbe45c3cdfb396
commit: fc7f5d6f4ee5e5dcbf10dd9087ebaa22ae330447 [7/9] KVM: x86: Remove per-vCPU "cache" of its reference pvclock
config: x86_64-randconfig-074-20250115 (https://download.01.org/0day-ci/archive/20250115/202501151235.zb8W7D89-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250115/202501151235.zb8W7D89-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501151235.zb8W7D89-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/xen.c: In function 'kvm_xen_start_timer':
>> arch/x86/kvm/xen.c:176:23: error: 'struct kvm_vcpu_arch' has no member named 'hv_clock'
     176 |         if (vcpu->arch.hv_clock.version && vcpu->kvm->arch.use_master_clock &&
         |                       ^
   arch/x86/kvm/xen.c:200:62: error: 'struct kvm_vcpu_arch' has no member named 'hv_clock'
     200 |                 guest_now = __pvclock_read_cycles(&vcpu->arch.hv_clock,
         |                                                              ^
   arch/x86/kvm/xen.c: In function 'kvm_xen_update_tsc_info':
   arch/x86/kvm/xen.c:2264:40: error: 'struct kvm_vcpu_arch' has no member named 'hv_clock'
    2264 |                 entry->ecx = vcpu->arch.hv_clock.tsc_to_system_mul;
         |                                        ^
   arch/x86/kvm/xen.c:2265:40: error: 'struct kvm_vcpu_arch' has no member named 'hv_clock'
    2265 |                 entry->edx = vcpu->arch.hv_clock.tsc_shift;
         |                                        ^


vim +176 arch/x86/kvm/xen.c

536395260582be Joao Martins    2022-03-03  152  
451a707813aee2 David Woodhouse 2024-02-27  153  static void kvm_xen_start_timer(struct kvm_vcpu *vcpu, u64 guest_abs,
451a707813aee2 David Woodhouse 2024-02-27  154  				bool linux_wa)
536395260582be Joao Martins    2022-03-03  155  {
451a707813aee2 David Woodhouse 2024-02-27  156  	int64_t kernel_now, delta;
451a707813aee2 David Woodhouse 2024-02-27  157  	uint64_t guest_now;
451a707813aee2 David Woodhouse 2024-02-27  158  
451a707813aee2 David Woodhouse 2024-02-27  159  	/*
451a707813aee2 David Woodhouse 2024-02-27  160  	 * The guest provides the requested timeout in absolute nanoseconds
451a707813aee2 David Woodhouse 2024-02-27  161  	 * of the KVM clock — as *it* sees it, based on the scaled TSC and
451a707813aee2 David Woodhouse 2024-02-27  162  	 * the pvclock information provided by KVM.
451a707813aee2 David Woodhouse 2024-02-27  163  	 *
451a707813aee2 David Woodhouse 2024-02-27  164  	 * The kernel doesn't support hrtimers based on CLOCK_MONOTONIC_RAW
451a707813aee2 David Woodhouse 2024-02-27  165  	 * so use CLOCK_MONOTONIC. In the timescales covered by timers, the
451a707813aee2 David Woodhouse 2024-02-27  166  	 * difference won't matter much as there is no cumulative effect.
451a707813aee2 David Woodhouse 2024-02-27  167  	 *
451a707813aee2 David Woodhouse 2024-02-27  168  	 * Calculate the time for some arbitrary point in time around "now"
451a707813aee2 David Woodhouse 2024-02-27  169  	 * in terms of both kvmclock and CLOCK_MONOTONIC. Calculate the
451a707813aee2 David Woodhouse 2024-02-27  170  	 * delta between the kvmclock "now" value and the guest's requested
451a707813aee2 David Woodhouse 2024-02-27  171  	 * timeout, apply the "Linux workaround" described below, and add
451a707813aee2 David Woodhouse 2024-02-27  172  	 * the resulting delta to the CLOCK_MONOTONIC "now" value, to get
451a707813aee2 David Woodhouse 2024-02-27  173  	 * the absolute CLOCK_MONOTONIC time at which the timer should
451a707813aee2 David Woodhouse 2024-02-27  174  	 * fire.
451a707813aee2 David Woodhouse 2024-02-27  175  	 */
451a707813aee2 David Woodhouse 2024-02-27 @176  	if (vcpu->arch.hv_clock.version && vcpu->kvm->arch.use_master_clock &&
451a707813aee2 David Woodhouse 2024-02-27  177  	    static_cpu_has(X86_FEATURE_CONSTANT_TSC)) {
451a707813aee2 David Woodhouse 2024-02-27  178  		uint64_t host_tsc, guest_tsc;
451a707813aee2 David Woodhouse 2024-02-27  179  
451a707813aee2 David Woodhouse 2024-02-27  180  		if (!IS_ENABLED(CONFIG_64BIT) ||
451a707813aee2 David Woodhouse 2024-02-27  181  		    !kvm_get_monotonic_and_clockread(&kernel_now, &host_tsc)) {
451a707813aee2 David Woodhouse 2024-02-27  182  			/*
451a707813aee2 David Woodhouse 2024-02-27  183  			 * Don't fall back to get_kvmclock_ns() because it's
451a707813aee2 David Woodhouse 2024-02-27  184  			 * broken; it has a systemic error in its results
451a707813aee2 David Woodhouse 2024-02-27  185  			 * because it scales directly from host TSC to
451a707813aee2 David Woodhouse 2024-02-27  186  			 * nanoseconds, and doesn't scale first to guest TSC
451a707813aee2 David Woodhouse 2024-02-27  187  			 * and *then* to nanoseconds as the guest does.
451a707813aee2 David Woodhouse 2024-02-27  188  			 *
451a707813aee2 David Woodhouse 2024-02-27  189  			 * There is a small error introduced here because time
451a707813aee2 David Woodhouse 2024-02-27  190  			 * continues to elapse between the ktime_get() and the
451a707813aee2 David Woodhouse 2024-02-27  191  			 * subsequent rdtsc(). But not the systemic drift due
451a707813aee2 David Woodhouse 2024-02-27  192  			 * to get_kvmclock_ns().
451a707813aee2 David Woodhouse 2024-02-27  193  			 */
451a707813aee2 David Woodhouse 2024-02-27  194  			kernel_now = ktime_get(); /* This is CLOCK_MONOTONIC */
451a707813aee2 David Woodhouse 2024-02-27  195  			host_tsc = rdtsc();
451a707813aee2 David Woodhouse 2024-02-27  196  		}
451a707813aee2 David Woodhouse 2024-02-27  197  
451a707813aee2 David Woodhouse 2024-02-27  198  		/* Calculate the guest kvmclock as the guest would do it. */
451a707813aee2 David Woodhouse 2024-02-27  199  		guest_tsc = kvm_read_l1_tsc(vcpu, host_tsc);
451a707813aee2 David Woodhouse 2024-02-27  200  		guest_now = __pvclock_read_cycles(&vcpu->arch.hv_clock,
451a707813aee2 David Woodhouse 2024-02-27  201  						  guest_tsc);
451a707813aee2 David Woodhouse 2024-02-27  202  	} else {
451a707813aee2 David Woodhouse 2024-02-27  203  		/*
451a707813aee2 David Woodhouse 2024-02-27  204  		 * Without CONSTANT_TSC, get_kvmclock_ns() is the only option.
451a707813aee2 David Woodhouse 2024-02-27  205  		 *
451a707813aee2 David Woodhouse 2024-02-27  206  		 * Also if the guest PV clock hasn't been set up yet, as is
451a707813aee2 David Woodhouse 2024-02-27  207  		 * likely to be the case during migration when the vCPU has
451a707813aee2 David Woodhouse 2024-02-27  208  		 * not been run yet. It would be possible to calculate the
451a707813aee2 David Woodhouse 2024-02-27  209  		 * scaling factors properly in that case but there's not much
451a707813aee2 David Woodhouse 2024-02-27  210  		 * point in doing so. The get_kvmclock_ns() drift accumulates
451a707813aee2 David Woodhouse 2024-02-27  211  		 * over time, so it's OK to use it at startup. Besides, on
451a707813aee2 David Woodhouse 2024-02-27  212  		 * migration there's going to be a little bit of skew in the
451a707813aee2 David Woodhouse 2024-02-27  213  		 * precise moment at which timers fire anyway. Often they'll
451a707813aee2 David Woodhouse 2024-02-27  214  		 * be in the "past" by the time the VM is running again after
451a707813aee2 David Woodhouse 2024-02-27  215  		 * migration.
451a707813aee2 David Woodhouse 2024-02-27  216  		 */
451a707813aee2 David Woodhouse 2024-02-27  217  		guest_now = get_kvmclock_ns(vcpu->kvm);
451a707813aee2 David Woodhouse 2024-02-27  218  		kernel_now = ktime_get();
451a707813aee2 David Woodhouse 2024-02-27  219  	}
451a707813aee2 David Woodhouse 2024-02-27  220  
451a707813aee2 David Woodhouse 2024-02-27  221  	delta = guest_abs - guest_now;
451a707813aee2 David Woodhouse 2024-02-27  222  
451a707813aee2 David Woodhouse 2024-02-27  223  	/*
451a707813aee2 David Woodhouse 2024-02-27  224  	 * Xen has a 'Linux workaround' in do_set_timer_op() which checks for
451a707813aee2 David Woodhouse 2024-02-27  225  	 * negative absolute timeout values (caused by integer overflow), and
451a707813aee2 David Woodhouse 2024-02-27  226  	 * for values about 13 days in the future (2^50ns) which would be
451a707813aee2 David Woodhouse 2024-02-27  227  	 * caused by jiffies overflow. For those cases, Xen sets the timeout
451a707813aee2 David Woodhouse 2024-02-27  228  	 * 100ms in the future (not *too* soon, since if a guest really did
451a707813aee2 David Woodhouse 2024-02-27  229  	 * set a long timeout on purpose we don't want to keep churning CPU
451a707813aee2 David Woodhouse 2024-02-27  230  	 * time by waking it up).  Emulate Xen's workaround when starting the
451a707813aee2 David Woodhouse 2024-02-27  231  	 * timer in response to __HYPERVISOR_set_timer_op.
451a707813aee2 David Woodhouse 2024-02-27  232  	 */
451a707813aee2 David Woodhouse 2024-02-27  233  	if (linux_wa &&
451a707813aee2 David Woodhouse 2024-02-27  234  	    unlikely((int64_t)guest_abs < 0 ||
451a707813aee2 David Woodhouse 2024-02-27  235  		     (delta > 0 && (uint32_t) (delta >> 50) != 0))) {
451a707813aee2 David Woodhouse 2024-02-27  236  		delta = 100 * NSEC_PER_MSEC;
451a707813aee2 David Woodhouse 2024-02-27  237  		guest_abs = guest_now + delta;
451a707813aee2 David Woodhouse 2024-02-27  238  	}
451a707813aee2 David Woodhouse 2024-02-27  239  
77c9b9dea4fb3e David Woodhouse 2023-09-30  240  	/*
77c9b9dea4fb3e David Woodhouse 2023-09-30  241  	 * Avoid races with the old timer firing. Checking timer_expires
77c9b9dea4fb3e David Woodhouse 2023-09-30  242  	 * to avoid calling hrtimer_cancel() will only have false positives
77c9b9dea4fb3e David Woodhouse 2023-09-30  243  	 * so is fine.
77c9b9dea4fb3e David Woodhouse 2023-09-30  244  	 */
77c9b9dea4fb3e David Woodhouse 2023-09-30  245  	if (vcpu->arch.xen.timer_expires)
77c9b9dea4fb3e David Woodhouse 2023-09-30  246  		hrtimer_cancel(&vcpu->arch.xen.timer);
77c9b9dea4fb3e David Woodhouse 2023-09-30  247  
536395260582be Joao Martins    2022-03-03  248  	atomic_set(&vcpu->arch.xen.timer_pending, 0);
536395260582be Joao Martins    2022-03-03  249  	vcpu->arch.xen.timer_expires = guest_abs;
536395260582be Joao Martins    2022-03-03  250  
451a707813aee2 David Woodhouse 2024-02-27  251  	if (delta <= 0)
536395260582be Joao Martins    2022-03-03  252  		xen_timer_callback(&vcpu->arch.xen.timer);
451a707813aee2 David Woodhouse 2024-02-27  253  	else
536395260582be Joao Martins    2022-03-03  254  		hrtimer_start(&vcpu->arch.xen.timer,
451a707813aee2 David Woodhouse 2024-02-27  255  			      ktime_add_ns(kernel_now, delta),
536395260582be Joao Martins    2022-03-03  256  			      HRTIMER_MODE_ABS_HARD);
536395260582be Joao Martins    2022-03-03  257  }
536395260582be Joao Martins    2022-03-03  258  

:::::: The code at line 176 was first introduced by commit
:::::: 451a707813aee24b4a734f28d1d414be0360862b KVM: x86/xen: improve accuracy of Xen timers

:::::: TO: David Woodhouse <dwmw@amazon.co.uk>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
