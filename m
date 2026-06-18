Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27C3C2BA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jun 2026 07:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781767216; cv=none; b=clnCdMWGQbHJRwX2k6R+FwHOiwBODmgcOCc8dt8OF2pYoBelkW21PunrwiuluT95Cg3301ZSaaHDkzdyZP4otRSPZpeAyjkfawy+o0ldUGPXDV4ebsGnmvMYke8jxCchBFchO7s+w0QIyN/28arxPBR8gYNUnbP7ls0tTD2p03o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781767216; c=relaxed/simple;
	bh=lkLlYOcy1wEndECCQn/0NXPUVRcy8jjP87EutNRL7oE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nKc34UrHBpLNh2pqGmvDTjcZ0RBl5LdpqIEnKreGJM62iyleOrzyJe8SCUG7Og5T8oVmAW99EyDVORp+kTYv9GqH3/BOd/WeyEIQtX9bXsKkTY4BShlTyvS3qNpra/lwTz+IZ+4IKsLhyoNn6p6NI4LgsiUG3TsDTWgA4oPKtuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChM9mM2S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChM9mM2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781767212; x=1813303212;
  h=date:from:to:cc:subject:message-id;
  bh=lkLlYOcy1wEndECCQn/0NXPUVRcy8jjP87EutNRL7oE=;
  b=ChM9mM2S+85yMQK7EKMmW2zXptIte7vc096ciJHOugwamiVuUWoU4kE/
   LswqFPdTHDPS5ba4ivi1Mw4Iv4MKmSJ7oPeY1VeiXzOR4oI3gsYhZNRLN
   H+YykbjcBLyy84lzCdbUjyFU4am0zn9RWqLiuTsVJV3YGlvG84zSc0Czz
   ykZWGk9SuHX8Ixxs0ZUkli6oa1Ecakq50vDW1FUNvimQrwHI7ciDEnC88
   4BSTtxgjf8mMlCs5riqk4+bpsvRrD40wnc47uSb9Au06cFf5jSbHLtMGE
   CGkBJiC4RB1Ev5gnJNEkWwHKWFoXyfCesOUX9qPneM+XHed3k0fXDPcq3
   g==;
X-CSE-ConnectionGUID: Dvmpl9E+T3KGwI2rkFZz+g==
X-CSE-MsgGUID: hMo/JN8PTsyQ08UwhC232w==
X-IronPort-AV: E=McAfee;i="6800,10657,11820"; a="82641261"
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="82641261"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 00:20:12 -0700
X-CSE-ConnectionGUID: 7vdJj0mQSS+53CMRccOBmQ==
X-CSE-MsgGUID: owQ1Sg9kS76UPeBLJE15Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,211,1774335600"; 
   d="scan'208";a="286408704"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2026 00:20:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wa72j-00000000VL0-4Bad;
	Thu, 18 Jun 2026 07:20:05 +0000
Date: Thu, 18 Jun 2026 15:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ivan Kokshaysky <ink@unseen.parts>
Subject: arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse:
 cast from non-scalar
