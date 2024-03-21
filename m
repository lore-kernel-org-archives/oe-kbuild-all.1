Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46196762F9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 12:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711023649; cv=none; b=HU9hFaLM5gECRpRnPaTFQbLcpLAPFWAFXaQdUZIz4MESxEbWmYBeztVD62R551pXESxzNktkbKYZKOeCBxdOtzezttQpyiCsc50tyYr1x3xX0ZSh5jBOLKiIkDcW4jPKgzWU2LSw8Ly696Yy8BoIYEsJMlo6gJiCJPXnpuUBJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711023649; c=relaxed/simple;
	bh=nfwT0VFinhQwUq/QwYyobpawwQhHpzRlb4Mr9c5jN1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t7P1lMP40P7V22bnKXvBE52H11rrYhSpAfrIITrpSvJWzGduWWxznbujTugfJQXSPrl4Rnk/OEYxUbd25NjmacUOOoLBk4N/IQORqFA9IU0uAxxPVjxxnASI/RfInKxDttr6pvN8u+6hKtwJhAWtAuMBuUIjgN/6WWb0z3WV0gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIt6+TSH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIt6+TSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711023647; x=1742559647;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nfwT0VFinhQwUq/QwYyobpawwQhHpzRlb4Mr9c5jN1w=;
  b=EIt6+TSHsaLcZFXx0WBNCZai6Nbd6eocaNaTo8C0dHtTzlJ7nG4LSKqp
   15QTNcLIltB2fcb6UNILbyDDKgemPOR2UqQ1zP5edHaqUH5sx/ShsqZ7N
   6p31clUp2BNOAR8RgpTh1FDg+3r9aBRL8T8nW6G+VRR1uuRfZvnpRrkAE
   U85+LhiDdjeXZypmf5FYt6P+Z+eltpbtan/8mYCb8s6AFNEZgD6718ak5
   IfxWJCTLyh2y+EVBeT98V7KZ7Lp3gPHTjDHwd4sVd8Ohf7sOiTttfAgDJ
   MRCeIuFPW9NuADp5P5RF6H7GH8I7x6BWG9M9ekU/Uo/aKSPPYsobZTur1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="5838861"
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="5838861"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 05:20:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,142,1708416000"; 
   d="scan'208";a="14524623"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 Mar 2024 05:20:45 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnHPX-000JPD-08;
	Thu, 21 Mar 2024 12:20:43 +0000
Date: Thu, 21 Mar 2024 20:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:twf-hoist 568/627] fs/iomap/buffered-io.c:432:10: error:
 call to undeclared function 'iomap_fsverity_read_bio_alloc'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202403212019.bdKTaW1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git twf-hoist
head:   709c2aed7586c3ac6a9d636355c623611d5c14d1
commit: f0f93bf8ee6030bdb20d406b20b6632cac7aa8bc [568/627] iomap: dynamically allocate fsverity bioset
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240321/202403212019.bdKTaW1M-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403212019.bdKTaW1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403212019.bdKTaW1M-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/iomap/buffered-io.c:6:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/s390/include/asm/elf.h:173:
   In file included from arch/s390/include/asm/mmu_context.h:11:
   In file included from arch/s390/include/asm/pgalloc.h:18:
   In file included from include/linux/mm.h:2188:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> fs/iomap/buffered-io.c:432:10: error: call to undeclared function 'iomap_fsverity_read_bio_alloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     432 |                 return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
         |                        ^
   fs/iomap/buffered-io.c:432:10: note: did you mean 'iomap_read_bio_alloc'?
   fs/iomap/buffered-io.c:426:20: note: 'iomap_read_bio_alloc' declared here
     426 | static struct bio *iomap_read_bio_alloc(struct inode *inode,
         |                    ^
     427 |                 struct block_device *bdev, int nr_vecs, gfp_t gfp)
     428 | {
     429 |         struct bio *bio;
     430 | 
     431 |         if (fsverity_active(inode))
     432 |                 return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
         |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        iomap_read_bio_alloc
>> fs/iomap/buffered-io.c:432:10: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct bio *' [-Wint-conversion]
     432 |                 return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/iomap_fsverity_read_bio_alloc +432 fs/iomap/buffered-io.c

   425	
   426	static struct bio *iomap_read_bio_alloc(struct inode *inode,
   427			struct block_device *bdev, int nr_vecs, gfp_t gfp)
   428	{
   429		struct bio *bio;
   430	
   431		if (fsverity_active(inode))
 > 432			return iomap_fsverity_read_bio_alloc(inode, bdev, nr_vecs, gfp);
   433	
   434		bio = bio_alloc(bdev, nr_vecs, REQ_OP_READ, gfp);
   435		if (bio)
   436			bio->bi_end_io = iomap_read_end_io;
   437		return bio;
   438	}
   439	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
