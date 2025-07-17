Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6223C18C31
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Jul 2025 17:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752771680; cv=none; b=dSnjNR1qS+dwXOJZeN/8PGcc0H0CA8MUHoZMrvX7wfw+qKxXDvSevELBNQ/IIBeF9/ndayic+QSGXgqXhj9IyVlFTMPC8kh4V3pWLlImVLx/tiYlbm3DsN9G4oCCe5tAjRLppMlvAs3ndt8Vc8IW2NrJxehQRZ8jZeEeDBpqVFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752771680; c=relaxed/simple;
	bh=moiNvqj8rnaGNl3O6hzNIBMKUF6ZhJ1u9aEvEq1rNZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iWV2TU9sp14Gj/DxbOl9f3YwVeNhEDc/fPxNftWVj13r5Mg5MQxKURPO/1ScTFgEw8emuV7dMd+SvpqW+8KGc8gIQngiNaJ2bEuV3lwB9NQpbDMba56m7kpzX9hmjpB9UURXw1H03kO7rRq/bbcU7Ef7PJs0CF89RmbozAtv1pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoQRYM8g; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoQRYM8g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752771678; x=1784307678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=moiNvqj8rnaGNl3O6hzNIBMKUF6ZhJ1u9aEvEq1rNZA=;
  b=CoQRYM8gxe+/iSWYxYv75ZSnFZpY+hbh7S4s5+QDcwWbRjZQiaQzdLoU
   VY26nuKiq4UuInRDHtIsWeq8q+jim5txyChV4CdBwblbNMNxFxrSx3hZ9
   P5/ScBHYU7ET77o7D+8XdDVRJS07WTYDPjpNB8ks05Oyo5vUXpnoMQqKY
   eJivw7bExUbj0HAnAEVxWxGlMfygAh2ptUhrclbtHrUN2/sVRhJ2ubPIO
   iHfqXwRQo9TTutTIZAA8hVtq2WBeyAdT+C3lQtdjIZeYBDRmyuSzH9JwT
   b7NSO22ow+i8X7qM0FA60Z2+VIhkGskokvXe/0p3fqIdwhyVqgSUVqS2b
   w==;
X-CSE-ConnectionGUID: QkGKCh6hRjWYtve+X7PbHw==
X-CSE-MsgGUID: e96QAv8STsuTF92dRLP2Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="65748738"
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="65748738"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 10:01:10 -0700
X-CSE-ConnectionGUID: crjw1lueSr6xu+rey1Sz8Q==
X-CSE-MsgGUID: U/PBOgMeTXyM1cH0kHT+zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,319,1744095600"; 
   d="scan'208";a="157234582"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2025 10:01:08 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucRyj-000Dr1-2g;
	Thu, 17 Jul 2025 17:01:05 +0000
Date: Fri, 18 Jul 2025 01:00:32 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 5/5] fs/f2fs/data.c:1597:51: error: 'map' is a
 pointer; did you mean to use '->'?
