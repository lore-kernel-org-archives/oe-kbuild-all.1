Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4D9364DC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718119916; cv=none; b=KABz5XfjdIFtjNFGOQcfa9V0VOQIQOWohsjWlDbYzx23KbR8b+wJm364oOxqZqt9IPWRnSIihvd94YKLf10UqarfkB6gqRWX0MdCHmk81fevQthwGJn7zwVxqYyHq4JXuOkLaYAty5IM7hkyGFxgWZuNJm8Y9ytsEpnps/j57xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718119916; c=relaxed/simple;
	bh=2Yso27yjvDxMuNfXsFjt67gWcXNlur6YH4ThKAzLA2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eGUKclIWLUmKs0db1C2oYfAmv3AUlnSsxKk6onAJmn8OE6KcirAY51uUQPh0QK0rXG2faF8rHejaaamsu74CDkjZRMZMcLoSdZrGXdcMBGJq2ZkU33LUBBwS8lS8P0xrxQ81tc5yM6JmMxetSEF0106TvLDe/7st5UIm2+jQBM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B88eWJXC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B88eWJXC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718119915; x=1749655915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2Yso27yjvDxMuNfXsFjt67gWcXNlur6YH4ThKAzLA2g=;
  b=B88eWJXCtcZRQ51k4ldIa87p9QyY35LOwG41xx8Uq/bzW5x8v96vBxyK
   aDVuFdOvRS72AgiZu/LeI5KXUfAJmzpF8nXZF03JhZNq4+BZza9inon0b
   VAzVozlwln3ofUJIglmkYDKA7jmjGrlGflRid2S/AdF9Pye8Jpe08eekF
   8YcRkx48I9VCtEsTaFJ5hBZI6ubwxUww5/esVvRMoeXGKsLeETqK889uf
   E9LJCRlZfQGXeUorcNR+2+8H5CykxAI2rqDkXmSX61Z995B0mMjzKEzkn
   abyPjjb/Fa3eIzB9RdX+x28De4yi0sGG0xkELJTEZidqL9cwU4uZEiU3n
   Q==;
X-CSE-ConnectionGUID: BU96M+XjRHG08/9k/ebHSQ==
X-CSE-MsgGUID: xnF2OfS9Sw2ISo8rrBXmhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="17760917"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="17760917"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 08:31:45 -0700
X-CSE-ConnectionGUID: Rd56MZMRSJ6FlWuS1dap1A==
X-CSE-MsgGUID: PkIXjZO+T0eHg5ILPDGNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="40082283"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2024 08:31:43 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH3TJ-0000as-2Y;
	Tue, 11 Jun 2024 15:31:41 +0000
Date: Tue, 11 Jun 2024 23:30:43 +0800
From: kernel test robot <lkp@intel.com>
To: John David Anglin <dave@parisc-linux.org>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [deller-parisc:for-next 1/1] arch/parisc/kernel/cache.c:846:14:
 error: implicit declaration of function 'find_vm_area'; did you mean
 'find_vma_prev'?
Message-ID: <202406112322.OntJaG4o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   4793c2fbc0e7e5a257b475f9f6b9fb5c3d67d9ef
commit: 4793c2fbc0e7e5a257b475f9f6b9fb5c3d67d9ef [1/1] parisc: Try to fix random segmentation faults in package builds
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240611/202406112322.OntJaG4o-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406112322.OntJaG4o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406112322.OntJaG4o-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/parisc/kernel/cache.c: In function 'flush_cache_vmap':
>> arch/parisc/kernel/cache.c:846:14: error: implicit declaration of function 'find_vm_area'; did you mean 'find_vma_prev'? [-Werror=implicit-function-declaration]
     846 |         vm = find_vm_area((void *)start);
         |              ^~~~~~~~~~~~
         |              find_vma_prev
>> arch/parisc/kernel/cache.c:846:12: warning: assignment to 'struct vm_struct *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     846 |         vm = find_vm_area((void *)start);
         |            ^
>> arch/parisc/kernel/cache.c:853:15: error: invalid use of undefined type 'struct vm_struct'
     853 |         if (vm->flags & VM_IOREMAP) {
         |               ^~
>> arch/parisc/kernel/cache.c:853:25: error: 'VM_IOREMAP' undeclared (first use in this function); did you mean 'VM_READ'?
     853 |         if (vm->flags & VM_IOREMAP) {
         |                         ^~~~~~~~~~
         |                         VM_READ
   arch/parisc/kernel/cache.c:853:25: note: each undeclared identifier is reported only once for each function it appears in
   arch/parisc/kernel/cache.c:854:30: error: invalid use of undefined type 'struct vm_struct'
     854 |                 physaddr = vm->phys_addr;
         |                              ^~
   cc1: some warnings being treated as errors


vim +846 arch/parisc/kernel/cache.c

   821	
   822	/*
   823	 * The physical address for pages in the ioremap case can be obtained
   824	 * from the vm_struct struct. I wasn't able to successfully handle the
   825	 * vmalloc and vmap cases. We have an array of struct page pointers in
   826	 * the uninitialized vmalloc case but the flush failed using page_to_pfn.
   827	 */
   828	void flush_cache_vmap(unsigned long start, unsigned long end)
   829	{
   830		unsigned long addr, physaddr;
   831		struct vm_struct *vm;
   832	
   833		/* Prevent cache move-in */
   834		flush_tlb_kernel_range(start, end);
   835	
   836		if (end - start >= parisc_cache_flush_threshold) {
   837			flush_cache_all();
   838			return;
   839		}
   840	
   841		if (WARN_ON_ONCE(!is_vmalloc_addr((void *)start))) {
   842			flush_cache_all();
   843			return;
   844		}
   845	
 > 846		vm = find_vm_area((void *)start);
   847		if (WARN_ON_ONCE(!vm)) {
   848			flush_cache_all();
   849			return;
   850		}
   851	
   852		/* The physical addresses of IOREMAP regions are contiguous */
 > 853		if (vm->flags & VM_IOREMAP) {
   854			physaddr = vm->phys_addr;
   855			for (addr = start; addr < end; addr += PAGE_SIZE) {
   856				preempt_disable();
   857				flush_dcache_page_asm(physaddr, start);
   858				flush_icache_page_asm(physaddr, start);
   859				preempt_enable();
   860				physaddr += PAGE_SIZE;
   861			}
   862			return;
   863		}
   864	
   865		flush_cache_all();
   866	}
   867	EXPORT_SYMBOL(flush_cache_vmap);
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
