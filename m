Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDC77E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 06:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687673074; x=1719209074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=st6WbHoz1az8KMkBEmuxI++V7KgxYxgmge7J130SmIg=;
  b=lw6rtZaXloKv9CKoeR1glHyPtx+3hFUk7SNr1/9bT9yO1aREHPxnB+C7
   pPyq6lJeu1W6awMzz3OtPu7OWt1UQrABxS/JiM7m5l95eEMRD72ceHi1+
   pfsashIemuZTF/9G/i7Nyi0A+AddlvL0Z+vqw5YR8Y0FH84QmorUB03ae
   FGNGFBNXboM8deg4B5nR76A8q2ESx5Q6XyX7sKK4mi+C6knbIezIlgl7r
   MzdtwA0b4DUu8KunP78QZlDQCZ91NDiKDzyS7mponLUpFj/GJ1TptL/Nr
   4aeUmeHc5ldTrmpal1sX0gGkKacvTXns/TDYp70+PZZiVonmPy4DjK0Fr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="424706767"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="424706767"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 23:04:33 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="750540965"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="750540965"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jun 2023 23:04:32 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDIrP-0009ou-1w;
	Sun, 25 Jun 2023 06:04:31 +0000
Date: Sun, 25 Jun 2023 14:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 26326/26342] fs/nilfs2/page.c:369:16:
 error: implicit declaration of function 'filemap_get_folios_tag'
Message-ID: <202306251444.Xs2ZfaeV-lkp@intel.com>
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
commit: 86a55a44b360fe02bd77f23d18ef3964d4986655 [26326/26342] nilfs2: convert nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230625/202306251444.Xs2ZfaeV-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251444.Xs2ZfaeV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251444.Xs2ZfaeV-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nilfs2/page.c: In function 'nilfs_clear_dirty_pages':
   fs/nilfs2/page.c:363:28: error: storage size of 'fbatch' isn't known
     363 |         struct folio_batch fbatch;
         |                            ^~~~~~
   fs/nilfs2/page.c:367:9: error: implicit declaration of function 'folio_batch_init' [-Werror=implicit-function-declaration]
     367 |         folio_batch_init(&fbatch);
         |         ^~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:369:16: error: implicit declaration of function 'filemap_get_folios_tag' [-Werror=implicit-function-declaration]
     369 |         while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:371:33: error: implicit declaration of function 'folio_batch_count' [-Werror=implicit-function-declaration]
     371 |                 for (i = 0; i < folio_batch_count(&fbatch); i++) {
         |                                 ^~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:374:25: error: implicit declaration of function 'folio_lock'; did you mean 'osq_lock'? [-Werror=implicit-function-declaration]
     374 |                         folio_lock(folio);
         |                         ^~~~~~~~~~
         |                         osq_lock
   fs/nilfs2/page.c:375:54: error: invalid use of undefined type 'struct folio'
     375 |                         nilfs_clear_dirty_page(&folio->page, silent);
         |                                                      ^~
   fs/nilfs2/page.c:376:25: error: implicit declaration of function 'folio_unlock'; did you mean 'osq_unlock'? [-Werror=implicit-function-declaration]
     376 |                         folio_unlock(folio);
         |                         ^~~~~~~~~~~~
         |                         osq_unlock
   fs/nilfs2/page.c:378:17: error: implicit declaration of function 'folio_batch_release' [-Werror=implicit-function-declaration]
     378 |                 folio_batch_release(&fbatch);
         |                 ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:363:28: warning: unused variable 'fbatch' [-Wunused-variable]
     363 |         struct folio_batch fbatch;
         |                            ^~~~~~
   fs/nilfs2/page.c: In function 'nilfs_find_uncommitted_extent':
   fs/nilfs2/page.c:500:28: error: storage size of 'fbatch' isn't known
     500 |         struct folio_batch fbatch;
         |                            ^~~~~~
   fs/nilfs2/page.c:511:21: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror=implicit-function-declaration]
     511 |         nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
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
   fs/nilfs2/page.c:500:28: warning: unused variable 'fbatch' [-Wunused-variable]
     500 |         struct folio_batch fbatch;
         |                            ^~~~~~
   cc1: some warnings being treated as errors


vim +/filemap_get_folios_tag +369 fs/nilfs2/page.c

   355	
   356	/**
   357	 * nilfs_clear_dirty_pages - discard dirty pages in address space
   358	 * @mapping: address space with dirty pages for discarding
   359	 * @silent: suppress [true] or print [false] warning messages
   360	 */
   361	void nilfs_clear_dirty_pages(struct address_space *mapping, bool silent)
   362	{
   363		struct folio_batch fbatch;
   364		unsigned int i;
   365		pgoff_t index = 0;
   366	
   367		folio_batch_init(&fbatch);
   368	
 > 369		while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
   370					PAGECACHE_TAG_DIRTY, &fbatch)) {
 > 371			for (i = 0; i < folio_batch_count(&fbatch); i++) {
   372				struct folio *folio = fbatch.folios[i];
   373	
   374				folio_lock(folio);
   375				nilfs_clear_dirty_page(&folio->page, silent);
   376				folio_unlock(folio);
   377			}
   378			folio_batch_release(&fbatch);
   379			cond_resched();
   380		}
   381	}
   382	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
