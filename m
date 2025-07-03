Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935FC29B21C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Jul 2025 21:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751577821; cv=none; b=ObFtas7apVbKouJ55dE38MHI91tntmF1Vuqtu1tQ/qU6hKo1R0/jMD+yyaoJrPHXV+ezYqXPe0OjhApJbVd7t8VwyqkSWUzOcN4EYDghXjMVKiRBJVWQQVAbGZ79RC6jyGxCXZYmqx1IA8MN2AiboYSr3hAf2u3uEzFKGI3Uwlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751577821; c=relaxed/simple;
	bh=SX/GfCT6W1V43KfWsTBKBgjMqmibSjLjLmTkdoZfNho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IsKQPCox6ar0NkmRHJFq1tJU3VoOAVvYjwh5ZeuVm3wAS9XJ+SfDURVaNT/+sPb4jRSt3CnrPinLU+dvczYPh36mC0TgxEeF6qEEe8Bv9RpjZGxbBOyc4LBuXrIXZU+gFUtKxh8wlEySUv92mBq/QkuhIIcfDdaGqXfRPDvdGVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/sChGd4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/sChGd4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751577820; x=1783113820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SX/GfCT6W1V43KfWsTBKBgjMqmibSjLjLmTkdoZfNho=;
  b=P/sChGd4i2ah1ypiUvZG/z/63E6fhNA5lk3q+HZkBAwqz7/yf0ePhMxl
   aveMjzZOR7eiPJ1SeI//IAt773FGwUS4ZdTMluiS34PU3Tyiju2nUQtMb
   0i5OUg8vZp+wsiNsVtxRscXzldxhTr8POPQxAjyoRbCwATpDAlT50GNPA
   YtLA44kXPvlzeucXfH/Qis6A0WMl+LTNpqHAiahAY7gOgwpj+MiNA0N6O
   ZeWFklAzEa1IWx4YEyEG2Ha2RuhjrxF8XrTCwusaYJrTq2HJL8HqsUx5/
   EXeHCu4cKGMK4IdKWaTk3mHjZTVwt4lXNSwe/k2lVrCgJqoCSgkNEoUcw
   g==;
X-CSE-ConnectionGUID: sPCwbdRlRBG5ZE75ezZvxQ==
X-CSE-MsgGUID: e75nqABiQNyJA5mux82XPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="54031243"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="54031243"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 14:23:38 -0700
X-CSE-ConnectionGUID: HCbLXYY0Tbm2VDzR6s8QIQ==
X-CSE-MsgGUID: qdQ6PuIjTXmtk0J8EEqolA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; 
   d="scan'208";a="185498765"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Jul 2025 14:23:37 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uXRP4-00030P-0d;
	Thu, 03 Jul 2025 21:23:34 +0000
Date: Fri, 4 Jul 2025 05:22:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shuai Wu <wushuai51@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2455/2455]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:10: error:
 positional initialization of field in 'struct' declared with
 'designated_init' attribute
Message-ID: <202507040507.d8CCXDl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   9b85bcf0e6357841885264f42859bec05c9073f4
commit: 4213ff7957de370c1cfe528c2bad1eb2e499038a [2455/2455] net/ethernet/huawei/hinic3: Add the CQM on which the RDMA depends
config: x86_64-buildonly-randconfig-006-20250704 (https://download.01.org/0day-ci/archive/20250704/202507040507.d8CCXDl2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250704/202507040507.d8CCXDl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507040507.d8CCXDl2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     371 |         {check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
         |          ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:10: note: (near initialization for 'g_malloc_funcs[0]')
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:10: error: invalid initializer
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:10: note: (near initialization for 'g_malloc_funcs[0].<anonymous>')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:36: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     371 |         {check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:36: note: (near initialization for 'g_malloc_funcs[0]')
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:36: error: initialization of 'bool (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)' {aka '_Bool (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)'} from incompatible pointer type 's32 (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)' {aka 'int (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)'} [-Werror=incompatible-pointer-types]
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:371:36: note: (near initialization for 'g_malloc_funcs[0].check_alloc_mode')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     372 |         {check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:10: note: (near initialization for 'g_malloc_funcs[1]')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:10: error: invalid initializer
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:10: note: (near initialization for 'g_malloc_funcs[1].<anonymous>')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:38: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     372 |         {check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:38: note: (near initialization for 'g_malloc_funcs[1]')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:38: error: initialization of 'bool (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)' {aka '_Bool (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)'} from incompatible pointer type 's32 (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)' {aka 'int (*)(struct hinic3_hwdev *, struct tag_cqm_buf *)'} [-Werror=incompatible-pointer-types]
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:372:38: note: (near initialization for 'g_malloc_funcs[1].check_alloc_mode')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:10: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     376 |         {check_use_non_vram, cqm_buf_free_page_common}
         |          ^~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:10: note: (near initialization for 'g_free_funcs[0]')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:10: error: invalid initializer
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:10: note: (near initialization for 'g_free_funcs[0].<anonymous>')
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:30: error: positional initialization of field in 'struct' declared with 'designated_init' attribute [-Werror=designated-init]
     376 |         {check_use_non_vram, cqm_buf_free_page_common}
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:376:30: note: (near initialization for 'g_free_funcs[0]')
   cc1: some warnings being treated as errors


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
