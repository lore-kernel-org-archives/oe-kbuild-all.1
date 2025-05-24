Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 226C5E56A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 21:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748123503; cv=none; b=LDZMnZ++zO7AAkZPSIpvFUeNO/wR6tEVb74geJ/vPiNr6vU3bTreRWxfXt8bCkulZof5Ywzi2aopnAmQ/FVW9mTMOvZ9SOBpW6umAxigyCV+gg9cQRf0WetBwkaQZaJN0N44+zc2kCvFfuC91X+lqBsV3geS4XGUw8juFxBQEGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748123503; c=relaxed/simple;
	bh=v6kbl0wsWACj8zN+hVpx1mQ7tZbksGiZ35HKZDliX9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NA/I8N9yft+k9UPIVoEUUuWcX/dkm2hjUDe1VPzj6llHBsqraY7JlO9O1dg5VhvL1iw4R733TtLMGamLfO5Vhfn34HDot3VIWJgjgl5LyVqnyfb3dPdtpcbzAQzwAltQAr03WyowjXDFlLcHghXMtR2bAnjFVrAVpj9aMJUA4yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YSuqI/Km; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YSuqI/Km"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748123501; x=1779659501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v6kbl0wsWACj8zN+hVpx1mQ7tZbksGiZ35HKZDliX9A=;
  b=YSuqI/KmxqVWRbhKmnrFIgBRfl+hHoIBgc5SVek3roF+UPhVGy+hByk/
   MflOZ35XAXITDDsWVxbYQp21ZcL9tMVgJtK57OKdws++Lqy6CkxTxXavg
   2MieR3V38TBMzGwmL+6lRKtBOXcHDtdiBLDne8a1A3teIV4sDtNgifugm
   NX6QcFHcEDStFcIcHc/NV2YOEzXepIW9xntRpipP8AfnX94PA8v/bDPFT
   7pVjKRYkDMHPADoe4qbMk3p/VnkvEGm5/RXP2TIr1zmllJC8yYUFQ0cvT
   OSTF2EsBBOR1r6cM+FxRiGaSmj9Mrj2m5JFzzVt87HMN0ShYmIyzJLR5S
   g==;
X-CSE-ConnectionGUID: 6yfy/hhESKCjpuQoJmzyhA==
X-CSE-MsgGUID: 9ZEPJSqxRt+1FpJdT0KYmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50065338"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50065338"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 14:51:40 -0700
X-CSE-ConnectionGUID: l/EJff3LR9+4/ZOm9xe/PA==
X-CSE-MsgGUID: Ek3/EbVIT9aIVtmAphYVvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141619611"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 24 May 2025 14:51:39 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIwmG-000RTe-1r;
	Sat, 24 May 2025 21:51:36 +0000
Date: Sun, 25 May 2025 05:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: Anthony Yznaga <anthony.yznaga@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [jlayton:uek-localio 2075/2262] mm/mprotect.c:741:34: error:
 'PROT_RESERVED' undeclared; did you mean 'STATX__RESERVED'?
Message-ID: <202505250558.UsFMTCTn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 1531d95799a9ff0fe66223d38ac49153572f53d6 [2075/2262] mm: Allow userspace to reserve VA range for use by userspace only
config: parisc-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250525/202505250558.UsFMTCTn-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250558.UsFMTCTn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505250558.UsFMTCTn-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/userfaultfd_k.h:18,
                    from include/linux/hugetlb.h:16,
                    from mm/mprotect.c:13:
   include/linux/highmem.h: In function 'clear_user_highpage_uncached':
   include/linux/highmem.h:265:2: error: implicit declaration of function 'clear_user_page_uncached'; did you mean 'clear_user_highpage_uncached'? [-Werror=implicit-function-declaration]
     clear_user_page_uncached(addr, vaddr, page);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     clear_user_highpage_uncached
   mm/mprotect.c: In function 'do_mprotect_pkey':
