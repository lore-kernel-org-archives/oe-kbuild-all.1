Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FB4376F1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 21:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733088991; cv=none; b=tpvATGP4LT9bLEW4jXllAwIyvO+68dpp/1BXJrQBS0eGF+W8QrmsJhSlT354dUXFCQBXsUw0czkqwcCLif1DDRw05BX887PCk5BWeH+Afprvlwol0KDg5ScvX5YRwtMmKNHEtZPv36p3rTCDuZY/eHfX/5LD2l6QBt4tMpTXxTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733088991; c=relaxed/simple;
	bh=sUsuOsRuIbG5Ef7yk1eIIuQpHnuWS/D4486onkw5rvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxnxfLHEA1dhtzbi5KhansQV9he/b7Cxpg6FjdLwySjUTH6lLgwGHFptzrKs7pl58R3qsdTyPEIL0mupw1AJNX3ewK8Ml1iLZ99UjsF81T+aetbjaIHa2iTJQRgw7+B9mgElkyHlXvUpDP9Z1M3W6UYHu0e2p2e1EYanHhgrID8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfbSPWGt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfbSPWGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733088989; x=1764624989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sUsuOsRuIbG5Ef7yk1eIIuQpHnuWS/D4486onkw5rvw=;
  b=AfbSPWGt3H/0xPRIYbXGwT4P1OIDQsDFExXDoyPTdqVxL9+wopOLFdHK
   6goaaPP5QHFJoaIbk+UhU6RuPV7VXPK3gCMS+sKO/vcBZV+ysOHWqQ+t/
   JJCRPU521hhmeAFvcUEvOU8JN4OCZ849t7pQjoEtB0bCyBtCtlGyDaRjl
   Pc45TX6rMcXtjj2VDo75vJFl6azUEzbSODHfTQaa93YO7xbpkl75dIpSa
   0jecmtHdRfdTJDAhbJqWNCrr5CROLQE2pN3eG50q220EtltuEf39x38O4
   PelZHwMFIAe490CKKzv0m+3fYXbZiVretET2KZo+FUFxbP3AaeEXVU1YC
   A==;
X-CSE-ConnectionGUID: kOrIIGftQk6mG9eckGI0Qw==
X-CSE-MsgGUID: x/Ua6mClTp+s6T1ZAa8rEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="37190530"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="37190530"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 13:36:28 -0800
X-CSE-ConnectionGUID: 8mlITNljT+2+XCfiN4CSPw==
X-CSE-MsgGUID: kRPkzlyTTKCBKMgtxm0GNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93315989"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 01 Dec 2024 13:36:28 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHrc8-0001rp-2s;
	Sun, 01 Dec 2024 21:36:24 +0000
Date: Mon, 2 Dec 2024 05:35:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1298/1298] fs/gfs2/bmap.c:960:31:
 warning: 'lblock' may be used uninitialized
Message-ID: <202412020544.XfPLNgzY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andreas,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 484798bc8218ce6a0f8269675897b870a12c49e2 [1298/1298] gfs2: gfs2_walk_metadata fix
config: x86_64-buildonly-randconfig-006-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020544.XfPLNgzY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020544.XfPLNgzY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020544.XfPLNgzY-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/gfs2/bmap.c: In function 'gfs2_iomap_alloc':
   fs/gfs2/bmap.c:748:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
     748 |                         if (n == 0)
         |                            ^
   fs/gfs2/bmap.c:751:17: note: here
     751 |                 case ALLOC_GROW_DEPTH:
         |                 ^~~~
   fs/gfs2/bmap.c:759:28: warning: this statement may fall through [-Wimplicit-fallthrough=]
     759 |                         if (n == 0)
         |                            ^
   fs/gfs2/bmap.c:762:17: note: here
     762 |                 case ALLOC_DATA:
         |                 ^~~~
   fs/gfs2/bmap.c: In function 'gfs2_iomap_get':
