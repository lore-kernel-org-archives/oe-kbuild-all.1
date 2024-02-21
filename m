Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA03A3FE48
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 11:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708513243; cv=none; b=d3nkofIGCbgu/BbKMnvVkniE8fFKoOfg2UhySdlFky7TtQD9IC/Yfw2hOnwVm/sezmO2tO7yn6SvLl8Eur0EEY+0UUvinWau1QuZhYaBuUNrlr0hT4xqdnyCjAQUzmcMSdzNzuEwMjwB6qEwvMNdheAIniwLHaVOo0mhaKCbE78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708513243; c=relaxed/simple;
	bh=qA8JPCBqDgI4LlxkapJfE4Y8ISpdU5KRd7NC/zbmLME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=txx5pHXn5uQKYmq7fTQqwt341bKvU1MzbRDyQgqGCS+dmWgRriyUOzdN/uRjTaLJSdhZ2hgoYOSwNap0AHOarBM5DMFgIRVMUnR8LW673XDSsS9O8BfwGD1lFoNTi8RfGfXhd8lPpixnwaTgYNZCw/K2lJHXbkQLJojIT2B+l+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hGHijXhT; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hGHijXhT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708513242; x=1740049242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qA8JPCBqDgI4LlxkapJfE4Y8ISpdU5KRd7NC/zbmLME=;
  b=hGHijXhTtcyoXomhvrXuYIxhMakbJw8tzXumwcSxfX8y+Tmi3iTbJitq
   fe6uuEI91nWbm7/E09mE+fNAjGBu3Dhkk4B7E9qF3ZjqCYm1WRr8U5JNm
   dCKpK3dUtv/Zfn1q5w4/TFo7cYDa/QaoceH0mAhz66GrzGjB39crgxhys
   hdXcZM+5uOBr1Za0dKBIdImWWWVdhaf/TlMLRB2SkzKXSHe4wVXz4LgJE
   rvrFiDZIN3UbOT+oUAXuznQ9ClXTeoGnFHWugsSWlib/+w2tYXcoHSLMQ
   bMjOr6PQgi37vtZG9lV1Bg8yubJVsI01vkW+1ad8blUafJ8YMF62y8Svt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="2803858"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="2803858"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 03:00:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5397398"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 21 Feb 2024 03:00:41 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rckKm-0005GS-03;
	Wed, 21 Feb 2024 11:00:25 +0000
Date: Wed, 21 Feb 2024 19:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:b4/slab-cleanup-flags 3/4] fs/proc/inode.c:99:49: sparse:
 sparse: restricted slab_flags_t degrades to integer
Message-ID: <202402211803.Lmf1ANXx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git b4/slab-cleanup-flags
head:   95c527f4e5dd5245977e9625ec6e1197dc0e733b
commit: 9cd1bbdf6848577e2e1c1a3cab62dbe91b993439 [3/4] mm, slab: use an enum to define SLAB_ cache creation flags
config: sparc-randconfig-r111-20240221 (https://download.01.org/0day-ci/archive/20240221/202402211803.Lmf1ANXx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240221/202402211803.Lmf1ANXx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402211803.Lmf1ANXx-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/proc/inode.c:55:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/proc/inode.c:55:17: sparse:    struct ctl_table_header [noderef] __rcu *
   fs/proc/inode.c:55:17: sparse:    struct ctl_table_header *
>> fs/proc/inode.c:99:49: sparse: sparse: restricted slab_flags_t degrades to integer
>> fs/proc/inode.c:98:77: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted slab_flags_t [usertype] flags @@     got unsigned int @@
   fs/proc/inode.c:117:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_node *node @@     got struct hlist_node [noderef] __rcu * @@

vim +99 fs/proc/inode.c

^1da177e4c3f41 Linus Torvalds   2005-04-16   92  
195b8cf0689554 Alexey Dobriyan  2018-04-10   93  void __init proc_init_kmemcache(void)
^1da177e4c3f41 Linus Torvalds   2005-04-16   94  {
^1da177e4c3f41 Linus Torvalds   2005-04-16   95  	proc_inode_cachep = kmem_cache_create("proc_inode_cache",
^1da177e4c3f41 Linus Torvalds   2005-04-16   96  					     sizeof(struct proc_inode),
fffb60f93ce588 Paul Jackson     2006-03-24   97  					     0, (SLAB_RECLAIM_ACCOUNT|
5d097056c9a017 Vladimir Davydov 2016-01-14  @98  						SLAB_MEM_SPREAD|SLAB_ACCOUNT|
5d097056c9a017 Vladimir Davydov 2016-01-14  @99  						SLAB_PANIC),
20c2df83d25c6a Paul Mundt       2007-07-20  100  					     init_once);
195b8cf0689554 Alexey Dobriyan  2018-04-10  101  	pde_opener_cache =
195b8cf0689554 Alexey Dobriyan  2018-04-10  102  		kmem_cache_create("pde_opener", sizeof(struct pde_opener), 0,
2acddbe8168967 Alexey Dobriyan  2018-04-10  103  				  SLAB_ACCOUNT|SLAB_PANIC, NULL);
b4884f23331ae3 Alexey Dobriyan  2018-04-10  104  	proc_dir_entry_cache = kmem_cache_create_usercopy(
2d6e4e822ad817 Alexey Dobriyan  2018-08-21  105  		"proc_dir_entry", SIZEOF_PDE, 0, SLAB_PANIC,
2d6e4e822ad817 Alexey Dobriyan  2018-08-21  106  		offsetof(struct proc_dir_entry, inline_name),
2d6e4e822ad817 Alexey Dobriyan  2018-08-21  107  		SIZEOF_PDE_INLINE_NAME, NULL);
2d6e4e822ad817 Alexey Dobriyan  2018-08-21  108  	BUILD_BUG_ON(sizeof(struct proc_dir_entry) >= SIZEOF_PDE);
^1da177e4c3f41 Linus Torvalds   2005-04-16  109  }
^1da177e4c3f41 Linus Torvalds   2005-04-16  110  

:::::: The code at line 99 was first introduced by commit
:::::: 5d097056c9a017a3b720849efb5432f37acabbac kmemcg: account certain kmem allocations to memcg

:::::: TO: Vladimir Davydov <vdavydov@virtuozzo.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
