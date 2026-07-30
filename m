Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A3238654F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 08:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785399724; cv=none; b=SEfA9cnyQTVAgCoE/Nkfqnl8K515t4DcA8nz9T4JLeMk8WVr2pRGwVZ66OKpuskpfGNKx4kI4xqwo0m1dudjMV9tT2ID1JNN1koqt15nxICrisl3wvOo0evRFkexFxmPbfRRma/eBGrnJDn1wlvph+LP+yMlDQ61iAt9+AlSDjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785399724; c=relaxed/simple;
	bh=b3kkgpubifgAL/DIIz4YKOl693JEtITMV/mkz9WUV6s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kiHhl4t+c4prxrOUbjxIGOvmcoU2DyTlsnTTztSRly5qMJEiMqtls8wNqsJ8dSq3Sr3Rmsy92znpltXfL0BnXRwBa+xD8EwWdIO9xdIGQtC82BxcTurISxvHVDkXWlkLgK377keoJk0BDiDF36azUDX/mx4d5b8YLxdtXTe/q4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1Vh3tU6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1Vh3tU6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785399722; x=1816935722;
  h=date:from:to:cc:subject:message-id;
  bh=b3kkgpubifgAL/DIIz4YKOl693JEtITMV/mkz9WUV6s=;
  b=K1Vh3tU67smhIlPHc/ZV+FgOz4+txYNo1buwTOcqh/3RRGTm5/mIOdx4
   XrQCUPu85eaWET09dyoCbRMEZsqsBbnTXwfhDP9T9W36Pc0V8jYOh/IYn
   QD7azHSe6u3cQyHJ38momYdQjyz3RnKN6TYG0HTNKpQkJvb636FjKa/eB
   tihhZPhycy1n9tApXa+O0443tl2vHJH3taID2Gkfcwqq36Lh/F44QF+8o
   s/oQ30aZia+y0eUvJiSTPo5cTgxAJ0KF/gB/tdiqio0eAMS+BsMS5S+4u
   fkqw5Oc9fVX+MCuQSukR3zHVn+47wkNj5JEvlS54U/eZSrPXAjPkkDAV7
   w==;
X-CSE-ConnectionGUID: FG4hBxnqSx6q/WjWkd94qw==
X-CSE-MsgGUID: 9z/8wdQsSEGYWm1sX0ao4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="86091280"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="86091280"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 01:22:02 -0700
X-CSE-ConnectionGUID: NFAjZQshSXW/6w7/sw0kMQ==
X-CSE-MsgGUID: iOoi2WDyTzqsh8ZREoATlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="258997704"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Jul 2026 01:22:01 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpM1e-00000000gHM-0h2u;
	Thu, 30 Jul 2026 08:21:58 +0000
Date: Thu, 30 Jul 2026 16:21:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/host_kvmclock_mess 13/15]
 arch/x86/kvm/x86.c:1898:13: error: 'ka' undeclared
Message-ID: <202607301649.iChHivfM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/sean-jc/linux x86/host_kvmclock_mess
head:   1874dce49fd558c97bf46e9d2a7e635c5158f74a
commit: cf8c84f746b298279341d445ea410332b25c6395 [13/15] KVM: x86: Make master clock logic in guest PV clock updates 64-bit only
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260730/202607301649.iChHivfM-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607301649.iChHivfM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607301649.iChHivfM-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/x86.c: In function 'kvm_guest_time_update':
>> arch/x86/kvm/x86.c:1898:13: error: 'ka' undeclared (first use in this function)
    1898 |         if (ka->xen.hvm_config.flags & KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE)
         |             ^~
   arch/x86/kvm/x86.c:1898:13: note: each undeclared identifier is reported only once for each function it appears in


vim +/ka +1898 arch/x86/kvm/x86.c