>> fs/gfs2/bmap.c:960:31: warning: 'lblock' may be used uninitialized [-Wmaybe-uninitialized]
     960 |                         ret = gfs2_hole_size(inode, lblock, len, mp, iomap);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/bmap.c:851:18: note: 'lblock' was declared here
     851 |         sector_t lblock;
         |                  ^~~~~~
   fs/gfs2/bmap.c:960:31: warning: 'len' may be used uninitialized [-Wmaybe-uninitialized]
     960 |                         ret = gfs2_hole_size(inode, lblock, len, mp, iomap);
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/bmap.c:855:13: note: 'len' was declared here
     855 |         u64 len;
         |             ^~~
   fs/gfs2/bmap.c:959:32: warning: 'height' may be used uninitialized [-Wmaybe-uninitialized]
     959 |                 if (pos < size && height == ip->i_height)
         |                     ~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/gfs2/bmap.c:857:12: note: 'height' was declared here
     857 |         u8 height;
         |            ^~~~~~
   fs/gfs2/bmap.c:1290: warning: Function parameter or member 'inode' not described in 'gfs2_block_zero_range'
   fs/gfs2/bmap.c:1290: warning: Function parameter or member 'from' not described in 'gfs2_block_zero_range'
   fs/gfs2/bmap.c:1290: warning: Function parameter or member 'length' not described in 'gfs2_block_zero_range'
   fs/gfs2/bmap.c:1493: warning: Function parameter or member 'rd_gh' not described in 'sweep_bh_for_rgrps'
   fs/gfs2/bmap.c:1493: warning: Excess function parameter 'rg_gh' description in 'sweep_bh_for_rgrps'
   fs/gfs2/bmap.c:1661: warning: Function parameter or member 'sdp' not described in 'find_nonnull_ptr'
   fs/gfs2/bmap.c:1661: warning: Function parameter or member 'end_list' not described in 'find_nonnull_ptr'
   fs/gfs2/bmap.c:1661: warning: Function parameter or member 'end_aligned' not described in 'find_nonnull_ptr'


vim +/lblock +960 fs/gfs2/bmap.c

