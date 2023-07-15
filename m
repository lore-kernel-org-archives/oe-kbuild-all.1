Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77196FCE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 19:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689450908; x=1720986908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bY5IWoYA7NNu+3auJwXW/kMli6V26lOzDPSef5SyRDw=;
  b=avcRtsiIXsRefUCgt+n+gLdWcQjiCtTSWY7cg5x3fC8u+MW9YIdc46lQ
   S6w36zwx4Xu1ywPrG+MFzdJu/MAgzFBOAa6qx1qvpp8YIemnRoCSR6Pk9
   i2CnSb2+OdGjWbee7htEf4DY8xHbUEab49BE9UHR89hbOMcvPveSi4nKz
   gYwgjOlAv44w78f+WmJIGJVU2nn3hZTAPyMY9Gmc1NguHpP11S9LC4/al
   LVOanTlO88yaiiBftUaQvpro0xWLgH3Nm0CFCzALREX4Bq5VLmEqjQ0qG
   Eg8ujoDnKhfwatvLsxB+JVoIl3mPhVEGbAcXtCMKJIr4gsF5654Zaixi2
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="363156755"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="363156755"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 12:55:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="836407707"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="836407707"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2023 12:55:05 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKlM8-0008LB-2k;
	Sat, 15 Jul 2023 19:55:04 +0000
Date: Sun, 16 Jul 2023 03:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sui Jingfeng <suijingfeng@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 560/2692]
 drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202307160328.P79qWZoB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7c2878be573282a9961c359b806ccf70afe1a6b6
commit: f39db26c54281da6a785259498ca74b5e470476f [560/2692] drm: Add kms driver for loongson display controller
config: openrisc-randconfig-r073-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160328.P79qWZoB-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160328.P79qWZoB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160328.P79qWZoB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/loongson/lsdc_benchmark.c:27:35: sparse:     got void *kptr
>> drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *kptr @@
   drivers/gpu/drm/loongson/lsdc_benchmark.c:42:51: sparse:     expected void const volatile [noderef] __iomem *addr
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
