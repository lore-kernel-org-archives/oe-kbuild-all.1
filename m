Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52F4214A9B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 May 2026 19:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777665356; cv=none; b=I3+6mCu20Duc3w2JL1x+cJIM1PE6D8BSlgVxyWYPZrZg6eJKLf5uvWova5uAOD/VqWDBXUimX7VS01YwSlQtFGYjqXdEKpW803lHKj44dyhDzmXFLS/Rb+BHqjoUFN38FDiRMZDwTqUopWXhGpnhCI1cd1mLkhlj5iUPtYUlKpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777665356; c=relaxed/simple;
	bh=Or3K5zqEQ1Y2w4HVOfM5TMIpr8lH9DzItMD2+P0zkKk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c4i7LtdNdA1BEP+IV24iFhua5ezvC7RAUUk/g8PMua4YO5+mLbfaEUa09KkDKFKIwU56yvAMvePpI8N+kjo7MtPCWiYBCqlOf0ISs8AiRlZAYUs5R9D04deRulUFxefRKkOW3V7wZuATJu+KlddDE1oGqrbTU017z08MFh+0iJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hHgoUky5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hHgoUky5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777665354; x=1809201354;
  h=date:from:to:cc:subject:message-id;
  bh=Or3K5zqEQ1Y2w4HVOfM5TMIpr8lH9DzItMD2+P0zkKk=;
  b=hHgoUky5VDGOevZsAC0vD4rDU/Dv31wnWThDVPD1c2dj01RkSt2lbi3p
   5bLKf0jsJi+2XG/t9CItY/vYYBYbCtZZ6zvE8eiP4yo7nMELFPGNXaJeq
   mYcZ2XEvuhrTKmfqhSSqv5DRLF9PniU/lOclJXO/QiA8YCt9T9kyJT39C
   nYqyaSyGT2Bh0/5Q7A8DU3wSD4vfpNGLgaTyL9NzeRHoFf4N96fWXGo6D
   /AFiQHxF5188ZBdWwW9tnuH8sMAYJW3z4RQPuXumwPV8mU7vlorELV+7g
   2rXDL5njioZZ2gUcZMYQeaWJTGW6zBGsmb4YJCvuRqN0FRcL690kBaz68
   A==;
X-CSE-ConnectionGUID: X8D+HhWsRjSolysMNr5vuQ==
X-CSE-MsgGUID: ziMSc6f2Ti2LhYeHnUDblQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="78618244"
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="78618244"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2026 12:55:54 -0700
X-CSE-ConnectionGUID: kcixGAb6SBeVrILo66hGMg==
X-CSE-MsgGUID: wXgndGEuQOuauBMSOm3JTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,210,1770624000"; 
   d="scan'208";a="258551026"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 May 2026 12:55:52 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wItxl-000000000op-2l58;
	Fri, 01 May 2026 19:55:49 +0000
Date: Sat, 02 May 2026 03:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kvmclock4 16/30] arch/x86/kvm/x86.c:3386:8: error:
 call to undeclared function 'kvm_get_time_and_clockread'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202605020352.78zvfhDe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock4