7ee66c03e40a57 Christoph Hellwig   2018-06-01  831  
3974320ca6aa68 Bob Peterson        2017-02-16  832  /**
628e366df11c0a Andreas Gruenbacher 2018-06-04  833   * gfs2_iomap_get - Map blocks from an inode to disk blocks
3974320ca6aa68 Bob Peterson        2017-02-16  834   * @inode: The inode
3974320ca6aa68 Bob Peterson        2017-02-16  835   * @pos: Starting position in bytes
3974320ca6aa68 Bob Peterson        2017-02-16  836   * @length: Length to map, in bytes
3974320ca6aa68 Bob Peterson        2017-02-16  837   * @flags: iomap flags
3974320ca6aa68 Bob Peterson        2017-02-16  838   * @iomap: The iomap structure
628e366df11c0a Andreas Gruenbacher 2018-06-04  839   * @mp: The metapath
3974320ca6aa68 Bob Peterson        2017-02-16  840   *
3974320ca6aa68 Bob Peterson        2017-02-16  841   * Returns: errno
3974320ca6aa68 Bob Peterson        2017-02-16  842   */
628e366df11c0a Andreas Gruenbacher 2018-06-04  843  static int gfs2_iomap_get(struct inode *inode, loff_t pos, loff_t length,
628e366df11c0a Andreas Gruenbacher 2018-06-04  844  			  unsigned flags, struct iomap *iomap,
628e366df11c0a Andreas Gruenbacher 2018-06-04  845  			  struct metapath *mp)
b3b94faa5fe596 David Teigland      2006-01-16  846  {
feaa7bba026c18 Steven Whitehouse   2006-06-14  847  	struct gfs2_inode *ip = GFS2_I(inode);
feaa7bba026c18 Steven Whitehouse   2006-06-14  848  	struct gfs2_sbd *sdp = GFS2_SB(inode);
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  849  	loff_t size = i_size_read(inode);
9b8c81d1de4994 Steven Whitehouse   2008-02-22  850  	__be64 *ptr;
3974320ca6aa68 Bob Peterson        2017-02-16  851  	sector_t lblock;
628e366df11c0a Andreas Gruenbacher 2018-06-04  852  	sector_t lblock_stop;
628e366df11c0a Andreas Gruenbacher 2018-06-04  853  	int ret;
9b8c81d1de4994 Steven Whitehouse   2008-02-22  854  	int eob;
628e366df11c0a Andreas Gruenbacher 2018-06-04  855  	u64 len;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  856  	struct buffer_head *dibh = NULL, *bh;
9b8c81d1de4994 Steven Whitehouse   2008-02-22  857  	u8 height;
7276b3b0c77101 Steven Whitehouse   2006-09-21  858  
628e366df11c0a Andreas Gruenbacher 2018-06-04  859  	if (!length)
628e366df11c0a Andreas Gruenbacher 2018-06-04  860  		return -EINVAL;
b3b94faa5fe596 David Teigland      2006-01-16  861  
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  862  	down_read(&ip->i_rw_mutex);
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  863  
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  864  	ret = gfs2_meta_inode_buffer(ip, &dibh);
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  865  	if (ret)
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  866  		goto unlock;
38084377af4fc8 Andreas Gruenbacher 2018-11-11  867  	mp->mp_bh[0] = dibh;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  868  
49edd5bf429c40 Andreas Gruenbacher 2018-02-06  869  	if (gfs2_is_stuffed(ip)) {
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  870  		if (flags & IOMAP_WRITE) {
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  871  			loff_t max_size = gfs2_max_stuffed_size(ip);
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  872  
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  873  			if (pos + length > max_size)
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  874  				goto unstuff;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  875  			iomap->length = max_size;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  876  		} else {
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  877  			if (pos >= size) {
49edd5bf429c40 Andreas Gruenbacher 2018-02-06  878  				if (flags & IOMAP_REPORT) {
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  879  					ret = -ENOENT;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  880  					goto unlock;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  881  				} else {
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  882  					/* report a hole */
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  883  					iomap->offset = pos;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  884  					iomap->length = length;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  885  					goto do_alloc;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  886  				}
3974320ca6aa68 Bob Peterson        2017-02-16  887  			}
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  888  			iomap->length = size;
49edd5bf429c40 Andreas Gruenbacher 2018-02-06  889  		}
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  890  		iomap->addr = (ip->i_no_addr << inode->i_blkbits) +
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  891  			      sizeof(struct gfs2_dinode);
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  892  		iomap->type = IOMAP_INLINE;
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  893  		iomap->inline_data = dibh->b_data + sizeof(struct gfs2_dinode);
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  894  		goto out;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  895  	}
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  896  
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  897  unstuff:
3974320ca6aa68 Bob Peterson        2017-02-16  898  	lblock = pos >> inode->i_blkbits;
3974320ca6aa68 Bob Peterson        2017-02-16  899  	iomap->offset = lblock << inode->i_blkbits;
628e366df11c0a Andreas Gruenbacher 2018-06-04  900  	lblock_stop = (pos + length - 1) >> inode->i_blkbits;
628e366df11c0a Andreas Gruenbacher 2018-06-04  901  	len = lblock_stop - lblock + 1;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  902  	iomap->length = len << inode->i_blkbits;
20cdc1931ee8e0 Andreas Gruenbacher 2017-09-22  903  
9b8c81d1de4994 Steven Whitehouse   2008-02-22  904  	height = ip->i_height;
9a38662ba4e268 Andreas Gruenbacher 2018-04-16  905  	while ((lblock + 1) * sdp->sd_sb.sb_bsize > sdp->sd_heightsize[height])
ecc30c79157103 Steven Whitehouse   2008-01-28  906  		height++;
628e366df11c0a Andreas Gruenbacher 2018-06-04  907  	find_metapath(sdp, lblock, mp, height);
9b8c81d1de4994 Steven Whitehouse   2008-02-22  908  	if (height > ip->i_height || gfs2_is_stuffed(ip))
9b8c81d1de4994 Steven Whitehouse   2008-02-22  909  		goto do_alloc;
3974320ca6aa68 Bob Peterson        2017-02-16  910  
628e366df11c0a Andreas Gruenbacher 2018-06-04  911  	ret = lookup_metapath(ip, mp);
e8b43fe0c1e035 Andreas Gruenbacher 2017-12-08  912  	if (ret)
628e366df11c0a Andreas Gruenbacher 2018-06-04  913  		goto unlock;
3974320ca6aa68 Bob Peterson        2017-02-16  914  
628e366df11c0a Andreas Gruenbacher 2018-06-04  915  	if (mp->mp_aheight != ip->i_height)
9b8c81d1de4994 Steven Whitehouse   2008-02-22  916  		goto do_alloc;
3974320ca6aa68 Bob Peterson        2017-02-16  917  
628e366df11c0a Andreas Gruenbacher 2018-06-04  918  	ptr = metapointer(ip->i_height - 1, mp);
9b8c81d1de4994 Steven Whitehouse   2008-02-22  919  	if (*ptr == 0)
9b8c81d1de4994 Steven Whitehouse   2008-02-22  920  		goto do_alloc;
3974320ca6aa68 Bob Peterson        2017-02-16  921  
628e366df11c0a Andreas Gruenbacher 2018-06-04  922  	bh = mp->mp_bh[ip->i_height - 1];
bcfe94139a45fa Andreas Gruenbacher 2018-05-11  923  	len = gfs2_extent_length(bh, ptr, len, &eob);
3974320ca6aa68 Bob Peterson        2017-02-16  924  
628e366df11c0a Andreas Gruenbacher 2018-06-04  925  	iomap->addr = be64_to_cpu(*ptr) << inode->i_blkbits;
628e366df11c0a Andreas Gruenbacher 2018-06-04  926  	iomap->length = len << inode->i_blkbits;
628e366df11c0a Andreas Gruenbacher 2018-06-04  927  	iomap->type = IOMAP_MAPPED;
0ed91eca1130e6 Andreas Gruenbacher 2018-07-25  928  	iomap->flags |= IOMAP_F_MERGED;
9b8c81d1de4994 Steven Whitehouse   2008-02-22  929  	if (eob)
7ee66c03e40a57 Christoph Hellwig   2018-06-01  930  		iomap->flags |= IOMAP_F_GFS2_BOUNDARY;
3974320ca6aa68 Bob Peterson        2017-02-16  931  
3974320ca6aa68 Bob Peterson        2017-02-16  932  out:
628e366df11c0a Andreas Gruenbacher 2018-06-04  933  	iomap->bdev = inode->i_sb->s_bdev;
628e366df11c0a Andreas Gruenbacher 2018-06-04  934  unlock:
628e366df11c0a Andreas Gruenbacher 2018-06-04  935  	up_read(&ip->i_rw_mutex);
9b8c81d1de4994 Steven Whitehouse   2008-02-22  936  	return ret;
9b8c81d1de4994 Steven Whitehouse   2008-02-22  937  
9b8c81d1de4994 Steven Whitehouse   2008-02-22  938  do_alloc:
628e366df11c0a Andreas Gruenbacher 2018-06-04  939  	iomap->addr = IOMAP_NULL_ADDR;
628e366df11c0a Andreas Gruenbacher 2018-06-04  940  	iomap->type = IOMAP_HOLE;
628e366df11c0a Andreas Gruenbacher 2018-06-04  941  	if (flags & IOMAP_REPORT) {
49edd5bf429c40 Andreas Gruenbacher 2018-02-06  942  		if (pos >= size)
3974320ca6aa68 Bob Peterson        2017-02-16  943  			ret = -ENOENT;
628e366df11c0a Andreas Gruenbacher 2018-06-04  944  		else if (height == ip->i_height)
628e366df11c0a Andreas Gruenbacher 2018-06-04  945  			ret = gfs2_hole_size(inode, lblock, len, mp, iomap);
49edd5bf429c40 Andreas Gruenbacher 2018-02-06  946  		else
49edd5bf429c40 Andreas Gruenbacher 2018-02-06  947  			iomap->length = size - pos;
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  948  	} else if (flags & IOMAP_WRITE) {
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  949  		u64 alloc_size;
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  950  
967bcc91b04493 Andreas Gruenbacher 2018-06-19  951  		if (flags & IOMAP_DIRECT)
967bcc91b04493 Andreas Gruenbacher 2018-06-19  952  			goto out;  /* (see gfs2_file_direct_write) */
967bcc91b04493 Andreas Gruenbacher 2018-06-19  953  
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  954  		len = gfs2_alloc_size(inode, mp, len);
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  955  		alloc_size = len << inode->i_blkbits;
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  956  		if (alloc_size < iomap->length)
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  957  			iomap->length = alloc_size;
64bc06bb32ee9c Andreas Gruenbacher 2018-06-24  958  	} else {
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24  959  		if (pos < size && height == ip->i_height)
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24 @960  			ret = gfs2_hole_size(inode, lblock, len, mp, iomap);
3974320ca6aa68 Bob Peterson        2017-02-16  961  	}
628e366df11c0a Andreas Gruenbacher 2018-06-04  962  	goto out;
628e366df11c0a Andreas Gruenbacher 2018-06-04  963  }
628e366df11c0a Andreas Gruenbacher 2018-06-04  964  

:::::: The code at line 960 was first introduced by commit
:::::: d505a96a3b16f46455035dc0296bc2da6014e163 gfs2: Further iomap cleanups

:::::: TO: Andreas Gruenbacher <agruenba@redhat.com>
:::::: CC: Andreas Gruenbacher <agruenba@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
