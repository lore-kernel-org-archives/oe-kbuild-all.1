Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F2CA186F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 07:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705648134; cv=none; b=APXluYxHUZL2gLkd6iKim3ANJ1X0p/pbSelZZYqZloAKbbjm50Y8ISUgxGXLNKHrhah3GsfCuZo6CFTt6684PxBkuHtiencQBsy0VOAqGwKM1Cok9HZxhwfNjY0Lo/AVIYvjDrWJipcOiPK/QkX7Wgb1s02bQWYMjkjYxK6ra78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705648134; c=relaxed/simple;
	bh=23qAmk0xuZo77ffy5gtdhiNhzJD5Dy91FkBD1e2snjg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nq/zaxXiWpjQEqOgCwvjh/NQk4k+nOVaDWvB3A2ECiGn7IWQ5qzt1CgH2hKD6sZOfSWEJgORxZ1+zkONG6wZCILd6s87+9VzQ6EF/sJKGmv9f7bIuqVQgrOjFrtPqf4o2B1lyle9acDNrbk8OsWeIGkjxLedSuEdFgPsRKHizmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZxn2JEB; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZxn2JEB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705648132; x=1737184132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=23qAmk0xuZo77ffy5gtdhiNhzJD5Dy91FkBD1e2snjg=;
  b=fZxn2JEBiVzooJu0C+Il+hrXpOUSZNWN8pdXkD7yctz2cKaYB5t8Pz1Z
   jRBnDw8tSbq06Cz1+lo/4OhEmoA70qPkP/IQRVx3/4jff0MftVBZrkgIi
   b9qG321ZfqvP3LRG906j8H96e1ZAsGTyc/0I4nxXFEkU7w+SIC0J6XAbe
   jbt8ku9JmFP6UGHfi2YD6rSfxvqob+dQ4uqRgN+jJIpJefHWflJ04rbUJ
   Aoc6+SSI6MEIFVJP1+Lzz2JzdFWF+bmmU3aPVOt6F+gf1NURCCUxd0rNI
   hO221sTJvzLb3kNtROYOM539IeNiZaR2QFH1hhI3/G+aT3zos3nch/5w/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="391119214"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="391119214"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 23:08:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="958053552"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="958053552"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Jan 2024 23:08:49 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQizf-0003kG-0j;
	Fri, 19 Jan 2024 07:08:47 +0000
Date: Fri, 19 Jan 2024 15:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 104/105] fs/ceph/crypto.c:591:5: error:
 conflicting types for 'ceph_fscrypt_decrypt_extents'; have 'int(struct inode
 *, struct page **, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct
 inode *, struct page **, long long unsigned int,  struct ceph_sparse_e...
