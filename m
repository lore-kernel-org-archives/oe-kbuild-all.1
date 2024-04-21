Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E107205E22
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Apr 2024 02:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713667990; cv=none; b=BMyg+mHYZt7R4GA1IoxPiFkK0OGcMoses/BFaSTpijIPJiEkzEDQ8YWITr05cwzToJvu8WZ8rzs8QyTB0VPrfScoCeNURSJ5jWDQKDYQr00B8vbtbi6Qm24M6sN25farHrURhhrvwHuQZCvaTFxao6E6BTyFzKKg07NN982rApA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713667990; c=relaxed/simple;
	bh=K1rQcXRvUsFiQnchW3boCAbbwUSIrtAOiTQ4M2SUJGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rCExJIKgaCDoyFeGLKcnYUMyQKm0kVBpqzCN5SAeleLbd/kOtAM0fIQ14RysvNE19JniiOr9TcwLleYknFBv6Lb+rfNfnBa6yBc66s/sjEbTsZMegw6wpfvAMCfcsr77T6r8SMiXMA9qeipwjq1c8VRgR/hVXUyvaKgb06pbHAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k40nq1hE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k40nq1hE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713667988; x=1745203988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1rQcXRvUsFiQnchW3boCAbbwUSIrtAOiTQ4M2SUJGA=;
  b=k40nq1hEfLLJZ29NJ+GBI17cfJ5GwH7HZWqO2Uy2MVfSpN0rC6C6GJaQ
   Rz5Rf60eDIJFLIDoMM3tENoZRTYXEDYHr1WdDwKyDV5GNrtE2mSjXqroT
   sz1FQkoiS5ODbrpVjfumX5aVjRYTHUIYBhGgRUWGEbSvEPEqSCP01HEFc
   WgfuNz6y00QM+oMKveymPw3i2MuugwNHVInepkVolkrpTyBx5nvjfjX21
   fxwQNESGpAmYLBVi64mQ9NcegCsoejkfyHq+6Pv/Xvt9rM5RTkdPY4Xvu
   HueRo03ploz971sVba8np7WxbYMJKoGVMEUNttOmpOU9JDrHIfDiv+CvK
   Q==;
X-CSE-ConnectionGUID: DxJC0fcuSCKqhjlfaOo0zA==
X-CSE-MsgGUID: g6vZ8le6Ske9F8tjovH0qQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11050"; a="9098868"
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="9098868"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2024 19:53:08 -0700
X-CSE-ConnectionGUID: X8ouDTn8Sz2BoDbkwGrUVg==
X-CSE-MsgGUID: lLIdN38BTZmrIb4iFV0nIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,217,1708416000"; 
   d="scan'208";a="28151085"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 20 Apr 2024 19:53:07 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ryNKC-000Be2-1M;
	Sun, 21 Apr 2024 02:53:04 +0000
Date: Sun, 21 Apr 2024 10:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 11/11] arch/x86/kvm/x86.c:3326:30: error: implicit
 declaration of function 'kvm_get_time_and_clockread'; did you mean
 'kvm_get_monotonic_and_clockread'?
