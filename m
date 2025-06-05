Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E8D27B4F7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 18:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749148942; cv=none; b=kZjKZgRrgkwmGdBS0L4ekwW2viVLR5+vnaDCHobe/5Ca/LlBlULR+aaTZmoAGXJ3dzVqoVP7Urp2QzkALbLh1vs98tAAbMO68S7cP4hQ9N2qN+mWdlmeyfhfg7bR9+xHAFACaDbYQ4CebRpkiY4pMZbksKX2QPICrS85e9wP8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749148942; c=relaxed/simple;
	bh=L3vL9EEkg+d4ZGeeKcN6VkdBpMpJkSopFuzSj7ILxeY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaVXDJtyb5W8WXXg71QaesYRs4Y9pqgMytFiJVv3SmBetCjYLgW7Sy07NkUfE+oE9TwclSYu3xTgJVF/xuIv3Ua7vZWJfGSOlITFqmhTh4kQRlJbTiwjZ799nONOp2ZNPfgj7G3KS3+LV/Hm+KDir6y3Va7o78Pu2Jx/oyF3y0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEIfrDJz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEIfrDJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749148940; x=1780684940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L3vL9EEkg+d4ZGeeKcN6VkdBpMpJkSopFuzSj7ILxeY=;
  b=iEIfrDJzfCMmLhzEWkvCvukyd91nVrqpJnziI2fWrrCFiFga+IlORnNI
   1FaIKXcucHqVocM9XZhnDrW9sItqZbV/dHGsRG4ldk4j5DeITJn4Axp7U
   vJPTjOifVnEpzAHvMcIPO6nX8XCTThI/8bhCaKjEnhKUx5lsZ8xtNHbpv
   TsZbRGC+BjShZ01T9wZv8bn/kWnAV3HWkj2HSokKSJY1mm3oikmS3klPo
   dDtQRqeE0y9M3MtGY71GMM7t5hFXmz81IK17eBuD9y0l4AnxOkLf0SlDq
   d8Qmsr+akLIsNIEwRM08maDdxLc+J2rmn2YIFuZPuSMRhAMoLTqZeABns
   A==;
X-CSE-ConnectionGUID: 0aJ8sn/hS3O+4P9Kv0f8Mw==
X-CSE-MsgGUID: a3L5umouSDW/fR/+i3nEUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="51285984"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="51285984"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 11:42:18 -0700
X-CSE-ConnectionGUID: AIOSbvLfRrGTTpAnSxexDw==
X-CSE-MsgGUID: WZGiOjFPQGW+nuu5VDStdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; 
   d="scan'208";a="146578428"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jun 2025 11:42:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNFXZ-0004Nz-1a;
	Thu, 05 Jun 2025 18:42:13 +0000
Date: Fri, 6 Jun 2025 02:41:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Nikolay Borisov <nik.borisov@suse.com>
Subject: [peterz-queue:x86/urgent 4/5] arch/x86/kernel/alternative.c:264:26:
 warning: assignment to 'void *' from 'int' makes pointer from integer
 without a cast
Message-ID: <202506060243.1ZWBBG8K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/urgent
head:   e87348e4a2daaf44da409991ca751e8844b27ef8
commit: 01c48b9466bf0ecf95821e3ea1a58b876c4e8aaf [4/5] x86/its: explicitly manage permissions for ITS pages
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20250606/202506060243.1ZWBBG8K-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250606/202506060243.1ZWBBG8K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506060243.1ZWBBG8K-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/alternative.c: In function 'its_allocate_thunk':
   arch/x86/kernel/alternative.c:264:28: error: implicit declaration of function 'its_alloc'; did you mean 'ida_alloc'? [-Werror=implicit-function-declaration]
     264 |                 its_page = its_alloc();
         |                            ^~~~~~~~~
         |                            ida_alloc
>> arch/x86/kernel/alternative.c:264:26: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     264 |                 its_page = its_alloc();
         |                          ^
   At top level:
>> arch/x86/kernel/alternative.c:226:14: warning: 'its_alloc_mod' defined but not used [-Wunused-function]
     226 | static void *its_alloc_mod(void)
         |              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +264 arch/x86/kernel/alternative.c