Message-ID: <202507180011.0xGXLBqu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   d98bac3cd94b6c0375a7b6e7728b8cf17cc080d0
commit: d98bac3cd94b6c0375a7b6e7728b8cf17cc080d0 [5/5] f2fs: fix to avoid redundant allocation for dio write
config: i386-buildonly-randconfig-002-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180011.0xGXLBqu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180011.0xGXLBqu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507180011.0xGXLBqu-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_map_blocks':
>> fs/f2fs/data.c:1597:51: error: 'map' is a pointer; did you mean to use '->'?
    1597 |                 !f2fs_is_pinned_file(inode) && map.m_last_pblk != blkaddr))) {
         |                                                   ^
         |                                                   ->
   fs/f2fs/data.c: In function 'f2fs_iomap_begin':
>> fs/f2fs/data.c:4213:40: warning: assignment to 'void *' from 'block_t' {aka 'unsigned int'} makes pointer from integer without a cast [-Wint-conversion]
    4213 |                         iomap->private = map.m_last_pblk;
         |                                        ^


vim +1597 fs/f2fs/data.c

  1523	
  1524	/*
  1525	 * f2fs_map_blocks() tries to find or build mapping relationship which
  1526	 * maps continuous logical blocks to physical blocks, and return such
  1527	 * info via f2fs_map_blocks structure.
  1528	 */
  1529	int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
  1530	{
  1531		unsigned int maxblocks = map->m_len;
  1532		struct dnode_of_data dn;
  1533		struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
  1534		int mode = map->m_may_create ? ALLOC_NODE : LOOKUP_NODE;
  1535		pgoff_t pgofs, end_offset, end;
  1536		int err = 0, ofs = 1;
  1537		unsigned int ofs_in_node, last_ofs_in_node;
  1538		blkcnt_t prealloc;
  1539		block_t blkaddr;
  1540		unsigned int start_pgofs;
  1541		int bidx = 0;
  1542		bool is_hole;
  1543		bool lfs_dio_write;
  1544	
  1545		if (!maxblocks)
  1546			return 0;
  1547	
  1548		lfs_dio_write = (flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
  1549					map->m_may_create);
  1550	
  1551		if (!map->m_may_create && f2fs_map_blocks_cached(inode, map, flag))
  1552			goto out;
  1553	
  1554		map->m_bdev = inode->i_sb->s_bdev;
  1555		map->m_multidev_dio =
  1556			f2fs_allow_multi_device_dio(F2FS_I_SB(inode), flag);
  1557	
  1558		map->m_len = 0;
  1559		map->m_flags = 0;
  1560	
  1561		/* it only supports block size == page size */
  1562		pgofs =	(pgoff_t)map->m_lblk;
  1563		end = pgofs + maxblocks;
  1564	
  1565	next_dnode:
  1566		if (map->m_may_create)
  1567			f2fs_map_lock(sbi, flag);
  1568	
  1569		/* When reading holes, we need its node page */
  1570		set_new_dnode(&dn, inode, NULL, NULL, 0);
  1571		err = f2fs_get_dnode_of_data(&dn, pgofs, mode);
  1572		if (err) {
  1573			if (flag == F2FS_GET_BLOCK_BMAP)
  1574				map->m_pblk = 0;
  1575			if (err == -ENOENT)
  1576				err = f2fs_map_no_dnode(inode, map, &dn, pgofs);
  1577			goto unlock_out;
  1578		}
  1579	
  1580		start_pgofs = pgofs;
  1581		prealloc = 0;
  1582		last_ofs_in_node = ofs_in_node = dn.ofs_in_node;
  1583		end_offset = ADDRS_PER_PAGE(dn.node_folio, inode);
  1584	
  1585	next_block:
  1586		blkaddr = f2fs_data_blkaddr(&dn);
  1587		is_hole = !__is_valid_data_blkaddr(blkaddr);
  1588		if (!is_hole &&
  1589		    !f2fs_is_valid_blkaddr(sbi, blkaddr, DATA_GENERIC_ENHANCE)) {
  1590			err = -EFSCORRUPTED;
  1591			goto sync_out;
  1592		}
  1593	
  1594		/* use out-place-update for direct IO under LFS mode */
  1595		if (map->m_may_create && (is_hole ||
  1596			(flag == F2FS_GET_BLOCK_DIO && f2fs_lfs_mode(sbi) &&
> 1597			!f2fs_is_pinned_file(inode) && map.m_last_pblk != blkaddr))) {
  1598			if (unlikely(f2fs_cp_error(sbi))) {
  1599				err = -EIO;
  1600				goto sync_out;
  1601			}
  1602	
  1603			switch (flag) {
  1604			case F2FS_GET_BLOCK_PRE_AIO:
  1605				if (blkaddr == NULL_ADDR) {
  1606					prealloc++;
  1607					last_ofs_in_node = dn.ofs_in_node;
  1608				}
  1609				break;
  1610			case F2FS_GET_BLOCK_PRE_DIO:
  1611			case F2FS_GET_BLOCK_DIO:
  1612				err = __allocate_data_block(&dn, map->m_seg_type);
  1613				if (err)
  1614					goto sync_out;
  1615				if (flag == F2FS_GET_BLOCK_PRE_DIO)
  1616					file_need_truncate(inode);
  1617				set_inode_flag(inode, FI_APPEND_WRITE);
  1618				break;
  1619			default:
  1620				WARN_ON_ONCE(1);
  1621				err = -EIO;
  1622				goto sync_out;
  1623			}
  1624	
  1625			blkaddr = dn.data_blkaddr;
  1626			if (is_hole)
  1627				map->m_flags |= F2FS_MAP_NEW;
  1628		} else if (is_hole) {
  1629			if (f2fs_compressed_file(inode) &&
  1630			    f2fs_sanity_check_cluster(&dn)) {
  1631				err = -EFSCORRUPTED;
  1632				f2fs_handle_error(sbi,
  1633						ERROR_CORRUPTED_CLUSTER);
  1634				goto sync_out;
  1635			}
  1636	
  1637			switch (flag) {
  1638			case F2FS_GET_BLOCK_PRECACHE:
  1639				goto sync_out;
  1640			case F2FS_GET_BLOCK_BMAP:
  1641				map->m_pblk = 0;
  1642				goto sync_out;
  1643			case F2FS_GET_BLOCK_FIEMAP:
  1644				if (blkaddr == NULL_ADDR) {
  1645					if (map->m_next_pgofs)
  1646						*map->m_next_pgofs = pgofs + 1;
  1647					goto sync_out;
  1648				}
  1649				break;
  1650			case F2FS_GET_BLOCK_DIO:
  1651				if (map->m_next_pgofs)
  1652					*map->m_next_pgofs = pgofs + 1;
  1653				break;
  1654			default:
  1655				/* for defragment case */
  1656				if (map->m_next_pgofs)
  1657					*map->m_next_pgofs = pgofs + 1;
  1658				goto sync_out;
  1659			}
  1660		}
  1661	
  1662		if (flag == F2FS_GET_BLOCK_PRE_AIO)
  1663			goto skip;
  1664	
  1665		if (map->m_multidev_dio)
  1666			bidx = f2fs_target_device_index(sbi, blkaddr);
  1667	
  1668		if (map->m_len == 0) {
  1669			/* reserved delalloc block should be mapped for fiemap. */
  1670			if (blkaddr == NEW_ADDR)
  1671				map->m_flags |= F2FS_MAP_DELALLOC;
  1672			/* DIO READ and hole case, should not map the blocks. */
  1673			if (!(flag == F2FS_GET_BLOCK_DIO && is_hole && !map->m_may_create))
  1674				map->m_flags |= F2FS_MAP_MAPPED;
  1675	
  1676			map->m_pblk = blkaddr;
  1677			map->m_len = 1;
  1678	
  1679			if (map->m_multidev_dio)
  1680				map->m_bdev = FDEV(bidx).bdev;
  1681	
  1682			if (lfs_dio_write)
  1683				map->m_last_pblk = NULL_ADDR;
  1684		} else if (map_is_mergeable(sbi, map, blkaddr, flag, bidx, ofs)) {
  1685			ofs++;
  1686			map->m_len++;
  1687		} else {
  1688			if (lfs_dio_write && !f2fs_is_pinned_file(inode))
  1689				map->m_last_pblk = blkaddr;
  1690			goto sync_out;
  1691		}
  1692	
  1693	skip:
  1694		dn.ofs_in_node++;
  1695		pgofs++;
  1696	
  1697		/* preallocate blocks in batch for one dnode page */
  1698		if (flag == F2FS_GET_BLOCK_PRE_AIO &&
  1699				(pgofs == end || dn.ofs_in_node == end_offset)) {
  1700	
  1701			dn.ofs_in_node = ofs_in_node;
  1702			err = f2fs_reserve_new_blocks(&dn, prealloc);
  1703			if (err)
  1704				goto sync_out;
  1705	
  1706			map->m_len += dn.ofs_in_node - ofs_in_node;
  1707			if (prealloc && dn.ofs_in_node != last_ofs_in_node + 1) {
  1708				err = -ENOSPC;
  1709				goto sync_out;
  1710			}
  1711			dn.ofs_in_node = end_offset;
  1712		}
  1713	
  1714		if (lfs_dio_write) {
  1715			/* the next block to be allocated may not be contiguous. */
  1716			if (GET_SEGOFF_FROM_SEG0(sbi, blkaddr) % BLKS_PER_SEC(sbi) ==
  1717			    CAP_BLKS_PER_SEC(sbi) - 1)
  1718				goto sync_out;
  1719		}
  1720	
  1721		if (pgofs >= end)
  1722			goto sync_out;
  1723		else if (dn.ofs_in_node < end_offset)
  1724			goto next_block;
  1725	
  1726		if (flag == F2FS_GET_BLOCK_PRECACHE) {
  1727			if (map->m_flags & F2FS_MAP_MAPPED) {
  1728				unsigned int ofs = start_pgofs - map->m_lblk;
  1729	
  1730				f2fs_update_read_extent_cache_range(&dn,
  1731					start_pgofs, map->m_pblk + ofs,
  1732					map->m_len - ofs);
  1733			}
  1734		}
  1735	
  1736		f2fs_put_dnode(&dn);
  1737	
  1738		if (map->m_may_create) {
  1739			f2fs_map_unlock(sbi, flag);
  1740			f2fs_balance_fs(sbi, dn.node_changed);
  1741		}
  1742		goto next_dnode;
  1743	
  1744	sync_out:
  1745	
  1746		if (flag == F2FS_GET_BLOCK_DIO && map->m_flags & F2FS_MAP_MAPPED) {
  1747			/*
  1748			 * for hardware encryption, but to avoid potential issue
  1749			 * in future
  1750			 */
  1751			f2fs_wait_on_block_writeback_range(inode,
  1752							map->m_pblk, map->m_len);
  1753	
  1754			if (map->m_multidev_dio) {
  1755				block_t blk_addr = map->m_pblk;
  1756	
  1757				bidx = f2fs_target_device_index(sbi, map->m_pblk);
  1758	
  1759				map->m_bdev = FDEV(bidx).bdev;
  1760				map->m_pblk -= FDEV(bidx).start_blk;
  1761	
  1762				if (map->m_may_create)
  1763					f2fs_update_device_state(sbi, inode->i_ino,
  1764								blk_addr, map->m_len);
  1765	
  1766				f2fs_bug_on(sbi, blk_addr + map->m_len >
  1767							FDEV(bidx).end_blk + 1);
  1768			}
  1769		}
  1770	
  1771		if (flag == F2FS_GET_BLOCK_PRECACHE) {
  1772			if (map->m_flags & F2FS_MAP_MAPPED) {
  1773				unsigned int ofs = start_pgofs - map->m_lblk;
  1774	
  1775				f2fs_update_read_extent_cache_range(&dn,
  1776					start_pgofs, map->m_pblk + ofs,
  1777					map->m_len - ofs);
  1778			}
  1779			if (map->m_next_extent)
  1780				*map->m_next_extent = pgofs + 1;
  1781		}
  1782		f2fs_put_dnode(&dn);
  1783	unlock_out:
  1784		if (map->m_may_create) {
  1785			f2fs_map_unlock(sbi, flag);
  1786			f2fs_balance_fs(sbi, dn.node_changed);
  1787		}
  1788	out:
  1789		trace_f2fs_map_blocks(inode, map, flag, err);
  1790		return err;
  1791	}
  1792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
