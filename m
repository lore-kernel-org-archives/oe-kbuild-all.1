Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3204BDD5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 20:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695845192; x=1727381192;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TdKVoPTVA79F/RQlGAAEaJj8VgX+aZVKwAVtXmUwctk=;
  b=YNu783XQne7eKtURPZk+i+aeHzmhUl9/ZwAN+1DTb4Gq2qybWd5vVPoq
   8ceD7eKqKY79KT9uTBBO2+KaudCp0BUCBkRNTHHdBfJDZYs3QwA+A/7Wf
   2f3QI5wz3kZ6DSenVZ+hbqM2T4RmQS2dMB+C8QgQsENwyYzwuQXlGNIGU
   DTI6dGJP+bzu5WYLoDAwHBfnoz0NRSVuf65WM6K0jNdcjDd2JaMjlp6Wq
   P/x9+spO+5TW34iJqLSsZI6zPcT4nBDXCCbzr2YnIyzo0PPNsdFAeX8JR
   nsrWbWApHm735ft/m+/qW8pbPweJKu8s+VM/9mIn5RMtrA6ErdG8llt4e
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="468199999"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="468199999"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 13:06:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080305977"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; 
   d="scan'208";a="1080305977"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 27 Sep 2023 13:06:30 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlank-0000cD-03;
	Wed, 27 Sep 2023 20:06:28 +0000
Date: Thu, 28 Sep 2023 04:06:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2_dir_buffer_cache_rfc_wip1 15/15]
 fs/ext2/dir.c:440:26: warning: no previous declaration for
 'ext2_find_entry_old'
Message-ID: <202309280449.KISthPfu-lkp@intel.com>
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
config: i386-randconfig-141-20230927 (https://download.01.org/0day-ci/archive/20230928/202309280449.KISthPfu-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309280449.KISthPfu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280449.KISthPfu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ext2/dir.c:440:26: warning: no previous declaration for 'ext2_find_entry_old' [-Wmissing-declarations]
    struct ext2_dir_entry_2 *ext2_find_entry_old (struct inode *dir,
                             ^~~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c: In function 'ext2_delete_entry':
   fs/ext2/dir.c:818:15: warning: unused variable 'chunksize' [-Wunused-variable]
     unsigned int chunksize = ext2_chunk_size(dir);
                  ^~~~~~~~~
   At top level:
   fs/ext2/dir.c:555:12: warning: 'ext2_handle_dirsync' defined but not used [-Wunused-function]
    static int ext2_handle_dirsync(struct inode *dir)
               ^~~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c:549:12: warning: 'ext2_prepare_chunk' defined but not used [-Wunused-function]
    static int ext2_prepare_chunk(struct page *page, loff_t pos, unsigned len)
               ^~~~~~~~~~~~~~~~~~
   fs/ext2/dir.c:84:13: warning: 'ext2_commit_chunk' defined but not used [-Wunused-function]
    static void ext2_commit_chunk(struct page *page, loff_t pos, unsigned len)
                ^~~~~~~~~~~~~~~~~


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
