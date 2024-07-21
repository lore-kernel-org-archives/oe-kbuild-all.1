Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2225A1DDD6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jul 2024 18:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721584974; cv=none; b=fOwDrHSRSxJZqzD3shuILEc2h1016fzDILIuSRNaUFJSSonmg1WgqAELfga3izbP5cbgvE7evHBle0puP5h/Cs4AXmVycadCnWvMWC6lhCwpa0qLLS1GLfS/lRxBiqYmE36IWtFObNK+WQaAHos+TIYVi8YxoKW0shs1AbxjKXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721584974; c=relaxed/simple;
	bh=ApquHcB7KboBHOp+WV0Jf3rt/Q1l7OjiZdoSTwHYV4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moug46IqEkj4K1AUmiW5iBVypdUiVUXkSCSTWgwMKmav4HUcHK4YgDgMzrK8dZ2Zlj9fS8lJgt0KQp154VxC+K5HbTAYOyBVHNxZiyWKDjDKEqhjzV/lByJXHElw2W4yBqZsTlHWRwz/LuXjU9MXG/j+lOtJ0eAsHG7emTTpu4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzCBXV3F; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzCBXV3F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721584972; x=1753120972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ApquHcB7KboBHOp+WV0Jf3rt/Q1l7OjiZdoSTwHYV4o=;
  b=DzCBXV3FzfE/DDP/oQVaV4ksS/7BNE/YuNwgRIqhAV8a34lsDLhpHQix
   WktVmoqSNO4JFK0wFCeHqAUJD8p35UXAlC8lxpeEVxrT+ismJW7hK5uto
   5o52oR4PcgTziNjxu4aLsbPii1LpRy1TszOHiMNFgwjJLJyQmmaqhiuvU
   ZsLzGJnDvJjW1Io0cVVuwKdnEdyx2SQkdCZ0dO1FiNdJJ427msHMXQqtg
   SLlZH0TB6/aT3yH5qYAkMwQwOX68Jq9Xc27UUPmvsIUDmDUsZs1RwMy2Q
   nTQXGWftbF+LVLE8liqwLryWrK4FRIxS8rwWki1fXqIdiWAsT8oaz33Eg
   Q==;
X-CSE-ConnectionGUID: yp5NvbTBTXS687m/uNUg3g==
X-CSE-MsgGUID: H5DBSsuiQ7CIM/gbc42eig==
X-IronPort-AV: E=McAfee;i="6700,10204,11140"; a="41670818"
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="41670818"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2024 11:02:51 -0700
X-CSE-ConnectionGUID: uPKBzCzMSfu6CJK+3GgaFw==
X-CSE-MsgGUID: mlx54N+BTpac+ymL9nfhKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,225,1716274800"; 
   d="scan'208";a="51906090"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Jul 2024 11:02:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sVatT-000kRb-36;
	Sun, 21 Jul 2024 18:02:47 +0000
Date: Mon, 22 Jul 2024 02:01:58 +0800
From: kernel test robot <lkp@intel.com>
To: "Alex Shi (Tencent)" <alexs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 32/43] arch/sparc/mm/srmmu.c:368:6: error:
 conflicting types for 'pte_free'; have 'void(struct mm_struct *, pte_t *)'
 {aka 'void(struct mm_struct *, long unsigned int *)'}
Message-ID: <202407220139.ArB5xhcb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   24c8778745b223097d5e3d590967626176306b1d
commit: 2bf6dbc419014b25dfb0825a585c7444ebaa74fe [32/43] mm/pgtable: return ptdesc in pte_free
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20240722/202407220139.ArB5xhcb-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240722/202407220139.ArB5xhcb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407220139.ArB5xhcb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/mm/srmmu.c:349:11: error: conflicting types for 'pte_alloc_one'; have 'pte_t *(struct mm_struct *)' {aka 'long unsigned int *(struct mm_struct *)'}
     349 | pgtable_t pte_alloc_one(struct mm_struct *mm)
         |           ^~~~~~~~~~~~~
   In file included from arch/sparc/include/asm/pgalloc.h:7,
                    from arch/sparc/mm/srmmu.c:30:
   arch/sparc/include/asm/pgalloc_32.h:58:16: note: previous declaration of 'pte_alloc_one' with type 'struct ptdesc *(struct mm_struct *)'
      58 | struct ptdesc *pte_alloc_one(struct mm_struct *mm);
         |                ^~~~~~~~~~~~~
>> arch/sparc/mm/srmmu.c:368:6: error: conflicting types for 'pte_free'; have 'void(struct mm_struct *, pte_t *)' {aka 'void(struct mm_struct *, long unsigned int *)'}
     368 | void pte_free(struct mm_struct *mm, pgtable_t ptep)
         |      ^~~~~~~~
   arch/sparc/include/asm/pgalloc_32.h:74:6: note: previous declaration of 'pte_free' with type 'void(struct mm_struct *, struct ptdesc *)'
      74 | void pte_free(struct mm_struct * mm, struct ptdesc *pte);
         |      ^~~~~~~~
   arch/sparc/mm/srmmu.c: In function 'poke_hypersparc':
   arch/sparc/mm/srmmu.c:1082:32: warning: variable 'clear' set but not used [-Wunused-but-set-variable]
    1082 |         volatile unsigned long clear;
         |                                ^~~~~


vim +368 arch/sparc/mm/srmmu.c

^1da177e4c3f41 Linus Torvalds        2005-04-16  367  
3f407976ac2953 Will Deacon           2020-04-14 @368  void pte_free(struct mm_struct *mm, pgtable_t ptep)
^1da177e4c3f41 Linus Torvalds        2005-04-16  369  {
3f407976ac2953 Will Deacon           2020-04-14  370  	struct page *page;
^1da177e4c3f41 Linus Torvalds        2005-04-16  371  
3f407976ac2953 Will Deacon           2020-04-14  372  	page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
1996d47a0db27a Will Deacon           2020-05-26  373  	spin_lock(&mm->page_table_lock);
1996d47a0db27a Will Deacon           2020-05-26  374  	if (page_ref_dec_return(page) == 1)
222107e1601f6d Vishal Moola (Oracle  2023-08-07  375) 		pagetable_pte_dtor(page_ptdesc(page));
1996d47a0db27a Will Deacon           2020-05-26  376  	spin_unlock(&mm->page_table_lock);
f71a2aacc63e31 Sam Ravnborg          2012-07-26  377  
3f407976ac2953 Will Deacon           2020-04-14  378  	srmmu_free_nocache(ptep, SRMMU_PTE_TABLE_SIZE);
^1da177e4c3f41 Linus Torvalds        2005-04-16  379  }
^1da177e4c3f41 Linus Torvalds        2005-04-16  380  

:::::: The code at line 368 was first introduced by commit
:::::: 3f407976ac2953116cb8880a7a18b63bcc81829d sparc32: mm: Change pgtable_t type to pte_t * instead of struct page *

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
