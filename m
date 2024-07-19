Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9C92AF12
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jul 2024 16:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721406336; cv=none; b=Lh9zVkMeAPYlVMjUji/Db6+AmWx5CA/nmis/19zCXENT9YcIYgjs96z7jCPlGRGh24gDuohglRYil3P0xKnUFzlAcn85immDD/V1ro7lEleHywEdHM4LbMb+aleaEoin6VoL35kumdIFcXMxGGaZP9dOBu6dDn/MYr3POm8GUGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721406336; c=relaxed/simple;
	bh=/v9wZF68KESXQzbt5jjHTKLhCghCpS5dIwzpB0enPwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qry3b2mh+jbtkiicfRoC2oO4ViMQth90A4AgZH63vLhi6Kx84Hf8gbDgWhWq9cG6lzxmyCfhj3PnA3dbcFz1vD9KQ9dV5wjUnAYMxwPkV0GQcjm/oBSLN+8q47koVfaL+1nSB+9LA6Jz1s1FgOVqV+0NGEju8Z9TARh8IM7OBww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWJf/5k1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWJf/5k1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721406334; x=1752942334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/v9wZF68KESXQzbt5jjHTKLhCghCpS5dIwzpB0enPwE=;
  b=BWJf/5k10Hk81ztJBTJBNxB6IxUuGD6vQfnR5j5755tEmVxCq1BF7e67
   Y4UOwKebhgbaEYJUwqu8hxfyRw2m3WaMlythiHp56ZgEEh09txaWnZEdt
   nkgltaECLt8hl7Qz/jW0hvyPXfhHhDlYK9Yo0xdyHXeQ/9qi6IBe6GbSK
   BhPwVMUILgtJPmqr4qbkKO6qVApFNUPjyvlozVmOFp0mXAwdmRyaL+8cU
   uWVA+tt6P+q0qC9kB5ZjJqOGGPQaxyoXGZNvWQnufnwvfax91zVgtAvY3
   YEL7zXTZwOnUJfCjHrnHjpWOZX0V3NU/xUmz4cIRxD1C6X6uQakXvoaTD
   w==;
X-CSE-ConnectionGUID: 1Td0pCthRmGoOochz8zSzA==
X-CSE-MsgGUID: nLFn/wGgQH2tm2+lfQb2+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="19175981"
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="19175981"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 09:25:33 -0700
X-CSE-ConnectionGUID: nZRe5oEWT/O0VgTurNGM6A==
X-CSE-MsgGUID: yQOXUICbTIa/bIh+mnncDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,221,1716274800"; 
   d="scan'208";a="56007002"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 19 Jul 2024 09:25:32 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sUqQD-000iNC-2d;
	Fri, 19 Jul 2024 16:25:29 +0000
Date: Sat, 20 Jul 2024 00:24:59 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 4/6] arch/arm64/include/asm/mmu.h:69:39:
 warning: declaration of 'struct mm_struct' will not be visible outside of
 this function
Message-ID: <202407200033.Qv0nEHzH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   9be426f361841aaa9cccbbf3b4d6c0996761a83e
commit: 2a551f2f3fc68829c9cbd56a5c4fbf95a17b3fa2 [4/6] mm: memcg: merge multiple page_counters into a single structure
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240720/202407200033.Qv0nEHzH-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407200033.Qv0nEHzH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407200033.Qv0nEHzH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/page_counter.c:8:
   In file included from include/linux/page_counter.h:8:
   arch/arm64/include/asm/mmu.h:68:26: error: unknown type name 'pgprot_t'
      68 |                                    phys_addr_t size, pgprot_t prot);
         |                                                      ^
>> arch/arm64/include/asm/mmu.h:69:39: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
      69 | extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
         |                                       ^
   arch/arm64/include/asm/mmu.h:71:11: error: unknown type name 'pgprot_t'
      71 |                                pgprot_t prot, bool page_mappings_only);
         |                                ^
   arch/arm64/include/asm/mmu.h:72:63: error: unknown type name 'pgprot_t'
      72 | extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
         |                                                               ^
   1 warning and 3 errors generated.
--
   In file included from mm/memcontrol.c:28:
   In file included from include/linux/page_counter.h:8:
   arch/arm64/include/asm/mmu.h:68:26: error: unknown type name 'pgprot_t'
      68 |                                    phys_addr_t size, pgprot_t prot);
         |                                                      ^
>> arch/arm64/include/asm/mmu.h:69:39: warning: declaration of 'struct mm_struct' will not be visible outside of this function [-Wvisibility]
      69 | extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
         |                                       ^
   arch/arm64/include/asm/mmu.h:71:11: error: unknown type name 'pgprot_t'
      71 |                                pgprot_t prot, bool page_mappings_only);
         |                                ^
   arch/arm64/include/asm/mmu.h:72:63: error: unknown type name 'pgprot_t'
      72 | extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
         |                                                               ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
      99 |                         set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
     101 |                 return (set->sig[1] | set->sig[0]) == 0;
         |                         ^        ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   include/uapi/asm-generic/signal.h:62:2: note: array 'sig' declared here
      62 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from mm/memcontrol.c:29:


vim +69 arch/arm64/include/asm/mmu.h

b89d82ef01b33b Will Deacon     2019-01-08  62  
83504032e6ddcc Will Deacon     2019-01-14  63  extern void arm64_memblock_init(void);
4f04d8f0054511 Catalin Marinas 2012-03-05  64  extern void paging_init(void);
3194ac6e66cc7a David Daney     2016-04-08  65  extern void bootmem_init(void);
2475ff9d2c6ea3 Catalin Marinas 2012-10-23  66  extern void __iomem *early_io_map(phys_addr_t phys, unsigned long virt);
b97547761b02cc Mark Rutland    2023-04-06  67  extern void create_mapping_noalloc(phys_addr_t phys, unsigned long virt,
b97547761b02cc Mark Rutland    2023-04-06 @68  				   phys_addr_t size, pgprot_t prot);
8ce837cee8f51f Ard Biesheuvel  2014-10-20 @69  extern void create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
8ce837cee8f51f Ard Biesheuvel  2014-10-20  70  			       unsigned long virt, phys_addr_t size,
f14c66ce81b559 Ard Biesheuvel  2016-10-21  71  			       pgprot_t prot, bool page_mappings_only);
e112b032a72c78 Hsin-Yi Wang    2019-08-23  72  extern void *fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot);
5ea5306c3235a1 Ard Biesheuvel  2017-03-09  73  extern void mark_linear_text_alias_ro(void);
293d865f0af58e Ard Biesheuvel  2024-02-14  74  

:::::: The code at line 69 was first introduced by commit
:::::: 8ce837cee8f51fb0eacb32c85461ea2f0fafc9f8 arm64/mm: add create_pgd_mapping() to create private page tables

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ard Biesheuvel <ard.biesheuvel@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
