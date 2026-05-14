Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BED3C063C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 12:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761137; cv=none; b=mTeYRuqdg/LcpuQMqreo/NF6sPfj7hlsjVim+nN8JN59ashyFFMJFp7r1zJe5fOBAo4hwAJk8mahujZ+5WFDo6cPa52Vm6DqZFK7vZnsHIvOqzV26uKJASQmvZ99qlAuVxL/toEfsGDquP7/5YOSshNKqEv3bP7eHI3viyxd/7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761137; c=relaxed/simple;
	bh=06qd3IQ80tFaW7foVzCvpogETm9Qu//jrfWRB4x207w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V4dEIvxx5mMeqjuLHcuY3JW+tekcG3/fAEQiv4/0x6E2Q7ruC8slS0aquarS7WducTdabAHfG2VmPVmQKXEg+/mVH07+zI/U/MtMiEjivPIQ4J+vLh2jjHhFMsomA0wrN6lBAFFTXIvo+nlbVWmmgYQYFQ5JhLtc85bo1UH4rwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tm+OmyG+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tm+OmyG+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778761136; x=1810297136;
  h=date:from:to:cc:subject:message-id;
  bh=06qd3IQ80tFaW7foVzCvpogETm9Qu//jrfWRB4x207w=;
  b=Tm+OmyG+Wbn54Z0zz3i5VdG68eO65ArpXQaIt11Bms4ICjMFT5DQatew
   /0dcB3sTh1rIxZjZ4g7gKHmvvJEwzLaAd6kaCii1cwjKgHdmFPxw3MTvM
   67xCFcpyupaWmcmlgMjn6MkIFG7TL4Hdk5tXvxUD7xHeIjrUWhw8fWZph
   GBGL220nd/4qrC/R+hiDy4Jo9wYGjmbFF9aIx9AVnzvpKMpHnO7IK8NSP
   RJ+NU2Ut8/eskxs3/jOisj9hCE1QK0zDNzCGUKzuxFlqQE/ItINHqF4i1
   9x4fKrOhOBjyBg4/oLxOCrkVxAdA5EV3PrekH5T+HvvouffUKZEgJrrCL
   w==;
X-CSE-ConnectionGUID: JiD3vzZRSgWq7b/dJpCLGg==
X-CSE-MsgGUID: PgqZTNWmQdmb5jXlQnv/Lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="67230280"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="67230280"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:18:44 -0700
X-CSE-ConnectionGUID: RkSaaUIzTNisozBvseeciQ==
X-CSE-MsgGUID: xIo+1vnaQKCTyIUBxcEYyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="243341724"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 14 May 2026 05:18:42 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNV1U-000000006Wi-2NGn;
	Thu, 14 May 2026 12:18:40 +0000
Date: Thu, 14 May 2026 20:17:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Mattson <jmattson@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sean Christopherson <seanjc@google.com>
Subject: [kvm-x86:svm 1/8] arch/x86/kvm/svm/svm.h:651:17: error:
 implicit declaration of function 'kvm_check_has_quirk'; did you mean
 'kvm_check_request'?
Message-ID: <202605142024.lNChAIoo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kvm-x86/linux svm
head:   119ec9368cb346f6d6da95942274fc4ce7bb77ee
commit: 37f5146b36c9744a3011a889cdd71e4155d68dba [1/8] KVM: x86: Define KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT
config: x86_64-buildonly-randconfig-006-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142024.lNChAIoo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142024.lNChAIoo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605142024.lNChAIoo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/svm_onhyperv.c:11:
   arch/x86/kvm/svm/svm.h: In function 'l2_has_separate_pat':
>> arch/x86/kvm/svm/svm.h:651:17: error: implicit declaration of function 'kvm_check_has_quirk'; did you mean 'kvm_check_request'? [-Wimplicit-function-declaration]
     651 |                !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 kvm_check_request
   In file included from arch/x86/kvm/svm/svm_ops.h:7,
                    from arch/x86/kvm/svm/svm_onhyperv.c:12:
   arch/x86/kvm/x86.h: At top level:
>> arch/x86/kvm/x86.h:439:20: error: conflicting types for 'kvm_check_has_quirk'; have 'bool(struct kvm *, u64)' {aka '_Bool(struct kvm *, long long unsigned int)'}
     439 | static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 quirk)
         |                    ^~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/svm.h:651:17: note: previous implicit declaration of 'kvm_check_has_quirk' with type 'int()'
     651 |                !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);
         |                 ^~~~~~~~~~~~~~~~~~~
--
   In file included from kvm/svm/svm_onhyperv.c:11:
   kvm/svm/svm.h: In function 'l2_has_separate_pat':
   kvm/svm/svm.h:651:17: error: implicit declaration of function 'kvm_check_has_quirk'; did you mean 'kvm_check_request'? [-Wimplicit-function-declaration]
     651 |                !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 kvm_check_request
   In file included from kvm/svm/svm_ops.h:7,
                    from kvm/svm/svm_onhyperv.c:12:
   arch/x86/kvm/x86.h: At top level:
>> arch/x86/kvm/x86.h:439:20: error: conflicting types for 'kvm_check_has_quirk'; have 'bool(struct kvm *, u64)' {aka '_Bool(struct kvm *, long long unsigned int)'}
     439 | static inline bool kvm_check_has_quirk(struct kvm *kvm, u64 quirk)
         |                    ^~~~~~~~~~~~~~~~~~~
   kvm/svm/svm.h:651:17: note: previous implicit declaration of 'kvm_check_has_quirk' with type 'int()'
     651 |                !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);
         |                 ^~~~~~~~~~~~~~~~~~~


vim +651 arch/x86/kvm/svm/svm.h

   643	
   644	static inline bool l2_has_separate_pat(struct kvm_vcpu *vcpu)
   645	{
   646		/*
   647		 * If KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled while a vCPU
   648		 * is running, the L2 IA32_PAT semantics for that vCPU are undefined.
   649		 */
   650		return nested_npt_enabled(to_svm(vcpu)) &&
 > 651		       !kvm_check_has_quirk(vcpu->kvm, KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT);
   652	}
   653	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
