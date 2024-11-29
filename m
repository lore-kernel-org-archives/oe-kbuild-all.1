Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F67F1A070E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Nov 2024 21:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732914419; cv=none; b=OtaVX+GCUdwDiE31neWYKoaKWPl8OnTwvdoXDun8ijivQoT7lfqWUCJPALaRagrLdb8YLyyYf5BBuA/ChnBgHZ0795VPoUhhpDJeVubizCSI/Oop5OS+Ng0xNFa3iarNiBdPqLEsa2VA9L40PeJxOM9nmTwKbZn0vl/dqVDRens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732914419; c=relaxed/simple;
	bh=WFzVov9074LD2dzlmXVYiJK4pgbkkGOME9qFnWoVoIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k88WhRYSmI+uxogHBuY7SbfcWLre+Lm2jZqrccpP9VSKso2y+Vv2cMZUN4QIWWca/QGbJu/UZjMD6k+MZstzg3+0D9QjASd66E/ahXmiMeHihTgA+TfbYDLsH+NdrwCLSuGdagKKzL9fh6oySjARgNOxnxrmwUKkL1CW9Aq1ur0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cJhB/Vjc; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cJhB/Vjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732914417; x=1764450417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WFzVov9074LD2dzlmXVYiJK4pgbkkGOME9qFnWoVoIc=;
  b=cJhB/VjcqDiicq4U2ydiFUhR7b59l5/g5zQXCLiZI9j6BB2y4orCEyMx
   LZwCDGYhzIWuuxMpQjKlUg4pVHt+rUgyUAOIDxZ6SrgE5zVNex5iLeVlm
   aTOEUO7AjAUldwz+SH8s/TRlMV8w/EDTcPKcu/5rMElbFQGaZcUddvBE4
   foFPZbSPP7PUjkhDLz7FnqiocVUI03+1HpSit36WxqMvT2gr8mpdNMR56
   RJxvzEhclG7dWyV5+x1Kb2YVxGHXoCix+39t06cp56QzzLjnly7HyZB/n
   0zJZKRzq1quLCPGAn8FODINI8BJ7ElwL4Ws5G1YJn1fxcGwGGJ0XOLkTB
   A==;
X-CSE-ConnectionGUID: KT+m5x3zQ7StJFNYrlAUOQ==
X-CSE-MsgGUID: Rm5dm9zCTziAS7Cy++j4Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="36012863"
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="36012863"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 13:06:55 -0800
X-CSE-ConnectionGUID: tfDhlyufRpSYNJB8u97I8Q==
X-CSE-MsgGUID: hVGJA2AKRg6Kb+bzqe4xYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,196,1728975600"; 
   d="scan'208";a="92480810"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Nov 2024 13:06:53 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tH8CR-0000hN-0t;
	Fri, 29 Nov 2024 21:06:51 +0000
Date: Sat, 30 Nov 2024 05:05:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 85/92] fs/ceph/crypto.c:608:56: error:
 passing argument 6 of 'ceph_calc_file_object_mapping' from incompatible
 pointer type
Message-ID: <202411300508.pOqO1XWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   ae69436bf8db8f3a53edd0dfa379e753700240c0
commit: c7c8d01ba173e397c3d0bb05c57aa65fc742b42f [85/92] ceph: Make ceph_calc_file_object_mapping() return size as size_t
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20241130/202411300508.pOqO1XWF-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300508.pOqO1XWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300508.pOqO1XWF-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/crypto.c: In function 'ceph_fscrypt_decrypt_extents':
>> fs/ceph/crypto.c:608:56: error: passing argument 6 of 'ceph_calc_file_object_mapping' from incompatible pointer type [-Wincompatible-pointer-types]
     608 |                                       &objno, &objoff, &xlen);
         |                                                        ^~~~~
         |                                                        |
         |                                                        u32 * {aka unsigned int *}
   In file included from fs/ceph/crypto.c:12:
   include/linux/ceph/striper.h:13:69: note: expected 'size_t *' {aka 'long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
      13 |                                    u64 *objno, u64 *objoff, size_t *xlen);
         |                                                             ~~~~~~~~^~~~


vim +/ceph_calc_file_object_mapping +608 fs/ceph/crypto.c

