Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C4F35B631
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763066; cv=none; b=ZxKUAWwHdtgQV6pmV2CvLs+xhEvfYCCjEL03l780Gf+YtZX3QWGe1lnvfcLnAFrKrdMv3flbqngNQKU/CtZpMRmcc8CZp9W+TlpD4kWTobj2H7rz8TTPjAR+aspZSarbdPFVNWOkY5M0fZmp4PPO0IDJoiqKZQkMnmHDiq06u3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763066; c=relaxed/simple;
	bh=ImDOT96qWLByF7RtdLH1lGVRTTqioKw8WcjhLVZI03w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qU9qze7oyQ5qUS54vP9Glj5NJGocBHIBAV8psi9TdZw+uPqIJqsfSXmLYN9Jp5rZSF6wgGTlFVFXYBIRe5sQH0MAV0HxO51yhKhxyyXBZRyZ84iObS+NzICTdxv17w0wqDSLuEe2Q9x3mr1KtYSkFPzjq6560v4UK9DhGw8UcZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZFrO0niL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZFrO0niL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783763065; x=1815299065;
  h=date:from:to:cc:subject:message-id;
  bh=ImDOT96qWLByF7RtdLH1lGVRTTqioKw8WcjhLVZI03w=;
  b=ZFrO0niLoH0GIyT1ziG0exgS6sdhSmEWfbVB5TTFyfLp7q1k9hejuRUG
   t5mPVb+T3yZmDm//DOVzqHmPl5eJ13cP9h+6Gy/krvHVaa3NPCvPqrZF2
   yulS1tQXdtJQDzuZutscj1ZXeU0/0WVTBDXQ8m5xXYueW6JcXDa7k4BXE
   HI77PakUFyzlyEd543JtZ9ZZ8Z+kHGBlc9Fy2P1Mq3NQPCT3pYs310Q1B
   XYsaXYIVOnpPxXLZuk0ivPO38HqxakDremal5FXlI+/+1vrwBGwznv7tV
   3c/LfUvlIMXnBqIz4F4KVwLn84AsXtzCawP2H7qkbMBkyep4R5t8ZjCqk
   Q==;
X-CSE-ConnectionGUID: z/HtSSSETv6g8oV9EbqAZw==
X-CSE-MsgGUID: 8n48OHtLSkOMQmc/HDNfNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95819135"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95819135"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 02:44:24 -0700
X-CSE-ConnectionGUID: EVAEvV7nRXyzEgg+ScMMWw==
X-CSE-MsgGUID: LV50Og8AR2CTotzjKyNdiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251724986"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jul 2026 02:44:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiUFv-00000000Jx6-3cUH;
	Sat, 11 Jul 2026 09:44:19 +0000
Date: Sat, 11 Jul 2026 17:44:01 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 5603/5655] arch/x86/kvm/msrs.c:654:14:
 error: implicit declaration of function 'static_cpu_has'; did you mean
 '_static_cpu_has'?
Message-ID: <202607111739.l56LQlCE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: d9b292f64e4bc5ab3e14dc0b89a7b0cc47c11e00 [5603/5655] Merge branch 'next' of git://git.kernel.org/pub/scm/virt/kvm/kvm.git
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260711/202607111739.l56LQlCE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111739.l56LQlCE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111739.l56LQlCE-lkp@intel.com/

Note: the linux-next/master HEAD bee763d5f341b99cf472afeb508d4988f62a6ca1 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   arch/x86/kvm/msrs.c: In function 'set_efer':
>> arch/x86/kvm/msrs.c:654:14: error: implicit declaration of function 'static_cpu_has'; did you mean '_static_cpu_has'? [-Wimplicit-function-declaration]
     654 |         if (!static_cpu_has(X86_FEATURE_XSAVES) &&
         |              ^~~~~~~~~~~~~~
         |              _static_cpu_has


vim +654 arch/x86/kvm/msrs.c

7a268308015843 Sean Christopherson 2026-06-12  623  
7a268308015843 Sean Christopherson 2026-06-12  624  static int set_efer(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
7a268308015843 Sean Christopherson 2026-06-12  625  {
7a268308015843 Sean Christopherson 2026-06-12  626  	u64 old_efer = vcpu->arch.efer;
7a268308015843 Sean Christopherson 2026-06-12  627  	u64 efer = msr_info->data;
7a268308015843 Sean Christopherson 2026-06-12  628  	int r;
7a268308015843 Sean Christopherson 2026-06-12  629  
7a268308015843 Sean Christopherson 2026-06-12  630  	if (efer & efer_reserved_bits)
7a268308015843 Sean Christopherson 2026-06-12  631  		return 1;
7a268308015843 Sean Christopherson 2026-06-12  632  
7a268308015843 Sean Christopherson 2026-06-12  633  	if (!msr_info->host_initiated) {
7a268308015843 Sean Christopherson 2026-06-12  634  		if (!__kvm_valid_efer(vcpu, efer))
7a268308015843 Sean Christopherson 2026-06-12  635  			return 1;
7a268308015843 Sean Christopherson 2026-06-12  636  
7a268308015843 Sean Christopherson 2026-06-12  637  		if (is_paging(vcpu) &&
7a268308015843 Sean Christopherson 2026-06-12  638  		    (vcpu->arch.efer & EFER_LME) != (efer & EFER_LME))
7a268308015843 Sean Christopherson 2026-06-12  639  			return 1;
7a268308015843 Sean Christopherson 2026-06-12  640  	}
7a268308015843 Sean Christopherson 2026-06-12  641  
7a268308015843 Sean Christopherson 2026-06-12  642  	efer &= ~EFER_LMA;
7a268308015843 Sean Christopherson 2026-06-12  643  	efer |= vcpu->arch.efer & EFER_LMA;
7a268308015843 Sean Christopherson 2026-06-12  644  
7a268308015843 Sean Christopherson 2026-06-12  645  	r = kvm_x86_call(set_efer)(vcpu, efer);
7a268308015843 Sean Christopherson 2026-06-12  646  	if (r) {
7a268308015843 Sean Christopherson 2026-06-12  647  		WARN_ON(r > 0);
7a268308015843 Sean Christopherson 2026-06-12  648  		return r;
7a268308015843 Sean Christopherson 2026-06-12  649  	}
7a268308015843 Sean Christopherson 2026-06-12  650  
7a268308015843 Sean Christopherson 2026-06-12  651  	if ((efer ^ old_efer) & KVM_MMU_EFER_ROLE_BITS)
7a268308015843 Sean Christopherson 2026-06-12  652  		kvm_mmu_reset_context(vcpu);
7a268308015843 Sean Christopherson 2026-06-12  653  
7a268308015843 Sean Christopherson 2026-06-12 @654  	if (!static_cpu_has(X86_FEATURE_XSAVES) &&
7a268308015843 Sean Christopherson 2026-06-12  655  	    (efer & EFER_SVME))
7a268308015843 Sean Christopherson 2026-06-12  656  		kvm_hv_xsaves_xsavec_maybe_warn(vcpu);
7a268308015843 Sean Christopherson 2026-06-12  657  
7a268308015843 Sean Christopherson 2026-06-12  658  	return 0;
7a268308015843 Sean Christopherson 2026-06-12  659  }
7a268308015843 Sean Christopherson 2026-06-12  660  

:::::: The code at line 654 was first introduced by commit
:::::: 7a268308015843c7e8b15dda588b2e9adf45223f KVM: x86: Move the bulk of MSR specific code from x86.c to msrs.{c,h}

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
