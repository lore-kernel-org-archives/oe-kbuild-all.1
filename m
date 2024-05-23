Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1C781304BE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 May 2024 02:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716431452; cv=none; b=QNHKJzrF0Olgr6K5f3Uai73qEEQ0zbyYRkE3NYCkHLx1NXrWZjnAs+NFWwNdda/i39wIb8dRNv9KHkgREl8dWTDKYVLaMoRzT0zR4leHB3XvQnxGWU2jGxT4aspmr25NWsRpp2cNeMqqJHlH4DCS3Q0V1QUQVtUs1yyjzQnm0EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716431452; c=relaxed/simple;
	bh=9tj4I2KNjFYNqsndxeQCZrdmqvqSauJZvpJBiXMCxZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fQZPpZNi5zXqAR1vZ7+vkmzm2dG4gbL663xVW7x5GMZHqFV9JECWkj+qWTj91EljZI+XOPRB4NbfWPgco5Ez84K+qIXLFL1Ipp11nFXV04Jwdn6PoBAZqEiuU+vlGmJx+PbLtutJTeSUegv3Ig3o26Ld3GmC+qnAeo8dYbUmhJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MVfO5RYe; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MVfO5RYe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716431451; x=1747967451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9tj4I2KNjFYNqsndxeQCZrdmqvqSauJZvpJBiXMCxZM=;
  b=MVfO5RYevlkh5RpcQjNvZbP38tp3OZVU0ne3m9RgtiLSNAChEDni3Cgu
   5CfPLtBGG7ok+afQnusOEJQ9AqHUh2z43ZuFhSClrwC6YRVp5edQe67xL
   s8QkRdaT630SVzQvVHk3vBhxg21obVWz+2QHjVKne+0UIjmIv67X1rud6
   Ot7C6WeA6gdlSxmqOFN8JTOO1J9YKqtpaNfwK25hkR1DE9qIiK7LUvnGG
   RlXy+Dfk++mwcQXEBiWrJtZ1QVwo8NCBrnm/1cuDRP/sth7VrkkhObW9S
   bcvHsGkI0UdyF8g1TC1GD+Yud41Bnlw33d0odUMK5vytWFzeu4Ts3cpVu
   Q==;
X-CSE-ConnectionGUID: vF8Mwt2pSly2GarPsAvtoQ==
X-CSE-MsgGUID: 9VasVhLuRt6fk4gIpEZS3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="12596585"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="12596585"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 19:30:42 -0700
X-CSE-ConnectionGUID: jhUYDOWURFSj9IPj8uF4dw==
X-CSE-MsgGUID: KKioqC0KRmSO7eDKrbJuHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; 
   d="scan'208";a="38291135"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 May 2024 19:30:41 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9yE1-0002Lr-2Y;
	Thu, 23 May 2024 02:30:37 +0000
Date: Thu, 23 May 2024 10:30:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 101/106]
 drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp_isp71.c:13:31:
 sparse: sparse: symbol 'isp71_reserve_mblock' was not declared. Should it be
 static?
