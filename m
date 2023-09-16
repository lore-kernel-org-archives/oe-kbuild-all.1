Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E31D6134
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 13:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694869540; x=1726405540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b6c8RV6xpuZ1eKCYQpfzzRh2WgwFw2VLQ9I5QaXbNY0=;
  b=jKodcT4oRPsXnApx4bIDYyrr36kxqXO0EPqjiXfDWSzCUiuvzADMWaDt
   RxA8a1HGj8tLiDrrYYU616whpCB1ILPIxsMhxHoBBOqVfhVKuWanX1wPv
   55r2bP38n1e7C2TMieurg7sdzQIn6u3loeieO0uCMP4aD4Dmp6hfMuxbI
   rc8RZCqmhv4gO362jvLE1E4QTxziohXAFUr2arDC1gaB9hNOIt2Mj9tRA
   WKVxzlS6Ij5Qac5TK4+cnKI9ef/wH0+wEuNOFwF4FyG7r/1tH7kcrj80u
   X9KLsEClq3YUKk5g/AmR2TJAAkHeAaTmR921pRLrkdUsvk+506FPvLa7t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="410368577"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="410368577"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 06:05:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="810840291"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="810840291"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 16 Sep 2023 06:05:38 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhUzP-0004Iq-37;
	Sat, 16 Sep 2023 13:05:35 +0000
Date: Sat, 16 Sep 2023 21:05:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:locking/futex 11/14]
 kernel/futex/core.c:1211:undefined reference to `vmalloc_huge_node'
Message-ID: <202309162119.sF0a8lEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/futex
head:   be4c83232e8e9ff26d2228a2b197aee00c16b17f
commit: e9a29f7e22ce8b589fd76ea86dc4182443761ce6 [11/14] futex: Implement FUTEX2_NUMA
config: riscv-randconfig-002-20230916 (https://download.01.org/0day-ci/archive/20230916/202309162119.sF0a8lEx-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309162119.sF0a8lEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309162119.sF0a8lEx-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: kernel/futex/core.o: in function `futex_init':
>> kernel/futex/core.c:1211:(.init.text+0x1ec): undefined reference to `vmalloc_huge_node'
   pahole: .tmp_vmlinux.btf: Invalid argument
   .btf.vmlinux.bin.o: file not recognized: file format not recognized

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_OV2640
   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [m]:
   - VIDEO_EM28XX_V4L2 [=m] && USB [=m] && MEDIA_SUPPORT [=m] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=y] || MEDIA_DIGITAL_TV_SUPPORT [=y]) && VIDEO_EM28XX [=m] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_OV7640
   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [m]:
   - VIDEO_GO7007 [=m] && MEDIA_SUPPORT [=m] && MEDIA_USB_SUPPORT [=y] && MEDIA_ANALOG_TV_SUPPORT [=y] && VIDEO_DEV [=m] && I2C [=y] && SND [=y] && USB [=m] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_MT9V011
   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [m]:
   - VIDEO_EM28XX_V4L2 [=m] && USB [=m] && MEDIA_SUPPORT [=m] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=y] || MEDIA_DIGITAL_TV_SUPPORT [=y]) && VIDEO_EM28XX [=m] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_OV7670
   Depends on [n]: MEDIA_SUPPORT [=m] && VIDEO_DEV [=m] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [m]:
   - VIDEO_CAFE_CCIC [=m] && MEDIA_SUPPORT [=m] && MEDIA_PLATFORM_SUPPORT [=y] && MEDIA_PLATFORM_DRIVERS [=y] && V4L_PLATFORM_DRIVERS [=y] && PCI [=y] && I2C [=y] && VIDEO_DEV [=m] && COMMON_CLK [=y]


vim +1211 kernel/futex/core.c

  1190	
  1191	static int __init futex_init(void)
  1192	{
  1193		unsigned int order, n;
  1194		unsigned long size, i;
  1195	
  1196	#if CONFIG_BASE_SMALL
  1197		futex_hashsize = 16;
  1198	#else
  1199		futex_hashsize = 256 * num_possible_cpus();
  1200		futex_hashsize /= num_possible_nodes();
  1201		futex_hashsize = roundup_pow_of_two(futex_hashsize);
  1202	#endif
  1203		futex_hashshift = ilog2(futex_hashsize);
  1204		size = sizeof(struct futex_hash_bucket) * futex_hashsize;
  1205		order = get_order(size);
  1206	
  1207		for_each_node(n) {
  1208			struct futex_hash_bucket *table;
  1209	
  1210			if (order > MAX_ORDER)
> 1211				table = vmalloc_huge_node(size, GFP_KERNEL, n);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
