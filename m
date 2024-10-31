Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3285319994A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 13:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730381481; cv=none; b=OfB441V/gczOrJ6bSHaovyyuSz6p3V73T+Gt6ox4RNAF8s/JZMeYW1zIGqZSivtXbALRAQtHKvRPD1MsCrzQstwrpzei89B/UlnQJ0rjPWSIZ4P/FrnmDc71lDsWswi4CfEmOcoPMxJUYzQPRQBJ8MMLPtjCmV6o2n43StFHCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730381481; c=relaxed/simple;
	bh=uaZ333seDowyWNSanDslvXeZwOBXTcSnys0LAqOkTXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kQz8UMGJk0L8tzjL/mLRSVqBCFftOnATFPF37a3fdk6lPIK8TP94xWnAaQSTDIFI7c51muo8RjME8HCAEeAaxxZROSyNUiWhIJ/6b9Qdh5URO/FwgU18FQ0pgPhU/fwN8wO38OmY289onACqZBnNFBgtzfJ/VcnjHcbEtPDIaqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+aWpZlR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+aWpZlR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730381478; x=1761917478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uaZ333seDowyWNSanDslvXeZwOBXTcSnys0LAqOkTXc=;
  b=k+aWpZlRlzHKZ0Gh9cL/s5Prb+PfokubCT3Hwsn8gZouM8Rcl39wyQdP
   kN3ETzgE51bpLzCiC+SgdSBDsS4hAdAUKNrQNlWzMU39D8G2BmPTBaWkR
   sF3qDtO7zyaILbuPJMIKH1HtmJaBXQESB/xi5g/Ktg2isrUA46UdJdi4E
   O6/nrmFLm+dg5prIUCQBFnLQCUaopq6w1evTGm8pFaIPJgevFlE6kv0gd
   0wydXeRQ7dbELXzssLiLDG1N/Jo4wBJavQkvH7Ilns/ACsx3/6kZHOdIt
   NMD3E/ib0n4gnCYdglqvbj6/JQQHWDiLJMR40q6/J842w+Hn6GzUhOlj1
   w==;
X-CSE-ConnectionGUID: 6a7lhfNSQcmInbB3/s7FGg==
X-CSE-MsgGUID: rWId1P/hQtqiUkqFVF2FQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11242"; a="41486252"
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="41486252"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2024 06:31:17 -0700
X-CSE-ConnectionGUID: hgR3W903Qk6r4j6ChFSOKA==
X-CSE-MsgGUID: RRrwiEU5QdWiInqovlWrQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,247,1725346800"; 
   d="scan'208";a="82536562"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Oct 2024 06:31:17 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6VGb-000g8Q-2v;
	Thu, 31 Oct 2024 13:31:13 +0000
Date: Thu, 31 Oct 2024 21:30:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 49/53] drivers/md/md-bitmap.c:2847:34: warning:
 result of comparison of constant 4294967296 with expression of type
 'unsigned long' is always false
Message-ID: <202410312149.CnMhtyI7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   feb9371f18af51326c82c6d16cacb9db79717f98
commit: 8b88887562ef99311b5d6846095076ef74d3870f [49/53] block: add a public bdev_zone_is_seq helper
config: i386-defconfig (https://download.01.org/0day-ci/archive/20241031/202410312149.CnMhtyI7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410312149.CnMhtyI7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410312149.CnMhtyI7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/md/md-bitmap.c:19:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/cacheflush.h:5:
   In file included from arch/x86/include/asm/cacheflush.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/md/md-bitmap.c:19:
   include/linux/blkdev.h:1390:13: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1390 |         if (!disk->conv_zones_bitmap)
         |              ~~~~  ^
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:45:37: note: expanded from macro 'bitop'
      45 |           __builtin_constant_p((uintptr_t)(addr) != (uintptr_t)NULL) && \
         |                                            ^~~~
   In file included from drivers/md/md-bitmap.c:19:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:46:16: note: expanded from macro 'bitop'
      46 |           (uintptr_t)(addr) != (uintptr_t)NULL &&                       \
         |                       ^~~~
   In file included from drivers/md/md-bitmap.c:19:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:47:50: note: expanded from macro 'bitop'
      47 |           __builtin_constant_p(*(const unsigned long *)(addr))) ?       \
         |                                                         ^~~~
   In file included from drivers/md/md-bitmap.c:19:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:17: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                        ^~~~
   In file included from drivers/md/md-bitmap.c:19:
   include/linux/blkdev.h:1392:53: error: no member named 'conv_zones_bitmap' in 'struct gendisk'
    1392 |         return !test_bit(disk_zone_no(disk, sector), disk->conv_zones_bitmap);
         |                                                      ~~~~  ^
   include/linux/bitops.h:61:50: note: expanded from macro 'test_bit'
      61 | #define test_bit(nr, addr)              bitop(_test_bit, nr, addr)
         |                                                              ^~~~
   include/linux/bitops.h:48:32: note: expanded from macro 'bitop'
      48 |          const##op(nr, addr) : op(nr, addr))
         |                                       ^~~~
>> drivers/md/md-bitmap.c:2847:34: warning: result of comparison of constant 4294967296 with expression of type 'unsigned long' is always false [-Wtautological-constant-out-of-range-compare]
    2847 |         if (BITS_PER_LONG > 32 && csize >= (1ULL << (BITS_PER_BYTE *
         |                                   ~~~~~ ^  ~~~~~~~~~~~~~~~~~~~~~~~~~
    2848 |                 sizeof(((bitmap_super_t *)0)->chunksize))))
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings and 6 errors generated.


vim +2847 drivers/md/md-bitmap.c

43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2832  
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2833  static ssize_t
fd01b88c75a7180 drivers/md/bitmap.c    NeilBrown             2011-10-11  2834  chunksize_store(struct mddev *mddev, const char *buf, size_t len)
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2835  {
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2836  	/* Can only be changed when no bitmap is active */
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2837  	int rv;
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2838  	unsigned long csize;
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2839  	if (mddev->bitmap)
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2840  		return -EBUSY;
b29bebd66dbd492 drivers/md/bitmap.c    Jingoo Han            2013-06-01  2841  	rv = kstrtoul(buf, 10, &csize);
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2842  	if (rv)
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2843  		return rv;
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2844  	if (csize < 512 ||
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2845  	    !is_power_of_2(csize))
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2846  		return -EINVAL;
4555211190798b6 drivers/md/md-bitmap.c Florian-Ewald Mueller 2022-10-25 @2847  	if (BITS_PER_LONG > 32 && csize >= (1ULL << (BITS_PER_BYTE *
4555211190798b6 drivers/md/md-bitmap.c Florian-Ewald Mueller 2022-10-25  2848  		sizeof(((bitmap_super_t *)0)->chunksize))))
4555211190798b6 drivers/md/md-bitmap.c Florian-Ewald Mueller 2022-10-25  2849  		return -EOVERFLOW;
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2850  	mddev->bitmap_info.chunksize = csize;
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2851  	return len;
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2852  }
43a705076e51c5a drivers/md/bitmap.c    NeilBrown             2009-12-14  2853  

:::::: The code at line 2847 was first introduced by commit
:::::: 4555211190798b6b6fa2c37667d175bf67945c78 md/bitmap: Fix bitmap chunk size overflow issues

:::::: TO: Florian-Ewald Mueller <florian-ewald.mueller@ionos.com>
:::::: CC: Song Liu <song@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
