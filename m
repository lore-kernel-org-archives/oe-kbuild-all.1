Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B01199
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 00:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705537347; cv=none; b=lvDml8WRNXjUcZCuV4Po9Jt7szofhcCNiLmnAT0AemFBiFCuisj2F1Yq6D9jpjsvZkCpsqB2Zy4a3aycy2b3Y8WmlgRN3P7uBDuVoVLCbjWkJNQP8JTmofKITVkzWWGc+RcCNUsE0DN9y3XkNsuSkUg+O5mX4z0+/b6saM79cPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705537347; c=relaxed/simple;
	bh=B1nEnXyQ/SAtlAIKMWbDMRGkGTuCSjWo+sHTG+RqFS0=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=DI0VP1KWteA/lf6AfpvgfAIzGknpXuCA31jl6I0iU8LBoxHJWJiVKY5PJfxw4/j6Kxf00J3/EusYm8sXvZwF4pfhBDQE1rCFUgtTdSo0aSb/PJH1GHFEKd90PbnX1x5Um4xZMOhpVB28r+YKRC4QTiiKxxZlaqkydhsBLNGQb10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4ThXqlN; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4ThXqlN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705537345; x=1737073345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1nEnXyQ/SAtlAIKMWbDMRGkGTuCSjWo+sHTG+RqFS0=;
  b=W4ThXqlNW315pRS6+71AxP9A7WvgGOqESCcgane69X3wFTn4shnSI2Kb
   blTMvMxuHL2oU72zx74EwjNLPq8OnKgR7R9hfxaXNGynWEapoaOmdrqbu
   pStdX2lTmER9wZN+7PAGDAdlx0iz8kSiVnFbb/RwEYRfD+kv75Y40Hs/T
   wahCXBoJCy8HsQbTwE3CV5ew0w1qTAlRCQJb8C1ai5q7QNgcG8KPqd3XP
   N58GVx55O6EpY2WXYsCtYRr8aeiLaO7KnApZnVrQLHjMGqFxz64+r6wM2
   0w/U4df5ln77ZG0W0nB78NA2mpiaK3Tg8bmeWNwD6c0u6K81xj3yWwKdk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="21793261"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="21793261"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 16:22:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="760721406"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="760721406"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 17 Jan 2024 16:22:23 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQGAm-0002S4-1R;
	Thu, 18 Jan 2024 00:22:20 +0000
Date: Thu, 18 Jan 2024 08:21:30 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 104/105] fs/ceph/crypto.c:545:5: warning: no
 previous prototype for 'ceph_fscrypt_decrypt_pages'
Message-ID: <202401180825.lncIWq4e-lkp@intel.com>
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
config: i386-randconfig-141-20240117 (https://download.01.org/0day-ci/archive/20240118/202401180825.lncIWq4e-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180825.lncIWq4e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180825.lncIWq4e-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/ceph/crypto.c:545:5: warning: no previous prototype for 'ceph_fscrypt_decrypt_pages' [-Wmissing-prototypes]
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
   cc1: some warnings being treated as errors


vim +/ceph_fscrypt_decrypt_pages +545 fs/ceph/crypto.c

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
