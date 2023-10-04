Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2CB2182AE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Oct 2023 14:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696429391; x=1727965391;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRQAqFCKQk1qSzEMVTU4fihtBerw8/+l9GPXjDFtqvs=;
  b=D3TNLqvRQ9DXuMxtXcWjEjTuitZS6wU3f3M1hg2Fb4vt71xFkfWkM9b4
   LgsDVJVqFXWX6JFs5zYkP5AU2GEZvHpSrjrSfNv75sY8rx0qOH+GB+pkR
   U9ocrU1jL34f9tp1EzsSFdQ2yUFrqt60yIXujEHEhuWMplkqTczNmyEFq
   3xGYrX2ry3tvr5Ghlc7CRfNCUh3/lOcDeoUI2IZAKc/1yGx+LOZB9cJFZ
   jy6eScE0t06zwDqqugRCS7PXIv7l4U74dGyO9G9VL+GZP3+b6Ci8TRImF
   k7FGaYlo7pvftgumMzZq0i/h3Brb8bBhzXdezgh79w3ImPOMYB9TTrsyH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386004373"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="386004373"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2023 07:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="728030480"
X-IronPort-AV: E=Sophos;i="6.03,200,1694761200"; 
   d="scan'208";a="728030480"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 04 Oct 2023 07:23:09 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qo2mJ-000KHc-0P;
	Wed, 04 Oct 2023 14:23:07 +0000
Date: Wed, 4 Oct 2023 22:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andreas Gruenbacher <agruenba@redhat.com>
Subject: [linux-next:master 9257/9570] fs/gfs2/super.c:1543:17: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202310042215.w9PG3Rqs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33b64befb1a28bca3f5a9ed9807d2f87e976c63a
commit: 0abd1557e21c617bd13fc18f7725fc6363c05913 [9257/9570] gfs2: fix an oops in gfs2_permission
config: i386-randconfig-061-20231004 (https://download.01.org/0day-ci/archive/20231004/202310042215.w9PG3Rqs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231004/202310042215.w9PG3Rqs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310042215.w9PG3Rqs-lkp@intel.com/

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
