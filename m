Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456B1362
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 02:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681267487; x=1712803487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nk6tKJYxIaeW4GdiTXYwCvhIBmEyAE8glAVv27dMFx4=;
  b=F9P/BAQYdK1oxTYuTWKWF0BhcnWMBKmggFO4oFeloTT27urmTOHUA8yI
   rBnrxSctKHvBLh9Dt6RZQZ7Biuo/zLgb0Xu5mswccaOlo4Lm/VGx3y23S
   C+hm7Pgg5LxBsdsVzUjmTRn4Tp0uJkKrS0nzoMnudOISef/jPZ1iSyu/e
   H5qfpiBLT70TzXBYKpyk6WRT/42gD+EqIf7THW7lpjnVwr9dHgZT6GNfr
   HsclQDqYE6kSIbQjBIUGd3ZUvxbbAaP+noMtKo1K3XdMAR93m3YjYiyy3
   G7xVJ3rUaFxZFir0LN/3Vda0GW5KApH9cLjxsLKqbaCcI4dfX8hgoPHuD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="346460754"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="346460754"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 19:44:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="758066291"
X-IronPort-AV: E=Sophos;i="5.98,338,1673942400"; 
   d="scan'208";a="758066291"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2023 19:44:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmQTU-000X5T-2f;
	Wed, 12 Apr 2023 02:44:44 +0000
Date: Wed, 12 Apr 2023 10:43:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 434/511] fs/xfs/xfs_bmap_item.c:371:17:
 error: implicit declaration of function 'xfs_rtgroup_intent_get' is invalid
 in C99
Message-ID: <202304121000.h5AASLe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   954ad3ce89f15b7e9eab0e81f1371fb8ef38ec25
commit: bd29054970459ac635ab764effbe7baaf668c6ac [434/511] xfs: allow queued realtime intents to drain before scrubbing
config: x86_64-randconfig-a004-20230410 (https://download.01.org/0day-ci/archive/20230412/202304121000.h5AASLe4-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=bd29054970459ac635ab764effbe7baaf668c6ac
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout bd29054970459ac635ab764effbe7baaf668c6ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304121000.h5AASLe4-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/xfs/xfs_bmap_item.c:371:17: error: implicit declaration of function 'xfs_rtgroup_intent_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                        ^
   fs/xfs/xfs_bmap_item.c:371:17: note: did you mean 'xfs_rtgroup_intent_rele'?
   fs/xfs/xfs_drain.h:108:20: note: 'xfs_rtgroup_intent_rele' declared here
   static inline void xfs_rtgroup_intent_rele(struct xfs_rtgroup *rtg) { }
                      ^
>> fs/xfs/xfs_bmap_item.c:371:15: warning: incompatible integer to pointer conversion assigning to 'struct xfs_rtgroup *' from 'int' [-Wint-conversion]
                           bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                      ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_bmap_item.c:398:4: error: implicit declaration of function 'xfs_rtgroup_intent_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                           xfs_rtgroup_intent_put(bi->bi_rtg);
                           ^
   1 warning and 2 errors generated.
--
>> fs/xfs/xfs_extfree_item.c:493:20: error: implicit declaration of function 'xfs_rtgroup_intent_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   xefi->xefi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                    ^
   fs/xfs/xfs_extfree_item.c:493:20: note: did you mean 'xfs_rtgroup_intent_rele'?
   fs/xfs/xfs_drain.h:108:20: note: 'xfs_rtgroup_intent_rele' declared here
   static inline void xfs_rtgroup_intent_rele(struct xfs_rtgroup *rtg) { }
                      ^
>> fs/xfs/xfs_extfree_item.c:493:18: warning: incompatible integer to pointer conversion assigning to 'struct xfs_rtgroup *' from 'int' [-Wint-conversion]
                   xefi->xefi_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                  ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_extfree_item.c:507:3: error: implicit declaration of function 'xfs_rtgroup_intent_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   xfs_rtgroup_intent_put(xefi->xefi_rtg);
                   ^
   1 warning and 2 errors generated.
--
>> fs/xfs/xfs_rmap_item.c:402:16: error: implicit declaration of function 'xfs_rtgroup_intent_get' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   ri->ri_rtg = xfs_rtgroup_intent_get(mp, rgno);
                                ^
   fs/xfs/xfs_rmap_item.c:402:16: note: did you mean 'xfs_rtgroup_intent_rele'?
   fs/xfs/xfs_drain.h:108:20: note: 'xfs_rtgroup_intent_rele' declared here
   static inline void xfs_rtgroup_intent_rele(struct xfs_rtgroup *rtg) { }
                      ^
>> fs/xfs/xfs_rmap_item.c:402:14: warning: incompatible integer to pointer conversion assigning to 'struct xfs_rtgroup *' from 'int' [-Wint-conversion]
                   ri->ri_rtg = xfs_rtgroup_intent_get(mp, rgno);
                              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_rmap_item.c:416:3: error: implicit declaration of function 'xfs_rtgroup_intent_put' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
                   xfs_rtgroup_intent_put(ri->ri_rtg);
                   ^
   1 warning and 2 errors generated.


vim +/xfs_rtgroup_intent_get +371 fs/xfs/xfs_bmap_item.c

   357	
   358	/* Take a passive ref to the AG containing the space we're mapping. */
   359	void
   360	xfs_bmap_update_get_group(
   361		struct xfs_mount	*mp,
   362		struct xfs_bmap_intent	*bi)
   363	{
   364		xfs_agnumber_t		agno;
   365	
   366		if (xfs_ifork_is_realtime(bi->bi_owner, bi->bi_whichfork)) {
   367			if (xfs_has_rtgroups(mp)) {
   368				xfs_rgnumber_t	rgno;
   369	
   370				rgno = xfs_rtb_to_rgno(mp, bi->bi_bmap.br_startblock);
 > 371				bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
   372			} else {
   373				bi->bi_rtg = NULL;
   374			}
   375	
   376			return;
   377		}
   378	
   379		agno = XFS_FSB_TO_AGNO(mp, bi->bi_bmap.br_startblock);
   380	
   381		/*
   382		 * Bump the intent count on behalf of the deferred rmap and refcount
   383		 * intent items that that we can queue when we finish this bmap work.
   384		 * This new intent item will bump the intent count before the bmap
   385		 * intent drops the intent count, ensuring that the intent count
   386		 * remains nonzero across the transaction roll.
   387		 */
   388		bi->bi_pag = xfs_perag_intent_get(mp, agno);
   389	}
   390	
   391	/* Release a passive AG ref after finishing mapping work. */
   392	static inline void
   393	xfs_bmap_update_put_group(
   394		struct xfs_bmap_intent	*bi)
   395	{
   396		if (xfs_ifork_is_realtime(bi->bi_owner, bi->bi_whichfork)) {
   397			if (xfs_has_rtgroups(bi->bi_owner->i_mount)) {
 > 398				xfs_rtgroup_intent_put(bi->bi_rtg);
   399			}
   400			return;
   401		}
   402	
   403		xfs_perag_intent_put(bi->bi_pag);
   404	}
   405	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