66570e966dd9cb4 Oliver Upton        2020-08-18  1779  
7a268308015843c Sean Christopherson 2026-06-12  1780  int kvm_guest_time_update(struct kvm_vcpu *v)
7a268308015843c Sean Christopherson 2026-06-12  1781  {
7a268308015843c Sean Christopherson 2026-06-12  1782  	struct pvclock_vcpu_time_info hv_clock = {};
1e70cb5a00c624f David Woodhouse     2026-07-28  1783  	u64 tgt_tsc_hz;
7a268308015843c Sean Christopherson 2026-06-12  1784  	struct kvm_vcpu_arch *vcpu = &v->arch;
7a268308015843c Sean Christopherson 2026-06-12  1785  	s64 kernel_ns;
7a268308015843c Sean Christopherson 2026-06-12  1786  	u64 tsc_timestamp, host_tsc;
66570e966dd9cb4 Oliver Upton        2020-08-18  1787  
68c35f89d016dd0 Maxim Levitsky      2025-10-14  1788  	/*
7a268308015843c Sean Christopherson 2026-06-12  1789  	 * If the host uses TSC clock, then passthrough TSC as stable
7a268308015843c Sean Christopherson 2026-06-12  1790  	 * to the guest.
68c35f89d016dd0 Maxim Levitsky      2025-10-14  1791  	 */
cf8c84f746b2982 Sean Christopherson 2026-07-29  1792  #ifdef CONFIG_X86_64
cf8c84f746b2982 Sean Christopherson 2026-07-29  1793  	struct kvm_arch *ka = &v->kvm->arch;
cf8c84f746b2982 Sean Christopherson 2026-07-29  1794  	bool use_master_clock;
cf8c84f746b2982 Sean Christopherson 2026-07-29  1795  	unsigned seq;
cf8c84f746b2982 Sean Christopherson 2026-07-29  1796  
7a268308015843c Sean Christopherson 2026-06-12  1797  	do {
7a268308015843c Sean Christopherson 2026-06-12  1798  		seq = read_seqcount_begin(&ka->pvclock_sc);
7a268308015843c Sean Christopherson 2026-06-12  1799  		use_master_clock = ka->use_master_clock;
7a268308015843c Sean Christopherson 2026-06-12  1800  		if (use_master_clock) {
7a268308015843c Sean Christopherson 2026-06-12  1801  			host_tsc = ka->master_cycle_now;
7a268308015843c Sean Christopherson 2026-06-12  1802  			kernel_ns = ka->master_kernel_ns;
557a961abbe06ed Vitaly Kuznetsov    2020-05-25  1803  		}
7a268308015843c Sean Christopherson 2026-06-12  1804  	} while (read_seqcount_retry(&ka->pvclock_sc, seq));
cf8c84f746b2982 Sean Christopherson 2026-07-29  1805  #else
cf8c84f746b2982 Sean Christopherson 2026-07-29  1806  	const bool use_master_clock = false;
cf8c84f746b2982 Sean Christopherson 2026-07-29  1807  #endif
2d7c026f09d73c3 Sean Christopherson 2026-07-29  1808  	/*
2d7c026f09d73c3 Sean Christopherson 2026-07-29  1809  	 * Ensure reading the TSC+frequency pair is done on the same CPU.  When
2d7c026f09d73c3 Sean Christopherson 2026-07-29  1810  	 * NOT using the master clock, the TSC frequency may vary between CPUs.
2d7c026f09d73c3 Sean Christopherson 2026-07-29  1811  	 */
2d7c026f09d73c3 Sean Christopherson 2026-07-29  1812  	preempt_disable();
1e70cb5a00c624f David Woodhouse     2026-07-28  1813  	tgt_tsc_hz = (u64)get_cpu_tsc_khz() * HZ_PER_KHZ;
1e70cb5a00c624f David Woodhouse     2026-07-28  1814  	if (unlikely(tgt_tsc_hz == 0)) {
2d7c026f09d73c3 Sean Christopherson 2026-07-29  1815  		preempt_enable();
7a268308015843c Sean Christopherson 2026-06-12  1816  		kvm_make_request(KVM_REQ_CLOCK_UPDATE, v);
c9aaa8957f203bd Glauber Costa       2011-07-11  1817  		return 1;
7a268308015843c Sean Christopherson 2026-06-12  1818  	}
7a268308015843c Sean Christopherson 2026-06-12  1819  	if (!use_master_clock) {
7a268308015843c Sean Christopherson 2026-06-12  1820  		host_tsc = rdtsc();
7a268308015843c Sean Christopherson 2026-06-12  1821  		kernel_ns = get_kvmclock_base_ns();
7a268308015843c Sean Christopherson 2026-06-12  1822  	}
c9aaa8957f203bd Glauber Costa       2011-07-11  1823  
7a268308015843c Sean Christopherson 2026-06-12  1824  	tsc_timestamp = kvm_read_l1_tsc(v, host_tsc);
c9aaa8957f203bd Glauber Costa       2011-07-11  1825  
7a268308015843c Sean Christopherson 2026-06-12  1826  	/*
7a268308015843c Sean Christopherson 2026-06-12  1827  	 * We may have to catch up the TSC to match elapsed wall clock
7a268308015843c Sean Christopherson 2026-06-12  1828  	 * time for two reasons, even if kvmclock is used.
7a268308015843c Sean Christopherson 2026-06-12  1829  	 *   1) CPU could have been running below the maximum TSC rate
7a268308015843c Sean Christopherson 2026-06-12  1830  	 *   2) Broken TSC compensation resets the base at each VCPU
7a268308015843c Sean Christopherson 2026-06-12  1831  	 *      entry to avoid unknown leaps of TSC even when running
7a268308015843c Sean Christopherson 2026-06-12  1832  	 *      again on the same CPU.  This may cause apparent elapsed
7a268308015843c Sean Christopherson 2026-06-12  1833  	 *      time to disappear, and the guest to stand still or run
7a268308015843c Sean Christopherson 2026-06-12  1834  	 *	very slowly.
7a268308015843c Sean Christopherson 2026-06-12  1835  	 */
7a268308015843c Sean Christopherson 2026-06-12  1836  	if (vcpu->tsc_catchup) {
7a268308015843c Sean Christopherson 2026-06-12  1837  		u64 tsc = compute_guest_tsc(v, kernel_ns);
7a268308015843c Sean Christopherson 2026-06-12  1838  		if (tsc > tsc_timestamp) {
7a268308015843c Sean Christopherson 2026-06-12  1839  			adjust_tsc_offset_guest(v, tsc - tsc_timestamp);
7a268308015843c Sean Christopherson 2026-06-12  1840  			tsc_timestamp = tsc;
7a268308015843c Sean Christopherson 2026-06-12  1841  		}
7a268308015843c Sean Christopherson 2026-06-12  1842  	}
c9aaa8957f203bd Glauber Costa       2011-07-11  1843  
2d7c026f09d73c3 Sean Christopherson 2026-07-29  1844  	preempt_enable();
c9aaa8957f203bd Glauber Costa       2011-07-11  1845  
7a268308015843c Sean Christopherson 2026-06-12  1846  	/* With all the info we got, fill in the values */
c9aaa8957f203bd Glauber Costa       2011-07-11  1847  
7a268308015843c Sean Christopherson 2026-06-12  1848  	if (kvm_caps.has_tsc_control) {
1e70cb5a00c624f David Woodhouse     2026-07-28  1849  		tgt_tsc_hz = kvm_scale_tsc(tgt_tsc_hz,
7a268308015843c Sean Christopherson 2026-06-12  1850  					    v->arch.l1_tsc_scaling_ratio);
1e70cb5a00c624f David Woodhouse     2026-07-28  1851  		tgt_tsc_hz = tgt_tsc_hz ? : 1;
7a268308015843c Sean Christopherson 2026-06-12  1852  	}
66570e966dd9cb4 Oliver Upton        2020-08-18  1853  
1e70cb5a00c624f David Woodhouse     2026-07-28  1854  	if (unlikely(vcpu->hw_tsc_hz != tgt_tsc_hz)) {
1e70cb5a00c624f David Woodhouse     2026-07-28  1855  		kvm_get_time_scale(NSEC_PER_SEC, tgt_tsc_hz,
7a268308015843c Sean Christopherson 2026-06-12  1856  				   &vcpu->pvclock_tsc_shift,
7a268308015843c Sean Christopherson 2026-06-12  1857  				   &vcpu->pvclock_tsc_mul);
1e70cb5a00c624f David Woodhouse     2026-07-28  1858  		vcpu->hw_tsc_hz = tgt_tsc_hz;
7a268308015843c Sean Christopherson 2026-06-12  1859  	}
c9aaa8957f203bd Glauber Costa       2011-07-11  1860  
7a268308015843c Sean Christopherson 2026-06-12  1861  	hv_clock.tsc_shift = vcpu->pvclock_tsc_shift;
7a268308015843c Sean Christopherson 2026-06-12  1862  	hv_clock.tsc_to_system_mul = vcpu->pvclock_tsc_mul;
7a268308015843c Sean Christopherson 2026-06-12  1863  	hv_clock.tsc_timestamp = tsc_timestamp;
7a268308015843c Sean Christopherson 2026-06-12  1864  	hv_clock.system_time = kernel_ns + v->kvm->arch.kvmclock_offset;
7a268308015843c Sean Christopherson 2026-06-12  1865  	vcpu->last_guest_tsc = tsc_timestamp;
66570e966dd9cb4 Oliver Upton        2020-08-18  1866  
7a268308015843c Sean Christopherson 2026-06-12  1867  	/* If the host uses TSC clocksource, then it is stable */
7a268308015843c Sean Christopherson 2026-06-12  1868  	hv_clock.flags = 0;
7a268308015843c Sean Christopherson 2026-06-12  1869  	if (use_master_clock)
7a268308015843c Sean Christopherson 2026-06-12  1870  		hv_clock.flags |= PVCLOCK_TSC_STABLE_BIT;
2d5ba19bdfef4dd Marcelo Tosatti     2019-06-03  1871  
7a268308015843c Sean Christopherson 2026-06-12  1872  	if (vcpu->pv_time.active) {
7a268308015843c Sean Christopherson 2026-06-12  1873  		/*
7a268308015843c Sean Christopherson 2026-06-12  1874  		 * GUEST_STOPPED is only supported by kvmclock, and KVM's
7a268308015843c Sean Christopherson 2026-06-12  1875  		 * historic behavior is to only process the request if kvmclock
7a268308015843c Sean Christopherson 2026-06-12  1876  		 * is active/enabled.
7a268308015843c Sean Christopherson 2026-06-12  1877  		 */
7a268308015843c Sean Christopherson 2026-06-12  1878  		if (vcpu->pvclock_set_guest_stopped_request) {
7a268308015843c Sean Christopherson 2026-06-12  1879  			hv_clock.flags |= PVCLOCK_GUEST_STOPPED;
7a268308015843c Sean Christopherson 2026-06-12  1880  			vcpu->pvclock_set_guest_stopped_request = false;
7a268308015843c Sean Christopherson 2026-06-12  1881  		}
7a268308015843c Sean Christopherson 2026-06-12  1882  		kvm_setup_guest_pvclock(&hv_clock, v, &vcpu->pv_time, 0);
2d5ba19bdfef4dd Marcelo Tosatti     2019-06-03  1883  
7a268308015843c Sean Christopherson 2026-06-12  1884  		hv_clock.flags &= ~PVCLOCK_GUEST_STOPPED;
7a268308015843c Sean Christopherson 2026-06-12  1885  	}
71db602322b1197 Andre Przywara      2009-06-12  1886  
7a268308015843c Sean Christopherson 2026-06-12  1887  	kvm_hv_setup_tsc_page(v->kvm, &hv_clock);
5753785fa97742d Gleb Natapov        2012-01-15  1888  
7a268308015843c Sean Christopherson 2026-06-12  1889  #ifdef CONFIG_KVM_XEN
84e0cefa8ddd5d5 Jes Sorensen        2010-09-01  1890  	/*
7a268308015843c Sean Christopherson 2026-06-12  1891  	 * For Xen guests we may need to override PVCLOCK_TSC_STABLE_BIT as unless
7a268308015843c Sean Christopherson 2026-06-12  1892  	 * explicitly told to use TSC as its clocksource Xen will not set this bit.
7a268308015843c Sean Christopherson 2026-06-12  1893  	 * This default behaviour led to bugs in some guest kernels which cause
7a268308015843c Sean Christopherson 2026-06-12  1894  	 * problems if they observe PVCLOCK_TSC_STABLE_BIT in the pvclock flags.
7a268308015843c Sean Christopherson 2026-06-12  1895  	 *
7a268308015843c Sean Christopherson 2026-06-12  1896  	 * Note!  Clear TSC_STABLE only for Xen clocks, i.e. the order matters!
84e0cefa8ddd5d5 Jes Sorensen        2010-09-01  1897  	 */
7a268308015843c Sean Christopherson 2026-06-12 @1898  	if (ka->xen.hvm_config.flags & KVM_XEN_HVM_CONFIG_PVCLOCK_TSC_UNSTABLE)
7a268308015843c Sean Christopherson 2026-06-12  1899  		hv_clock.flags &= ~PVCLOCK_TSC_STABLE_BIT;
7a268308015843c Sean Christopherson 2026-06-12  1900  
7a268308015843c Sean Christopherson 2026-06-12  1901  	if (vcpu->xen.vcpu_info_cache.active)
7a268308015843c Sean Christopherson 2026-06-12  1902  		kvm_setup_guest_pvclock(&hv_clock, v, &vcpu->xen.vcpu_info_cache,
7a268308015843c Sean Christopherson 2026-06-12  1903  					offsetof(struct compat_vcpu_info, time));
7a268308015843c Sean Christopherson 2026-06-12  1904  	if (vcpu->xen.vcpu_time_info_cache.active)
7a268308015843c Sean Christopherson 2026-06-12  1905  		kvm_setup_guest_pvclock(&hv_clock, v, &vcpu->xen.vcpu_time_info_cache, 0);
b4f69df0f65e97f Vitaly Kuznetsov    2023-12-05  1906  #endif
7a268308015843c Sean Christopherson 2026-06-12  1907  	return 0;
7a268308015843c Sean Christopherson 2026-06-12  1908  }
7a268308015843c Sean Christopherson 2026-06-12  1909  

:::::: The code at line 1898 was first introduced by commit
:::::: 7a268308015843c7e8b15dda588b2e9adf45223f KVM: x86: Move the bulk of MSR specific code from x86.c to msrs.{c,h}

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
