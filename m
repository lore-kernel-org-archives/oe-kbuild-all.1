Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBE52F63
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705675028; cv=none; b=BwtxPzv+gkrIz/poH75V8LHU2Rae3aZME8J4p1LSBLlTcmssi7kBYvGkuj9lxxgYAUJr7sg323EoiRU+CF719gQVJluUE3DtkYSmKkMPJmCkE1egQqNNI/EqGZMoGCpq8UzshWOPzPcQb0lZ18WGV/wH18BkeW2YabFsuQoQTVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705675028; c=relaxed/simple;
	bh=m1/zOzyJujocxU/iUB1F4U11lixsVubr+c3if/+A2u4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EjUjlI0OwGSdLAhgd8l3RtzkHSgqJ+nxvtmNq15eNV77Y82ZrTv9wr4v2Uj/6x5hfH9wJ6SWVge8xGslLKN8YWBC1dRBzqE/iyA4+XODSAETzzmA+LVTX06ztRptwbhY2hoVvAGn8gJXf27Bksk1MNuBurNCjMIc76LvIe41QcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlZ4rRDu; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlZ4rRDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705675026; x=1737211026;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1/zOzyJujocxU/iUB1F4U11lixsVubr+c3if/+A2u4=;
  b=ZlZ4rRDuR2Fttux9Dqu2k+yFga3K19/MaNWyUuJ+vlZBa0C/3g/u38Hk
   fkR11qB46kKrEe4OqxtYnaFNGk4B9iU7KKqcSToyt9bZCqyM48nu/ePqm
   ghqCfJW1b8N+xsdPIc2Q92Y2EXbJahKXx8ijBa1a6mwFkZ8h91CfX+/Ge
   hmPY5l1vXPrpFvkhpL3NcrKagODBCvVF2A8HGk0FjF8kcUG0QXrXfw0YO
   IxuKl+P6T6Do7oREYru570Qn4pNjoa30bRZVV1q5xmyIE9UCCsZVriaCy
   PYr2Pl6zk/A786qlXBWs59JXC8Oj5D2vZGI8J35/+Q9TCXC2S/+TKEpZu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="7448148"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="7448148"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 06:37:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="26781398"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Jan 2024 06:37:05 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQpzR-00049E-2l;
	Fri, 19 Jan 2024 14:37:01 +0000
Date: Fri, 19 Jan 2024 22:36:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 105/105] fs/ceph/crypto.c:644:42: error: 'op'
 undeclared; did you mean 'up'?
Message-ID: <202401192255.PDG6e4s5-lkp@intel.com>
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
commit: 2cf82c6e7baf6d3a2adc0692707028da395f1553 [105/105] ceph: Use netfslib
config: i386-randconfig-141-20240117 (https://download.01.org/0day-ci/archive/20240119/202401192255.PDG6e4s5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401192255.PDG6e4s5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401192255.PDG6e4s5-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/crypto.c:545:5: warning: no previous prototype for 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c:591:5: error: conflicting types for 'ceph_fscrypt_decrypt_extents'; have 'int(struct inode *, struct page **, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct page **, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     591 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from fs/ceph/super.h:25,
                    from fs/ceph/crypto.c:14:
   fs/ceph/crypto.h:160:5: note: previous declaration of 'ceph_fscrypt_decrypt_extents' with type 'int(struct inode *, struct ceph_databuf *, u64,  struct ceph_sparse_extent *, u32)' {aka 'int(struct inode *, struct ceph_databuf *, long long unsigned int,  struct ceph_sparse_extent *, unsigned int)'}
     160 | int ceph_fscrypt_decrypt_extents(struct inode *inode, struct ceph_databuf *dbuf, u64 off,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_fscrypt_decrypt_extents':
   fs/ceph/crypto.c:625:58: error: passing argument 2 of 'ceph_fscrypt_decrypt_pages' from incompatible pointer type [-Werror=incompatible-pointer-types]
     625 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                          ^~~~~~~~~~~~
         |                                                          |
         |                                                          struct page **
   fs/ceph/crypto.c:545:74: note: expected 'struct ceph_databuf *' but argument is of type 'struct page **'
     545 | int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
         |                                                     ~~~~~~~~~~~~~~~~~~~~~^~~~
   fs/ceph/crypto.c: At top level:
   fs/ceph/crypto.c:640:5: warning: no previous prototype for 'ceph_decrypt_block' [-Wmissing-prototypes]
     640 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_decrypt_block':
>> fs/ceph/crypto.c:644:42: error: 'op' undeclared (first use in this function); did you mean 'up'?
     644 |         struct ceph_sparse_extent *map = op->extent.sparse_ext;
         |                                          ^~
         |                                          up
   fs/ceph/crypto.c:644:42: note: each undeclared identifier is reported only once for each function it appears in
>> fs/ceph/crypto.c:645:49: error: 'inode' undeclared (first use in this function)
     645 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^~~~~
>> fs/ceph/crypto.c:671:59: error: 'page' undeclared (first use in this function)
     671 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                           ^~~~
>> fs/ceph/crypto.c:672:50: error: 'off' undeclared (first use in this function)
     672 |                                                  off + pgsoff, ext->len);
         |                                                  ^~~
   fs/ceph/crypto.c:663:21: warning: variable 'pgidx' set but not used [-Wunused-but-set-variable]
     663 |                 int pgidx = pgsoff >> PAGE_SHIFT;
         |                     ^~~~~
   fs/ceph/crypto.c: At top level:
   fs/ceph/crypto.c:686:5: warning: no previous prototype for 'ceph_encrypt_block' [-Wmissing-prototypes]
     686 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_encrypt_block':
   fs/ceph/crypto.c:690:1: warning: control reaches end of non-void function [-Wreturn-type]
     690 | }
         | ^
   cc1: some warnings being treated as errors
