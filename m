Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707F7426EB9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jun 2026 07:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780643541; cv=none; b=IpYrqMehJ31edAFXY6LeJkMeISMwYKsR0rkgWKVM+o0uBfDNn8ul4UbtcCVxnr23hq5aU80l3qAZPvVN3eVaugfqMENbB+d8F2Nc9GvaXfjx7SEgUge0+KSLhWYafSqXWa7Lpq2O7DYGp0pWPPsbyOo4+s4anP3GpF+1oxdLCEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780643541; c=relaxed/simple;
	bh=Fg8tfAf7OWfMWSKakx3UB71VKICbqtu9FMM8xvG38qg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nWf0I6mj7U4g9xDWrx+uL7Vds88so2buJ5C6VGClKoQUZD08KSsih9Pjer1xRAE6+Z4lvpZh+epN/65lKPzZ5faMSWttCvSbhOUF6tLs2MvQuFJL2Ji7ymhbkETybo0B0mR9lOYthqRu02gWL2oHhbJ4QiJJx8UoYyMS6+WDK1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lisO5q+S; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lisO5q+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780643541; x=1812179541;
  h=date:from:to:cc:subject:message-id;
  bh=Fg8tfAf7OWfMWSKakx3UB71VKICbqtu9FMM8xvG38qg=;
  b=lisO5q+ScnODyIrHYmuT3qdUXvl0fdxuq2GUw2Z+PiTMBW+UvMHvvedd
   LW73PqGD6UwDaTsIUvD++sPv3jnGinWZQdWkC5P64iGS5/jTM+yATFJFz
   7ysaDG6MQtQKNpctLOJ4KqF/5b/ljvpYdsftH/cNzl84KlIOm6MdZ2049
   PwmtmwUDTcwyYYRjUuD4N4nQEMYlfTP+nHjeaQ97n4XdwKjBQG7nCj/Zd
   LV9zLTMSI9wX3UbIb2e0yfq0LZWjM8JyXRGw9C4eSQK8Ug2zJ+9ykPr2O
   yzpqxq/i5yrODkJTp1q5u38+qWfOJtbYxe9JbDl8eI5MBt6s61e1EvNiS
   w==;
X-CSE-ConnectionGUID: dN0krxg6TIOKo2S89OLcMw==
X-CSE-MsgGUID: lOzqZSiIQ+SkELPz331B0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81456508"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="81456508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 00:12:21 -0700
X-CSE-ConnectionGUID: VVdGF+eWTle8yk+1F5Msmg==
X-CSE-MsgGUID: tg2tPzp1Rimjee1IdVg37w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; 
   d="scan'208";a="248702159"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Jun 2026 00:12:19 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVOj2-00000000Fee-0y2f;
	Fri, 05 Jun 2026 07:12:16 +0000
Date: Fri, 05 Jun 2026 15:11:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-08 3/3]
 lib/kunit_iov_iter.c:265:16: warning: variable 'b' set but not used
Message-ID: <202606051530.MZrUuPx1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-08
head:   68c2e470be3043e4f1e58736d4a20702f28a26e1
commit: 2d71340ff1d41a5b9fc1b30ded12d638b2e2ae96 [3/3] iov_iter: Kunit tests for copying to/from an iterator
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260605/202606051530.MZrUuPx1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606051530.MZrUuPx1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2d71340ff1d4 ("iov_iter: Kunit tests for copying to/from an iterator")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606051530.MZrUuPx1-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/kunit_iov_iter.c: In function 'iov_kunit_copy_to_bvec':
>> lib/kunit_iov_iter.c:265:16: warning: variable 'b' set but not used [-Wunused-but-set-variable=]
     265 |         int i, b, patt;
         |                ^


vim +/b +265 lib/kunit_iov_iter.c

   253	
   254	/*
   255	 * Test copying to a ITER_BVEC-type iterator.
   256	 */
   257	static void __init iov_kunit_copy_to_bvec(struct kunit *test)
   258	{
   259		const struct bvec_test_range *pr;
   260		struct iov_iter iter;
   261		struct bio_vec bvec[8];
   262		struct page **spages, **bpages;
   263		u8 *scratch, *buffer;
   264		size_t bufsize, npages, size, copied;
 > 265		int i, b, patt;
   266	
   267		bufsize = 0x100000;
   268		npages = bufsize / PAGE_SIZE;
   269	
   270		scratch = iov_kunit_create_buffer(test, &spages, npages);
   271		for (i = 0; i < bufsize; i++)
   272			scratch[i] = pattern(i);
   273	
   274		buffer = iov_kunit_create_buffer(test, &bpages, npages);
   275		memset(buffer, 0, bufsize);
   276	
   277		iov_kunit_load_bvec(test, &iter, READ, bvec, ARRAY_SIZE(bvec),
   278				    bpages, npages, bufsize, bvec_test_ranges);
   279		size = iter.count;
   280	
   281		copied = copy_to_iter(scratch, size, &iter);
   282	
   283		KUNIT_EXPECT_EQ(test, copied, size);
   284		KUNIT_EXPECT_EQ(test, iter.count, 0);
   285		KUNIT_EXPECT_EQ(test, iter.nr_segs, 0);
   286	
   287		/* Build the expected image in the scratch buffer. */
   288		b = 0;
   289		patt = 0;
   290		memset(scratch, 0, bufsize);
   291		for (pr = bvec_test_ranges; pr->from >= 0; pr++, b++) {
   292			u8 *p = scratch + pr->page * PAGE_SIZE;
   293	
   294			for (i = pr->from; i < pr->to; i++)
   295				p[i] = pattern(patt++);
   296		}
   297	
   298		/* Compare the images */
   299		for (i = 0; i < bufsize; i++) {
   300			KUNIT_EXPECT_EQ_MSG(test, buffer[i], scratch[i], "at i=%x", i);
   301			if (buffer[i] != scratch[i])
   302				return;
   303		}
   304	
   305		KUNIT_SUCCEED();
   306	}
   307	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
