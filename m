Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D399EA4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 09:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687684179; x=1719220179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XT2BigcODpGi78GL+eKhtDrvBpBX0DzBk9Ul9Mt2yY8=;
  b=Z2SKb124HT54AcjbUmdI0UKLahpOy6XqnJLyq+lFs0aqKVu7mbXTF/Pe
   dc+pRu1v9gHK3KG+i2CLwcQL5FiVl14dfEVw98li8fzXkdl6NbHkXwafi
   jSsGbTZXWXIF504DkzH3FfJ8so7zR6Szlnxd9PpzcMe3Mrdqjl4/Skob4
   0xD6RfLL2z4UteD11zOXVfq/Vo6ociGvWUEL2mqDcgrl+ONeh/M/DXoWw
   S64U7UMQXVypOxXeCKOmG5eF4rA6wUVo2iM5GCknJa4pJxX6ssm7npLit
   0eUcJ7QjUL+SXekJNiAKU2gQ+zBBSefx7/kjCUU4sYL64MMNIu2pdi0Fq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="424720370"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="424720370"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 02:09:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="709905529"
X-IronPort-AV: E=Sophos;i="6.01,157,1684825200"; 
   d="scan'208";a="709905529"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 25 Jun 2023 02:09:37 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDLkW-0009vh-1Q;
	Sun, 25 Jun 2023 09:09:36 +0000
Date: Sun, 25 Jun 2023 17:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 26/55] fs/nilfs2/page.c:495:21: error:
 variable has incomplete type 'struct folio_batch'
Message-ID: <202306251733.FK04Tzbh-lkp@intel.com>
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
commit: e2173c13560d8c56f0cbc7176bd124608b5fbda4 [26/55] nilfs2: convert nilfs_find_uncommited_extent() to use filemap_get_folios_contig()
config: i386-randconfig-i013-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251733.FK04Tzbh-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251733.FK04Tzbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251733.FK04Tzbh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nilfs2/page.c:495:21: error: variable has incomplete type 'struct folio_batch'
           struct folio_batch fbatch;
                              ^
   fs/nilfs2/page.c:495:9: note: forward declaration of 'struct folio_batch'
           struct folio_batch fbatch;
                  ^
>> fs/nilfs2/page.c:503:2: error: implicit declaration of function 'folio_batch_init' [-Werror,-Wimplicit-function-declaration]
           folio_batch_init(&fbatch);
           ^
>> fs/nilfs2/page.c:506:14: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror,-Wimplicit-function-declaration]
           nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
                       ^
>> fs/nilfs2/page.c:515:3: error: implicit declaration of function 'folio_lock' [-Werror,-Wimplicit-function-declaration]
                   folio_lock(folio);
                   ^
>> fs/nilfs2/page.c:516:7: error: implicit declaration of function 'folio_buffers' [-Werror,-Wimplicit-function-declaration]
                   if (folio_buffers(folio)) {
                       ^
>> fs/nilfs2/page.c:520:13: error: incomplete definition of type 'struct folio'
                           b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
                               ~~~~~^
   fs/nilfs2/page.c:496:9: note: forward declaration of 'struct folio'
           struct folio *folio;
                  ^
   fs/nilfs2/page.c:521:14: error: incompatible integer to pointer conversion assigning to 'struct buffer_head *' from 'int' [-Wint-conversion]
                           bh = head = folio_buffers(folio);
                                     ^ ~~~~~~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:537:3: error: implicit declaration of function 'folio_unlock' [-Werror,-Wimplicit-function-declaration]
                   folio_unlock(folio);
                   ^
>> fs/nilfs2/page.c:541:2: error: implicit declaration of function 'folio_batch_release' [-Werror,-Wimplicit-function-declaration]
           folio_batch_release(&fbatch);
           ^
   fs/nilfs2/page.c:546:2: error: implicit declaration of function 'folio_unlock' [-Werror,-Wimplicit-function-declaration]
           folio_unlock(folio);
           ^
   10 errors generated.


vim +495 fs/nilfs2/page.c

   475	
   476	/**
   477	 * nilfs_find_uncommitted_extent - find extent of uncommitted data
   478	 * @inode: inode
   479	 * @start_blk: start block offset (in)
   480	 * @blkoff: start offset of the found extent (out)
   481	 *
   482	 * This function searches an extent of buffers marked "delayed" which
   483	 * starts from a block offset equal to or larger than @start_blk.  If
   484	 * such an extent was found, this will store the start offset in
   485	 * @blkoff and return its length in blocks.  Otherwise, zero is
   486	 * returned.
   487	 */
   488	unsigned long nilfs_find_uncommitted_extent(struct inode *inode,
   489						    sector_t start_blk,
   490						    sector_t *blkoff)
   491	{
   492		unsigned int i, nr_folios;
   493		pgoff_t index;
   494		unsigned long length = 0;
 > 495		struct folio_batch fbatch;
   496		struct folio *folio;
   497	
   498		if (inode->i_mapping->nrpages == 0)
   499			return 0;
   500	
   501		index = start_blk >> (PAGE_SHIFT - inode->i_blkbits);
   502	
 > 503		folio_batch_init(&fbatch);
   504	
   505	repeat:
 > 506		nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
   507				&fbatch);
   508		if (nr_folios == 0)
   509			return length;
   510	
   511		i = 0;
   512		do {
   513			folio = fbatch.folios[i];
   514	
 > 515			folio_lock(folio);
 > 516			if (folio_buffers(folio)) {
   517				struct buffer_head *bh, *head;
   518				sector_t b;
   519	
 > 520				b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
   521				bh = head = folio_buffers(folio);
   522				do {
   523					if (b < start_blk)
   524						continue;
   525					if (buffer_delay(bh)) {
   526						if (length == 0)
   527							*blkoff = b;
   528						length++;
   529					} else if (length > 0) {
   530						goto out_locked;
   531					}
   532				} while (++b, bh = bh->b_this_page, bh != head);
   533			} else {
   534				if (length > 0)
   535					goto out_locked;
   536			}
 > 537			folio_unlock(folio);
   538	
   539		} while (++i < nr_folios);
   540	
 > 541		folio_batch_release(&fbatch);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
