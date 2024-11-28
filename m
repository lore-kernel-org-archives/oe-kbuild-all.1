Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B723519342B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 11:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732792074; cv=none; b=S/Z+4+xIeNnzP45WTRj26XY6HznANMMkZAwFrOqMsJJEXj2LKsyaVe/FNInnknTNHpJ+l3m+5AXvYuJpgn0J7Un5EQ4BSU2fX3nFWaKv909Pd/dOmzrQddAyMBXWP8/yRdVfg38p+eNkwuHXZgKJccFhDJNTNOruh5n+u0PM0vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732792074; c=relaxed/simple;
	bh=7+Gg+v4htDFyXNA9mCsvSuuuedU2lOK9UKMBlYFqCEs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEfiTVHGxXGfY7+ZYBFz2yHEr6X5uS3Bj9dFqjFiGRlM9TUI2TOFrSdz8A79ABcPRjkRLHVH/is3+VCXUCpeatPMspxppvWeVS3flC11dTpi55gJmQEQX++bhTTNJ+lMk8hS/zF25pmbGD+rR8M81NaBZMwvnZOQHi3FXhtLTEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMkMEz08; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMkMEz08"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732792072; x=1764328072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7+Gg+v4htDFyXNA9mCsvSuuuedU2lOK9UKMBlYFqCEs=;
  b=iMkMEz08yl5u8ME+3A7IphcHr5RhTUcjz2mXGS8xor0ncw/T3Je4H/Ow
   FHjGi0z83jDZWqfkn/i2AIVl9Fx12w5WriyM53Jp9MMglth5CqCmhmkH8
   kQgjadDhvcuZyoGX4ViSeIR4zVlff/G68KZplHS4Y/0aoZPM6UfayhYvF
   HJ5PJN80nbiqlnGwq34c2ZheDW+IgxdjxS30KsaP2svcVoQzKZgRNnm93
   JcbmdHVnGJtqs0CSZA3j21cEAd2CGR2yusDaqBmW01vRCCHsFDGIgBSF+
   fpkeqGHdHRGgG21eb8ct7s+Ew1Xg+q8YKfdg4p8bjI5HpV4A3rIjsymVg
   A==;
X-CSE-ConnectionGUID: fKgQ/fE4Qo+h8O+0GCVi1A==
X-CSE-MsgGUID: G8ZaC2fmT0ugQuvqblhRJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33151251"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="33151251"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 03:07:51 -0800
X-CSE-ConnectionGUID: E2/KZJbJSBaKV2TtaB1xoA==
X-CSE-MsgGUID: 4k1xy9NLT8C6gTBEiyFVFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="96638902"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2024 03:07:50 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGcN9-0009Vb-1h;
	Thu, 28 Nov 2024 11:07:47 +0000
Date: Thu, 28 Nov 2024 19:07:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:3: error: a
 randomized struct can only be initialized with a designated initializer
Message-ID: <202411281914.t5QmcnnC-lkp@intel.com>
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
head:   7f63ebb23914c3b2e597112d96eba6edb440e907
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [1540/1540] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241128/202411281914.t5QmcnnC-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281914.t5QmcnnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281914.t5QmcnnC-lkp@intel.com/

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
