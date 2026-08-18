Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386E430ACE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 09:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044896; cv=none; b=AeiMmZNYQcXwKAFQyp4pd51PXEM+AvXElivd4bzhCxTyssrftnTB01gpOLjyQSbs+G4YOeIRiwY/Ms4Qvaz/w9VaS6ucgpxXiHm1V9FdrAp4uW3Gh3BQf3kCFkBXQ95x9MCAusksZo+TZOvVFwB9IypO33mOuGOJ12FLnOQ2R+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044896; c=relaxed/simple;
	bh=SDkK/BPAoO6rU9yIPqRvmXuAZedzgo5LC3I6AeTciDE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rEY2l0Qc9a/cL1zuBvnhgRxr0hGx9NCRM58XrJnkomNXfvHCM6IsSOXm96n0D51IeHPE9EoXVWh4e1QFMI7Y8Bc9ju6VoFJX3YJ4tTBUzqZ0QnRGlPzgKZICMvZpErgUZnQcq5OoK5doIfiNzE6EsvOR9GFZiiBHVkgZvTBkA+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mANQL9ex; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mANQL9ex"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787044894; x=1818580894;
  h=date:from:to:cc:subject:message-id;
  bh=SDkK/BPAoO6rU9yIPqRvmXuAZedzgo5LC3I6AeTciDE=;
  b=mANQL9expWz9eWxG64M+Xe3DZP7ANSCGFk8i4Co7tzjMDM0/pMYrgum5
   u6BEBRAM2w51utKveAmkampGve2fEU5ZjV0LzBYBkjRLtQDdYDfiXgZ7U
   kWUm+a71vyo8p5Ipj0m7xkZ8OnKJoOtYcSeIbrG5XbIn8WhFmg3nOiFk1
   LfC2n+5M9a5845Na4hCVRd+JErDNzueun4bB8YeJbQafOR/Hvn04yF4/W
   iaYLGdnj+6il979mOgv2iap5bXqgVC5JlglXjbpEQfErWmqte1gh9zl59
   7HjyvjbRq8EHv9UKACv+7SYT1UMQVSOQEZIdsvLpPYlgmNimWl7k0Caxc
   Q==;
X-CSE-ConnectionGUID: EefDGgqZTDWMRqWTuC4CQA==
X-CSE-MsgGUID: rcJERiR3TjSonJr53uGqwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98199190"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98199190"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 02:21:33 -0700
X-CSE-ConnectionGUID: tr9QWSFFQn+UmFMu88nl4Q==
X-CSE-MsgGUID: VuNXY+q8RDW7/wz3Kgsl2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="267142520"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 18 Aug 2026 02:21:32 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwG0f-00000000eDq-3US8;
	Tue, 18 Aug 2026 09:21:29 +0000
Date: Tue, 18 Aug 2026 17:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: 
 [mcgrof:blk-iobuf-pool-v5-premap-iova-pgsize-clamp-param-test 16/23]
 dma-iommu-test.c:undefined reference to `kunit_binary_assert_format'
Message-ID: <202608181732.ZTCZoBub-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git blk-iobuf-pool-v5-premap-iova-pgsize-clamp-param-test
head:   23b3f1b3b97e1cab7154f5a36b596f91670e4faa
commit: f97e67079ec9c01e1e14856a0bcc8d280c0e7376 [16/23] selftests: add DMA IOVA page-size coverage
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608181732.ZTCZoBub-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181732.ZTCZoBub-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608181732.ZTCZoBub-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: block/blk-iobuf.o: in function `blk_uring_cmd_alloc_iobuf':
   blk-iobuf.c:(.text+0xed4): undefined reference to `__udivdi3'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_partial_unwind_test':
>> dma-iommu-test.c:(.text+0x20c): undefined reference to `kunit_binary_assert_format'
>> ld: dma-iommu-test.c:(.text+0x21a): undefined reference to `__kunit_do_failed_assertion'
>> ld: dma-iommu-test.c:(.text+0x255): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x263): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x295): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x2a3): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x2d5): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x2e3): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_legacy_small_leaf_test':
   dma-iommu-test.c:(.text+0x4dc): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x4ea): undefined reference to `__kunit_do_failed_assertion'
>> ld: dma-iommu-test.c:(.text+0x4f1): undefined reference to `__kunit_abort'
   ld: dma-iommu-test.c:(.text+0x51d): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x52b): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x565): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x573): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x5a5): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x5b3): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x5e5): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x5f3): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x624): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x632): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x665): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x673): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_core_map_test':
   dma-iommu-test.c:(.text+0x854): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x862): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x869): undefined reference to `__kunit_abort'
   ld: dma-iommu-test.c:(.text+0x895): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x8a3): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x8d5): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x8e3): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x915): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x923): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x955): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x963): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x995): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x9a3): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_alignment_test':
   dma-iommu-test.c:(.text+0xa6f): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xa92): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0xaaf): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xad2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_unsupported_test':
   dma-iommu-test.c:(.text+0xb7f): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xba2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_invalid_test':
   dma-iommu-test.c:(.text+0xcaf): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xcd2): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0xcef): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xd12): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0xd2f): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xd52): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_pgsize_valid_test':
   dma-iommu-test.c:(.text+0xe37): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xe5a): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0xe7f): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xea2): undefined reference to `__kunit_do_failed_assertion'
   ld: drivers/iommu/dma-iommu-test.o: in function `dma_iova_link_alignment_test':
   dma-iommu-test.c:(.text+0xfb7): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0xfda): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0xfff): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x1022): undefined reference to `__kunit_do_failed_assertion'
   ld: dma-iommu-test.c:(.text+0x103f): undefined reference to `kunit_binary_assert_format'
   ld: dma-iommu-test.c:(.text+0x1062): undefined reference to `__kunit_do_failed_assertion'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
