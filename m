Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674341AA7A5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 11:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733312259; cv=none; b=lRR6GUODzL2XC+LYTB8Hapd+df7W6j34qY34XlopR7gYaj1V2MbmsKnpfpPcRc++nhjkjIvRFD3JUMYI2g6wJdt/d6FHNK1vBkbMoGu/R2hALAmEkxBBryMt81ZPYZadKIy8YU1U6bM7NmnB3t/ER5arOYWhYlXTvxUGLAqq/l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733312259; c=relaxed/simple;
	bh=CgGYL0nk9a5aNedF1W/MSpBGjljwosPpFN7zTe+WRTA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJQ9FILwVDNVLgkxEjnF0U4y6Z5Yw+y0RXHB8qI5G5Ltwd+JEfhKyVrIf3ksEqRhyUzgYnj0mJJUiBhO9ekplG14lnrgNYvN5tUIU0d7y1lLOpnVHxLoJlnXv/HtQmA8ehcA7dS9ZHKEO/6YyWVoO2/nG0LASwZV8Adtkj/OQ5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hyZQcWwC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hyZQcWwC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733312257; x=1764848257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CgGYL0nk9a5aNedF1W/MSpBGjljwosPpFN7zTe+WRTA=;
  b=hyZQcWwC8MWb/iL4Mae6Q6bgE09bg+P3IpNugq46syIG5VOFDMK+k7eM
   naHKm4f/rUCVwg0R8IqkKJfKIVarb7FBbg+1Dn6iUcHC7YvI5PAKIF/as
   2DyRZYT29vzDIj5p9NtDp1fFy/XvwpH1EtLT/20EFgk46pEJ+ax2vfDMA
   6x5e7lvJqDfwX7MY+l9HfyQZQFgfgvNSrnSBBJ6GmqIqGsspInKccXjH5
   qY5ptc5u/ZKnzAfspqLqNmXxHyjd5KQ+XMmjmLpWQcG7Y+CVUlt8O745E
   rh6kPXHnLNYv/Jpd94626s3rl73TUnsWiNP5cUeEmQ49l1rVXB+EYUU4a
   g==;
X-CSE-ConnectionGUID: 3XhbMyMgQYuqGCtxKpmG8A==
X-CSE-MsgGUID: TdhAWvBDRKely8SLXVYJjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="58987526"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="58987526"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 03:33:48 -0800
X-CSE-ConnectionGUID: aHt8/mlMRBi5cS/smf7Bvg==
X-CSE-MsgGUID: NsZ5ZYbPQv+y0Rz3Lix5HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="93927205"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 04 Dec 2024 03:33:47 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIndZ-0002xb-0f;
	Wed, 04 Dec 2024 11:33:45 +0000
Date: Wed, 4 Dec 2024 19:32:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 157/259]
 arch/x86/kvm/x86.c:9954:5: sparse: sparse: symbol 'kvm_pkvm_hypercall' was
 not declared. Should it be static?
Message-ID: <202412041943.Q3LQjLKa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: f017b9a4d4afc41a8115672dcf10c0acfcf0e8ae [157/259] ANDROID: pkvm: x86: Move pkvm guest hypercalls to uapi directory
config: x86_64-randconfig-122-20241204 (https://download.01.org/0day-ci/archive/20241204/202412041943.Q3LQjLKa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041943.Q3LQjLKa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041943.Q3LQjLKa-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/x86.c:207:14: sparse: sparse: symbol 'pvsched_max_kerncs_us' was not declared. Should it be static?
   arch/x86/kvm/x86.c:213:14: sparse: sparse: symbol 'pvsched_max_taskprio_us' was not declared. Should it be static?
   arch/x86/kvm/x86.c:266:47: sparse: sparse: array of flexible structures
   arch/x86/kvm/x86.c: note: in included file:
   include/linux/kvm_host.h:2022:54: sparse: sparse: array of flexible structures
   arch/x86/kvm/x86.c:292:49: sparse: sparse: array of flexible structures
   include/linux/kvm_host.h:2024:56: sparse: sparse: array of flexible structures
>> arch/x86/kvm/x86.c:9954:5: sparse: sparse: symbol 'kvm_pkvm_hypercall' was not declared. Should it be static?
   arch/x86/kvm/x86.c:3026:9: sparse: sparse: context imbalance in '__kvm_start_pvclock_update' - wrong count at exit
   arch/x86/kvm/x86.c:3037:13: sparse: sparse: context imbalance in 'kvm_end_pvclock_update' - unexpected unlock
   arch/x86/kvm/x86.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/kvm/x86.c:4736:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c:4736:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c:4736:42: sparse: sparse: self-comparison always evaluates to false
   arch/x86/kvm/x86.c: note: in included file (through include/linux/notifier.h, include/linux/memory_hotplug.h, include/linux/mmzone.h, ...):
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'vcpu_enter_guest' - unexpected unlock
   include/linux/srcu.h:285:9: sparse: sparse: context imbalance in 'vcpu_run' - unexpected unlock

vim +/kvm_pkvm_hypercall +9954 arch/x86/kvm/x86.c

0dbb11230437895 Ashish Kalra  2021-06-08  9953  
f8f823218b4ef3f Shaoqin Huang 2022-08-24 @9954  int kvm_pkvm_hypercall(struct kvm_vcpu *vcpu)
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9955  {
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9956  	unsigned long val, nr;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9957  	int size;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9958  	gpa_t gpa;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9959  	int ret;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9960  
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9961  	nr = kvm_rax_read(vcpu);
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9962  	gpa = kvm_rbx_read(vcpu);
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9963  	size = kvm_rcx_read(vcpu);
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9964  	val = kvm_rdx_read(vcpu);
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9965  
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9966  	/*
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9967  	 * Reuse the sev_es handler to emulate the mmio.
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9968  	 */
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9969  	switch (nr) {
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9970  	case PKVM_GHC_IOREAD:
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9971  		ret = kvm_sev_es_mmio_read(vcpu, gpa, size,
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9972  				&vcpu->arch.regs[VCPU_REGS_RAX]);
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9973  		break;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9974  	case PKVM_GHC_IOWRITE:
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9975  		ret = kvm_sev_es_mmio_write(vcpu, gpa, size, &val);
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9976  		break;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9977  	default:
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9978  		ret = 1;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9979  		break;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9980  	}
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9981  
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9982  	/*
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9983  	 * We assume calling this function will always success which will update
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9984  	 * the GUEST_RIP to skip the current instruction.
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9985  	 */
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9986  	static_call(kvm_x86_skip_emulated_instruction)(vcpu);
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9987  
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9988  	return ret;
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9989  }
f8f823218b4ef3f Shaoqin Huang 2022-08-24  9990  

:::::: The code at line 9954 was first introduced by commit
:::::: f8f823218b4ef3fc30f8cb32735799b1ede9a4c9 ANDROID: pkvm: x86: Add the handler for hypercalls of PV MMIO operations

:::::: TO: Shaoqin Huang <shaoqin.huang@intel.com>
:::::: CC: Tomasz Nowicki <tnowicki@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
