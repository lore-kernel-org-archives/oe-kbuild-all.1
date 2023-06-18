Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3379A1386
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 10:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687083735; x=1718619735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wPisJUkm5jI0aXtNIsL3Vik68CvxGAMaLkO3xxHLK1Q=;
  b=SPdZ4B0qBgJxCRcXYdy1TbcJKoESB4WY6ATtIjcmECdl9PtMLbYNddY3
   83NtbOrm+7jhWPsYDum7qFKedcukx7t9CHfXg02GJ1ttrUKm7hR0N03Yr
   vzUdfm6Go2rJ2fTGePwXp8DC+Dwd/XR7S7nAFx1AFi1D5ycGzJyeB6cbL
   rclVBiIfke24JW6qRw8m86TYI8sfEL3hBIzRhisUEdgH9DMfXLBWUD8tP
   Babg/g6Fu9EYAFENK9H80XALEytsRipCd7dCucow+QqqU/XCKNWpvrENW
   XqdcKZTpPRCVJK8GROZOXb009gZWP56Vp56oFL6Qx6WpJit0aM76c7GGK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425414227"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="425414227"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 03:22:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="707577402"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="707577402"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jun 2023 03:22:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qApXw-0003dk-37;
	Sun, 18 Jun 2023 10:22:12 +0000
Date: Sun, 18 Jun 2023 18:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 4030/27674]
 drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202306181835.Sd2hGU1Z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   31e1367ff78eb68e54a2025e9c6601e3fa6c6312
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [4030/27674] ANDROID: android: Create debug_symbols driver
config: x86_64-randconfig-s021-20230614 (https://download.01.org/0day-ci/archive/20230618/202306181835.Sd2hGU1Z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306181835.Sd2hGU1Z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306181835.Sd2hGU1Z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +50 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
    47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
  > 50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