Message-ID: <202405231024.VZ6Ou6G9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   e0a8432e750018bfe19402216e10553e4261aab7
commit: 35d65c4423bf525d557b423789c0c3f3c41fa92c [101/106] CHROMIUM: media: platform: mediatek: isp: add IMGSYS driver
config: arm64-randconfig-r111-20240523 (https://download.01.org/0day-ci/archive/20240523/202405231024.VZ6Ou6G9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240523/202405231024.VZ6Ou6G9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405231024.VZ6Ou6G9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp_isp71.c:13:31: sparse: sparse: symbol 'isp71_reserve_mblock' was not declared. Should it be static?
--
>> drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp.c:331:72: sparse: sparse: cast truncates bits from constant value (3ffffffff becomes ffffffff)

vim +/isp71_reserve_mblock +13 drivers/media/platform/mediatek/isp/isp_7x/mtk-hcp/mtk-hcp_isp71.c

    12	
  > 13	struct mtk_hcp_reserve_mblock isp71_reserve_mblock[] = {
    14		{
    15			/*share buffer for frame setting, to be sw usage*/
    16			.name = "IMG_MEM_FOR_HW_ID",
    17			.num = IMG_MEM_FOR_HW_ID,
    18			.start_phys = 0x0,
    19			.start_virt = NULL,
    20			.start_dma  = 0x0,
    21			.size = 0x400000,   /*need more than 4MB*/
    22			.is_dma_buf = true,
    23			.mmap_cnt = 0,
    24			.mem_priv = NULL,
    25			.d_buf = NULL,
    26			.fd = -1,
    27			.attach = NULL,
    28			.sgt = NULL
    29		},
    30		{
    31			.name = "WPE_MEM_C_ID",
    32			.num = WPE_MEM_C_ID,
    33			.start_phys = 0x0,
    34			.start_virt = NULL,
    35			.start_dma  = 0x0,
    36			.size = 0xE1000,   /*900KB*/
    37			.is_dma_buf = true,
    38			.mmap_cnt = 0,
    39			.mem_priv = NULL,
    40			.d_buf = NULL,
    41			.fd = -1,
    42			.attach = NULL,
    43			.sgt = NULL
    44		},
    45		{
    46			.name = "WPE_MEM_T_ID",
    47			.num = WPE_MEM_T_ID,
    48			.start_phys = 0x0,
    49			.start_virt = NULL,
    50			.start_dma  = 0x0,
    51			.size = 0x196000,   /*1MB + 600KB*/
    52			.is_dma_buf = true,
    53			.mmap_cnt = 0,
    54			.mem_priv = NULL,
    55			.d_buf = NULL,
    56			.fd = -1,
    57			.attach = NULL,
    58			.sgt = NULL
    59		},
    60		{
    61			.name = "TRAW_MEM_C_ID",
    62			.num = TRAW_MEM_C_ID,
    63			.start_phys = 0x0,
    64			.start_virt = NULL,
    65			.start_dma  = 0x0,
    66			.size = 0x4C8000,   /*4MB + 800KB*/
    67			.is_dma_buf = true,
    68			.mmap_cnt = 0,
    69			.mem_priv = NULL,
    70			.d_buf = NULL,
    71			.fd = -1,
    72			.attach = NULL,
    73			.sgt = NULL
    74		},
    75		{
    76			.name = "TRAW_MEM_T_ID",
    77			.num = TRAW_MEM_T_ID,
    78			.start_phys = 0x0,
    79			.start_virt = NULL,
    80			.start_dma  = 0x0,
    81			.size = 0x1AC8000,   /*26MB + 800KB*/
    82			.is_dma_buf = true,
    83			.mmap_cnt = 0,
    84			.mem_priv = NULL,
    85			.d_buf = NULL,
    86			.fd = -1,
    87			.attach = NULL,
    88			.sgt = NULL
    89		},
    90		{
    91			.name = "DIP_MEM_C_ID",
    92			.num = DIP_MEM_C_ID,
    93			.start_phys = 0x0,
    94			.start_virt = NULL,
    95			.start_dma  = 0x0,
    96			.size = 0x5C8000,   /*5MB + 800KB*/
    97			.is_dma_buf = true,
    98			.mmap_cnt = 0,
    99			.mem_priv = NULL,
   100			.d_buf = NULL,
   101			.fd = -1,
   102			.attach = NULL,
   103			.sgt = NULL
   104		},
   105		{
   106			.name = "DIP_MEM_T_ID",
   107			.num = DIP_MEM_T_ID,
   108			.start_phys = 0x0,
   109			.start_virt = NULL,
   110			.start_dma  = 0x0,
   111			.size = 0x1FAF000,   /*31MB + 700KB*/
   112			.is_dma_buf = true,
   113			.mmap_cnt = 0,
   114			.mem_priv = NULL,
   115			.d_buf = NULL,
   116			.fd = -1,
   117			.attach = NULL,
   118			.sgt = NULL
   119		},
   120		{
   121			.name = "PQDIP_MEM_C_ID",
   122			.num = PQDIP_MEM_C_ID,
   123			.start_phys = 0x0,
   124			.start_virt = NULL,
   125			.start_dma  = 0x0,
   126			.size = 0x100000,   /*1MB*/
   127			.is_dma_buf = true,
   128			.mmap_cnt = 0,
   129			.mem_priv = NULL,
   130			.d_buf = NULL,
   131			.fd = -1,
   132			.attach = NULL,
   133			.sgt = NULL
   134		},
   135		{
   136			.name = "PQDIP_MEM_T_ID",
   137			.num = PQDIP_MEM_T_ID,
   138			.start_phys = 0x0,
   139			.start_virt = NULL,
   140			.start_dma  = 0x0,
   141			.size = 0x170000,   /*1MB + 500KB*/
   142			.is_dma_buf = true,
   143			.mmap_cnt = 0,
   144			.mem_priv = NULL,
   145			.d_buf = NULL,
   146			.fd = -1,
   147			.attach = NULL,
   148			.sgt = NULL
   149		},
   150		{
   151			.name = "ADL_MEM_C_ID",
   152			.num = ADL_MEM_C_ID,
   153			.start_phys = 0x0,
   154			.start_virt = NULL,
   155			.start_dma  = 0x0,
   156			.size = 0x100000,   /*1MB*/
   157			.is_dma_buf = true,
   158			.mmap_cnt = 0,
   159			.mem_priv = NULL,
   160			.d_buf = NULL,
   161			.fd = -1,
   162		},
   163		{
   164			.name = "ADL_MEM_T_ID",
   165			.num = ADL_MEM_T_ID,
   166			.start_phys = 0x0,
   167			.start_virt = NULL,
   168			.start_dma  = 0x0,
   169			.size = 0x200000,   /*2MB*/
   170			.is_dma_buf = true,
   171			.mmap_cnt = 0,
   172			.mem_priv = NULL,
   173			.d_buf = NULL,
   174			.fd = -1,
   175		},
   176		{
   177			.name = "IMG_MEM_G_ID",
   178			.num = IMG_MEM_G_ID,
   179			.start_phys = 0x0,
   180			.start_virt = NULL,
   181			.start_dma  = 0x0,
   182			.size = 0x1800000,
   183			.is_dma_buf = true,
   184			.mmap_cnt = 0,
   185			.mem_priv = NULL,
   186			.d_buf = NULL,
   187			.fd = -1,
   188			.attach = NULL,
   189			.sgt = NULL
   190		},
   191	};
   192	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
