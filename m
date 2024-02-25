Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D2624
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Feb 2024 00:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708819670; cv=none; b=mRugbpqAJ0tibiITeFv0hW0L2tdEJXp9hz79gKleK8ugk4Kqyw4Y28eisRORQllG3gNu5L9NlzVA6d53lXfxtJ0tWPyn4dwwChfvFCTovggIWDsAYyn/RBWX52x6WolFlt+r5xJcWlzrsKCDax9ViAfLMY+V23mgRY1Gnl8AObY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708819670; c=relaxed/simple;
	bh=Z/yjYQtQqfOFWyxOtgya2JQZ7a7qYeb7gyEB1pg/N48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lDm1TOfC5poYIhOSN0ibwQAVeTMe8q79iDnr979dVvgR8Hh2WMHHfaZAWqenHPPhGekriU/aaYub8ryYbfIJH1m208YeCNKeEw02KaJR9T/K7h9mrSy0sClgte2tdd89qV7OwwsafBvlf7LBApPeW6pqAC40AMLjwDlp/uE4F2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBHQ0onr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBHQ0onr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708819668; x=1740355668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Z/yjYQtQqfOFWyxOtgya2JQZ7a7qYeb7gyEB1pg/N48=;
  b=kBHQ0onrfbLp4LxNJWjLKZJL1h5X7Pte549QsNmou211nQJGYcqJ9beu
   HcRQqXoyjGpkGjlZT06zlEqlo770xYQRIvvnBS3Yhun+eyrDQREBtpP8Z
   Qj4nJ8rPZHunDOi7x9ULKqn35Mq0IB5kcv2PVO//DmqeFe3UhJ45vzC1H
   mcmAB0OQ55O/1t/CI6Czx8o4YV+NKHgm3ywm49soVVu4HCmfC5lG55APG
   CVCbh78U2Qb04Y7NJAriVYqL4F9NdwPl16YFZI8lUYZ3KyPPupMQR9/Q4
   2jjw9CqgkAtypuMuBYFjX4vGSuX3/MTDP7n7JjnIJqqQHBHPqUXfItFg7
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10994"; a="20576329"
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="20576329"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2024 16:07:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,182,1705392000"; 
   d="scan'208";a="11071136"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 24 Feb 2024 16:07:46 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1re23T-000924-0r;
	Sun, 25 Feb 2024 00:07:43 +0000
