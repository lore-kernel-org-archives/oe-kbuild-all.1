Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630951DF725
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 03:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751599368; cv=none; b=POCyWo4HaA0+csdV7f6BrtPtcbjU5oht1uGYZxbqt3doCxEwaEmyct+4kPLZLggaekfkOBMXcMHwfuJc+MASEcg9fsdjDUcMx/xfiEuGf9UrUlw84HIhh1C7kgafItrndHOt7QSjh9gARr4kHz5ul/8Jdvu/O1DVidEvBZ0r7q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751599368; c=relaxed/simple;
	bh=WQU2Im2YIWpk2hdwxTDAv3ecJyYKnXJqLPL4PXhSOfg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YXbAn6L0329dJdOCNqRfFUoLoKNbv+zltQv5iKNU4sC+C5flmxBlx6rkvho64MpriK3JU5ZrlTFqgwYIAwlCjJjrMIJzlWKU44WVMHyqyMniGi4Th0jID6wotIIy5jPj2YD2yvp1jt8z1+34BE9HQBvlrNY4GvMtN6VEABBLiog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vo3Zrh9+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vo3Zrh9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751599366; x=1783135366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQU2Im2YIWpk2hdwxTDAv3ecJyYKnXJqLPL4PXhSOfg=;
  b=Vo3Zrh9+iaN4KVpy6e3OxghDjOY+gvN95Z/iK/N1fO7EUjetlL5F5eGb
   PerbsDPybanTOIOMPVR78AZCgBARxlnVQ50yQRIvp+NWw6mz6f/x/i9Ma
   GEemOQU2SSrFwEmUyN5DxpuDaNMGs1fE2M16KgVoLjzdQdmuYfyprXQYk
   Mff6DLbXqev5EnKBgKtbqbIzL35z4FPX1lniKIuJ+CxHQZP/cQVFz82VW
   c3Pk7BQ1CwYVChISxufkKXC5w7jHMZsjqnx9pwcPWVq70wFp7+rxrFCkH
   rSwrREAwGV1+u4mLpELFHmlmVoquBVt9LGisI92kPttwoon1QvB/tywhN
   A==;
X-CSE-ConnectionGUID: EKicL1vnSE+iMDdFXHXrsw==
X-CSE-MsgGUID: zGMZpq2/RVu1lZIoKEK6Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53805592"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="53805592"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 20:22:46 -0700
X-CSE-ConnectionGUID: iBfddeCCTXaBWg/0K5WPVQ==
X-CSE-MsgGUID: g8+B8yz9SQS4tdG9RwCgSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="154179845"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2025 20:22:45 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXX0c-0000Zl-2l;
	Fri, 04 Jul 2025 03:22:42 +0000
Date: Fri, 4 Jul 2025 05:22:29 +0200
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 110/113]
 fs/bcachefs/btree_cache.c:190:22: warning: unused variable 'bc'
Message-ID: <202507040501.Ap74GJO2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   869fe6267c3286b53f85effa38ab83a6200fd49b
commit: ace9e99ba674c601f71218613ecfec44976becfc [110/113] bcachefs: Tweak btree cache helpers for use by btree node scan
config: arc-randconfig-2002-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040501.Ap74GJO2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040501.Ap74GJO2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040501.Ap74GJO2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_cache.c: In function '__bch2_btree_node_mem_alloc':
>> fs/bcachefs/btree_cache.c:190:22: warning: unused variable 'bc' [-Wunused-variable]
     190 |  struct btree_cache *bc = &c->btree_cache;
         |                      ^~


vim +/bc +190 fs/bcachefs/btree_cache.c

4580baec7fbee2 Kent Overstreet 2020-07-25  187  
6adaac0b95dd39 Kent Overstreet 2021-04-20  188  struct btree *__bch2_btree_node_mem_alloc(struct bch_fs *c)
4580baec7fbee2 Kent Overstreet 2020-07-25  189  {
4580baec7fbee2 Kent Overstreet 2020-07-25 @190  	struct btree_cache *bc = &c->btree_cache;
a10195764901e0 Kent Overstreet 2022-10-22  191  	struct btree *b;
a10195764901e0 Kent Overstreet 2022-10-22  192  
a10195764901e0 Kent Overstreet 2022-10-22  193  	b = __btree_node_mem_alloc(c, GFP_KERNEL);
4580baec7fbee2 Kent Overstreet 2020-07-25  194  	if (!b)
4580baec7fbee2 Kent Overstreet 2020-07-25  195  		return NULL;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  196  
4580baec7fbee2 Kent Overstreet 2020-07-25  197  	if (btree_node_data_alloc(c, b, GFP_KERNEL)) {
4580baec7fbee2 Kent Overstreet 2020-07-25  198  		kfree(b);
4580baec7fbee2 Kent Overstreet 2020-07-25  199  		return NULL;
4580baec7fbee2 Kent Overstreet 2020-07-25  200  	}
4580baec7fbee2 Kent Overstreet 2020-07-25  201  
677bdb7346b6fd Alan Huang      2025-02-26  202  	bch2_btree_lock_init(&b->c, 0, GFP_KERNEL);
4580baec7fbee2 Kent Overstreet 2020-07-25  203  	return b;
1c6fdbd8f2465d Kent Overstreet 2017-03-16  204  }
1c6fdbd8f2465d Kent Overstreet 2017-03-16  205  

:::::: The code at line 190 was first introduced by commit
:::::: 4580baec7fbee2fdceb9b5b2b337ea3734a6d2b8 bcachefs: Remove some uses of PAGE_SIZE in the btree code

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
