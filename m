Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AAA31D37A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Nov 2025 09:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763542945; cv=none; b=OTgrBGLuhW4i56zb8JveY59KSefELyHkzjvEBMpaLmPeIXTzmW7UPCQeAtQFfjdbRi50hDQpfEM0d/EiYjZo6NZ7yTX8McwLIEXdR/fyOvezl85Nq1KLqDVHCHX5Erwgg1bUZe0WFFVlcHocheE9tctNNHdtMxx5uJPethAV6oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763542945; c=relaxed/simple;
	bh=glhgBVRcsZLt/+qR49TipXDcHCjaDEC0mr0CCSbG2zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=do0d3Z0mTwUuURg2VPzmPCKHQkrdV4XTn3ZNZM7XIqHeumwrNBwJH3bZr6x0LRflPInTjO9oiectIwaCcX5hjd2o3eyl3mYBDsvSTfNnRONrRtfSOJTgEWysGYB75shr2BGl86yuOYJ/Owaf5mapZNYR3E6rw1Owt9cWtIV2nLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OXy2v2Xc; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OXy2v2Xc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763542944; x=1795078944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=glhgBVRcsZLt/+qR49TipXDcHCjaDEC0mr0CCSbG2zk=;
  b=OXy2v2XcyhxTLN8EZPJME1ZO6G7fr3RYBvC0Pkw6NG9F1t57E466Dmw+
   EG55B9ANoIMz3hblsDrk67od9nkkhzsmft7HWIEwaw1M1689AQ9H91JIc
   EX/iUR+N1Y4xUF2RH/jrhPFumvCeDRy9DjMNcz1whIrR2w6vwcSCWn7jJ
   Hv2N7lsNQkQuWFKqNBXrcwDGUNmhP8i7in2nG3IoFKHF2S+0l5VnlVR7D
   jAqYCfDW+wcBP3vtIAiZx3nCNVOOpDAYCfoYBmNngzv39VRp6LpnUV2s5
   CP88FOd9uxtE2/lvbeXCbkYkpL8qsK2/eVtQ8/XPT0kAHSPzFlpC3+3eU
   g==;
X-CSE-ConnectionGUID: 2qkENq7RRJWgjWGb02ir4g==
X-CSE-MsgGUID: YPuX917lTBeLt2KV1Fc3sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65618879"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="65618879"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 01:02:23 -0800
X-CSE-ConnectionGUID: XPNfYBKMT/uQGfWlQ19icg==
X-CSE-MsgGUID: 67o12vqFQkeAoV3ZQxoNuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="191254985"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Nov 2025 01:02:22 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLe4y-0002eG-0p;
	Wed, 19 Nov 2025 09:02:20 +0000
Date: Wed, 19 Nov 2025 17:02:12 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:vmx/sgx2_pferr_intercept 9/9]
 arch/x86/kvm/vmx/vmx.c:5213:31: error: implicit declaration of function
 'IS_ENABLED_'; did you mean 'IS_ENABLED'?
Message-ID: <202511191651.KvkJ6zgj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux vmx/sgx2_pferr_intercept
head:   8a7add4d5d370361f93bd73f26aa92f198250ce5
commit: 8a7add4d5d370361f93bd73f26aa92f198250ce5 [9/9] KVM: VMX: Always reflect SGX EPCM #PFs back into the guest
config: i386-randconfig-141-20251119 (https://download.01.org/0day-ci/archive/20251119/202511191651.KvkJ6zgj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511191651.KvkJ6zgj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511191651.KvkJ6zgj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:108,
                    from include/linux/bug.h:5,
                    from include/linux/vfsdebug.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/highmem.h:5,
                    from arch/x86/kvm/vmx/vmx.c:17:
   arch/x86/kvm/vmx/vmx.c: In function 'vmx_handle_page_fault':
>> arch/x86/kvm/vmx/vmx.c:5213:31: error: implicit declaration of function 'IS_ENABLED_'; did you mean 'IS_ENABLED'? [-Wimplicit-function-declaration]
    5213 |                 WARN_ON_ONCE(!IS_ENABLED_(CONFIG_X86_SGX_KVM) ||
         |                               ^~~~~~~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
>> arch/x86/kvm/vmx/vmx.c:5213:43: error: 'CONFIG_X86_SGX_KVM' undeclared (first use in this function); did you mean 'CONFIG_X86_CX8'?
    5213 |                 WARN_ON_ONCE(!IS_ENABLED_(CONFIG_X86_SGX_KVM) ||
         |                                           ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:5213:43: note: each undeclared identifier is reported only once for each function it appears in
    5213 |                 WARN_ON_ONCE(!IS_ENABLED_(CONFIG_X86_SGX_KVM) ||
         |                                           ^~~~~~~~~~~~~~~~~~
   include/asm-generic/bug.h:111:32: note: in definition of macro 'WARN_ON_ONCE'
     111 |         int __ret_warn_on = !!(condition);                      \
         |                                ^~~~~~~~~


vim +5213 arch/x86/kvm/vmx/vmx.c

  5195	
  5196	static int vmx_handle_page_fault(struct kvm_vcpu *vcpu, u32 error_code)
  5197	{
  5198		unsigned long cr2 = vmx_get_exit_qual(vcpu);
  5199	
  5200		if (vcpu->arch.apf.host_apf_flags)
  5201			goto handle_pf;
  5202	
  5203		/* When using EPT, KVM intercepts #PF only to detect illegal GPAs. */
  5204		WARN_ON_ONCE(enable_ept && !allow_smaller_maxphyaddr);
  5205	
  5206		/*
  5207		 * On SGX2 hardware, EPCM violations are delivered as #PF with the SGX
  5208		 * flag set in the error code (SGX1 harware generates #GP(0)).  EPCM
  5209		 * violations have nothing to do with shadow paging and can never be
  5210		 * resolved by KVM; always reflect them into the guest.
  5211		 */
  5212		if (error_code & PFERR_SGX_MASK) {
> 5213			WARN_ON_ONCE(!IS_ENABLED_(CONFIG_X86_SGX_KVM) ||
  5214				     !cpu_feature_enabled(X86_FEATURE_SGX2));
  5215			if (guest_cpu_cap_has(vcpu, X86_FEATURE_SGX2))
  5216				kvm_fixup_and_inject_pf_error(vcpu, cr2, error_code);
  5217			else
  5218				kvm_inject_gp(vcpu, 0);
  5219			return 1;
  5220		}
  5221	
  5222		/*
  5223		 * If EPT is enabled, fixup and inject the #PF.  KVM intercepts #PFs
  5224		 * only to set PFERR_RSVD as appropriate (hardware won't set RSVD due
  5225		 * to the GPA being legal with respect to host.MAXPHYADDR).
  5226		 */
  5227		if (enable_ept) {
  5228			kvm_fixup_and_inject_pf_error(vcpu, cr2, error_code);
  5229			return 1;
  5230		}
  5231	
  5232	handle_pf:
  5233		return kvm_handle_page_fault(vcpu, error_code, cr2, NULL, 0);
  5234	}
  5235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
