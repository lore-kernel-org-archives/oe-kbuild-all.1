Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934279;
	b=VLCyJURwaB8fCS9xmy2+ZZ98xguL7YNqahkchS3b60lsgDmTuC5W+KMkj15lDWbQG4Uq
	 lKQLjwSAWpH6YYoU/YUeUEfu9sE27BB3Y8ALyrkE4TSuSKLrU+0RtauaaBzekF6l+qMTo
	 ELccAdM1fJ3OPh2+QFstM5cHydkF66X4HB0IQKmo8ndBAUfmEPiS7WoOxvYTI2k6gr0Ye
	 tcBRDSXnPnqvFmY3LKFWofQXmiWQp8ys9yzVfefWseTrGh7em9w1BPVS7KNokKeoRfTqq
	 p5iph6JJawMP51TgoeaoCyFmpne5TjGtMregJvDFXpFBZOUCZdOBN7F3AfaYJoeE5Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934279;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=RT4X/T0EuH0TmEYOt+HYB/RGMpJQFe8/Bu+i4DTLK/k=;
	b=WfkQFQtr5WhT3FKS00SuLRaplXlVjEQ459r8Xu+HPk6rctmyPSMskmU2N0Pb5faMWWph
	 KtFMc/s/20zNv3QeppvOYQgO/N4V7mAVsNfjcYbQlgg7Gy+CewI+e75+zVOElHR99kCXT
	 aCDEd1WWy1hHR11uIGp8eS+PHaJwqM1XY8EPHLIlUKm+01zUAfzhbozFvKMB6WyCj1108
	 h5DR0Bv/9QurblJIP7XDwWN5wPm6+C/bqmPG0NX7tsRa+IiCeXYLi59ECGYhXHU8KPNuX
	 GtmmPe5JVlGulrVv3mws0fRaqQE5BK5FqJU/7GzesYV9o5EyULQkIzSGVEukyNNDR1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BdqVL2gN;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D2E606A32F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 16:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5D2E606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BdqVL2gN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794934279; x=1826470279;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XgS/tf3vpO0tulClCI8eLPUH78J7AQTbpyP5VYST+vU=;
  b=BdqVL2gNRomceLMKaZ8A7prEFqHT1Ae5Ex0herHaKl2tccJLESw84b0M
   OWpSJbaZPyjJdtxV0mLOOZHYwiG9ga+4yi+fzNik4dQWVq6cTiqg30wpE
   rAqeAGC2TzEgNk8Oai6w8uF+JeVPYMkI7cumUskBmU76vF0qFepdtvPes
   S7/ZZoQpecyejlGZbbsmkRNkj8MK3HlPThNiu1znu4uCSDatI5iu7NfGc
   CVC3NG/tHumNbVqUCJaM56DX77aMBisFk6eJk+DD/B86tspeiORUNnScC
   irTgMbpNMUdhD6VBWLL2i2v76L7Wcu4n+0dXcB1OLpAL/sPxxWI9XfMwq
   A==;
X-CSE-ConnectionGUID: Ms2aC9uyQzWbL7NLsCLnSA==
X-CSE-MsgGUID: BAajp8z3Twy+AIGaYq8dLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3604024"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3604024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 08:51:18 -0800
X-CSE-ConnectionGUID: O0tcxq0VQeyK+L9Lp1UEoQ==
X-CSE-MsgGUID: uCw/BAsQQmWYgbRaBlw6SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9732926"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Nov 2026 08:51:16 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTMOn-00000001C4R-1v7l;
	Tue, 17 Nov 2026 16:51:13 +0000
Date: Wed, 18 Nov 2026 00:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: xu.xin@linux.dev, David Hildenbrand <david@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Donet Tom <donettom@linux.ibm.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-kernel@vger.kernel.org, Xu Xin <xu.xin@linux.dev>,
	stable@vger.kernel.org
Subject: Re: [PATCH] mm/ksm: do not inherit ksm_zero_pages counter or PTE
 markers on fork
Message-ID: <202611180030.dC8BHX2Z-lkp@intel.com>
References: <20261117081821.7211-1-xu.xin@linux.dev>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117081821.7211-1-xu.xin@linux.dev>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/xu-xin-linux-dev/mm-ksm-do-not-inherit-ksm_zero_pages-counter-or-PTE-markers-on-fork/20261117-161821
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20261117081821.7211-1-xu.xin%40linux.dev
patch subject: [PATCH] mm/ksm: do not inherit ksm_zero_pages counter or PTE markers on fork
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20261118/202611180030.dC8BHX2Z-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/202611180030.dC8BHX2Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611180030.dC8BHX2Z-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function '__copy_present_ptes':
>> mm/memory.c:1168:13: error: implicit declaration of function 'is_ksm_zero_pte' [-Wimplicit-function-declaration]
    1168 |         if (is_ksm_zero_pte(pte))
         |             ^~~~~~~~~~~~~~~


vim +/is_ksm_zero_pte +1168 mm/memory.c

  1123	
  1124	static __always_inline void __copy_present_ptes(struct vm_area_struct *dst_vma,
  1125			struct vm_area_struct *src_vma, pte_t *dst_pte, pte_t *src_pte,
  1126			pte_t pte, unsigned long addr, int nr)
  1127	{
  1128		struct mm_struct *src_mm = src_vma->vm_mm;
  1129		bool writable;
  1130	
  1131		/*
  1132		 * Snapshot writability before the RWP-disarm rewrite below: when the
  1133		 * child is not RWP-armed, pte_modify(pte, dst_vma->vm_page_prot) can
  1134		 * silently drop _PAGE_RW from a resolved (no-marker) writable PTE,
  1135		 * so a later pte_write(pte) check would skip the COW wrprotect and
  1136		 * leave the parent writable over a folio shared with the child.
  1137		 */
  1138		writable = pte_write(pte);
  1139	
  1140		/*
  1141		 * Child is not RWP-armed: restore accessible protection so the
  1142		 * inherited PAGE_NONE does not cost a fault on first read. Gate on
  1143		 * pte_uffd(pte) so unrelated PAGE_NONE markers (e.g. NUMA balancing)
  1144		 * are not normalised away.
  1145		 */
  1146		if (!userfaultfd_protected(dst_vma)) {
  1147			if (userfaultfd_rwp(src_vma) && pte_uffd(pte))
  1148				pte = pte_modify(pte, dst_vma->vm_page_prot);
  1149			pte = pte_clear_uffd(pte);
  1150		}
  1151	
  1152		/* If it's a COW mapping, write protect it both processes. */
  1153		if (vma_is_cow_mapping(src_vma) && writable) {
  1154			wrprotect_ptes(src_mm, addr, src_pte, nr);
  1155			pte = pte_wrprotect(pte);
  1156		}
  1157	
  1158		/* If it's a shared mapping, mark it clean in the child. */
  1159		if (src_vma->vm_flags & VM_SHARED)
  1160			pte = pte_mkclean(pte);
  1161		pte = pte_mkold(pte);
  1162	
  1163		/*
  1164		 * Clear the dirty-bit marker on KSM-placed zero-page PTEs in the
  1165		 * child so inherited mappings are not accounted against the child or
  1166		 * unshared by MADV_UNMERGEABLE.  Special PTEs always have nr == 1.
  1167		 */
> 1168		if (is_ksm_zero_pte(pte))
  1169			pte = pte_mkclean(pte);
  1170	
  1171		set_ptes(dst_vma->vm_mm, addr, dst_pte, pte, nr);
  1172	}
  1173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