--
   fs/ceph/file.c: In function 'ceph_write_terminated':
>> fs/ceph/file.c:1664:41: error: 'len' undeclared (first use in this function)
    1664 |         netfs_subreq_terminated(subreq, len, err);
         |                                         ^~~
   fs/ceph/file.c:1664:41: note: each undeclared identifier is reported only once for each function it appears in
   fs/ceph/file.c: In function 'ceph_create_write_requests':
>> fs/ceph/file.c:1761:39: error: passing argument 1 of 'ceph_upload_to_server' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1761 |                 ceph_upload_to_server(req);
         |                                       ^~~
         |                                       |
         |                                       struct ceph_osd_request *
   fs/ceph/file.c:1667:63: note: expected 'struct netfs_io_subrequest *' but argument is of type 'struct ceph_osd_request *'
    1667 | static void ceph_upload_to_server(struct netfs_io_subrequest *subreq)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   fs/ceph/file.c: At top level:
   fs/ceph/file.c:1629:13: warning: 'ceph_write_terminated' defined but not used [-Wunused-function]
    1629 | static void ceph_write_terminated(struct netfs_io_subrequest *subreq, int err)
         |             ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   fs/ceph/addr.c: In function 'get_oldest_context':
   fs/ceph/addr.c:547:1: warning: label 'out' defined but not used [-Wunused-label]
     547 | out:
         | ^~~
   fs/ceph/addr.c: In function 'ceph_page_mkwrite':
>> fs/ceph/addr.c:901:44: error: 'struct ceph_inode_info' has no member named 'head_snapc'; did you mean 'i_head_snapc'?
     901 |         return netfs_page_mkwrite(vmf, ci->head_snapc);
         |                                            ^~~~~~~~~~
         |                                            i_head_snapc
   fs/ceph/addr.c:897:35: warning: unused variable 'snapc' [-Wunused-variable]
     897 |         struct ceph_snap_context *snapc;
         |                                   ^~~~~
   fs/ceph/addr.c: At top level:
   fs/ceph/addr.c:66:12: warning: 'ceph_netfs_check_write_begin' used but never defined
      66 | static int ceph_netfs_check_write_begin(struct file *file, loff_t pos, unsigned int len,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ceph/addr.c: In function 'ceph_page_mkwrite':
   fs/ceph/addr.c:902:1: warning: control reaches end of non-void function [-Wreturn-type]
     902 | }
         | ^
   fs/ceph/addr.c: At top level:
   fs/ceph/addr.c:69:34: warning: 'folio_snap_context' defined but not used [-Wunused-function]
      69 | static struct ceph_snap_context *folio_snap_context(struct folio *folio)
         |                                  ^~~~~~~~~~~~~~~~~~


