Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB1615A86A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721829444; cv=none; b=Ch/THGw3SuJKt1JPx0Y5ex6Ib2Md8rqWDknsUVCByvO/HtD14pDHyRgDEYkiJZ7j7w1AmHhEMfIIJ/U4VXspB465eRS0+cGujspW+pQ7o9Ea0rPKeeO78ZPYVjGZLSTOCQXMfwssx5IM638J6MV/x0bDIZzx6BZoWIuGG3/rhAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721829444; c=relaxed/simple;
	bh=BDdOpHU9+vlqnfCpDak2YKKFuXGepLFdCAPaUDjrR3I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uU0MkUq6SyUgTFR6eXLeK/vg/4cQTsDbQL9/Rz0AebRldQfsOutDJgIrv637su7UoIjpl+bqOHuTxQSacwk4cEQzlPlew47zfHY0pQezWiULJEynMm8hLJ5NjAJMFRWscpzeJ5J92ZzHh8+hcPOAjfno9n8+lWkrSDmiYKYQyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nf7nVlnv; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nf7nVlnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721829442; x=1753365442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BDdOpHU9+vlqnfCpDak2YKKFuXGepLFdCAPaUDjrR3I=;
  b=nf7nVlnv0y4fSFJqbLsQ/ElGcYQnBQ7ZbDu37l7DjccLk5NiGxlzFekL
   dO9zydqPKaSczJOPmray42QStMKJgPHY23b/F8waAlpMnsJe3R593F6vd
   YMSfX9Y1wV5k9KElJeWR9Fh3n2wiPFVY7GaxLLdxOZmmu2oJO0YDw6Iqv
   nING4os2hPlSAtW5TpueckrssX5HuaK8Ezdl8OkNz7DyrpqYbOHWl9+5X
   caQHr+b5MVqe2tnEAG8P2a3UA6IIDd85V6suOGJoJZeafd3lTBzMmnevP
   eO6ocbjGZQ7A9iZcW8a+fqfhZuFMO3b2tn1JCXaUyZCp5q8ClrRSCYgyv
   Q==;
X-CSE-ConnectionGUID: Rgsy/sVySY2XJK1VGzrzLg==
X-CSE-MsgGUID: GlZ+0hHuTTqJWQbDiZZkKg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="30107928"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="30107928"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:57:22 -0700
X-CSE-ConnectionGUID: pjcEHMccT1GAA1vHmY9/Iw==
X-CSE-MsgGUID: lgxQ3BglQk2jvbu4IjVwzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="53367253"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Jul 2024 06:57:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWcUY-000n3W-1u;
	Wed, 24 Jul 2024 13:57:18 +0000
Date: Wed, 24 Jul 2024 21:56:43 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 32/41] arch/sparc/mm/srmmu.c:378:9: error:
 cannot convert to a pointer type
Message-ID: <202407242151.H9K6XLaF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: b5932eca5dda09f8073290ad7c923496c035ac40 [32/41] mm/pgtable: return ptdesc in pte_free
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242151.H9K6XLaF-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242151.H9K6XLaF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242151.H9K6XLaF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/mm/srmmu.c: In function 'pte_free':
>> arch/sparc/mm/srmmu.c:378:9: error: cannot convert to a pointer type
     378 |         srmmu_free_nocache((pgtable_t)*ptep, SRMMU_PTE_TABLE_SIZE);
         |         ^~~~~~~~~~~~~~~~~~
   arch/sparc/mm/srmmu.c: In function 'poke_hypersparc':
   arch/sparc/mm/srmmu.c:1082:32: warning: variable 'clear' set but not used [-Wunused-but-set-variable]
    1082 |         volatile unsigned long clear;
         |                                ^~~~~


vim +378 arch/sparc/mm/srmmu.c

   367	
   368	void pte_free(struct mm_struct *mm, struct ptdesc *ptep)
   369	{
   370		struct page *page;
   371	
   372		page = pfn_to_page(__nocache_pa((unsigned long)ptep) >> PAGE_SHIFT);
   373		spin_lock(&mm->page_table_lock);
   374		if (page_ref_dec_return(page) == 1)
   375			pagetable_pte_dtor(page_ptdesc(page));
   376		spin_unlock(&mm->page_table_lock);
   377	
 > 378		srmmu_free_nocache((pgtable_t)*ptep, SRMMU_PTE_TABLE_SIZE);
   379	}
   380	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
