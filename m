Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A32D27E
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Nov 2025 05:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762665405; cv=none; b=Yj6VwtETMAIQX1gXHXYWVOtPsKjMZM5RndRBj8A44nicCAL3e2rPgci/wlP5EQYYYA5UBojuwGHAS50hBZgBDIGthYwmobbyfdR+TSjtqxBiDqkY6l1VpNHD7GEYRpE1jzHo+5JIIpwhvDWL/J7R3k8NdYlIf4ksupyx1I9So/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762665405; c=relaxed/simple;
	bh=IckONm6LSkrH5AX2BHjkO07NKriJsobnaUdQcbZcceI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DQkTggBQjsl/wCBuT1BJUskDhziZMY84Xr3VXl1BNHdVY+5vbzzGp9SPP1w84WwR3POWQia5LSTBDZV4EmE1ksoJceycHOmL93MOfnhQC0kGBdf8MmzyFgR6qTFMyW0wq9yFj9TONccSW1jws0+yN6D39Xm4AHstWMRRJttw7Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXS+b0Lf; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXS+b0Lf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762665402; x=1794201402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IckONm6LSkrH5AX2BHjkO07NKriJsobnaUdQcbZcceI=;
  b=WXS+b0LfSIqxFgzAlz2AYB1pdQovI2UGM41jMvO/XWJCA2Hnvbf+sg0w
   OPr2OKsq8zQ+6gHyz1KSsQAhs5/y2JOovI/pGWk2tpGkqVAMLwbKXgc3X
   zdDA75PoTGjYvYAOpiFF2qjDrG5bqrkHz+DDzTghuT71REFe+0VlOuUHJ
   WfzOtdW+4GRIP3ZYGSOz1GxJnWSw/z5ZXObXEwmEXYIPJzZLhpOHysF4i
   53SOxMy1Z4EWiDrgZu2UdI5QuAdk5D+aUy8JcgSsMBhlRaHDXYvHIhdif
   dYPgHshP7KGNSKWeI9vWAPfcWx2ylJ5fCd8zHVt4A2toI7PywsnoTSn/T
   g==;
X-CSE-ConnectionGUID: tLpIUljyRyO6NLsGRyeQ0Q==
X-CSE-MsgGUID: wripnlpaTEWXI1W1+ckizw==
X-IronPort-AV: E=McAfee;i="6800,10657,11607"; a="64796624"
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="64796624"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2025 21:16:42 -0800
X-CSE-ConnectionGUID: kevNBprZSa+Sz5eK0tU6dg==
X-CSE-MsgGUID: OQjcBFlcQOaEOdpC4ZdOUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,291,1754982000"; 
   d="scan'208";a="211809175"
Received: from lkp-server01.sh.intel.com (HELO 6ef82f2de774) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2025 21:16:40 -0800
Received: from kbuild by 6ef82f2de774 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vHxn4-0001n5-0V;
	Sun, 09 Nov 2025 05:16:38 +0000
Date: Sun, 9 Nov 2025 13:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Fengyan Mu <mufengyan@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3124/3124] drivers/ub/ubase/ubase_pmem.c:239:4:
 error: a randomized struct can only be initialized with a designated
 initializer
Message-ID: <202511091319.N8VHQUDq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   66984acf4b16f28a2cc0d5d6186b4b6bbfd92e26
commit: da7d25293a382c506d3d46f06aff4074d881f24f [3124/3124] ub: ubase: support pre-alloc 2M pages.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251109/202511091319.N8VHQUDq-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251109/202511091319.N8VHQUDq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511091319.N8VHQUDq-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> drivers/ub/ubase/ubase_hw.c:430:5: warning: no previous prototype for function 'ubase_cmd_ctx_buf_alloc' [-Wmissing-prototypes]
     430 | int ubase_cmd_ctx_buf_alloc(struct ubase_dev *udev,
         |     ^
   drivers/ub/ubase/ubase_hw.c:430:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     430 | int ubase_cmd_ctx_buf_alloc(struct ubase_dev *udev,
         | ^
         | static 
   1 warning generated.
--
>> drivers/ub/ubase/ubase_pmem.c:239:4: error: a randomized struct can only be initialized with a designated initializer
     239 |         { ubase_init_comm_pmem_ctx, ubase_uninit_comm_pmem_ctx },
         |           ^
   drivers/ub/ubase/ubase_pmem.c:240:4: error: a randomized struct can only be initialized with a designated initializer
     240 |         { ubase_init_udma_pmem_ctx, ubase_uninit_udma_pmem_ctx },
         |           ^
   drivers/ub/ubase/ubase_pmem.c:241:4: error: a randomized struct can only be initialized with a designated initializer
     241 |         { ubase_alloc_comm_pmem, ubase_free_comm_pmem },
         |           ^
   drivers/ub/ubase/ubase_pmem.c:242:4: error: a randomized struct can only be initialized with a designated initializer
     242 |         { ubase_alloc_udma_pmem, ubase_free_udma_pmem },
         |           ^
   drivers/ub/ubase/ubase_pmem.c:243:4: error: a randomized struct can only be initialized with a designated initializer
     243 |         { ubase_map_comm_pmem, ubase_unmap_comm_pmem },
         |           ^
   drivers/ub/ubase/ubase_pmem.c:244:4: error: a randomized struct can only be initialized with a designated initializer
     244 |         { ubase_map_udma_pmem, ubase_unmap_udma_pmem },
         |           ^
>> drivers/ub/ubase/ubase_pmem.c:251:18: error: invalid application of 'sizeof' to an incomplete type 'const struct ubase_pmem_init_func[]'
     251 |         for (i = 0; i < ARRAY_SIZE(ubase_pmem_init_map); i++) {
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   drivers/ub/ubase/ubase_pmem.c:315:11: error: invalid application of 'sizeof' to an incomplete type 'const struct ubase_pmem_init_func[]'
     315 |         for (i = ARRAY_SIZE(ubase_pmem_init_map) - 1; i >= 0; i--)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:57:32: note: expanded from macro 'ARRAY_SIZE'
      57 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
   8 errors generated.


vim +239 drivers/ub/ubase/ubase_pmem.c

   234	
   235	static const struct ubase_pmem_init_func {
   236		int (*init)(struct ubase_dev *udev);
   237		void (*uninit)(struct ubase_dev *udev);
   238	} ubase_pmem_init_map[] = {
 > 239		{ ubase_init_comm_pmem_ctx, ubase_uninit_comm_pmem_ctx },
   240		{ ubase_init_udma_pmem_ctx, ubase_uninit_udma_pmem_ctx },
   241		{ ubase_alloc_comm_pmem, ubase_free_comm_pmem },
 > 242		{ ubase_alloc_udma_pmem, ubase_free_udma_pmem },
   243		{ ubase_map_comm_pmem, ubase_unmap_comm_pmem },
   244		{ ubase_map_udma_pmem, ubase_unmap_udma_pmem },
   245	};
   246	
   247	static int __ubase_prealloc_mem_init(struct ubase_dev *udev)
   248	{
   249		int i;
   250	
 > 251		for (i = 0; i < ARRAY_SIZE(ubase_pmem_init_map); i++) {
   252			if (ubase_pmem_init_map[i].init(udev))
   253				goto init_fail;
   254		}
   255	
   256		return 0;
   257	
   258	init_fail:
   259		for (i -= 1; i >= 0; i--)
   260			ubase_pmem_init_map[i].uninit(udev);
   261	
   262		return -ENOMEM;
   263	}
   264	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
