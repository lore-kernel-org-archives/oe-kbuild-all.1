Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2BB7C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 06:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687675595; x=1719211595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UPXNOo6q5Klkf/3XVNXFWzACu87AOc2h316mCnZrUK0=;
  b=l34P7PHl42d/qLxheY4i/DtvSo9uFPxwp9KKGJoKhYvsWSFFICfP7n4Q
   Jh9vhhHJIB5lBeQayPSDBXjt5JCbFS9h0iMiw2Cu8c+jl5oHlgaddPwxG
   MPnkseeelaPbIQSdHjKEn5pDLN2a6iNRlGjBu6KZcRq9KYe1Q8Ualr8DO
   AUBeQWuFOLV0PxzoGrImpysuzze/kcFa8h8afJUNALSgiJKx/m4QZbUO3
   zXYf0WJHWlkDJVwqcf8cJbW4boPwAAKz0l0cEDB6dpbqG7dtvltwcCBs/
   PW8ybnrdYFdaas6/Bl4OuK+s8PMZkLre19xMmkqUHzZ9fIm0mN8Mz4l0o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="391181289"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="391181289"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 23:46:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="745419707"
X-IronPort-AV: E=Sophos;i="6.01,156,1684825200"; 
   d="scan'208";a="745419707"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Jun 2023 23:46:33 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qDJW4-0009qH-1E;
	Sun, 25 Jun 2023 06:46:32 +0000
Date: Sun, 25 Jun 2023 14:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 17/38] fs/nilfs2/page.c:523:14: error:
 incompatible integer to pointer conversion assigning to 'struct buffer_head
 *' from 'int'
Message-ID: <202306251411.TljVswBY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   519428749fe1d2dd5f0ff6997c42339b380dedfb
commit: af7afe4874db46b37ee9d21b4e3ce799a35e4a27 [17/38] nilfs2: convert nilfs_find_uncommited_extent() to use filemap_get_folios_contig()
config: x86_64-randconfig-a013-20230625 (https://download.01.org/0day-ci/archive/20230625/202306251411.TljVswBY-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306251411.TljVswBY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306251411.TljVswBY-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nilfs2/page.c:497:21: error: variable has incomplete type 'struct folio_batch'
           struct folio_batch fbatch;
                              ^
   fs/nilfs2/page.c:497:9: note: forward declaration of 'struct folio_batch'
           struct folio_batch fbatch;
                  ^
   fs/nilfs2/page.c:505:2: error: implicit declaration of function 'folio_batch_init' [-Werror,-Wimplicit-function-declaration]
           folio_batch_init(&fbatch);
           ^
   fs/nilfs2/page.c:508:14: error: implicit declaration of function 'filemap_get_folios_contig' [-Werror,-Wimplicit-function-declaration]
           nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
                       ^
   fs/nilfs2/page.c:517:3: error: implicit declaration of function 'folio_lock' [-Werror,-Wimplicit-function-declaration]
                   folio_lock(folio);
                   ^
   fs/nilfs2/page.c:518:7: error: implicit declaration of function 'folio_buffers' [-Werror,-Wimplicit-function-declaration]
                   if (folio_buffers(folio)) {
                       ^
   fs/nilfs2/page.c:522:13: error: incomplete definition of type 'struct folio'
                           b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
                               ~~~~~^
   fs/nilfs2/page.c:498:9: note: forward declaration of 'struct folio'
           struct folio *folio;
                  ^
>> fs/nilfs2/page.c:523:14: error: incompatible integer to pointer conversion assigning to 'struct buffer_head *' from 'int' [-Wint-conversion]
                           bh = head = folio_buffers(folio);
                                     ^ ~~~~~~~~~~~~~~~~~~~~
   fs/nilfs2/page.c:539:3: error: implicit declaration of function 'folio_unlock' [-Werror,-Wimplicit-function-declaration]
                   folio_unlock(folio);
                   ^
   fs/nilfs2/page.c:543:2: error: implicit declaration of function 'folio_batch_release' [-Werror,-Wimplicit-function-declaration]
           folio_batch_release(&fbatch);
           ^
   fs/nilfs2/page.c:548:2: error: implicit declaration of function 'folio_unlock' [-Werror,-Wimplicit-function-declaration]
           folio_unlock(folio);
           ^
   10 errors generated.


vim +523 fs/nilfs2/page.c

   477	
   478	/**
   479	 * nilfs_find_uncommitted_extent - find extent of uncommitted data
   480	 * @inode: inode
   481	 * @start_blk: start block offset (in)
   482	 * @blkoff: start offset of the found extent (out)
   483	 *
   484	 * This function searches an extent of buffers marked "delayed" which
   485	 * starts from a block offset equal to or larger than @start_blk.  If
   486	 * such an extent was found, this will store the start offset in
   487	 * @blkoff and return its length in blocks.  Otherwise, zero is
   488	 * returned.
   489	 */
   490	unsigned long nilfs_find_uncommitted_extent(struct inode *inode,
   491						    sector_t start_blk,
   492						    sector_t *blkoff)
   493	{
   494		unsigned int i, nr_folios;
   495		pgoff_t index;
   496		unsigned long length = 0;
   497		struct folio_batch fbatch;
   498		struct folio *folio;
   499	
   500		if (inode->i_mapping->nrpages == 0)
   501			return 0;
   502	
   503		index = start_blk >> (PAGE_SHIFT - inode->i_blkbits);
   504	
   505		folio_batch_init(&fbatch);
   506	
   507	repeat:
   508		nr_folios = filemap_get_folios_contig(inode->i_mapping, &index, ULONG_MAX,
   509				&fbatch);
   510		if (nr_folios == 0)
   511			return length;
   512	
   513		i = 0;
   514		do {
   515			folio = fbatch.folios[i];
   516	
   517			folio_lock(folio);
   518			if (folio_buffers(folio)) {
   519				struct buffer_head *bh, *head;
   520				sector_t b;
   521	
   522				b = folio->index << (PAGE_SHIFT - inode->i_blkbits);
 > 523				bh = head = folio_buffers(folio);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