872df34d7c51a7 Peter Zijlstra         2024-10-14  225  
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03 @226) static void *its_alloc_mod(void)
872df34d7c51a7 Peter Zijlstra         2024-10-14  227  {
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  228) 	struct its_array *pages = &its_pages;
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  229) 	void *page;
872df34d7c51a7 Peter Zijlstra         2024-10-14  230  
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  231) #ifdef CONFIG_MODULE
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  232) 	if (its_mod)
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  233) 		pages = &its_mod->arch.its_pages;
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  234) #endif
872df34d7c51a7 Peter Zijlstra         2024-10-14  235  
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  236) 	page = __its_alloc(pages);
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  237) 	if (!page)
872df34d7c51a7 Peter Zijlstra         2024-10-14  238  		return NULL;
872df34d7c51a7 Peter Zijlstra         2024-10-14  239  
872df34d7c51a7 Peter Zijlstra         2024-10-14  240  	execmem_make_temp_rw(page, PAGE_SIZE);
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  241) 	if (pages == &its_pages)
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  242) 		set_memory_x((unsigned long)page, 1);
872df34d7c51a7 Peter Zijlstra         2024-10-14  243  
01c48b9466bf0e Peter Zijlstra (Intel  2025-06-03  244) 	return page;
872df34d7c51a7 Peter Zijlstra         2024-10-14  245  }
872df34d7c51a7 Peter Zijlstra         2024-10-14  246  
872df34d7c51a7 Peter Zijlstra         2024-10-14  247  static void *its_allocate_thunk(int reg)
872df34d7c51a7 Peter Zijlstra         2024-10-14  248  {
872df34d7c51a7 Peter Zijlstra         2024-10-14  249  	int size = 3 + (reg / 8);
872df34d7c51a7 Peter Zijlstra         2024-10-14  250  	void *thunk;
872df34d7c51a7 Peter Zijlstra         2024-10-14  251  
e52c1dc7455d32 Peter Zijlstra         2025-04-23  252  #ifdef CONFIG_FINEIBT
e52c1dc7455d32 Peter Zijlstra         2025-04-23  253  	/*
e52c1dc7455d32 Peter Zijlstra         2025-04-23  254  	 * The ITS thunk contains an indirect jump and an int3 instruction so
e52c1dc7455d32 Peter Zijlstra         2025-04-23  255  	 * its size is 3 or 4 bytes depending on the register used. If CFI
e52c1dc7455d32 Peter Zijlstra         2025-04-23  256  	 * paranoid is used then 3 extra bytes are added in the ITS thunk to
e52c1dc7455d32 Peter Zijlstra         2025-04-23  257  	 * complete the fineibt_paranoid caller sequence.
e52c1dc7455d32 Peter Zijlstra         2025-04-23  258  	 */
e52c1dc7455d32 Peter Zijlstra         2025-04-23  259  	if (cfi_paranoid)
e52c1dc7455d32 Peter Zijlstra         2025-04-23  260  		size += 3;
e52c1dc7455d32 Peter Zijlstra         2025-04-23  261  #endif
e52c1dc7455d32 Peter Zijlstra         2025-04-23  262  
872df34d7c51a7 Peter Zijlstra         2024-10-14  263  	if (!its_page || (its_offset + size - 1) >= PAGE_SIZE) {
872df34d7c51a7 Peter Zijlstra         2024-10-14 @264  		its_page = its_alloc();
872df34d7c51a7 Peter Zijlstra         2024-10-14  265  		if (!its_page) {
872df34d7c51a7 Peter Zijlstra         2024-10-14  266  			pr_err("ITS page allocation failed\n");
872df34d7c51a7 Peter Zijlstra         2024-10-14  267  			return NULL;
872df34d7c51a7 Peter Zijlstra         2024-10-14  268  		}
872df34d7c51a7 Peter Zijlstra         2024-10-14  269  		memset(its_page, INT3_INSN_OPCODE, PAGE_SIZE);
872df34d7c51a7 Peter Zijlstra         2024-10-14  270  		its_offset = 32;
872df34d7c51a7 Peter Zijlstra         2024-10-14  271  	}
872df34d7c51a7 Peter Zijlstra         2024-10-14  272  
872df34d7c51a7 Peter Zijlstra         2024-10-14  273  	/*
872df34d7c51a7 Peter Zijlstra         2024-10-14  274  	 * If the indirect branch instruction will be in the lower half
872df34d7c51a7 Peter Zijlstra         2024-10-14  275  	 * of a cacheline, then update the offset to reach the upper half.
872df34d7c51a7 Peter Zijlstra         2024-10-14  276  	 */
872df34d7c51a7 Peter Zijlstra         2024-10-14  277  	if ((its_offset + size - 1) % 64 < 32)
872df34d7c51a7 Peter Zijlstra         2024-10-14  278  		its_offset = ((its_offset - 1) | 0x3F) + 33;
872df34d7c51a7 Peter Zijlstra         2024-10-14  279  
872df34d7c51a7 Peter Zijlstra         2024-10-14  280  	thunk = its_page + its_offset;
872df34d7c51a7 Peter Zijlstra         2024-10-14  281  	its_offset += size;
872df34d7c51a7 Peter Zijlstra         2024-10-14  282  
872df34d7c51a7 Peter Zijlstra         2024-10-14  283  	return its_init_thunk(thunk, reg);
872df34d7c51a7 Peter Zijlstra         2024-10-14  284  }
872df34d7c51a7 Peter Zijlstra         2024-10-14  285  

:::::: The code at line 264 was first introduced by commit
:::::: 872df34d7c51a79523820ea6a14860398c639b87 x86/its: Use dynamic thunks for indirect branches

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dave Hansen <dave.hansen@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
