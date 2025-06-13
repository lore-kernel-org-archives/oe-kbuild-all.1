Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB7D271458
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Jun 2025 21:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749848722; cv=none; b=G8xum5wyO7HBp1Q0EwLD3W1fYN8Y+cI2jWMi3/GOFVejQjQPYRnZenhdIeI2vZXitlwaa8NpCQ8vvKAPTXgzeQtaOz6qPrdff2n9KDCi2tvXzOGDHKT2csAZH4kGmLITxsWylPK1ca2cy+2QPlRCkdpJ7eOogrcSwLLlol88yoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749848722; c=relaxed/simple;
	bh=UchUYbKtPjMBkWE759fC+D1YSlozadrWK0NQLYpg01A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hSl8/5hs/zbGaNNl1qriw2bzpz/DESQ9Darexs739pYW131t4/Ym8+YA0XeCudu9+eq3yoHgSwk1rMecY9lA9M8lSkwCl+Wkc1nofIFP+cBReDu4YLu1WFAGy3nOKb359hWpdYuF3xMMTHTte8MAPetPiT/ySzwViwxmFZTGa90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T75WgjTT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T75WgjTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749848720; x=1781384720;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UchUYbKtPjMBkWE759fC+D1YSlozadrWK0NQLYpg01A=;
  b=T75WgjTTL+ukkTVWEoO2TeMAwsk7vyNcI3l+3xS8RcCg7QzqvbtFElqm
   JQ1sggIyVN2OUHbfF81Hdr/Szb9NJdzM8O921iw4SGMdhpMYIXbgqqWfI
   04u86EODNFpD6a8mvj64Nex+hkU+n/sT61zTW9mebwSydEji7PBCV8dEq
   EzKxxGBMS4jdItl4c+ilzMX/ICKEFHRjLLmYr2l6A/75upGomHLjOLJ78
   7Ut5Jxp/Uf0dl3MfqDboG1Fbb9L+9oRrQBxuYg7shgfaRGhu7CKaZNg7J
   r5krdy3UkDRLEs6n1UoQdZUsfQk/X4JdmI78roRuqDbc98a0GsxFCamfc
   g==;
X-CSE-ConnectionGUID: Vc4gFLsQTvSak063dDcjgA==
X-CSE-MsgGUID: IjHtu6mgQ2OJeH/0VSy+tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="63109324"
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="63109324"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 14:05:19 -0700
X-CSE-ConnectionGUID: ng1lrZEQSEKxuZ0Kb8SOLA==
X-CSE-MsgGUID: 2sBpqIuJTOKYqi1PtF7KrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,234,1744095600"; 
   d="scan'208";a="147761977"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2025 14:05:18 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQBaN-000D0A-17;
	Fri, 13 Jun 2025 21:05:15 +0000
Date: Sat, 14 Jun 2025 05:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-cache 40/45] fs/fuse/inode.c:201:6: error:
 call to undeclared function 'fuse_has_iomap_cache'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202506140504.QOpDxwh9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-cache
