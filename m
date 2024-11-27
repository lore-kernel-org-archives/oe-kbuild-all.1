Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F0CF9DD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694885; cv=none; b=AuykmqaxCQkCaPWa+hXGwZ6OQKzMkN+NBRMIRCFJNitaOdjiFqv03dGfqNjtftuO8cXNOopeZz6w1O7kgvs9GC3O8DUKIWC9nZdM2gQcUl8BHUcAGdwfbsgssvzpxWCUusoz4a4svDT7Q7bJYqHA2+9tASTJMLZGztHwKJAy8y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694885; c=relaxed/simple;
	bh=9xRIZIyves6ukfYj4frXzTVpf1qALBGHV6+VE0J9Viw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dnry1MFDLgPeGCvJzBV15raNYh6rAzbOA0GylGjVgI8dKUW03/51LefAgyyrnKzL/wFllpt65aFKdyDOyfLFADMXxdtPCJrL09I4/AH3Vi8CezEFPfhTCzdYVn57j1GG6aIKWpHJy5VL/oZjMvkcOMvJLNkWMRa9tQYDTKEgCu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G9e+3gYL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G9e+3gYL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732694883; x=1764230883;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9xRIZIyves6ukfYj4frXzTVpf1qALBGHV6+VE0J9Viw=;
  b=G9e+3gYL646owTkhMgHSmIVm4o6dGeNS5dNo6Dx5JST/BpTFnDv9VUTd
   sx4VRS1LovaHZTy0ZW75FY3he6og5XiJr07O2cQEL7BuZATeuD/K2gtwd
   v1I2fzYdfkD3LEiqFvcqKhJ/2SgyPbGC56IJSXssV9gCgCDVbRze+MSA9
   cjJTZuhCUvvmOeSOQqoGCm0q9/VEEjWRGE2t1zP+j8pfVo5U2CSV9REzu
   8MhN4fiqsV+s2hY5kU6EneK2lUzpEhjQGMTuETgMALfu0co4ikLzidXau
   CUgBp0qSwXUHFW9yoPeOfSaPmS/oO8RwB8Og6UyXatlU1V/bSIsJBRVM7
   g==;
X-CSE-ConnectionGUID: 8c4uOxIGRjmRXyiCgnY/CQ==
X-CSE-MsgGUID: E8qqMj/5RueyYax9GKDbWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="33016505"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="33016505"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 00:08:02 -0800
X-CSE-ConnectionGUID: Hn/YqTUrQyaRdukz27vzaQ==
X-CSE-MsgGUID: xrTnA0TYSX+MToKvJoqhiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="122697662"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Nov 2024 00:08:02 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGD5a-0007pP-2q;
	Wed, 27 Nov 2024 08:07:58 +0000
Date: Wed, 27 Nov 2024 16:07:55 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:shrunk-page 10/17] fs/crypto/crypto.c:182: warning:
 Function parameter or struct member 'folio' not described in
 'fscrypt_encrypt_pagecache_blocks'
Message-ID: <202411271613.BXAnIL8v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache shrunk-page
head:   d4e55b57533326617246a975b271dcb72176fe9c
commit: 46459422dd5d26907895a2d4103b312ba877bc71 [10/17] fscrypt: Change fscrypt_encrypt_pagecache_blocks() to take a folio
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241127/202411271613.BXAnIL8v-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241127/202411271613.BXAnIL8v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411271613.BXAnIL8v-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/crypto/crypto.c:182: warning: Function parameter or struct member 'folio' not described in 'fscrypt_encrypt_pagecache_blocks'
>> fs/crypto/crypto.c:182: warning: Excess function parameter 'page' description in 'fscrypt_encrypt_pagecache_blocks'


vim +182 fs/crypto/crypto.c

