Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B3717A305
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 04:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773117018; cv=none; b=T4lTgnKjZGjvIwKi+kX5rU7TA3VEgGdGkVB7ySD1N3EKQYt4xWJ/HkodeHfaWl0KrycofCOJ+/t9CoUxLrbi/8qZwIZL+rlRh5MX/uqtwsHiectxJZCSOvcZuLesUHzetcVfI7xYzStB6OcdWWncB6XlfGoQ9sshCJ//TzzcqXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773117018; c=relaxed/simple;
	bh=yjgvZ9oYn8aB62NOcUAzIgyWQiCjqYmmSd6ukJoHcFU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Gqu4Gs0xwG0sBB6nOytO4JveTItpr04Q2xIqrcu9rZyUflIXZDuQhBmcKFFQVaozmEraF4EfB4yr/L0znJ0f/tZdBYukNNGfQZfJs5qHDW3QRM8S41+SHIVVq2rwk36gkwPrR2Nfyr0ZzAPwdL58GPdOfYzsplZe9j0JmpfId4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gIJ6SaHX; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gIJ6SaHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773117017; x=1804653017;
  h=date:from:to:cc:subject:message-id;
  bh=yjgvZ9oYn8aB62NOcUAzIgyWQiCjqYmmSd6ukJoHcFU=;
  b=gIJ6SaHXVXky+d7/Q04Mtjs0x39ZrlaDBrpWscnnsNa0lBx9WDd1o3x7
   6G8aFj3kJUCa79V9AvmQymOonGuZDCa5FW9NBmPUp07m9fGJkv3cp93OL
   zulkDgOBLL1Ji7dKEdfs5dwO1G+lH22NniIJQrHbNjECeGKqNpHEEJXcP
   0isuEmZf/RYVlx1LZve8l79cBAjNR8omdGPbGbTp8KrKEf/E0i43bEAE+
   FGYF+C5mRUA6jn1o3hpd2vL4hRDrjUVAjOLE2i8RSJkWTKrMgjX47PLmq
   7kLSL4zAuuCvyu1/tYQfQ+03rme1OQyMAfPsqbtHGZojSYEyySVfIMvJe
   A==;
X-CSE-ConnectionGUID: InkzN/u7Tb+KI88O/iaRtg==
X-CSE-MsgGUID: 3GuGZU5YS5u7IYURYU5EMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="78031923"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="78031923"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 21:30:17 -0700
X-CSE-ConnectionGUID: 41n7w+Z5Q62eQdmMcDB4UQ==
X-CSE-MsgGUID: Xz8gCGmGQgqc+LETpLsQOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="217981564"
Received: from lkp-server01.sh.intel.com (HELO 434e41ea3c86) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Mar 2026 21:30:15 -0700
Received: from kbuild by 434e41ea3c86 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzojU-000000001JY-1XDL;
	Tue, 10 Mar 2026 04:30:12 +0000
Date: Tue, 10 Mar 2026 12:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>
Subject: arch/x86/hyperv/hv_crash.c:512:45-51: ERROR: application of
 sizeof to pointer
Message-ID: <202603101143.qUL1R1iy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1f318b96cc84d7c2ab792fcc0bfd42a7ca890681
commit: 77c860d2dbb72d1f3c6a2e882a07d19eca399db5 x86/hyperv: Enable build of hypervisor crashdump collection files
date:   4 months ago
config: x86_64-randconfig-r061-20260310 (https://download.01.org/0day-ci/archive/20260310/202603101143.qUL1R1iy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603101143.qUL1R1iy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/hyperv/hv_crash.c:512:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:517:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:521:45-51: ERROR: application of sizeof to pointer
   arch/x86/hyperv/hv_crash.c:525:45-51: ERROR: application of sizeof to pointer

vim +512 arch/x86/hyperv/hv_crash.c

94212d34618c26 Mukesh Rathor 2025-10-06  499  
94212d34618c26 Mukesh Rathor 2025-10-06  500  /*
94212d34618c26 Mukesh Rathor 2025-10-06  501   * Build 32bit trampoline page table for transition from protected mode
94212d34618c26 Mukesh Rathor 2025-10-06  502   * non-paging to long-mode paging. This transition needs pagetables below 4G.
94212d34618c26 Mukesh Rathor 2025-10-06  503   */
94212d34618c26 Mukesh Rathor 2025-10-06  504  static void hv_crash_build_tramp_pt(void)
94212d34618c26 Mukesh Rathor 2025-10-06  505  {
94212d34618c26 Mukesh Rathor 2025-10-06  506  	p4d_t *p4d;
94212d34618c26 Mukesh Rathor 2025-10-06  507  	pud_t *pud;
94212d34618c26 Mukesh Rathor 2025-10-06  508  	pmd_t *pmd;
94212d34618c26 Mukesh Rathor 2025-10-06  509  	pte_t *pte;
94212d34618c26 Mukesh Rathor 2025-10-06  510  	u64 pa, addr = trampoline_pa;
94212d34618c26 Mukesh Rathor 2025-10-06  511  
94212d34618c26 Mukesh Rathor 2025-10-06 @512  	p4d = hv_crash_ptpgs[0] + pgd_index(addr) * sizeof(p4d);
94212d34618c26 Mukesh Rathor 2025-10-06  513  	pa = virt_to_phys(hv_crash_ptpgs[1]);
94212d34618c26 Mukesh Rathor 2025-10-06  514  	set_p4d(p4d, __p4d(_PAGE_TABLE | pa));
94212d34618c26 Mukesh Rathor 2025-10-06  515  	p4d->p4d &= ~(_PAGE_NX);	/* enable execute */
94212d34618c26 Mukesh Rathor 2025-10-06  516  
94212d34618c26 Mukesh Rathor 2025-10-06  517  	pud = hv_crash_ptpgs[1] + pud_index(addr) * sizeof(pud);
94212d34618c26 Mukesh Rathor 2025-10-06  518  	pa = virt_to_phys(hv_crash_ptpgs[2]);
94212d34618c26 Mukesh Rathor 2025-10-06  519  	set_pud(pud, __pud(_PAGE_TABLE | pa));
94212d34618c26 Mukesh Rathor 2025-10-06  520  
94212d34618c26 Mukesh Rathor 2025-10-06  521  	pmd = hv_crash_ptpgs[2] + pmd_index(addr) * sizeof(pmd);
94212d34618c26 Mukesh Rathor 2025-10-06  522  	pa = virt_to_phys(hv_crash_ptpgs[3]);
94212d34618c26 Mukesh Rathor 2025-10-06  523  	set_pmd(pmd, __pmd(_PAGE_TABLE | pa));
94212d34618c26 Mukesh Rathor 2025-10-06  524  
94212d34618c26 Mukesh Rathor 2025-10-06  525  	pte = hv_crash_ptpgs[3] + pte_index(addr) * sizeof(pte);
94212d34618c26 Mukesh Rathor 2025-10-06  526  	set_pte(pte, pfn_pte(addr >> PAGE_SHIFT, PAGE_KERNEL_EXEC));
94212d34618c26 Mukesh Rathor 2025-10-06  527  }
94212d34618c26 Mukesh Rathor 2025-10-06  528  

:::::: The code at line 512 was first introduced by commit
:::::: 94212d34618c2608758128da32ddac2ad834cb9f x86/hyperv: Implement hypervisor RAM collection into vmcore

:::::: TO: Mukesh Rathor <mrathor@linux.microsoft.com>
:::::: CC: Wei Liu <wei.liu@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
