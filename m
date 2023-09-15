Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC30362
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 18:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694804273; x=1726340273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gxJ1xqDt0yC+Fb2bSeiEJcifFVyPjs5BxfcKtEnWkM=;
  b=TMwvpip85FTLGMq6bclTFR50x7mHEXWjDzjmI4/UzQctv0hnyZA4jaa7
   OxpqIMsjlKKBahiI21RboJWonUxX+bbcm6AjeWRk3DdrK6CAI1SlCbRT0
   SahW1u+qAFpMCzYOngQQ7Nx66kg4TDcjhhYCSEPIJJcMLFHs+cVtQKEvp
   VUYFDmvalbCo/Rkx/k6rD+AYHuAwTzYWcWIHvgvJNu4MfqcEIEPnaALqC
   CTt1hi82qv5jFcFC39IdqkYz7aC/b/FJeahu4nF/nA0jqvRm9D7JpTJPe
   NAY1AVgJB70dD+5LVfuGaPOcpRScH5t3EEcpkaRwzjXcG9HQnR2iHp1kh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="465680490"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="465680490"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 11:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="780204629"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="780204629"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Sep 2023 11:57:48 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhE0b-0003J2-2t;
	Fri, 15 Sep 2023 18:57:45 +0000
Date: Sat, 16 Sep 2023 02:56:46 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 8/9] lib/kunit_iov_iter.c:1425:39: sparse:
 sparse: incompatible types in comparison expression (different type sizes):
Message-ID: <202309160202.8L2ykNni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   75675904b940d8090d74bde195d8ba4a2e3aee80
commit: 66c3ce2ab3aba9d8976b0eb4f945a6a9d1526e49 [8/9] iov_iter: Add benchmarking kunit tests
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230916/202309160202.8L2ykNni-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160202.8L2ykNni-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160202.8L2ykNni-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/kunit_iov_iter.c:308:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *value @@     got unsigned char [noderef] [usertype] __user *const __ptr @@
   lib/kunit_iov_iter.c:308:9: sparse:     expected void const *value
   lib/kunit_iov_iter.c:308:9: sparse:     got unsigned char [noderef] [usertype] __user *const __ptr
>> lib/kunit_iov_iter.c:1425:39: sparse: sparse: incompatible types in comparison expression (different type sizes):
>> lib/kunit_iov_iter.c:1425:39: sparse:    unsigned int *
>> lib/kunit_iov_iter.c:1425:39: sparse:    unsigned long *

vim +1425 lib/kunit_iov_iter.c

  1395	
  1396	/*
  1397	 * Time copying 256MiB through an ITER_BVEC in 256 page chunks.
  1398	 */
  1399	static void __init iov_kunit_benchmark_bvec_split(struct kunit *test)
  1400	{
  1401		struct iov_iter iter;
  1402		struct bio_vec *bvec;
  1403		struct page *page;
  1404		unsigned int samples[IOV_KUNIT_NR_SAMPLES];
  1405		ktime_t a, b;
  1406		ssize_t copied;
  1407		size_t size, npages = 64;
  1408		void *scratch;
  1409		int i, j;
  1410	
  1411		/* Allocate a page and tile it repeatedly in the buffer. */
  1412		page = alloc_page(GFP_KERNEL);
  1413		KUNIT_ASSERT_NOT_NULL(test, page);
  1414		kunit_add_action_or_reset(test, iov_kunit_free_page, page);
  1415	
  1416		/* Create a single large buffer to copy to/from. */
  1417		scratch = iov_kunit_create_source(test, npages);
  1418	
  1419		/* Perform and time a bunch of copies. */
  1420		kunit_info(test, "Benchmarking copy_to_iter() over BVEC:\n");
  1421		for (i = 0; i < IOV_KUNIT_NR_SAMPLES; i++) {
  1422			size = 256 * 1024 * 1024;
  1423			a = ktime_get_real();
  1424			do {
> 1425				size_t part = min(size, npages * PAGE_SIZE);
  1426	
  1427				bvec = kunit_kmalloc_array(test, npages, sizeof(bvec[0]), GFP_KERNEL);
  1428				KUNIT_ASSERT_NOT_NULL(test, bvec);
  1429				for (j = 0; j < npages; j++)
  1430					bvec_set_page(&bvec[j], page, PAGE_SIZE, 0);
  1431	
  1432				iov_iter_bvec(&iter, ITER_DEST, bvec, npages, part);
  1433				copied = copy_to_iter(scratch, part, &iter);
  1434				KUNIT_EXPECT_EQ(test, copied, part);
  1435				size -= part;
  1436			} while (size > 0);
  1437			b = ktime_get_real();
  1438			samples[i] = ktime_to_us(ktime_sub(b, a));
  1439		}
  1440	
  1441		iov_kunit_benchmark_print_stats(test, samples);
  1442		KUNIT_SUCCEED();
  1443	}
  1444	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
