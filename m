Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25912FF63
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jul 2024 15:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721488590; cv=none; b=LYe1friDE4KGxLVtKj2KMXdY8mvYSZjGTUTy7C9kXF4k4PtqLnTUOmPBEf1AHa1bU1o3tvXAZ29/qdqeGV3adEQhOYBFRbe+RBipCftu3PwNpWDGsvlcS0iVFzKMDO2xnUrhw1GN9e0B0UeMrW5MJOakmL/TyEaFOfdYE0H1Pdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721488590; c=relaxed/simple;
	bh=5gR1pp7Xb4GKDQqMHpjY3lxNwQUAmL8F0NT/d/cB2dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f1inyu3tA54AzzVIP3pc5O8TZ5pmB2fBj29r+AOnQz9RsdYtpZDbzDyS6gwvuQp6jhy/lZIvQchlXEwumOG8npTnHm0xXtk7pXd8FQhA9EHWuXzvjuipK50d4/7/V7TlN3+gdLGMKS7ydiAXa0efVJMUrdVOGv1HNYSV0CouLHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=haFT1TZV; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="haFT1TZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721488589; x=1753024589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gR1pp7Xb4GKDQqMHpjY3lxNwQUAmL8F0NT/d/cB2dY=;
  b=haFT1TZVuMbZmH2ONSQoHUvPFAZSarJB71eSjxEX1SXdkNLR9M8rgOJa
   zBCL3n7zbB8rAi/+X7WuFT33FSii+DpDGoSwFUe9M2gONBqFK1UMuecPf
   8ywshFMMM7qT8wJiTIzaMs6ej56rkfzxafS64dGp5H1PaNZgAVKyIwFUY
   20WRpqabjEM67+LF7Ag9fFIqcCQxzq9B5HSGs8+cwQNQyKxXGig5Wpdd+
   SDnuU2rsqispLuEMAxp5UWenh5572JzJYPcRg+5OAa+Uf4jwg2a3uQBUL
   /gmYnqclbN71R7koDHZlr27Yvpy5a85C2Nho8k3vJB1qo/dBN7KOnmmdA
   Q==;
X-CSE-ConnectionGUID: +o+7UUqkTnqlrarRwdTR/A==
X-CSE-MsgGUID: C0t+sgkvThGUs1AjdDAv9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11139"; a="19232125"
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="19232125"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2024 08:16:28 -0700
X-CSE-ConnectionGUID: 7jR3PDpoRUimtM9AaICPWQ==
X-CSE-MsgGUID: XenaO6a2QLmLOqPx4UQDnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,224,1716274800"; 
   d="scan'208";a="88871730"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Jul 2024 08:16:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVBou-000jKc-1R;
	Sat, 20 Jul 2024 15:16:24 +0000
Date: Sat, 20 Jul 2024 23:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable2 40/42]
 arch/powerpc/include/asm/pgalloc.h:49:24: error: conflicting types for
 'pte_free_defer'; have 'void(struct mm_struct *, pte_t *)' {aka 'void(struct
 mm_struct *, long unsigned int *)'}
Message-ID: <202407202326.M1rfaQu9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable2
head:   17ce8ec8001d3efaa81c659d6ec565025c3f42b0
commit: 5977eb978554280c83da90a90ef2916b90b65a5f [40/42] mm/pgtable: pass ptdesc in pte_free_defer()
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20240720/202407202326.M1rfaQu9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240720/202407202326.M1rfaQu9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407202326.M1rfaQu9-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:49:
>> arch/powerpc/include/asm/pgalloc.h:49:24: error: conflicting types for 'pte_free_defer'; have 'void(struct mm_struct *, pte_t *)' {aka 'void(struct mm_struct *, long unsigned int *)'}
      49 | #define pte_free_defer pte_free_defer
         |                        ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/pgalloc.h:50:6: note: in expansion of macro 'pte_free_defer'
      50 | void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
         |      ^~~~~~~~~~~~~~
   In file included from arch/powerpc/include/asm/kup.h:43,
                    from arch/powerpc/include/asm/uaccess.h:8,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/dax.h:5,
                    from mm/filemap.c:15:
   include/linux/pgtable.h:119:6: note: previous declaration of 'pte_free_defer' with type 'void(struct mm_struct *, struct ptdesc *)'
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |      ^~~~~~~~~~~~~~
--
   In file included from mm/memory.c:86:
