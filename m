Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB3645
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 05:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687669301; x=1719205301;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PoXyi/uQocp+yDSlE3VMErAmWvUx7CuEZ0UDO1wYhNc=;
  b=V+0t1/9QerFoANao8cq6h9NvsByl50F74oq19tO+MlDGsZR/m1oIjTuo
   kNijOCN/zU30JEwSI0S8ex1UKbfkb5xVTKfbLCx3sl8idehx7WYvxgDWa
   XJxB7EI9lSOdvZLvPiePmZ0S2C0yWFbTGrQp7IdxX83UBdtzIx6sW0XYm
   9Ghm+hshkPPD8y38WujBUFcCSxS6+ddoPRSwUhd+zRs8uSSwp07TxCAlo
   WccXYycwvKCWGi2h7mqKGay83YVSUzyO8r2me0zxwMwpW/c5QLt3pEVqR
   Wb5zdgNRqrMDmxo7wAtQurN6Z5CE/CkcQnb17J7yaGwwIVorovX5+kBYE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="341365749"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="341365749"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 22:01:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="1046073081"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="1046073081"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 24 Jun 2023 22:01:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDHsP-0009lc-2t;
	Sun, 25 Jun 2023 05:01:29 +0000
Date: Sun, 25 Jun 2023 13:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-4.19 26325/26342] fs/nilfs2/page.c:500:28:
 error: storage size of 'fbatch' isn't known
Message-ID: <202306251210.WrDEqbbO-lkp@intel.com>
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
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230625/202306251210.WrDEqbbO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251210.WrDEqbbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251210.WrDEqbbO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nilfs2/page.c: In function 'nilfs_find_uncommitted_extent':
>> fs/nilfs2/page.c:500:28: error: storage size of 'fbatch' isn't known
     500 |         struct folio_batch fbatch;
         |                            ^~~~~~
>> fs/nilfs2/page.c:508:9: error: implicit declaration of function 'folio_batch_init' [-Werror=implicit-function-declaration]
     508 |         folio_batch_init(&fbatch);
         |         ^~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:511:21: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror=implicit-function-declaration]
     511 |         nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:520:17: error: implicit declaration of function 'folio_lock'; did you mean 'osq_lock'? [-Werror=implicit-function-declaration]
     520 |                 folio_lock(folio);
         |                 ^~~~~~~~~~
         |                 osq_lock
>> fs/nilfs2/page.c:521:21: error: implicit declaration of function 'folio_buffers'; did you mean 'lock_buffer'? [-Werror=implicit-function-declaration]
     521 |                 if (folio_buffers(folio)) {
         |                     ^~~~~~~~~~~~~
         |                     lock_buffer
>> fs/nilfs2/page.c:525:34: error: invalid use of undefined type 'struct folio'
     525 |                         b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
         |                                  ^~
>> fs/nilfs2/page.c:526:35: warning: assignment to 'struct buffer_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     526 |                         bh = head = folio_buffers(folio);
         |                                   ^
>> fs/nilfs2/page.c:542:17: error: implicit declaration of function 'folio_unlock'; did you mean 'osq_unlock'? [-Werror=implicit-function-declaration]
     542 |                 folio_unlock(folio);
         |                 ^~~~~~~~~~~~
         |                 osq_unlock
>> fs/nilfs2/page.c:546:9: error: implicit declaration of function 'folio_batch_release' [-Werror=implicit-function-declaration]
     546 |         folio_batch_release(&fbatch);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:500:28: warning: unused variable 'fbatch' [-Wunused-variable]
     500 |         struct folio_batch fbatch;
         |                            ^~~~~~
   cc1: some warnings being treated as errors


vim +500 fs/nilfs2/page.c

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
   501		struct folio *folio;
   502	
   503		if (inode->i_mapping->nrpages == 0)
   504			return 0;
   505	
   506		index = start_blk >> (PAGE_SHIFT - inode->i_blkbits);
   507	
 > 508		folio_batch_init(&fbatch);
   509	
   510	repeat:
 > 511		nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
   512				&fbatch);
   513		if (nr_folios == 0)
   514			return length;
   515	
   516		i = 0;
   517		do {
   518			folio = fbatch.folios[i];
   519	
 > 520			folio_lock(folio);
 > 521			if (folio_buffers(folio)) {
   522				struct buffer_head *bh, *head;
   523				sector_t b;
   524	
 > 525				b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
 > 526				bh = head = folio_buffers(folio);
   527				do {
   528					if (b < start_blk)
   529						continue;
   530					if (buffer_delay(bh)) {
   531						if (length == 0)
   532							*blkoff = b;
   533						length++;
   534					} else if (length > 0) {
   535						goto out_locked;
   536					}
   537				} while (++b, bh = bh->b_this_page, bh != head);
   538			} else {
   539				if (length > 0)
   540					goto out_locked;
   541			}
 > 542			folio_unlock(folio);
   543	
   544		} while (++i < nr_folios);
   545	
 > 546		folio_batch_release(&fbatch);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
