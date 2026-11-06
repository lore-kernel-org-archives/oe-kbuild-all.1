Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952730;
	b=NYJzyVR77uQifxdf4xsnffDu1aH0xNmwFURT4VdVgcRazR0K1szPs8w2IwJJt+30abjI
	 hVCL0TCTNCJ9ZYTH20U5BKQyXIcKGuemV5Rxw9qBnrjVYxAqhc/1/xzlky66ZLGSQsS7H
	 4mozqekQMc9bFXUEtAhu1AZmxbCV686ZOrM6KQ2ygA8STCmUSbzqeufMA9wXBXm0tVROS
	 gfhAgr+Xjq6opzCOql5+Ut+SnFcO2rQjlojP8xv0pg7bgl0+5zBUonufvfjsl6mPIvABt
	 zB1vSNYBy5HzARKs6O2sLWnunVDEFzydf0IKiP6co8y8bD9ke0oC3sI3KShv2LChqMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952730;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Fr0b/gJwW8DuDNnKSEqsOrYyK5zpijAwhwmns+zEDVQ=;
	b=D7Ibxy89dttZK+ZO1SK08MHk3blxOsGwi1fFsA2Z2XtFjrLMvmCGBt0EY7qZR1Bwf2iw
	 MztxatVs/RBMMykEVFaKGg3fV619PjgX49hpxg2zwPFPSZ7uS8Kcc7Pi0fLcYARG9Z2HD
	 3vQr0xc5n8IlqPKZkBAX2bZcsNYz3IvDzPtCBLeUgU//mV825i9Psg9lLT40lvVg9wPwz
	 jagk7vy6szNwGsnpuVkxUDH2XUDhgwZMEtUmiD8Qok4BVpDGCtb4RBk0k75xnH203szas
	 7JJBRPKDUlKG6gqlG3a92H49OiQDEg6PLoxohfMXQtLERMzQJm0NQFf8rw/us+da8gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="m//u47D5";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3F9606A330
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 08:12:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B3F9606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m//u47D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793952728; x=1825488728;
  h=date:from:to:cc:subject:message-id;
  bh=oClwwmDjlh63qZOJ6Fbi4/DJKWrWryPUQPS2gVQ6VPM=;
  b=m//u47D5DyAqPAz9L1rYLHNMhstNk92o+7mZMT1nz6JRmezEGFX2n+q9
   3sYosm/fcMg0I11HH+mYg3Lcpi6ddqFbuxephat26MtjQ+M1EpEY5AVL5
   Q2ke317IYJ+RahtBZRai2yX6ScjAJY1tLge5jys3Xtc5PRDSsFbxfYDwq
   6KYZsV7hTirN0jE3OmsELq6Ovz45zIHDMkPreL99dqRZxC93YUztkm/Ry
   T0Sopueq7GECBWgsf/WBftQFPJMfuLosligDaYGeQB5xNVQus6BhGE91y
   917oBkV1/iInVj8nTfGlqUBjUFOcu3EuOFr55n00pWxRPtlaLO83CeWi3
   A==;
X-CSE-ConnectionGUID: gUb+076KQqqsW7hCc59u6g==
X-CSE-MsgGUID: CGD5ZCPoR46BTn3V8DMqAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2800577"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2800577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 00:12:08 -0800
X-CSE-ConnectionGUID: C7+y2ocpTzq/cSugvd+HFA==
X-CSE-MsgGUID: gmvheN/bSkuK5i/cLhc18A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7568209"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 06 Nov 2026 00:12:06 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPF3M-00000000A95-1sM9;
	Fri, 06 Nov 2026 08:12:04 +0000
Date: Fri, 06 Nov 2026 09:11:54 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 11/11]
 arch/x86/kvm/vmx/tdx.c:844:38: sparse: sparse: Using plain integer as NULL
 pointer