Date: Sun, 25 Feb 2024 08:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v4 linux-next 19/19] fs & block: remove bdev->bd_inode
Message-ID: <202402250747.57bivGGZ-lkp@intel.com>
References: <20240222124555.2049140-20-yukuai1@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222124555.2049140-20-yukuai1@huaweicloud.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on next-20240221]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/block-move-two-helpers-into-bdev-c/20240222-205510
base:   next-20240221
patch link:    https://lore.kernel.org/r/20240222124555.2049140-20-yukuai1%40huaweicloud.com
patch subject: [RFC v4 linux-next 19/19] fs & block: remove bdev->bd_inode
config: i386-buildonly-randconfig-002-20240225 (https://download.01.org/0day-ci/archive/20240225/202402250747.57bivGGZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240225/202402250747.57bivGGZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402250747.57bivGGZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/buffer.c:1702: warning: Function parameter or struct member 'bd_inode' not described in '__clean_bdev_aliases'
>> fs/buffer.c:1702: warning: Excess function parameter 'inode' description in '__clean_bdev_aliases'


vim +1702 fs/buffer.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  1680  
29f3ad7d838036 Jan Kara                2016-11-04  1681  /**
666c7b98061c32 Yu Kuai                 2024-02-22  1682   * __clean_bdev_aliases: clean a range of buffers in block device
666c7b98061c32 Yu Kuai                 2024-02-22  1683   * @inode: Block device inode to clean buffers in
29f3ad7d838036 Jan Kara                2016-11-04  1684   * @block: Start of a range of blocks to clean
29f3ad7d838036 Jan Kara                2016-11-04  1685   * @len: Number of blocks to clean
29f3ad7d838036 Jan Kara                2016-11-04  1686   *
29f3ad7d838036 Jan Kara                2016-11-04  1687   * We are taking a range of blocks for data and we don't want writeback of any
29f3ad7d838036 Jan Kara                2016-11-04  1688   * buffer-cache aliases starting from return from this function and until the
29f3ad7d838036 Jan Kara                2016-11-04  1689   * moment when something will explicitly mark the buffer dirty (hopefully that
29f3ad7d838036 Jan Kara                2016-11-04  1690   * will not happen until we will free that block ;-) We don't even need to mark
29f3ad7d838036 Jan Kara                2016-11-04  1691   * it not-uptodate - nobody can expect anything from a newly allocated buffer
29f3ad7d838036 Jan Kara                2016-11-04  1692   * anyway. We used to use unmap_buffer() for such invalidation, but that was
29f3ad7d838036 Jan Kara                2016-11-04  1693   * wrong. We definitely don't want to mark the alias unmapped, for example - it
29f3ad7d838036 Jan Kara                2016-11-04  1694   * would confuse anyone who might pick it with bread() afterwards...
29f3ad7d838036 Jan Kara                2016-11-04  1695   *
29f3ad7d838036 Jan Kara                2016-11-04  1696   * Also..  Note that bforget() doesn't lock the buffer.  So there can be
29f3ad7d838036 Jan Kara                2016-11-04  1697   * writeout I/O going on against recently-freed buffers.  We don't wait on that
29f3ad7d838036 Jan Kara                2016-11-04  1698   * I/O in bforget() - it's more efficient to wait on the I/O only if we really
29f3ad7d838036 Jan Kara                2016-11-04  1699   * need to.  That happens here.
29f3ad7d838036 Jan Kara                2016-11-04  1700   */
666c7b98061c32 Yu Kuai                 2024-02-22  1701  void __clean_bdev_aliases(struct inode *bd_inode, sector_t block, sector_t len)
^1da177e4c3f41 Linus Torvalds          2005-04-16 @1702  {
29f3ad7d838036 Jan Kara                2016-11-04  1703  	struct address_space *bd_mapping = bd_inode->i_mapping;
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1704) 	struct folio_batch fbatch;
4b04646caed544 Matthew Wilcox (Oracle  2023-11-09  1705) 	pgoff_t index = ((loff_t)block << bd_inode->i_blkbits) / PAGE_SIZE;
29f3ad7d838036 Jan Kara                2016-11-04  1706  	pgoff_t end;
c10f778ddfc161 Jan Kara                2017-09-06  1707  	int i, count;
29f3ad7d838036 Jan Kara                2016-11-04  1708  	struct buffer_head *bh;
29f3ad7d838036 Jan Kara                2016-11-04  1709  	struct buffer_head *head;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1710  
4b04646caed544 Matthew Wilcox (Oracle  2023-11-09  1711) 	end = ((loff_t)(block + len - 1) << bd_inode->i_blkbits) / PAGE_SIZE;
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1712) 	folio_batch_init(&fbatch);
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1713) 	while (filemap_get_folios(bd_mapping, &index, end, &fbatch)) {
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1714) 		count = folio_batch_count(&fbatch);
c10f778ddfc161 Jan Kara                2017-09-06  1715  		for (i = 0; i < count; i++) {
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1716) 			struct folio *folio = fbatch.folios[i];
^1da177e4c3f41 Linus Torvalds          2005-04-16  1717  
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1718) 			if (!folio_buffers(folio))
29f3ad7d838036 Jan Kara                2016-11-04  1719  				continue;
29f3ad7d838036 Jan Kara                2016-11-04  1720  			/*
600f111ef51dc2 Matthew Wilcox (Oracle  2023-11-17  1721) 			 * We use folio lock instead of bd_mapping->i_private_lock
29f3ad7d838036 Jan Kara                2016-11-04  1722  			 * to pin buffers here since we can afford to sleep and
29f3ad7d838036 Jan Kara                2016-11-04  1723  			 * it scales better than a global spinlock lock.
29f3ad7d838036 Jan Kara                2016-11-04  1724  			 */
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1725) 			folio_lock(folio);
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1726) 			/* Recheck when the folio is locked which pins bhs */
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1727) 			head = folio_buffers(folio);
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1728) 			if (!head)
29f3ad7d838036 Jan Kara                2016-11-04  1729  				goto unlock_page;
29f3ad7d838036 Jan Kara                2016-11-04  1730  			bh = head;
29f3ad7d838036 Jan Kara                2016-11-04  1731  			do {
6c006a9d94bfb5 Chandan Rajendra        2016-12-25  1732  				if (!buffer_mapped(bh) || (bh->b_blocknr < block))
29f3ad7d838036 Jan Kara                2016-11-04  1733  					goto next;
29f3ad7d838036 Jan Kara                2016-11-04  1734  				if (bh->b_blocknr >= block + len)
29f3ad7d838036 Jan Kara                2016-11-04  1735  					break;
29f3ad7d838036 Jan Kara                2016-11-04  1736  				clear_buffer_dirty(bh);
29f3ad7d838036 Jan Kara                2016-11-04  1737  				wait_on_buffer(bh);
29f3ad7d838036 Jan Kara                2016-11-04  1738  				clear_buffer_req(bh);
29f3ad7d838036 Jan Kara                2016-11-04  1739  next:
29f3ad7d838036 Jan Kara                2016-11-04  1740  				bh = bh->b_this_page;
29f3ad7d838036 Jan Kara                2016-11-04  1741  			} while (bh != head);
29f3ad7d838036 Jan Kara                2016-11-04  1742  unlock_page:
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1743) 			folio_unlock(folio);
29f3ad7d838036 Jan Kara                2016-11-04  1744  		}
9e0b6f31bae664 Matthew Wilcox (Oracle  2022-06-04  1745) 		folio_batch_release(&fbatch);
29f3ad7d838036 Jan Kara                2016-11-04  1746  		cond_resched();
c10f778ddfc161 Jan Kara                2017-09-06  1747  		/* End of range already reached? */
c10f778ddfc161 Jan Kara                2017-09-06  1748  		if (index > end || !index)
c10f778ddfc161 Jan Kara                2017-09-06  1749  			break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  1750  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  1751  }
666c7b98061c32 Yu Kuai                 2024-02-22  1752  EXPORT_SYMBOL(__clean_bdev_aliases);
^1da177e4c3f41 Linus Torvalds          2005-04-16  1753  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
