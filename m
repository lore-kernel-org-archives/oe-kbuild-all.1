Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FEE14A4F3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Aug 2024 06:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724827545; cv=none; b=bMVR3Ri64A/qNN1y6sCDQjMJjjGdgfSQ88j/SgM1MVSXlhqi51Erax0yr7pdTx6CnXzphsvLINhj1NFjdwZCm9kwkrYy4OYeoXG8dxoovK8roDknpHAyAN1WbRLl11C+HiT4D01Wn3ZOzRtexxgtwdQQJZl9okplU4bsfd4C9Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724827545; c=relaxed/simple;
	bh=LNbbYHA5G5fKE6cgGG2ZiHsYSCTRkIrJtRsG4rcF568=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sLia6/9HSQJi/ESuf+JGesAkicTBOGVQonDopBNKwSBaU9qmHbFkFK3enBKM3qp6zf7hBIZmSeCjsSYdl4Ap6PmY5GyrCo8/q5AtlQCG0R2XiYl9gyaPNnBi0N6+p2N5+oGlH3eQpqK+3zWEDuZ2HcfBkA33SHrd/EZXKsfNIKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfJZWe2i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfJZWe2i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724827543; x=1756363543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LNbbYHA5G5fKE6cgGG2ZiHsYSCTRkIrJtRsG4rcF568=;
  b=nfJZWe2iSc6QiHuV/wY3kYfV+MIVL3hPwKDO6m0nEeLk4mWqwg98SBlx
   LXtPwcktaOAZeHHy/90V1sr7b9ktz+AeiM7GXcAN+fgha3WE1etNDYB9U
   XihI2/YU0Ie+ow23xmDGzSiwHobhzKL6Bx7cRT5t+LkA/h+4L1uGR+Dsu
   IiPWnASB+/Qf/e+a2j9IXwjm/Qb1Qqykcw+3ELWZme48UwBHRDt+zvvzG
   1HNC+pNuhsii4U98FbTWcmZ3qfGvFnvNZ0XgnT49mJSlzEuoxe1rKY+y3
   0nZxB34KEFXqatNDBvWgcJ5TtTnR+iyj1vRXuQu6iPBLxzWTcRuamX/pi
   g==;
X-CSE-ConnectionGUID: MNP38DYiQqG2x+XnHxzIcQ==
X-CSE-MsgGUID: ntv0zsvHTJmKGAHqd8teqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="23500194"
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="23500194"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2024 23:45:43 -0700
X-CSE-ConnectionGUID: lIPL3JP9QcuYv7qTq9mzyw==
X-CSE-MsgGUID: FGkO2eFMQVuQ62WwZ3R4mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,182,1719903600"; 
   d="scan'208";a="62963470"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Aug 2024 23:45:41 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjCR1-000KZG-0q;
	Wed, 28 Aug 2024 06:45:39 +0000
Date: Wed, 28 Aug 2024 14:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Zhang <yu.c.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27211/30000] arch/x86/kvm/x86.c:1076:6: warning:
 no previous prototype for function 'kvm_post_set_cr4'
Message-ID: <202408281404.nd7rLidC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   d96e94294726506c2893c3a71305c65168c22526
commit: 8a7e6f51a756aa6e88ebd5da8a5f3b6744cd07b5 [27211/30000] KVM: x86: Introduce kvm_post_set_cr4 to post handle the CR4 emulation
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240828/202408281404.nd7rLidC-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240828/202408281404.nd7rLidC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408281404.nd7rLidC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/x86.c:893:6: warning: no previous prototype for function 'kvm_post_set_cr0' [-Wmissing-prototypes]
     893 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         |      ^
   arch/x86/kvm/x86.c:893:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     893 | void kvm_post_set_cr0(struct kvm_vcpu *vcpu, unsigned long old_cr0, unsigned long cr0)
         | ^
         | static 
>> arch/x86/kvm/x86.c:1076:6: warning: no previous prototype for function 'kvm_post_set_cr4' [-Wmissing-prototypes]
    1076 | void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
         |      ^
   arch/x86/kvm/x86.c:1076:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1076 | void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
         | ^
         | static 
   2 warnings generated.


vim +/kvm_post_set_cr4 +1076 arch/x86/kvm/x86.c

  1075	
> 1076	void kvm_post_set_cr4(struct kvm_vcpu *vcpu, unsigned long old_cr4, unsigned long cr4)
  1077	{
  1078		unsigned long mmu_role_bits = X86_CR4_PGE | X86_CR4_PSE | X86_CR4_PAE |
  1079					      X86_CR4_SMEP | X86_CR4_SMAP | X86_CR4_PKE;
  1080	
  1081		if (((cr4 ^ old_cr4) & mmu_role_bits) ||
  1082		    (!(cr4 & X86_CR4_PCIDE) && (old_cr4 & X86_CR4_PCIDE)))
  1083			kvm_mmu_reset_context(vcpu);
  1084	}
  1085	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
