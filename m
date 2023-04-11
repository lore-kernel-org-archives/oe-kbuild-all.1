Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542B917DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 23:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681256435; x=1712792435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSCgmqS/Z6XFyHh43t6hIFk//A3K12nEAMRXWmmQhVk=;
  b=Ywyijv8kYXnAXiPA5eCnHLI5STJYXGVbYQnBatTNZQZd3Tgo/PfUeLpa
   l+2RuC0xZXhyzS9OWK81HGR9+MOHiIBjxtm9LfBogmyhYICP8InePDoRX
   rVObTikMT23Ly/dcx3o9IjC/Glr5qOe2IlcPGw5c7C+DtELuFdztq61Pz
   hPCPP9qpFYj7+F43E9wQjoURkW02X0JumU79qTc8fioEhnGopoVN1JLYB
   APOZ2JPdxtMVtW4LzM+ikDHJmi8g6Rotzk3YCS1qFRVtAtF/vGhm0NGCB
   hNkPk1lKLkMFO9JeJ5AYCSRVzeRKhEW1IWKl0ncFFzZZmMCIRzhwMX9XL
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327864364"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="327864364"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 16:40:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="1018547508"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="1018547508"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 11 Apr 2023 16:40:34 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmNbE-000Wox-2G;
	Tue, 11 Apr 2023 23:40:32 +0000
Date: Wed, 12 Apr 2023 07:40:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 434/511] fs/xfs/xfs_bmap_item.c:371:38:
 error: implicit declaration of function 'xfs_rtgroup_intent_get'; did you
 mean 'xfs_rtgroup_intent_rele'?
Message-ID: <202304120712.11BT9i3k-lkp@intel.com>
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
config: m68k-defconfig (https://download.01.org/0day-ci/archive/20230412/202304120712.11BT9i3k-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=bd29054970459ac635ab764effbe7baaf668c6ac
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs vectorized-scrub
        git checkout bd29054970459ac635ab764effbe7baaf668c6ac
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash fs/xfs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120712.11BT9i3k-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/xfs/xfs_bmap_item.c: In function 'xfs_bmap_update_get_group':
>> fs/xfs/xfs_bmap_item.c:371:38: error: implicit declaration of function 'xfs_rtgroup_intent_get'; did you mean 'xfs_rtgroup_intent_rele'? [-Werror=implicit-function-declaration]
     371 |                         bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
         |                                      xfs_rtgroup_intent_rele
>> fs/xfs/xfs_bmap_item.c:371:36: warning: assignment to 'struct xfs_rtgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     371 |                         bi->bi_rtg = xfs_rtgroup_intent_get(mp, rgno);
         |                                    ^
   fs/xfs/xfs_bmap_item.c: In function 'xfs_bmap_update_put_group':
>> fs/xfs/xfs_bmap_item.c:398:25: error: implicit declaration of function 'xfs_rtgroup_intent_put'; did you mean 'xfs_rtgroup_intent_rele'? [-Werror=implicit-function-declaration]
     398 |                         xfs_rtgroup_intent_put(bi->bi_rtg);
         |                         ^~~~~~~~~~~~~~~~~~~~~~
         |                         xfs_rtgroup_intent_rele
   cc1: some warnings being treated as errors
--
   fs/xfs/xfs_extfree_item.c: In function 'xfs_extent_free_get_group':
>> fs/xfs/xfs_extfree_item.c:493:34: error: implicit declaration of function 'xfs_rtgroup_intent_get'; did you mean 'xfs_rtgroup_intent_rele'? [-Werror=implicit-function-declaration]
     493 |                 xefi->xefi_rtg = xfs_rtgroup_intent_get(mp, rgno);
         |                                  ^~~~~~~~~~~~~~~~~~~~~~
         |                                  xfs_rtgroup_intent_rele
>> fs/xfs/xfs_extfree_item.c:493:32: warning: assignment to 'struct xfs_rtgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     493 |                 xefi->xefi_rtg = xfs_rtgroup_intent_get(mp, rgno);
         |                                ^
   fs/xfs/xfs_extfree_item.c: In function 'xfs_extent_free_put_group':
>> fs/xfs/xfs_extfree_item.c:507:17: error: implicit declaration of function 'xfs_rtgroup_intent_put'; did you mean 'xfs_rtgroup_intent_rele'? [-Werror=implicit-function-declaration]
     507 |                 xfs_rtgroup_intent_put(xefi->xefi_rtg);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 xfs_rtgroup_intent_rele
   cc1: some warnings being treated as errors
--
   fs/xfs/xfs_rmap_item.c: In function 'xfs_rmap_update_get_group':
>> fs/xfs/xfs_rmap_item.c:402:30: error: implicit declaration of function 'xfs_rtgroup_intent_get'; did you mean 'xfs_rtgroup_intent_rele'? [-Werror=implicit-function-declaration]
     402 |                 ri->ri_rtg = xfs_rtgroup_intent_get(mp, rgno);
         |                              ^~~~~~~~~~~~~~~~~~~~~~
         |                              xfs_rtgroup_intent_rele
>> fs/xfs/xfs_rmap_item.c:402:28: warning: assignment to 'struct xfs_rtgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     402 |                 ri->ri_rtg = xfs_rtgroup_intent_get(mp, rgno);
         |                            ^
   fs/xfs/xfs_rmap_item.c: In function 'xfs_rmap_update_put_group':
>> fs/xfs/xfs_rmap_item.c:416:17: error: implicit declaration of function 'xfs_rtgroup_intent_put'; did you mean 'xfs_rtgroup_intent_rele'? [-Werror=implicit-function-declaration]
     416 |                 xfs_rtgroup_intent_put(ri->ri_rtg);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 xfs_rtgroup_intent_rele
   cc1: some warnings being treated as errors


vim +371 fs/xfs/xfs_bmap_item.c

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
