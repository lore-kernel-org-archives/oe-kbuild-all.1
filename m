Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE9E4483A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 16:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784910340; cv=none; b=ZoI1GV5IHWn9QSzTxXTRFlKOu6JBZCIoOjgrrsMlZBSKABgNcBY+AmKHxbeNSdZ5aF8/giQqyzWcBjHhvGzQuihCYAgeO8GLasefUPemv+S9a4e/+RF5drwruGq/mzLASqd2xjoRtCW+2XV/f2Mz/8GgGHZQl2pF++AOOIoGJNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784910340; c=relaxed/simple;
	bh=rKJsm+zvkayQ/MGBPJe2/GrAjnLY/0uq2qfCe5ndNWg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rQaLSWoP9xFCMzvMFoi+4Nmh5LkJ0gcFVhs4NjmeCFeIA9Ju/a0ldrQumJdn6f4wzNg3byKbD7PiR7N0Giu8PFOL19SqNT/mNiOCTs+q/6Tg/+1ZongE5HHX5PmpXxlNRiOR+PWf/nISwGCFU8PG+POCoV3GP6wm3G+qKatVrOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O2DB2Rvc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O2DB2Rvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784910337; x=1816446337;
  h=date:from:to:cc:subject:message-id;
  bh=rKJsm+zvkayQ/MGBPJe2/GrAjnLY/0uq2qfCe5ndNWg=;
  b=O2DB2RvcChNxgmd97iGdMCJUAmFWVdGJ+0VY0T621UBdobsw0uGGyDU4
   UrL87E2ZToNzIsnq3mAGkGEnZf/t21X81aIw+kCSuPOMnywc5SDR9rMCR
   rb9Nvw8hZ7b7SMRfIkMBM9jhcC89GS/PEsSiwSBx+V0ecIuy4eHTUwlW+
   7145W/lBeGImo9YFX0unb/1+nLZqAJ1srcqF1Q7wvgXGpB90lSYDQgeme
   qbpaUfgMU0mPNnnUYxP64ceB6ygnDEGvwvMpCCRhtWZQn9X39GNlMKIlk
   m3D3Ih4zg3al+3sMTAVcXC46CrrXQ8ABztzYs+doSyhI2rVUH5PrgEdRS
   w==;
X-CSE-ConnectionGUID: jQVuPF1FRaa91X44eTMhhA==
X-CSE-MsgGUID: oI8STrVAS3mQrqyALDm6Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85524281"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="85524281"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 09:25:36 -0700
X-CSE-ConnectionGUID: thz0kpn2RPi+deZSa1J/QA==
X-CSE-MsgGUID: /WI8DFVWRcO+SNkP1uxARQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="288722446"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 24 Jul 2026 09:25:35 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnIiK-000000000yg-2jAD;
	Fri, 24 Jul 2026 16:25:32 +0000
Date: Fri, 24 Jul 2026 18:25:22 +0200
From: kernel test robot <lkp@intel.com>
To: Pedro Falcato <pfalcato@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/arm64/mm/contpte.c:325:35: warning: passing argument 1
 of 'contpte_align_down' discards 'const' qualifier from pointer target type
Message-ID: <202607241806.TpvCNvDZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pedro-Falcato/mm-constify-generic-pte_get/20260724-184321
head:   06cbf73db932e6dbb5910dc4ec0bc7e2c43bfec6
commit: 86a49b691863bb937b4943cf77f83da58af4143e mm/arm64: constify pte_get*() and contpte get logic
date:   6 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260724/202607241806.TpvCNvDZ-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607241806.TpvCNvDZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607241806.TpvCNvDZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/mm/contpte.c: In function 'contpte_ptep_get':
>> arch/arm64/mm/contpte.c:325:35: warning: passing argument 1 of 'contpte_align_down' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     325 |         ptep = contpte_align_down(ptep);
         |                                   ^~~~
   arch/arm64/mm/contpte.c:24:48: note: expected 'pte_t *' but argument is of type 'const pte_t *'
      24 | static inline pte_t *contpte_align_down(pte_t *ptep)
         |                                         ~~~~~~~^~~~
   arch/arm64/mm/contpte.c: In function 'contpte_ptep_get_lockless':
   arch/arm64/mm/contpte.c:403:35: warning: passing argument 1 of 'contpte_align_down' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     403 |         ptep = contpte_align_down(orig_ptep);
         |                                   ^~~~~~~~~
   arch/arm64/mm/contpte.c:24:48: note: expected 'pte_t *' but argument is of type 'const pte_t *'
      24 | static inline pte_t *contpte_align_down(pte_t *ptep)
         |                                         ~~~~~~~^~~~


