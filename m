Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4D0EC2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 02:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721700792; cv=none; b=FP8m+Lc2RUwaGqoXPIiRYirKF/7AEfACk2dW2LtFE/H3KXFsz6HsC+7vXxdrSMByOcPWKKTI59M4m7fsLrag4IV4cSSglryrtvCX4e8ccyrC5QnqMmh4EhCMB4FrmclZZgxQmMTHWD2fp8e2xJ2rCWfVjFnwSqnOUrYeBwM6Cek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721700792; c=relaxed/simple;
	bh=V9NXmgCw6D6bSW8oqUHod6EJDVF7b04/R0hkblPk+fQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MNsWHvsP75CfOXR+WEfL9herZndidf0wKJjyXxdZHJP+Wio8HWgfzYPfnugXK4AVgbJF8+DSBOCHt7ckRbhtIvDNyl43afeFQuNHrFEWNLntLE8Jr4YA3VRYz986zVW45cF9RFgQxS0gCYyFt7ewBe588UPqG+6y7Njvo83aZP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q0haFOHV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q0haFOHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721700790; x=1753236790;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V9NXmgCw6D6bSW8oqUHod6EJDVF7b04/R0hkblPk+fQ=;
  b=Q0haFOHVBLdnOTFIh0Jt4daAwU8gzDZJFNgIXkITXAXJ0tMLac4kJDQw
   sCl9uj8NTXC+sbqPWyBUGwOhc3mM9yfDzK4kha9RDumA6bxQPYVY0+UVp
   NCyR2eDPfNK3H2P7vAMoxD8H2EvFFCdirGT4YrjABNJp/N9XOzdO4f4fo
   iBqy/lwJgO4XmYxvDJHEscrnqUwhbK0sJmfpV+y+0TDQXw7T3ObAjSwv0
   L+ZbKSnUly+Ws1eTZPk0x/sozgPlbHLKKRTN5whdSizy2sV19VycmdJa1
   5QsJBHnu2uC8xq2Q/YfNxyYB5nP9ECFPMFkoz0HJuOdCPfEzmJz7/Eiwn
   Q==;
X-CSE-ConnectionGUID: slRLaGSyT1GU5N1Njj8bMA==
X-CSE-MsgGUID: P8x87Q+JTCuY1KUnBbyYIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="29964647"
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="29964647"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 19:13:10 -0700
X-CSE-ConnectionGUID: w3xz4xYDQaCpME13rXi88Q==
X-CSE-MsgGUID: ZwIW1nbpRpKcPMtojp+RJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,229,1716274800"; 
   d="scan'208";a="52008241"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jul 2024 19:13:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW51X-000lZ1-0k;
	Tue, 23 Jul 2024 02:13:07 +0000
Date: Tue, 23 Jul 2024 10:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 2/11] include/linux/hugetlb.h:949:40:
 error: passing argument 2 of 'pte_lockptr' from incompatible pointer type
Message-ID: <202407231005.pXIK3xHN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   d67d4b815e12f5db41251e2d60b4930f4d3c9e31
commit: 775b7f2d365f7d3b6144c9fa4767e9b41649a22e [2/11] fix
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240723/202407231005.pXIK3xHN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231005.pXIK3xHN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231005.pXIK3xHN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/hugetlbfs/inode.c:27:
   include/linux/hugetlb.h: In function 'huge_pte_lockptr':
>> include/linux/hugetlb.h:949:40: error: passing argument 2 of 'pte_lockptr' from incompatible pointer type [-Wincompatible-pointer-types]
     949 |                 return pte_lockptr(mm, pte);
         |                                        ^~~
         |                                        |
         |                                        pte_t *
   In file included from include/linux/highmem.h:10,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from fs/hugetlbfs/inode.c:19:
   include/linux/mm.h:2911:68: note: expected 'pmd_t *' but argument is of type 'pte_t *'
    2911 | static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
         |                                                             ~~~~~~~^~~


vim +/pte_lockptr +949 include/linux/hugetlb.h

   943	
   944	static inline spinlock_t *huge_pte_lockptr(struct hstate *h,
   945						   struct mm_struct *mm, pte_t *pte)
   946	{
   947		VM_BUG_ON(huge_page_size(h) == PAGE_SIZE);
   948		if (huge_page_size(h) < PMD_SIZE)
 > 949			return pte_lockptr(mm, pte);
   950		else if (huge_page_size(h) < PUD_SIZE)
   951			return pmd_lockptr(mm, (pmd_t *) pte);
   952		else if (huge_page_size(h) < P4D_SIZE)
   953			return pud_lockptr(mm, (pud_t *) pte);
   954		return &mm->page_table_lock;
   955	}
   956	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
