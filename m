Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF17A645
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 05:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687671213; x=1719207213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4NaCuCak/EtRqwROPVvqiLIxYqNjUC4LR932Wg2QdQ=;
  b=hzruU7b+NVU1Fox9tPyYYzKnsb+zkuAXZv5UwYovaS7cyNQ8lEUjtHBN
   hWfWOOIB7nq8kGHLQXJYjNP48uKTPHKsQ9RVPXJzJgmBw8aJIzgY/uwKC
   hfBnlUEPaK1SzSdH2l6IXOi1tFQ3PBOj2kAQHiRb2Uiq6NG5V7HBgY6t2
   5PvV43Oh81NYrlux763qWBjm65SzM39tPBxacAhMKqg9E8G7S1i/XfIjt
   Cb5IoumSIigTFLSvqOMD7z0lXoHhJE95Rqz8UBX5KJHUtanYil0v6lrQq
   eZDR41tUnsyyjj5D7cfpVl8PV1Ha+t920GdyeIv+bYt04UBRjCIcQYUPf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="361064183"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="361064183"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 22:33:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="889901034"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="889901034"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jun 2023 22:33:31 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDINO-0009mX-1R;
	Sun, 25 Jun 2023 05:33:30 +0000
Date: Sun, 25 Jun 2023 13:32:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.10 26/55] fs/nilfs2/page.c:495:28: error:
 storage size of 'fbatch' isn't known
Message-ID: <202306251354.snm1zvVd-lkp@intel.com>
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
config: arm-randconfig-r046-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251354.snm1zvVd-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251354.snm1zvVd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251354.snm1zvVd-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/nilfs2/page.c: In function 'nilfs_find_uncommitted_extent':
>> fs/nilfs2/page.c:495:28: error: storage size of 'fbatch' isn't known
     495 |         struct folio_batch fbatch;
         |                            ^~~~~~
>> fs/nilfs2/page.c:503:9: error: implicit declaration of function 'folio_batch_init' [-Werror=implicit-function-declaration]
     503 |         folio_batch_init(&fbatch);
         |         ^~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:506:21: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror=implicit-function-declaration]
     506 |         nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/nilfs2/page.c:515:17: error: implicit declaration of function 'folio_lock'; did you mean 'osq_lock'? [-Werror=implicit-function-declaration]
     515 |                 folio_lock(folio);
         |                 ^~~~~~~~~~
         |                 osq_lock
>> fs/nilfs2/page.c:516:21: error: implicit declaration of function 'folio_buffers'; did you mean 'lock_buffer'? [-Werror=implicit-function-declaration]
     516 |                 if (folio_buffers(folio)) {
         |                     ^~~~~~~~~~~~~
         |                     lock_buffer
>> fs/nilfs2/page.c:520:34: error: invalid use of undefined type 'struct folio'
     520 |                         b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
         |                                  ^~
>> fs/nilfs2/page.c:521:35: warning: assignment to 'struct buffer_head *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     521 |                         bh = head = folio_buffers(folio);
         |                                   ^
>> fs/nilfs2/page.c:537:17: error: implicit declaration of function 'folio_unlock'; did you mean 'osq_unlock'? [-Werror=implicit-function-declaration]
     537 |                 folio_unlock(folio);
         |                 ^~~~~~~~~~~~
         |                 osq_unlock
>> fs/nilfs2/page.c:541:9: error: implicit declaration of function 'folio_batch_release' [-Werror=implicit-function-declaration]
     541 |         folio_batch_release(&fbatch);
         |         ^~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:495:28: warning: unused variable 'fbatch' [-Wunused-variable]
     495 |         struct folio_batch fbatch;
         |                            ^~~~~~
   cc1: some warnings being treated as errors


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
 > 521				bh = head = folio_buffers(folio);
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
