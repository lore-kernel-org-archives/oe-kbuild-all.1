Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5C13AD9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SCh/Lf8S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316503; x=1732852503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dGfoL4SJ+u+ff8uBJ1itc1sYBxpZDQAopFnlh6qDmEs=;
  b=SCh/Lf8SrMNUx3VxlPuLWtpMGoGjDS8e5WUulkct8GJG1AexF1hFtIfT
   v6iWIU8OnPTR6JdLxpx4nyD9ZTviX2xUnf2w6GzcX1PYuScxPu9uvXG8A
   vmy+WYO7y51XsPRqym0hQyn89Z5Vr/KWi+6LZ/yJWRUqLTGaV6znqvG7v
   zFBtnQ36zoeeBfIKkZULd3EWDPiCcquR8TsBeuPu0uBY6Iu6fsGd3YS9N
   VbiPLjaG32cx7petbMH0lGl3h4IGdD0SmLyg7aDYHY1NbVMtAdZ+/es1F
   wjvBKeMigOnq5IGb6yqrg3K1yiE8XVktQw3GGF+N8+6BX2P4oUZZMf11t
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459757282"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="459757282"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 19:55:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745488154"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745488154"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 19:55:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Y8g-0001JH-26;
	Thu, 30 Nov 2023 03:54:58 +0000
Date: Thu, 30 Nov 2023 11:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Domenico Cerasuolo <cerasuolodomenico@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: [akpm-mm:mm-unstable 179/192] mm/zswap.c:298:62: warning:
 pointer/integer type mismatch in conditional expression
Message-ID: <202311300811.B6BZeDjn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   cb1d236cb1038fa1bbae9913803f1c655b86d931
commit: 70dd375afcfe1839321ea8a65749404a99f0e773 [179/192] zswap: make shrinking memcg-aware
config: arc-randconfig-001-20231129 (https://download.01.org/0day-ci/archive/20231130/202311300811.B6BZeDjn-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300811.B6BZeDjn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300811.B6BZeDjn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/zswap.c: In function 'mem_cgroup_from_entry':
   mm/zswap.c:298:31: error: implicit declaration of function 'obj_cgroup_memcg'; did you mean 'obj_cgroup_put'? [-Werror=implicit-function-declaration]
     298 |         return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
         |                               ^~~~~~~~~~~~~~~~
         |                               obj_cgroup_put
>> mm/zswap.c:298:62: warning: pointer/integer type mismatch in conditional expression
     298 |         return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
         |                                                              ^
   mm/zswap.c: In function 'shrink_worker':
   mm/zswap.c:825:31: error: invalid use of undefined type 'struct mem_cgroup'
     825 |                 css_get(&memcg->css);
         |                               ^~
   cc1: some warnings being treated as errors


vim +298 mm/zswap.c

   294	
   295	/* should be called under RCU */
   296	static inline struct mem_cgroup *mem_cgroup_from_entry(struct zswap_entry *entry)
   297	{
 > 298		return entry->objcg ? obj_cgroup_memcg(entry->objcg) : NULL;
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
