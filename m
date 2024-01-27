Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D462200A4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 23:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706397008; cv=none; b=sg0+KMKmov69knQewiaYuATUVmZabiHQbDoin9kxlhGSnLvbZqSm68KOO8Fj3SyAW2DLv6iEr4m2wkA9FldvvMP7dMopYjpNu6DlW12UWymYfY4dkPX8+824vWrufxLn+C36LkELBnW1RPvCZQob9vvuo64Wij3+/0YePC1YZs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706397008; c=relaxed/simple;
	bh=BY84zmG2LG0fqTQghZlXCQwTl1kvgKCv/JdfLS21AhQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i72rBSwQRsssJMnTm0K6oDyooRgqmTh6Mf/wBPW7G6Nck1VG7tKGDJNPrqPkolp6kZ9ggdZ32SD8Ypf+dwvOTchZnyD4FszUBccIJ1ux6qdQODzWv+LXmVY0idOZ4LtjSco6UtNBB9NXbweEcXCpb25YlSe5vbogesQkSdKuNZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aD5jes03; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aD5jes03"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706397006; x=1737933006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BY84zmG2LG0fqTQghZlXCQwTl1kvgKCv/JdfLS21AhQ=;
  b=aD5jes03bUP3S25GeWk6SuxrG4X8GjooJoqhwBdNfqu4mDpoyk/vvEH0
   89YnSxxq66I/ZoYfDv/V3OekIBErRoy+VFnCHr+fat8UGjTU+GJULGFNE
   kokSfkc4uHvzIHCo71MyIiVPRPmPs65iePQRcqedXvzikYIAM/6DlKIbq
   bxRndhsL14DT8Gc+lOT2MYGY74r1I4Ji0BXOdwj4opFtBt9gkSdtb4Fzt
   TEZyKng8+wZOEDNHClCMMk1FZaPUEkmUXKupUETbm9aYTvymsZcJaJ8lx
   l+CwdCmWMysSuEKLn0iV7GHKIrRV+Qg7C8nLgTY5uIHcy+/k7vaa/cRu8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="10102947"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="10102947"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 15:10:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="21711412"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Jan 2024 15:10:04 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTroI-0002q0-1M;
	Sat, 27 Jan 2024 23:10:02 +0000
Date: Sun, 28 Jan 2024 07:09:25 +0800
From: kernel test robot <lkp@intel.com>
To: Goldwyn Rodrigues <rgoldwyn@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [goldwynr:buffered.46 19/90] block/fops.c:477:1: warning: control
 reaches end of non-void function
Message-ID: <202401280757.M98xzccp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/goldwynr/linux buffered.46
head:   9b93fddebc916105169c8a82d8f3f20fb30ff277
commit: a6554d1f87d5da065aa8aaedaca6b46e2c474e19 [19/90] iomap: Introduce iomap_read_folio_ops
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240128/202401280757.M98xzccp-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280757.M98xzccp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280757.M98xzccp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   block/fops.c: In function 'blkdev_read_folio':
   block/fops.c:476:16: error: too few arguments to function 'iomap_read_folio'
     476 |         return iomap_read_folio(folio, &blkdev_iomap_ops);
         |                ^~~~~~~~~~~~~~~~
   In file included from block/fops.c:18:
   include/linux/iomap.h:273:5: note: declared here
     273 | int iomap_read_folio(struct folio *folio, const struct iomap_ops *ops,
         |     ^~~~~~~~~~~~~~~~
   block/fops.c: In function 'blkdev_readahead':
   block/fops.c:481:9: error: too few arguments to function 'iomap_readahead'
     481 |         iomap_readahead(rac, &blkdev_iomap_ops);
         |         ^~~~~~~~~~~~~~~
   include/linux/iomap.h:275:6: note: declared here
     275 | void iomap_readahead(struct readahead_control *, const struct iomap_ops *ops,
         |      ^~~~~~~~~~~~~~~
   block/fops.c: In function 'blkdev_read_folio':
>> block/fops.c:477:1: warning: control reaches end of non-void function [-Wreturn-type]
     477 | }
         | ^


vim +477 block/fops.c

cd82cca7ebfe9c Christoph Hellwig       2021-09-07  461  
cd82cca7ebfe9c Christoph Hellwig       2021-09-07  462  const struct address_space_operations def_blk_aops = {
e621900ad28b74 Matthew Wilcox (Oracle  2022-02-09  463) 	.dirty_folio	= block_dirty_folio,
7ba13abbd31ee9 Matthew Wilcox (Oracle  2022-02-09  464) 	.invalidate_folio = block_invalidate_folio,
2c69e2057962b6 Matthew Wilcox (Oracle  2022-04-29  465) 	.read_folio	= blkdev_read_folio,
cd82cca7ebfe9c Christoph Hellwig       2021-09-07  466  	.readahead	= blkdev_readahead,
17bf23a981be9c Matthew Wilcox (Oracle  2023-12-15  467) 	.writepages	= blkdev_writepages,
cd82cca7ebfe9c Christoph Hellwig       2021-09-07  468  	.write_begin	= blkdev_write_begin,
cd82cca7ebfe9c Christoph Hellwig       2021-09-07  469  	.write_end	= blkdev_write_end,
67235182a41c1b Matthew Wilcox (Oracle  2022-06-06  470) 	.migrate_folio	= buffer_migrate_folio_norefs,
cd82cca7ebfe9c Christoph Hellwig       2021-09-07  471  	.is_dirty_writeback = buffer_check_dirty_writeback,
cd82cca7ebfe9c Christoph Hellwig       2021-09-07  472  };
925c86a19bacf8 Christoph Hellwig       2023-08-01  473  #else /* CONFIG_BUFFER_HEAD */
925c86a19bacf8 Christoph Hellwig       2023-08-01  474  static int blkdev_read_folio(struct file *file, struct folio *folio)
925c86a19bacf8 Christoph Hellwig       2023-08-01  475  {
925c86a19bacf8 Christoph Hellwig       2023-08-01  476  	return iomap_read_folio(folio, &blkdev_iomap_ops);
925c86a19bacf8 Christoph Hellwig       2023-08-01 @477  }
925c86a19bacf8 Christoph Hellwig       2023-08-01  478  
925c86a19bacf8 Christoph Hellwig       2023-08-01  479  static void blkdev_readahead(struct readahead_control *rac)
925c86a19bacf8 Christoph Hellwig       2023-08-01  480  {
925c86a19bacf8 Christoph Hellwig       2023-08-01 @481  	iomap_readahead(rac, &blkdev_iomap_ops);
925c86a19bacf8 Christoph Hellwig       2023-08-01  482  }
925c86a19bacf8 Christoph Hellwig       2023-08-01  483  

:::::: The code at line 477 was first introduced by commit
:::::: 925c86a19bacf8ce10eb666328fb3fa5aff7b951 fs: add CONFIG_BUFFER_HEAD

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
