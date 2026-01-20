Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD413A963C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 09:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768900315; cv=none; b=FRCvRcx/1uofptLP4DAUMixdwYfHL+Fxre2dBHn9aQ3+7u+lK4pycy13G7nT7WZ7AogOhr3YW6A2SELagJ69LLn2N/tptL5BeuchBT/Icllu5nuOeYvp42sWb8icvTo4f4zQhWwOHDj1BwLLw7Yqt7zdl7U7GVxK2k7kWORqedg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768900315; c=relaxed/simple;
	bh=JrxKwrQLyzmRYseDka1fCr4Iiio7LvUtqyZYyMLehRQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JroVb9CbMQ8wnAiZ82k+GZZJ6FtZ8sSh1D6V0Wi9OpYTYviXHnAjVe0T9fayoqAYgfivSq69Dd2D7Qnmc+d66jBmRZpAPbCZKoOkzQY2xDlUmEZgS2OQvEeomGQxieBgZnkPO6lG0j+dJ8K/8RD0LyTRGnmU+bHSNbP9kuswZFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VPZT8G/z; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VPZT8G/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768900313; x=1800436313;
  h=date:from:to:cc:subject:message-id;
  bh=JrxKwrQLyzmRYseDka1fCr4Iiio7LvUtqyZYyMLehRQ=;
  b=VPZT8G/zVR0WGt8VmhGwBTCqLsvMYXk//7aPeDuJ+mjVRQHqye2jmphQ
   MKSgYmPcvUrMFKBlsIJDEehRMQFfgtRyWtPkH7Lek2qXMxIsdtsVPllrH
   wBCpu6rPK/ul3B1txqrEYXHVHkGTFSxanBQOBL/jcbIMn0sYRUU/ZX5Wd
   nGWGVjnVEzNpX2MSgCorxfVOR7tt/Zllsl9Uesw2ObxGI2xdYZ0dB162z
   3sx9hGfzj6bUy0Faecs3hiZ2TZbuNM9y010CLKHZHhSBFTAKuMq5Qe2db
   r4usY3JsCZG9zfMp4ax+YxgNsnT/rvKv4opK2OCvHEzynf2ALhbaQ5HFa
   A==;
X-CSE-ConnectionGUID: jZPWsOWnQ+2zlGPFNsSs6A==
X-CSE-MsgGUID: eSFlCzshTXOLlql+dugF7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="80825468"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="80825468"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 01:11:53 -0800
X-CSE-ConnectionGUID: 91CWJxYbSkaohD/2HqzpPg==
X-CSE-MsgGUID: na7nsREnRH6LNQ3vRqS1uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206119638"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 20 Jan 2026 01:11:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi7m7-00000000Ol3-09ML;
	Tue, 20 Jan 2026 09:11:47 +0000
Date: Tue, 20 Jan 2026 17:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 418/422] fs/orangefs/file.c:414:9: sparse:
 sparse: dereference of noderef expression
Message-ID: <202601201701.IhxeGffs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   e4348a62bb1acacafcdeb149c9363291fae08c0c
commit: ccbdd8044f13617fe9f2bce61aed556314544664 [418/422] mm: update all remaining mmap_prepare users to use vma_flags_t
config: arm-randconfig-r131-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201701.IhxeGffs-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201701.IhxeGffs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201701.IhxeGffs-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/orangefs/file.c:414:9: sparse: sparse: dereference of noderef expression
   fs/orangefs/file.c: note: in included file (through arch/arm/include/asm/cacheflush.h, include/linux/cacheflush.h, include/linux/highmem.h, ...):
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1199:46: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1199:46: sparse: sparse: dereference of noderef expression
   fs/orangefs/file.c:415:9: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1216:48: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1216:48: sparse: sparse: dereference of noderef expression
--
>> fs/ramfs/file-nommu.c:267:40: sparse: sparse: dereference of noderef expression
>> fs/ramfs/file-nommu.c:267:40: sparse: sparse: dereference of noderef expression
   fs/ramfs/file-nommu.c: note: in included file:
   include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1954:16: sparse: sparse: dereference of noderef expression
   include/linux/mm.h:1048:16: sparse: sparse: dereference of noderef expression

vim +414 fs/orangefs/file.c

   397	
   398	/*
   399	 * Memory map a region of a file.
   400	 */
   401	static int orangefs_file_mmap_prepare(struct vm_area_desc *desc)
   402	{
   403		struct file *file = desc->file;
   404		int ret;
   405	
   406		ret = orangefs_revalidate_mapping(file_inode(file));
   407		if (ret)
   408			return ret;
   409	
   410		gossip_debug(GOSSIP_FILE_DEBUG,
   411			     "orangefs_file_mmap: called on %pD\n", file);
   412	
   413		/* set the sequential readahead hint */
 > 414		vma_desc_set_flags(desc, VMA_SEQ_READ_BIT);
   415		vma_desc_clear_flags(desc, VMA_RAND_READ_BIT);
   416	
   417		file_accessed(file);
   418		desc->vm_ops = &orangefs_file_vm_ops;
   419		return 0;
   420	}
   421	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
