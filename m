Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C21419F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 05:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714281012; cv=none; b=c5VPOlT3LTZECZr0OSkz202ckCx8gmHi2pyH4CQJ/iJO/8YZzCNM3cYIr9qnP/4gDgirOkVDDcMvRVrF7Wo54QkD5zIefcyDwQUwNOhGSPZsrNEq1bbd3R8n5Zn231HF8BncVnHLuC+bVmvizFYA7asZqInnNFXI3wf+LdLsJnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714281012; c=relaxed/simple;
	bh=Ks7Fqsk/CiKyQpwyGfQWlslmJYTK8pHyyLcZAxxIaJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MkeA5s/eEwtVbNIo/81euJkJ3Y9kucUA0L7y0uxUxmByYQSXLGZ+i5REsR28rfToWWFheHqytLRQfTqtyOnc+9parODuQsJtvgg4VoPWzjwRO1nUc8qLpKjtqNeNHHkWDtQMLLFU8ikRhgneNQ7Z7HtekeYNMj4vw1dZgQSgKgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wl8N7swI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wl8N7swI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714281011; x=1745817011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ks7Fqsk/CiKyQpwyGfQWlslmJYTK8pHyyLcZAxxIaJ8=;
  b=Wl8N7swI+Gvu726EJtyBaOAr27h8rGLG3NGOqawT9BJkYJQbedNuUsHe
   ucJODc2m0HhUhc02YNuoEbr48WjJIILfMP6cUjbxULePBiHvVyP6v0WS3
   6UaP2sxEU6X2p0PyIP4YmXzpbm3khAYwCR2iCpIIPpSm+chfm/vOp0B/y
   llsaat4J6Ejngj0mRV8DFjf0oaGRy95P8KHhjDeBqxdjeVFbakvW9gg0r
   1Qa0UgLWj26OaegLLB2jty6Wia1LDEf+MVfCgqfzA0MnPa5S7IMK+mfDT
   4eQOpyfbYBpieGN4g/sUUizBPC4KD6auar0S2jE+WOYURxfOEvoQR4hO4
   A==;
X-CSE-ConnectionGUID: 7aXllwtsQF2Dx4eGRTM5vw==
X-CSE-MsgGUID: qY1kBFlpQsSQ3dQ+YaurRA==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9833492"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="9833492"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 22:10:10 -0700
X-CSE-ConnectionGUID: GVVELCTpQAayYw1TGoO60Q==
X-CSE-MsgGUID: 5d+2i8HQQ5Gg9kADe4xwDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="26305266"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2024 22:10:09 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0wne-0005r8-0t;
	Sun, 28 Apr 2024 05:10:06 +0000
Date: Sun, 28 Apr 2024 13:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 15/15] arch/x86/kvm/x86.c:2521:34: error: unknown type
 name 'strut'; did you mean 'struct'?
Message-ID: <202404281304.oWqWHROE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux clocks
head:   ef986166676fc60d0f597cab97a08d4fb232f83b
commit: ef986166676fc60d0f597cab97a08d4fb232f83b [15/15] KVM: x86: Factor out kvm_use_master_clock()
config: x86_64-randconfig-161-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281304.oWqWHROE-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281304.oWqWHROE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281304.oWqWHROE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kvm/x86.c:2521:34: error: unknown type name 'strut'; did you mean 'struct'?
    2521 | static bool kvm_use_master_clock(strut kvm *kvm)
         |                                  ^~~~~
         |                                  struct
>> arch/x86/kvm/x86.c:2574:47: error: use of undeclared identifier 'kvm'
    2574 |         bool use_master_clock = kvm_use_master_clock(kvm) &&
         |                                                      ^
   2 errors generated.


vim +2521 arch/x86/kvm/x86.c

  2520	
> 2521	static bool kvm_use_master_clock(strut kvm *kvm)
  2522	{
  2523		struct kvm_arch *ka = &kvm->arch;
  2524	
  2525		/*
  2526		 * The 'old kvmclock' check is a workaround (from 2015) for a
  2527		 * SUSE 2.6.16 kernel that didn't boot if the system_time in
  2528		 * its kvmclock was too far behind the current time. So the
  2529		 * mode of just setting the reference point and allowing time
  2530		 * to proceed linearly from there makes it fail to boot.
  2531		 * Despite that being kind of the *point* of the way the clock
  2532		 * is exposed to the guest. By coincidence, the offending
  2533		 * kernels used the old MSR_KVM_SYSTEM_TIME, which was moved
  2534		 * only because it resided in the wrong number range. So the
  2535		 * workaround is activated for *all* guests using the old MSR.
  2536		 */
  2537		return ka->all_vcpus_matched_tsc &&
  2538			!ka->backwards_tsc_observed &&
  2539			!ka->boot_vcpu_runs_old_kvmclock;
  2540	}
  2541	
  2542	static void kvm_track_tsc_matching(struct kvm_vcpu *vcpu)
  2543	{
  2544	#ifdef CONFIG_X86_64
  2545		struct kvm_arch *ka = &vcpu->kvm->arch;
  2546		struct pvclock_gtod_data *gtod = &pvclock_gtod_data;
  2547		struct kvm_vcpu *v;
  2548		unsigned long i;
  2549		bool matched = true;
  2550	
  2551		lockdep_assert_held(&vcpu->kvm->arch.tsc_write_lock);
  2552	
  2553		/*
  2554		 * When called via kvm_arch_vcpu_create() for a new vCPU, the count
  2555		 * in kvm->online_vcpus will not yet have been incremented and the
  2556		 * kvm_for_each_vcpu() loop will not iterate over 'vcpu'.
  2557		 *
  2558		 * The right thing still happens in that case, because a match will
  2559		 * be found only if the new vCPU's TSC is at the same rate as *all*
  2560		 * the existing vCPUs' TSCs.
  2561		 */
  2562		kvm_for_each_vcpu(i, v, vcpu->kvm) {
  2563			if (v->arch.virtual_tsc_khz != vcpu->arch.virtual_tsc_khz) {
  2564				matched = false;
  2565				break;
  2566			}
  2567		}
  2568		ka->all_vcpus_matched_tsc = matched;
  2569	
  2570		/*
  2571		 * To use the masterclock, the host clocksource must be based on TSC
  2572		 * and all vCPUs must have matching TSC frequencies.
  2573		 */
> 2574		bool use_master_clock = kvm_use_master_clock(kvm) &&
  2575					gtod_is_based_on_tsc(gtod->clock.vclock_mode);
  2576	
  2577		/*
  2578		 * Request a masterclock update if the masterclock needs to be toggled
  2579		 * on/off.
  2580		 */
  2581		if ((ka->use_master_clock != use_master_clock))
  2582			kvm_make_request(KVM_REQ_MASTERCLOCK_UPDATE, vcpu);
  2583	
  2584		trace_kvm_track_tsc(vcpu->vcpu_id, ka->all_vcpus_matched_tsc,
  2585				    atomic_read(&vcpu->kvm->online_vcpus),
  2586			            ka->use_master_clock, gtod->clock.vclock_mode);
  2587	#endif
  2588	}
  2589	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
