Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A756E20C00B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Jul 2025 10:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751625644; cv=none; b=tW/AoVYlMZrm1fqELfNvkpKDd3TanM7wZxvbguTPbXMCpO5gex45ZxzJsm8m8QnptYq9DZCEdgqVJxRp4tcYueWgY4H2G8iIyVcKGzzjBOtrROy0Cx7aqlchUMAgLH9sV/tpucuO4JI05HicDPAK8FPsX4B+4lkItlfIuTdVChY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751625644; c=relaxed/simple;
	bh=ev3y70e0JpbfAZi4K25S30cmybtFxYRD+YPwz8QqzGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHzKOXkT8IutCIJbqjehmdvtwwtcNvT7LO3qU7FkSxYO+OPsWXiJJQYcFYVKCx2hVmivjwmlHXXTaEWfJKHg65F3EcZ3ggqEme6Ho3/3qIJCF0KecQoS1cmlkX6DKsVnYB5jQikujo1IzQa+bZivdRbt+YdncJn94/OqDP9wiHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WvooJXjh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WvooJXjh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751625643; x=1783161643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ev3y70e0JpbfAZi4K25S30cmybtFxYRD+YPwz8QqzGc=;
  b=WvooJXjhwJCnGnFaopzJe4jed9v1QaA+hv084ScaR42tNNo78ytxXvO2
   VPB0s0SqPan4/chJnafdxtzQ4As5fzCQsj0ajk7k9MLTVmMy73i8aG0/P
   Y7++5yfqPPpVNyZe7JgMuhZwcSe+xHm0+epEQjhHeq8Eb6sVV8Wq+n4Bk
   qots/F+udndFisvKVIIeYyTK3pUiaJzACssMQ9iCcWQL3LRCzXvgPbbEq
   JST3YnAKrMkIQ2qOgOC/RD7Qg79rcW3EfV1i/5m2LR65iGcZ2GVqPpw74
   u3uwwHmmO+xNdD1O/EVLCu5vetjYVxBpMozjnUbl4VuOF4q05jovmeDVc
   A==;
X-CSE-ConnectionGUID: F72yb0QgSTCfP5ubdAfORQ==
X-CSE-MsgGUID: 0H0g9mMBQCmVQz1u+3/ojw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="71532145"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="71532145"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 03:40:41 -0700
X-CSE-ConnectionGUID: /UgqEeRMQXiK1qECu2Rcyg==
X-CSE-MsgGUID: WyLq8KVNSQaziwBhl5PKjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154740630"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Jul 2025 03:40:40 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXdqP-0003bj-1t;
	Fri, 04 Jul 2025 10:40:37 +0000
Date: Fri, 4 Jul 2025 18:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 110/113]
 fs/bcachefs/btree_cache.c:190:29: warning: unused variable 'bc'
Message-ID: <202507041858.zRP5EHCm-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20250704 (https://download.01.org/0day-ci/archive/20250704/202507041858.zRP5EHCm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507041858.zRP5EHCm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507041858.zRP5EHCm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_cache.c: In function '__bch2_btree_node_mem_alloc':
>> fs/bcachefs/btree_cache.c:190:29: warning: unused variable 'bc' [-Wunused-variable]
     190 |         struct btree_cache *bc = &c->btree_cache;
         |                             ^~


vim +/bc +190 fs/bcachefs/btree_cache.c

4580baec7fbee2f Kent Overstreet 2020-07-25  187  
6adaac0b95dd39d Kent Overstreet 2021-04-20  188  struct btree *__bch2_btree_node_mem_alloc(struct bch_fs *c)
4580baec7fbee2f Kent Overstreet 2020-07-25  189  {
4580baec7fbee2f Kent Overstreet 2020-07-25 @190  	struct btree_cache *bc = &c->btree_cache;
a10195764901e0a Kent Overstreet 2022-10-22  191  	struct btree *b;
a10195764901e0a Kent Overstreet 2022-10-22  192  
a10195764901e0a Kent Overstreet 2022-10-22  193  	b = __btree_node_mem_alloc(c, GFP_KERNEL);
4580baec7fbee2f Kent Overstreet 2020-07-25  194  	if (!b)
4580baec7fbee2f Kent Overstreet 2020-07-25  195  		return NULL;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  196  
4580baec7fbee2f Kent Overstreet 2020-07-25  197  	if (btree_node_data_alloc(c, b, GFP_KERNEL)) {
4580baec7fbee2f Kent Overstreet 2020-07-25  198  		kfree(b);
4580baec7fbee2f Kent Overstreet 2020-07-25  199  		return NULL;
4580baec7fbee2f Kent Overstreet 2020-07-25  200  	}
4580baec7fbee2f Kent Overstreet 2020-07-25  201  
677bdb7346b6fd8 Alan Huang      2025-02-26  202  	bch2_btree_lock_init(&b->c, 0, GFP_KERNEL);
4580baec7fbee2f Kent Overstreet 2020-07-25  203  	return b;
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  204  }
1c6fdbd8f2465dd Kent Overstreet 2017-03-16  205  

:::::: The code at line 190 was first introduced by commit
:::::: 4580baec7fbee2fdceb9b5b2b337ea3734a6d2b8 bcachefs: Remove some uses of PAGE_SIZE in the btree code

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