77cdb7e17e39eb Jeff Layton 2022-08-25  577  
77cdb7e17e39eb Jeff Layton 2022-08-25  578  /**
77cdb7e17e39eb Jeff Layton 2022-08-25  579   * ceph_fscrypt_decrypt_extents: decrypt received extents in given buffer
77cdb7e17e39eb Jeff Layton 2022-08-25  580   * @inode: inode associated with pages being decrypted
77cdb7e17e39eb Jeff Layton 2022-08-25  581   * @page: pointer to page array
77cdb7e17e39eb Jeff Layton 2022-08-25  582   * @off: offset into the file that the data in page[0] starts
77cdb7e17e39eb Jeff Layton 2022-08-25  583   * @map: pointer to extent array
77cdb7e17e39eb Jeff Layton 2022-08-25  584   * @ext_cnt: length of extent array
77cdb7e17e39eb Jeff Layton 2022-08-25  585   *
77cdb7e17e39eb Jeff Layton 2022-08-25  586   * Given an extent map and a page array, decrypt the received data in-place,
77cdb7e17e39eb Jeff Layton 2022-08-25  587   * skipping holes. Returns the offset into buffer of end of last decrypted
77cdb7e17e39eb Jeff Layton 2022-08-25  588   * block.
77cdb7e17e39eb Jeff Layton 2022-08-25  589   */
77cdb7e17e39eb Jeff Layton 2022-08-25  590  int ceph_fscrypt_decrypt_extents(struct inode *inode, struct page **page,
77cdb7e17e39eb Jeff Layton 2022-08-25  591  				 u64 off, struct ceph_sparse_extent *map,
77cdb7e17e39eb Jeff Layton 2022-08-25  592  				 u32 ext_cnt)
77cdb7e17e39eb Jeff Layton 2022-08-25  593  {
38d46409c4639a Xiubo Li    2023-06-12  594  	struct ceph_client *cl = ceph_inode_to_client(inode);
77cdb7e17e39eb Jeff Layton 2022-08-25  595  	int i, ret = 0;
77cdb7e17e39eb Jeff Layton 2022-08-25  596  	struct ceph_inode_info *ci = ceph_inode(inode);
77cdb7e17e39eb Jeff Layton 2022-08-25  597  	u64 objno, objoff;
77cdb7e17e39eb Jeff Layton 2022-08-25  598  	u32 xlen;
77cdb7e17e39eb Jeff Layton 2022-08-25  599  
77cdb7e17e39eb Jeff Layton 2022-08-25  600  	/* Nothing to do for empty array */
77cdb7e17e39eb Jeff Layton 2022-08-25  601  	if (ext_cnt == 0) {
38d46409c4639a Xiubo Li    2023-06-12  602  		doutc(cl, "%p %llx.%llx empty array, ret 0\n", inode,
38d46409c4639a Xiubo Li    2023-06-12  603  		      ceph_vinop(inode));
77cdb7e17e39eb Jeff Layton 2022-08-25  604  		return 0;
77cdb7e17e39eb Jeff Layton 2022-08-25  605  	}
77cdb7e17e39eb Jeff Layton 2022-08-25  606  
77cdb7e17e39eb Jeff Layton 2022-08-25  607  	ceph_calc_file_object_mapping(&ci->i_layout, off, map[0].len,
77cdb7e17e39eb Jeff Layton 2022-08-25 @608  				      &objno, &objoff, &xlen);
77cdb7e17e39eb Jeff Layton 2022-08-25  609  
77cdb7e17e39eb Jeff Layton 2022-08-25  610  	for (i = 0; i < ext_cnt; ++i) {
77cdb7e17e39eb Jeff Layton 2022-08-25  611  		struct ceph_sparse_extent *ext = &map[i];
77cdb7e17e39eb Jeff Layton 2022-08-25  612  		int pgsoff = ext->off - objoff;
77cdb7e17e39eb Jeff Layton 2022-08-25  613  		int pgidx = pgsoff >> PAGE_SHIFT;
77cdb7e17e39eb Jeff Layton 2022-08-25  614  		int fret;
77cdb7e17e39eb Jeff Layton 2022-08-25  615  
77cdb7e17e39eb Jeff Layton 2022-08-25  616  		if ((ext->off | ext->len) & ~CEPH_FSCRYPT_BLOCK_MASK) {
38d46409c4639a Xiubo Li    2023-06-12  617  			pr_warn_client(cl,
38d46409c4639a Xiubo Li    2023-06-12  618  				"%p %llx.%llx bad encrypted sparse extent "
38d46409c4639a Xiubo Li    2023-06-12  619  				"idx %d off %llx len %llx\n",
38d46409c4639a Xiubo Li    2023-06-12  620  				inode, ceph_vinop(inode), i, ext->off,
38d46409c4639a Xiubo Li    2023-06-12  621  				ext->len);
77cdb7e17e39eb Jeff Layton 2022-08-25  622  			return -EIO;
77cdb7e17e39eb Jeff Layton 2022-08-25  623  		}
77cdb7e17e39eb Jeff Layton 2022-08-25  624  		fret = ceph_fscrypt_decrypt_pages(inode, &page[pgidx],
77cdb7e17e39eb Jeff Layton 2022-08-25  625  						 off + pgsoff, ext->len);
38d46409c4639a Xiubo Li    2023-06-12  626  		doutc(cl, "%p %llx.%llx [%d] 0x%llx~0x%llx fret %d\n", inode,
38d46409c4639a Xiubo Li    2023-06-12  627  		      ceph_vinop(inode), i, ext->off, ext->len, fret);
77cdb7e17e39eb Jeff Layton 2022-08-25  628  		if (fret < 0) {
77cdb7e17e39eb Jeff Layton 2022-08-25  629  			if (ret == 0)
77cdb7e17e39eb Jeff Layton 2022-08-25  630  				ret = fret;
77cdb7e17e39eb Jeff Layton 2022-08-25  631  			break;
77cdb7e17e39eb Jeff Layton 2022-08-25  632  		}
77cdb7e17e39eb Jeff Layton 2022-08-25  633  		ret = pgsoff + fret;
77cdb7e17e39eb Jeff Layton 2022-08-25  634  	}
38d46409c4639a Xiubo Li    2023-06-12  635  	doutc(cl, "ret %d\n", ret);
77cdb7e17e39eb Jeff Layton 2022-08-25  636  	return ret;
77cdb7e17e39eb Jeff Layton 2022-08-25  637  }
77cdb7e17e39eb Jeff Layton 2022-08-25  638  

:::::: The code at line 608 was first introduced by commit
:::::: 77cdb7e17e39ebb986f60bbd3c2b3507687bf475 ceph: add infrastructure for file encryption and decryption

:::::: TO: Jeff Layton <jlayton@kernel.org>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
