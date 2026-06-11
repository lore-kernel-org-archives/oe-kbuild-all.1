Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22BD360EC9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 19:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781207203; cv=none; b=aXz0cpL1WHMpLi4SS8+3VwjpbySvWW2+Hvt41x5qgSJ9W+8ZrQvOuv5WapV/1+EJ3c92pLBrouky+27B+CTJO7LpOve8/HghhJMG/R1hPm/3AjD0BXBNebs3fwFAWw3N7iElxOyKuwjPCcXjRX54NgCtqLNLuMWg3ctO/uJdBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781207203; c=relaxed/simple;
	bh=fzrmGxy+5W7B+kk1qMpDtzLPj7ZRZwope/BRsWJu6lY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=h3pojaqYCoc5iZGm7cg/+ZXnN6Md3947X2xfQM+iQ4taYNd6bPss4kD9h7MeQ9AcGNCYoEXfmYgB/tF7wVDSPPwv/qF6JvwDkKZM6EjrGUmWSCPtbCnJk84njD0t1+JDHnv5wElk19B5vUB/MXlGAe3BK4eLJSpUmqOrYEjKpGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ft1k9WNS; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ft1k9WNS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781207199; x=1812743199;
  h=date:from:to:cc:subject:message-id;
  bh=fzrmGxy+5W7B+kk1qMpDtzLPj7ZRZwope/BRsWJu6lY=;
  b=Ft1k9WNSsZ39AQVSogUN8LfUs1OQc6/94i7nnWggJOEIJAn14ZSJF4Fs
   TbP957sQZxrXlA/Vw4Nrd8c2z1UHxmbeSkWalsYSCH8hVeVBNfw95vnzD
   64GRISKTLzr0UFYf4aYoYhB0dISK7P5aBaL8vzF2F7I9MLcreKP/7Qvyh
   8nR+oLcXp43xBRh2VFSbYzICj+WBLBYo2Q6+fCFp8nU4sHzyRftwxI6aZ
   qBc24YfZivjsDZ78/BuDZMMZvwwJ/2ZhOjqbsdbBV/rQnS4LjmWXD8vJO
   ipGlEo4AlsN1S8FGEsnrFZqeiQu7NoZLa0zrDuHZuEVaLizPee4N9UKcU
   g==;
X-CSE-ConnectionGUID: BgDZckDJQWK8NfTBnXH8kQ==
X-CSE-MsgGUID: M4PcohMJREupYf9vm99XOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="104699801"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="104699801"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 12:46:39 -0700
X-CSE-ConnectionGUID: uf+SPd/oQQOl1rJx1vWH8g==
X-CSE-MsgGUID: AtFN/WziRXOlGvkpA6ExAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246667729"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jun 2026 12:46:36 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXlMH-00000000Nmc-3jNc;
	Thu, 11 Jun 2026 19:46:33 +0000
Date: Fri, 12 Jun 2026 03:45:50 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 "Harry Yoo (Oracle)" <harry@kernel.org>
Subject: [linux-next:master 4283/13002] fs/namei.c:142:16: sparse:
 sparse: cast truncates bits from constant value (123456789abcdef becomes
 89abcdef)
Message-ID: <202606120305.6M5vDIGJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   abe651837cb394f76d738a7a747322fca3bf17ba
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce [4283/13002] slab: support for compiler-assisted type-based slab cache partitioning
config: i386-randconfig-063-20260611 (https://download.01.org/0day-ci/archive/20260612/202606120305.6M5vDIGJ-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120305.6M5vDIGJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120305.6M5vDIGJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
>> fs/namei.c:142:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
>> fs/namei.c:142:16: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)
   fs/namei.c:147:25: sparse: sparse: cast truncates bits from constant value (123456789abcdef becomes 89abcdef)

vim +142 fs/namei.c

c3a3577cdb351e7 Al Viro       2025-11-19  139  
c3a3577cdb351e7 Al Viro       2025-11-19  140  static inline struct filename *alloc_filename(void)
c3a3577cdb351e7 Al Viro       2025-11-19  141  {
7ca83f8ebe86706 Mateusz Guzik 2025-12-01 @142  	return kmem_cache_alloc(names_cache, GFP_KERNEL);
c3a3577cdb351e7 Al Viro       2025-11-19  143  }
91a27b2a7567847 Jeff Layton   2012-10-10  144  
c3a3577cdb351e7 Al Viro       2025-11-19  145  static inline void free_filename(struct filename *p)
c3a3577cdb351e7 Al Viro       2025-11-19  146  {
7ca83f8ebe86706 Mateusz Guzik 2025-12-01  147  	kmem_cache_free(names_cache, p);
c3a3577cdb351e7 Al Viro       2025-11-19  148  }
c3a3577cdb351e7 Al Viro       2025-11-19  149  
41670a5900a8866 Al Viro       2025-11-01  150  static inline void initname(struct filename *name)
611851010c74046 Mateusz Guzik 2025-03-13  151  {
611851010c74046 Mateusz Guzik 2025-03-13  152  	name->aname = NULL;
741c97fecb6a416 Al Viro       2025-11-02  153  	name->refcnt = 1;
611851010c74046 Mateusz Guzik 2025-03-13  154  }
611851010c74046 Mateusz Guzik 2025-03-13  155  
8c888b31903cc2a Al Viro       2025-11-19  156  static int getname_long(struct filename *name, const char __user *filename)
8f2ac8481731fb5 Al Viro       2025-11-19  157  {
8f2ac8481731fb5 Al Viro       2025-11-19  158  	int len;
8c888b31903cc2a Al Viro       2025-11-19 @159  	char *p __free(kfree) = kmalloc(PATH_MAX, GFP_KERNEL);
8f2ac8481731fb5 Al Viro       2025-11-19  160  	if (unlikely(!p))
8c888b31903cc2a Al Viro       2025-11-19  161  		return -ENOMEM;
8f2ac8481731fb5 Al Viro       2025-11-19  162  
8c888b31903cc2a Al Viro       2025-11-19  163  	memcpy(p, &name->iname, EMBEDDED_NAME_MAX);
8c888b31903cc2a Al Viro       2025-11-19  164  	len = strncpy_from_user(p + EMBEDDED_NAME_MAX,
8f2ac8481731fb5 Al Viro       2025-11-19  165  				filename + EMBEDDED_NAME_MAX,
8f2ac8481731fb5 Al Viro       2025-11-19  166  				PATH_MAX - EMBEDDED_NAME_MAX);
8f2ac8481731fb5 Al Viro       2025-11-19  167  	if (unlikely(len < 0))
8c888b31903cc2a Al Viro       2025-11-19  168  		return len;
8f2ac8481731fb5 Al Viro       2025-11-19  169  	if (unlikely(len == PATH_MAX - EMBEDDED_NAME_MAX))
8c888b31903cc2a Al Viro       2025-11-19  170  		return -ENAMETOOLONG;
8c888b31903cc2a Al Viro       2025-11-19  171  	name->name = no_free_ptr(p);
8c888b31903cc2a Al Viro       2025-11-19  172  	return 0;
8f2ac8481731fb5 Al Viro       2025-11-19  173  }
8f2ac8481731fb5 Al Viro       2025-11-19  174  

:::::: The code at line 142 was first introduced by commit
:::::: 7ca83f8ebe86706c4164ac21871f4a5adb86a430 fs: hide names_cache behind runtime const machinery

:::::: TO: Mateusz Guzik <mjguzik@gmail.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
