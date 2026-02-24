Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D9536605D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Feb 2026 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771921938; cv=none; b=cFHiEvSh+Y31DGDRZDLKLMbueAISA8IpUFn11vqra8YKbhi4wWDsguMjfFO6e3l/lpShWA8VLcocXa8q6CvzKU0CoubLTUaPF4PmLskluRD16QDIwJ+DfV8d54bWI+XErrPHkZm0mUaTevs1iXowUhkXc00gLfQ1VflGLaaiWrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771921938; c=relaxed/simple;
	bh=G1gujgnd1mdmYmy07XFdeuZKjB2C0UTzRcZW63NL678=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qwn6mQZ79K7U/g0K4WE/xPxmLVc3y3dzteVGcnG8934dBlRzxoqugq7bk0Vs2KqNFXSL+4Ue88/Tjp6sFxZ400PGBmUf4p6U6EkI0MUA92JH7uszqedJ/AWT9yPFqSYzBbdOCjF+thn2DtcZV9/n6J4A+jBUjOPCZ08c8NglWhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZfY69Vr; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZfY69Vr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771921936; x=1803457936;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G1gujgnd1mdmYmy07XFdeuZKjB2C0UTzRcZW63NL678=;
  b=nZfY69Vr+U9aRbdDxkzZEgyMhe6+FcxOR4KKUkd2UlMQ+YgkyX1eTI3I
   F7S2tPMR48r1jTkbMMKlM3kVvs/Pl9F7ud6XozRhRGbLP4BFRdDxmAqSP
   NfGcZrXssuwgauvKYqWw/FlGt6TlxU6wfTfXM6j/asmL+ANGdaZ9LxPHk
   WhAYuS1M4LwanRjGIvJMrh/bP8oisR6xnwrsl1NwyaVwWUd0OfDSdLmL7
   7OIeqvmi+P4z93+edu0BSZa5uxi8New/NpOp4TpDQmO92mVB7amCUuP9a
   MPzOlmufZfrlfUugMQq3Y6DF8lkQlxJk7qZ2POBLK937vAfRdVUuhuVPj
   g==;
X-CSE-ConnectionGUID: 9e6wgisaT2ed7xTUHIV0gQ==
X-CSE-MsgGUID: MlS2dzV5S0+2FSiesli+nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72634293"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="72634293"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 00:32:16 -0800
X-CSE-ConnectionGUID: sARxs3zpQTG595j1SUsfww==
X-CSE-MsgGUID: 1ePL+l+gSyKH5N9C9Np5Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="220398192"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 24 Feb 2026 00:32:15 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vunpf-000000001fx-273e;
	Tue, 24 Feb 2026 08:31:58 +0000
Date: Tue, 24 Feb 2026 16:31:49 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC V1 08/16] arm64/mm: Convert READ_ONCE() as pgdp_get() while
 accessing PGD
Message-ID: <202602241644.aoli8EeP-lkp@intel.com>
References: <20260224051153.3150613-9-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260224051153.3150613-9-anshuman.khandual@arm.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on v7.0-rc1]
[also build test ERROR on linus/master next-20260223]
[cannot apply to arm64/for-next/core akpm-mm/mm-everything arm/for-next arm/fixes kvmarm/next soc/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Khandual/mm-Abstract-printing-of-pxd_val/20260224-131447
base:   v7.0-rc1
patch link:    https://lore.kernel.org/r/20260224051153.3150613-9-anshuman.khandual%40arm.com
patch subject: [RFC V1 08/16] arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260224/202602241644.aoli8EeP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602241644.aoli8EeP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602241644.aoli8EeP-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: arch/arm64/mm/fault.o: in function `show_pte':
>> fault.c:(.text.unlikely+0x19c): undefined reference to `p4d_offset'
>> aarch64-linux-ld: fault.c:(.text.unlikely+0x1d0): undefined reference to `pud_offset'
   aarch64-linux-ld: arch/arm64/mm/mmu.o: in function `split_kernel_leaf_mapping_locked':
>> mmu.c:(.text+0xfa8): undefined reference to `p4d_offset'
>> aarch64-linux-ld: mmu.c:(.text+0xfc4): undefined reference to `pud_offset'
   aarch64-linux-ld: arch/arm64/mm/mmu.o: in function `alloc_init_pud':
   mmu.c:(.text+0x1bb8): undefined reference to `pud_offset_phys'
   aarch64-linux-ld: arch/arm64/mm/mmu.o: in function `alloc_init_p4d':
>> mmu.c:(.text+0x1eac): undefined reference to `p4d_offset_phys'
   aarch64-linux-ld: arch/arm64/mm/fixmap.o: in function `early_fixmap_init_pud.constprop.0':
   fixmap.c:(.init.text+0xa0): undefined reference to `pud_offset_phys'
   aarch64-linux-ld: arch/arm64/mm/fixmap.o: in function `early_fixmap_init':
>> fixmap.c:(.init.text+0x1a4): undefined reference to `p4d_offset_phys'
   aarch64-linux-ld: mm/memory.o: in function `follow_pfnmap_start':
>> memory.c:(.text+0xa28): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0xa44): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `free_p4d_range':
   memory.c:(.text+0x27c4): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x283c): undefined reference to `pud_offset'
   aarch64-linux-ld: memory.c:(.text+0x2a74): undefined reference to `pud_offset'
