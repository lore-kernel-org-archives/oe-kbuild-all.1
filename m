Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE131F5FD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jan 2024 17:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706290031; cv=none; b=TJLta+cOJgxBa6U1WfVSoeHd/V5S3egl2C53k3Nli7c9DijeS3ilSkP53KO9Oaznc27+Z7c6liLE+VetydXNYZDQIXf/YkcrV3ujc1Pi1+0L/Wwz5wdLltnqB4rnt6A+jGbiJO2IJY4+GrjfMM5nXrFMlTJRRHs4kP1oXBGk4bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706290031; c=relaxed/simple;
	bh=oJ3R3jaBr7EDyPE85ivoH2xrnTmkPR8P1XgLULCL+XU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AIlIOnKKKUgJwx/VFyz8+Dedjx+l7sv7Hr96XAj7YLZFR67y9qWjPE0ty21Ffci+SH5YFXIwoj94+Pzs4ybqpDXgiiNbdfNUC1AkYSLJuaXZ1mgPngavGtCw8oFrWGZ3LReHhRdyMYXRAAREbxEOnRpoi9XdwCdY1VMu0Eh1I2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuiR8/zY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuiR8/zY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706290029; x=1737826029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJ3R3jaBr7EDyPE85ivoH2xrnTmkPR8P1XgLULCL+XU=;
  b=YuiR8/zYn/QqEeqh8/63Mu41vlI1wjDw6brQFr9aJRNOXqVHKzJkT301
   BW89jkO6yABa+rzhx0NRzZpBZNJE9ROQE7ILXyTjtCh2V26CR+NeXimvc
   cmYEox6xDYiu5mE3JiOzUr3tiJdqEZaX5kTlaRolaLKIxEf2gShKhePy4
   UNqbRVSbwxAxVithViKTvo+0oeLplkhwKW8NJ9oe7Oe+wT6HK+Gt2yqXa
   o3qkrIirXcE1/cKcpbfazbbbUzQ1VO4Rla2TDTGmMd4l00zp+V/ehW5nf
   /GUmWv7V5FQiowm0vYbFQ+KFiWofl4AHjoyCu5Wu7r4aWdANpUT7HTpYH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="21067723"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="21067723"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 09:27:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2813315"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 26 Jan 2024 09:27:05 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTPyo-0001F0-1Q;
	Fri, 26 Jan 2024 17:27:02 +0000
Date: Sat, 27 Jan 2024 01:26:22 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfile-diet 1/21] mm/workingset.c:617:6: warning: no
 previous prototype for function 'workingset_update_node'
Message-ID: <202401270112.nqcTnFJT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfile-diet
head:   f058c95e182b4fd3eb0a057c91b8578d6f73e8e0
commit: b8a4ddf828215462979cbd7e2a7d8165eac55d0e [1/21] mm: move mapping_set_update out of <linux/swap.h>
config: i386-buildonly-randconfig-002-20240126 (https://download.01.org/0day-ci/archive/20240127/202401270112.nqcTnFJT-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401270112.nqcTnFJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401270112.nqcTnFJT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/workingset.c:617:6: warning: no previous prototype for function 'workingset_update_node' [-Wmissing-prototypes]
     617 | void workingset_update_node(struct xa_node *node)
         |      ^
   mm/workingset.c:617:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     617 | void workingset_update_node(struct xa_node *node)
         | ^
         | static 
   1 warning generated.


vim +/workingset_update_node +617 mm/workingset.c

14b468791fa955 Johannes Weiner           2016-12-12  616  
a97e7904c08063 Matthew Wilcox            2017-11-24 @617  void workingset_update_node(struct xa_node *node)
14b468791fa955 Johannes Weiner           2016-12-12  618  {
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  619  	struct address_space *mapping;
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  620  
14b468791fa955 Johannes Weiner           2016-12-12  621  	/*
14b468791fa955 Johannes Weiner           2016-12-12  622  	 * Track non-empty nodes that contain only shadow entries;
14b468791fa955 Johannes Weiner           2016-12-12  623  	 * unlink those that contain pages or are being freed.
14b468791fa955 Johannes Weiner           2016-12-12  624  	 *
14b468791fa955 Johannes Weiner           2016-12-12  625  	 * Avoid acquiring the list_lru lock when the nodes are
14b468791fa955 Johannes Weiner           2016-12-12  626  	 * already where they should be. The list_empty() test is safe
b93b016313b3ba Matthew Wilcox            2018-04-10  627  	 * as node->private_list is protected by the i_pages lock.
14b468791fa955 Johannes Weiner           2016-12-12  628  	 */
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  629  	mapping = container_of(node->array, struct address_space, i_pages);
2386eef2141cc7 Sebastian Andrzej Siewior 2022-03-22  630  	lockdep_assert_held(&mapping->i_pages.xa_lock);
68d48e6a2df575 Johannes Weiner           2018-10-26  631  
01959dfe771c68 Matthew Wilcox            2017-11-09  632  	if (node->count && node->count == node->nr_values) {
68d48e6a2df575 Johannes Weiner           2018-10-26  633  		if (list_empty(&node->private_list)) {
0a97c01cd20bb9 Nhat Pham                 2023-11-30  634  			list_lru_add_obj(&shadow_nodes, &node->private_list);
da3ceeff923e3b Muchun Song               2020-12-14  635  			__inc_lruvec_kmem_state(node, WORKINGSET_NODES);
68d48e6a2df575 Johannes Weiner           2018-10-26  636  		}
14b468791fa955 Johannes Weiner           2016-12-12  637  	} else {
68d48e6a2df575 Johannes Weiner           2018-10-26  638  		if (!list_empty(&node->private_list)) {
0a97c01cd20bb9 Nhat Pham                 2023-11-30  639  			list_lru_del_obj(&shadow_nodes, &node->private_list);
da3ceeff923e3b Muchun Song               2020-12-14  640  			__dec_lruvec_kmem_state(node, WORKINGSET_NODES);
68d48e6a2df575 Johannes Weiner           2018-10-26  641  		}
14b468791fa955 Johannes Weiner           2016-12-12  642  	}
14b468791fa955 Johannes Weiner           2016-12-12  643  }
449dd6984d0e47 Johannes Weiner           2014-04-03  644  

:::::: The code at line 617 was first introduced by commit
:::::: a97e7904c0806309fd77103005bb7820c3f1c5e4 mm: Convert workingset to XArray

:::::: TO: Matthew Wilcox <willy@infradead.org>
:::::: CC: Matthew Wilcox <willy@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
