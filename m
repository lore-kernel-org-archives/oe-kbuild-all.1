Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B017726ADD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 03:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734666271; cv=none; b=Z6Z9LWmZlK2h+Wt8sG0ciAXsvIkAz9no1fTBQ+IvsYBdu2XK/GNPleGZ0OCD3nzL/IF8UNRXsZnOClwb6jJBp5pkj9oM3JbXOzlwuaN6rAMYt4gyTgvOCdtRZXA3gfx7QPPU7a3IWnU1hijkqOb+JYuXXmqdA0E5dLgqWRcIpzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734666271; c=relaxed/simple;
	bh=QqMrYM1sPqCsGH/2XDCDe2q9NVcIpt2VYSxxC1t69r4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hAvngXqOxRP2hj80z/PkMDQRKzxNWvlOWUGvfFDvRyc85jXndbCmiaUbSZ9YuKM8uT9qcKmGHJghkGeGVqfg864aDiSFzChli7DwgGtSWXoFKn7nC89mllVIUd//py11Dpo+m0flVvtEAtIFoG2h1GGiFk1/irCFptQfLekrLOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AS5jGzaV; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AS5jGzaV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734666269; x=1766202269;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QqMrYM1sPqCsGH/2XDCDe2q9NVcIpt2VYSxxC1t69r4=;
  b=AS5jGzaVqotx/dqYlWDFEuwdXyC4Gca1PeLKmRST9uJbAXKiB7EpcNu0
   nB0Grom8gI4nf26gMmh3xR3KPKj9ufv2TbnfR2IZkH0XDA4SuipJMKILS
   ZgZzcBAbavHP+1HsWjujA5KMcRvDWRRmm3+Rpvith7qmXyMCowWjwaNQV
   DWG3M6yLPeAGlPoy6UDCcBgxvz8wJCNnBofI8zb+Gnv7rYEpVWtN77jCF
   9L05RzNTP2Psf8HZlAzy5dZ1/7All5xTstC+YXuN9O431KQL69yO+ig7U
   sQDhXoPaHy/pypgaCA3tQJ+eAARGnV7iTTre5bRP6jOlWG5sIK1apjWKp
   Q==;
X-CSE-ConnectionGUID: kMfJspp7RSOYLFDFM20Utw==
X-CSE-MsgGUID: IaKGILFlQGmxxBQ2JKYZow==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="34532000"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="34532000"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 19:44:29 -0800
X-CSE-ConnectionGUID: Iu72znc2T0ON3DOfmf62Ag==
X-CSE-MsgGUID: 0tdfbQ1JQ0Cunn5zF4pgPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98795527"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 19 Dec 2024 19:44:28 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOTwA-0000kR-05;
	Fri, 20 Dec 2024 03:44:26 +0000
Date: Fri, 20 Dec 2024 11:43:39 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:buffered-uncached.10 13/18]
 fs/iomap/buffered-io.c:606:27: error: 'IOMAP_DONTCACHE' undeclared; did you
 mean 'FOP_DONTCACHE'?
Message-ID: <202412201140.Hx09wRSC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git buffered-uncached.10
head:   10ef57808208218b909eb26c9de3f3aec7b63d05
commit: 94425319b56d6ebc9d5d6eca449532d41275fbfb [13/18] iomap: make buffered writes work with RWF_DONTCACHE
config: csky-randconfig-002-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201140.Hx09wRSC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201140.Hx09wRSC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201140.Hx09wRSC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/build_bug.h:5,
                    from include/linux/container_of.h:5,
                    from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from fs/iomap/buffered-io.c:6:
   fs/iomap/buffered-io.c: In function 'iomap_get_folio':
>> fs/iomap/buffered-io.c:606:27: error: 'IOMAP_DONTCACHE' undeclared (first use in this function); did you mean 'FOP_DONTCACHE'?
     606 |         if (iter->flags & IOMAP_DONTCACHE)
         |                           ^~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/iomap/buffered-io.c:606:9: note: in expansion of macro 'if'
     606 |         if (iter->flags & IOMAP_DONTCACHE)
         |         ^~
   fs/iomap/buffered-io.c:606:27: note: each undeclared identifier is reported only once for each function it appears in
     606 |         if (iter->flags & IOMAP_DONTCACHE)
         |                           ^~~~~~~~~~~~~~~
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   fs/iomap/buffered-io.c:606:9: note: in expansion of macro 'if'
     606 |         if (iter->flags & IOMAP_DONTCACHE)
         |         ^~
   fs/iomap/buffered-io.c: In function 'iomap_file_buffered_write':
   fs/iomap/buffered-io.c:1040:31: error: 'IOMAP_DONTCACHE' undeclared (first use in this function); did you mean 'FOP_DONTCACHE'?
    1040 |                 iter.flags |= IOMAP_DONTCACHE;
         |                               ^~~~~~~~~~~~~~~
         |                               FOP_DONTCACHE


vim +606 fs/iomap/buffered-io.c

   590	
   591	/**
   592	 * iomap_get_folio - get a folio reference for writing
   593	 * @iter: iteration structure
   594	 * @pos: start offset of write
   595	 * @len: Suggested size of folio to create.
   596	 *
   597	 * Returns a locked reference to the folio at @pos, or an error pointer if the
   598	 * folio could not be obtained.
   599	 */
   600	struct folio *iomap_get_folio(struct iomap_iter *iter, loff_t pos, size_t len)
   601	{
   602		fgf_t fgp = FGP_WRITEBEGIN | FGP_NOFS;
   603	
   604		if (iter->flags & IOMAP_NOWAIT)
   605			fgp |= FGP_NOWAIT;
 > 606		if (iter->flags & IOMAP_DONTCACHE)
   607			fgp |= FGP_DONTCACHE;
   608		fgp |= fgf_set_order(len);
   609	
   610		return __filemap_get_folio(iter->inode->i_mapping, pos >> PAGE_SHIFT,
   611				fgp, mapping_gfp_mask(iter->inode->i_mapping));
   612	}
   613	EXPORT_SYMBOL_GPL(iomap_get_folio);
   614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
