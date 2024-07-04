Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58FE1B0100
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 14:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720104585; cv=none; b=jBvh3t0OFktyeye3aKvnKNqz+wwNdj4m3/th3rHJs9laBym14Y99TjlnwBQyAQisrQdb8+AsHeaLpdICxJ5JYugBS5B89pstEYsaZGjXSRiIVMgBmUQhHoFQpuDoXgwbMeLm5WozciiJ1cD5DHjeek+6vrLTmPx/pELrwYYr2lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720104585; c=relaxed/simple;
	bh=tQAqsVzksu9o2hXbdEGIahawbJmKfbwdHdJsJwN4DME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O8tsok5tfJudqC93hQxXRjhcHL3o80/NhNxGQNiM2yFaLoopb0rHXyeLEJLez181muWyhEcD7Agan5TgcYD8eCpS9xm49jXjFUu8APGGusFzApWrL1fXrusGFsyjEz4Og1P1JEmAXkbppSx+EYDIkBYeqY8Wai8doihY6y3Qar8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e95bPOaR; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e95bPOaR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720104583; x=1751640583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQAqsVzksu9o2hXbdEGIahawbJmKfbwdHdJsJwN4DME=;
  b=e95bPOaR8UV8GQHQzPgbXD1Xb14rkHj0YEgpoPMAn9roZIwOzyr5Aure
   feMX8KefB9czKWYylBklJc/q2iaCvaDROrUpbtefDgiQf+lvzr6wSZwas
   s0wnFhPOA4BvDrn9Udp6/rnf8ca/v0t8O2pU2NWUv3/3bCnPIIb1Zct8y
   h8sItGDiaznE2SFOUggkTXZPh3MmwqDh0K15kV2eDTtwFNGfQ7g3YQqnQ
   VkHiL4QjVgZ5yYNz0EoCej7FT8pnAuvsui960Vf+FnTJ8Ipnn/HIHU0ik
   qzknTI7Anw3q8IEFA8rd7EvjJ7QBkHfCuJLHvzphSFzNzcBAY0wkBM4bN
   g==;
X-CSE-ConnectionGUID: /rfPzuIhREu1LOJKOraIyw==
X-CSE-MsgGUID: IrJ1kvVKQ0aqeQWQx9OWXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="34927521"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="34927521"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 07:49:42 -0700
X-CSE-ConnectionGUID: 1EBiWBb2QaucodqOBlD8Qw==
X-CSE-MsgGUID: sAGDbusKQauf2CZ7sxdpGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="46590454"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Jul 2024 07:49:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPNmE-000R74-2U;
	Thu, 04 Jul 2024 14:49:38 +0000
Date: Thu, 4 Jul 2024 22:49:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 48/53]
 drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:198:13: warning:
 'test_map_simple' defined but not used
Message-ID: <202407042230.VC5iCEDR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   2bf23486e7eae67485953abf3529ad2d3a90384b
commit: 798311d40e98b02c18a121da0dd52ff75d21b543 [48/53] iommupt: Add the 64 bit ARM page table format
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240704/202407042230.VC5iCEDR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407042230.VC5iCEDR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407042230.VC5iCEDR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:13:
   drivers/iommu/generic_pt/fmt/../pt_common.h: In function 'pt_next_entry':
   drivers/iommu/generic_pt/fmt/../pt_common.h:186:41: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     186 |                 WALK_PRINTK("next", pts);
         |                                         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h: At top level:
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:198:13: warning: 'test_map_simple' defined but not used [-Wunused-function]
     198 | static void test_map_simple(struct kunit *test)
         |             ^~~~~~~~~~~~~~~
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:111:13: warning: 'test_best_pgsize' defined but not used [-Wunused-function]
     111 | static void test_best_pgsize(struct kunit *test)
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:5,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/generic_pt/iommu.h:9,
                    from drivers/iommu/generic_pt/fmt/armv8.h:331,
                    from drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:12:
