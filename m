Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1ADA5E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Sep 2023 11:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696072606; x=1727608606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IxnXdl/v4x+wx6Sn6gueAlUCbS9FsEzW5zfLxdxOBvM=;
  b=kP2MBz1G+iGhcKAWe4sYvGoC3bh2nlWGtvoyyuXh20jFFfWN3c4hhkc3
   vVrvDBm4iMO4lOa0pI9lPua9dHrnoy9QOXJ1Pk+sj3QoDtNObPZsDwgO0
   4MmFRQETkb24EBagtXF8i3lYQx8cGhcUamqg0uWVh/VS0K6Wuod65lzK3
   m0frz+ppYvMEuP+GrHYT0eYa/shhwHpir0jTe9wX2OtWT+o5V8RBsG6Us
   ylizDrQiB0s3QYKg7tuYouAPRFidfR5mRvQLv94Kw+1Slrwj3GF9wxmo4
   9Xo0Gn0W1DCLhVfAOpEw2RhX6j66FuV3i0ZSaUqOuCFYFg0Td7LPcQgsE
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="362695855"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="362695855"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2023 04:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10848"; a="753622785"
X-IronPort-AV: E=Sophos;i="6.03,190,1694761200"; 
   d="scan'208";a="753622785"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Sep 2023 04:16:42 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qmXxg-00044X-1z;
	Sat, 30 Sep 2023 11:16:40 +0000
Date: Sat, 30 Sep 2023 19:16:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 16747/28554] htmldocs:
 ./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.
Message-ID: <202309301910.t808lkP2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jaegeuk,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   a1b9dbe5628adf6bc61b5bb150dd2fb2b286fda0
commit: 7a42ec4d9dae843ce99a9ee771d13c67084f2435 [16747/28554] Revert "Revert "fs: Enable bmap() function to properly return errors""
reproduce: (https://download.01.org/0day-ci/archive/20230930/202309301910.t808lkP2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309301910.t808lkP2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> ./fs/inode.c:1609: WARNING: Inline emphasis start-string without end-string.

vim +1609 ./fs/inode.c

  1602	
  1603	#ifdef CONFIG_BLOCK
  1604	/**
  1605	 *	bmap	- find a block number in a file
  1606	 *	@inode:  inode owning the block number being requested
  1607	 *	@block: pointer containing the block to find
  1608	 *
> 1609	 *	Replaces the value in *block with the block number on the device holding
  1610	 *	corresponding to the requested block number in the file.
  1611	 *	That is, asked for block 4 of inode 1 the function will replace the
  1612	 *	4 in *block, with disk block relative to the disk start that holds that
  1613	 *	block of the file.
  1614	 *
  1615	 *	Returns -EINVAL in case of error, 0 otherwise. If mapping falls into a
  1616	 *	hole, returns 0 and *block is also set to 0.
  1617	 */
  1618	int bmap(struct inode *inode, sector_t *block)
  1619	{
  1620		if (!inode->i_mapping->a_ops->bmap)
  1621			return -EINVAL;
  1622	
  1623		*block = inode->i_mapping->a_ops->bmap(inode->i_mapping, *block);
  1624		return 0;
  1625	}
  1626	EXPORT_SYMBOL(bmap);
  1627	#endif
  1628	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
