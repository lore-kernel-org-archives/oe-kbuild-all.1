Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E254A17C61
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 04:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730002038; cv=none; b=HMc7AKsT+J8xDpCNpMtUVPZKIG7GDnL4S1m1jbxM/s/Q4dYfg0fpgQDO5HCr3HDa31w1w6rmOMXCcvPbE23rV2KTjtJ2V29j8jKxG/Ghd7zXRuec9XhuBxLXuK8f7MVme4Ok7cJkG5G318PtE+aLvhi7q2+bgPwCdovk4GT/MdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730002038; c=relaxed/simple;
	bh=lHgY9oCfPiceAnltMz/Hpi3YG/2ad71gZ+zixTrc56E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bTM6E29C1B9DMeGTC0lcgNvg1TLJ1ZVhWGjDAORGepp4NDPq8Hcob95wkjMMWoQJpfIDPqEZZHpXt51+DN9AABl6PQDd47j9SjpGr2WRvnVmQhPmL8rU0MaBCXKa3BZEOwBCA1HbLv9d9re0mlvAJnMUi8jQ7AtL0LL7ljEyPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqPAiM8a; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqPAiM8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730002036; x=1761538036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lHgY9oCfPiceAnltMz/Hpi3YG/2ad71gZ+zixTrc56E=;
  b=gqPAiM8a2YUngPkfJ8aqcsjJEpKpe1a9Ck+qJ8CLWPtqOig62tUjyPdl
   WWpzXgbnB/JDKm+GKCjF++kaKWzsOxpHr2ZTGm3NfNjztLXwHlVACH2oR
   /4pdgVbW+q5eQFPZQw6jomTwVQ0Kqx2s9tvhvScri444DK4FaiesJy3/V
   g+mxAK/Hztmt3FeIXk5nVadnu0SogceCuDVdLaVWYCs0taVkrdKDHxed/
   Ay8Hgmi/FBt+AOCpwQs9AOQcSI3VYAjjAmQk7dH2NiQ5bl8lk2eRUU5NV
   FnuoxciPMa+RYnRQ7XJh1JE8KqrJTcytUNmvhpfyue+MbbooPsVfAjvqi
   w==;
X-CSE-ConnectionGUID: 4xG/f08ETXC3x0uDDtkZKw==
X-CSE-MsgGUID: MvMul7LBSO6xXj0HrUex5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29411247"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29411247"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:07:09 -0700
X-CSE-ConnectionGUID: Gud1m81dQaSiIDjGBZ8fIA==
X-CSE-MsgGUID: R4IHuGGyQqyZ5lgySZw0mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="112136189"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Oct 2024 21:07:07 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4uYT-000aLk-1v;
	Sun, 27 Oct 2024 04:07:05 +0000
Date: Sun, 27 Oct 2024 12:06:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7624/15331]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:3: error: a
 randomized struct can only be initialized with a designated initializer
Message-ID: <202410271207.p9vtCkgm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Shuai,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9d0af12b79bee784902822ddeec2e1a8cfc18524
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [7624/15331] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241027/202410271207.p9vtCkgm-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241027/202410271207.p9vtCkgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271207.p9vtCkgm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:6:
   In file included from include/linux/pci.h:1663:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:3: error: a randomized struct can only be initialized with a designated initializer
     371 |         {check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:3: error: a randomized struct can only be initialized with a designated initializer
     372 |         {check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:3: error: a randomized struct can only be initialized with a designated initializer
     376 |         {check_use_non_vram, cqm_buf_free_page_common}
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:382:25: error: invalid application of 'sizeof' to an incomplete type 'const struct malloc_memory[]'
     382 |         u32 malloc_funcs_num = ARRAY_SIZE(g_malloc_funcs);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:399:23: error: invalid application of 'sizeof' to an incomplete type 'const struct free_memory[]'
     399 |         u32 free_funcs_num = ARRAY_SIZE(g_free_funcs);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   5 warnings and 5 errors generated.


vim +371 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c

   369	
   370	static const struct malloc_memory g_malloc_funcs[] = {
 > 371		{check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
   372		{check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
   373	};
   374	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
