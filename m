Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CB238DF0
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Oct 2023 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L3+6+zg6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696884738; x=1728420738;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yLL2OpOz1+ng7aWdfmNZhfK1lB48o/eDTvtcUFkCV7E=;
  b=L3+6+zg6YInhknqCHY4GN97wZHAGwSjNfAT+6pZbSq7Uaps2RpZNvwzP
   qV+fTUDyviVXgJem5o+ZFpIF1NL3nSrB1DQUBCL+0W8GvImEOxFWw2kn2
   VgFLRt5acnhg4W4edqlmqACyVNS8kDimyHqySYIE9zNMFmxfF6kSzPTwB
   TW0x0o7F5N1DvlHcglnyxpMM0I5DXdSZzA2+Nz/rTO3D6oenRXoKVCgxs
   zSAcKjj0yQnmIlpCfEIlYAi53/cjUPMhFCj/on8HeRCv9gUV2RsOCItUF
   C7bQHG1N2ggyfFb38nkjRN8wZj4ZUdQ573/LScsLTEQNYpd9D+1gRfjPW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="364533436"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="364533436"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 13:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="1000358192"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="1000358192"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Oct 2023 13:51:45 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qpxE7-0000fC-2Y;
	Mon, 09 Oct 2023 20:51:43 +0000
Date: Tue, 10 Oct 2023 04:50:49 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andreas Gruenbacher <agruenba@redhat.com>
Subject: [linux-next:master 8423/10591] fs/gfs2/super.c:1543:17: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202310100411.oohUU8df-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a860505b617cf8fda4ebff6cf05d3f774145440
commit: 0abd1557e21c617bd13fc18f7725fc6363c05913 [8423/10591] gfs2: fix an oops in gfs2_permission
config: i386-randconfig-061-20231004 (https://download.01.org/0day-ci/archive/20231010/202310100411.oohUU8df-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310100411.oohUU8df-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310100411.oohUU8df-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/gfs2/super.c:1569:13: sparse: sparse: function 'free_local_statfs_inodes' with external linkage has definition
   fs/gfs2/super.c:1584:21: sparse: sparse: function 'find_local_statfs_inode' with external linkage has definition
>> fs/gfs2/super.c:1543:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/gfs2/super.c:1543:17: sparse:    struct gfs2_glock [noderef] __rcu *
>> fs/gfs2/super.c:1543:17: sparse:    struct gfs2_glock *
--
>> fs/gfs2/inode.c:1876:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
>> fs/gfs2/inode.c:1876:14: sparse:    struct gfs2_glock [noderef] __rcu *
>> fs/gfs2/inode.c:1876:14: sparse:    struct gfs2_glock *

vim +1543 fs/gfs2/super.c

  1464	
  1465	/**
  1466	 * gfs2_evict_inode - Remove an inode from cache
  1467	 * @inode: The inode to evict
  1468	 *
  1469	 * There are three cases to consider:
  1470	 * 1. i_nlink == 0, we are final opener (and must deallocate)
  1471	 * 2. i_nlink == 0, we are not the final opener (and cannot deallocate)
  1472	 * 3. i_nlink > 0
  1473	 *
  1474	 * If the fs is read only, then we have to treat all cases as per #3
  1475	 * since we are unable to do any deallocation. The inode will be
  1476	 * deallocated by the next read/write node to attempt an allocation
  1477	 * in the same resource group
  1478	 *
  1479	 * We have to (at the moment) hold the inodes main lock to cover
  1480	 * the gap between unlocking the shared lock on the iopen lock and
  1481	 * taking the exclusive lock. I'd rather do a shared -> exclusive
  1482	 * conversion on the iopen lock, but we can change that later. This
  1483	 * is safe, just less efficient.
  1484	 */
  1485	
  1486	static void gfs2_evict_inode(struct inode *inode)
  1487	{
  1488		struct super_block *sb = inode->i_sb;
  1489		struct gfs2_sbd *sdp = sb->s_fs_info;
  1490		struct gfs2_inode *ip = GFS2_I(inode);
  1491		struct gfs2_holder gh;
  1492		int ret;
  1493	
  1494		if (inode->i_nlink || sb_rdonly(sb) || !ip->i_no_addr)
  1495			goto out;
  1496	
  1497		/*
  1498		 * In case of an incomplete mount, gfs2_evict_inode() may be called for
  1499		 * system files without having an active journal to write to.  In that
  1500		 * case, skip the filesystem evict.
  1501		 */
  1502		if (!sdp->sd_jdesc)
  1503			goto out;
  1504	
  1505		gfs2_holder_mark_uninitialized(&gh);
  1506		ret = evict_should_delete(inode, &gh);
  1507		if (ret == SHOULD_DEFER_EVICTION)
  1508			goto out;
  1509		if (ret == SHOULD_DELETE_DINODE)
  1510			ret = evict_unlinked_inode(inode);
  1511		else
  1512			ret = evict_linked_inode(inode);
  1513	
  1514		if (gfs2_rs_active(&ip->i_res))
  1515			gfs2_rs_deltree(&ip->i_res);
  1516	
  1517		if (gfs2_holder_initialized(&gh))
  1518			gfs2_glock_dq_uninit(&gh);
  1519		if (ret && ret != GLR_TRYFAILED && ret != -EROFS)
  1520			fs_warn(sdp, "gfs2_evict_inode: %d\n", ret);
  1521	out:
  1522		truncate_inode_pages_final(&inode->i_data);
  1523		if (ip->i_qadata)
  1524			gfs2_assert_warn(sdp, ip->i_qadata->qa_ref == 0);
  1525		gfs2_rs_deltree(&ip->i_res);
  1526		gfs2_ordered_del_inode(ip);
  1527		clear_inode(inode);
  1528		gfs2_dir_hash_inval(ip);
  1529		if (gfs2_holder_initialized(&ip->i_iopen_gh)) {
  1530			struct gfs2_glock *gl = ip->i_iopen_gh.gh_gl;
  1531	
  1532			glock_clear_object(gl, ip);
  1533			gfs2_glock_hold(gl);
  1534			ip->i_iopen_gh.gh_flags |= GL_NOCACHE;
  1535			gfs2_glock_dq_uninit(&ip->i_iopen_gh);
  1536			gfs2_glock_put_eventually(gl);
  1537		}
  1538		if (ip->i_gl) {
  1539			glock_clear_object(ip->i_gl, ip);
  1540			wait_on_bit_io(&ip->i_flags, GIF_GLOP_PENDING, TASK_UNINTERRUPTIBLE);
  1541			gfs2_glock_add_to_lru(ip->i_gl);
  1542			gfs2_glock_put_eventually(ip->i_gl);
> 1543			rcu_assign_pointer(ip->i_gl, NULL);
  1544		}
  1545	}
  1546	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