0b81d0779072696 Jaegeuk Kim             2015-05-15  154  
0b81d0779072696 Jaegeuk Kim             2015-05-15  155  /**
5b11888471806ed Eric Biggers            2023-09-24  156   * fscrypt_encrypt_pagecache_blocks() - Encrypt data from a pagecache page
5b11888471806ed Eric Biggers            2023-09-24  157   * @page: the locked pagecache page containing the data to encrypt
5b11888471806ed Eric Biggers            2023-09-24  158   * @len: size of the data to encrypt, in bytes
5b11888471806ed Eric Biggers            2023-09-24  159   * @offs: offset within @page of the data to encrypt, in bytes
5b11888471806ed Eric Biggers            2023-09-24  160   * @gfp_flags: memory allocation flags; see details below
53bc1d854c64c20 Eric Biggers            2019-05-20  161   *
5b11888471806ed Eric Biggers            2023-09-24  162   * This allocates a new bounce page and encrypts the given data into it.  The
5b11888471806ed Eric Biggers            2023-09-24  163   * length and offset of the data must be aligned to the file's crypto data unit
5b11888471806ed Eric Biggers            2023-09-24  164   * size.  Alignment to the filesystem block size fulfills this requirement, as
5b11888471806ed Eric Biggers            2023-09-24  165   * the filesystem block size is always a multiple of the data unit size.
5b11888471806ed Eric Biggers            2023-09-24  166   *
5b11888471806ed Eric Biggers            2023-09-24  167   * In the bounce page, the ciphertext data will be located at the same offset at
5b11888471806ed Eric Biggers            2023-09-24  168   * which the plaintext data was located in the source page.  Any other parts of
5b11888471806ed Eric Biggers            2023-09-24  169   * the bounce page will be left uninitialized.
0b81d0779072696 Jaegeuk Kim             2015-05-15  170   *
53bc1d854c64c20 Eric Biggers            2019-05-20  171   * This is for use by the filesystem's ->writepages() method.
0b81d0779072696 Jaegeuk Kim             2015-05-15  172   *
2d8f7f119b0b2ce Eric Biggers            2019-12-31  173   * The bounce page allocation is mempool-backed, so it will always succeed when
2d8f7f119b0b2ce Eric Biggers            2019-12-31  174   * @gfp_flags includes __GFP_DIRECT_RECLAIM, e.g. when it's GFP_NOFS.  However,
2d8f7f119b0b2ce Eric Biggers            2019-12-31  175   * only the first page of each bio can be allocated this way.  To prevent
2d8f7f119b0b2ce Eric Biggers            2019-12-31  176   * deadlocks, for any additional pages a mask like GFP_NOWAIT must be used.
2d8f7f119b0b2ce Eric Biggers            2019-12-31  177   *
53bc1d854c64c20 Eric Biggers            2019-05-20  178   * Return: the new encrypted bounce page on success; an ERR_PTR() on failure
0b81d0779072696 Jaegeuk Kim             2015-05-15  179   */
46459422dd5d269 Matthew Wilcox (Oracle  2024-11-26  180) struct page *fscrypt_encrypt_pagecache_blocks(struct folio *folio,
46459422dd5d269 Matthew Wilcox (Oracle  2024-11-26  181) 		size_t len, size_t offs, gfp_t gfp_flags)
0b81d0779072696 Jaegeuk Kim             2015-05-15 @182  {
46459422dd5d269 Matthew Wilcox (Oracle  2024-11-26  183) 	const struct inode *inode = folio->mapping->host;
3e7807d5a7d770c Josef Bacik             2023-10-04  184  	const struct fscrypt_inode_info *ci = inode->i_crypt_info;
5b11888471806ed Eric Biggers            2023-09-24  185  	const unsigned int du_bits = ci->ci_data_unit_bits;
5b11888471806ed Eric Biggers            2023-09-24  186  	const unsigned int du_size = 1U << du_bits;
03569f2fb8e734f Eric Biggers            2019-05-20  187  	struct page *ciphertext_page;
46459422dd5d269 Matthew Wilcox (Oracle  2024-11-26  188) 	u64 index = ((u64)folio->index << (PAGE_SHIFT - du_bits)) +
5b11888471806ed Eric Biggers            2023-09-24  189  		    (offs >> du_bits);
53bc1d854c64c20 Eric Biggers            2019-05-20  190  	unsigned int i;
0b81d0779072696 Jaegeuk Kim             2015-05-15  191  	int err;
0b81d0779072696 Jaegeuk Kim             2015-05-15  192  
46459422dd5d269 Matthew Wilcox (Oracle  2024-11-26  193) 	if (WARN_ON_ONCE(!folio_test_locked(folio)))
eeacfdc68a10496 Eric Biggers            2019-05-20  194  		return ERR_PTR(-EINVAL);
bd7b8290388dd58 David Gstir             2016-12-06  195  
5b11888471806ed Eric Biggers            2023-09-24  196  	if (WARN_ON_ONCE(len <= 0 || !IS_ALIGNED(len | offs, du_size)))
53bc1d854c64c20 Eric Biggers            2019-05-20  197  		return ERR_PTR(-EINVAL);
53bc1d854c64c20 Eric Biggers            2019-05-20  198  
d2d0727b1654e11 Eric Biggers            2019-05-20  199  	ciphertext_page = fscrypt_alloc_bounce_page(gfp_flags);
d2d0727b1654e11 Eric Biggers            2019-05-20  200  	if (!ciphertext_page)
d2d0727b1654e11 Eric Biggers            2019-05-20  201  		return ERR_PTR(-ENOMEM);
0b81d0779072696 Jaegeuk Kim             2015-05-15  202  
5b11888471806ed Eric Biggers            2023-09-24  203  	for (i = offs; i < offs + len; i += du_size, index++) {
5b11888471806ed Eric Biggers            2023-09-24  204  		err = fscrypt_crypt_data_unit(ci, FS_ENCRYPT, index,
46459422dd5d269 Matthew Wilcox (Oracle  2024-11-26  205) 					      &folio->page, ciphertext_page,
5b11888471806ed Eric Biggers            2023-09-24  206  					      du_size, i, gfp_flags);
0b81d0779072696 Jaegeuk Kim             2015-05-15  207  		if (err) {
d2d0727b1654e11 Eric Biggers            2019-05-20  208  			fscrypt_free_bounce_page(ciphertext_page);
d2d0727b1654e11 Eric Biggers            2019-05-20  209  			return ERR_PTR(err);
0b81d0779072696 Jaegeuk Kim             2015-05-15  210  		}
53bc1d854c64c20 Eric Biggers            2019-05-20  211  	}
0b81d0779072696 Jaegeuk Kim             2015-05-15  212  	SetPagePrivate(ciphertext_page);
46459422dd5d269 Matthew Wilcox (Oracle  2024-11-26  213) 	set_page_private(ciphertext_page, (unsigned long)folio);
0b81d0779072696 Jaegeuk Kim             2015-05-15  214  	return ciphertext_page;
0b81d0779072696 Jaegeuk Kim             2015-05-15  215  }
53bc1d854c64c20 Eric Biggers            2019-05-20  216  EXPORT_SYMBOL(fscrypt_encrypt_pagecache_blocks);
0b81d0779072696 Jaegeuk Kim             2015-05-15  217  

:::::: The code at line 182 was first introduced by commit
:::::: 0b81d0779072696371822e5ed9e7c6292e547024 fs crypto: move per-file encryption from f2fs tree to fs/crypto

:::::: TO: Jaegeuk Kim <jaegeuk@kernel.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