>> arch/powerpc/include/asm/pgalloc.h:49:24: error: conflicting types for 'pte_free_defer'; have 'void(struct mm_struct *, pte_t *)' {aka 'void(struct mm_struct *, long unsigned int *)'}
      49 | #define pte_free_defer pte_free_defer
         |                        ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/pgalloc.h:50:6: note: in expansion of macro 'pte_free_defer'
      50 | void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
         |      ^~~~~~~~~~~~~~
   In file included from include/linux/mm.h:30,
                    from arch/powerpc/include/asm/io.h:24,
                    from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from arch/powerpc/include/asm/hardirq.h:6,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:43:
   include/linux/pgtable.h:119:6: note: previous declaration of 'pte_free_defer' with type 'void(struct mm_struct *, struct ptdesc *)'
     119 | void pte_free_defer(struct mm_struct *mm, struct ptdesc *ptdesc);
         |      ^~~~~~~~~~~~~~
   mm/memory.c: In function 'pmd_install':
   mm/memory.c:440:39: error: passing argument 3 of 'pmd_populate' from incompatible pointer type [-Wincompatible-pointer-types]
     440 |                 pmd_populate(mm, pmd, *pte);
         |                                       ^~~~
         |                                       |
         |                                       struct ptdesc *
   In file included from arch/powerpc/include/asm/book3s/pgalloc.h:12,
                    from arch/powerpc/include/asm/pgalloc.h:72:
   arch/powerpc/include/asm/book3s/32/pgalloc.h:35:43: note: expected 'pgtable_t' {aka 'long unsigned int *'} but argument is of type 'struct ptdesc *'
      35 |                                 pgtable_t pte_page)
         |                                 ~~~~~~~~~~^~~~~~~~
   mm/memory.c: In function '__pte_alloc':
   mm/memory.c:454:30: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
     454 |                 pte_free(mm, ptdesc);
         |                              ^~~~~~
         |                              |
         |                              struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'long unsigned int *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~
   mm/memory.c: In function 'do_fault':
   mm/memory.c:5199:36: error: passing argument 2 of 'pte_free' from incompatible pointer type [-Wincompatible-pointer-types]
    5199 |                 pte_free(vm_mm, vmf->prealloc_pte);
         |                                 ~~~^~~~~~~~~~~~~~
         |                                    |
         |                                    struct ptdesc *
   arch/powerpc/include/asm/pgalloc.h:43:61: note: expected 'pgtable_t' {aka 'long unsigned int *'} but argument is of type 'struct ptdesc *'
      43 | static inline void pte_free(struct mm_struct *mm, pgtable_t ptepage)
         |                                                   ~~~~~~~~~~^~~~~~~


vim +49 arch/powerpc/include/asm/pgalloc.h

dc096864ba784c Christophe Leroy 2019-04-26  47  
32cc0b7c9d508e Hugh Dickins     2023-07-11  48  /* arch use pte_free_defer() implementation in arch/powerpc/mm/pgtable-frag.c */
32cc0b7c9d508e Hugh Dickins     2023-07-11 @49  #define pte_free_defer pte_free_defer
32cc0b7c9d508e Hugh Dickins     2023-07-11  50  void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable);
32cc0b7c9d508e Hugh Dickins     2023-07-11  51  

:::::: The code at line 49 was first introduced by commit
:::::: 32cc0b7c9d508efde8946a82eb3c4acfa8dfed15 powerpc: add pte_free_defer() for pgtables sharing page

:::::: TO: Hugh Dickins <hughd@google.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
