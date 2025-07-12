Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE8A8460
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Jul 2025 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752316353; cv=none; b=oZTPxNWO5GROU18c6EsT3mxJRWZ1dlJXX1U8K5Gzp34EvkUqZczvuNbCbjAEAfgp2TZ3OZebfaRIs0UnegOjgHJEIX+pWz4rVDIezNKihItYxx4W1LmLwcopVWVnYYD5a93ARixHMF3784Xvpp1Oe5xjieWgSeTXYsS0JDA0m/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752316353; c=relaxed/simple;
	bh=IrLkbUBB8A4u9uOaTv99yZ9K2m1WZztk4+zw7yy5+FA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZsBK81qmxTp0jwRJ4F+cllnb4wP9savQ3Lq3ZaY+xTRWhp2jTRPvm7wLHlE/oJnjisWyVI3i2H81aBsBwV2ONEyl6M3jPhg7gKWUlnNxrQz2muiluBqzwbvccD+FEn0IrXxpht5uAY/OYZ7AK5gZG65WcCwvKmIWEQGTVp7uj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVTZvkt+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVTZvkt+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752316351; x=1783852351;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=IrLkbUBB8A4u9uOaTv99yZ9K2m1WZztk4+zw7yy5+FA=;
  b=kVTZvkt+ZKcmRkGrKwjluMP53DlQdFziOzKt/hEMlvYWtvxBeMdHX3N5
   STle5f3bcQ7yFKUh4z15LOKVRoUm6mVE6Bpm8xEDgT+LlT8/IDsbytB0R
   QvEk5CpwckrBIsVNhj2H3nUpDL6M10yeIARo0wM0RJl7ctGgwT7xBXv4C
   doKK0BqbvNTBqdPoSnTsGMuBuNulNfBxNH09iL1Vrak4vaeRAMQmXgCzu
   pembsntejhnRRh9CvSy2PKKvQOcduPTFkyg7lXuC0PUt98bXcdGkQ3IVB
   6zNCsDMQO3Ua38x0Z13dR9cU2vyiiwQAydzD8jdEQ30vbbXF18Z+M3peT
   Q==;
X-CSE-ConnectionGUID: K70fgwtmSMWd0hDL+iRH9Q==
X-CSE-MsgGUID: t3JwMq+8RAiHS3ELtjulXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65657817"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="65657817"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 03:32:31 -0700
X-CSE-ConnectionGUID: 99eOrDJ1SyiFFn+dX2ls9Q==
X-CSE-MsgGUID: AOhb6/RFQYSdkdlJlTkNmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="162119873"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Jul 2025 03:32:29 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaXWr-0007Gh-2m;
	Sat, 12 Jul 2025 10:32:25 +0000
