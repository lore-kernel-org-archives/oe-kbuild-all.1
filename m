Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401C01ABEB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734695000; cv=none; b=XpA3/y0FGqOfQir8KXExnwFOck5AmkFOCwILrjWMc6+55jp7nUhQsV9+UbuoNvNgLQitQOTP4Pyj9kD3nS1nSQqo9eemr+yphbsok9CXHd/KJLiPQ+jFP4ZHZlooRuYaLVcFrRIRIQA/uoFzu8eShYWRENghNfiDnx2LuDUxfW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734695000; c=relaxed/simple;
	bh=e8IiOdeWHFFncu+LFM3byCpwESAJwAg3mptpVglivdU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nxqsex/+F8cY+JCXgs+VZ7+wSsLb8oOfeI+bQKI18+tMrzJBfxQdMKUXD+JYgvIznOFhfR8KJGZLI8ZuABN5o9E/QkzzNV7GghzP8u5N1z5crligsIPgY0YPMw/Zy3UPd8mYByyjE6bq5n96uX6N5967kXQ9UGUP6/+mHP8ZVNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dfJzwJdM; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dfJzwJdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734694998; x=1766230998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e8IiOdeWHFFncu+LFM3byCpwESAJwAg3mptpVglivdU=;
  b=dfJzwJdMXDMZe4TUiQ6W72pk32YKiQpFRLMppq5yhuBMgBglu65EKiTF
   R3v4p2Wp85CtdRbGK5bwMD3U7DR3/5ZsVmYDfU91U69+8UnDUW1rXeIQL
   1i+xF44HKjxA5sCIowx0uPXSR7s3slP+fAaGZgka6/VqP3wu9aXGTFlAe
   8a6ZVbODq5ybG+vFshfyTJJJ8LdkUtZ4Gt/1cilNZT22bKpA5LgdVjBQY
   Jv5MeqvoatE8ZYTgI7aaDbFhAcnywmR2X3+Zjewf/6olXeBZ5XQXt3Ss1
   r5ePdZmyghmFgDz6qWFRuPrIwNJUrXeHIPmkAfnSMn4tBWdxHRSqqW87e
   Q==;
X-CSE-ConnectionGUID: kAxHRzlcR+q9ohdeKC6EFQ==
X-CSE-MsgGUID: 2zR+O+epTv+9v/U9ofJHqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="35458827"
X-IronPort-AV: E=Sophos;i="6.12,250,1728975600"; 
   d="scan'208";a="35458827"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 03:43:17 -0800
X-CSE-ConnectionGUID: gTQHeiObQQCUiN30uPcHcg==
X-CSE-MsgGUID: lsrF2Fb2Sc+opQRixUpVkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="103569867"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2024 03:43:16 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tObPV-00016t-0i;
	Fri, 20 Dec 2024 11:43:13 +0000