Message-ID: <202611060926.H4u0LFBw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Kai,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   5bcdf096fa9a02f8ee295f36a2daf645e18327a5
commit: 80804847269eba880dc8c1bc64d70082692f72cd [11/11] x86/virt/tdx: Remove the !KEXEC_CORE dependency
config: x86_64-randconfig-r2301-20261106 (https://download.01.org/0day-ci/archive/20261106/202611060926.H4u0LFBw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611060926.H4u0LFBw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 80804847269e ("x86/virt/tdx: Remove the !KEXEC_CORE dependency")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611060926.H4u0LFBw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/vmx/tdx.c:844:38: sparse: sparse: Using plain integer as NULL pointer
   arch/x86/kvm/vmx/tdx.c:2618:32: sparse: sparse: Using plain integer as NULL pointer
   arch/x86/kvm/vmx/tdx.c:2985:30: sparse: sparse: Using plain integer as NULL pointer
>> arch/x86/kvm/vmx/tdx.c:3027:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct kvm_cpuid2 [noderef] __user *td_cpuid @@     got void *[assigned] _res @@
   arch/x86/kvm/vmx/tdx.c:3027:18: sparse:     expected struct kvm_cpuid2 [noderef] __user *td_cpuid
   arch/x86/kvm/vmx/tdx.c:3027:18: sparse:     got void *[assigned] _res
>> arch/x86/kvm/vmx/tdx.c:3033:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *to @@     got struct kvm_cpuid2 [noderef] __user *td_cpuid @@
   arch/x86/kvm/vmx/tdx.c:3033:28: sparse:     expected void *to
   arch/x86/kvm/vmx/tdx.c:3033:28: sparse:     got struct kvm_cpuid2 [noderef] __user *td_cpuid
>> arch/x86/kvm/vmx/tdx.c:3039:68: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct kvm_cpuid_entry2 *[assigned] output_e @@     got struct kvm_cpuid_entry2 [noderef] __user * @@
   arch/x86/kvm/vmx/tdx.c:3039:68: sparse:     expected struct kvm_cpuid_entry2 *[assigned] output_e
   arch/x86/kvm/vmx/tdx.c:3039:68: sparse:     got struct kvm_cpuid_entry2 [noderef] __user *
   arch/x86/kvm/vmx/tdx.c:3046:75: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct kvm_cpuid_entry2 *[assigned] output_e @@     got struct kvm_cpuid_entry2 [noderef] __user * @@
   arch/x86/kvm/vmx/tdx.c:3046:75: sparse:     expected struct kvm_cpuid_entry2 *[assigned] output_e
   arch/x86/kvm/vmx/tdx.c:3046:75: sparse:     got struct kvm_cpuid_entry2 [noderef] __user *
   arch/x86/kvm/vmx/tdx.c:3049:77: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct kvm_cpuid_entry2 *[assigned] output_e @@     got struct kvm_cpuid_entry2 [noderef] __user * @@
   arch/x86/kvm/vmx/tdx.c:3049:77: sparse:     expected struct kvm_cpuid_entry2 *[assigned] output_e
   arch/x86/kvm/vmx/tdx.c:3049:77: sparse:     got struct kvm_cpuid_entry2 [noderef] __user *
   arch/x86/kvm/vmx/tdx.c:3056:75: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct kvm_cpuid_entry2 *[assigned] output_e @@     got struct kvm_cpuid_entry2 [noderef] __user * @@
   arch/x86/kvm/vmx/tdx.c:3056:75: sparse:     expected struct kvm_cpuid_entry2 *[assigned] output_e
   arch/x86/kvm/vmx/tdx.c:3056:75: sparse:     got struct kvm_cpuid_entry2 [noderef] __user *
>> arch/x86/kvm/vmx/tdx.c:3062:34: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct kvm_cpuid2 [noderef] __user *td_cpuid @@
   arch/x86/kvm/vmx/tdx.c:3062:34: sparse:     expected void const *from
   arch/x86/kvm/vmx/tdx.c:3062:34: sparse:     got struct kvm_cpuid2 [noderef] __user *td_cpuid
>> arch/x86/kvm/vmx/tdx.c:3070:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const *from @@     got struct kvm_cpuid_entry2 [noderef] __user * @@
   arch/x86/kvm/vmx/tdx.c:3070:43: sparse:     expected void const *from
   arch/x86/kvm/vmx/tdx.c:3070:43: sparse:     got struct kvm_cpuid_entry2 [noderef] __user *
>> arch/x86/kvm/vmx/tdx.c:3075:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct kvm_cpuid2 [noderef] __user *td_cpuid @@
   arch/x86/kvm/vmx/tdx.c:3075:15: sparse:     expected void const *objp
   arch/x86/kvm/vmx/tdx.c:3075:15: sparse:     got struct kvm_cpuid2 [noderef] __user *td_cpuid
>> arch/x86/kvm/vmx/tdx.c:3043:34: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/vmx/tdx.c:3053:34: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/vmx/tdx.c:3058:13: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/vmx/tdx.c:3060:9: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/vmx/tdx.c:3071:26: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/vmx/tdx.c:3071:26: sparse: sparse: dereference of noderef expression

vim +844 arch/x86/kvm/vmx/tdx.c

81bf40d54cd56e Isaku Yamahata 2025-01-29  816  
9002f8cf529521 Isaku Yamahata 2024-10-30  817  void tdx_vcpu_free(struct kvm_vcpu *vcpu)
9002f8cf529521 Isaku Yamahata 2024-10-30  818  {
a50f673f25e0ba Isaku Yamahata 2024-10-30  819  	struct kvm_tdx *kvm_tdx = to_kvm_tdx(vcpu->kvm);
a50f673f25e0ba Isaku Yamahata 2024-10-30  820  	struct vcpu_tdx *tdx = to_tdx(vcpu);
a50f673f25e0ba Isaku Yamahata 2024-10-30  821  	int i;
a50f673f25e0ba Isaku Yamahata 2024-10-30  822  
a50f673f25e0ba Isaku Yamahata 2024-10-30  823  	/*
a50f673f25e0ba Isaku Yamahata 2024-10-30  824  	 * It is not possible to reclaim pages while hkid is assigned. It might
a50f673f25e0ba Isaku Yamahata 2024-10-30  825  	 * be assigned if:
a50f673f25e0ba Isaku Yamahata 2024-10-30  826  	 * 1. the TD VM is being destroyed but freeing hkid failed, in which
a50f673f25e0ba Isaku Yamahata 2024-10-30  827  	 * case the pages are leaked
a50f673f25e0ba Isaku Yamahata 2024-10-30  828  	 * 2. TD VCPU creation failed and this on the error path, in which case
a50f673f25e0ba Isaku Yamahata 2024-10-30  829  	 * there is nothing to do anyway
a50f673f25e0ba Isaku Yamahata 2024-10-30  830  	 */
a50f673f25e0ba Isaku Yamahata 2024-10-30  831  	if (is_hkid_assigned(kvm_tdx))
a50f673f25e0ba Isaku Yamahata 2024-10-30  832  		return;
a50f673f25e0ba Isaku Yamahata 2024-10-30  833  
a50f673f25e0ba Isaku Yamahata 2024-10-30  834  	if (tdx->vp.tdcx_pages) {
a50f673f25e0ba Isaku Yamahata 2024-10-30  835  		for (i = 0; i < kvm_tdx->td.tdcx_nr_pages; i++) {
a50f673f25e0ba Isaku Yamahata 2024-10-30  836  			if (tdx->vp.tdcx_pages[i])
a50f673f25e0ba Isaku Yamahata 2024-10-30  837  				tdx_reclaim_control_page(tdx->vp.tdcx_pages[i]);
a50f673f25e0ba Isaku Yamahata 2024-10-30  838  		}
a50f673f25e0ba Isaku Yamahata 2024-10-30  839  		kfree(tdx->vp.tdcx_pages);
a50f673f25e0ba Isaku Yamahata 2024-10-30  840  		tdx->vp.tdcx_pages = NULL;
a50f673f25e0ba Isaku Yamahata 2024-10-30  841  	}
a50f673f25e0ba Isaku Yamahata 2024-10-30  842  	if (tdx->vp.tdvpr_page) {
a50f673f25e0ba Isaku Yamahata 2024-10-30  843  		tdx_reclaim_control_page(tdx->vp.tdvpr_page);
a50f673f25e0ba Isaku Yamahata 2024-10-30 @844  		tdx->vp.tdvpr_page = 0;
a50f673f25e0ba Isaku Yamahata 2024-10-30  845  	}
a50f673f25e0ba Isaku Yamahata 2024-10-30  846  
a50f673f25e0ba Isaku Yamahata 2024-10-30  847  	tdx->state = VCPU_TD_STATE_UNINITIALIZED;
9002f8cf529521 Isaku Yamahata 2024-10-30  848  }
9002f8cf529521 Isaku Yamahata 2024-10-30  849  

:::::: The code at line 844 was first introduced by commit
:::::: a50f673f25e0ba2b594d94efe235f4eb57d0e784 KVM: TDX: Do TDX specific vcpu initialization

:::::: TO: Isaku Yamahata <isaku.yamahata@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