Message-ID: <202401191542.03dlInqN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   2cf82c6e7baf6d3a2adc0692707028da395f1553
commit: 8c002b7822991845125f6d219796f28b75055b90 [104/105] fixes
config: i386-randconfig-141-20240117 (https://download.01.org/0day-ci/archive/20240119/202401191542.03dlInqN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191542.03dlInqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191542.03dlInqN-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/crypto.c:545:5: warning: no previous prototype for 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'; have 'int(struct inode *, struct page **, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct page **, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/super.h:25,
                    from fs/ceph/crypto.c:14:
   fs/ceph/crypto.h:160:5: note: previous declaration of 'ceph_fscrypt_decrypt_extents' with type 'int(struct inode *, struct ceph_databuf *, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct ceph_databuf *, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     160 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct ceph_databuf *dbuf, u64 off,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_fscrypt_decrypt_extents':
>> fs/ceph/crypto.c:625:58: error: passing argument 2 of 'ceph_fscrypt_decrypt_pages' from incompatible pointer type [-Werror=incompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
         |                                                          |
         |                                                          struct page **
   fs/ceph/crypto.c:545:74: note: expected 'struct ceph_databuf *' but argument is of type 'struct page **'
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~^~~~
   cc1: some warnings being treated as errors


vim +591 fs/ceph/crypto.c

77cdb7e17e39eb Jeff Layton   2022-08-25  529  
77cdb7e17e39eb Jeff Layton   2022-08-25  530  /**
8c002b78229918 David Howells 2023-08-23  531   * ceph_fscrypt_decrypt_data - Decrypt buffered data
77cdb7e17e39eb Jeff Layton   2022-08-25  532   * @inode: pointer to inode associated with these pages
8c002b78229918 David Howells 2023-08-23  533   * @dbuf: pointer to buffer containing the data
77cdb7e17e39eb Jeff Layton   2022-08-25  534   * @off: offset into the file that the read data starts
77cdb7e17e39eb Jeff Layton   2022-08-25  535   * @len: max length to decrypt
77cdb7e17e39eb Jeff Layton   2022-08-25  536   *
8c002b78229918 David Howells 2023-08-23  537   * Decrypt an buffer of fscrypt'ed pages and return the amount of
77cdb7e17e39eb Jeff Layton   2022-08-25  538   * data decrypted. Any data in the page prior to the start of the
77cdb7e17e39eb Jeff Layton   2022-08-25  539   * first complete block in the read is ignored. Any incomplete
77cdb7e17e39eb Jeff Layton   2022-08-25  540   * crypto blocks at the end of the array are ignored (and should
77cdb7e17e39eb Jeff Layton   2022-08-25  541   * probably be zeroed by the caller).
77cdb7e17e39eb Jeff Layton   2022-08-25  542   *
77cdb7e17e39eb Jeff Layton   2022-08-25  543   * Returns the length of the decrypted data or a negative errno.
77cdb7e17e39eb Jeff Layton   2022-08-25  544   */
8c002b78229918 David Howells 2023-08-23 @545  int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
77cdb7e17e39eb Jeff Layton   2022-08-25  546  			       u64 off, int len)
77cdb7e17e39eb Jeff Layton   2022-08-25  547  {
77cdb7e17e39eb Jeff Layton   2022-08-25  548  	int i, num_blocks;
77cdb7e17e39eb Jeff Layton   2022-08-25  549  	u64 baseblk = off >> CEPH_FSCRYPT_BLOCK_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  550  	int ret = 0;
77cdb7e17e39eb Jeff Layton   2022-08-25  551  
77cdb7e17e39eb Jeff Layton   2022-08-25  552  	/*
77cdb7e17e39eb Jeff Layton   2022-08-25  553  	 * We can't deal with partial blocks on an encrypted file, so mask off
77cdb7e17e39eb Jeff Layton   2022-08-25  554  	 * the last bit.
77cdb7e17e39eb Jeff Layton   2022-08-25  555  	 */
77cdb7e17e39eb Jeff Layton   2022-08-25  556  	num_blocks = ceph_fscrypt_blocks(off, len & CEPH_FSCRYPT_BLOCK_MASK);
77cdb7e17e39eb Jeff Layton   2022-08-25  557  
77cdb7e17e39eb Jeff Layton   2022-08-25  558  	/* Decrypt each block */
77cdb7e17e39eb Jeff Layton   2022-08-25  559  	for (i = 0; i < num_blocks; ++i) {
77cdb7e17e39eb Jeff Layton   2022-08-25  560  		int blkoff = i << CEPH_FSCRYPT_BLOCK_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  561  		int pgidx = blkoff >> PAGE_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  562  		unsigned int pgoffs = offset_in_page(blkoff);
77cdb7e17e39eb Jeff Layton   2022-08-25  563  		int fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  564  
8c002b78229918 David Howells 2023-08-23  565  		fret = ceph_fscrypt_decrypt_block_inplace(inode,
8c002b78229918 David Howells 2023-08-23  566  				ceph_databuf_page(dbuf, pgidx),
77cdb7e17e39eb Jeff Layton   2022-08-25  567  				CEPH_FSCRYPT_BLOCK_SIZE, pgoffs,
77cdb7e17e39eb Jeff Layton   2022-08-25  568  				baseblk + i);
77cdb7e17e39eb Jeff Layton   2022-08-25  569  		if (fret < 0) {
77cdb7e17e39eb Jeff Layton   2022-08-25  570  			if (ret == 0)
77cdb7e17e39eb Jeff Layton   2022-08-25  571  				ret = fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  572  			break;
77cdb7e17e39eb Jeff Layton   2022-08-25  573  		}
77cdb7e17e39eb Jeff Layton   2022-08-25  574  		ret += CEPH_FSCRYPT_BLOCK_SIZE;
77cdb7e17e39eb Jeff Layton   2022-08-25  575  	}
77cdb7e17e39eb Jeff Layton   2022-08-25  576  	return ret;
77cdb7e17e39eb Jeff Layton   2022-08-25  577  }
77cdb7e17e39eb Jeff Layton   2022-08-25  578  
77cdb7e17e39eb Jeff Layton   2022-08-25  579  /**
77cdb7e17e39eb Jeff Layton   2022-08-25  580   * ceph_fscrypt_decrypt_extents: decrypt received extents in given buffer
77cdb7e17e39eb Jeff Layton   2022-08-25  581   * @inode: inode associated with pages being decrypted
77cdb7e17e39eb Jeff Layton   2022-08-25  582   * @page: pointer to page array
77cdb7e17e39eb Jeff Layton   2022-08-25  583   * @off: offset into the file that the data in page[0] starts
77cdb7e17e39eb Jeff Layton   2022-08-25  584   * @map: pointer to extent array
77cdb7e17e39eb Jeff Layton   2022-08-25  585   * @ext_cnt: length of extent array
77cdb7e17e39eb Jeff Layton   2022-08-25  586   *
77cdb7e17e39eb Jeff Layton   2022-08-25  587   * Given an extent map and a page array, decrypt the received data in-place,
77cdb7e17e39eb Jeff Layton   2022-08-25  588   * skipping holes. Returns the offset into buffer of end of last decrypted
77cdb7e17e39eb Jeff Layton   2022-08-25  589   * block.
77cdb7e17e39eb Jeff Layton   2022-08-25  590   */
77cdb7e17e39eb Jeff Layton   2022-08-25 @591  int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
77cdb7e17e39eb Jeff Layton   2022-08-25  592  				 u64 off, struct ceph_sparse_extent *map,
77cdb7e17e39eb Jeff Layton   2022-08-25  593  				 u32 ext_cnt)
77cdb7e17e39eb Jeff Layton   2022-08-25  594  {
38d46409c4639a Xiubo Li      2023-06-12  595  	struct ceph_client *cl = ceph_inode_to_client(inode);
77cdb7e17e39eb Jeff Layton   2022-08-25  596  	int i, ret = 0;
77cdb7e17e39eb Jeff Layton   2022-08-25  597  	struct ceph_inode_info *ci = ceph_inode(inode);
77cdb7e17e39eb Jeff Layton   2022-08-25  598  	u64 objno, objoff;
77cdb7e17e39eb Jeff Layton   2022-08-25  599  	u32 xlen;
77cdb7e17e39eb Jeff Layton   2022-08-25  600  
77cdb7e17e39eb Jeff Layton   2022-08-25  601  	/* Nothing to do for empty array */
77cdb7e17e39eb Jeff Layton   2022-08-25  602  	if (ext_cnt == 0) {
38d46409c4639a Xiubo Li      2023-06-12  603  		doutc(cl, "%p %llx.%llx empty array, ret 0\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  604  		      ceph_vinop(inode));
77cdb7e17e39eb Jeff Layton   2022-08-25  605  		return 0;
77cdb7e17e39eb Jeff Layton   2022-08-25  606  	}
77cdb7e17e39eb Jeff Layton   2022-08-25  607  
77cdb7e17e39eb Jeff Layton   2022-08-25  608  	ceph_calc_file_object_mapping(&ci->i_layout, off, map[0].len,
77cdb7e17e39eb Jeff Layton   2022-08-25  609  				      &objno, &objoff, &xlen);
77cdb7e17e39eb Jeff Layton   2022-08-25  610  
77cdb7e17e39eb Jeff Layton   2022-08-25  611  	for (i = 0; i < ext_cnt; ++i) {
77cdb7e17e39eb Jeff Layton   2022-08-25  612  		struct ceph_sparse_extent *ext = &map[i];
77cdb7e17e39eb Jeff Layton   2022-08-25  613  		int pgsoff = ext->off - objoff;
77cdb7e17e39eb Jeff Layton   2022-08-25  614  		int pgidx = pgsoff >> PAGE_SHIFT;
77cdb7e17e39eb Jeff Layton   2022-08-25  615  		int fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  616  
77cdb7e17e39eb Jeff Layton   2022-08-25  617  		if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
38d46409c4639a Xiubo Li      2023-06-12  618  			pr_warn_client(cl,
38d46409c4639a Xiubo Li      2023-06-12  619  				"%p %llx.%llx bad encrypted sparse extent "
38d46409c4639a Xiubo Li      2023-06-12  620  				"idx %d off %llx len %llx\n",
38d46409c4639a Xiubo Li      2023-06-12  621  				inode, ceph_vinop(inode), i, ext->off,
38d46409c4639a Xiubo Li      2023-06-12  622  				ext->len);
77cdb7e17e39eb Jeff Layton   2022-08-25  623  			return -EIO;
77cdb7e17e39eb Jeff Layton   2022-08-25  624  		}
77cdb7e17e39eb Jeff Layton   2022-08-25 @625  		fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
77cdb7e17e39eb Jeff Layton   2022-08-25  626  						 off + pgsoff, ext->len);
38d46409c4639a Xiubo Li      2023-06-12  627  		doutc(cl, "%p %llx.%llx [%d] 0x%llx~0x%llx fret %d\n", inode,
38d46409c4639a Xiubo Li      2023-06-12  628  		      ceph_vinop(inode), i, ext->off, ext->len, fret);
77cdb7e17e39eb Jeff Layton   2022-08-25  629  		if (fret < 0) {
77cdb7e17e39eb Jeff Layton   2022-08-25  630  			if (ret == 0)
77cdb7e17e39eb Jeff Layton   2022-08-25  631  				ret = fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  632  			break;
77cdb7e17e39eb Jeff Layton   2022-08-25  633  		}
77cdb7e17e39eb Jeff Layton   2022-08-25  634  		ret = pgsoff + fret;
77cdb7e17e39eb Jeff Layton   2022-08-25  635  	}
38d46409c4639a Xiubo Li      2023-06-12  636  	doutc(cl, "ret %d\n", ret);
77cdb7e17e39eb Jeff Layton   2022-08-25  637  	return ret;
77cdb7e17e39eb Jeff Layton   2022-08-25  638  }
77cdb7e17e39eb Jeff Layton   2022-08-25  639  

:::::: The code at line 591 was first introduced by commit
:::::: 77cdb7e17e39ebb986f60bbd3c2b3507687bf475 ceph: add infrastructure for file encryption and decryption

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
