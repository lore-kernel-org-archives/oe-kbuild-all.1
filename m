Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E00519D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 00:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687481214; x=1719017214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dvzz32KbklB4mXDvyV0Ns/PtYr5kUiHgaObV5dOifE0=;
  b=hEZCcAZpvaKv3LLmXNb/gEBD8cMu3TcvTHRoOGpMCO+QaVj1FwepMZag
   f0EyoRnQu5F2bSj2UBFC4dykP6oZ9VUHF/dNdSzkSNibb6c9LpTq+EvDp
   sVsz+S3TMfnJOHtHPfdD3j/ool88lWECgQzLBgqbvyne8QczLC7G8KHBa
   CHHArGeenw0BLLCwDqgYX/CO1KDd20w+PKkNUzXs62ngaYMlB0QwS8btA
   LO2G5NXKH/gNC8RPK6SXfTjaHs/O9ODDn2k5TPq+bBFYAHPLxvoRpa5wp
   kQd6nlgpRY7dAYEFU/sQVzfZPQG1gUtCY+UqVkUPzUWg+WJb5XOaKqyr1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="360680551"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="360680551"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2023 17:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10749"; a="839258605"
X-IronPort-AV: E=Sophos;i="6.01,150,1684825200"; 
   d="scan'208";a="839258605"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 22 Jun 2023 17:46:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCUws-0007r9-1d;
	Fri, 23 Jun 2023 00:46:50 +0000
Date: Fri, 23 Jun 2023 08:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime.2 18/30] fs/gfs2/bmap.c:1389:43: error: 'struct
 inode' has no member named 'i_ctime'; did you mean 'i_atime'?
