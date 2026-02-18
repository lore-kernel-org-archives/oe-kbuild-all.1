Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3174831355F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Feb 2026 15:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427579; cv=none; b=pJqJYdBJ8H4BoWnvh3yLIXkLipb036o2oiGMDmVO6SSEpQglom+xuG/uA9p3JOepgZqnfFCwYnM+LDnXXGRXxbSvintWOOUmxGisYFWX+Mb7o/LV9n8ulv1X7ewAhm9loBQLbv8m2hBzxNSaHi2o4FltI0wBr9Qspu6cFMv5FBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427579; c=relaxed/simple;
	bh=vF/HQFfqNdLWYS3/7eZcml5WzQHNKt0VgdW2AHjAuP0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bQcavW7h63st9CDPSprCro97SZuUISkzubduvRRJfcZbxnCHnd3q/VNKwKEsnoHLF6F48E+a8DG5gk2RdHb8m0PIxgxj1NSZ+rnpTxJ254QVIiP9GX0Mt/mW5xqkagG9XxAxBlZkRdimPKJxyXKOHrGy5BoRL8ugcCCF951RYo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUbVWifB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUbVWifB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771427578; x=1802963578;
  h=date:from:to:cc:subject:message-id;
  bh=vF/HQFfqNdLWYS3/7eZcml5WzQHNKt0VgdW2AHjAuP0=;
  b=DUbVWifBQBZSYqJ2GbG7cW7Jn/A+W0jxog5ZUblQ6nUAe5Dj1yIv782f
   utvaP7dIkzABiswSpxEejTOL8vl68zPKMKPcTmIFaMIIjo76I5ucvopSp
   RcCS5KCO+Z3ivyY1mmyXlqzcDXJtYp7axiRxLiARSE9kfX13fWZADwmsE
   NmrfA0SLtSro71/yDvXtXkO4ppN5WbYAcuSud/HvopRmJQO9etKJIjI0h
   +qrnrGu23/MVjObB9vfXer8wxPIERSWZeSAfBRvdKbeYsf5bamCd6e2bx
   X3Mii11LNOpCVB9trfUDa5hOiGP4PYKMAxsFMUf/S5t+IR3ga07z4uBV9
   w==;
X-CSE-ConnectionGUID: yrfPBHh9QWm/emFQSM2XJw==
X-CSE-MsgGUID: EJc3R3//SQi5f6YlNoQufQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="83221374"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="83221374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2026 07:12:57 -0800
X-CSE-ConnectionGUID: iRg5cHFZTFiaFzoVU+/avw==
X-CSE-MsgGUID: 5leKab3dSHmtWSMCK/pi5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; 
   d="scan'208";a="237211849"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Feb 2026 07:12:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsjEU-000000012SQ-1e5a;
	Wed, 18 Feb 2026 15:12:54 +0000
Date: Wed, 18 Feb 2026 23:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:iomap-pi 9/15] fs/ntfs3/inode.c:664:24: error:
 initialization of 'void (*)(const struct iomap_iter *, struct
 iomap_read_folio_ctx *)' from incompatible pointer type 'void (*)(struct
 iomap_read_folio_ctx *)'
Message-ID: <202602182355.72B97UnC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/misc.git iomap-pi
head:   628dc95babe119df40320f418e2c63331354dedb
commit: 3423f9cc930fcf7c36c214ba862ac1049f513151 [9/15] iomap: pass the iomap_iter to ->submit_read
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20260218/202602182355.72B97UnC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602182355.72B97UnC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602182355.72B97UnC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ntfs3/inode.c:664:24: error: initialization of 'void (*)(const struct iomap_iter *, struct iomap_read_folio_ctx *)' from incompatible pointer type 'void (*)(struct iomap_read_folio_ctx *)' [-Wincompatible-pointer-types]
     664 |         .submit_read = ntfs_iomap_bio_submit_read,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/ntfs3/inode.c:664:24: note: (near initialization for 'ntfs_iomap_bio_read_ops.submit_read')


vim +664 fs/ntfs3/inode.c

82cae269cfa953 Konstantin Komarov 2021-08-13  661  
099ef9ab9203df Konstantin Komarov 2025-12-26  662  static const struct iomap_read_ops ntfs_iomap_bio_read_ops = {
099ef9ab9203df Konstantin Komarov 2025-12-26  663  	.read_folio_range = ntfs_iomap_bio_read_folio_range,
099ef9ab9203df Konstantin Komarov 2025-12-26 @664  	.submit_read = ntfs_iomap_bio_submit_read,
099ef9ab9203df Konstantin Komarov 2025-12-26  665  };
82cae269cfa953 Konstantin Komarov 2021-08-13  666  

:::::: The code at line 664 was first introduced by commit
:::::: 099ef9ab9203dff327f2d61e44773f9acbc01f13 fs/ntfs3: implement iomap-based file operations

:::::: TO: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
:::::: CC: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
