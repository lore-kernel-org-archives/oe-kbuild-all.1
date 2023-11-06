Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6681F5248
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Nov 2023 08:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ma+cKwvP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699258574; x=1730794574;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URos9e1Z8GEI4lXzQdZVf+pJrAzOwQTKNOMM8ylQ4dQ=;
  b=Ma+cKwvP1fGNF8ntKJHAGbvlhPOQJYZUO757KvX9eCvzVIV4I7xJmUbS
   o8gkSnzfTuWj+DvZPKFaNpY/Wx3SbQ6Yoq8tlbpQPCAXw6AilcTArVav+
   tE0Lkym9SARLplsl9Itfuvkg9j5iPrjyoBAsBNay2MHk5rwx6m7FNIpqU
   8+bvg0FTKWk45D1HmNL84zvlNEfBiVY0deD8NT2Sls4zQp+lZ4ZpvQHQn
   t5hQPzYNNa+gvJwLnz4OSiLjXjHptT84M8U/56LTqayaXjIrxj6RFfbBy
   ilGjqzcP3pEgqhOHhiouH9DPW7/2zM4Ao+Q9pkdpAf0OSk02fuM4Ab/mV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="455712226"
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="455712226"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 00:16:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,280,1694761200"; 
   d="scan'208";a="3555519"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 06 Nov 2023 00:16:12 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzumI-0006Fn-1F;
	Mon, 06 Nov 2023 08:16:10 +0000
Date: Mon, 6 Nov 2023 16:14:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2_dir_buffer_cache_rfc_wip1 15/15]
 fs/ext2/dir.c:440:25: sparse: sparse: symbol 'ext2_find_entry_old' was not
 declared. Should it be static?
Message-ID: <202311061636.4UaAEQOg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2_dir_buffer_cache_rfc_wip1
head:   3b878bc4805dd97f67ee17c6450059a4a7f2b261
commit: 3b878bc4805dd97f67ee17c6450059a4a7f2b261 [15/15] ext2: everything else to make it work
config: i386-randconfig-061-20230929 (https://download.01.org/0day-ci/archive/20231106/202311061636.4UaAEQOg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311061636.4UaAEQOg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311061636.4UaAEQOg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ext2/dir.c:440:25: sparse: sparse: symbol 'ext2_find_entry_old' was not declared. Should it be static?

vim +/ext2_find_entry_old +440 fs/ext2/dir.c

   423	
   424	/*
   425	 *	ext2_find_entry()
   426	 *
   427	 * finds an entry in the specified directory with the wanted name. It
   428	 * returns the page in which the entry was found (as a parameter - res_page),
   429	 * and the entry itself. Page is returned mapped and unlocked.
   430	 * Entry is guaranteed to be valid.
   431	 *
   432	 * On Success ext2_put_page() should be called on *res_page.
   433	 *
   434	 * NOTE: Calls to ext2_get_page()/ext2_put_page() must be nested according to
   435	 * the rules documented in kmap_local_page()/kunmap_local().
   436	 *
   437	 * ext2_find_entry() and ext2_dotdot() act as a call to ext2_get_page() and
   438	 * should be treated as a call to ext2_get_page() for nesting purposes.
   439	 */
 > 440	struct ext2_dir_entry_2 *ext2_find_entry_old (struct inode *dir,
   441				const struct qstr *child, struct page **res_page)
   442	{
   443		const char *name = child->name;
   444		int namelen = child->len;
   445		unsigned reclen = EXT2_DIR_REC_LEN(namelen);
   446		unsigned long start, n;
   447		unsigned long npages = dir_pages(dir);
   448		struct page *page = NULL;
   449		struct ext2_inode_info *ei = EXT2_I(dir);
   450		ext2_dirent * de;
   451	
   452		if (npages == 0)
   453			goto out;
   454	
   455		/* OFFSET_CACHE */
   456		*res_page = NULL;
   457	
   458		start = ei->i_dir_start_lookup;
   459		if (start >= npages)
   460			start = 0;
   461		n = start;
   462		do {
   463			char *kaddr = ext2_get_page(dir, n, 0, &page);
   464			if (IS_ERR(kaddr))
   465				return ERR_CAST(kaddr);
   466	
   467			de = (ext2_dirent *) kaddr;
   468			kaddr += ext2_last_byte(dir, n) - reclen;
   469			while ((char *) de <= kaddr) {
   470				if (de->rec_len == 0) {
   471					ext2_error(dir->i_sb, __func__,
   472						"zero-length directory entry");
   473					ext2_put_page(page, de);
   474					goto out;
   475				}
   476				if (ext2_match(namelen, name, de))
   477					goto found;
   478				de = ext2_next_entry(de);
   479			}
   480			ext2_put_page(page, kaddr);
   481	
   482			if (++n >= npages)
   483				n = 0;
   484			/* next page is past the blocks we've got */
   485			if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
   486				ext2_error(dir->i_sb, __func__,
   487					"dir %lu size %lld exceeds block count %llu",
   488					dir->i_ino, dir->i_size,
   489					(unsigned long long)dir->i_blocks);
   490				goto out;
   491			}
   492		} while (n != start);
   493	out:
   494		return ERR_PTR(-ENOENT);
   495	
   496	found:
   497		*res_page = page;
   498		ei->i_dir_start_lookup = n;
   499		return de;
   500	}
   501	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
