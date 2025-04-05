Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6409F22EE5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 16:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743869198; cv=none; b=FmTfZQVE8Iktm0QPhNHlV3Y4mhfi8q2LLft74IQd+hxhz/Duk4lTZcd2rprM/hRGx5SCVC9DwQhawZhcO3UAMLfZv7/OslJtkkG3lNYuM/c+KmH9svjp2hvD/O7hOTMWPEkuBZEazr4YplO7P7LrmdDsXjcUF+xrpSJSEQzmupA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743869198; c=relaxed/simple;
	bh=wh8Xir7oPT/fPNNjeAnjXKen3mgYJA1rKEG4kqSCkBw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ro7Vyw5NL4r+4bxtqcPM1Z15lisxfgYqMOkxcu3eU1HOJbXTgwpx0p1LG4V5O9hAQzcRVF1fVA/SKioUTpcFZT5DZc4RmtwY8P8cnMGxDqk3KFdNzHco031V8se7GEg7c5Szn2XWBgktGYJeSgVMVqJJJCfG2b67bZ307w0om1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JobzUHUD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JobzUHUD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743869196; x=1775405196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wh8Xir7oPT/fPNNjeAnjXKen3mgYJA1rKEG4kqSCkBw=;
  b=JobzUHUDtr/YWL8LvuyoYHf8A4vcOtZQ5+T56MWqFC6Hi5auwKyRno7N
   fJDdUkDjCOzLOjR70eAD0KhJ4MjcxGVeDhb8vtxR3fd15N0H/U/OHV0wq
   qnP15hxRvrrdNe+WyyXDPHCmAR1eOk2bhjQh89COqLQPGsUps9RLytpN1
   fqtBdY2GXdxNloT4NhzqJne9QCff82EBwpcWxQ9PD35Gj5VLq38AZQwRA
   Mb0W/LXFaVz17i/8n0XwQqD5rm2S6+32IDDblsagcjRyhL0BXsPszpGQ+
   Rh02JYfJKa7jjYCuqXBOMqKyXXcVeSPhl9anK2Mu+UfpMOX/ycU12TwQU
   A==;
X-CSE-ConnectionGUID: t/FGzNzhQZOsu++TVklCRQ==
X-CSE-MsgGUID: bdVBJkzMQpS1m+fzzaErAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11395"; a="48007884"
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="48007884"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 09:06:35 -0700
X-CSE-ConnectionGUID: fA1z9pbiTs+gnlXtONiqCA==
X-CSE-MsgGUID: 3FSu3R2QQqOPSubvVfpmqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,191,1739865600"; 
   d="scan'208";a="132693780"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Apr 2025 09:06:34 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u162S-00028m-2X;
	Sat, 05 Apr 2025 16:06:32 +0000
Date: Sun, 6 Apr 2025 00:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 14385/14442] arch/riscv/mm/tlbflush.c:195:23:
 error: 'start' redeclared as different kind of symbol
Message-ID: <202504052327.TaOMZqqS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a4cda136f021ad44b8b52286aafd613030a6db5f
commit: d2f56286fc6d70b5dbf84e79694bb4e901179773 [14385/14442] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20250405/202504052327.TaOMZqqS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504052327.TaOMZqqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504052327.TaOMZqqS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/mm/tlbflush.c: In function 'arch_tlbbatch_add_pending':
>> arch/riscv/mm/tlbflush.c:195:23: error: 'start' redeclared as different kind of symbol
     195 |         unsigned long start = uaddr & PAGE_MASK;
         |                       ^~~~~
   arch/riscv/mm/tlbflush.c:193:53: note: previous definition of 'start' with type 'long unsigned int'
     193 |                 struct mm_struct *mm, unsigned long start, unsigned long end)
         |                                       ~~~~~~~~~~~~~~^~~~~
>> arch/riscv/mm/tlbflush.c:195:31: error: 'uaddr' undeclared (first use in this function)
     195 |         unsigned long start = uaddr & PAGE_MASK;
         |                               ^~~~~
   arch/riscv/mm/tlbflush.c:195:31: note: each undeclared identifier is reported only once for each function it appears in


vim +/start +195 arch/riscv/mm/tlbflush.c

54d7431af73e2fa Alexandre Ghiti 2024-01-08  191  
54d7431af73e2fa Alexandre Ghiti 2024-01-08  192  void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
2f4ab3ac10e1476 Barry Song      2025-02-14  193  		struct mm_struct *mm, unsigned long start, unsigned long end)
54d7431af73e2fa Alexandre Ghiti 2024-01-08  194  {
d9be2b9b60497a8 Alexandre Ghiti 2025-01-13 @195  	unsigned long start = uaddr & PAGE_MASK;
d9be2b9b60497a8 Alexandre Ghiti 2025-01-13  196  
54d7431af73e2fa Alexandre Ghiti 2024-01-08  197  	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
d9be2b9b60497a8 Alexandre Ghiti 2025-01-13  198  	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, start + PAGE_SIZE);
54d7431af73e2fa Alexandre Ghiti 2024-01-08  199  }
54d7431af73e2fa Alexandre Ghiti 2024-01-08  200  

:::::: The code at line 195 was first introduced by commit
:::::: d9be2b9b60497a82aeceec3a98d8b37fdd2960f2 riscv: Call secondary mmu notifier when flushing the tlb

:::::: TO: Alexandre Ghiti <alexghiti@rivosinc.com>
:::::: CC: Alexandre Ghiti <alexghiti@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
