Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66AE2D627
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714303354; cv=none; b=TFpnZ6RoDJuS/NHNZuF/mZaReTrtaefziZFbNcX1lQMTtV7InDSvjXzb4ccVYfp00fzhNuNAE98AucBUaXL1jNsXrWLPhbHZgPFKe8IqQVMRomI61gsPL/3bQf6iRiqc0xixEg1y2WwYeZPCQEgY4nhMxA0KoIZKyRYd9D/i9wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714303354; c=relaxed/simple;
	bh=eecFLqyLhPQfRKXMgcrR7hr4A8s+tLSc0J0kwX9EfEE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrM4hRDxSxscFqrGm9scVekyXAKLCVSXhe5eSaequD+/y274eKqEKtC+xT2dE/ADpEku3R2pU0mCBuq9gj9xq31YHClZl8cmIQRqSH+Vwfk5tEwJYx2xgpUkctwFTgVL6lOkLsO8bnEqv0kq6pmE0yQFIk2TlE7tgacJuH6Ad1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cB/rB/cF; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cB/rB/cF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714303353; x=1745839353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eecFLqyLhPQfRKXMgcrR7hr4A8s+tLSc0J0kwX9EfEE=;
  b=cB/rB/cFKfjYzICnTui4LJsEBczN7hSrph1JZybh0A1XLaToYhFFknLz
   LG/5JFN+xyF5br9UNADWhl/t0d6fotaaxJMJRJITjV56vA8rpllLn1Dir
   Qe1FhUMcS9SZouvmRSB9gvmuBxKUYzLaQddPWVT2qYvkDlGn+6rSZfIl1
   4kBFHCniiQ13lJLi7aW1Os4zBo4HVD+nW3zbEFFi1hdSJSDKgHpZTRUWJ
   RQktYGucUxyUNHpVSgQJtOattHLlI/67eLDyLMOXvKr8U29+e/Olxpddi
   zp9qv0kr3nnB3VSuG8urV1zIyavPC6Q/FqkFo/q3N7QUwg/Pg1ZeZAy9b
   g==;
X-CSE-ConnectionGUID: OGdgTgN2RvuvdFGxeskwqA==
X-CSE-MsgGUID: wFjTuLhfSKmPajteCatLhg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21390382"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="21390382"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 04:22:32 -0700
X-CSE-ConnectionGUID: sfnVgoPXRDiOi1m9bTA7iw==
X-CSE-MsgGUID: KlSSt1cJSPixaLfRJT5AKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="26360990"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Apr 2024 04:22:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s12c0-0006Ki-2V;
	Sun, 28 Apr 2024 11:22:28 +0000
Date: Sun, 28 Apr 2024 19:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:clocks 15/15] arch/x86/kvm/x86.c:2574:33: error: implicit
 declaration of function 'kvm_use_master_clock'
Message-ID: <202404281959.AcCjYVJq-lkp@intel.com>
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
config: x86_64-randconfig-016-20240428 (https://download.01.org/0day-ci/archive/20240428/202404281959.AcCjYVJq-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281959.AcCjYVJq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281959.AcCjYVJq-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c:2521:34: error: unknown type name 'strut'; did you mean 'struct'?
    2521 | static bool kvm_use_master_clock(strut kvm *kvm)
         |                                  ^~~~~
         |                                  struct
   arch/x86/kvm/x86.c: In function 'kvm_track_tsc_matching':
>> arch/x86/kvm/x86.c:2574:33: error: implicit declaration of function 'kvm_use_master_clock' [-Werror=implicit-function-declaration]
    2574 |         bool use_master_clock = kvm_use_master_clock(kvm) &&
         |                                 ^~~~~~~~~~~~~~~~~~~~
>> arch/x86/kvm/x86.c:2574:54: error: 'kvm' undeclared (first use in this function)
    2574 |         bool use_master_clock = kvm_use_master_clock(kvm) &&
         |                                                      ^~~
   arch/x86/kvm/x86.c:2574:54: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +/kvm_use_master_clock +2574 arch/x86/kvm/x86.c

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