>> aarch64-linux-ld: memory.c:(.text+0x2cac): undefined reference to `p4d_offset'
   aarch64-linux-ld: mm/memory.o: in function `unmap_page_range':
   memory.c:(.text+0x52d8): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x532c): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `__handle_mm_fault':
   memory.c:(.text+0x840c): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x8428): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `apply_to_pud_range':
   memory.c:(.text+0x8b1c): undefined reference to `pud_offset'
   aarch64-linux-ld: memory.c:(.text+0x8b40): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `__apply_to_page_range':
   memory.c:(.text+0x8d68): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x8ea8): undefined reference to `p4d_offset'
   aarch64-linux-ld: mm/memory.o: in function `remap_pfn_range_internal.isra.0':
   memory.c:(.text+0x9088): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x90d4): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `copy_p4d_range':
   memory.c:(.text+0x96f8): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x9718): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x9780): undefined reference to `pud_offset'
   aarch64-linux-ld: memory.c:(.text+0x979c): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `walk_to_pmd':
   memory.c:(.text+0x9c30): undefined reference to `p4d_offset'
   aarch64-linux-ld: memory.c:(.text+0x9c4c): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/memory.o: in function `__print_bad_page_map_pgtable':
>> memory.c:(.text.unlikely+0x50): undefined reference to `p4d_offset'
>> aarch64-linux-ld: memory.c:(.text.unlikely+0x78): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/vmalloc.o: in function `vmalloc_to_page':
>> vmalloc.c:(.text+0x6b8): undefined reference to `p4d_offset'
>> aarch64-linux-ld: vmalloc.c:(.text+0x6d4): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/vmalloc.o: in function `vmap_range_noflush':
   vmalloc.c:(.text+0x2084): undefined reference to `p4d_offset'
   aarch64-linux-ld: vmalloc.c:(.text+0x20dc): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/vmalloc.o: in function `vmap_small_pages_range_noflush':
   vmalloc.c:(.text+0x27d8): undefined reference to `p4d_offset'
   aarch64-linux-ld: vmalloc.c:(.text+0x2820): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/vmalloc.o: in function `__vunmap_range_noflush':
   vmalloc.c:(.text+0x674c): undefined reference to `p4d_offset'
   aarch64-linux-ld: vmalloc.c:(.text+0x67cc): undefined reference to `pud_offset'
   aarch64-linux-ld: arch/arm64/mm/pageattr.o: in function `kernel_page_present':
>> pageattr.c:(.text+0xc04): undefined reference to `p4d_offset'
>> aarch64-linux-ld: pageattr.c:(.text+0xc3c): undefined reference to `p4d_offset'
>> aarch64-linux-ld: pageattr.c:(.text+0xc4c): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/gup.o: in function `follow_page_mask':
>> gup.c:(.text+0x2210): undefined reference to `p4d_offset'
>> aarch64-linux-ld: gup.c:(.text+0x2288): undefined reference to `p4d_offset'
>> aarch64-linux-ld: gup.c:(.text+0x22a8): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/mprotect.o: in function `change_protection_range':
>> mprotect.c:(.text+0xe50): undefined reference to `p4d_offset'
>> aarch64-linux-ld: mprotect.c:(.text+0xeb8): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/mremap.o: in function `get_old_pud':
   mremap.c:(.text+0xb0): undefined reference to `p4d_offset'
   aarch64-linux-ld: mremap.c:(.text+0xcc): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/mremap.o: in function `alloc_new_pud':
   mremap.c:(.text+0x170): undefined reference to `p4d_offset'
   aarch64-linux-ld: mremap.c:(.text+0x18c): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/page_vma_mapped.o: in function `page_vma_mapped_walk':
   page_vma_mapped.c:(.text+0x140): undefined reference to `p4d_offset'
   aarch64-linux-ld: page_vma_mapped.c:(.text+0x1b8): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/pagewalk.o: in function `walk_pud_range':
   pagewalk.c:(.text+0x640): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/pagewalk.o: in function `walk_p4d_range':
   pagewalk.c:(.text+0x854): undefined reference to `p4d_offset'
   aarch64-linux-ld: mm/pagewalk.o: in function `folio_walk_start':
   pagewalk.c:(.text+0x1478): undefined reference to `p4d_offset'
   aarch64-linux-ld: pagewalk.c:(.text+0x1494): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/rmap.o: in function `mm_find_pmd':
   rmap.c:(.text+0x1524): undefined reference to `p4d_offset'
   aarch64-linux-ld: rmap.c:(.text+0x1534): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/sparse-vmemmap.o: in function `virt_to_kpte':
   sparse-vmemmap.c:(.text+0x64): undefined reference to `p4d_offset'
   aarch64-linux-ld: sparse-vmemmap.c:(.text+0x6c): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/sparse-vmemmap.o: in function `vmemmap_wrprotect_hvo':
   sparse-vmemmap.c:(.text+0x150): undefined reference to `p4d_offset'
   aarch64-linux-ld: sparse-vmemmap.c:(.text+0x158): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/sparse-vmemmap.o: in function `vmemmap_pud_populate':
   sparse-vmemmap.c:(.init.text+0x610): undefined reference to `pud_offset'
   aarch64-linux-ld: mm/sparse-vmemmap.o: in function `vmemmap_p4d_populate':
   sparse-vmemmap.c:(.init.text+0x750): undefined reference to `p4d_offset'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
