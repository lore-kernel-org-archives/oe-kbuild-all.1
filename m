Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219258828
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jul 2023 18:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688927818; x=1720463818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WSYU3YGKOX624FTWNqkMWqURgkvhH1boXRdtcsHx9Io=;
  b=WYe5bWWbVg+4uNtjdkkDk1CqrG1V2WC9oYdRhyjFYve9oiB6nq6XiMM4
   VCjq76JQsGHD4U6UIC26phBH74um3XXDoXSHnq0Dpj1xljp9yfglAkDy5
   Ye0GNVquL/UGBvCzHB6WWe9StZ8qmkITJTIO336pHYC/FW+aRj6OC0bTx
   4LzJ6mZsRn5KAcJRRvsMZnt9LLMgnaMfm1rEcw48ZCEl02H34lCsqRfmx
   STkDlQ5ENZTpGSGFj6xdqWvKTr42pR3KXfvwvmYXNCFHziB1V6a/UkIn6
   hwOIFwwOrbYyLBMq3rpSBHFpFPHI+D6ClFHv22OuUqNg6Tf6s7dKJVCKU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="367689195"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="367689195"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2023 11:36:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755747012"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="755747012"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 09 Jul 2023 11:36:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIZH9-0003L6-22;
	Sun, 09 Jul 2023 18:36:51 +0000
Date: Mon, 10 Jul 2023 02:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: [drm-misc:drm-misc-next 2/3]
 drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202307100243.v3hv6aes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
head:   8d1077cf2e43b15fefd76ebec2b71541eb27ef2c
commit: f39db26c54281da6a785259498ca74b5e470476f [2/3] drm: Add kms driver for loongson display controller
config: i386-randconfig-i063-20230710 (https://download.01.org/0day-ci/archive/20230710/202307100243.v3hv6aes-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230710/202307100243.v3hv6aes-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307100243.v3hv6aes-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem * @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     expected void volatile [noderef] __iomem *
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     got void *kptr
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem * @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     expected void const volatile [noderef] __iomem *
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     got void *kptr

vim +27 drivers/gpu/drm/loongson/lsdc_benchmark.c

    12	
    13	typedef void (*lsdc_copy_proc_t)(struct lsdc_bo *src_bo,
    14					 struct lsdc_bo *dst_bo,
    15					 unsigned int size,
    16					 int n);
    17	
    18	static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo *src_bo,
    19					      struct lsdc_bo *dst_bo,
    20					      unsigned int size,
    21					      int n)
    22	{
    23		lsdc_bo_kmap(src_bo);
    24		lsdc_bo_kmap(dst_bo);
    25	
    26		while (n--)
  > 27			memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
    28	
    29		lsdc_bo_kunmap(src_bo);
    30		lsdc_bo_kunmap(dst_bo);
    31	}
    32	
    33	static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo *src_bo,
    34					      struct lsdc_bo *dst_bo,
    35					      unsigned int size,
    36					      int n)
    37	{
    38		lsdc_bo_kmap(src_bo);
    39		lsdc_bo_kmap(dst_bo);
    40	
    41		while (n--)
  > 42			memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
    43	
    44		lsdc_bo_kunmap(src_bo);
    45		lsdc_bo_kunmap(dst_bo);
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