Date: Fri, 20 Dec 2024 19:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: yangge <yangge1116@126.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 253/254] mmu.c:(.text+0x6bb4): multiple
 definition of `replace_free_hugepage_folios';
 virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
Message-ID: <202412201930.Zzgt6d9Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   5555a83c82d66729e4abaf16ae28d6bd81f9a64a
commit: fba5261e0039dcf4de077fd12ea9ae2501d92b88 [253/254] mm: replace free hugepage folios after migration
config: i386-buildonly-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201930.Zzgt6d9Q-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201930.Zzgt6d9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201930.Zzgt6d9Q-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/mmu/mmu.o: in function `replace_free_hugepage_folios':
>> mmu.c:(.text+0x6bb4): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: arch/x86/kernel/setup.o: in function `replace_free_hugepage_folios':
   setup.c:(.text+0x14): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: arch/x86/mm/init_32.o: in function `replace_free_hugepage_folios':
   init_32.c:(.text+0x0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: arch/x86/mm/fault.o: in function `replace_free_hugepage_folios':
   fault.c:(.text+0x105c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: arch/x86/mm/pgtable.o: in function `replace_free_hugepage_folios':
   pgtable.c:(.text+0x0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: kernel/fork.o: in function `replace_free_hugepage_folios':
   fork.c:(.text+0xac4): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: kernel/sysctl.o: in function `replace_free_hugepage_folios':
   sysctl.c:(.text+0x1c80): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: kernel/events/core.o: in function `replace_free_hugepage_folios':
   core.c:(.text+0xa378): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/filemap.o: in function `replace_free_hugepage_folios':
   filemap.c:(.text+0x3128): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/folio-compat.o: in function `replace_free_hugepage_folios':
   folio-compat.c:(.text+0x1b4): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/swap.o: in function `replace_free_hugepage_folios':
   swap.c:(.text+0x181c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/vmscan.o: in function `replace_free_hugepage_folios':
   vmscan.c:(.text+0x25f4): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/shmem.o: in function `replace_free_hugepage_folios':
   shmem.c:(.text+0x4db0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/util.o: in function `replace_free_hugepage_folios':
   util.c:(.text+0xaa8): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/compaction.o: in function `replace_free_hugepage_folios':
   compaction.c:(.text+0x28f4): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/show_mem.o: in function `replace_free_hugepage_folios':
   show_mem.c:(.text+0xacc): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/debug.o: in function `replace_free_hugepage_folios':
   debug.c:(.text+0x3f0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/gup.o: in function `replace_free_hugepage_folios':
   gup.c:(.text+0x12a4): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/memory.o: in function `replace_free_hugepage_folios':
   memory.c:(.text+0x1980): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/mincore.o: in function `replace_free_hugepage_folios':
   mincore.c:(.text+0x28c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/mlock.o: in function `replace_free_hugepage_folios':
   mlock.c:(.text+0x11ec): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/mmap.o: in function `replace_free_hugepage_folios':
   mmap.c:(.text+0x1c4): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/mprotect.o: in function `replace_free_hugepage_folios':
   mprotect.c:(.text+0x48): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/mremap.o: in function `replace_free_hugepage_folios':
   mremap.c:(.text+0x39c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/page_vma_mapped.o: in function `replace_free_hugepage_folios':
   page_vma_mapped.c:(.text+0x0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/pagewalk.o: in function `replace_free_hugepage_folios':
   pagewalk.c:(.text+0x6a0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/pgtable-generic.o: in function `replace_free_hugepage_folios':
   pgtable-generic.c:(.text+0x60): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/rmap.o: in function `replace_free_hugepage_folios':
   rmap.c:(.text+0xd04): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/vmalloc.o: in function `replace_free_hugepage_folios':
   vmalloc.c:(.text+0x4dd8): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/vma.o: in function `replace_free_hugepage_folios':
   vma.c:(.text+0x15bc): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/page_alloc.o: in function `replace_free_hugepage_folios':
   page_alloc.c:(.text+0x2084): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/madvise.o: in function `replace_free_hugepage_folios':
   madvise.c:(.text+0x1a88): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/swap_state.o: in function `replace_free_hugepage_folios':
   swap_state.c:(.text+0x5c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/swapfile.o: in function `replace_free_hugepage_folios':
   swapfile.c:(.text+0x37dc): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/migrate.o: in function `replace_free_hugepage_folios':
   migrate.c:(.text+0x2108): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/huge_memory.o: in function `replace_free_hugepage_folios':
   huge_memory.c:(.text+0x17a0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/memory-failure.o: in function `replace_free_hugepage_folios':
   memory-failure.c:(.text+0x1588): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/debug_vm_pgtable.o: in function `replace_free_hugepage_folios':
   debug_vm_pgtable.c:(.text+0x0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/page_isolation.o: in function `replace_free_hugepage_folios':
   page_isolation.c:(.text+0x51c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/zsmalloc.o: in function `replace_free_hugepage_folios':
   zsmalloc.c:(.text+0x25b0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/userfaultfd.o: in function `replace_free_hugepage_folios':
   userfaultfd.c:(.text+0x2e8): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: mm/memfd.o: in function `replace_free_hugepage_folios':
   memfd.c:(.text+0x6f0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/userfaultfd.o: in function `replace_free_hugepage_folios':
   userfaultfd.c:(.text+0x29e8): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/aio.o: in function `replace_free_hugepage_folios':
   aio.c:(.text+0x302c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/iomap/buffered-io.o: in function `replace_free_hugepage_folios':
   buffered-io.c:(.text+0x4574): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/proc/task_mmu.o: in function `replace_free_hugepage_folios':
   task_mmu.c:(.text+0x3cd8): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/proc/array.o: in function `replace_free_hugepage_folios':
   array.c:(.text+0xa0c): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/proc/meminfo.o: in function `replace_free_hugepage_folios':
   meminfo.c:(.text+0x0): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/proc/page.o: in function `replace_free_hugepage_folios':
   page.c:(.text+0xf8): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/btrfs/disk-io.o: in function `replace_free_hugepage_folios':
   disk-io.c:(.text+0x1eb8): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here
   ld: fs/btrfs/inode.o: in function `replace_free_hugepage_folios':
   inode.c:(.text+0x43ac): multiple definition of `replace_free_hugepage_folios'; virt/kvm/kvm_main.o:kvm_main.c:(.text+0x48c4): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
