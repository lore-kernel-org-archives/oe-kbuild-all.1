Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0FA1103
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 11:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687692762; x=1719228762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kEHw/xD/T7QvEZROGecIK+t2kGqnZ/q4Dd0g0qFFtdg=;
  b=VH/uzg3vS65kWSteJAGuFN8SJwkXWyCdkth0nB4mqddlSmvW8Np9jE59
   J1PygZY4tXu5kEuExhTZh0qoU8eLaZNjbycbPnqp0WF7BmbTuO09SUwpN
   cfR3T/9v95pYeZbW2MSBE2X76T5yHkOwvZpgcYTKUtuD5urb82XCQ1FFu
   UrrkxZG8BB+sxa7etGbe3HCEzFmyaBks1fq7VMfie1Ij0WuDqrYSwc1b9
   2jUujAmX60K8b8JbR0B6lTTJdTSK+LyyEEHMzvJYZRds//JPmsTby7aAd
   Cxdp2tcDByEEkkM5zEysHbTLFwpg4f7amJP949v68VolwHcr9xrVD0iDE
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="361090185"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="361090185"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 04:32:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="889983739"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="889983739"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 25 Jun 2023 04:32:39 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDNyx-000A00-0c;
	Sun, 25 Jun 2023 11:32:39 +0000
Date: Sun, 25 Jun 2023 19:32:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 27/55] fs/nilfs2/page.c:366:9: error:
 implicit declaration of function 'filemap_get_folios_tag'
Message-ID: <202306251912.760acZkE-lkp@intel.com>
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
config: i386-randconfig-i013-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251912.760acZkE-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251912.760acZkE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251912.760acZkE-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nilfs2/page.c:360:21: error: variable has incomplete type 'struct folio_batch'
           struct folio_batch fbatch;
                              ^
   fs/nilfs2/page.c:360:9: note: forward declaration of 'struct folio_batch'
           struct folio_batch fbatch;
                  ^
   fs/nilfs2/page.c:364:2: error: implicit declaration of function 'folio_batch_init' [-Werror,-Wimplicit-function-declaration]
           folio_batch_init(&fbatch);
           ^
>> fs/nilfs2/page.c:366:9: error: implicit declaration of function 'filemap_get_folios_tag' [-Werror,-Wimplicit-function-declaration]
           while (filemap_get_folios_tag(mapping, &index, (pgoff_t)-1,
                  ^
>> fs/nilfs2/page.c:368:19: error: implicit declaration of function 'folio_batch_count' [-Werror,-Wimplicit-function-declaration]
                   for (i = 0; i < folio_batch_count(&fbatch); i++) {
                                   ^
   fs/nilfs2/page.c:371:4: error: implicit declaration of function 'folio_lock' [-Werror,-Wimplicit-function-declaration]
                           folio_lock(folio);
                           ^
   fs/nilfs2/page.c:372:33: error: incomplete definition of type 'struct folio'
                           nilfs_clear_dirty_page(&folio->page, silent);
                                                   ~~~~~^
   fs/nilfs2/page.c:369:11: note: forward declaration of 'struct folio'
                           struct folio *folio = fbatch.folios[i];
                                  ^
   fs/nilfs2/page.c:373:4: error: implicit declaration of function 'folio_unlock' [-Werror,-Wimplicit-function-declaration]
                           folio_unlock(folio);
                           ^
   fs/nilfs2/page.c:375:3: error: implicit declaration of function 'folio_batch_release' [-Werror,-Wimplicit-function-declaration]
                   folio_batch_release(&fbatch);
                   ^
   fs/nilfs2/page.c:495:21: error: variable has incomplete type 'struct folio_batch'
           struct folio_batch fbatch;
                              ^
   fs/nilfs2/page.c:495:9: note: forward declaration of 'struct folio_batch'
           struct folio_batch fbatch;
                  ^
   fs/nilfs2/page.c:503:2: error: implicit declaration of function 'folio_batch_init' [-Werror,-Wimplicit-function-declaration]
           folio_batch_init(&fbatch);
           ^
   fs/nilfs2/page.c:506:14: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror,-Wimplicit-function-declaration]
           nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
                       ^
   fs/nilfs2/page.c:515:3: error: implicit declaration of function 'folio_lock' [-Werror,-Wimplicit-function-declaration]
                   folio_lock(folio);
                   ^
   fs/nilfs2/page.c:516:7: error: implicit declaration of function 'folio_buffers' [-Werror,-Wimplicit-function-declaration]
                   if (folio_buffers(folio)) {
                       ^
   fs/nilfs2/page.c:520:13: error: incomplete definition of type 'struct folio'
                           b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
                               ~~~~~^
   fs/nilfs2/page.c:496:9: note: forward declaration of 'struct folio'
           struct folio *folio;
                  ^
   fs/nilfs2/page.c:521:14: error: incompatible integer to pointer conversion assigning to 'struct buffer_head *' from 'int' [-Wint-conversion]
                           bh = head = folio_buffers(folio);
                                     ^ ~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:537:3: error: implicit declaration of function 'folio_unlock' [-Werror,-Wimplicit-function-declaration]
                   folio_unlock(folio);
                   ^
   fs/nilfs2/page.c:541:2: error: implicit declaration of function 'folio_batch_release' [-Werror,-Wimplicit-function-declaration]
           folio_batch_release(&fbatch);
           ^
   fs/nilfs2/page.c:546:2: error: implicit declaration of function 'folio_unlock' [-Werror,-Wimplicit-function-declaration]
           folio_unlock(folio);
           ^
   18 errors generated.


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
