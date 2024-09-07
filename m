Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC6BBE6C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Sep 2024 22:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725747633; cv=none; b=kOHyNnaeKOGanjZ/LHREMU1e7tW9vDlztDzhjNE51VSJEsXDwGFxpiC9btgqC0p8ocCdzRKrYCktUh6jIMi36EXPFXDDQrgetSFoCnDKUC38L5H9cFKAZoiNoNRLDdaCIGW5YiYHFnKqHC7INeGXpfdTfd+Ltl3Zgy3c13WbzVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725747633; c=relaxed/simple;
	bh=tFtSgBgi4DE1x33WvTXnl0RR8aIoHdqtXXi7eRNHWJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0tSTt04YO6QqfCaZeHFvxYVQvb8n20BzCJt8FLhA7r3XhUxDqt0Z7bOoMAIXffjIpitHkU0wLPYttS0cS4oujLvHKOTcUg3PG0RdfaHnsuDG5Ke3+5MWgK86o/Hp2+HavWSccchMIt5gT6qCloRGwZELhBCL+uU4sWWBkkVLVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MUevsBVf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MUevsBVf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725747631; x=1757283631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tFtSgBgi4DE1x33WvTXnl0RR8aIoHdqtXXi7eRNHWJ0=;
  b=MUevsBVf5icrft6v+58umbLuUT5PppfxDWEuJtNZlIlNnEZ2/9DTL+FE
   4rpno+sWaDd3YN54EqIHAcBeq8NDsHvI7REMfyF1C7P0jPFrtSDG2lVv6
   2SKvRWahI2MorjrAlJWr3FyoMwLi+mdPzUpMrVLbMiZx4G8WifwUzfB1E
   EJIFRU1Pj85yKiHSbo1OigYagkn61IQZ5d3tlT7WmzPniuwsDFQ5ZXki6
   /n4nBeLNOKig4AzeIXR5REKNfwJNGztJ4aBvq52jXvSUtP5ghjw+oGL7f
   XbXyuYk1vkbmSPfVacTZFUZevcB9ACZ/sbOhnfWzQXAZuEQGu8PwviRp4
   g==;
X-CSE-ConnectionGUID: AbH0y9l/R9K42NGs+ZsZrA==
X-CSE-MsgGUID: i/AW9h3aRoC7aLUGcaVwhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24671042"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24671042"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 15:20:30 -0700
X-CSE-ConnectionGUID: N2TgZdQNTcq2CByZcoqoog==
X-CSE-MsgGUID: aPhH84fIR/CUmomEQNUI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66088862"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Sep 2024 15:20:28 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn3n8-000D3L-2M;
	Sat, 07 Sep 2024 22:20:26 +0000
Date: Sun, 8 Sep 2024 06:19:58 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 60/61] fs/ceph/crypto.c:591:5: error:
 conflicting types for 'ceph_fscrypt_decrypt_extents'; have 'int(struct inode
 *, struct page **, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct
 inode *, struct page **, long long unsigned int,  struct ceph_sparse_e...
Message-ID: <202409080628.0NYsGLqD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   6c59f154a1d493b31755ac17326124d804172fb2
commit: 6c82994e1a63320f135e88826318c9cad0f31d57 [60/61] fixes
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240908/202409080628.0NYsGLqD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080628.0NYsGLqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080628.0NYsGLqD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> fs/ceph/crypto.c:545:5: warning: no previous prototype for 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'; have 'int(struct inode *, struct page **, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct page **, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/super.h:26,
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
6c82994e1a6332 David Howells 2023-08-23  531   * ceph_fscrypt_decrypt_data - Decrypt buffered data
77cdb7e17e39eb Jeff Layton   2022-08-25  532   * @inode: pointer to inode associated with these pages
6c82994e1a6332 David Howells 2023-08-23  533   * @dbuf: pointer to buffer containing the data
77cdb7e17e39eb Jeff Layton   2022-08-25  534   * @off: offset into the file that the read data starts
77cdb7e17e39eb Jeff Layton   2022-08-25  535   * @len: max length to decrypt
77cdb7e17e39eb Jeff Layton   2022-08-25  536   *
6c82994e1a6332 David Howells 2023-08-23  537   * Decrypt an buffer of fscrypt'ed pages and return the amount of
77cdb7e17e39eb Jeff Layton   2022-08-25  538   * data decrypted. Any data in the page prior to the start of the
77cdb7e17e39eb Jeff Layton   2022-08-25  539   * first complete block in the read is ignored. Any incomplete
77cdb7e17e39eb Jeff Layton   2022-08-25  540   * crypto blocks at the end of the array are ignored (and should
77cdb7e17e39eb Jeff Layton   2022-08-25  541   * probably be zeroed by the caller).
77cdb7e17e39eb Jeff Layton   2022-08-25  542   *
77cdb7e17e39eb Jeff Layton   2022-08-25  543   * Returns the length of the decrypted data or a negative errno.
77cdb7e17e39eb Jeff Layton   2022-08-25  544   */
6c82994e1a6332 David Howells 2023-08-23 @545  int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
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
6c82994e1a6332 David Howells 2023-08-23  565  		fret = ceph_fscrypt_decrypt_block_inplace(inode,
6c82994e1a6332 David Howells 2023-08-23  566  				ceph_databuf_page(dbuf, pgidx),
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
