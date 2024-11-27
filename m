Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A3EA41
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 05:02:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732683723; cv=none; b=Hn7ae1KwzhGLLT3ycdIupiqgJB2r0RJWxUMoPmAw25kbg8k3ex95to2SdgtiCgR0u9Di7vYSLzy3kPh9YzAtcpv7eJSRSgOikQPk4LDCoZ6zF+ddOgeWuCNnyWoHa5ObMgs9L2Uw05W5qNE28sMCTu6tdPn3RUzhnylHbHrjpHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732683723; c=relaxed/simple;
	bh=93I7aKsCAhOBGJRngDR+wzk9w7Dw3k9DCMM8OiMv1BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r7IjUkOzL6pCWlqZxwQuR6yLNVizNcGrQNj7/rcDeuL+xJMo6kcQ4SMPnvXGbnwzDfEXm1uafYSQQEf2tfWFau+b05CNHtS7BfQPZQ0h+tBrZqZ04DqGbqVZxyfqN5+i+/8MJ+O92kEyHKC63GWoGXP2mHrtV4NePtxKruFt6rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBDJdFPm; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBDJdFPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732683722; x=1764219722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=93I7aKsCAhOBGJRngDR+wzk9w7Dw3k9DCMM8OiMv1BE=;
  b=KBDJdFPmxV7jH5WPOoBTYrmIrumZWwvGkOPFLeujlzrR/A+Zzqb3jP1J
   vNYDnnk/cIDzgbPNdNQ+2pM6aQdDYP8rck6FFMolK/FL7UsyMGhDooYdC
   xM+UpZKpu+rXYbjyG8l+9bWNEFBJlDP73oeiBK+8N4c7HzXVWrYFqQlzh
   ZLPsNln6KEuFpr5o+OLWbgryAjlnPsBDKyy5mevzjn/Oq57thIPND601M
   GMkriarAX/KZkqCeu3gyXsQN3E3LQa0aZr+bvNq3JQOETOSn4IcxED632
   j6/TniVdSB9oxKFS2MXU3ds2eY1wl+mnvGWDzxW+JG+pm7umKk9Lhq8QQ
   g==;
X-CSE-ConnectionGUID: kl1VUe7JRkKeRI7YWk6efA==
X-CSE-MsgGUID: 0+J0lE9sTHCTsZQrF/kNgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43532351"
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="43532351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 21:02:01 -0800
X-CSE-ConnectionGUID: Enjps72BSUWtS09TNInazA==
X-CSE-MsgGUID: N9nGhlJ6S0+gQ2grIoH1UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,188,1728975600"; 
   d="scan'208";a="92640450"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2024 21:02:00 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGABZ-0007jB-2y;
	Wed, 27 Nov 2024 05:01:57 +0000
Date: Wed, 27 Nov 2024 13:01:48 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:shrunk-page 10/17] fs/ext4/page-io.c:525:50: error:
 incompatible pointer types passing 'struct folio *' to parameter of type
 'struct page *'
