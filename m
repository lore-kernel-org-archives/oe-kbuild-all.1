Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E7C172BD5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 14:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747058511; cv=none; b=h5deC1koo1loDDVuG5rert9NrzBFxIQNi5Ru71UMfn2hYjEAKU9BYwlVssmk/cFjRtBkrIzq3VpDr0M/Q9TfS+L55AuozxeqrLfamRvPTNIv8M8xu5GRo1KmAEE5q6lwv+sMvq3ewqXlbOAyxrTA/J7Fi/lueAEeeF5rCD25xkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747058511; c=relaxed/simple;
	bh=MAEGt5FLo+b3mOBtNo50c5AF6R5/sskSMnH+F4n8XkY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gdcwAWKflIlzOmXmmDknZn0cxMoGTyC+4vHNnQZmr0GiSVCRSUL6TOEnWhImOrwWQNEUFEkORt+LxfTa6NKJUt32wDHkYUTyw/9M2mjiSMbOokZ1p4XaSpRkQ91Dr3PmJVpb0p1Y9piwCLhGQ9l8+oSccxmIdf0Hy6l7O7qQr3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SFyjjyvl; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SFyjjyvl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747058506; x=1778594506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAEGt5FLo+b3mOBtNo50c5AF6R5/sskSMnH+F4n8XkY=;
  b=SFyjjyvlmiH/LMPkUDf8Vnk1gYhy4wa7jNlGXyTVYyvlmCPvf/R6xR3G
   PXX/sOKi9np6na40Y2Bt3bjjOTDKnFMbEJYclrmUQVzrFY3OSWX61qZMY
   7Jn87Etg8CzN7SdYTH5b49gVPncRgrM7ZylKJBfpeJQwImJPo5MihEcLN
   FYTZ2RMamkqOEaRGY7PpMt8ZUJNJA/QVxO5ukYarfVJpUJtglwDwCgm+d
   /QvjPuFLBTjt+MWUCcgmH0rliI+uNSr+5ElB6IM8bdMh6BjfK6WvWaSES
   4qTD6EGJqMIz69IF2RkOYu4Ria1ZqUcfN/aec8c2E24mCmIeKo7krTplB
   w==;
X-CSE-ConnectionGUID: Yos7a4jqRhWXXGDAwSm/Nw==
X-CSE-MsgGUID: y5Tn+LD3SK6p94flERIAsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59518661"
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="59518661"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 07:01:46 -0700
X-CSE-ConnectionGUID: n2QEwLKrT9aLk5yhNK9sBw==
X-CSE-MsgGUID: JAtKqULQTvKlSa9qjWH5UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,282,1739865600"; 
   d="scan'208";a="137303528"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 12 May 2025 07:01:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uETiw-000ETp-0T;
	Mon, 12 May 2025 14:01:42 +0000
Date: Mon, 12 May 2025 22:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220]
 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:445:23: error:
 invalid application of 'sizeof' to an incomplete type 'const struct
 free_memory[]'
Message-ID: <202505122110.l7rKvRzx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e1106320058bf1d983657f80490249b4f919ebad
commit: 0bf0c942a09ba92e1d22e6960464b628dd4408fa [2220/2220] net/hinic3: Synchronize new NIC features and bug fixes
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250512/202505122110.l7rKvRzx-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505122110.l7rKvRzx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505122110.l7rKvRzx-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:312: warning: Function parameter or member 'attr6' not described in 'set_hwif_attr'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Function parameter or member 'hwdev' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Function parameter or member 'cfg_reg_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Function parameter or member 'intr_reg_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Function parameter or member 'mgmt_regs_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Function parameter or member 'db_base_phy' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Function parameter or member 'db_base' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Function parameter or member 'db_dwqe_len' not described in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Excess function parameter 'hwif' description in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:774: warning: Excess function parameter 'pdev' description in 'hinic3_init_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:840: warning: Function parameter or member 'hwdev' not described in 'hinic3_free_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:840: warning: Excess function parameter 'hwif' description in 'hinic3_free_hwif'
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:840: warning: Excess function parameter 'pdev' description in 'hinic3_free_hwif'
>> drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:862: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id from register,used by sriov hot migration process
   drivers/net/ethernet/huawei/hinic3/hw/hinic3_hwif.c:878: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * get function id, used by sriov hot migratition process.
--
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:415:3: error: a randomized struct can only be initialized with a designated initializer
     415 |         {check_use_vram, cqm_buf_vram_kalloc},
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:416:3: error: a randomized struct can only be initialized with a designated initializer
     416 |         {check_for_use_node_alloc, cqm_buf_use_node_alloc_page},
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:417:3: error: a randomized struct can only be initialized with a designated initializer
     417 |         {check_for_nouse_node_alloc, cqm_buf_unused_node_alloc_page}
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:421:3: error: a randomized struct can only be initialized with a designated initializer
     421 |         {check_use_vram, cqm_buf_vram_free},
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:422:3: error: a randomized struct can only be initialized with a designated initializer
     422 |         {check_use_non_vram, cqm_buf_free_page_common}
         |          ^
   drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:428:25: error: invalid application of 'sizeof' to an incomplete type 'const struct malloc_memory[]'
     428 |         u32 malloc_funcs_num = ARRAY_SIZE(g_malloc_funcs);
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
>> drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c:445:23: error: invalid application of 'sizeof' to an incomplete type 'const struct free_memory[]'
     445 |         u32 free_funcs_num = ARRAY_SIZE(g_free_funcs);
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   7 errors generated.


vim +445 drivers/net/ethernet/huawei/hinic3/cqm/cqm_bitmap_table.c

   419	
   420	static const struct free_memory g_free_funcs[] = {
   421		{check_use_vram, cqm_buf_vram_free},
 > 422		{check_use_non_vram, cqm_buf_free_page_common}
   423	};
   424	
   425	static s32 cqm_buf_alloc_page(struct tag_cqm_handle *cqm_handle, struct tag_cqm_buf *buf)
   426	{
   427		struct hinic3_hwdev *handle = cqm_handle->ex_handle;
   428		u32 malloc_funcs_num = ARRAY_SIZE(g_malloc_funcs);
   429		u32 i;
   430	
   431		for (i = 0; i < malloc_funcs_num; i++) {
   432			if (g_malloc_funcs[i].check_alloc_mode &&
   433			    g_malloc_funcs[i].malloc_func &&
   434			    g_malloc_funcs[i].check_alloc_mode(handle, buf))
   435				return g_malloc_funcs[i].malloc_func(handle, buf);
   436		}
   437	
   438		cqm_err(handle->dev_hdl, "Unknown alloc mode\n");
   439	
   440		return CQM_FAIL;
   441	}
   442	
   443	static void cqm_buf_free_page(struct tag_cqm_buf *buf)
   444	{
 > 445		u32 free_funcs_num = ARRAY_SIZE(g_free_funcs);
   446		u32 i;
   447	
   448		for (i = 0; i < free_funcs_num; i++) {
   449			if (g_free_funcs[i].check_alloc_mode &&
   450			    g_free_funcs[i].free_func &&
   451			    g_free_funcs[i].check_alloc_mode(NULL, buf))
   452				return g_free_funcs[i].free_func(buf);
   453		}
   454	}
   455	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