head:   0cb32bb9e5aca98889425721c283ce2fc3f3ff95
commit: 2cc092bad3decacbc01e30080a45933cd5ca64cc [16/30] KVM: x86: Restructure kvm_guest_time_update() for TSC upscaling
config: i386-randconfig-141-20260501 (https://download.01.org/0day-ci/archive/20260502/202605020352.78zvfhDe-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9065-ge9cc34fd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605020352.78zvfhDe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605020352.78zvfhDe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:3386:8: error: call to undeclared function 'kvm_get_time_and_clockread'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3386 |                     !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
         |                      ^
   arch/x86/kvm/x86.c:3386:8: note: did you mean 'kvm_get_monotonic_and_clockread'?
   arch/x86/kvm/x86.h:452:6: note: 'kvm_get_monotonic_and_clockread' declared here
     452 | bool kvm_get_monotonic_and_clockread(s64 *kernel_ns, u64 *tsc_timestamp);
         |      ^
   arch/x86/kvm/x86.c:3357:16: warning: unused variable 'flags' [-Wunused-variable]
    3357 |         unsigned long flags;
         |                       ^~~~~
   1 warning and 1 error generated.


vim +/kvm_get_time_and_clockread +3386 arch/x86/kvm/x86.c

  3353	
  3354	int kvm_guest_time_update(struct kvm_vcpu *v)
  3355	{
  3356		struct pvclock_vcpu_time_info hv_clock = {};
  3357		unsigned long flags;
  3358		u64 tgt_tsc_hz;
  3359		unsigned seq;
  3360		struct kvm_vcpu_arch *vcpu = &v->arch;
  3361		struct kvm_arch *ka = &v->kvm->arch;
  3362		s64 kernel_ns;
  3363		u64 tsc_timestamp, host_tsc;
  3364		u64 master_host_tsc = 0;
  3365		s64 master_kernel_ns = 0;
  3366		bool use_master_clock;
  3367	
  3368		/*
  3369		 * If the host uses TSC clock, then passthrough TSC as stable
  3370		 * to the guest.
  3371		 */
  3372		do {
  3373			seq = read_seqcount_begin(&ka->pvclock_sc);
  3374	
  3375			use_master_clock = ka->use_master_clock;
  3376	
  3377			/*
  3378			 * The TSC read and the call to get_cpu_tsc_khz() must happen
  3379			 * on the same CPU.
  3380			 */
  3381			get_cpu();
  3382	
  3383			tgt_tsc_hz = (u64)get_cpu_tsc_khz() * 1000;
  3384	
  3385			if (use_master_clock &&
> 3386			    !kvm_get_time_and_clockread(&kernel_ns, &host_tsc) &&
  3387			    WARN_ON_ONCE(!read_seqcount_retry(&ka->pvclock_sc, seq)))
  3388				use_master_clock = false;
  3389	
  3390			put_cpu();
  3391	
  3392			if (!use_master_clock)
  3393				break;
  3394	
  3395			master_host_tsc = ka->master_cycle_now;
  3396			master_kernel_ns = ka->master_kernel_ns;
  3397		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  3398	
  3399		if (unlikely(tgt_tsc_hz == 0)) {
  3400			kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
  3401			return 1;
  3402		}
  3403	
  3404		if (!use_master_clock) {
  3405			host_tsc = rdtsc();
  3406			kernel_ns = get_kvmclock_base_ns();
  3407		}
  3408	
  3409		/*
  3410		 * We may have to catch up the TSC to match elapsed wall clock
  3411		 * time for two reasons, even if kvmclock is used.
  3412		 *   1) CPU could have been running below the maximum TSC rate
  3413		 *   2) Broken TSC compensation resets the base at each VCPU
  3414		 *      entry to avoid unknown leaps of TSC even when running
  3415		 *      again on the same CPU.  This may cause apparent elapsed
  3416		 *      time to disappear, and the guest to stand still or run
  3417		 *      very slowly.
  3418		 */
  3419		if (vcpu->tsc_catchup) {
  3420			s64 adjustment;
  3421	
  3422			/*
  3423			 * Calculate the delta between what the guest TSC *should* be
  3424			 * and what it actually is according to kvm_read_l1_tsc().
  3425			 */
  3426			adjustment = compute_guest_tsc(v, kernel_ns) -
  3427				     kvm_read_l1_tsc(v, host_tsc);
  3428			if (adjustment > 0)
  3429				adjust_tsc_offset_guest(v, adjustment);
  3430		}
  3431	
  3432		/*
  3433		 * Now that TSC upscaling is out of the way, the remaining calculations
  3434		 * are all relative to the reference time that's placed in hv_clock.
  3435		 * If the master clock is NOT in use, the reference time is "now".  If
  3436		 * master clock is in use, the reference time comes from there.
  3437		 */
  3438		if (use_master_clock) {
  3439			host_tsc = master_host_tsc;
  3440			kernel_ns = master_kernel_ns;
  3441		}
  3442		tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
  3443	
  3444		/* With all the info we got, fill in the values */
  3445	
  3446		if (kvm_caps.has_tsc_control) {
  3447			tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
  3448						    v->arch.l1_tsc_scaling_ratio);
  3449			tgt_tsc_hz = tgt_tsc_hz ? : 1;
  3450		}
  3451	
  3452		if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
  3453			kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
  3454					   &vcpu->pvclock_tsc_shift,
  3455					   &vcpu->pvclock_tsc_mul);
  3456			vcpu->hw_tsc_hz = tgt_tsc_hz;
  3457		}
  3458	
  3459		hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
  3460		hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
  3461		hv_clock.tsc_timestamp = tsc_timestamp;
  3462		hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
  3463		vcpu->last_guest_tsc = tsc_timestamp;
  3464	
  3465		/* If the host uses TSC clocksource, then it is stable */
  3466		hv_clock.flags = 0;
  3467		if (use_master_clock)
  3468			hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
  3469	
  3470		if (vcpu->pv_time.active) {
  3471			/*
  3472			 * GUEST_STOPPED is only supported by kvmclock, and KVM's
  3473			 * historic behavior is to only process the request if kvmclock
  3474			 * is active/enabled.
  3475			 */
  3476			if (vcpu->pvclock_set_guest_stopped_request) {
  3477				hv_clock.flags |= PVCLOCK_GUEST_STOPPED;
  3478				vcpu->pvclock_set_guest_stopped_request = false;
  3479			}
  3480			kvm_setup_guest_pvclock(&hv_clock, v, &vcpu->pv_time, 0);
  3481	
  3482			hv_clock.flags &= ~PVCLOCK_GUEST_STOPPED;
  3483		}
  3484	
  3485		kvm_hv_setup_tsc_page(v->kvm, &hv_clock);
  3486	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