Date: Sat, 12 Jul 2025 18:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: fdmanana@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] btrfs: remove btrfs_clear_extent_bits()
Message-ID: <202507121806.Bg9izQPc-lkp@intel.com>
References: <89e52089f6d6cb7b4dad233f30bf8d8ee8ea857c.1752224006.git.fdmanana@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89e52089f6d6cb7b4dad233f30bf8d8ee8ea857c.1752224006.git.fdmanana@suse.com>

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on linus/master v6.16-rc5 next-20250711]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/fdmanana-kernel-org/btrfs-remove-btrfs_clear_extent_bits/20250711-165842
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/89e52089f6d6cb7b4dad233f30bf8d8ee8ea857c.1752224006.git.fdmanana%40suse.com
patch subject: [PATCH] btrfs: remove btrfs_clear_extent_bits()
config: x86_64-randconfig-r111-20250712 (https://download.01.org/0day-ci/archive/20250712/202507121806.Bg9izQPc-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507121806.Bg9izQPc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507121806.Bg9izQPc-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/inode.c: In function 'fallback_to_cow':
>> fs/btrfs/inode.c:1757:25: error: implicit declaration of function 'btrfs_clear_extent_bits'; did you mean 'btrfs_clear_extent_bit'? [-Werror=implicit-function-declaration]
    1757 |                         btrfs_clear_extent_bits(io_tree, start, end, EXTENT_NORESERVE);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                         btrfs_clear_extent_bit
   cc1: some warnings being treated as errors


vim +1757 fs/btrfs/inode.c

42c01100096344 Naohiro Aota       2021-02-04  1695  
39bbc56a9cb135 Josef Bacik        2024-07-24  1696  static int fallback_to_cow(struct btrfs_inode *inode,
39bbc56a9cb135 Josef Bacik        2024-07-24  1697  			   struct folio *locked_folio, const u64 start,
39bbc56a9cb135 Josef Bacik        2024-07-24  1698  			   const u64 end)
467dc47ea99c56 Filipe Manana      2020-05-27  1699  {
8ba96f3dd6a0b2 Nikolay Borisov    2020-06-03  1700  	const bool is_space_ino = btrfs_is_free_space_inode(inode);
37f00a6d2e9c97 Johannes Thumshirn 2021-09-09  1701  	const bool is_reloc_ino = btrfs_is_data_reloc_root(inode->root);
2166e5edce9ac1 Filipe Manana      2020-05-27  1702  	const u64 range_bytes = end + 1 - start;
8ba96f3dd6a0b2 Nikolay Borisov    2020-06-03  1703  	struct extent_io_tree *io_tree = &inode->io_tree;
a0766d8f35d8c7 Josef Bacik        2024-02-12  1704  	struct extent_state *cached_state = NULL;
467dc47ea99c56 Filipe Manana      2020-05-27  1705  	u64 range_start = start;
467dc47ea99c56 Filipe Manana      2020-05-27  1706  	u64 count;
53ffb30a784d30 Christoph Hellwig  2023-06-28  1707  	int ret;
467dc47ea99c56 Filipe Manana      2020-05-27  1708  
467dc47ea99c56 Filipe Manana      2020-05-27  1709  	/*
467dc47ea99c56 Filipe Manana      2020-05-27  1710  	 * If EXTENT_NORESERVE is set it means that when the buffered write was
467dc47ea99c56 Filipe Manana      2020-05-27  1711  	 * made we had not enough available data space and therefore we did not
467dc47ea99c56 Filipe Manana      2020-05-27  1712  	 * reserve data space for it, since we though we could do NOCOW for the
467dc47ea99c56 Filipe Manana      2020-05-27  1713  	 * respective file range (either there is prealloc extent or the inode
467dc47ea99c56 Filipe Manana      2020-05-27  1714  	 * has the NOCOW bit set).
467dc47ea99c56 Filipe Manana      2020-05-27  1715  	 *
467dc47ea99c56 Filipe Manana      2020-05-27  1716  	 * However when we need to fallback to COW mode (because for example the
467dc47ea99c56 Filipe Manana      2020-05-27  1717  	 * block group for the corresponding extent was turned to RO mode by a
467dc47ea99c56 Filipe Manana      2020-05-27  1718  	 * scrub or relocation) we need to do the following:
467dc47ea99c56 Filipe Manana      2020-05-27  1719  	 *
467dc47ea99c56 Filipe Manana      2020-05-27  1720  	 * 1) We increment the bytes_may_use counter of the data space info.
467dc47ea99c56 Filipe Manana      2020-05-27  1721  	 *    If COW succeeds, it allocates a new data extent and after doing
467dc47ea99c56 Filipe Manana      2020-05-27  1722  	 *    that it decrements the space info's bytes_may_use counter and
467dc47ea99c56 Filipe Manana      2020-05-27  1723  	 *    increments its bytes_reserved counter by the same amount (we do
467dc47ea99c56 Filipe Manana      2020-05-27  1724  	 *    this at btrfs_add_reserved_bytes()). So we need to increment the
467dc47ea99c56 Filipe Manana      2020-05-27  1725  	 *    bytes_may_use counter to compensate (when space is reserved at
467dc47ea99c56 Filipe Manana      2020-05-27  1726  	 *    buffered write time, the bytes_may_use counter is incremented);
467dc47ea99c56 Filipe Manana      2020-05-27  1727  	 *
467dc47ea99c56 Filipe Manana      2020-05-27  1728  	 * 2) We clear the EXTENT_NORESERVE bit from the range. We do this so
467dc47ea99c56 Filipe Manana      2020-05-27  1729  	 *    that if the COW path fails for any reason, it decrements (through
467dc47ea99c56 Filipe Manana      2020-05-27  1730  	 *    extent_clear_unlock_delalloc()) the bytes_may_use counter of the
467dc47ea99c56 Filipe Manana      2020-05-27  1731  	 *    data space info, which we incremented in the step above.
2166e5edce9ac1 Filipe Manana      2020-05-27  1732  	 *
2166e5edce9ac1 Filipe Manana      2020-05-27  1733  	 * If we need to fallback to cow and the inode corresponds to a free
6bd335b469f945 Filipe Manana      2020-06-08  1734  	 * space cache inode or an inode of the data relocation tree, we must
6bd335b469f945 Filipe Manana      2020-06-08  1735  	 * also increment bytes_may_use of the data space_info for the same
6bd335b469f945 Filipe Manana      2020-06-08  1736  	 * reason. Space caches and relocated data extents always get a prealloc
2166e5edce9ac1 Filipe Manana      2020-05-27  1737  	 * extent for them, however scrub or balance may have set the block
6bd335b469f945 Filipe Manana      2020-06-08  1738  	 * group that contains that extent to RO mode and therefore force COW
6bd335b469f945 Filipe Manana      2020-06-08  1739  	 * when starting writeback.
467dc47ea99c56 Filipe Manana      2020-05-27  1740  	 */
242570e80bfdf3 Filipe Manana      2025-03-31  1741  	btrfs_lock_extent(io_tree, start, end, &cached_state);
f81c2aea711205 Filipe Manana      2025-04-04  1742  	count = btrfs_count_range_bits(io_tree, &range_start, end, range_bytes,
8c6e53a79d16b3 Filipe Manana      2022-11-11  1743  				       EXTENT_NORESERVE, 0, NULL);
6bd335b469f945 Filipe Manana      2020-06-08  1744  	if (count > 0 || is_space_ino || is_reloc_ino) {
6bd335b469f945 Filipe Manana      2020-06-08  1745  		u64 bytes = count;
8ba96f3dd6a0b2 Nikolay Borisov    2020-06-03  1746  		struct btrfs_fs_info *fs_info = inode->root->fs_info;
467dc47ea99c56 Filipe Manana      2020-05-27  1747  		struct btrfs_space_info *sinfo = fs_info->data_sinfo;
467dc47ea99c56 Filipe Manana      2020-05-27  1748  
6bd335b469f945 Filipe Manana      2020-06-08  1749  		if (is_space_ino || is_reloc_ino)
6bd335b469f945 Filipe Manana      2020-06-08  1750  			bytes = range_bytes;
6bd335b469f945 Filipe Manana      2020-06-08  1751  
467dc47ea99c56 Filipe Manana      2020-05-27  1752  		spin_lock(&sinfo->lock);
7de9ca1f30b700 Naohiro Aota       2024-11-14  1753  		btrfs_space_info_update_bytes_may_use(sinfo, bytes);
467dc47ea99c56 Filipe Manana      2020-05-27  1754  		spin_unlock(&sinfo->lock);
467dc47ea99c56 Filipe Manana      2020-05-27  1755  
2166e5edce9ac1 Filipe Manana      2020-05-27  1756  		if (count > 0)
9d222562b415f1 Filipe Manana      2025-04-02 @1757  			btrfs_clear_extent_bits(io_tree, start, end, EXTENT_NORESERVE);
467dc47ea99c56 Filipe Manana      2020-05-27  1758  	}
242570e80bfdf3 Filipe Manana      2025-03-31  1759  	btrfs_unlock_extent(io_tree, start, end, &cached_state);
467dc47ea99c56 Filipe Manana      2020-05-27  1760  
53ffb30a784d30 Christoph Hellwig  2023-06-28  1761  	/*
53ffb30a784d30 Christoph Hellwig  2023-06-28  1762  	 * Don't try to create inline extents, as a mix of inline extent that
53ffb30a784d30 Christoph Hellwig  2023-06-28  1763  	 * is written out and unlocked directly and a normal NOCOW extent
53ffb30a784d30 Christoph Hellwig  2023-06-28  1764  	 * doesn't work.
53ffb30a784d30 Christoph Hellwig  2023-06-28  1765  	 */
39bbc56a9cb135 Josef Bacik        2024-07-24  1766  	ret = cow_file_range(inode, locked_folio, start, end, NULL, false,
39bbc56a9cb135 Josef Bacik        2024-07-24  1767  			     true);
c56cbe90599338 Christoph Hellwig  2023-06-28  1768  	ASSERT(ret != 1);
53ffb30a784d30 Christoph Hellwig  2023-06-28  1769  	return ret;
467dc47ea99c56 Filipe Manana      2020-05-27  1770  }
467dc47ea99c56 Filipe Manana      2020-05-27  1771  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
