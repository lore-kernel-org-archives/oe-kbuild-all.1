Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6019F3D7D74
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Oct 2026 08:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791535951; cv=none; b=l9rPwGqJZc5+/B7ZOA+DfYPdxgZh6yFnsBP4py06QIMB2om1f7C/b6kD03px88g2dRU734knTy7JcLiVa4CNAtl7yuDkI879HOYWY7wHfMgu8dxXnP/p+BUyjtqqTsIq/GvD26UYj95dzfxVmKxzRpEcaTSLGmOPBLfzO411ICA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791535951; c=relaxed/simple;
	bh=hKlkot4xF/NquT+gWuzkzKG4aD30bRtZQmjws1KOVf0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZWWC6qBTgpR5aEqazTziNGn28z/6EQwKP7myzMqEv1sjhrluydWu8WBsnjCgZF2ATotKWRw2Vo0zYqyyOWLlCItGT+JvGBEO+KjIuOIOIzZKImmYiC8yb5Svt7iTst04fOwZFtcovXWbmP0OyB30GdfbFtj6+uKB6RtOrpykUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X0QIYZyy; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X0QIYZyy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791535949; x=1823071949;
  h=date:from:to:cc:subject:message-id;
  bh=hKlkot4xF/NquT+gWuzkzKG4aD30bRtZQmjws1KOVf0=;
  b=X0QIYZyyeXGNT+RRJa7M3Kdg8iy7/avtqSN9ApBQ+NGff27Pff1nwEdv
   nr+0OGBd5YoujIBDVVBFoPlrzEms7MYLdi4ZlMnmSijqsX4WbDN72NIwj
   CxsfbnvksoVTaHwmXhstdPgDlXvyl/TwYuBAHWrmaoRxAdfE7iFBTadQB
   3xVsIH5bJrGfIb2fQmChoRF+iGUtnhgPyyb7qdQTDzAvwqg/0ivgjhLxu
   17w+FId2Zn4pQctiLIQR3tzW02bF7LiAD0Nal5ZY07HF7xxpfePGcW61Q
   Y/VVvX8PNhbQNOCJMlhWKe8q4A5D6ZWomRtABGFWr/YNx8pHhhvbrzeuR
   w==;
X-CSE-ConnectionGUID: rgjB5OzMQOaNNki95nje9Q==
X-CSE-MsgGUID: pF8/E9TTR8a3I1AQnmU+gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11929"; a="333639"
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="333639"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2026 01:52:28 -0700
X-CSE-ConnectionGUID: srycHD4ZStamFRkXQEvv0Q==
X-CSE-MsgGUID: Ay1nXlqtTDKnCFjdb3gcMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,147,1787036400"; 
   d="scan'208";a="206048"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 09 Oct 2026 01:52:26 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xF6L1-000000006sj-3lTi;
	Fri, 09 Oct 2026 08:52:23 +0000
Date: Fri, 09 Oct 2026 10:52:12 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 10013/15343]
 include/linux/io-64-nonatomic-lo-hi.h:21:9: sparse: sparse: cast truncates
 bits from constant value (1f000000000000 becomes 0)
Message-ID: <202610091003.EgYObgiu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aac26bee2287c88af5be5a5ff96d783b19a28790
commit: 3d4e4ad43aa455353067cf004d0618009ac39205 [10013/15343] eth: mpnic: implement Tx queue allocation and cleanup
config: csky-randconfig-r2300-20261009 (https://download.01.org/0day-ci/archive/20261009/202610091003.EgYObgiu-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261009/202610091003.EgYObgiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610091003.EgYObgiu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/meta/mpnic/mpnic_txrx.c: note: in included file (through drivers/net/ethernet/meta/mpnic/mpnic.h):
>> include/linux/io-64-nonatomic-lo-hi.h:21:9: sparse: sparse: cast truncates bits from constant value (1f000000000000 becomes 0)
   include/linux/io-64-nonatomic-lo-hi.h:21:9: sparse: sparse: cast truncates bits from constant value (17000000000000 becomes 0)
   include/linux/io-64-nonatomic-lo-hi.h:21:9: sparse: sparse: cast truncates bits from constant value (37000000000000 becomes 0)

vim +21 include/linux/io-64-nonatomic-lo-hi.h

797a796a13df6b include/asm-generic/io-64-nonatomic-lo-hi.h Hitoshi Mitake 2012-02-07  18  
3a044178cccfeb include/asm-generic/io-64-nonatomic-lo-hi.h Jason Baron    2014-07-04  19  static inline void lo_hi_writeq(__u64 val, volatile void __iomem *addr)
797a796a13df6b include/asm-generic/io-64-nonatomic-lo-hi.h Hitoshi Mitake 2012-02-07  20  {
797a796a13df6b include/asm-generic/io-64-nonatomic-lo-hi.h Hitoshi Mitake 2012-02-07 @21  	writel(val, addr);
797a796a13df6b include/asm-generic/io-64-nonatomic-lo-hi.h Hitoshi Mitake 2012-02-07  22  	writel(val >> 32, addr + 4);
797a796a13df6b include/asm-generic/io-64-nonatomic-lo-hi.h Hitoshi Mitake 2012-02-07  23  }
3a044178cccfeb include/asm-generic/io-64-nonatomic-lo-hi.h Jason Baron    2014-07-04  24  

:::::: The code at line 21 was first introduced by commit
:::::: 797a796a13df6b84a4791e57306737059b5b2384 asm-generic: architecture independent readq/writeq for 32bit environment

:::::: TO: Hitoshi Mitake <mitake@dcl.info.waseda.ac.jp>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