Message-ID: <202404211013.eNJo5v2S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   7bab23c8814416c795f40a0e495b5f44c2087ba5
commit: 20dd45ca0ab99bdb58e1fc8cd59cd609fd7d5e52 [11/11] KVM: x86: Fix software TSC upscaling in kvm_update_guest_time()
config: i386-randconfig-003-20240420 (https://download.01.org/0day-ci/archive/20240421/202404211013.eNJo5v2S-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240421/202404211013.eNJo5v2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404211013.eNJo5v2S-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_guest_time_update':
>> arch/x86/kvm/x86.c:3326:30: error: implicit declaration of function 'kvm_get_time_and_clockread'; did you mean 'kvm_get_monotonic_and_clockread'? [-Werror=implicit-function-declaration]
    3326 |                         if (!kvm_get_time_and_clockread(&now_kernel_ns, &now_host_tsc)) {
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                              kvm_get_monotonic_and_clockread
   cc1: some warnings being treated as errors


vim +3326 arch/x86/kvm/x86.c

  3275	
  3276		kernel_ns = 0;
  3277		host_tsc = 0;
  3278	
  3279		/*
  3280		 * If the host uses TSC clock, then passthrough TSC as stable
  3281		 * to the guest.
  3282		 */
  3283		do {
  3284			seq = read_seqcount_begin(&ka->pvclock_sc);
  3285			use_master_clock = ka->use_master_clock;
  3286			if (use_master_clock) {
  3287				host_tsc = ka->master_cycle_now;
  3288				kernel_ns = ka->master_kernel_ns;
  3289			}
  3290		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  3291	
  3292		/* Keep irq disabled to prevent changes to the clock */
  3293		local_irq_save(flags);
  3294		tgt_tsc_hz = get_cpu_tsc_khz() * 1000LL;
  3295		if (unlikely(tgt_tsc_hz == 0)) {
  3296			local_irq_restore(flags);
  3297			kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
  3298			return 1;
  3299		}
  3300		if (!use_master_clock) {
  3301			host_tsc = rdtsc();
  3302			kernel_ns = get_kvmclock_base_ns();
  3303		}
  3304	
  3305		/*
  3306		 * We may have to catch up the TSC to match elapsed wall clock
  3307		 * time for two reasons, even if kvmclock is used.
  3308		 *   1) CPU could have been running below the maximum TSC rate
  3309		 *   2) Broken TSC compensation resets the base at each VCPU
  3310		 *      entry to avoid unknown leaps of TSC even when running
  3311		 *      again on the same CPU.  This may cause apparent elapsed
  3312		 *      time to disappear, and the guest to stand still or run
  3313		 *	very slowly.
  3314		 */
  3315		if (vcpu->tsc_catchup) {
  3316			uint64_t now_guest_tsc_adjusted;
  3317			uint64_t now_guest_tsc_unadjusted;
  3318			int64_t now_guest_tsc_delta;
  3319	
  3320			tsc_timestamp = compute_guest_tsc(v, kernel_ns);
  3321	
  3322			if (use_master_clock) {
  3323				uint64_t now_host_tsc;
  3324				int64_t now_kernel_ns;
  3325	
> 3326				if (!kvm_get_time_and_clockread(&now_kernel_ns, &now_host_tsc)) {
  3327					now_kernel_ns = get_kvmclock_base_ns();
  3328					now_host_tsc = rdtsc();
  3329				}
  3330				now_guest_tsc_adjusted = compute_guest_tsc(v, now_kernel_ns);
  3331				now_guest_tsc_unadjusted = kvm_read_l1_tsc(v, now_host_tsc);
  3332			} else {
  3333				now_guest_tsc_adjusted = tsc_timestamp;
  3334				now_guest_tsc_unadjusted = kvm_read_l1_tsc(v, kernel_ns);
  3335			}
  3336	
  3337			now_guest_tsc_delta = now_guest_tsc_adjusted -
  3338				now_guest_tsc_unadjusted;
  3339	
  3340			if (now_guest_tsc_delta > 0)
  3341				adjust_tsc_offset_guest(v, now_guest_tsc_delta);
  3342		} else {
  3343			tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
  3344		}
  3345	
  3346		local_irq_restore(flags);
  3347	
  3348		/* With all the info we got, fill in the values */
  3349	
  3350		if (kvm_caps.has_tsc_control)
  3351			tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
  3352						   v->arch.l1_tsc_scaling_ratio);
  3353	
  3354		if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
  3355			kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
  3356					   &vcpu->hv_clock.tsc_shift,
  3357					   &vcpu->hv_clock.tsc_to_system_mul);
  3358			vcpu->hw_tsc_hz = tgt_tsc_hz;
  3359			kvm_xen_update_tsc_info(v);
  3360		}
  3361	
  3362		vcpu->hv_clock.tsc_timestamp = tsc_timestamp;
  3363		vcpu->hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
  3364		vcpu->last_guest_tsc = tsc_timestamp;
  3365	
  3366		/* If the host uses TSC clocksource, then it is stable */
  3367		pvclock_flags = 0;
  3368		if (use_master_clock)
  3369			pvclock_flags |= PVCLOCK_TSC_STABLE_BIT;
  3370	
  3371		vcpu->hv_clock.flags = pvclock_flags;
  3372	
  3373		if (vcpu->pv_time.active)
  3374			kvm_setup_guest_pvclock(v, &vcpu->pv_time, 0, false);
  3375	#ifdef CONFIG_KVM_XEN
  3376		if (vcpu->xen.vcpu_info_cache.active)
  3377			kvm_setup_guest_pvclock(v, &vcpu->xen.vcpu_info_cache,
  3378						offsetof(struct compat_vcpu_info, time),
  3379						xen_pvclock_tsc_unstable);
  3380		if (vcpu->xen.vcpu_time_info_cache.active)
  3381			kvm_setup_guest_pvclock(v, &vcpu->xen.vcpu_time_info_cache, 0,
  3382						xen_pvclock_tsc_unstable);
  3383	#endif
  3384		kvm_hv_setup_tsc_page(v->kvm, &vcpu->hv_clock);
  3385		return 0;
  3386	}
  3387	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
