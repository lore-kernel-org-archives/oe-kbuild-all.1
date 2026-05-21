Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC47827F19F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 05:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779340545; cv=none; b=pVZ73XcpjAgnfvA4lNg4Ndo8xs09Tp5bV2hZYEF1yYsZTer2ttfaWY4R9Ry+mRfxwElqwelWLXvKaWgOSMxl+e/ITv05cHDD0zEdQPXPWqQqtREm5NJSXPCArtrvoikfDcmekT57gxpJG8R6xW3kGCtb+oyXfZGviBzYxMV6NdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779340545; c=relaxed/simple;
	bh=KCaJ8loolmmkZdl6rarTHtSYWKbuce/CJdaUZ0kXPGk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tq+M6a16/XCgtHv7X97Zzgc45660Wh2Cog3mOLYCwOfEhBkJGKYPcQeIQXI8v42W64mch6teZkT6LhbONDjqatf4+7ImXKLpPl2NyMnsca3fbAcRLsRr2pCQRIAGTMXiWAV825Lm/ijRnQ8GtmP/ymJS9wsYDJX5TN+2rX+LyIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MnAnGnkD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MnAnGnkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779340543; x=1810876543;
  h=date:from:to:cc:subject:message-id;
  bh=KCaJ8loolmmkZdl6rarTHtSYWKbuce/CJdaUZ0kXPGk=;
  b=MnAnGnkDgb+uoISa+Yk9lFJoR5T051gOzLT9Fb3UiugUYONLgieUprpO
   zMNmiAY+eIELqYr8OkhVl1wGNU1ggY7k4td1h3ZP4skmdmYGt4lasbu9i
   0Ptf2eXgq03pIWMfypHWRwhw95GJRzljCtkCe2FyuzbRbZSZ3S5qpBo+3
   O+bSFSvk4dLG+HmONO+yZrHbVkw1afVs3BkvmeRXG+Fu68TVDawAyiMz/
   KjnJHG5Xf2wVfIdPLnocRZUGHIH6HPFK5NVgdaWMWsHbjy9FQEgEzuHK8
   oCiTAxa43F5QXi5K3Onp8of12DT+tjRlGjh6vsGerwKz53mA0zzueEoVg
   g==;
X-CSE-ConnectionGUID: plpJXBH0SrquHWE+qbPYbg==
X-CSE-MsgGUID: QzjLJx2eTiKnpK4Tx8VvVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80429206"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80429206"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 22:15:43 -0700
X-CSE-ConnectionGUID: EQIMEYWtRUuHLug6MdssVQ==
X-CSE-MsgGUID: LL/xg5UfSe6dJweFcvwW4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="237818763"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 22:15:42 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPvko-000000004RY-11WB;
	Thu, 21 May 2026 05:15:31 +0000
Date: Thu, 21 May 2026 13:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Ehrhardt <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 521/1130]
 mm/mmap.c:730:33: error: 'ERESERVATION' undeclared
Message-ID: <202605211342.nrJPjyCa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: af9bff1748c242e5113c456afe8e54fe3e9bebe8 [521/1130] [CHERRY-PICK] mm/mmap: Handle reservations in get_unmapped_area
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20260521/202605211342.nrJPjyCa-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211342.nrJPjyCa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605211342.nrJPjyCa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bpfptr.h:6,
                    from include/linux/bpf.h:28,
                    from include/linux/security.h:35,
                    from include/linux/perf_event.h:53,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:95,
                    from mm/mmap.c:21:
   include/linux/compat.h:1119:9: warning: 'is_compat32_task' redefined
    1119 | #define is_compat32_task() (0)
         |         ^~~~~~~~~~~~~~~~
   In file included from include/linux/compat.h:22:
   arch/parisc/include/asm/compat.h:140:9: note: this is the location of the previous definition
     140 | #define is_compat32_task is_compat_task
         |         ^~~~~~~~~~~~~~~~
   mm/mmap.c: In function 'generic_get_unmapped_area':
>> mm/mmap.c:730:33: error: 'ERESERVATION' undeclared (first use in this function)
     730 |                         return -ERESERVATION;
         |                                 ^~~~~~~~~~~~
   mm/mmap.c:730:33: note: each undeclared identifier is reported only once for each function it appears in
   mm/mmap.c: In function 'generic_get_unmapped_area_topdown':
   mm/mmap.c:799:33: error: 'ERESERVATION' undeclared (first use in this function)
     799 |                         return -ERESERVATION;
         |                                 ^~~~~~~~~~~~


vim +/ERESERVATION +730 mm/mmap.c

   681	
   682	/* Get an address range which is currently unmapped.
   683	 * For shmat() with addr=0.
   684	 *
   685	 * Ugly calling convention alert:
   686	 * Return value with the low bits set means error value,
   687	 * ie
   688	 *	if (ret & ~PAGE_MASK)
   689	 *		error = ret;
   690	 *
   691	 * This function "knows" that -ENOMEM has the bits set.
   692	 */
   693	unsigned long
   694	generic_get_unmapped_area(struct file *filp, unsigned long addr,
   695				  unsigned long len, unsigned long pgoff,
   696				  unsigned long flags, vm_flags_t vm_flags)
   697	{
   698		struct mm_struct *mm = current->mm;
   699		struct vm_area_struct *vma, *prev;
   700		struct vm_unmapped_area_info info = {};
   701		const unsigned long mmap_end = arch_get_mmap_end(addr, len, flags);
   702		unsigned long aligned_len = reserv_representable_length(len);
   703	
   704		if (aligned_len > mmap_end - mmap_min_addr)
   705			return -ENOMEM;
   706	
   707		/*
   708		 * If MAP_FIXED is passed in the reservation case, the aligned range
   709		 * should be either completely contained inside an existing
   710		 * reservation, or completely outside (new reservation).
   711		 * Let this scenario fallthrough for the corresponding checks below.
   712		 */
   713		if ((flags & MAP_FIXED) && !reserv_is_supported(mm))
   714			return addr;
   715	
   716		if (addr || (flags & MAP_FIXED)) {
   717			unsigned long aligned_addr;
   718	
   719			addr = PAGE_ALIGN(addr);
   720			aligned_addr = reserv_representable_base(addr, len);
   721			vma = find_vma_prev(mm, aligned_addr, &prev);
   722			if (mmap_end - aligned_len >= aligned_addr && aligned_addr >= mmap_min_addr &&
   723			    (!vma || aligned_addr + aligned_len <= vm_start_gap(vma)) &&
   724			    (!prev || aligned_addr >= vm_end_gap(prev)))
   725				return addr;
   726			else if (flags & MAP_FIXED) {
   727				if ((vma && reserv_vma_range_within_reserv(vma, aligned_addr, aligned_len)) ||
   728				    (prev && reserv_vma_range_within_reserv(prev, aligned_addr, aligned_len)))
   729					return addr;
 > 730				return -ERESERVATION;
   731			}
   732		}
   733	
   734		info.length = len;
   735		info.low_limit = mm->mmap_base;
   736		info.high_limit = mmap_end;
   737		info.start_gap = stack_guard_placement(vm_flags);
   738		info.align_mask |= reserv_representable_alignment(len);
   739		if (filp && is_file_hugepages(filp))
   740			info.align_mask |= huge_page_mask_align(filp);
   741		return vm_unmapped_area(&info);
   742	}
   743	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
