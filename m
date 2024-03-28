Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29A018D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 00:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711587590; cv=none; b=vEOroZZXnZchDAO7IN8c6M4QT0XDpZthGjZdD8Nt+j62skLtLD2rk1GJdEb68wqezxW9BLV+Zprc7t87jS6hr5HNhki+Pu7NHWQ/bhKa1bxIZy6Tp/akbpt25L3jaUQvoQpwH0uH7Wc1pHXpwW3HZ9e3dQimPFw1qqTVNCOM26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711587590; c=relaxed/simple;
	bh=x8tYF2DHxBq0yg9P90K/8wgO03kcDoBog6+JO41MPR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Un7pKMomy5u9iahtTO1oYuMlB80f+EfpLXDUBCEiDVsv3q2xfI5xuKGAfEvramg/gFQpRKFLACmr5cpVvFOYB9LLHMom6B3GX1LBATwS1bMhtpqoDkM3IQCHhW3AW58Y9S75UzMs6PLq6qUQfd2VuT231BcXbbrf2DltcTbb9nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CX1E3iJi; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CX1E3iJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711587589; x=1743123589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x8tYF2DHxBq0yg9P90K/8wgO03kcDoBog6+JO41MPR4=;
  b=CX1E3iJi4BCJwp0/yqrXiPA0dyWibK865US8bmpiz3rmEKVZLUa9AHiD
   wGbC/g4j2xW1gfc1K9hq199l0EnizCgU7F4t6m9idiXCoRy3APEgA2YeP
   83FPLJygU/9EGPJMVoSj+s26X9oNZXI3dFQv1wz4k9Jm7wCRoAw32fAKe
   3wzIytKcMCugz9YiOUzczGDycYbDcSZRo0a2M+314+T1slmL2yyZWnK/a
   03v5+rShuK8dSJ9/qxZnW/gQ8/QHdaxRqGpFa9MoiNBl8xmBVngFRSg4l
   EyW1GdzKeeNmDLmnXAWqoGkVBqrNmNsF32FNoXKC0lHtNCvK1JFTfPWsT
   Q==;
X-CSE-ConnectionGUID: 9zA7VzUYSDygT9LgxlPX1w==
X-CSE-MsgGUID: 7ztbij4nTRe499KSwEWICw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="6551549"
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="6551549"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 17:59:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,160,1708416000"; 
   d="scan'208";a="16552152"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Mar 2024 17:59:46 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rpe7M-0001eg-0z;
	Thu, 28 Mar 2024 00:59:44 +0000
Date: Thu, 28 Mar 2024 08:58:52 +0800
From: kernel test robot <lkp@intel.com>
To: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 174/199] mm/memory.c:5094:25: warning: variable
 'pte' is uninitialized when used here
Message-ID: <202403280834.zWjRlaM9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   2f423131bebaa5a4f4b8cf460d96245e93a40905
commit: 0f47c75aeb7aae02c433e322ebbd4d6d757418d5 [174/199] mm: support multi-size THP numa balancing
config: x86_64-randconfig-123-20240327 (https://download.01.org/0day-ci/archive/20240328/202403280834.zWjRlaM9-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403280834.zWjRlaM9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403280834.zWjRlaM9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:5094:25: warning: variable 'pte' is uninitialized when used here [-Wuninitialized]
    5094 |                         writable = pte_write(pte);
         |                                              ^~~
   mm/memory.c:5083:3: note: variable 'pte' is declared here
    5083 |                 pte_t pte, old_pte;
         |                 ^
   1 warning generated.


vim +/pte +5094 mm/memory.c

  5070	
  5071	static void numa_rebuild_large_mapping(struct vm_fault *vmf, struct vm_area_struct *vma,
  5072					       struct folio *folio, pte_t fault_pte, bool ignore_writable)
  5073	{
  5074		int nr = pte_pfn(fault_pte) - folio_pfn(folio);
  5075		unsigned long start = max(vmf->address - nr * PAGE_SIZE, vma->vm_start);
  5076		unsigned long end = min(start + folio_nr_pages(folio) * PAGE_SIZE, vma->vm_end);
  5077		pte_t *start_ptep = vmf->pte - (vmf->address - start) / PAGE_SIZE;
  5078		bool pte_write_upgrade = vma_wants_manual_pte_write_upgrade(vma);
  5079		unsigned long addr;
  5080	
  5081		/* Restore all PTEs' mapping of the large folio */
  5082		for (addr = start; addr != end; start_ptep++, addr += PAGE_SIZE) {
  5083			pte_t pte, old_pte;
  5084			pte_t ptent = ptep_get(start_ptep);
  5085			bool writable = false;
  5086	
  5087			if (!pte_present(ptent) || !pte_protnone(ptent))
  5088				continue;
  5089	
  5090			if (vm_normal_folio(vma, addr, ptent) != folio)
  5091				continue;
  5092	
  5093			if (!ignore_writable) {
> 5094				writable = pte_write(pte);
  5095				if (!writable && pte_write_upgrade &&
  5096				    can_change_pte_writable(vma, addr, pte))
  5097					writable = true;
  5098			}
  5099	
  5100			old_pte = ptep_modify_prot_start(vma, addr, start_ptep);
  5101			pte = pte_modify(old_pte, vma->vm_page_prot);
  5102			pte = pte_mkyoung(pte);
  5103			if (writable)
  5104				pte = pte_mkwrite(pte, vma);
  5105			ptep_modify_prot_commit(vma, addr, start_ptep, old_pte, pte);
  5106			update_mmu_cache_range(vmf, vma, addr, start_ptep, 1);
  5107		}
  5108	}
  5109	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
