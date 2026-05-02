Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F18D35975
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 09:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777714243; cv=none; b=TJSZ82UtgYD5mZrqSWzeXOhlHcLnf90rFru9URpyO4HCwVbn8xtw+2iW/EDw6l+DqHcKt8aJJHHeb88t/daT64AtMrwqcwhlZ/Bvi8tBfjVushxCBNgUsTP7jSYteowLGLKq5cA8JA/e5GewGxmiOesIhS65HLLH/39BrnjgBnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777714243; c=relaxed/simple;
	bh=tUe7MDx/V/V3VoMgtVSZ5m0HITGsZEOcvllfDUT9xjQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FCpWwCyX9kDC2BdmbxlaHQbXI6sz5H5QPrBkGHaFbb9yXKHMvN3ExCUHPvMNB9DAqpdrXWvvCQIdmgy/IeFeeANLACwxfq4jYVncO1w7505V/e2cZ52SBCguW0u5t2JVDytabLJ0RCVlb7tUjpoD7oY7XxpWy8pCMlK0PawEX2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zrzdlaz+; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zrzdlaz+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777714242; x=1809250242;
  h=date:from:to:cc:subject:message-id;
  bh=tUe7MDx/V/V3VoMgtVSZ5m0HITGsZEOcvllfDUT9xjQ=;
  b=Zrzdlaz+kXU67zir8X/XhUVtNr+bZ4m/WjFsYDzrAXIjhIJY+Fs5WwmZ
   4jh68K9mLt8WTyXJiul3EVzAoBeSvXMm+r7CBQV3zXpvjTyBqdXsVAH0N
   hg7Y7qpsdi16Eps/DaNftN7WbY9GnvaD4xcC5dzljijsN9KsAPkYHoMjn
   8V3RTVFWG/4aDAwDgENLBW2G+gzzrcbNKE9f4XqLFUREOCrKpOnTNiGnX
   XmJneLncKkXypJQZFg/ls7xFmo8XNmEck0ZdS0aE01PqtRMa9JaP2FGu0
   kKL2nlHtl3eV9f0mfb8o1jurv2v+zI7pKQwZ0og1fKypJvh8cnMfDeZNR
   g==;
X-CSE-ConnectionGUID: PofUfymgT/Gtp9/M674Z0A==
X-CSE-MsgGUID: ocIkSANDRLC5SGeDC/H6VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11773"; a="66190634"
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="66190634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 02:30:41 -0700
X-CSE-ConnectionGUID: 6HpYJi1JSqef61CzYV7qSA==
X-CSE-MsgGUID: Xal4siPeR52/mKp2DO6M3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,211,1770624000"; 
   d="scan'208";a="235327668"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 May 2026 02:30:39 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJ6gG-000000001IL-3FbP;
	Sat, 02 May 2026 09:30:36 +0000
Date: Sat, 02 May 2026 17:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net
Subject: [mszeredi-fuse:fusex 40/40] fs/fuse/fusex.c:581:14: error:
 implicit declaration of function 'iov_iter_count'
Message-ID: <202605021740.6mEasqtO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git fusex
head:   1934d254361977df9fad43102ec1d72e20434a99
commit: 1934d254361977df9fad43102ec1d72e20434a99 [40/40] fuse: add fusex filesystem
config: m68k-mvme147_defconfig (https://download.01.org/0day-ci/archive/20260502/202605021740.6mEasqtO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021740.6mEasqtO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021740.6mEasqtO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/fusex.c: In function 'fusex_direct_IO':
>> fs/fuse/fusex.c:581:14: error: implicit declaration of function 'iov_iter_count' [-Wimplicit-function-declaration]
     581 |         if (!iov_iter_count(iter) || (iov_iter_rw(iter) == READ && pos >= old_size))
         |              ^~~~~~~~~~~~~~
>> fs/fuse/fusex.c:581:39: error: implicit declaration of function 'iov_iter_rw' [-Wimplicit-function-declaration]
     581 |         if (!iov_iter_count(iter) || (iov_iter_rw(iter) == READ && pos >= old_size))
         |                                       ^~~~~~~~~~~
>> fs/fuse/fusex.c:590:23: error: implicit declaration of function 'iov_iter_extract_pages' [-Wimplicit-function-declaration]
     590 |                 len = iov_iter_extract_pages(iter, &pages, PAGE_SIZE, 1, 0, &off);
         |                       ^~~~~~~~~~~~~~~~~~~~~~
>> fs/fuse/fusex.c:607:37: error: implicit declaration of function 'user_backed_iter' [-Wimplicit-function-declaration]
     607 |                         if (!err && user_backed_iter(iter))
         |                                     ^~~~~~~~~~~~~~~~
>> fs/fuse/fusex.c:610:21: error: implicit declaration of function 'iov_iter_extract_will_pin' [-Wimplicit-function-declaration]
     610 |                 if (iov_iter_extract_will_pin(iter))
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/fuse/fusex.c: In function 'fusex_fill_super':
>> fs/fuse/fusex.c:1601:23: error: 'FUSE_SUPER_MAGIC' undeclared (first use in this function)
    1601 |         sb->s_magic = FUSE_SUPER_MAGIC;
         |                       ^~~~~~~~~~~~~~~~
   fs/fuse/fusex.c:1601:23: note: each undeclared identifier is reported only once for each function it appears in


vim +/iov_iter_count +581 fs/fuse/fusex.c

   573	
   574	static ssize_t fusex_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
   575	{
   576		struct inode *inode = file_inode(iocb->ki_filp);
   577		loff_t old_size = i_size_read(inode);
   578		loff_t pos = iocb->ki_pos;
   579		int err = 0;
   580	
 > 581		if (!iov_iter_count(iter) || (iov_iter_rw(iter) == READ && pos >= old_size))
   582			return 0;
   583	
   584		for (;;) {
   585			struct page **pages = NULL;
   586			struct folio *folio;
   587			ssize_t len;
   588			size_t off;
   589	
 > 590			len = iov_iter_extract_pages(iter, &pages, PAGE_SIZE, 1, 0, &off);
   591			if (len <= 0) {
   592				err = len;
   593				break;
   594			}
   595	
   596			folio = page_folio(pages[0]);
   597			off += folio_page_idx(folio, pages[0]) * PAGE_SIZE;
   598			kvfree(pages);
   599	
   600			if (iov_iter_rw(iter) == WRITE) {
   601				err = fusex_send_write(inode, pos, folio, off, len);
   602			} else {
   603				if (pos + len > old_size)
   604					len = old_size - pos;
   605	
   606				err = fusex_send_read(inode, pos, iocb->ki_filp, folio, off, len);
 > 607				if (!err && user_backed_iter(iter))
   608					folio_mark_dirty_lock(folio);
   609			}
 > 610			if (iov_iter_extract_will_pin(iter))
   611				unpin_folio(folio);
   612	
   613			if (err || !len)
   614				break;
   615			pos += len;
   616		}
   617		if (pos > iocb->ki_pos) {
   618			if (iov_iter_rw(iter) == WRITE) {
   619				if (pos > old_size)
   620					i_size_write(inode, pos);
   621				fusex_extend_file(inode, old_size, iocb->ki_pos);
   622			}
   623		}
   624	
   625		return (pos - iocb->ki_pos) ?: err;
   626	}
   627	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