vim +325 arch/arm64/mm/contpte.c

4602e5757bcceb Ryan Roberts  2024-02-15  312  
86a49b691863bb Pedro Falcato 2026-07-24  313  pte_t contpte_ptep_get(const pte_t *ptep, pte_t orig_pte)
4602e5757bcceb Ryan Roberts  2024-02-15  314  {
4602e5757bcceb Ryan Roberts  2024-02-15  315  	/*
4602e5757bcceb Ryan Roberts  2024-02-15  316  	 * Gather access/dirty bits, which may be populated in any of the ptes
4602e5757bcceb Ryan Roberts  2024-02-15  317  	 * of the contig range. We are guaranteed to be holding the PTL, so any
4602e5757bcceb Ryan Roberts  2024-02-15  318  	 * contiguous range cannot be unfolded or otherwise modified under our
4602e5757bcceb Ryan Roberts  2024-02-15  319  	 * feet.
4602e5757bcceb Ryan Roberts  2024-02-15  320  	 */
4602e5757bcceb Ryan Roberts  2024-02-15  321  
4602e5757bcceb Ryan Roberts  2024-02-15  322  	pte_t pte;
4602e5757bcceb Ryan Roberts  2024-02-15  323  	int i;
4602e5757bcceb Ryan Roberts  2024-02-15  324  
4602e5757bcceb Ryan Roberts  2024-02-15 @325  	ptep = contpte_align_down(ptep);
4602e5757bcceb Ryan Roberts  2024-02-15  326  
4602e5757bcceb Ryan Roberts  2024-02-15  327  	for (i = 0; i < CONT_PTES; i++, ptep++) {
4602e5757bcceb Ryan Roberts  2024-02-15  328  		pte = __ptep_get(ptep);
4602e5757bcceb Ryan Roberts  2024-02-15  329  
093ae7a033cfde Xavier Xia    2025-06-24  330  		if (pte_dirty(pte)) {
4602e5757bcceb Ryan Roberts  2024-02-15  331  			orig_pte = pte_mkdirty(orig_pte);
093ae7a033cfde Xavier Xia    2025-06-24  332  			for (; i < CONT_PTES; i++, ptep++) {
093ae7a033cfde Xavier Xia    2025-06-24  333  				pte = __ptep_get(ptep);
093ae7a033cfde Xavier Xia    2025-06-24  334  				if (pte_young(pte)) {
093ae7a033cfde Xavier Xia    2025-06-24  335  					orig_pte = pte_mkyoung(orig_pte);
093ae7a033cfde Xavier Xia    2025-06-24  336  					break;
093ae7a033cfde Xavier Xia    2025-06-24  337  				}
093ae7a033cfde Xavier Xia    2025-06-24  338  			}
093ae7a033cfde Xavier Xia    2025-06-24  339  			break;
093ae7a033cfde Xavier Xia    2025-06-24  340  		}
4602e5757bcceb Ryan Roberts  2024-02-15  341  
093ae7a033cfde Xavier Xia    2025-06-24  342  		if (pte_young(pte)) {
4602e5757bcceb Ryan Roberts  2024-02-15  343  			orig_pte = pte_mkyoung(orig_pte);
093ae7a033cfde Xavier Xia    2025-06-24  344  			i++;
093ae7a033cfde Xavier Xia    2025-06-24  345  			ptep++;
093ae7a033cfde Xavier Xia    2025-06-24  346  			for (; i < CONT_PTES; i++, ptep++) {
093ae7a033cfde Xavier Xia    2025-06-24  347  				pte = __ptep_get(ptep);
093ae7a033cfde Xavier Xia    2025-06-24  348  				if (pte_dirty(pte)) {
093ae7a033cfde Xavier Xia    2025-06-24  349  					orig_pte = pte_mkdirty(orig_pte);
093ae7a033cfde Xavier Xia    2025-06-24  350  					break;
093ae7a033cfde Xavier Xia    2025-06-24  351  				}
093ae7a033cfde Xavier Xia    2025-06-24  352  			}
093ae7a033cfde Xavier Xia    2025-06-24  353  			break;
093ae7a033cfde Xavier Xia    2025-06-24  354  		}
4602e5757bcceb Ryan Roberts  2024-02-15  355  	}
4602e5757bcceb Ryan Roberts  2024-02-15  356  
4602e5757bcceb Ryan Roberts  2024-02-15  357  	return orig_pte;
4602e5757bcceb Ryan Roberts  2024-02-15  358  }
912609e96cd728 Ryan Roberts  2024-02-26  359  EXPORT_SYMBOL_GPL(contpte_ptep_get);
4602e5757bcceb Ryan Roberts  2024-02-15  360  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
