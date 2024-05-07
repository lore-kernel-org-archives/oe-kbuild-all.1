Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65FE16DEB5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 19:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715110251; cv=none; b=it8fLNmesXiWmwEOsa/XYzLhNbYTgOA45cPTNjkwaxC5N6hadnH4+cxWC60/HW9jfun558azzKp2taXDlBMVg843Lk2pcHDT0nbNKoTQZZiG/KNr7Q8TWeggdyAz8cIeL5MmiJVBFihY2RLrDx4reSmB10QpYmCj3M6Rd//PO1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715110251; c=relaxed/simple;
	bh=edLOHaFXPxOQUDcUpSF4YhMZMvSNPwXk5aBWRK6hodM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lOmo+fz3+myQbqixcfk2zG4jYi30jaF6fiH7h8Zf5+0BWDbhCFLtX8tl0Jl1CXgmBG+fZLs19vtePWuJk179f/lIiIZAHxx2Ky12vIXY5Gi9UjMzmMzXhgCugFrLCLnRqv99saFotCC/AgTpmfpbvjFl/vyXIBJM9nLW8KPl7iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LlV72VZd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LlV72VZd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715110250; x=1746646250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=edLOHaFXPxOQUDcUpSF4YhMZMvSNPwXk5aBWRK6hodM=;
  b=LlV72VZdKkZjTHJAvkgWem0+VERC3cr1VTMPkNq47u77KqpYGBri0zsI
   zy9IIhXK0Nn9rRFF92VJ9U7FlqTiu3Lp6Bd3f3kuvw+eACaDqpzSThP48
   bzRuCo89LEkphP9pb0BTLooV2Tl87kpbYw188/fmg/waxtZhiyXy99QSD
   f3IhFIp3yibt2l3nAypCoWNhDFefXU0jF/cRdcCR9a7YM/VvCleibwOEj
   bGjK0gNZ2ugo9NP0hG+KmmQmh8dkzGOuSOxmcEbhrYsML5g2Nm8iaiXUU
   hufCyQGLwBsZMC8kqCie/uzAZDkqmPHvFWmTAtVl8MMgQmgtkBS98L3TZ
   g==;
X-CSE-ConnectionGUID: q1/8K25gQUWcI/sEFWteaA==
X-CSE-MsgGUID: p7vtxuyETh64qBKJpldeUw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22343609"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="22343609"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 12:30:49 -0700
X-CSE-ConnectionGUID: RyJu+Rf5RIeDJCfp1OabBg==
X-CSE-MsgGUID: V+HLQ9uhRBO8uYfh5SJwLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="33434838"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2024 12:30:47 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4QWS-0002a8-2C;
	Tue, 07 May 2024 19:30:44 +0000
Date: Wed, 8 May 2024 03:30:02 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Will Deacon <will@kernel.org>, Michael Shavit <mshavit@google.com>
Subject: [linux-next:master 9356/11707] include/kunit/test.h:444:undefined
 reference to `kunit_kmalloc_array'
Message-ID: <202405080300.iTZpE1xH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93a39e4766083050ca0ecd6a3548093a3b9eb60c
commit: 56e1a4cc2588a7cb9664457a62fd7a77e005aa01 [9356/11707] iommu/arm-smmu-v3: Add unit tests for arm_smmu_write_entry
config: arm64-randconfig-r023-20221023 (https://download.01.org/0day-ci/archive/20240508/202405080300.iTZpE1xH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080300.iTZpE1xH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080300.iTZpE1xH-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `kunit_kmalloc':
>> include/kunit/test.h:444:(.text+0x440): undefined reference to `kunit_kmalloc_array'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_test_writer_record_syncs':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x598): undefined reference to `kunit_unary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_unary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x598): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x5a0): undefined reference to `kunit_unary_assert_format'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:77:(.text+0x5b0): undefined reference to `__kunit_do_failed_assertion'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x5ec): undefined reference to `kunit_binary_ptr_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_ptr_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x5ec): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x5f4): undefined reference to `kunit_binary_ptr_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x604): undefined reference to `__kunit_do_failed_assertion'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:58:(.text+0x60c): undefined reference to `__kunit_abort'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_v3_test_cd_expect_transition':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x728): undefined reference to `kunit_mem_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_mem_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x728): dangerous relocation: unsupported relocation
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x734): undefined reference to `kunit_mem_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:322:(.text+0x748): undefined reference to `__kunit_do_failed_assertion'
>> aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x850): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x850): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x854): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:320:(.text+0x868): undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x898): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x898): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x8a0): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:321:(.text+0x8b0): undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: in function `arm_smmu_v3_test_ste_expect_transition':
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:144:(.text+0xcd4): undefined reference to `kunit_mem_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_mem_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:144:(.text+0xcd4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:144:(.text+0xce4): undefined reference to `kunit_mem_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:144:(.text+0xcf8): undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:142:(.text+0xdf4): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:142:(.text+0xdf4): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:142:(.text+0xdf8): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:142:(.text+0xe08): undefined reference to `__kunit_do_failed_assertion'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:143:(.text+0xe38): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.o: relocation R_AARCH64_ADR_PREL_PG_HI21 against symbol `kunit_binary_assert_format' which may bind externally can not be used when making a shared object; recompile with -fPIC
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:143:(.text+0xe38): dangerous relocation: unsupported relocation
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:143:(.text+0xe40): undefined reference to `kunit_binary_assert_format'
   aarch64-linux-ld: drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-test.c:143:(.text+0xe50): undefined reference to `__kunit_do_failed_assertion'


vim +444 include/kunit/test.h

7122debb4367ee Daniel Latypov  2021-05-03  430  
7122debb4367ee Daniel Latypov  2021-05-03  431  /**
7122debb4367ee Daniel Latypov  2021-05-03  432   * kunit_kmalloc() - Like kmalloc() except the allocation is *test managed*.
7122debb4367ee Daniel Latypov  2021-05-03  433   * @test: The test context object.
7122debb4367ee Daniel Latypov  2021-05-03  434   * @size: The size in bytes of the desired memory.
7122debb4367ee Daniel Latypov  2021-05-03  435   * @gfp: flags passed to underlying kmalloc().
7122debb4367ee Daniel Latypov  2021-05-03  436   *
7122debb4367ee Daniel Latypov  2021-05-03  437   * See kmalloc() and kunit_kmalloc_array() for more information.
57e3cded99e9c8 David Gow       2023-05-25  438   *
57e3cded99e9c8 David Gow       2023-05-25  439   * Note that some internal context data is also allocated with GFP_KERNEL,
57e3cded99e9c8 David Gow       2023-05-25  440   * regardless of the gfp passed in.
7122debb4367ee Daniel Latypov  2021-05-03  441   */
7122debb4367ee Daniel Latypov  2021-05-03  442  static inline void *kunit_kmalloc(struct kunit *test, size_t size, gfp_t gfp)
7122debb4367ee Daniel Latypov  2021-05-03  443  {
7122debb4367ee Daniel Latypov  2021-05-03 @444  	return kunit_kmalloc_array(test, 1, size, gfp);
7122debb4367ee Daniel Latypov  2021-05-03  445  }
0a756853586ce1 Brendan Higgins 2019-09-23  446  

:::::: The code at line 444 was first introduced by commit
:::::: 7122debb4367ee5c89237e5d36dcc0007d7ec43c kunit: introduce kunit_kmalloc_array/kunit_kcalloc() helpers

:::::: TO: Daniel Latypov <dlatypov@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
