Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E5E26E158
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 14:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740751976; cv=none; b=BSOX2Oq45q7adQXL3+XZkMRsM5z8RiZ9t1SH9rRZCVcTi4jPptok5Ciu20ne1lBUI1ys9yjsryf2tOIRzfzbYsgqusf1ikUTwKvweqm7aLS1e+m8HqXDMnUBOlFQDaH5cI+aeVqAtNhH/3VswoK6Fe9+1yfhkuQwkoMiO83eYdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740751976; c=relaxed/simple;
	bh=SQF9avSnUuSJL7xiAZA9FIkv2PILbwUQKCpXO7QX+xk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sP0+EK++aNf+Nfhi5wS+r9yQNFr3Sz+iR+7yI0w23fFC90jypyArGfTpKOqZW2EWF3Y2ocL1J4kS+RjKDO/SWlmGpLNdXsFPf7Qlxn+QQUatLgugbWJgqYzy/8oeP49+hbicmjxP0VDzMLAQph7MMEvYcTHdq1To+r00h/8hnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IAG3sMrz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IAG3sMrz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740751974; x=1772287974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SQF9avSnUuSJL7xiAZA9FIkv2PILbwUQKCpXO7QX+xk=;
  b=IAG3sMrzpmbc4W0xXCuSC9C9GbTc2I+6vjwHJO6M+WOOw6SouUhtxgbq
   F7VYujoPOHPQetS8mEyJVcQkUSpqI8IrBS7bfzfWO8nyHZzhk5+fGIHWd
   50LB1UY3Jy428f4tiH5qQTfEZng1CcDc6rC7xyyTL3moJ3Xb5FI+bpXzB
   2JEjBy0myIa0G/Zz3viX7xkZFCYwcF7eCHibbNy5BQkpny0atoHKmX1We
   lI8dThu0ojVDCxnyRRMMO3nOgiOsYHtbPfrZvzfq6hitgoSOM1K4zbXZM
   WVmrmiAlbUR2mt34mRWSvQoGtTybLva6CNY3+NOprP4nv40fRsNKNlY4W
   w==;
X-CSE-ConnectionGUID: 6MjIAkBqRNygGeEP75/ZHQ==
X-CSE-MsgGUID: OTVvpXyNQFijPdg4rJKbAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45331831"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; 
   d="scan'208";a="45331831"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 06:12:54 -0800
X-CSE-ConnectionGUID: 3up8wMcXTpmytEV9ecDhLw==
X-CSE-MsgGUID: xq4LN4sITSaeQO1MZZEZOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122580357"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Feb 2025 06:12:53 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to16Z-000Ezu-2z;
	Fri, 28 Feb 2025 14:12:48 +0000
Date: Fri, 28 Feb 2025 22:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 39/39] fs/ceph/crypto.c:657:56: error:
 passing argument 6 of 'ceph_calc_file_object_mapping' from incompatible
 pointer type
Message-ID: <202502282208.WBPV6eL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   7ae75822a29ea06bba2be34563c5c915bfa0e79b
commit: 7ae75822a29ea06bba2be34563c5c915bfa0e79b [39/39] ceph: Use netfslib
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250228/202502282208.WBPV6eL7-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502282208.WBPV6eL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502282208.WBPV6eL7-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/crypto.c:639:5: warning: no previous prototype for 'ceph_decrypt_block' [-Wmissing-prototypes]
     639 | int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_decrypt_block':
   fs/ceph/crypto.c:643:42: error: 'op' undeclared (first use in this function); did you mean 'up'?
     643 |         struct ceph_sparse_extent *map = op->extent.sparse_ext;
         |                                          ^~
         |                                          up
   fs/ceph/crypto.c:643:42: note: each undeclared identifier is reported only once for each function it appears in
   fs/ceph/crypto.c:644:49: error: 'inode' undeclared (first use in this function)
     644 |         struct ceph_inode_info *ci = ceph_inode(inode);
         |                                                 ^~~~~
>> fs/ceph/crypto.c:657:56: error: passing argument 6 of 'ceph_calc_file_object_mapping' from incompatible pointer type [-Wincompatible-pointer-types]
     657 |                                       &objno, &objoff, &xlen);
         |                                                        ^~~~~
         |                                                        |
         |                                                        u32 * {aka unsigned int *}
   In file included from fs/ceph/crypto.c:12:
   include/linux/ceph/striper.h:13:69: note: expected 'size_t *' {aka 'long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
      13 |                                    u64 *objno, u64 *objoff, size_t *xlen);
         |                                                             ~~~~~~~~^~~~
   fs/ceph/crypto.c:670:59: error: 'page' undeclared (first use in this function)
     670 |                 fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
         |                                                           ^~~~
   fs/ceph/crypto.c:671:50: error: 'off' undeclared (first use in this function)
     671 |                                                  off + pgsoff, ext->len);
         |                                                  ^~~
   fs/ceph/crypto.c:662:21: warning: variable 'pgidx' set but not used [-Wunused-but-set-variable]
     662 |                 int pgidx = pgsoff >> PAGE_SHIFT;
         |                     ^~~~~
   fs/ceph/crypto.c: At top level:
   fs/ceph/crypto.c:685:5: warning: no previous prototype for 'ceph_encrypt_block' [-Wmissing-prototypes]
     685 | int ceph_encrypt_block(struct netfs_io_request *wreq, loff_t pos, size_t len,
         |     ^~~~~~~~~~~~~~~~~~
   fs/ceph/crypto.c: In function 'ceph_encrypt_block':
   fs/ceph/crypto.c:689:1: warning: control reaches end of non-void function [-Wreturn-type]
     689 | }
         | ^


