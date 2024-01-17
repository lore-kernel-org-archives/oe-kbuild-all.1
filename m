Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A3F23750
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 18:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705517186; cv=none; b=k5Y0kfP+BRBVlHfbxfa2nc7uy1kLmIOacP97ru/O/vaXN7MXCItbhOod1nJRnd2djlbac9C2otkurtaLxn2XiyYhm+wkpuHNr5wNJvEOefh9F3jUH2OvKi5G8RVSe9KjZ1dsInQlQRJZ8797DerhxJCYSwaTSXV8x+VN/s/T+Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705517186; c=relaxed/simple;
	bh=++y6u8tpAM9gq3YW54EKkxt06g17QJKdGZ/9zlXD0Do=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=MaoJPbN14l72eZ/AZsyvM3tP3BJ+ujrXx1PJcM2u9Z/TSI1YuzOWz7+jRf1iVzxFMXsvmvsplglGsspktNab1qDGMKYjWf318ccmiKJ87woOSeRYzGKq0/GcfkqdjRO6IK5kVvvGQWi+ZGWa9IzpUnyZpzIu8lO9m+/uDnt/UNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESTsJzqd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESTsJzqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705517184; x=1737053184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++y6u8tpAM9gq3YW54EKkxt06g17QJKdGZ/9zlXD0Do=;
  b=ESTsJzqdzX3lan1NsWjnBLsDhzL27/0+rIX2/gfht1uDwjSFGqLJ4Ida
   O1v+CIe3gOaOjstJ/YxF6EMRmCyUD7Pz1BjHGUQs7ZbQ3W/TT/DOtQxmU
   KwKNVKKQJ2st9/gkNeNr1j5iPc7fDjHTVgUzEYlSPdmChK9a3+njTJA1y
   fRp89IlV0hlb+KuCN4aBcQvsBzL6fV6z4MO+foXKfsBCb1OEhGBlAqcs9
   WyXO3TGyqDvOyAPmyo4Z8t+9Xw5WZKRt1TjpqWUYiXLFW/tsJKeGVrEOI
   3c4AzlT5WV1dnmDWx0MIJA09tf0WteknDJdy+JNc2QlOqCS5tLjLpNmjU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="21722200"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="21722200"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 10:46:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="927893689"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="927893689"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jan 2024 10:46:12 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQAvS-0002Fa-0W;
	Wed, 17 Jan 2024 18:46:10 +0000
Date: Thu, 18 Jan 2024 02:45:16 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 98/105] fs/ceph/crypto.c:608:56: error:
 passing argument 6 of 'ceph_calc_file_object_mapping' from incompatible
 pointer type
Message-ID: <202401180237.7Vliagwz-lkp@intel.com>
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
commit: da0d419452928c43bddccbfdc3f5636a36ad05cd [98/105] ceph: Make ceph_calc_file_object_mapping() return size as size_t
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240118/202401180237.7Vliagwz-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180237.7Vliagwz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180237.7Vliagwz-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/crypto.c: In function 'ceph_fscrypt_decrypt_extents':
>> fs/ceph/crypto.c:608:56: error: passing argument 6 of 'ceph_calc_file_object_mapping' from incompatible pointer type [-Werror=incompatible-pointer-types]
     608 |                                       &objno, &objoff, &xlen);
         |                                                        ^~~~~
         |                                                        |
         |                                                        u32 * {aka unsigned int *}
   In file included from fs/ceph/crypto.c:12:
   include/linux/ceph/striper.h:12:69: note: expected 'size_t *' {aka 'long unsigned int *'} but argument is of type 'u32 *' {aka 'unsigned int *'}
      12 |                                    u64 *objno, u64 *objoff, size_t *xlen);
         |                                                             ~~~~~~~~^~~~
   cc1: some warnings being treated as errors


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
