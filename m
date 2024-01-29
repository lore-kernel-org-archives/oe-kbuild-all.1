Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930403F9DC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 18:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706551875; cv=none; b=tgOqmi75mqoDD99aoT0sbs2J2bZlfj5sUsIdsMqo+PjQqpVR8MeG0+qDZk5rOugQPgq/2Q3HwnXgthJa9I9ECf7oSyYiobiJ1gsagZ7nI46Nn3w4+pe36j8lDV108QSXj4iEKuHDFYI9iAMha1wslDHeplCNVBcfSaqdIcgNGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706551875; c=relaxed/simple;
	bh=2ttaVUl89gj4/nH9tc2UEeTGPOZtslHd20Svzc1Yboc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jZtHMX3KL31rGFpR45ZyIbeJ+NnB0S3jnuSrIutYUul7g2epC161eI/+Ov3r9cp79/+DdPGr1ErmkvLAUwiPSU5VT45XHFIS0UhyEai/+HCnnnlZx+wI4NhBfwseuOkJitNdX7uJWojuC9V56ABYYPrHXVgMWuiFogqdAEqbFlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NhmmBGwG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NhmmBGwG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706551873; x=1738087873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ttaVUl89gj4/nH9tc2UEeTGPOZtslHd20Svzc1Yboc=;
  b=NhmmBGwGj0wkTc3SXt/41tWNEe5MkEp55Q8tTxI+ORxUHEuslbwIPeny
   as3Udsy1b02oHTRq7SC9KO3QaE0/euxJ5dIcd/pbYyf90VBmZosPOuzgT
   HDS+iVp9Zqk91qiCdLiCjsZdHT4CxWbPOHDbsGOlenDOmF8iMKAoYxKM9
   wqN22ujZHr94ZhP/BXpWoGaZ/pP3KaMrNWwARuEVs1dS75DhWKUftrCte
   YyKqJk2ZqtkJgpwU1z5lx8Hb+DAFUbVHP8YQSeZL/PC+sTHO75GfDbJfT
   6VSBnuP33lBlE7D2pkeL2YAwkvs9Ypt0bN6rXq2QhABPmJ7KRH0tPS8Yi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="9710161"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="9710161"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 10:08:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29873470"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2024 10:08:06 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUW39-0004W8-2W;
	Mon, 29 Jan 2024 18:08:03 +0000
Date: Tue, 30 Jan 2024 02:07:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:b4/vfs-bdev-file-bd_inode 35/37] fs/buffer.c:1700:
 warning: expecting prototype for clean_bdev_aliases(). Prototype was for
 __clean_bdev_aliases() instead