head:   62857bad704590b8ed2cc579b4a859b953b93d5f
commit: b3c191b67dbecf84bcb097be892a0f854acdf050 [40/45] fuse: cache iomaps
config: i386-buildonly-randconfig-005-20250614 (https://download.01.org/0day-ci/archive/20250614/202506140504.QOpDxwh9-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250614/202506140504.QOpDxwh9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506140504.QOpDxwh9-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/fuse/inode.c:201:6: error: call to undeclared function 'fuse_has_iomap_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     201 |         if (fuse_has_iomap_cache(inode))
         |             ^
   1 error generated.
--
   In file included from fs/fuse/dev.c:12:
>> fs/fuse/iomap_cache.h:40:51: warning: declaration of 'struct fuse_iomap_cache' will not be visible outside of this function [-Wvisibility]
      40 | struct fuse_ifork *fuse_iext_state_to_fork(struct fuse_iomap_cache *ip,
         |                                                   ^
   fs/fuse/iomap_cache.h:44:35: warning: declaration of 'struct fuse_iomap_cache' will not be visible outside of this function [-Wvisibility]
      44 | void            fuse_iext_insert_raw(struct fuse_iomap_cache *ip,
         |                                             ^
>> fs/fuse/iomap_cache.h:47:17: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      47 |                         const struct fuse_iomap *irec);
         |                                      ^
   fs/fuse/iomap_cache.h:48:31: warning: declaration of 'struct fuse_iomap_cache' will not be visible outside of this function [-Wvisibility]
      48 | void            fuse_iext_insert(struct fuse_iomap_cache *,
         |                                         ^
   fs/fuse/iomap_cache.h:50:17: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      50 |                         const struct fuse_iomap *, int);
         |                                      ^
   fs/fuse/iomap_cache.h:51:31: warning: declaration of 'struct fuse_iomap_cache' will not be visible outside of this function [-Wvisibility]
      51 | void            fuse_iext_remove(struct fuse_iomap_cache *,
         |                                         ^
   fs/fuse/iomap_cache.h:56:38: warning: declaration of 'struct fuse_iomap_cache' will not be visible outside of this function [-Wvisibility]
      56 | bool            fuse_iext_lookup_extent(struct fuse_iomap_cache *ip,
         |                                                ^
   fs/fuse/iomap_cache.h:59:11: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      59 |                         struct fuse_iomap *gotp);
         |                                ^
   fs/fuse/iomap_cache.h:60:45: warning: declaration of 'struct fuse_iomap_cache' will not be visible outside of this function [-Wvisibility]
      60 | bool            fuse_iext_lookup_extent_before(struct fuse_iomap_cache *ip,
         |                                                       ^
   fs/fuse/iomap_cache.h:63:11: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      63 |                         struct fuse_iomap *gotp);
         |                                ^
   fs/fuse/iomap_cache.h:66:11: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      66 |                         struct fuse_iomap *gotp);
         |                                ^
   fs/fuse/iomap_cache.h:67:38: warning: declaration of 'struct fuse_iomap_cache' will not be visible outside of this function [-Wvisibility]
      67 | void            fuse_iext_update_extent(struct fuse_iomap_cache *ip, int state,
         |                                                ^
   fs/fuse/iomap_cache.h:69:11: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      69 |                         struct fuse_iomap *gotp);
         |                                ^
   fs/fuse/iomap_cache.h:77:40: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      77 |                 struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
         |                                                      ^
>> fs/fuse/iomap_cache.h:80:40: error: incompatible pointer types passing 'struct fuse_iomap *' to parameter of type 'struct fuse_iomap *' [-Werror,-Wincompatible-pointer-types]
      80 |         return fuse_iext_get_extent(ifp, cur, gotp);
         |                                               ^~~~
   fs/fuse/iomap_cache.h:66:23: note: passing argument to parameter 'gotp' here
      66 |                         struct fuse_iomap *gotp);
         |                                            ^
   fs/fuse/iomap_cache.h:84:40: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      84 |                 struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
         |                                                      ^
   fs/fuse/iomap_cache.h:87:40: error: incompatible pointer types passing 'struct fuse_iomap *' to parameter of type 'struct fuse_iomap *' [-Werror,-Wincompatible-pointer-types]
      87 |         return fuse_iext_get_extent(ifp, cur, gotp);
         |                                               ^~~~
   fs/fuse/iomap_cache.h:66:23: note: passing argument to parameter 'gotp' here
      66 |                         struct fuse_iomap *gotp);
         |                                            ^
   fs/fuse/iomap_cache.h:94:40: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
      94 |                 struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
         |                                                      ^
   fs/fuse/iomap_cache.h:99:42: error: incompatible pointer types passing 'struct fuse_iomap *' to parameter of type 'struct fuse_iomap *' [-Werror,-Wincompatible-pointer-types]
      99 |         return fuse_iext_get_extent(ifp, &ncur, gotp);
         |                                                 ^~~~
   fs/fuse/iomap_cache.h:66:23: note: passing argument to parameter 'gotp' here
      66 |                         struct fuse_iomap *gotp);
         |                                            ^
   fs/fuse/iomap_cache.h:106:40: warning: declaration of 'struct fuse_iomap' will not be visible outside of this function [-Wvisibility]
     106 |                 struct fuse_iext_cursor *cur, struct fuse_iomap *gotp)
         |                                                      ^
   fs/fuse/iomap_cache.h:111:42: error: incompatible pointer types passing 'struct fuse_iomap *' to parameter of type 'struct fuse_iomap *' [-Werror,-Wincompatible-pointer-types]
     111 |         return fuse_iext_get_extent(ifp, &ncur, gotp);
         |                                                 ^~~~
   fs/fuse/iomap_cache.h:66:23: note: passing argument to parameter 'gotp' here
      66 |                         struct fuse_iomap *gotp);
         |                                            ^
   17 warnings and 4 errors generated.


vim +/fuse_has_iomap_cache +201 fs/fuse/inode.c

   157	
   158	static void fuse_evict_inode(struct inode *inode)
   159	{
   160		struct fuse_inode *fi = get_fuse_inode(inode);
   161	
   162		/* Will write inode on close/munmap and in all other dirtiers */
   163		WARN_ON(inode->i_state & I_DIRTY_INODE);
   164	
   165		truncate_inode_pages_final(&inode->i_data);
   166		clear_inode(inode);
   167		if (inode->i_sb->s_flags & SB_ACTIVE) {
   168			struct fuse_conn *fc = get_fuse_conn(inode);
   169	
   170			if (FUSE_IS_DAX(inode))
   171				fuse_dax_inode_cleanup(inode);
   172			if (fi->nlookup) {
   173				fuse_queue_forget(fc, fi->forget, fi->nodeid,
   174						  fi->nlookup);
   175				fi->forget = NULL;
   176			}
   177	
   178			if (fi->submount_lookup) {
   179				fuse_cleanup_submount_lookup(fc, fi->submount_lookup);
   180				fi->submount_lookup = NULL;
   181			}
   182			/*
   183			 * Evict of non-deleted inode may race with outstanding
   184			 * LOOKUP/READDIRPLUS requests and result in inconsistency when
   185			 * the request finishes.  Deal with that here by bumping a
   186			 * counter that can be compared to the starting value.
   187			 */
   188			if (inode->i_nlink > 0)
   189				atomic64_inc(&fc->evict_ctr);
   190		}
   191		if (S_ISREG(inode->i_mode) && !fuse_is_bad(inode)) {
   192			WARN_ON(fi->iocachectr != 0);
   193			WARN_ON(!list_empty(&fi->write_files));
   194			WARN_ON(!list_empty(&fi->queued_writes));
   195		}
   196	
   197		if (fuse_has_iomap_directio(inode))
   198			fuse_iomap_destroy_directio(inode);
   199		if (fuse_has_iomap_pagecache(inode))
   200			fuse_iomap_destroy_pagecache(inode);
 > 201		if (fuse_has_iomap_cache(inode))
   202			fuse_iomap_destroy_cache(inode);
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
