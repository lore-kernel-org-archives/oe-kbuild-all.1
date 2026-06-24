Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9859323E325
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 01:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782265899; cv=none; b=sqvr6nJmSQWGglL2DUEODiyvDQHsgMrDIZGNo8xc3Yp7j8rJhDXL2ZpJ2KoKlbQSk0yHxbfvKHL+dUkwYjuSuKYXldVjZgRm9AlwyCKQ5dUn+rWsqeTu0QWV8dwt9bIF1KbtLNv3mN4kpyxGPuCSd8pIc0V9Ud4j6f3BJyCWblI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782265899; c=relaxed/simple;
	bh=ZdsBYN2+aH1Ngf0MskZfQnS8PDCiD1OqSU2Hll3OOZE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hFuFIAu0Mq/idWQDbe/GE1u3Rz9MPsAc9reN42Mvrhi8d9/3p6j05q9tUyfa2+elYy8y5FGHnFlSTEFkDQuXJEQRr4UaAY5sp6EWGd+3nm6iqJUQws5XDHwUpd2/ug+IG6DQOtU+QnP3XqX6j8lgookETX9hfCKlrnO7iOV/n8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=js6GaqQb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="js6GaqQb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782265898; x=1813801898;
  h=date:from:to:cc:subject:message-id;
  bh=ZdsBYN2+aH1Ngf0MskZfQnS8PDCiD1OqSU2Hll3OOZE=;
  b=js6GaqQbDsDI43VBOvlR/S/YsCMx6Kq46v/ifbx55f49l4bOtJXg0qUj
   Z52B1xLGLhpTFKx5a4TALdoEHn7ZnZRyGO8C0yZlL1Hief4m+Lyz7sat8
   RBZQN00YFxjX/Rb38PdVPcZJpVMVgKJBay0TJSMF3/CNYG6zJ1miLYMsk
   JEp2H4uZyyihIURCtCVJPTwhSaaElAn+9+faBk432CRAJyXUVHckkWOYN
   JiFteYcucsJdmNg7VAi13EQnXTHj1Z8FUEOgNEOJWa5QKrbKfyx60De7y
   uAJtO2UtqVmtPxpSOtt7VavY1EKf+DTjRP0Df7uKvFYCnxt8xZHnRnYNP
   w==;
X-CSE-ConnectionGUID: 65VrrQafToy7HIU+l84oeg==
X-CSE-MsgGUID: xmATAJqwSUGUyIfVfTVDOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100569103"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="100569103"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 18:51:37 -0700
X-CSE-ConnectionGUID: cYJfNOmwTUOOLEi5moZ8og==
X-CSE-MsgGUID: JCwyCRjASTStr3P0gyDHPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="249790015"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 23 Jun 2026 18:51:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcCm5-0000000032x-0Es3;
	Wed, 24 Jun 2026 01:51:33 +0000
Date: Wed, 24 Jun 2026 09:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:cca/temp-in-place-conversion 29/102]
 arch/arm64/kvm/rmi.c:608:7: error: duplicate case value '536870912'
Message-ID: <202606240900.nYFHTn3Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git cca/temp-in-place-conversion
head:   4095e546cca85e5558a35176ef689959971f7d70
commit: 6a5a96be9d81b6bb481337374716287ba4d7af7d [29/102] arm64: RMI: Runtime faulting of memory
config: arm64-randconfig-004-20260624 (https://download.01.org/0day-ci/archive/20260624/202606240900.nYFHTn3Y-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project a9b492db3d50683e446cd1a5c9ffaf4e92cb77a7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240900.nYFHTn3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240900.nYFHTn3Y-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kvm/rmi.c:608:7: error: duplicate case value '536870912'
     608 |         case PUD_SIZE:
         |              ^
   include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
      20 | #define PUD_SIZE        (1UL << PUD_SHIFT)
         |                         ^
   arch/arm64/kvm/rmi.c:605:7: note: previous case defined here
     605 |         case P4D_SIZE:
         |              ^
   include/asm-generic/pgtable-nop4d.h:13:19: note: expanded from macro 'P4D_SIZE'
      13 | #define P4D_SIZE                (1UL << P4D_SHIFT)
         |                                 ^
   arch/arm64/kvm/rmi.c:611:7: error: duplicate case value '536870912'
     611 |         case PMD_SIZE:
         |              ^
   include/asm-generic/pgtable-nopmd.h:22:20: note: expanded from macro 'PMD_SIZE'
      22 | #define PMD_SIZE        (1UL << PMD_SHIFT)
         |                         ^
   arch/arm64/kvm/rmi.c:608:7: note: previous case defined here
     608 |         case PUD_SIZE:
         |              ^
   include/asm-generic/pgtable-nopud.h:20:20: note: expanded from macro 'PUD_SIZE'
      20 | #define PUD_SIZE        (1UL << PUD_SHIFT)
         |                         ^
   2 errors generated.


vim +/536870912 +608 arch/arm64/kvm/rmi.c

   599	
   600	static unsigned long addr_range_desc(unsigned long phys, unsigned long size)
   601	{
   602		unsigned long out = 0;
   603	
   604		switch (size) {
   605		case P4D_SIZE:
   606			out = 3 | (1 << 2);
   607			break;
 > 608		case PUD_SIZE:
   609			out = 2 | (1 << 2);
   610			break;
   611		case PMD_SIZE:
   612			out = 1 | (1 << 2);
   613			break;
   614		case PAGE_SIZE:
   615			out = 0 | (1 << 2);
   616			break;
   617		default:
   618			/*
   619			 * Only support mapping at the page level granulatity when
   620			 * it's an unusual length. This should get us back onto a larger
   621			 * block size for the subsequent mappings.
   622			 */
   623			out = 0 | ((MIN(size >> PAGE_SHIFT, PTRS_PER_PTE - 1)) << 2);
   624			break;
   625		}
   626	
   627		WARN_ON(phys & ~PAGE_MASK);
   628	
   629		out |= phys & PAGE_MASK;
   630	
   631		return out;
   632	}
   633	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
