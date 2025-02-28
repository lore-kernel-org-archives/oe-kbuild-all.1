Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E711DDA20
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 08:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740733201; cv=none; b=edPLq9j48HkPQgFHlGPwiZi6QH3HKvONojGMBvsj1b+ieto8pZ+ZaAJSG0R2U01TQ8+iGOzMhQqDauEiMydt9LXznYuvWSzVPnuTa4ZTlJTzS05Cu0zGOi5v5bK0+/8ojeMF7Ws+mfS3hedXOOmX4ZYRnND5vdbGT5NZfCdYgBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740733201; c=relaxed/simple;
	bh=4BPjD2UZw0OAXR8Y1n7fuXVzjHu+Ea0jL4l5agJ07rE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HS5AB2m63/i0zDlBbZaSt68vZlKi/1EA37+RrO2YG7DZQGY17BkWO06Y6k2e+fpy4whFD1c8rSfk7Pmpp4IaudfioeI4zh/nW8SnZZad7tEbFvSSz82tIf6anvJFXqmiZybjLzQ8c0yqOmRFegDUOdWYSEL+9Gwftcln1dEKaDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4BiRrqF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4BiRrqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740733200; x=1772269200;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4BPjD2UZw0OAXR8Y1n7fuXVzjHu+Ea0jL4l5agJ07rE=;
  b=C4BiRrqFW2N9PnkpDp96EAGCHSXc/Df2JJnxeblHI55uZdICxUstCX8Y
   mlkC66n2DUGr0yPlOdi1/10cuVG1VRLLzsM1bu42Rz71J3IsJHKMqXn7a
   mc3LdFo/HxfkdtX/Z9cWXd88v7pIGSZKIKOunHEw6s2IGfCfnr/gRxZkw
   IaCFC5mVDJOYXe4YzxHCNAqE8f8KXFx4g2Jtv7veFR2N/rEdlmMQbeXxK
   +QeqSgsC2po+rjwCBZzSVaRacJLaq4dFIGJ2q6WY+J6Mnbz5bO4gOLj/e
   IR3Wo7mDO7QAuVPa5OXDFcCFeNkaXfAjTGVe8r/VHAkCGdxoqsqnnXdeD
   Q==;
X-CSE-ConnectionGUID: ZGuhGBwPQ3OKE405jSnQIw==
X-CSE-MsgGUID: u/61QE7TSWCGsIUqyKA/pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41778572"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="41778572"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 00:59:59 -0800
X-CSE-ConnectionGUID: suvkcoGvScK8UFj1p+XCeg==
X-CSE-MsgGUID: +CGggtA5RJ2DsDNKDSdW1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="117257545"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 28 Feb 2025 01:00:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnwDs-000Ee2-1w;
	Fri, 28 Feb 2025 08:59:56 +0000
Date: Fri, 28 Feb 2025 16:59:36 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/1] mm/memory.c:6757:15: warning:
 unused variable 'pmd'
Message-ID: <202502281619.LbobQJMQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   83b17ccb9899d35bc10eaa78f87da816e711f9e3
commit: f1c74747e787a574212337dae6baea4177ec03e6 [0/1] anolis: mm: support fast reflink
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250228/202502281619.LbobQJMQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281619.LbobQJMQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281619.LbobQJMQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'fr_apply_vma':
>> mm/memory.c:6757:15: warning: unused variable 'pmd' [-Wunused-variable]
    6757 |         pmd_t pmd;
         |               ^~~


vim +/pmd +6757 mm/memory.c

  6748	
  6749	static void fr_apply_vma(struct vm_area_struct *vma)
  6750	{
  6751		struct mm_struct *mm = vma->vm_mm;
  6752		unsigned long start = vma->vm_start;
  6753		unsigned long end = vma->vm_end;
  6754		unsigned long next;
  6755		spinlock_t *pml;
  6756		pmd_t *pmdp = NULL;
> 6757		pmd_t pmd;
  6758		bool applied = false;
  6759	
  6760		do {
  6761			next = pmd_addr_end(start, end);
  6762			if (follow_pmd(mm, start, &pmdp))
  6763				continue;
  6764	
  6765			pml = pmd_lock(mm, pmdp);
  6766			if (pmd_huge(*pmdp)) {
  6767	#ifdef CONFIG_FS_DAX_PMD
  6768				if (!pmd_dirty(*pmdp) && !pmd_write(*pmdp))
  6769					goto unlock_pmd;
  6770	
  6771				pmd = pmdp_invalidate(vma, start, pmdp);
  6772				pmd = pmd_wrprotect(pmd);
  6773				pmd = pmd_mkclean(pmd);
  6774				set_pmd_at(mm, start, pmdp, pmd);
  6775	unlock_pmd:
  6776	#endif
  6777				spin_unlock(pml);
  6778				continue;
  6779			}
  6780	
  6781			if (pmd_none(*pmdp) || unlikely(pmd_bad(*pmdp))) {
  6782				spin_unlock(pml);
  6783				continue;
  6784			}
  6785	
  6786			if (IS_ALIGNED(start, PMD_SIZE) && (start + PMD_SIZE <= end)) {
  6787				pmdp_set_tbl_wrprotect(mm, start, pmdp);
  6788				flush_tlb_range(vma, start, start + PMD_SIZE);
  6789				applied = true;
  6790				spin_unlock(pml);
  6791				continue;
  6792			} else {
  6793				spin_unlock(pml);
  6794				fr_apply_pte_range(vma, pmdp, start, next);
  6795				flush_tlb_range(vma, start, next);
  6796				continue;
  6797			}
  6798		} while (start = next, start != end);
  6799	
  6800		if (applied)
  6801			vma->fast_reflink = applied;
  6802	}
  6803	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
