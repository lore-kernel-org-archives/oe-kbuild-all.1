Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0322DDCB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 05:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721454484; cv=none; b=QcDDF3R9HBCaCN7FzFf614obkMYvCWmsUVjyGWoyH/JDhNXdnRGuSRBTc/uiaPKFmkmSGutsMy8G+yIRBApv1Fun7nZkW10/a5BqIka/iFUKYV3MjRB/3gd1HyeLjq3CvwpxpiyTA4eTRJTKzIEUh8TurWJc4rEwUv/vkvgJ9Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721454484; c=relaxed/simple;
	bh=iDZdBVvDTiR42Y97+PcOMF6S+Vli33sT0P7Q5c/pqq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvOg2uiG3rgugn+swJNqTfIxLE0z2Qymuj8bx6YGlt6gAm4DnwzuW0WkD49w+DBVdh0kSEKUBEvQ1tAo9ssJ5HeBBF1FCM0bS36TOPJB2ExnEm2zpbKiAW6Mz/XP6E3jruSGLemYCRP0PTXyPWTxL7/SXZahVmVX4m0FZNAMRWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sd/oYciB; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sd/oYciB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721454483; x=1752990483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDZdBVvDTiR42Y97+PcOMF6S+Vli33sT0P7Q5c/pqq4=;
  b=Sd/oYciB5tVp6hOEatYT4EodSjn3yx/AKhgVSLdhqENx1YDW0J9yxXxG
   Q/o88Er3vR3O/QPu+R3l+Qoh82rvT7paeB54jLH6kKFJVcAUp3nfQ0zBs
   QYvc9fJ34t5aAosMe3ebjshB/Ijd4pT7DaQq2emfwmeaxczbjsFeyvaku
   bG+NR4AqCI+wEkBw5KgDnxf6hTfhaDbyLJzgwqBmuOGm9htiAbZ4PHQlJ
   hX+VlT55weLzdRLCWRJ6ZIqh6wckwCpIOv42NmFYX69ikbAXx8jKZoEq+
   /n9ZzeKfiaFmdZGEKPbTEjNsI353F1eeEL8KQOyoY3mYBZEmQEmJrJAZY
   A==;
X-CSE-ConnectionGUID: V022grz8T5Cls6FJJESexQ==
X-CSE-MsgGUID: 1msEy8+TR+yEGWklOTjrkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="22849561"
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="22849561"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2024 22:48:00 -0700
X-CSE-ConnectionGUID: 7RwD7/ubT6OQNPoCo/r8YA==
X-CSE-MsgGUID: xxNS8NpzSau3+dwHHZCISg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,222,1716274800"; 
   d="scan'208";a="51397198"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Jul 2024 22:47:58 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sV2wm-000itG-1D;
	Sat, 20 Jul 2024 05:47:56 +0000
Date: Sat, 20 Jul 2024 13:47:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 37/38] mm/memory.c:440:39: error: passing
 argument 3 of 'pmd_populate' from incompatible pointer type
Message-ID: <202407201336.XouzIbNo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   b17c1bbf65811ff797f57b7ddc4fdf4b86d86030
commit: 6b1d115d7b654549585d26008d60cb71b1cbefc8 [37/38] pass ptdesc to pmd_install
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407201336.XouzIbNo-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407201336.XouzIbNo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407201336.XouzIbNo-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memory.c: In function 'pmd_install':
>> mm/memory.c:440:39: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
   In file included from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/openrisc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   arch/openrisc/include/asm/pgalloc.h:32:46: note: expected 'struct page *' but argument is of type 'struct ptdesc *'
      32 |                                 struct page *pte)
         |                                 ~~~~~~~~~~~~~^~~


vim +/pmd_populate +440 mm/memory.c

   419	
   420	void pmd_install(struct mm_struct *mm, pmd_t *pmd, struct ptdesc **pte)
   421	{
   422		spinlock_t *ptl = pmd_lock(mm, pmd);
   423	
   424		if (likely(pmd_none(*pmd))) {	/* Has another populated it ? */
   425			mm_inc_nr_ptes(mm);
   426			/*
   427			 * Ensure all pte setup (eg. pte page lock and page clearing) are
   428			 * visible before the pte is made visible to other CPUs by being
   429			 * put into page tables.
   430			 *
   431			 * The other side of the story is the pointer chasing in the page
   432			 * table walking code (when walking the page table without locking;
   433			 * ie. most of the time). Fortunately, these data accesses consist
   434			 * of a chain of data-dependent loads, meaning most CPUs (alpha
   435			 * being the notable exception) will already guarantee loads are
   436			 * seen in-order. See the alpha page table accessors for the
   437			 * smp_rmb() barriers in page table walking code.
   438			 */
   439			smp_wmb(); /* Could be smp_wmb__xxx(before|after)_spin_lock */
 > 440			pmd_populate(mm, pmd, *pte);
   441			*pte = NULL;
   442		}
   443		spin_unlock(ptl);
   444	}
   445	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
