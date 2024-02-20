Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB176405
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Feb 2024 16:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708447148; cv=none; b=OCSE1vc4vWhcN3EbvyH+pGchLzB+SgSr9uOVeVzRj9orjBuxvarIgszIr/qguA/Bc4gZxdDWMfc64mpqhrV8yn07gaGs9GCO51DriognEW1Jd6eyKtaVoO8mru5Eekk95Zpet0QnH7ohI3aqcpL6bpDqbGXaiCpS0DP46LOw0xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708447148; c=relaxed/simple;
	bh=NRZyI8JUvS947aseBXtfmYAmYGn+Y4Ec4rnAftdXjHM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMY1O41CuPKJYis+peKT5miQOSK3OH4ZxTqw2xLoM2fQiR/ONzL2CoRm1mh8K5zkSyZeZBQLG4xDn5T3oPF6Bn9M33IadAr81dj/6KTYcX3TmN69ogUSd8tpUJW68a6we+tXM85wSvPDuyQ0t8bB8nkYSTkNcr7yFhnnFvBgpaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhIeS1CH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhIeS1CH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708447146; x=1739983146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NRZyI8JUvS947aseBXtfmYAmYGn+Y4Ec4rnAftdXjHM=;
  b=fhIeS1CH+C9yVvFVpJ/xYXcdbr4WYEyzTx7D5yj8bIRwFbG1pNohniD+
   jYXintjSX42/wm+j54SBcqt+hBsllrFIJIdnidNvAfEvxT9GPCsleAMev
   Hnf3WbUrVOywXLdBw/iBQeHi3m2UFxA6Xpt0Ta8J1s6eOV3OTzNjzJ7Nn
   ZnIh8ugkaNOjN5HXbxCquLTt3Y0jNS23gd4Swuk+pLhm4EKnrWDt/XqKO
   uBpyjAEa1JnN9FCqWt8rXXASATWpRV6/dPTN0QSmWvybav2iNuD3oFbOJ
   ICrae3xquGYSW68j7CdWFurNexQhpYRsPhfYzDgZpNuPqdw6kFyNO/0+A
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2420101"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="2420101"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 08:39:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4723708"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 20 Feb 2024 08:39:05 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcT94-0004gi-18;
	Tue, 20 Feb 2024 16:39:02 +0000
Date: Wed, 21 Feb 2024 00:38:04 +0800
From: kernel test robot <lkp@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8207/8260] arch/x86/entry/entry_fred.c:117:9:
 error: use of undeclared identifier 'POSTED_INTR_VECTOR'
Message-ID: <202402210011.c42QmSp5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
commit: 9417678a33c0554ed930380727cff11d91cfbb8a [8207/8260] Merge branch 'next' of git://git.kernel.org/pub/scm/virt/kvm/kvm.git
config: x86_64-randconfig-104-20240220 (https://download.01.org/0day-ci/archive/20240221/202402210011.c42QmSp5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240221/202402210011.c42QmSp5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402210011.c42QmSp5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/entry/entry_fred.c:117:9: error: use of undeclared identifier 'POSTED_INTR_VECTOR'
     117 |         SYSVEC(POSTED_INTR_VECTOR,              kvm_posted_intr_ipi),
         |                ^
>> arch/x86/entry/entry_fred.c:118:9: error: use of undeclared identifier 'POSTED_INTR_WAKEUP_VECTOR'
     118 |         SYSVEC(POSTED_INTR_WAKEUP_VECTOR,       kvm_posted_intr_wakeup_ipi),
         |                ^
>> arch/x86/entry/entry_fred.c:119:9: error: use of undeclared identifier 'POSTED_INTR_NESTED_VECTOR'
     119 |         SYSVEC(POSTED_INTR_NESTED_VECTOR,       kvm_posted_intr_nested_ipi),
         |                ^
   3 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PADATA
   Depends on [n]: SMP [=n]
   Selected by [y]:
   - HUGETLBFS [=y] && (X86 [=y] || SPARC64 || ARCH_SUPPORTS_HUGETLBFS [=n] || BROKEN [=n]) && (SYSFS [=y] || SYSCTL [=y])


vim +/POSTED_INTR_VECTOR +117 arch/x86/entry/entry_fred.c

14619d912b658e H. Peter Anvin (Intel  2023-12-09   99) 
14619d912b658e H. Peter Anvin (Intel  2023-12-09  100) static idtentry_t sysvec_table[NR_SYSTEM_VECTORS] __ro_after_init = {
14619d912b658e H. Peter Anvin (Intel  2023-12-09  101) 	SYSVEC(ERROR_APIC_VECTOR,		error_interrupt),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  102) 	SYSVEC(SPURIOUS_APIC_VECTOR,		spurious_apic_interrupt),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  103) 	SYSVEC(LOCAL_TIMER_VECTOR,		apic_timer_interrupt),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  104) 	SYSVEC(X86_PLATFORM_IPI_VECTOR,		x86_platform_ipi),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  105) 
14619d912b658e H. Peter Anvin (Intel  2023-12-09  106) 	SYSVEC(RESCHEDULE_VECTOR,		reschedule_ipi),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  107) 	SYSVEC(CALL_FUNCTION_SINGLE_VECTOR,	call_function_single),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  108) 	SYSVEC(CALL_FUNCTION_VECTOR,		call_function),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  109) 	SYSVEC(REBOOT_VECTOR,			reboot),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  110) 
14619d912b658e H. Peter Anvin (Intel  2023-12-09  111) 	SYSVEC(THRESHOLD_APIC_VECTOR,		threshold),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  112) 	SYSVEC(DEFERRED_ERROR_VECTOR,		deferred_error),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  113) 	SYSVEC(THERMAL_APIC_VECTOR,		thermal),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  114) 
14619d912b658e H. Peter Anvin (Intel  2023-12-09  115) 	SYSVEC(IRQ_WORK_VECTOR,			irq_work),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  116) 
14619d912b658e H. Peter Anvin (Intel  2023-12-09 @117) 	SYSVEC(POSTED_INTR_VECTOR,		kvm_posted_intr_ipi),
14619d912b658e H. Peter Anvin (Intel  2023-12-09 @118) 	SYSVEC(POSTED_INTR_WAKEUP_VECTOR,	kvm_posted_intr_wakeup_ipi),
14619d912b658e H. Peter Anvin (Intel  2023-12-09 @119) 	SYSVEC(POSTED_INTR_NESTED_VECTOR,	kvm_posted_intr_nested_ipi),
14619d912b658e H. Peter Anvin (Intel  2023-12-09  120) };
14619d912b658e H. Peter Anvin (Intel  2023-12-09  121) 

:::::: The code at line 117 was first introduced by commit
:::::: 14619d912b658ecd9573fb88400d3830a29cadcb x86/fred: FRED entry/exit and dispatch code

:::::: TO: H. Peter Anvin (Intel) <hpa@zytor.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
