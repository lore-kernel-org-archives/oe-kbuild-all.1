Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B5030CD91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 05:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677577; cv=none; b=rIpHpo4v7cZfWegE+imlh0mqfZez8ngLVMM+mX4zSZa45iVLJGDqEMQ0NxZ8AzPagMk5yGqBjlEiAaFxq4oBVkwjvirS//rgsk5P7veY2Nga9CVA7984louS36um4v4SUcW3xwXOjmqrx/biXuWtPuX2X5tldCNv5DouLursyoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677577; c=relaxed/simple;
	bh=UF5WZ86ftoxaAgv61b2WGOkBH1DbT1e+3cbFveJchtA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LcCU0FwH8KKiI9kn4Tte2Ss7hQyI3QlArl3Go7aqj2h9qvawy/uHbkIgfz2QLu3gb3qc81PQt8QLIx1bo4qIh0mlGIJRgTIoOMR3ZxLcJ4bYQNtJK2gqd/IqZ2J7j/0SbEz7NqH6VI2ItKX+bKOY6sSoITJFKG3aaDgg125AvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AQsYQtn8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AQsYQtn8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760677575; x=1792213575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UF5WZ86ftoxaAgv61b2WGOkBH1DbT1e+3cbFveJchtA=;
  b=AQsYQtn8paG0Uem0IVaVEazxjRu+K/KRKu5Z47CqBqdqi3nsGVhSD398
   HIxYpQ8hzPqx5M4/Yui8h8I8dDT0Xf5tDAPWFdsZudRtpf48hWfLgAG3d
   P16bReRxRi5ZQpEHEHuPPZaxInNp0Qxatxx6G2YjGZl3RL1d8JCNxMVta
   weZYxIsoV+so3HLTtL5QkEZHBtuDay0oMmJ6qXwT0UWuyMG/7HazoNMz8
   dyttSeMaZuxQj6QE31/nF8i5Oz8IHXlg7VBDNRhzfuSgFcfpH05H8A60c
   Uocto7WllmAYOu4siVjqKLJ3RQl2rPWxynUYYYd7+i71qTTTHCOCWKhVd
   g==;
X-CSE-ConnectionGUID: aWwShhiWQr23WfRcM5eg3w==
X-CSE-MsgGUID: lCXUN5s1Tsa3GeYY1EEvHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62591613"
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="62591613"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 22:06:14 -0700
X-CSE-ConnectionGUID: XjnOVXPXRR+42xsZBaPdrg==
X-CSE-MsgGUID: GNE2/aXLRBuCuNt3JucJrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,234,1754982000"; 
   d="scan'208";a="187922107"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 16 Oct 2025 22:06:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9cfG-0005YB-1o;
	Fri, 17 Oct 2025 05:06:09 +0000
Date: Fri, 17 Oct 2025 13:05:26 +0800
From: kernel test robot <lkp@intel.com>
To: Brendan Jackman <jackmanb@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>
Subject: [sean-jc:x86/l1tf_mitigation_mitigation 5/5]
 arch/x86/kvm/vmx/vmx.c:406:25: error: 'return' with no value, in function
 returning non-void
Message-ID: <202510171230.aW9afrzB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/l1tf_mitigation_mitigation
head:   6b03b37c78d0bdc369aa93991cfa0f209cf20964
commit: 87082229a1fad68bb7fcc327838157ebcd030c9f [5/5] KVM: x86: Unify L1TF flushing under per-CPU variable
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251017/202510171230.aW9afrzB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510171230.aW9afrzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510171230.aW9afrzB-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/vmx.c: In function 'vmx_setup_l1d_flush':
   arch/x86/kvm/vmx/vmx.c:313:16: error: too many arguments to function 'vmx_setup_l1d_flush'
     313 |         return vmx_setup_l1d_flush(vmentry_l1d_flush_param);
         |                ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c:306:12: note: declared here
     306 | static int vmx_setup_l1d_flush(void)
         |            ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/vmx.c: In function 'vmx_l1d_flush':
>> arch/x86/kvm/vmx/vmx.c:406:25: error: 'return' with no value, in function returning non-void [-Wreturn-mismatch]
     406 |                         return;
         |                         ^~~~~~
   arch/x86/kvm/vmx/vmx.c:386:21: note: declared here
     386 | static noinstr bool vmx_l1d_flush(struct kvm_vcpu *vcpu)
         |                     ^~~~~~~~~~~~~


vim +/return +406 arch/x86/kvm/vmx/vmx.c

   375	
   376	/*
   377	 * Software based L1D cache flush which is used when microcode providing
   378	 * the cache control MSR is not loaded.
   379	 *
   380	 * The L1D cache is 32 KiB on Nehalem and later microarchitectures, but to
   381	 * flush it is required to read in 64 KiB because the replacement algorithm
   382	 * is not exactly LRU. This could be sized at runtime via topology
   383	 * information but as all relevant affected CPUs have 32KiB L1D cache size
   384	 * there is no point in doing so.
   385	 */
   386	static noinstr bool vmx_l1d_flush(struct kvm_vcpu *vcpu)
   387	{
   388		int size = PAGE_SIZE << L1D_CACHE_ORDER;
   389	
   390		if (!static_branch_unlikely(&vmx_l1d_should_flush))
   391			return false;
   392	
   393		/*
   394		 * This code is only executed when the flush mode is 'cond' or
   395		 * 'always'
   396		 */
   397		if (static_branch_likely(&vmx_l1d_flush_cond)) {
   398			/*
   399			 * Clear the per-cpu flush bit, it gets set again if the vCPU
   400			 * is reloaded, i.e. if the vCPU is scheduled out or if KVM
   401			 * exits to userspace, or if KVM reaches one of the unsafe
   402			 * VMEXIT handlers, e.g. if KVM calls into the emulator,
   403			 * or from the interrupt handlers.
   404			 */
   405			if (!kvm_get_cpu_l1tf_flush_l1d())
 > 406				return;
   407			kvm_clear_cpu_l1tf_flush_l1d();
   408		}
   409	
   410		vcpu->stat.l1d_flush++;
   411	
   412		if (static_cpu_has(X86_FEATURE_FLUSH_L1D)) {
   413			native_wrmsrq(MSR_IA32_FLUSH_CMD, L1D_FLUSH);
   414			return true;
   415		}
   416	
   417		asm volatile(
   418			/* First ensure the pages are in the TLB */
   419			"xorl	%%eax, %%eax\n"
   420			".Lpopulate_tlb:\n\t"
   421			"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
   422			"addl	$4096, %%eax\n\t"
   423			"cmpl	%%eax, %[size]\n\t"
   424			"jne	.Lpopulate_tlb\n\t"
   425			"xorl	%%eax, %%eax\n\t"
   426			"cpuid\n\t"
   427			/* Now fill the cache */
   428			"xorl	%%eax, %%eax\n"
   429			".Lfill_cache:\n"
   430			"movzbl	(%[flush_pages], %%" _ASM_AX "), %%ecx\n\t"
   431			"addl	$64, %%eax\n\t"
   432			"cmpl	%%eax, %[size]\n\t"
   433			"jne	.Lfill_cache\n\t"
   434			"lfence\n"
   435			:: [flush_pages] "r" (vmx_l1d_flush_pages),
   436			    [size] "r" (size)
   437			: "eax", "ebx", "ecx", "edx");
   438		return true;
   439	}
   440	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