>> drivers/iommu/generic_pt/fmt/iommu_armv8_4k.c:7:15: warning: 'armv8_4k_cmp_suite' defined but not used [-Wunused-variable]
       7 | #define PTPFX armv8_4k_
         |               ^~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:25:16: note: in expansion of macro 'CONCATENATE'
      25 | #define NS(fn) CONCATENATE(PTPFX, fn)
         |                ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:25:28: note: in expansion of macro 'PTPFX'
      25 | #define NS(fn) CONCATENATE(PTPFX, fn)
         |                            ^~~~~
   drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h:271:27: note: in expansion of macro 'NS'
     271 | static struct kunit_suite NS(cmp_suite) = {
         |                           ^~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_walk_all' at drivers/iommu/generic_pt/fmt/../pt_common.h:275:9,
       inlined from 'count_valids_single' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:89:2:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_walk_all' at drivers/iommu/generic_pt/fmt/../pt_common.h:275:9,
       inlined from 'count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:74:2:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
--
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_16k.c:13:
   drivers/iommu/generic_pt/fmt/../pt_common.h: In function 'pt_next_entry':
   drivers/iommu/generic_pt/fmt/../pt_common.h:186:41: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     186 |                 WALK_PRINTK("next", pts);
         |                                         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_16k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h: At top level:
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:198:13: warning: 'test_map_simple' defined but not used [-Wunused-function]
     198 | static void test_map_simple(struct kunit *test)
         |             ^~~~~~~~~~~~~~~
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:111:13: warning: 'test_best_pgsize' defined but not used [-Wunused-function]
     111 | static void test_best_pgsize(struct kunit *test)
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:5,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/generic_pt/iommu.h:9,
                    from drivers/iommu/generic_pt/fmt/armv8.h:331,
                    from drivers/iommu/generic_pt/fmt/iommu_armv8_16k.c:12:
>> drivers/iommu/generic_pt/fmt/iommu_armv8_16k.c:7:15: warning: 'armv8_16k_cmp_suite' defined but not used [-Wunused-variable]
       7 | #define PTPFX armv8_16k_
         |               ^~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:25:16: note: in expansion of macro 'CONCATENATE'
      25 | #define NS(fn) CONCATENATE(PTPFX, fn)
         |                ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:25:28: note: in expansion of macro 'PTPFX'
      25 | #define NS(fn) CONCATENATE(PTPFX, fn)
         |                            ^~~~~
   drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h:271:27: note: in expansion of macro 'NS'
     271 | static struct kunit_suite NS(cmp_suite) = {
         |                           ^~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_walk_all' at drivers/iommu/generic_pt/fmt/../pt_common.h:275:9,
       inlined from 'count_valids_single' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:89:2:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_walk_all' at drivers/iommu/generic_pt/fmt/../pt_common.h:275:9,
       inlined from 'count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:74:2:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
--
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_64k.c:13:
   drivers/iommu/generic_pt/fmt/../pt_common.h: In function 'pt_next_entry':
   drivers/iommu/generic_pt/fmt/../pt_common.h:186:41: warning: suggest braces around empty body in an 'if' statement [-Wempty-body]
     186 |                 WALK_PRINTK("next", pts);
         |                                         ^
   In file included from drivers/iommu/generic_pt/fmt/iommu_armv8_64k.c:17:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h: At top level:
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:198:13: warning: 'test_map_simple' defined but not used [-Wunused-function]
     198 | static void test_map_simple(struct kunit *test)
         |             ^~~~~~~~~~~~~~~
>> drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:111:13: warning: 'test_best_pgsize' defined but not used [-Wunused-function]
     111 | static void test_best_pgsize(struct kunit *test)
         |             ^~~~~~~~~~~~~~~~
   In file included from include/linux/string.h:5,
                    from include/linux/bitmap.h:13,
                    from include/linux/cpumask.h:13,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/kref.h:16,
                    from include/linux/mm_types.h:8,
                    from include/linux/generic_pt/iommu.h:9,
                    from drivers/iommu/generic_pt/fmt/armv8.h:331,
                    from drivers/iommu/generic_pt/fmt/iommu_armv8_64k.c:12:
>> drivers/iommu/generic_pt/fmt/iommu_armv8_64k.c:7:15: warning: 'armv8_64k_cmp_suite' defined but not used [-Wunused-variable]
       7 | #define PTPFX armv8_64k_
         |               ^~~~~~~~~~
   include/linux/args.h:25:24: note: in definition of macro '__CONCAT'
      25 | #define __CONCAT(a, b) a ## b
         |                        ^
   drivers/iommu/generic_pt/fmt/../pt_common.h:25:16: note: in expansion of macro 'CONCATENATE'
      25 | #define NS(fn) CONCATENATE(PTPFX, fn)
         |                ^~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:25:28: note: in expansion of macro 'PTPFX'
      25 | #define NS(fn) CONCATENATE(PTPFX, fn)
         |                            ^~~~~
   drivers/iommu/generic_pt/fmt/../kunit_iommu_cmp.h:271:27: note: in expansion of macro 'NS'
     271 | static struct kunit_suite NS(cmp_suite) = {
         |                           ^~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_walk_all' at drivers/iommu/generic_pt/fmt/../pt_common.h:275:9,
       inlined from 'count_valids_single' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:89:2:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~
   In function 'pt_descend',
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_descend' at drivers/iommu/generic_pt/fmt/../pt_common.h:258:9,
       inlined from '__count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:53:4,
       inlined from 'pt_walk_all' at drivers/iommu/generic_pt/fmt/../pt_common.h:275:9,
       inlined from 'count_valids' at drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:74:2:
   drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h:45:28: error: inlining failed in call to 'always_inline' '__count_valids': recursive inlining
      45 | static __always_inline int __count_valids(struct pt_state *pts, void *arg)
         |                            ^~~~~~~~~~~~~~
   drivers/iommu/generic_pt/fmt/../pt_common.h:258:16: note: called from here
     258 |         ret = (*fn)(pts, arg);
         |               ~^~~~~~~~~~~~~~


vim +/test_map_simple +198 drivers/iommu/generic_pt/fmt/../kunit_iommu_pt.h

9a375f0591c61e Jason Gunthorpe 2024-06-28  110  
9a375f0591c61e Jason Gunthorpe 2024-06-28 @111  static void test_best_pgsize(struct kunit *test)
9a375f0591c61e Jason Gunthorpe 2024-06-28  112  {
9a375f0591c61e Jason Gunthorpe 2024-06-28  113  	struct pt_state pts = { .table = common_from_test(test) };
9a375f0591c61e Jason Gunthorpe 2024-06-28  114  	pt_vaddr_t sizes;
9a375f0591c61e Jason Gunthorpe 2024-06-28  115  	unsigned int i;
9a375f0591c61e Jason Gunthorpe 2024-06-28  116  
9a375f0591c61e Jason Gunthorpe 2024-06-28  117  	pt_reset(&pts);
9a375f0591c61e Jason Gunthorpe 2024-06-28  118  	pts.level = 0; // FIXME
9a375f0591c61e Jason Gunthorpe 2024-06-28  119  	sizes = pt_possible_sizes(&pts);
9a375f0591c61e Jason Gunthorpe 2024-06-28  120  	KUNIT_EXPECT_NE(test, sizes, 0);
9a375f0591c61e Jason Gunthorpe 2024-06-28  121  
9a375f0591c61e Jason Gunthorpe 2024-06-28  122  	/* Every aligned power of two picks the right size */
9a375f0591c61e Jason Gunthorpe 2024-06-28  123  	for (i = 0; i != 31; i++) {
9a375f0591c61e Jason Gunthorpe 2024-06-28  124  		pt_vaddr_t len = 1ULL << i;
9a375f0591c61e Jason Gunthorpe 2024-06-28  125  		pt_vaddr_t expect;
9a375f0591c61e Jason Gunthorpe 2024-06-28  126  
9a375f0591c61e Jason Gunthorpe 2024-06-28  127  		if (len & sizes)
9a375f0591c61e Jason Gunthorpe 2024-06-28  128  			expect = len;
9a375f0591c61e Jason Gunthorpe 2024-06-28  129  		else if ((sizes % len) == 0)
9a375f0591c61e Jason Gunthorpe 2024-06-28  130  			expect = 0;
9a375f0591c61e Jason Gunthorpe 2024-06-28  131  		else
9a375f0591c61e Jason Gunthorpe 2024-06-28  132  			expect = rounddown_pow_of_two(sizes % len);
9a375f0591c61e Jason Gunthorpe 2024-06-28  133  
9a375f0591c61e Jason Gunthorpe 2024-06-28  134  		KUNIT_EXPECT_EQ(test,
9a375f0591c61e Jason Gunthorpe 2024-06-28  135  				pt_compute_best_pgsize(&pts, 0, (1 << i) - 1),
9a375f0591c61e Jason Gunthorpe 2024-06-28  136  				expect);
9a375f0591c61e Jason Gunthorpe 2024-06-28  137  	}
9a375f0591c61e Jason Gunthorpe 2024-06-28  138  
9a375f0591c61e Jason Gunthorpe 2024-06-28  139  	/* Unaligned never works */
9a375f0591c61e Jason Gunthorpe 2024-06-28  140  	for (i = 0; i != 31; i++) {
9a375f0591c61e Jason Gunthorpe 2024-06-28  141  		pt_vaddr_t len = 1ULL << i;
9a375f0591c61e Jason Gunthorpe 2024-06-28  142  
9a375f0591c61e Jason Gunthorpe 2024-06-28  143  		KUNIT_EXPECT_EQ(
9a375f0591c61e Jason Gunthorpe 2024-06-28  144  			test,
9a375f0591c61e Jason Gunthorpe 2024-06-28  145  			pt_compute_best_pgsize(&pts, 1 + len,
9a375f0591c61e Jason Gunthorpe 2024-06-28  146  					       PT_GRANUAL_SIZE + len - 2),
9a375f0591c61e Jason Gunthorpe 2024-06-28  147  			0);
9a375f0591c61e Jason Gunthorpe 2024-06-28  148  	}
9a375f0591c61e Jason Gunthorpe 2024-06-28  149  }
9a375f0591c61e Jason Gunthorpe 2024-06-28  150  
9a375f0591c61e Jason Gunthorpe 2024-06-28  151  static void do_map(struct kunit *test, phys_addr_t va, pt_vaddr_t pa,
9a375f0591c61e Jason Gunthorpe 2024-06-28  152  		   pt_vaddr_t len)
9a375f0591c61e Jason Gunthorpe 2024-06-28  153  {
9a375f0591c61e Jason Gunthorpe 2024-06-28  154  	struct kunit_iommu_priv *priv = test->priv;
9a375f0591c61e Jason Gunthorpe 2024-06-28  155  	const struct pt_iommu_ops *ops = priv->iommu->ops;
9a375f0591c61e Jason Gunthorpe 2024-06-28  156  	size_t mapped;
9a375f0591c61e Jason Gunthorpe 2024-06-28  157  	int ret;
9a375f0591c61e Jason Gunthorpe 2024-06-28  158  
9a375f0591c61e Jason Gunthorpe 2024-06-28  159  	/* Mapped accumulates */
9a375f0591c61e Jason Gunthorpe 2024-06-28  160  	mapped = 1;
9a375f0591c61e Jason Gunthorpe 2024-06-28  161  	ret = ops->map_pages(priv->iommu, va, pa, len, 1,
9a375f0591c61e Jason Gunthorpe 2024-06-28  162  			     IOMMU_READ | IOMMU_WRITE, GFP_KERNEL, &mapped);
9a375f0591c61e Jason Gunthorpe 2024-06-28  163  	KUNIT_EXPECT_NO_ERRNO_FN(test, "map_pages", ret);
9a375f0591c61e Jason Gunthorpe 2024-06-28  164  	KUNIT_EXPECT_EQ(test, mapped, len + 1);
9a375f0591c61e Jason Gunthorpe 2024-06-28  165  }
9a375f0591c61e Jason Gunthorpe 2024-06-28  166  
9a375f0591c61e Jason Gunthorpe 2024-06-28  167  static void do_unmap(struct kunit *test, phys_addr_t va, pt_vaddr_t len)
9a375f0591c61e Jason Gunthorpe 2024-06-28  168  {
9a375f0591c61e Jason Gunthorpe 2024-06-28  169  	struct kunit_iommu_priv *priv = test->priv;
9a375f0591c61e Jason Gunthorpe 2024-06-28  170  	const struct pt_iommu_ops *ops = priv->iommu->ops;
9a375f0591c61e Jason Gunthorpe 2024-06-28  171  	size_t ret;
9a375f0591c61e Jason Gunthorpe 2024-06-28  172  
9a375f0591c61e Jason Gunthorpe 2024-06-28  173  	KUNIT_EXPECT_EQ(test, va % len, 0);
9a375f0591c61e Jason Gunthorpe 2024-06-28  174  
9a375f0591c61e Jason Gunthorpe 2024-06-28  175  	ret = ops->unmap_pages(priv->iommu, va, len, 1, NULL);
9a375f0591c61e Jason Gunthorpe 2024-06-28  176  	KUNIT_EXPECT_EQ(test, ret, len);
9a375f0591c61e Jason Gunthorpe 2024-06-28  177  }
9a375f0591c61e Jason Gunthorpe 2024-06-28  178  
9a375f0591c61e Jason Gunthorpe 2024-06-28  179  static void check_iova(struct kunit *test, phys_addr_t va, pt_vaddr_t pa,
9a375f0591c61e Jason Gunthorpe 2024-06-28  180  		       pt_vaddr_t len)
9a375f0591c61e Jason Gunthorpe 2024-06-28  181  {
9a375f0591c61e Jason Gunthorpe 2024-06-28  182  	struct kunit_iommu_priv *priv = test->priv;
9a375f0591c61e Jason Gunthorpe 2024-06-28  183  	const struct pt_iommu_ops *ops = priv->iommu->ops;
9a375f0591c61e Jason Gunthorpe 2024-06-28  184  	pt_vaddr_t pfn = va / PT_GRANUAL_SIZE;
9a375f0591c61e Jason Gunthorpe 2024-06-28  185  	pt_vaddr_t end_pfn = pfn + (len / PT_GRANUAL_SIZE);
9a375f0591c61e Jason Gunthorpe 2024-06-28  186  
9a375f0591c61e Jason Gunthorpe 2024-06-28  187  	for (; pfn != end_pfn; pfn++) {
9a375f0591c61e Jason Gunthorpe 2024-06-28  188  		phys_addr_t res =
9a375f0591c61e Jason Gunthorpe 2024-06-28  189  			ops->iova_to_phys(priv->iommu, pfn * PT_GRANUAL_SIZE);
9a375f0591c61e Jason Gunthorpe 2024-06-28  190  
9a375f0591c61e Jason Gunthorpe 2024-06-28  191  		KUNIT_EXPECT_EQ(test, res, pa);
9a375f0591c61e Jason Gunthorpe 2024-06-28  192  		if (res != pa)
9a375f0591c61e Jason Gunthorpe 2024-06-28  193  			break;
9a375f0591c61e Jason Gunthorpe 2024-06-28  194  		pa += PT_GRANUAL_SIZE;
9a375f0591c61e Jason Gunthorpe 2024-06-28  195  	}
9a375f0591c61e Jason Gunthorpe 2024-06-28  196  }
9a375f0591c61e Jason Gunthorpe 2024-06-28  197  
9a375f0591c61e Jason Gunthorpe 2024-06-28 @198  static void test_map_simple(struct kunit *test)
9a375f0591c61e Jason Gunthorpe 2024-06-28  199  {
9a375f0591c61e Jason Gunthorpe 2024-06-28  200  	struct kunit_iommu_priv *priv = test->priv;
9a375f0591c61e Jason Gunthorpe 2024-06-28  201  	const pt_vaddr_t addr = 0x74a71445deadbeef &
9a375f0591c61e Jason Gunthorpe 2024-06-28  202  				GENMASK(PT_MAX_OUTPUT_ADDRESS_LG2 - 1, 0);
9a375f0591c61e Jason Gunthorpe 2024-06-28  203  	struct count_valids valids = {};
9a375f0591c61e Jason Gunthorpe 2024-06-28  204  	pt_vaddr_t cur_va;
9a375f0591c61e Jason Gunthorpe 2024-06-28  205  	unsigned int pgsz;
9a375f0591c61e Jason Gunthorpe 2024-06-28  206  
9a375f0591c61e Jason Gunthorpe 2024-06-28  207  	/* Map every reported page size */
9a375f0591c61e Jason Gunthorpe 2024-06-28  208  	cur_va = PT_GRANUAL_SIZE * 256;
9a375f0591c61e Jason Gunthorpe 2024-06-28  209  	for (pgsz = 0; pgsz != 63; pgsz++) {
9a375f0591c61e Jason Gunthorpe 2024-06-28  210  		u64 len = 1ULL << pgsz;
9a375f0591c61e Jason Gunthorpe 2024-06-28  211  
9a375f0591c61e Jason Gunthorpe 2024-06-28  212  		if (!(priv->info.pgsize_bitmap & len))
9a375f0591c61e Jason Gunthorpe 2024-06-28  213  			continue;
9a375f0591c61e Jason Gunthorpe 2024-06-28  214  
9a375f0591c61e Jason Gunthorpe 2024-06-28  215  		cur_va = ALIGN(cur_va, len);
9a375f0591c61e Jason Gunthorpe 2024-06-28  216  		do_map(test, cur_va, addr & GENMASK(63, pgsz), len);
9a375f0591c61e Jason Gunthorpe 2024-06-28  217  		check_iova(test, cur_va, addr & GENMASK(63, pgsz), len);
9a375f0591c61e Jason Gunthorpe 2024-06-28  218  		cur_va += len;
9a375f0591c61e Jason Gunthorpe 2024-06-28  219  	}
9a375f0591c61e Jason Gunthorpe 2024-06-28  220  
9a375f0591c61e Jason Gunthorpe 2024-06-28  221  	/* The read interface reports that every page size was created */
9a375f0591c61e Jason Gunthorpe 2024-06-28  222  	KUNIT_EXPECT_NO_ERRNO(test, pt_walk_all(common_from_test(test),
9a375f0591c61e Jason Gunthorpe 2024-06-28  223  						__count_valids, &valids));
9a375f0591c61e Jason Gunthorpe 2024-06-28  224  	for (pgsz = 0; pgsz != 63; pgsz++) {
9a375f0591c61e Jason Gunthorpe 2024-06-28  225  		if (priv->info.pgsize_bitmap & (1ULL << pgsz))
9a375f0591c61e Jason Gunthorpe 2024-06-28  226  			KUNIT_EXPECT_EQ(test, valids.per_size[pgsz], 1);
9a375f0591c61e Jason Gunthorpe 2024-06-28  227  		else
9a375f0591c61e Jason Gunthorpe 2024-06-28  228  			KUNIT_EXPECT_EQ(test, valids.per_size[pgsz], 0);
9a375f0591c61e Jason Gunthorpe 2024-06-28  229  	}
9a375f0591c61e Jason Gunthorpe 2024-06-28  230  
9a375f0591c61e Jason Gunthorpe 2024-06-28  231  	/* Unmap works */
9a375f0591c61e Jason Gunthorpe 2024-06-28  232  	cur_va = PT_GRANUAL_SIZE * 256;
9a375f0591c61e Jason Gunthorpe 2024-06-28  233  	for (pgsz = 0; pgsz != 63; pgsz++) {
9a375f0591c61e Jason Gunthorpe 2024-06-28  234  		u64 len = 1ULL << pgsz;
9a375f0591c61e Jason Gunthorpe 2024-06-28  235  
9a375f0591c61e Jason Gunthorpe 2024-06-28  236  		if (!(priv->info.pgsize_bitmap & len))
9a375f0591c61e Jason Gunthorpe 2024-06-28  237  			continue;
9a375f0591c61e Jason Gunthorpe 2024-06-28  238  		cur_va = ALIGN(cur_va, len);
9a375f0591c61e Jason Gunthorpe 2024-06-28  239  		do_unmap(test, cur_va, len);
9a375f0591c61e Jason Gunthorpe 2024-06-28  240  		cur_va += len;
9a375f0591c61e Jason Gunthorpe 2024-06-28  241  	}
9a375f0591c61e Jason Gunthorpe 2024-06-28  242  	KUNIT_EXPECT_EQ(test, count_valids(test), 0);
9a375f0591c61e Jason Gunthorpe 2024-06-28  243  }
9a375f0591c61e Jason Gunthorpe 2024-06-28  244  

:::::: The code at line 198 was first introduced by commit
:::::: 9a375f0591c61e806ba52315dc5ead1ea218f715 iommupt: Add a kunit test

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
