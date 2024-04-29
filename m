Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF2F12E74
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 07:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714374515; cv=none; b=nS57knx8S7O8K9qq4vtaNoTOGCZg367mCis/WM1HtIq0cv3G33OeVx5YvYr2PAOJM2qI4ev6W+m26Tyz5ahhs/85xeqMrP7vxevywUI2c1TEtGyrPd6PQk3JYJ2/7RZ7xRQijeIXALcd+bmQh7+gr7JCvSS6s3ixMvjJhiM22sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714374515; c=relaxed/simple;
	bh=iXoDOvyTg/0rYcLgEGfPTJ7gu2w3grkRmAQzijEHL1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AD6K+GMkwV3xH4KwyZ8KU1hULg0ICjsK8DmTX5FrzwldidtmwsS/yntHXkV6zLak9IGvD6mM7muyvEiVUY5dybYyT4F/v4cDjSG94zFl4L5u7rT+tTiX0ozhTriRV+25qEoRF/TVjoDjFgczYkW3Iisp6aIa+bBlJ7yZsG5j7Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RIYwfEwB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RIYwfEwB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714374513; x=1745910513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iXoDOvyTg/0rYcLgEGfPTJ7gu2w3grkRmAQzijEHL1g=;
  b=RIYwfEwBClP3FBWnx3LJg4wfh+T/IvC9wsmieJ8sqxnYCTdZ3+q7Vw9A
   Ez/KM1CfCHfZdbFfhXbrH94tYXPy1iS5Wc1wCVaRmMPCnvfFJH67tzS+3
   xnhReaip4xUSHkk2cnyfGYR+oOy99yfpFq558Gkr9EeQPj8RRkWGDhTi3
   ywqSrn3N8Wyy94EFtkoMMlMzhwFgfq6ghaISqM0hHf2Efc6WLDHN8lvB3
   TTC3sBHObviiiZf154a9xMkbl/ZRgdwFT7KkfRvzlPe3F4iSMC8ei0LGb
   BSwhsnqt1tEBC76G/ghMvIke8oAqH1t9MCVels8ZGjFqY407nc1ogeqYF
   w==;
X-CSE-ConnectionGUID: tTYr8OqNS96Qu45vCmQcdA==
X-CSE-MsgGUID: 4D7j5ANrQXe7q2CO8cYEEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="35416331"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="35416331"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 00:08:32 -0700
X-CSE-ConnectionGUID: 9s+DApO3QQOujuOyOVEwlA==
X-CSE-MsgGUID: Gs7AzsatQxqGMnapsC3xjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="30824790"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 29 Apr 2024 00:08:31 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1L7l-00071a-0T;
	Mon, 29 Apr 2024 07:08:29 +0000
Date: Mon, 29 Apr 2024 15:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7604/7624]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:3: error: a
 randomized struct can only be initialized with a designated initializer
Message-ID: <202404291452.urCRP2Hn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cc726712137756f27af36c01e3fd7f9f260f639c
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [7604/7624] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240429/202404291452.urCRP2Hn-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240429/202404291452.urCRP2Hn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404291452.urCRP2Hn-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:3: error: a randomized struct can only be initialized with a designated initializer
     371 |         {check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:3: error: a randomized struct can only be initialized with a designated initializer
     372 |         {check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:3: error: a randomized struct can only be initialized with a designated initializer
     376 |         {check_use_non_vram, cqm_buf_free_page_common}
         |          ^
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:382:25: error: invalid application of 'sizeof' to an incomplete type 'const struct malloc_memory[]'
     382 |         u32 malloc_funcs_num = ARRAY_SIZE(g_malloc_funcs);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:399:23: error: invalid application of 'sizeof' to an incomplete type 'const struct free_memory[]'
     399 |         u32 free_funcs_num = ARRAY_SIZE(g_free_funcs);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   5 errors generated.


vim +371 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c

   369	
   370	static const struct malloc_memory g_malloc_funcs[] = {
 > 371		{check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
   372		{check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
   373	};
   374	
   375	static const struct free_memory g_free_funcs[] = {
   376		{check_use_non_vram, cqm_buf_free_page_common}
   377	};
   378	
   379	static s32 cqm_buf_alloc_page(struct tag_cqm_handle *cqm_handle, struct tag_cqm_buf *buf)
   380	{
   381		struct hinic3_hwdev *handle = cqm_handle->ex_handle;
 > 382		u32 malloc_funcs_num = ARRAY_SIZE(g_malloc_funcs);
   383		u32 i;
   384	
   385		for (i = 0; i < malloc_funcs_num; i++) {
   386			if (g_malloc_funcs[i].check_alloc_mode &&
   387			    g_malloc_funcs[i].malloc_func &&
   388			    g_malloc_funcs[i].check_alloc_mode(handle, buf))
   389				return g_malloc_funcs[i].malloc_func(handle, buf);
   390		}
   391	
   392		cqm_err(handle->dev_hdl, "Unknown alloc mode\n");
   393	
   394		return CQM_FAIL;
   395	}
   396	
   397	static void cqm_buf_free_page(struct tag_cqm_buf *buf)
   398	{
 > 399		u32 free_funcs_num = ARRAY_SIZE(g_free_funcs);
   400		u32 i;
   401	
   402		for (i = 0; i < free_funcs_num; i++) {
   403			if (g_free_funcs[i].check_alloc_mode &&
   404			    g_free_funcs[i].free_func &&
   405			    g_free_funcs[i].check_alloc_mode(NULL, buf))
   406				return g_free_funcs[i].free_func(buf);
   407		}
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
