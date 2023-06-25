Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B7D7E4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 06:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687673076; x=1719209076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpwOkhxKdaU1ybUHw1Sa7OWMVVZwxErLtYSnYlFndC4=;
  b=KEMxZIljbo+Ar/dB0J9HQj850scu25crDha+BwdJy6LFHXwl3TUnjjtX
   vx2PH+0UllzfUWe76EbfN5mbYG8/UzSwNWpY5jDbNiAD6Dul8/Q/biiA+
   JgIp/vFwDNq3IJaeGTuU4x8WBq9BdeBMNJNByHCpEvbbjc/HOgHyO3+ql
   YBg91Q5O9TfJ92RgEAh0fKxUtiA3K7FLKSI2CfM4K2l/g6en6sedtrk+t
   dFVdp3BniHhIPC+aQqoUnHmam3QuEudyqWhbqhIaQXhXRUhXurXgibmXn
   3/cnqj97p3+fiakoL7kHWO8IWCcgBzSl7fxsbpiBW0FqYSIH4Egc9UK2S
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="424706769"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="424706769"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 23:04:34 -0700
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="750540972"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="750540972"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Jun 2023 23:04:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDIrP-0009ow-20;
	Sun, 25 Jun 2023 06:04:31 +0000
Date: Sun, 25 Jun 2023 14:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 27/55] fs/nilfs2/page.c:366:16: error:
 implicit declaration of function 'filemap_get_folios_tag'
Message-ID: <202306251308.v5rkgPmj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.10
head:   abb6d7530c1c0983b9806ab15bb69d335c6ca24a
commit: 65339f7ed49640b76eb8a0ba9ceee9859595aaef [27/55] nilfs2: convert nilfs_clear_dirty_pages() to use filemap_get_folios_tag()
config: arm-randconfig-r046-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251308.v5rkgPmj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251308.v5rkgPmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251308.v5rkgPmj-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nilfs2/page.c: In function 'nilfs_clear_dirty_pages':
   fs/nilfs2/page.c:360:28: error: storage size of 'fbatch' isn't known
     360 |         struct folio_batch fbatch;
         |                            ^~~~~~
   fs/nilfs2/page.c:364:9: error: implicit declaration of function 'folio_batch_init' [-Werror=implicit-function-declaration]
     364 |         folio_batch_init(&fbatch);
         |         ^~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:366:16: error: implicit declaration of function 'filemap_get_folios_tag' [-Werror=implicit-function-declaration]
     366 |         while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:368:33: error: implicit declaration of function 'folio_batch_count' [-Werror=implicit-function-declaration]
     368 |                 for (i = 0; i < folio_batch_count(&fbatch); i++) {
         |                                 ^~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:371:25: error: implicit declaration of function 'folio_lock'; did you mean 'osq_lock'? [-Werror=implicit-function-declaration]
     371 |                         folio_lock(folio);
         |                         ^~~~~~~~~~
         |                         osq_lock
   fs/nilfs2/page.c:372:54: error: invalid use of undefined type 'struct folio'
     372 |                         nilfs_clear_dirty_page(&folio->page, silent);
         |                                                      ^~
   fs/nilfs2/page.c:373:25: error: implicit declaration of function 'folio_unlock'; did you mean 'osq_unlock'? [-Werror=implicit-function-declaration]
     373 |                         folio_unlock(folio);
         |                         ^~~~~~~~~~~~
         |                         osq_unlock
   fs/nilfs2/page.c:375:17: error: implicit declaration of function 'folio_batch_release' [-Werror=implicit-function-declaration]
     375 |                 folio_batch_release(&fbatch);
         |                 ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:360:28: warning: unused variable 'fbatch' [-Wunused-variable]
     360 |         struct folio_batch fbatch;
         |                            ^~~~~~
   fs/nilfs2/page.c: In function 'nilfs_find_uncommitted_extent':
   fs/nilfs2/page.c:495:28: error: storage size of 'fbatch' isn't known
     495 |         struct folio_batch fbatch;
         |                            ^~~~~~
   fs/nilfs2/page.c:506:21: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror=implicit-function-declaration]
     506 |         nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:516:21: error: implicit declaration of function 'folio_buffers'; did you mean 'lock_buffer'? [-Werror=implicit-function-declaration]
     516 |                 if (folio_buffers(folio)) {
         |                     ^~~~~~~~~~~~~
         |                     lock_buffer
   fs/nilfs2/page.c:520:34: error: invalid use of undefined type 'struct folio'
     520 |                         b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
         |                                  ^~
   fs/nilfs2/page.c:521:35: warning: assignment to 'struct buffer_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     521 |                         bh = head = folio_buffers(folio);
         |                                   ^
   fs/nilfs2/page.c:495:28: warning: unused variable 'fbatch' [-Wunused-variable]
     495 |         struct folio_batch fbatch;
         |                            ^~~~~~
   cc1: some warnings being treated as errors


vim +/filemap_get_folios_tag +366 fs/nilfs2/page.c

   352	
   353	/**
   354	 * nilfs_clear_dirty_pages - discard dirty pages in address space
   355	 * @mapping: address space with dirty pages for discarding
   356	 * @silent: suppress [true] or print [false] warning messages
   357	 */
   358	void nilfs_clear_dirty_pages(struct address_space *mapping, bool silent)
   359	{
   360		struct folio_batch fbatch;
   361		unsigned int i;
   362		pgoff_t index = 0;
   363	
   364		folio_batch_init(&fbatch);
   365	
 > 366		while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
   367					PAGECACHE_TAG_DIRTY, &fbatch)) {
 > 368			for (i = 0; i < folio_batch_count(&fbatch); i++) {
   369				struct folio *folio = fbatch.folios[i];
   370	
   371				folio_lock(folio);
   372				nilfs_clear_dirty_page(&folio->page, silent);
   373				folio_unlock(folio);
   374			}
   375			folio_batch_release(&fbatch);
   376			cond_resched();
   377		}
   378	}
   379	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
