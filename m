Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0EA3FCC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 00:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765584046; cv=none; b=i64W5k0Ag2YZ8YyIkGdBPXuz9haC0IqvUE0LCcaWf48VADi0V6M29EGzPXJBYqM1efAl6lr3Qlu/8AppAQ75IqeWvn1fmhb7fJ0l55+efoomueFykKBuQnw1rN9Io85jBMgDCRnkQB3K6jPVb4EVkKUaULYQMo+1zUIb/IsdMr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765584046; c=relaxed/simple;
	bh=cd2YXNFg8g0FysuxeO6EN3wjzOkCl6ulscacoElJpWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9V5Uli35iTBnF7U40vsFDuBozkD5sWNVH+mvLCXzPqKkarNGASftPX1f+wpCeKrigTmacF8CtoLdongSeplyxlcifSuCiI2JJf46CKI+GVRnOh0ObGn8Hi/+NYD8veciWTMzCuIQoisQGwUALiMAA2eH03n83q7GduJEbjLJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aA9Sx4m6; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aA9Sx4m6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765584044; x=1797120044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cd2YXNFg8g0FysuxeO6EN3wjzOkCl6ulscacoElJpWc=;
  b=aA9Sx4m6j4DJq7dQOeXvpR6H6KtcL+ADnvJecidtS5+uxuYU4HEGa9LL
   4pqYyUaU6JOk0nm5T2gewCosR3U6fc2Mb0Y+GbIBSrN/uN7vusMeLJnfv
   ycGjxLAZIukNJBCkoBBbuJqHdn/QASVIZ8WWuwR0r31OOIRhBDjEpLu7S
   67RmiNJdVY8hohEE7FrJVukBFC3FgLXlFqwDzBzkxcIqeaxOUSQciQPqU
   M7BtAHgjTJhv8kFPJT9dHgx7NCkHfjNyTf5i7cr8s+8zckCZgpCKJrZep
   lHMg4bMz/f6h8ZR9mZBg5Mxv62sgfkyFgfvsNCE5RdVw2wZKrnyJTrHzw
   Q==;
X-CSE-ConnectionGUID: /4iPHlepQUWt6z3yI/acag==
X-CSE-MsgGUID: sx5UdjOzSCCxDn8edevqUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67630097"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67630097"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 16:00:43 -0800
X-CSE-ConnectionGUID: hfeldDdWTjeNRQl5mBolDQ==
X-CSE-MsgGUID: 8VhlOMuVRw6Pd+r2vLO4Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201392242"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Dec 2025 16:00:42 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUD3u-000000006nt-3URl;
	Sat, 13 Dec 2025 00:00:38 +0000
Date: Sat, 13 Dec 2025 08:00:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] drivers/base/node.c:77:
 warning: Function parameter or member 'hmem_attrs' not described in
 'node_access_nodes'
Message-ID: <202512130735.vWIWdRUh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 82d6c2a64cfad2a43bc6f777df1a42f61865182b [1941/1941] Intel: node: Add heterogenous memory access attributes
config: x86_64-randconfig-103-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130735.vWIWdRUh-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130735.vWIWdRUh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130735.vWIWdRUh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   1 warning generated.
>> drivers/base/node.c:77: warning: Function parameter or member 'hmem_attrs' not described in 'node_access_nodes'
   drivers/base/node.c:539: warning: Function parameter or member 'mem_nid' not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:539: warning: Function parameter or member 'cpu_nid' not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:539: warning: Excess function parameter 'mem_node' description in 'register_memory_node_under_compute_node'
   drivers/base/node.c:539: warning: Excess function parameter 'cpu_node' description in 'register_memory_node_under_compute_node'


vim +77 drivers/base/node.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  62  
9e8e325cfd089c Keith Busch    2021-09-11  63  /**
9e8e325cfd089c Keith Busch    2021-09-11  64   * struct node_access_nodes - Access class device to hold user visible
9e8e325cfd089c Keith Busch    2021-09-11  65   * 			      relationships to other nodes.
9e8e325cfd089c Keith Busch    2021-09-11  66   * @dev:	Device for this memory access class
9e8e325cfd089c Keith Busch    2021-09-11  67   * @list_node:	List element in the node's access list
9e8e325cfd089c Keith Busch    2021-09-11  68   * @access:	The access class rank
9e8e325cfd089c Keith Busch    2021-09-11  69   */
9e8e325cfd089c Keith Busch    2021-09-11  70  struct node_access_nodes {
9e8e325cfd089c Keith Busch    2021-09-11  71  	struct device		dev;
9e8e325cfd089c Keith Busch    2021-09-11  72  	struct list_head	list_node;
9e8e325cfd089c Keith Busch    2021-09-11  73  	unsigned		access;
82d6c2a64cfad2 Keith Busch    2021-09-11  74  #ifdef CONFIG_HMEM_REPORTING
82d6c2a64cfad2 Keith Busch    2021-09-11  75  	struct node_hmem_attrs	hmem_attrs;
82d6c2a64cfad2 Keith Busch    2021-09-11  76  #endif
9e8e325cfd089c Keith Busch    2021-09-11 @77  };
9e8e325cfd089c Keith Busch    2021-09-11  78  #define to_access_nodes(dev) container_of(dev, struct node_access_nodes, dev)
9e8e325cfd089c Keith Busch    2021-09-11  79  

:::::: The code at line 77 was first introduced by commit
:::::: 9e8e325cfd089c66c9a2f570f99021a62bf0ae09 node: Link memory nodes to their compute nodes

:::::: TO: Keith Busch <keith.busch@intel.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
