Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F247C645
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 05:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687671813; x=1719207813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r08HVJEgVWsSGFIWpshcxOR8BMqMpY8TUQmsOrW7pmA=;
  b=iq9jYC/KTAk8uYB+FTTu5e27Up/KHsaXV4sXkTnytMKYg3EHyp06LXGD
   yNUS5NPY/4x9bADwd9538oAhr1Fb39fTLFrlGNfpHr/viIiZ28FLC4RKQ
   RiCJzxa07TMZMApmQzyViHegGAg2GEYozZiRqYIpMBlkxIRmv8e2dDbaG
   fyLkdAWLvsl7ECotAtyZ7cSU7kUGdOL+4Mcuh0PL/QczzU6t7UuZEvG8q
   9/Ge9BKvxiSt4QZNygiIdxod5haMam7S7M/jWy2HQwI7IV0swg/RUvsdU
   Uc0k/GdgZArXxlXR6ELPWQxAAY5y+ZshVhFhknU1Eq3PtgIVo9WoRa/L7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="363580035"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="363580035"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 22:43:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="781027600"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="781027600"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Jun 2023 22:43:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDIX4-0009mj-1f;
	Sun, 25 Jun 2023 05:43:30 +0000
Date: Sun, 25 Jun 2023 13:42:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 26325/26342] fs/nilfs2/page.c:500:28:
 warning: unused variable 'fbatch'
Message-ID: <202306251324.m1QkYcP0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-4.19
head:   5f0e89d38f13fd84e835d6c7ca04617367d2f1e6
commit: f91efdaf2fd9c36f675a2ddfd227bc525d2cdb21 [26325/26342] nilfs2: convert nilfs_find_uncommited_extent() to use filemap_get_folios_contig()
config: i386-debian-10.3 (https://download.01.org/0day-ci/archive/20230625/202306251324.m1QkYcP0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251324.m1QkYcP0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251324.m1QkYcP0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/nilfs2/page.c: In function 'nilfs_find_uncommitted_extent':
   fs/nilfs2/page.c:500:28: error: storage size of 'fbatch' isn't known
     500 |         struct folio_batch fbatch;
         |                            ^~~~~~
   fs/nilfs2/page.c:508:9: error: implicit declaration of function 'folio_batch_init' [-Werror=implicit-function-declaration]
     508 |         folio_batch_init(&fbatch);
         |         ^~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:511:21: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror=implicit-function-declaration]
     511 |         nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:520:17: error: implicit declaration of function 'folio_lock'; did you mean 'osq_lock'? [-Werror=implicit-function-declaration]
     520 |                 folio_lock(folio);
         |                 ^~~~~~~~~~
         |                 osq_lock
   fs/nilfs2/page.c:521:21: error: implicit declaration of function 'folio_buffers'; did you mean 'lock_buffer'? [-Werror=implicit-function-declaration]
     521 |                 if (folio_buffers(folio)) {
         |                     ^~~~~~~~~~~~~
         |                     lock_buffer
   fs/nilfs2/page.c:525:34: error: invalid use of undefined type 'struct folio'
     525 |                         b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
         |                                  ^~
   fs/nilfs2/page.c:526:35: warning: assignment to 'struct buffer_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     526 |                         bh = head = folio_buffers(folio);
         |                                   ^
   fs/nilfs2/page.c:542:17: error: implicit declaration of function 'folio_unlock'; did you mean 'osq_unlock'? [-Werror=implicit-function-declaration]
     542 |                 folio_unlock(folio);
         |                 ^~~~~~~~~~~~
         |                 osq_unlock
   fs/nilfs2/page.c:546:9: error: implicit declaration of function 'folio_batch_release' [-Werror=implicit-function-declaration]
     546 |         folio_batch_release(&fbatch);
         |         ^~~~~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:500:28: warning: unused variable 'fbatch' [-Wunused-variable]
     500 |         struct folio_batch fbatch;
         |                            ^~~~~~
   cc1: some warnings being treated as errors


vim +/fbatch +500 fs/nilfs2/page.c

   480	
   481	/**
   482	 * nilfs_find_uncommitted_extent - find extent of uncommitted data
   483	 * @inode: inode
   484	 * @start_blk: start block offset (in)
   485	 * @blkoff: start offset of the found extent (out)
   486	 *
   487	 * This function searches an extent of buffers marked "delayed" which
   488	 * starts from a block offset equal to or larger than @start_blk.  If
   489	 * such an extent was found, this will store the start offset in
   490	 * @blkoff and return its length in blocks.  Otherwise, zero is
   491	 * returned.
   492	 */
   493	unsigned long nilfs_find_uncommitted_extent(struct inode *inode,
   494						    sector_t start_blk,
   495						    sector_t *blkoff)
   496	{
   497		unsigned int i, nr_folios;
   498		pgoff_t index;
   499		unsigned long length = 0;
 > 500		struct folio_batch fbatch;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