Message-ID: <202411271233.Hmz8tflj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache shrunk-page
head:   33bfe880faf38de56225202970e479561a8121de
commit: 46459422dd5d26907895a2d4103b312ba877bc71 [10/17] fscrypt: Change fscrypt_encrypt_pagecache_blocks() to take a folio
config: powerpc-mpc5200_defconfig (https://download.01.org/0day-ci/archive/20241127/202411271233.Hmz8tflj-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271233.Hmz8tflj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271233.Hmz8tflj-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ext4/page-io.c:525:50: error: incompatible pointer types passing 'struct folio *' to parameter of type 'struct page *' [-Werror,-Wincompatible-pointer-types]
                   bounce_page = fscrypt_encrypt_pagecache_blocks(folio,
                                                                  ^~~~~
   include/linux/fscrypt.h:480:74: note: passing argument to parameter 'page' here
   static inline struct page *fscrypt_encrypt_pagecache_blocks(struct page *page,
                                                                            ^
   1 error generated.


vim +525 fs/ext4/page-io.c

   429	
   430	int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
   431			size_t len)
   432	{
   433		struct folio *io_folio = folio;
   434		struct inode *inode = folio->mapping->host;
   435		unsigned block_start;
   436		struct buffer_head *bh, *head;
   437		int ret = 0;
   438		int nr_to_submit = 0;
   439		struct writeback_control *wbc = io->io_wbc;
   440		bool keep_towrite = false;
   441	
   442		BUG_ON(!folio_test_locked(folio));
   443		BUG_ON(folio_test_writeback(folio));
   444	
   445		/*
   446		 * Comments copied from block_write_full_folio:
   447		 *
   448		 * The folio straddles i_size.  It must be zeroed out on each and every
   449		 * writepage invocation because it may be mmapped.  "A file is mapped
   450		 * in multiples of the page size.  For a file that is not a multiple of
   451		 * the page size, the remaining memory is zeroed when mapped, and
   452		 * writes to that region are not written out to the file."
   453		 */
   454		if (len < folio_size(folio))
   455			folio_zero_segment(folio, len, folio_size(folio));
   456		/*
   457		 * In the first loop we prepare and mark buffers to submit. We have to
   458		 * mark all buffers in the folio before submitting so that
   459		 * folio_end_writeback() cannot be called from ext4_end_bio() when IO
   460		 * on the first buffer finishes and we are still working on submitting
   461		 * the second buffer.
   462		 */
   463		bh = head = folio_buffers(folio);
   464		do {
   465			block_start = bh_offset(bh);
   466			if (block_start >= len) {
   467				clear_buffer_dirty(bh);
   468				set_buffer_uptodate(bh);
   469				continue;
   470			}
   471			if (!buffer_dirty(bh) || buffer_delay(bh) ||
   472			    !buffer_mapped(bh) || buffer_unwritten(bh)) {
   473				/* A hole? We can safely clear the dirty bit */
   474				if (!buffer_mapped(bh))
   475					clear_buffer_dirty(bh);
   476				/*
   477				 * Keeping dirty some buffer we cannot write? Make sure
   478				 * to redirty the folio and keep TOWRITE tag so that
   479				 * racing WB_SYNC_ALL writeback does not skip the folio.
   480				 * This happens e.g. when doing writeout for
   481				 * transaction commit or when journalled data is not
   482				 * yet committed.
   483				 */
   484				if (buffer_dirty(bh) ||
   485				    (buffer_jbd(bh) && buffer_jbddirty(bh))) {
   486					if (!folio_test_dirty(folio))
   487						folio_redirty_for_writepage(wbc, folio);
   488					keep_towrite = true;
   489				}
   490				continue;
   491			}
   492			if (buffer_new(bh))
   493				clear_buffer_new(bh);
   494			set_buffer_async_write(bh);
   495			clear_buffer_dirty(bh);
   496			nr_to_submit++;
   497		} while ((bh = bh->b_this_page) != head);
   498	
   499		/* Nothing to submit? Just unlock the folio... */
   500		if (!nr_to_submit)
   501			return 0;
   502	
   503		bh = head = folio_buffers(folio);
   504	
   505		/*
   506		 * If any blocks are being written to an encrypted file, encrypt them
   507		 * into a bounce page.  For simplicity, just encrypt until the last
   508		 * block which might be needed.  This may cause some unneeded blocks
   509		 * (e.g. holes) to be unnecessarily encrypted, but this is rare and
   510		 * can't happen in the common case of blocksize == PAGE_SIZE.
   511		 */
   512		if (fscrypt_inode_uses_fs_layer_crypto(inode)) {
   513			gfp_t gfp_flags = GFP_NOFS;
   514			unsigned int enc_bytes = round_up(len, i_blocksize(inode));
   515			struct page *bounce_page;
   516	
   517			/*
   518			 * Since bounce page allocation uses a mempool, we can only use
   519			 * a waiting mask (i.e. request guaranteed allocation) on the
   520			 * first page of the bio.  Otherwise it can deadlock.
   521			 */
   522			if (io->io_bio)
   523				gfp_flags = GFP_NOWAIT | __GFP_NOWARN;
   524		retry_encrypt:
 > 525			bounce_page = fscrypt_encrypt_pagecache_blocks(folio,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