Message-ID: <202606181510.ARl8xjHh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e771677c937da5808f7b6c1f0e4a97ec1a84f8a8
commit: dd5712f3379cfe760267cdd28ff957d9ab4e51c7 alpha: fix user-space corruption during memory compaction
date:   5 months ago
config: alpha-randconfig-r111-20260618 (https://download.01.org/0day-ci/archive/20260618/202606181510.ARl8xjHh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260618/202606181510.ARl8xjHh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: dd5712f3379c ("alpha: fix user-space corruption during memory compaction")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606181510.ARl8xjHh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, include/linux/pagewalk.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/mprotect.c: note: in included file (through include/linux/mm.h, include/linux/pagewalk.h):
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
--
   mm/mremap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/mremap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/mremap.c:313:18: sparse: sparse: context imbalance in 'move_ptes' - unexpected unlock
--
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c:816:17: sparse: sparse: context imbalance in 'get_mergeable_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file:
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'write_protect_page' - unexpected unlock
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/ksm.c:1461:42: sparse: sparse: context imbalance in 'replace_page' - different lock contexts for basic block
   mm/ksm.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/ksm.c:2563:9: sparse: sparse: context imbalance in 'ksm_next_page_pmd_entry' - different lock contexts for basic block
--
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'folio_referenced_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'try_to_unmap_one' - unexpected unlock
   mm/rmap.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/rmap.c: note: in included file (through include/linux/ksm.h):
   include/linux/rmap.h:956:26: sparse: sparse: context imbalance in 'try_to_migrate_one' - unexpected unlock
--
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:238:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:380:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:462:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - different lock contexts for basic block
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/userfaultfd.c:1506:26: sparse: sparse: context imbalance in 'move_pages_ptes' - unexpected unlock
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
--
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/vmalloc.c: note: in included file (through include/linux/mm.h):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/vmalloc.c:1128:25: sparse: sparse: context imbalance in 'find_vmap_area_exceed_addr_lock' - wrong count at exit
   mm/vmalloc.c:4671:28: sparse: sparse: context imbalance in 'vread_iter' - unexpected unlock
--
   mm/memory.c:876:38: sparse: sparse: cast to non-scalar
   mm/memory.c:876:38: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:361:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:1331:9: sparse: sparse: context imbalance in 'copy_pte_range' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2220:16: sparse: sparse: context imbalance in '__get_locked_pte' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2326:9: sparse: sparse: context imbalance in 'insert_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:2611:9: sparse: sparse: context imbalance in 'insert_pfn' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:3193:17: sparse: sparse: context imbalance in 'apply_to_pte_range' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c:3826:42: sparse: sparse: context imbalance in 'wp_page_copy' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:3865:19: sparse: sparse: context imbalance in 'finish_mkwrite_fault' - different lock contexts for basic block
   mm/memory.c:3896:17: sparse: sparse: context imbalance in 'wp_pfn_shared' - unexpected unlock
   mm/memory.c:3922:17: sparse: sparse: context imbalance in 'wp_page_shared' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4088:19: sparse: sparse: context imbalance in 'do_wp_page' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4350:9: sparse: sparse: context imbalance in 'remove_device_exclusive_entry' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4376:19: sparse: sparse: context imbalance in 'pte_marker_clear' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:4621:12: sparse: sparse: context imbalance in 'do_swap_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5280:9: sparse: sparse: context imbalance in 'do_anonymous_page' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5512:12: sparse: sparse: context imbalance in 'finish_fault' - different lock contexts for basic block
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:5896:9: sparse: sparse: context imbalance in 'do_fault' - different lock contexts for basic block
   mm/memory.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, ...):
   arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast to non-scalar
>> arch/alpha/include/asm/pgtable.h:278:21: sparse: sparse: cast from non-scalar
   mm/memory.c: note: in included file (through include/linux/mm.h, arch/alpha/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6025:17: sparse: sparse: context imbalance in 'do_numa_page' - unexpected unlock
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6301:9: sparse: sparse: context imbalance in 'handle_pte_fault' - unexpected unlock
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:361:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:354:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:347:16: sparse: sparse: cast from non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast to non-scalar
   include/linux/pgtable.h:340:16: sparse: sparse: cast from non-scalar
   mm/memory.c:6743:5: sparse: sparse: context imbalance in 'follow_pfnmap_start' - different lock contexts for basic block
   mm/memory.c:6829:28: sparse: sparse: context imbalance in 'follow_pfnmap_end' - unexpected unlock

vim +278 arch/alpha/include/asm/pgtable.h

   273	
   274	static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
   275						unsigned long address,
   276						pte_t *ptep)
   277	{
 > 278		pte_t pte = READ_ONCE(*ptep);
   279	
   280		pte_clear(mm, address, ptep);
   281		return pte;
   282	}
   283	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