>> mm/mprotect.c:741:34: error: 'PROT_RESERVED' undeclared (first use in this function); did you mean 'STATX__RESERVED'?
     if (!arch_validate_prot(prot & ~PROT_RESERVED, start))
                                     ^~~~~~~~~~~~~
                                     STATX__RESERVED
   mm/mprotect.c:741:34: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +741 mm/mprotect.c

   707	
   708	/*
   709	 * pkey==-1 when doing a legacy mprotect()
   710	 */
   711	static int do_mprotect_pkey(unsigned long start, size_t len,
   712			unsigned long prot, int pkey)
   713	{
   714		unsigned long nstart, end, tmp, reqprot;
   715		struct vm_area_struct *vma, *prev;
   716		int error;
   717		const int grows = prot & (PROT_GROWSDOWN|PROT_GROWSUP);
   718		const bool rier = (current->personality & READ_IMPLIES_EXEC) &&
   719					(prot & PROT_READ);
   720		struct mmu_gather tlb;
   721		struct vma_iterator vmi;
   722	
   723		start = untagged_addr(start);
   724	
   725		prot &= ~(PROT_GROWSDOWN|PROT_GROWSUP);
   726		if (grows == (PROT_GROWSDOWN|PROT_GROWSUP)) /* can't be both */
   727			return -EINVAL;
   728	
   729		if (start & ~PAGE_MASK)
   730			return -EINVAL;
   731		if (!len)
   732			return 0;
   733		len = PAGE_ALIGN(len);
   734		end = start + len;
   735		if (end <= start)
   736			return -ENOMEM;
   737		/*
   738		 * Remove PROT_RESERVED rather than teach architectures that
   739		 * it is okay.
   740		 */
 > 741		if (!arch_validate_prot(prot & ~PROT_RESERVED, start))
   742			return -EINVAL;
   743	
   744		reqprot = prot;
   745	
   746		if (mmap_write_lock_killable(current->mm))
   747			return -EINTR;
   748	
   749		/*
   750		 * If userspace did not allocate the pkey, do not let
   751		 * them use it here.
   752		 */
   753		error = -EINVAL;
   754		if ((pkey != -1) && !mm_pkey_is_allocated(current->mm, pkey))
   755			goto out;
   756	
   757		vma_iter_init(&vmi, current->mm, start);
   758		vma = vma_find(&vmi, end);
   759		error = -ENOMEM;
   760		if (prot & PROT_RESERVED) {
   761			if (vma || !access_ok((const void *)start, len))
   762				error = -EINVAL;
   763			else
   764				error = install_rsvd_mapping(current->mm, start, len);
   765			goto out;
   766		}
   767		if (!vma)
   768			goto out;
   769	
   770		if (unlikely(grows & PROT_GROWSDOWN)) {
   771			if (vma->vm_start >= end)
   772				goto out;
   773			start = vma->vm_start;
   774			error = -EINVAL;
   775			if (!(vma->vm_flags & VM_GROWSDOWN))
   776				goto out;
   777		} else {
   778			if (vma->vm_start > start)
   779				goto out;
   780			if (unlikely(grows & PROT_GROWSUP)) {
   781				end = vma->vm_end;
   782				error = -EINVAL;
   783				if (!(vma->vm_flags & VM_GROWSUP))
   784					goto out;
   785			}
   786		}
   787	
   788		prev = vma_prev(&vmi);
   789		if (start > vma->vm_start)
   790			prev = vma;
   791	
   792		tlb_gather_mmu(&tlb, current->mm);
   793		nstart = start;
   794		tmp = vma->vm_start;
   795		for_each_vma_range(vmi, vma, end) {
   796			unsigned long mask_off_old_flags;
   797			unsigned long newflags;
   798			int new_vma_pkey;
   799	
   800			if (vma->vm_start != tmp) {
   801				error = -ENOMEM;
   802				break;
   803			}
   804	
   805			/* Does the application expect PROT_READ to imply PROT_EXEC */
   806			if (rier && (vma->vm_flags & VM_MAYEXEC))
   807				prot |= PROT_EXEC;
   808	
   809			/*
   810			 * Each mprotect() call explicitly passes r/w/x permissions.
   811			 * If a permission is not passed to mprotect(), it must be
   812			 * cleared from the VMA.
   813			 */
   814			mask_off_old_flags = VM_ACCESS_FLAGS | VM_FLAGS_CLEAR;
   815	
   816			new_vma_pkey = arch_override_mprotect_pkey(vma, prot, pkey);
   817			newflags = calc_vm_prot_bits(prot, new_vma_pkey);
   818			newflags |= (vma->vm_flags & ~mask_off_old_flags);
   819	
   820			/* newflags >> 4 shift VM_MAY% in place of VM_% */
   821			if ((newflags & ~(newflags >> 4)) & VM_ACCESS_FLAGS) {
   822				error = -EACCES;
   823				break;
   824			}
   825	
   826			if (map_deny_write_exec(vma->vm_flags, newflags)) {
   827				error = -EACCES;
   828				break;
   829			}
   830	
   831			/* Allow architectures to sanity-check the new flags */
   832			if (!arch_validate_flags(newflags)) {
   833				error = -EINVAL;
   834				break;
   835			}
   836	
   837			error = security_file_mprotect(vma, reqprot, prot);
   838			if (error)
   839				break;
   840	
   841			tmp = vma->vm_end;
   842			if (tmp > end)
   843				tmp = end;
   844	
   845			if (vma->vm_ops && vma->vm_ops->mprotect) {
   846				error = vma->vm_ops->mprotect(vma, nstart, tmp, newflags);
   847				if (error)
   848					break;
   849			}
   850	
   851			error = mprotect_fixup(&vmi, &tlb, vma, &prev, nstart, tmp, newflags);
   852			if (error)
   853				break;
   854	
   855			tmp = vma_iter_end(&vmi);
   856			nstart = tmp;
   857			prot = reqprot;
   858		}
   859		tlb_finish_mmu(&tlb);
   860	
   861		if (!error && tmp < end)
   862			error = -ENOMEM;
   863	
   864	out:
   865		mmap_write_unlock(current->mm);
   866		return error;
   867	}
   868	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