vim +/ceph_calc_file_object_mapping +657 fs/ceph/crypto.c

   577	
   578	/**
   579	 * ceph_fscrypt_decrypt_extents: decrypt received extents in given buffer
   580	 * @inode: inode associated with pages being decrypted
   581	 * @page: pointer to page array
   582	 * @off: offset into the file that the data in page[0] starts
   583	 * @map: pointer to extent array
   584	 * @ext_cnt: length of extent array
   585	 *
   586	 * Given an extent map and a page array, decrypt the received data in-place,
   587	 * skipping holes. Returns the offset into buffer of end of last decrypted
   588	 * block.
   589	 */
   590	int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
   591					 u64 off, struct ceph_sparse_extent *map,
   592					 u32 ext_cnt)
   593	{
   594		struct ceph_client *cl = ceph_inode_to_client(inode);
   595		int i, ret = 0;
   596		struct ceph_inode_info *ci = ceph_inode(inode);
   597		size_t xlen;
   598		u64 objno, objoff;
   599	
   600		/* Nothing to do for empty array */
   601		if (ext_cnt == 0) {
   602			doutc(cl, "%p %llx.%llx empty array, ret 0\n", inode,
   603			      ceph_vinop(inode));
   604			return 0;
   605		}
   606	
   607		ceph_calc_file_object_mapping(&ci->i_layout, off, map[0].len,
   608					      &objno, &objoff, &xlen);
   609	
   610		for (i = 0; i < ext_cnt; ++i) {
   611			struct ceph_sparse_extent *ext = &map[i];
   612			int pgsoff = ext->off - objoff;
   613			int pgidx = pgsoff >> PAGE_SHIFT;
   614			int fret;
   615	
   616			if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
   617				pr_warn_client(cl,
   618					"%p %llx.%llx bad encrypted sparse extent "
   619					"idx %d off %llx len %llx\n",
   620					inode, ceph_vinop(inode), i, ext->off,
   621					ext->len);
   622				return -EIO;
   623			}
   624			fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
   625							 off + pgsoff, ext->len);
   626			doutc(cl, "%p %llx.%llx [%d] 0x%llx~0x%llx fret %d\n", inode,
   627			      ceph_vinop(inode), i, ext->off, ext->len, fret);
   628			if (fret < 0) {
   629				if (ret == 0)
   630					ret = fret;
   631				break;
   632			}
   633			ret = pgsoff + fret;
   634		}
   635		doutc(cl, "ret %d\n", ret);
   636		return ret;
   637	}
   638	 
   639	int ceph_decrypt_block(struct netfs_io_request *rreq, loff_t pos, size_t len,
   640			       struct scatterlist *source_sg, unsigned int n_source,
   641			       struct scatterlist *dest_sg, unsigned int n_dest)
   642	{
 > 643		struct ceph_sparse_extent *map = op->extent.sparse_ext;
   644		struct ceph_inode_info *ci = ceph_inode(inode);
   645		u64 objno, objoff;
   646		u32 ext_cnt = op->extent.sparse_ext_cnt;
   647		u32 xlen;
   648		int i, ret = 0;
   649	
   650		/* Nothing to do for empty array */
   651		if (ext_cnt == 0) {
   652			dout("%s: empty array, ret 0\n", __func__);
   653			return 0;
   654		}
   655	
   656		ceph_calc_file_object_mapping(&ci->i_layout, pos, map[0].len,
 > 657					      &objno, &objoff, &xlen);
   658	
   659		for (i = 0; i < ext_cnt; ++i) {
   660			struct ceph_sparse_extent *ext = &map[i];
   661			int pgsoff = ext->off - objoff;
   662			int pgidx = pgsoff >> PAGE_SHIFT;
   663			int fret;
   664	
   665			if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
   666				pr_warn("%s: bad encrypted sparse extent idx %d off %llx len %llx\n",
   667					__func__, i, ext->off, ext->len);
   668				return -EIO;
   669			}
   670			fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
   671							 off + pgsoff, ext->len);
   672			dout("%s: [%d] 0x%llx~0x%llx fret %d\n", __func__, i,
   673					ext->off, ext->len, fret);
   674			if (fret < 0) {
   675				if (ret == 0)
   676					ret = fret;
   677				break;
   678			}
   679			ret = pgsoff + fret;
   680		}
   681		dout("%s: ret %d\n", __func__, ret);
   682		return ret;
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
