Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E341E3DCF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 04:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747195963; cv=none; b=p0HWtXzDe2+9QoP7nPQEpDSwB5kShv8Jzyx8EPhHX0zp/MKNfSVW1piytggJIF+Gp7+nub2uX8SDL0SVCaTlIFFZLIE554+mZA3dxekI35rTNW48mHAz6iif69I+iutI0Xg8CVg0Mxlqcsd7RwTduxu6kcvfHLaCUjK5bRJ0wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747195963; c=relaxed/simple;
	bh=mr6plezJe2fVh0XSVK1aTVruQ/O7X9RljVQxSEZcoiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YZIMad5ChfuCTO38OyA8JdQ5UY5bonJ/M5Bo4vn1N3jOvGKki6QXh64EvQSst3BYdo5pfHCMAjiZctBQBZfTCSyincGJJ41yjHD892rW+SORjk8vePeRoKyAJNx8Z503fDHbyGWbJhMzok+rwKLVv22uJ1Drsaf1Y3cmxA3Xs9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZN/Ue1dC; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZN/Ue1dC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747195962; x=1778731962;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mr6plezJe2fVh0XSVK1aTVruQ/O7X9RljVQxSEZcoiA=;
  b=ZN/Ue1dCQjMI/EL+TMzRbDaOiUQOdywZJDCpgsCZjWBk2G4wiQjP2aLI
   lyKi//DWpG5MiDllymKzHyusXxvBrHNVGF5Actj416NajAtvTAeXNN/YW
   r543EKbVuFp+lfaxNoS9QW/Ta0qPM4fqpU1yUNBLEkXUwDAw8WitnxnNx
   15jyqgWtKeTIOwwLEB+gX8PosZcfM45UCoY8unGLQlzUzsOUhuCQij2bg
   WiUos+eKBteAfBuuzIpJuqIJzaqXtcykLQ32t4/QUSfTYdoWJN9kPZRPO
   WV8wx9MHpwX0gemX+TjQ0EhGRhyXxUCsFQXXECoRXkB+YS0Y3DnLfDpe/
   g==;
X-CSE-ConnectionGUID: 2A+FNMG0Q+SarcNa6bOfXg==
X-CSE-MsgGUID: H8O2Mol2T16zNRqibNg94A==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="60409903"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="60409903"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 21:12:41 -0700
X-CSE-ConnectionGUID: 8EyRoopxSeWhJrhBWBalNA==
X-CSE-MsgGUID: WZbBUrrLSHmmH42OPfY7NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="142858360"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 May 2025 21:12:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uF3Tx-000GfD-37;
	Wed, 14 May 2025 04:12:37 +0000
Date: Wed, 14 May 2025 12:11:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 56/56] mm/memory.c:6754:15: warning:
 unused variable 'pmd'
Message-ID: <202505141247.K9jMvXZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   962678f628e6378bd0b60eeb52c2e28ec5881096
commit: 8e2a4b00665bc7338cf1e8080112abc8314c42e6 [56/56] anolis: mm: support fast reflink
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250514/202505141247.K9jMvXZQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505141247.K9jMvXZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505141247.K9jMvXZQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/memory.c: In function 'fr_apply_vma':
>> mm/memory.c:6754:15: warning: unused variable 'pmd' [-Wunused-variable]
    6754 |         pmd_t pmd;
         |               ^~~


vim +/pmd +6754 mm/memory.c

  6745	
  6746	static void fr_apply_vma(struct vm_area_struct *vma)
  6747	{
  6748		struct mm_struct *mm = vma->vm_mm;
  6749		unsigned long start = vma->vm_start;
  6750		unsigned long end = vma->vm_end;
  6751		unsigned long next;
  6752		spinlock_t *pml;
  6753		pmd_t *pmdp = NULL;
> 6754		pmd_t pmd;
  6755		bool applied = false;
  6756	
  6757		do {
  6758			next = pmd_addr_end(start, end);
  6759			if (follow_pmd(mm, start, &pmdp))
  6760				continue;
  6761	
  6762			pml = pmd_lock(mm, pmdp);
  6763			if (pmd_huge(*pmdp)) {
  6764	#ifdef CONFIG_FS_DAX_PMD
  6765				if (!pmd_dirty(*pmdp) && !pmd_write(*pmdp))
  6766					goto unlock_pmd;
  6767	
  6768				pmd = pmdp_invalidate(vma, start, pmdp);
  6769				pmd = pmd_wrprotect(pmd);
  6770				pmd = pmd_mkclean(pmd);
  6771				set_pmd_at(mm, start, pmdp, pmd);
  6772	unlock_pmd:
  6773	#endif
  6774				spin_unlock(pml);
  6775				continue;
  6776			}
  6777	
  6778			if (pmd_none(*pmdp) || unlikely(pmd_bad(*pmdp))) {
  6779				spin_unlock(pml);
  6780				continue;
  6781			}
  6782	
  6783			if (IS_ALIGNED(start, PMD_SIZE) && (start + PMD_SIZE <= end)) {
  6784				pmdp_set_tbl_wrprotect(mm, start, pmdp);
  6785				flush_tlb_range(vma, start, start + PMD_SIZE);
  6786				applied = true;
  6787				spin_unlock(pml);
  6788				continue;
  6789			} else {
  6790				spin_unlock(pml);
  6791				fr_apply_pte_range(vma, pmdp, start, next);
  6792				flush_tlb_range(vma, start, next);
  6793				continue;
  6794			}
  6795		} while (start = next, start != end);
  6796	
  6797		if (applied)
  6798			vma->fast_reflink = applied;
  6799	}
  6800	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
