Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D591C862D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jul 2026 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209557; cv=none; b=MGM6A52dyCRiK3ukw72qpiLlacYoI4BPi6Ox0pwBE7XbDeRQdlO5mMPCmgi+p0DnsIAfufc5bpLvtw0eD37kIRR8S0lZZ19WHTi8oJzPwmLckww9cQGkwIHXFarENkGToYyZkMTEp3JJkWpPHcFkyndAMShjpXwRb+gxjk2mXsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209557; c=relaxed/simple;
	bh=ibqX90ubVtiNGdLo6fjWBSp0szOLOg0SOdBv8DkdTjA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UfQvl7arNu0h0krWih2jnwNuePgNp6uU9WkpLo0apnUHsdjQnA2icICDExiLTbakUmrXj5N0nRQnqzAo/12zdOLLL3z3Edjx7JATNjvVJacYnJfto6WLGyvtzBBnK9wh5+huISvl1SfzSiHbMTA4VGr371X+FJ+caCRgi5MyUEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiAyc5TR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiAyc5TR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785209556; x=1816745556;
  h=date:from:to:cc:subject:message-id;
  bh=ibqX90ubVtiNGdLo6fjWBSp0szOLOg0SOdBv8DkdTjA=;
  b=QiAyc5TRZUzCsjPFy/O1Oi4/62C6TAZPNapZn3mp0trjITk1crZmO7HO
   hJrEHaMAW4mEkhgjkTwqEc7Imn8XIPtcv3G/1qM0ci94H9ai/7/p1a/mF
   6HZEwt5w8RqaskSE1SrrQZOPN0GrtzWcVMRqEpd1xUaEwTL5GyH1qn5sx
   zNX1HvmEhLMUWlgoHUK45fvh5twrb13srnIje5mhBZRt8IXBOi3iinv1e
   sC2YxXidhuh/jvroGoqmYGuqGtFYooIwfWzII0MFbGvaj8KhBYYDHfOJr
   Wf4JRL4baM67zbD21CMPJwB/ngKZRQ2ErjFUab2ZnLwQIuZUeTfkfkFaa
   g==;
X-CSE-ConnectionGUID: TkMM0qbQTq+hcdxov3k+AQ==
X-CSE-MsgGUID: gneCjjvATPOHTMqjF5Sdhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84912512"
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="84912512"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2026 20:32:35 -0700
X-CSE-ConnectionGUID: 5M3f44oTT2iO8xi0ADxXog==
X-CSE-MsgGUID: scoVi2uCTSaBqJCQGin3Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,189,1779174000"; 
   d="scan'208";a="255643087"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Jul 2026 20:32:33 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woYYQ-000000001qw-3X09;
	Tue, 28 Jul 2026 03:32:30 +0000
Date: Tue, 28 Jul 2026 05:31:44 +0200
From: kernel test robot <lkp@intel.com>
To: Jack Allister <jalliste@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Paul Durrant <paul@xen.org>
Subject: [sean-jc:rev/get_set_guest_clock 112/112]
 arch/x86/kvm/x86.c:3429:66: error: 'struct kvm_vcpu_arch' has no member named
 'hw_tsc_hz'; did you mean 'hw_tsc_khz'?
Message-ID: <202607280534.UpV2YbcS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux rev/get_set_guest_clock
head:   9796c520977c647c82515987b362119c7c4593ed
commit: 9796c520977c647c82515987b362119c7c4593ed [112/112] KVM: x86: Add KVM_[GS]ET_CLOCK_GUEST for accurate KVM clock migration
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260728/202607280534.UpV2YbcS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260728/202607280534.UpV2YbcS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607280534.UpV2YbcS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_vcpu_ioctl_get_clock_guest':
>> arch/x86/kvm/x86.c:3429:66: error: 'struct kvm_vcpu_arch' has no member named 'hw_tsc_hz'; did you mean 'hw_tsc_khz'?
    3429 |         if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, v) || !vcpu->hw_tsc_hz) {
         |                                                                  ^~~~~~~~~
         |                                                                  hw_tsc_khz


vim +3429 arch/x86/kvm/x86.c

  3415	
  3416	
  3417	#ifdef CONFIG_X86_64
  3418	static int kvm_vcpu_ioctl_get_clock_guest(struct kvm_vcpu *v, void __user *argp)
  3419	{
  3420		struct pvclock_vcpu_time_info hv_clock = {};
  3421		struct kvm_vcpu_arch *vcpu = &v->arch;
  3422		struct kvm_arch *ka = &v->kvm->arch;
  3423		unsigned int seq;
  3424	
  3425		/*
  3426		 * If KVM_REQ_CLOCK_UPDATE is already pending, or if the pvclock
  3427		 * has never been generated at all, call kvm_guest_time_update().
  3428		 */
> 3429		if (kvm_check_request(KVM_REQ_CLOCK_UPDATE, v) || !vcpu->hw_tsc_hz) {
  3430			int idx = srcu_read_lock(&v->kvm->srcu);
  3431			int ret = kvm_guest_time_update(v);
  3432	
  3433			srcu_read_unlock(&v->kvm->srcu, idx);
  3434			if (ret)
  3435				return -EINVAL;
  3436		}
  3437	
  3438		/*
  3439		 * Reconstruct the pvclock from the master clock state, matching
  3440		 * exactly what kvm_guest_time_update() writes to the guest.
  3441		 */
  3442		do {
  3443			seq = read_seqcount_begin(&ka->pvclock_sc);
  3444	
  3445			if (!ka->use_master_clock)
  3446				return -EINVAL;
  3447	
  3448			hv_clock.tsc_timestamp = kvm_read_l1_tsc(v, ka->master_cycle_now);
  3449			hv_clock.system_time = ka->master_kernel_ns + ka->kvmclock_offset;
  3450		} while (read_seqcount_retry(&ka->pvclock_sc, seq));
  3451	
  3452		hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
  3453		hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
  3454		hv_clock.flags = PVCLOCK_TSC_STABLE_BIT;
  3455	
  3456		if (copy_to_user(argp, &hv_clock, sizeof(hv_clock)))
  3457			return -EFAULT;
  3458	
  3459		return 0;
  3460	}
  3461	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
