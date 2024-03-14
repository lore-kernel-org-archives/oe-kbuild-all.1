Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F337A53BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Mar 2024 04:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710390500; cv=none; b=BV7NXLmNW0qCi/sd6VhzGnIgth2YEE8M4ff3mhBzk5pULp3T1nrdKT0Nz/wKi1POvx2rBaGO70GjJD6D3XHQyH18jzrFyzOEfu0+K20sCpuEKaoVxvLoHL+OybADX4A2ufue2SR/Y8LQJafFLfXvjOTNwIi5uFnbUSStqLlJftQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710390500; c=relaxed/simple;
	bh=eUMMSc1Yrl1XtZldUe9tAHy+FHgyp+OvL6uOiVUa7MM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dhshwOOZFvA3QQvfAO7zCQKksSA1n3IllfhFup6cRDLp7Ny7IRxnbDRe84/NnhrdDUYJuz5k6EY1LM0+kT7U7E2lerT157ol//9cZX+pb/z7VmC1346DVUF63ht1CQEmURAJ1+3OXuQv9tvQpWvSS9ijAefkaX+yRZbOxL+0nOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OvZEOskU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OvZEOskU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710390498; x=1741926498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eUMMSc1Yrl1XtZldUe9tAHy+FHgyp+OvL6uOiVUa7MM=;
  b=OvZEOskUjnfeWZB+pMyYNDOSfWUpqIM/UUVRB9j0Q/bGcankobrnc2vk
   xxUBPj0i72Cm1ZHu7OHoylunzGY+k7ltN9uMoV0y3p6Ohr9BaarKf80dI
   3rp9KbX/A26i19az1DY903G8U1G1vkh1BRIgExfI389bu8iQ4BYQ7cKH/
   KW0hMJzhNAfJecefTczwxOIFGZByST1CD+TMvLHDh1tBL7fcv764+lBBy
   bU5lECRdv7Ldqim6fZPIH5UgLmr/Wb+mDP5aWfaLClbJYWm//9zJx7ttg
   sX9zpghoNEi8adI+Wcdr7ydYz7zTJgo4O7fuNdWzsVB61wXAhrUMRK7HF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="5059640"
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="5059640"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 21:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,124,1708416000"; 
   d="scan'208";a="12048271"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Mar 2024 21:28:16 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkchR-000D55-2U;
	Thu, 14 Mar 2024 04:28:13 +0000
Date: Thu, 14 Mar 2024 12:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 25742/30000]
 drivers/soc/hisilicon/pbha.c:100:21: warning: variable 'ptent' set but not
 used
Message-ID: <202403141207.Ix7wfVox-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9e82708a746dc5d4ec8995a3e6edace2cf23c6fd
commit: 6989680f878a16015e69291360e12cb9242e1360 [25742/30000] arm64: mm: Introduce procfs interface to update PBHA0 bit
config: arm64-randconfig-002-20240312 (https://download.01.org/0day-ci/archive/20240314/202403141207.Ix7wfVox-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403141207.Ix7wfVox-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403141207.Ix7wfVox-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/soc/hisilicon/pbha.c: In function 'pbha_bit0_pte_range':
>> drivers/soc/hisilicon/pbha.c:100:21: warning: variable 'ptent' set but not used [-Wunused-but-set-variable]
     100 |         pte_t *pte, ptent;
         |                     ^~~~~


vim +/ptent +100 drivers/soc/hisilicon/pbha.c

    94	
    95	static int pbha_bit0_pte_range(pmd_t *pmd, unsigned long addr,
    96					unsigned long end, struct mm_walk *walk)
    97	{
    98		int *op = (int *)walk->private;
    99		struct vm_area_struct *vma = walk->vma;
 > 100		pte_t *pte, ptent;
   101		spinlock_t *ptl;
   102		bool set = (*op == SET_PBHA_BIT0_FLAG);
   103	
   104		ptl = pmd_trans_huge_lock(pmd, vma);
   105		if (ptl) {
   106			pbha_bit0_update_pmd_bits(vma, addr, pmd, set);
   107	
   108			spin_unlock(ptl);
   109			return 0;
   110		}
   111	
   112		if (pmd_trans_unstable(pmd))
   113			return 0;
   114	
   115		pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
   116		for (; addr != end; pte++, addr += PAGE_SIZE) {
   117			ptent = *pte;
   118	
   119			pbha_bit0_update_pte_bits(vma, addr, pte, set);
   120		}
   121		pte_unmap_unlock(pte - 1, ptl);
   122		cond_resched();
   123		return 0;
   124	}
   125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