Message-ID: <202306230851.az5K2Uld-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime.2
head:   5b9567fb85f565a8040b60442ba1ab492f90f555
commit: 39526ea50940d2e1fb34b10cf70d775ecf32e684 [18/30] fs: rename i_ctime field to __i_ctime
config: microblaze-randconfig-r033-20230622 (https://download.01.org/0day-ci/archive/20230623/202306230851.az5K2Uld-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230623/202306230851.az5K2Uld-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306230851.az5K2Uld-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/gfs2/bmap.c: In function 'trunc_start':
>> fs/gfs2/bmap.c:1389:43: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1389 |         ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                                           ^~~~~~~
         |                                           i_atime
   fs/gfs2/bmap.c: In function 'sweep_bh_for_rgrps':
   fs/gfs2/bmap.c:1586:59: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1586 |                         ip->i_inode.i_mtime = ip->i_inode.i_ctime =
         |                                                           ^~~~~~~
         |                                                           i_atime
   fs/gfs2/bmap.c: In function 'punch_hole':
   fs/gfs2/bmap.c:1953:51: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1953 |                 ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                                                   ^~~~~~~
         |                                                   i_atime
   fs/gfs2/bmap.c: In function 'trunc_end':
   fs/gfs2/bmap.c:1996:43: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1996 |         ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                                           ^~~~~~~
         |                                           i_atime
   fs/gfs2/bmap.c: In function 'do_grow':
   fs/gfs2/bmap.c:2097:43: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    2097 |         ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                                           ^~~~~~~
         |                                           i_atime
--
   fs/gfs2/xattr.c: In function 'ea_dealloc_unstuffed':
>> fs/gfs2/xattr.c:314:21: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     314 |         ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                     ^~~~~~~
         |                     i_atime
   fs/gfs2/xattr.c: In function 'ea_alloc_skeleton':
   fs/gfs2/xattr.c:766:21: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     766 |         ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                     ^~~~~~~
         |                     i_atime
   fs/gfs2/xattr.c: In function 'ea_set_simple_noalloc':
   fs/gfs2/xattr.c:891:21: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     891 |         ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                     ^~~~~~~
         |                     i_atime
   fs/gfs2/xattr.c: In function 'ea_remove_stuffed':
   fs/gfs2/xattr.c:1109:21: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1109 |         ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                     ^~~~~~~
         |                     i_atime
--
   fs/gfs2/dir.c: In function 'gfs2_dir_write_stuffed':
>> fs/gfs2/dir.c:133:43: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     133 |         ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                                           ^~~~~~~
         |                                           i_atime
   fs/gfs2/dir.c: In function 'gfs2_dir_write_data':
   fs/gfs2/dir.c:230:43: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     230 |         ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
         |                                           ^~~~~~~
         |                                           i_atime
   fs/gfs2/dir.c: In function 'gfs2_dir_add':
   fs/gfs2/dir.c:1828:59: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1828 |                         ip->i_inode.i_mtime = ip->i_inode.i_ctime = tv;
         |                                                           ^~~~~~~
         |                                                           i_atime
   fs/gfs2/dir.c: In function 'gfs2_dir_del':
   fs/gfs2/dir.c:1913:45: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1913 |         dip->i_inode.i_mtime = dip->i_inode.i_ctime = tv;
         |                                             ^~~~~~~
         |                                             i_atime
   fs/gfs2/dir.c: In function 'gfs2_dir_mvino':
   fs/gfs2/dir.c:1954:45: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1954 |         dip->i_inode.i_mtime = dip->i_inode.i_ctime = current_time(&dip->i_inode);
         |                                             ^~~~~~~
         |                                             i_atime
--
   fs/hpfs/dir.c: In function 'hpfs_lookup':
>> fs/hpfs/dir.c:280:22: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     280 |         if (!result->i_ctime.tv_sec) {
         |                      ^~~~~~~
         |                      i_atime
   fs/hpfs/dir.c:281:31: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     281 |                 if (!(result->i_ctime.tv_sec = local_to_gmt(dir->i_sb, le32_to_cpu(de->creation_date))))
         |                               ^~~~~~~
         |                               i_atime
   fs/hpfs/dir.c:282:33: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     282 |                         result->i_ctime.tv_sec = 1;
         |                                 ^~~~~~~
         |                                 i_atime
   fs/hpfs/dir.c:283:25: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     283 |                 result->i_ctime.tv_nsec = 0;
         |                         ^~~~~~~
         |                         i_atime
--
   fs/ntfs3/inode.c: In function 'ntfs_read_mft':
>> fs/ntfs3/inode.c:172:49: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     172 |                 nt2kernel(std5->c_time, &inode->i_ctime);
         |                                                 ^~~~~~~
         |                                                 i_atime
   fs/ntfs3/inode.c: In function 'ntfs_write_end':
   fs/ntfs3/inode.c:961:32: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
     961 |                         inode->i_ctime = inode->i_mtime = current_time(inode);
         |                                ^~~~~~~
         |                                i_atime
   fs/ntfs3/inode.c: In function 'ntfs_create_inode':
   fs/ntfs3/inode.c:1662:50: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1662 |         inode->i_atime = inode->i_mtime = inode->i_ctime = dir->i_mtime =
         |                                                  ^~~~~~~
         |                                                  i_atime
   fs/ntfs3/inode.c:1663:22: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1663 |                 dir->i_ctime = ni->i_crtime;
         |                      ^~~~~~~
         |                      i_atime
   fs/ntfs3/inode.c: In function 'ntfs_unlink_inode':
   fs/ntfs3/inode.c:1769:37: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1769 |                 dir->i_mtime = dir->i_ctime = current_time(dir);
         |                                     ^~~~~~~
         |                                     i_atime
   fs/ntfs3/inode.c:1771:24: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1771 |                 inode->i_ctime = dir->i_ctime;
         |                        ^~~~~~~
         |                        i_atime
   fs/ntfs3/inode.c:1771:39: error: 'struct inode' has no member named 'i_ctime'; did you mean 'i_atime'?
    1771 |                 inode->i_ctime = dir->i_ctime;
         |                                       ^~~~~~~
         |                                       i_atime


vim +1389 fs/gfs2/bmap.c

fa731fc4e045a8 Steven Whitehouse   2012-11-13  1350  
8b5860a35c40b3 Andreas Gruenbacher 2017-12-12  1351  static int trunc_start(struct inode *inode, u64 newsize)
b3b94faa5fe596 David Teigland      2006-01-16  1352  {
ff8f33c8b30d7b Steven Whitehouse   2010-08-11  1353  	struct gfs2_inode *ip = GFS2_I(inode);
ff8f33c8b30d7b Steven Whitehouse   2010-08-11  1354  	struct gfs2_sbd *sdp = GFS2_SB(inode);
80990f404d2e55 Andreas Gruenbacher 2017-12-12  1355  	struct buffer_head *dibh = NULL;
b3b94faa5fe596 David Teigland      2006-01-16  1356  	int journaled = gfs2_is_jdata(ip);
8b5860a35c40b3 Andreas Gruenbacher 2017-12-12  1357  	u64 oldsize = inode->i_size;
b3b94faa5fe596 David Teigland      2006-01-16  1358  	int error;
b3b94faa5fe596 David Teigland      2006-01-16  1359  
70499cdfeb3625 Bob Peterson        2020-07-24  1360  	if (!gfs2_is_stuffed(ip)) {
70499cdfeb3625 Bob Peterson        2020-07-24  1361  		unsigned int blocksize = i_blocksize(inode);
70499cdfeb3625 Bob Peterson        2020-07-24  1362  		unsigned int offs = newsize & (blocksize - 1);
70499cdfeb3625 Bob Peterson        2020-07-24  1363  		if (offs) {
70499cdfeb3625 Bob Peterson        2020-07-24  1364  			error = gfs2_block_zero_range(inode, newsize,
70499cdfeb3625 Bob Peterson        2020-07-24  1365  						      blocksize - offs);
70499cdfeb3625 Bob Peterson        2020-07-24  1366  			if (error)
70499cdfeb3625 Bob Peterson        2020-07-24  1367  				return error;
70499cdfeb3625 Bob Peterson        2020-07-24  1368  		}
70499cdfeb3625 Bob Peterson        2020-07-24  1369  	}
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1370  	if (journaled)
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1371  		error = gfs2_trans_begin(sdp, RES_DINODE + RES_JDATA, GFS2_JTRUNC_REVOKES);
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1372  	else
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1373  		error = gfs2_trans_begin(sdp, RES_DINODE, 0);
b3b94faa5fe596 David Teigland      2006-01-16  1374  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1375  		return error;
b3b94faa5fe596 David Teigland      2006-01-16  1376  
b3b94faa5fe596 David Teigland      2006-01-16  1377  	error = gfs2_meta_inode_buffer(ip, &dibh);
b3b94faa5fe596 David Teigland      2006-01-16  1378  	if (error)
b3b94faa5fe596 David Teigland      2006-01-16  1379  		goto out;
b3b94faa5fe596 David Teigland      2006-01-16  1380  
350a9b0a7269c6 Steven Whitehouse   2012-12-14  1381  	gfs2_trans_add_meta(ip->i_gl, dibh);
ff8f33c8b30d7b Steven Whitehouse   2010-08-11  1382  
70499cdfeb3625 Bob Peterson        2020-07-24  1383  	if (gfs2_is_stuffed(ip))
ff8f33c8b30d7b Steven Whitehouse   2010-08-11  1384  		gfs2_buffer_clear_tail(dibh, sizeof(struct gfs2_dinode) + newsize);
70499cdfeb3625 Bob Peterson        2020-07-24  1385  	else
ff8f33c8b30d7b Steven Whitehouse   2010-08-11  1386  		ip->i_diskflags |= GFS2_DIF_TRUNC_IN_PROG;
b3b94faa5fe596 David Teigland      2006-01-16  1387  
ff8f33c8b30d7b Steven Whitehouse   2010-08-11  1388  	i_size_write(inode, newsize);
078cd8279e6599 Deepa Dinamani      2016-09-14 @1389  	ip->i_inode.i_mtime = ip->i_inode.i_ctime = current_time(&ip->i_inode);
539e5d6b7ae861 Steven Whitehouse   2006-10-31  1390  	gfs2_dinode_out(ip, dibh->b_data);
b3b94faa5fe596 David Teigland      2006-01-16  1391  
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1392  	if (journaled)
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1393  		error = gfs2_journaled_truncate(inode, oldsize, newsize);
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1394  	else
7caef26767c172 Kirill A. Shutemov  2013-09-12  1395  		truncate_pagecache(inode, newsize);
fa731fc4e045a8 Steven Whitehouse   2012-11-13  1396  
b3b94faa5fe596 David Teigland      2006-01-16  1397  out:
80990f404d2e55 Andreas Gruenbacher 2017-12-12  1398  	brelse(dibh);
80990f404d2e55 Andreas Gruenbacher 2017-12-12  1399  	if (current->journal_info)
b3b94faa5fe596 David Teigland      2006-01-16  1400  		gfs2_trans_end(sdp);
b3b94faa5fe596 David Teigland      2006-01-16  1401  	return error;
b3b94faa5fe596 David Teigland      2006-01-16  1402  }
b3b94faa5fe596 David Teigland      2006-01-16  1403  

:::::: The code at line 1389 was first introduced by commit
:::::: 078cd8279e659989b103359bb22373cc79445bde fs: Replace CURRENT_TIME with current_time() for inode timestamps

:::::: TO: Deepa Dinamani <deepa.kernel@gmail.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
