Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F23264A71
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 09:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744103775; cv=none; b=eg8QvLpeFW3sIVMfvEitwUNtNpK09KpXW5Q8cOdcNa5ypib1CLmoX9NkABx1WTATw9DqPYA43Vb3aq9DSpi5PF7TvTbIbcwmJF+Rk5Iy8aaHi8H3ndqlVS6Rl03c0fHHVlGAlwuE0C7HDEuTGowDeAoXFNMTU9lninFTAjLuYB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744103775; c=relaxed/simple;
	bh=CRbXwnQ48TrwJqcVJJME91vVPABwpKwJgJg0mSwwus4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RJkD1jsgDC1yoG5+QliKUm9BUw+4HIx0iChrmgDbFlT1r8ED/MqVlHHMt2lxAVaHvl6d1NhtoGcNuogsyGwDKgLSSjToWEIrtQSaNmw6y5MaTc8KZsWmNpvQsRVOcZS53ocMCsVrUY/kTxDi8dS1d/Kvj0j53WMhwc7LdmQ7xfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K4qQenWQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K4qQenWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744103773; x=1775639773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CRbXwnQ48TrwJqcVJJME91vVPABwpKwJgJg0mSwwus4=;
  b=K4qQenWQcB7WQPAw4VF0cHsbHFJTI+5s+Ga6DGoLLiBVw/o1IQPgFZnc
   PgRSxbAXi7nm13uqCIuLHzzbuZ04Hy6fXVdqaYCiCkft+Ic+HLdf+B2hI
   Tb5SeIAMjyG9xB6Xj1AW9vsIW65igR7APbdCYOCAKv8v1BPRq3p9zbuVp
   cTvf2G42LcOXrdILfzWEOBcZHYB1vU+yk5c3ADekFLqdUySBD9GfzPIq6
   iKyAtGxlWAbcTT9C/bx85IJlqG1QHhnkXOhNZ8pHY1DPaN6YXszF+c/wW
   WBXfb5Yvl3QKy3iJTIHFRvAJQCOFe5zOqRhBuzap9zIqCfuGejNBhv/NF
   g==;
X-CSE-ConnectionGUID: PHb7z//vTtSSzh9ujRMmNA==
X-CSE-MsgGUID: Hm22XUf0TuOEHn8v8ytHwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45240291"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45240291"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 02:16:12 -0700
X-CSE-ConnectionGUID: 5yJKTg6zTmiB0chIbNvsfA==
X-CSE-MsgGUID: ZuQu/4CxRy6lavA/+TN66w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="159201561"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 08 Apr 2025 02:16:09 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u253s-0004NG-2U;
	Tue, 08 Apr 2025 09:16:04 +0000
Date: Tue, 8 Apr 2025 17:15:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] mm/memory.c:5965:15: warning:
 unused variable 'pmd'
Message-ID: <202504081759.bcVX84ca-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: bd617fc27c23d34e76440e74b3834c287b878d07 [9/9] anolis: mm: support fast reflink
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250408/202504081759.bcVX84ca-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081759.bcVX84ca-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081759.bcVX84ca-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'fr_apply_vma':
>> mm/memory.c:5965:15: warning: unused variable 'pmd' [-Wunused-variable]
    5965 |         pmd_t pmd;
         |               ^~~


vim +/pmd +5965 mm/memory.c

  5956	
  5957	static void fr_apply_vma(struct vm_area_struct *vma)
  5958	{
  5959		struct mm_struct *mm = vma->vm_mm;
  5960		unsigned long start = vma->vm_start;
  5961		unsigned long end = vma->vm_end;
  5962		unsigned long next;
  5963		spinlock_t *pml;
  5964		pmd_t *pmdp = NULL;
> 5965		pmd_t pmd;
  5966		bool applied = false;
  5967	
  5968		do {
  5969			next = pmd_addr_end(start, end);
  5970			if (follow_pmd(mm, start, &pmdp))
  5971				continue;
  5972	
  5973			pml = pmd_lock(mm, pmdp);
  5974			if (pmd_huge(*pmdp)) {
  5975	#ifdef CONFIG_FS_DAX_PMD
  5976				if (!pmd_dirty(*pmdp) && !pmd_write(*pmdp))
  5977					goto unlock_pmd;
  5978	
  5979				pmd = pmdp_invalidate(vma, start, pmdp);
  5980				pmd = pmd_wrprotect(pmd);
  5981				pmd = pmd_mkclean(pmd);
  5982				set_pmd_at(mm, start, pmdp, pmd);
  5983	unlock_pmd:
  5984	#endif
  5985				spin_unlock(pml);
  5986				continue;
  5987			}
  5988	
  5989			if (pmd_none(*pmdp) || unlikely(pmd_bad(*pmdp))) {
  5990				spin_unlock(pml);
  5991				continue;
  5992			}
  5993	
  5994			if (IS_ALIGNED(start, PMD_SIZE) && (start + PMD_SIZE <= end)) {
  5995				pmdp_set_tbl_wrprotect(mm, start, pmdp);
  5996				flush_tlb_range(vma, start, start + PMD_SIZE);
  5997				applied = true;
  5998				spin_unlock(pml);
  5999				continue;
  6000			} else {
  6001				spin_unlock(pml);
  6002				fr_apply_pte_range(vma, pmdp, start, next);
  6003				flush_tlb_range(vma, start, next);
  6004				continue;
  6005			}
  6006		} while (start = next, start != end);
  6007	
  6008		if (applied)
  6009			vma->fast_reflink = applied;
  6010	}
  6011	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
