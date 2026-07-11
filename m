Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52CB0299929
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 01:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783734825; cv=none; b=LiIKiFMAoD6IkXKfwmZ9HxuiUPOQcjrMa3wc2A20rBrDumBrMebpUyerPpWSI7Aq29Qwmt9CreR/hI7PTCveVSow35mvzC1P8EOYut85fIASxwU0LaG3bGbW/3ZYw3ebnyiSnRHY2546UfE6JSpy9xUrrw/RtZC1eOoFobomFtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783734825; c=relaxed/simple;
	bh=+65hcXn/MYqNrdskTuCAepOW5ChHHB52pvm5HfPIeUc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gDqhE+IREnFugCHsJRKzNN7RAg133z1H8l+oKIXnQHRbi5FLz5UheRthKrhK2gO9Yl6j0cf1C+cEgvuDLmu1nkcZfEPka5A2p/C92esUJOAcpK5TPROqtEPceqt3K4beRrr81Nf1pl2Tu0NmTyvZOVppN2JIQa9VdMgrhJkPMYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWTvNW4o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWTvNW4o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783734823; x=1815270823;
  h=date:from:to:cc:subject:message-id;
  bh=+65hcXn/MYqNrdskTuCAepOW5ChHHB52pvm5HfPIeUc=;
  b=RWTvNW4ozs7+OitgLQyNNOOfmSl99c8iBrc3aIODLZid08EeQA1UsMbh
   fXeimozGxkvtl2LwlQYrOngJHCtRJYxdfX/+rUqprR5Hjyj/CLzixDfub
   G3SLXTc/y43HeLb6c62FdS06zYu/svA2rurAsMrBVDYbRmjUHpACGxUXq
   FDb9WbmujOlUUsPUeHWDdH35qzks6EDzCDodx8CVI9tOCbyk+k/NRh3+q
   tyZhX0s1GKxhoAWEVKSzvDl5MaX1n/T6uhQiOXcr3LujZHSYlLPxIbv/L
   +SyB7zGFnmxR3iJC9Wq41ckUSrewU2jyxRnk+PthcGHuepownNcUYIAe3
   g==;
X-CSE-ConnectionGUID: QW6R/i1rTt+Flqj7oaq3FQ==
X-CSE-MsgGUID: rmKpf3wFSryghh7dGyEuyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="83412576"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="83412576"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 18:53:41 -0700
X-CSE-ConnectionGUID: pf80P7ZmQ86SYsgoikgclQ==
X-CSE-MsgGUID: XDSl+ucFQk+rEYLj3NHSCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258909306"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 10 Jul 2026 18:53:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiMuO-00000000JcQ-2TUo;
	Sat, 11 Jul 2026 01:53:36 +0000
Date: Sat, 11 Jul 2026 09:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 "Vlastimil Babka (SUSE)" <vbabka@kernel.org>,
 "Harry Yoo (Oracle)" <harry@kernel.org>
Subject: fs/namei.c:6321:9: sparse: sparse: cast from restricted
 gfp_t
Message-ID: <202607110912.nZTqfCrH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: feb662d9168b63e1d4c02671ec96005410c6f3ce slab: support for compiler-assisted type-based slab cache partitioning
date:   8 weeks ago
config: mips-randconfig-r111-20260711 (https://download.01.org/0day-ci/archive/20260711/202607110912.nZTqfCrH-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e6e6dabdc02153552a64fc74ff5c7532447eed)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110912.nZTqfCrH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: feb662d9168b ("slab: support for compiler-assisted type-based slab cache partitioning")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110912.nZTqfCrH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:159:33: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
   fs/namei.c:793:12: sparse: sparse: undefined identifier '__builtin_infer_alloc_token'
>> fs/namei.c:6321:9: sparse: sparse: cast from restricted gfp_t

vim +6321 fs/namei.c

d60874cd58fcb21 Miklos Szeredi          2016-10-04  6299  
^1da177e4c3f415 Linus Torvalds          2005-04-16  6300  /* get the link contents into pagecache */
b4c173dfbb6c785 Miklos Szeredi          2025-02-20  6301  static char *__page_get_link(struct dentry *dentry, struct inode *inode,
fceef393a538134 Al Viro                 2015-12-29  6302  			     struct delayed_call *callback)
^1da177e4c3f415 Linus Torvalds          2005-04-16  6303  {
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6304) 	struct folio *folio;
6b2553918d8b4e6 Al Viro                 2015-11-17  6305  	struct address_space *mapping = inode->i_mapping;
6b2553918d8b4e6 Al Viro                 2015-11-17  6306  
d3883d4f9344934 Al Viro                 2015-11-17  6307  	if (!dentry) {
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6308) 		folio = filemap_get_folio(mapping, 0);
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6309) 		if (IS_ERR(folio))
6b2553918d8b4e6 Al Viro                 2015-11-17  6310  			return ERR_PTR(-ECHILD);
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6311) 		if (!folio_test_uptodate(folio)) {
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6312) 			folio_put(folio);
d3883d4f9344934 Al Viro                 2015-11-17  6313  			return ERR_PTR(-ECHILD);
d3883d4f9344934 Al Viro                 2015-11-17  6314  		}
d3883d4f9344934 Al Viro                 2015-11-17  6315  	} else {
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6316) 		folio = read_mapping_folio(mapping, 0, NULL);
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6317) 		if (IS_ERR(folio))
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6318) 			return ERR_CAST(folio);
d3883d4f9344934 Al Viro                 2015-11-17  6319  	}
4ec373b74e96f92 Matthew Wilcox (Oracle  2025-05-14  6320) 	set_delayed_call(callback, page_put_link, folio);
21fc61c73c3903c Al Viro                 2015-11-17 @6321  	BUG_ON(mapping_gfp_mask(mapping) & __GFP_HIGHMEM);
5f152cc012f42e1 Matthew Wilcox (Oracle  2025-05-14  6322) 	return folio_address(folio);
b4c173dfbb6c785 Miklos Szeredi          2025-02-20  6323  }
b4c173dfbb6c785 Miklos Szeredi          2025-02-20  6324  

:::::: The code at line 6321 was first introduced by commit
:::::: 21fc61c73c3903c4c312d0802da01ec2b323d174 don't put symlink bodies in pagecache into highmem

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