vim +644 fs/ceph/crypto.c

   529	
   530	/**
   531	 * ceph_fscrypt_decrypt_data - Decrypt buffered data
   532	 * @inode: pointer to inode associated with these pages
   533	 * @dbuf: pointer to buffer containing the data
   534	 * @off: offset into the file that the read data starts
   535	 * @len: max length to decrypt
   536	 *
   537	 * Decrypt an buffer of fscrypt'ed pages and return the amount of
   538	 * data decrypted. Any data in the page prior to the start of the
   539	 * first complete block in the read is ignored. Any incomplete
   540	 * crypto blocks at the end of the array are ignored (and should
   541	 * probably be zeroed by the caller).
   542	 *
   543	 * Returns the length of the decrypted data or a negative errno.
   544	 */
 > 545	int ceph_fscrypt_decrypt_pages(struct inode *inode, struct ceph_databuf *dbuf,
   546				       u64 off, int len)
   547	{
   548		int i, num_blocks;
   549		u64 baseblk = off >> CEPH_FSCRYPT_BLOCK_SHIFT;
   550		int ret = 0;
   551	
   552		/*
   553		 * We can't deal with partial blocks on an encrypted file, so mask off
   554		 * the last bit.
   555		 */
   556		num_blocks = ceph_fscrypt_blocks(off, len & CEPH_FSCRYPT_BLOCK_MASK);
   557	
   558		/* Decrypt each block */
   559		for (i = 0; i < num_blocks; ++i) {
   560			int blkoff = i << CEPH_FSCRYPT_BLOCK_SHIFT;
   561			int pgidx = blkoff >> PAGE_SHIFT;
   562			unsigned int pgoffs = offset_in_page(blkoff);
   563			int fret;
   564	
   565			fret = ceph_fscrypt_decrypt_block_inplace(inode,
   566					ceph_databuf_page(dbuf, pgidx),
   567					CEPH_FSCRYPT_BLOCK_SIZE, pgoffs,
   568					baseblk + i);
   569			if (fret < 0) {
   570				if (ret == 0)
   571					ret = fret;
   572				break;
   573			}
   574			ret += CEPH_FSCRYPT_BLOCK_SIZE;
   575		}
   576		return ret;
   577	}
   578	
   579	/**
   580	 * ceph_fscrypt_decrypt_extents: decrypt received extents in given buffer
   581	 * @inode: inode associated with pages being decrypted
   582	 * @page: pointer to page array
   583	 * @off: offset into the file that the data in page[0] starts
   584	 * @map: pointer to extent array
   585	 * @ext_cnt: length of extent array
   586	 *
   587	 * Given an extent map and a page array, decrypt the received data in-place,
   588	 * skipping holes. Returns the offset into buffer of end of last decrypted
   589	 * block.
   590	 */
   591	int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
   592					 u64 off, struct ceph_sparse_extent *map,
   593					 u32 ext_cnt)
   594	{
   595		struct ceph_client *cl = ceph_inode_to_client(inode);
   596		int i, ret = 0;
   597		struct ceph_inode_info *ci = ceph_inode(inode);
   598		u64 objno, objoff;
   599		u32 xlen;
   600	
   601		/* Nothing to do for empty array */
   602		if (ext_cnt == 0) {
   603			doutc(cl, "%p %llx.%llx empty array, ret 0\n", inode,
   604			      ceph_vinop(inode));
   605			return 0;
   606		}
   607	
   608		ceph_calc_file_object_mapping(&ci->i_layout, off, map[0].len,
   609					      &objno, &objoff, &xlen);
   610	
   611		for (i = 0; i < ext_cnt; ++i) {
   612			struct ceph_sparse_extent *ext = &map[i];
   613			int pgsoff = ext->off - objoff;
   614			int pgidx = pgsoff >> PAGE_SHIFT;
   615			int fret;
   616	
   617			if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
   618				pr_warn_client(cl,
   619					"%p %llx.%llx bad encrypted sparse extent "
   620					"idx %d off %llx len %llx\n",
   621					inode, ceph_vinop(inode), i, ext->off,
   622					ext->len);
   623				return -EIO;
   624			}
   625			fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
   626							 off + pgsoff, ext->len);
   627			doutc(cl, "%p %llx.%llx [%d] 0x%llx~0x%llx fret %d\n", inode,
   628			      ceph_vinop(inode), i, ext->off, ext->len, fret);
   629			if (fret < 0) {
   630				if (ret == 0)
   631					ret = fret;
   632				break;
   633			}
   634			ret = pgsoff + fret;
   635		}
   636		doutc(cl, "ret %d\n", ret);
   637		return ret;
   638	}
   639	
 > 640	int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
   641			       struct scatterlist *source_sg, unsigned int n_source,
   642			       struct scatterlist *dest_sg, unsigned int n_dest)
   643	{
 > 644		struct ceph_sparse_extent *map = op->extent.sparse_ext;
 > 645		struct ceph_inode_info *ci = ceph_inode(inode);
   646		u64 objno, objoff;
   647		u32 ext_cnt = op->extent.sparse_ext_cnt;
   648		u32 xlen;
   649		int i, ret = 0;
   650	
   651		/* Nothing to do for empty array */
   652		if (ext_cnt == 0) {
   653			dout("%s: empty array, ret 0\n", __func__);
   654			return 0;
   655		}
   656	
   657		ceph_calc_file_object_mapping(&ci->i_layout, pos, map[0].len,
   658					      &objno, &objoff, &xlen);
   659	
   660		for (i = 0; i < ext_cnt; ++i) {
   661			struct ceph_sparse_extent *ext = &map[i];
   662			int pgsoff = ext->off - objoff;
   663			int pgidx = pgsoff >> PAGE_SHIFT;
   664			int fret;
   665	
   666			if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
   667				pr_warn("%s: bad encrypted sparse extent idx %d off %llx len %llx\n",
   668					__func__, i, ext->off, ext->len);
   669				return -EIO;
   670			}
 > 671			fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
 > 672							 off + pgsoff, ext->len);
   673			dout("%s: [%d] 0x%llx~0x%llx fret %d\n", __func__, i,
   674					ext->off, ext->len, fret);
   675			if (fret < 0) {
   676				if (ret == 0)
   677					ret = fret;
   678				break;
   679			}
   680			ret = pgsoff + fret;
   681		}
   682		dout("%s: ret %d\n", __func__, ret);
   683		return ret;
   684	}
   685	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