Message-ID: <202401300135.P2YK51lX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git b4/vfs-bdev-file-bd_inode
head:   92279a7f8c418cb71e6fb335e4af2c7565944a11
commit: d8db7fccf2cac31fb2021ddc1dc989d2c878099d [35/37] fs & block: remove bdev->bd_inode
config: arc-defconfig (https://download.01.org/0day-ci/archive/20240130/202401300135.P2YK51lX-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300135.P2YK51lX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401300135.P2YK51lX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/buffer.c:1700: warning: expecting prototype for clean_bdev_aliases(). Prototype was for __clean_bdev_aliases() instead


vim +1700 fs/buffer.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1678  
29f3ad7d838036 Jan Kara                2016-11-04  1679  /**
29f3ad7d838036 Jan Kara                2016-11-04  1680   * clean_bdev_aliases: clean a range of buffers in block device
29f3ad7d838036 Jan Kara                2016-11-04  1681   * @bdev: Block device to clean buffers in
29f3ad7d838036 Jan Kara                2016-11-04  1682   * @block: Start of a range of blocks to clean
29f3ad7d838036 Jan Kara                2016-11-04  1683   * @len: Number of blocks to clean
29f3ad7d838036 Jan Kara                2016-11-04  1684   *
29f3ad7d838036 Jan Kara                2016-11-04  1685   * We are taking a range of blocks for data and we don't want writeback of any
29f3ad7d838036 Jan Kara                2016-11-04  1686   * buffer-cache aliases starting from return from this function and until the
29f3ad7d838036 Jan Kara                2016-11-04  1687   * moment when something will explicitly mark the buffer dirty (hopefully that
29f3ad7d838036 Jan Kara                2016-11-04  1688   * will not happen until we will free that block ;-) We don't even need to mark
29f3ad7d838036 Jan Kara                2016-11-04  1689   * it not-uptodate - nobody can expect anything from a newly allocated buffer
29f3ad7d838036 Jan Kara                2016-11-04  1690   * anyway. We used to use unmap_buffer() for such invalidation, but that was
29f3ad7d838036 Jan Kara                2016-11-04  1691   * wrong. We definitely don't want to mark the alias unmapped, for example - it
29f3ad7d838036 Jan Kara                2016-11-04  1692   * would confuse anyone who might pick it with bread() afterwards...
29f3ad7d838036 Jan Kara                2016-11-04  1693   *
29f3ad7d838036 Jan Kara                2016-11-04  1694   * Also..  Note that bforget() doesn't lock the buffer.  So there can be
29f3ad7d838036 Jan Kara                2016-11-04  1695   * writeout I/O going on against recently-freed buffers.  We don't wait on that
29f3ad7d838036 Jan Kara                2016-11-04  1696   * I/O in bforget() - it's more efficient to wait on the I/O only if we really
29f3ad7d838036 Jan Kara                2016-11-04  1697   * need to.  That happens here.
29f3ad7d838036 Jan Kara                2016-11-04  1698   */
d8db7fccf2cac3 Christian Brauner       2024-01-28  1699  void __clean_bdev_aliases(struct block_device *bdev, sector_t block, sector_t len)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @1700  {
d8db7fccf2cac3 Christian Brauner       2024-01-28  1701  	struct inode *bd_inode = bdev_inode(bdev);
29f3ad7d838036 Jan Kara                2016-11-04  1702  	struct address_space *bd_mapping = bd_inode->i_mapping;
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1703) 	struct folio_batch fbatch;
4b04646caed544 Matthew Wilcox (Oracle  2023-11-09  1704) 	pgoff_t index = ((loff_t)block << bd_inode->i_blkbits) / PAGE_SIZE;
29f3ad7d838036 Jan Kara                2016-11-04  1705  	pgoff_t end;
c10f778ddfc161 Jan Kara                2017-09-06  1706  	int i, count;
29f3ad7d838036 Jan Kara                2016-11-04  1707  	struct buffer_head *bh;
29f3ad7d838036 Jan Kara                2016-11-04  1708  	struct buffer_head *head;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1709  
4b04646caed544 Matthew Wilcox (Oracle  2023-11-09  1710) 	end = ((loff_t)(block + len - 1) << bd_inode->i_blkbits) / PAGE_SIZE;
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1711) 	folio_batch_init(&fbatch);
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1712) 	while (filemap_get_folios(bd_mapping, &index, end, &fbatch)) {
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1713) 		count = folio_batch_count(&fbatch);
c10f778ddfc161 Jan Kara                2017-09-06  1714  		for (i = 0; i < count; i++) {
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1715) 			struct folio *folio = fbatch.folios[i];
^1da177e4c3f41 Linus Torvalds          2005-04-16  1716  
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1717) 			if (!folio_buffers(folio))
29f3ad7d838036 Jan Kara                2016-11-04  1718  				continue;
29f3ad7d838036 Jan Kara                2016-11-04  1719  			/*
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  1720) 			 * We use folio lock instead of bd_mapping->i_private_lock
29f3ad7d838036 Jan Kara                2016-11-04  1721  			 * to pin buffers here since we can afford to sleep and
29f3ad7d838036 Jan Kara                2016-11-04  1722  			 * it scales better than a global spinlock lock.
29f3ad7d838036 Jan Kara                2016-11-04  1723  			 */
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1724) 			folio_lock(folio);
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1725) 			/* Recheck when the folio is locked which pins bhs */
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1726) 			head = folio_buffers(folio);
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1727) 			if (!head)
29f3ad7d838036 Jan Kara                2016-11-04  1728  				goto unlock_page;
29f3ad7d838036 Jan Kara                2016-11-04  1729  			bh = head;
29f3ad7d838036 Jan Kara                2016-11-04  1730  			do {
6c006a9d94bfb5 Chandan Rajendra        2016-12-25  1731  				if (!buffer_mapped(bh) || (bh->b_blocknr < block))
29f3ad7d838036 Jan Kara                2016-11-04  1732  					goto next;
29f3ad7d838036 Jan Kara                2016-11-04  1733  				if (bh->b_blocknr >= block + len)
29f3ad7d838036 Jan Kara                2016-11-04  1734  					break;
29f3ad7d838036 Jan Kara                2016-11-04  1735  				clear_buffer_dirty(bh);
29f3ad7d838036 Jan Kara                2016-11-04  1736  				wait_on_buffer(bh);
29f3ad7d838036 Jan Kara                2016-11-04  1737  				clear_buffer_req(bh);
29f3ad7d838036 Jan Kara                2016-11-04  1738  next:
29f3ad7d838036 Jan Kara                2016-11-04  1739  				bh = bh->b_this_page;
29f3ad7d838036 Jan Kara                2016-11-04  1740  			} while (bh != head);
29f3ad7d838036 Jan Kara                2016-11-04  1741  unlock_page:
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1742) 			folio_unlock(folio);
29f3ad7d838036 Jan Kara                2016-11-04  1743  		}
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1744) 		folio_batch_release(&fbatch);
29f3ad7d838036 Jan Kara                2016-11-04  1745  		cond_resched();
c10f778ddfc161 Jan Kara                2017-09-06  1746  		/* End of range already reached? */
c10f778ddfc161 Jan Kara                2017-09-06  1747  		if (index > end || !index)
c10f778ddfc161 Jan Kara                2017-09-06  1748  			break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1749  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1750  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  1751  

:::::: The code at line 1700 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
