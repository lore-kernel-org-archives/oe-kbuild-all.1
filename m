Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809E03BFAD4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 21:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779831761; cv=none; b=sDnttRVvhvtSZX6rEXoUTt5G1KJv8sl2f7bD8KlguKP5pXKEqYKbSsBkBuVoQSKTZQjGE87NuoZyreDprI42tWbq4jeUo06a1gNNGbZPVlVOx2I358spBW60EenLeCBnIAc9Xxh4RNpzQFHuWiNtA9sfjToAY+S71WSy6NNWFYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779831761; c=relaxed/simple;
	bh=wOxwPifMjM7xi1ZyfjankIAUCjG/QxBBYfxFeqsXXlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jppNhcC7uGFHC0blEIbhplUvEcZkVquVbVzyWyO4hcBqFH8heXT9s5pMWCFF4WWAlOb7FdDs4Y/WtRH1flpIznHRxCbTCJytOoz6lGpDFV5ctVwzWyZEKPsAstnYR5XqKnmAllPJRI1e4xrBVOxQeBeaeXPbVqLLemLomA6eG2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nZ+PdQHZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nZ+PdQHZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779831760; x=1811367760;
  h=date:from:to:cc:subject:message-id;
  bh=wOxwPifMjM7xi1ZyfjankIAUCjG/QxBBYfxFeqsXXlc=;
  b=nZ+PdQHZ+ObMc7NzximfSZh2m3ujskHXPR6o06SZQL41p9axn7cT/iwp
   FWAIF+rgPJxs7Zlp9SrjV5ggTzsASWlEnZ3v5cNExxbK2fGJOGAOm5C9D
   Zpob913hBydkASi33SM7W9q0/rk0gXduerZfT6K2gKdfjhp+Z6w713BJ8
   M47icpafkzXiwTH58rRthCMQfPPLDTD0AdkUiyGcrJWPWM0e5jGN/nxuG
   h+iEH8Kf1LG2L3xd+bW3tsagkEWCyrEDOztPFnK/GH6Txa9RB3B6fuW/A
   8w7N28BAavuhnNRfRJqoI2zcC5+k1D6ktA9qs9F2jQZD9fJf/cE5Njqla
   w==;
X-CSE-ConnectionGUID: E8PqEZBaRxqckV0iEbdNow==
X-CSE-MsgGUID: 2bh1Way2S7uEq6NukeccGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="91765238"
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="91765238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2026 14:42:39 -0700
X-CSE-ConnectionGUID: IDi/GKwjSvyk+t3ak583bg==
X-CSE-MsgGUID: XcBoD68PToumzDz3yHsiIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,170,1774335600"; 
   d="scan'208";a="280162808"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 May 2026 14:42:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRzXm-00000000CUB-0hUd;
	Tue, 26 May 2026 21:42:34 +0000
Date: Tue, 26 May 2026 23:41:55 +0200
From: kernel test robot <lkp@intel.com>
To: Oscar Salvador <osalvador@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/pgtable-generic.c:216:21: error: implicit declaration of
 function 'pudp_establish'
Message-ID: <202605262334.u8TQEWMC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Oscar-Salvador/mm-Add-softleaf_from_pud/20260526-005817
head:   4987835e04403f7fe2e05edb0b15dec0794bd848
commit: 555a51fb32cba273aa509b7b09aae8fdc9727699 mm: Make /proc/pid/pagemap use the new generic pagewalk API
date:   29 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260526/202605262334.u8TQEWMC-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605262334.u8TQEWMC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605262334.u8TQEWMC-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/pgtable-generic.c: In function 'pudp_invalidate':
>> mm/pgtable-generic.c:216:21: error: implicit declaration of function 'pudp_establish' [-Wimplicit-function-declaration]
     216 |         pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
         |                     ^~~~~~~~~~~~~~
>> mm/pgtable-generic.c:216:56: error: implicit declaration of function 'pud_mkinvalid'; did you mean 'xas_invalid'? [-Wimplicit-function-declaration]
     216 |         pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
         |                                                        ^~~~~~~~~~~~~
         |                                                        xas_invalid
>> mm/pgtable-generic.c:216:21: error: invalid initializer
     216 |         pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
         |                     ^~~~~~~~~~~~~~


vim +/pudp_establish +216 mm/pgtable-generic.c

   210	
   211	#ifndef __HAVE_ARCH_PUDP_INVALIDATE
   212	pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
   213			      pud_t *pudp)
   214	{
   215		VM_WARN_ON_ONCE(!pud_present(*pudp));
 > 216		pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
   217		flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
   218		return old;
   219	}
   220	#endif
   221	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
