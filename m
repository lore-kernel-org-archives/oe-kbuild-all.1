Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687CABE4D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 04:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705638657; cv=none; b=ojJneZAShFbwSkK0KMI0TIWgjRCyQ54gjs5rt/paijGL0u32EP5bk3uB8ixwTlxqV8osuym/XELPApQRg4B5l5BX145b3A7goh70yu4g7+MVGOOEBuQvmCx80Me5LwTf0sNXrDSYYziwbzYI46w+zodZQ+ITNUN3/MfNQWL77wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705638657; c=relaxed/simple;
	bh=Vbo1I+lJ3yFQJ0F46CjnDnU8rBqU+VNny7pBlf269Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k2AIMI+cQfGh2g/TqqEx2DG32ExvEG7eQhm0c/iupfc70KjXGIzUD5rRCS9AymOcFmJrEjN9MY6d4I3bOGLyPlaWjPDRvimB2RTCnTGUFp/P/9KdGupnwSWOTYwotV7Q5bBOuBODkGWGVrsMzKqFJQyWlilRRRG6PCYp/GU+VKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZT17lAp; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZT17lAp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705638655; x=1737174655;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vbo1I+lJ3yFQJ0F46CjnDnU8rBqU+VNny7pBlf269Xw=;
  b=MZT17lApFWMNKDcpgsA076KKUaBkgGQlsM/s4o5fnRTE0PQBomRA/WZi
   KUsSvvx7pEuA0EtlsQ/ymUwvXK/o/hlEbxkTFXWbauhvrksvXhdSOA+OK
   VPcWTUuwvotx0+vLzRNR+z0+FVhXe+4HtdvjPRQBAnHj+Xw/7+opYQbQ1
   hN3AOjf+08d+GOztHges8XrBEv1A6cRwkVIOrwy+DFdwaF3hhUSw8ToKs
   4aZoRFjgjcC9T8IWTkEUKL5KQDvrKTy4+gMNFfFfpGylZMwlduzvWxF/Q
   /wWwNo9bwMjVv81OtoVw/Qokqqslw5ZgYNcUJKHXl9dRNYojBXGHjLtIj
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="399529309"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="399529309"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 20:30:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="26670149"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2024 20:30:44 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQgWf-0003cc-0b;
	Fri, 19 Jan 2024 04:30:41 +0000
Date: Fri, 19 Jan 2024 12:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v4a 9/44] drivers/net/ethernet/dec/tulip/tulip.h:546:25:
 sparse: sparse: Initializer entry defined twice
Message-ID: <202401191243.Re7hZF0e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v4a
head:   1eb3a6cb0f321dd3a285899d1af24a4d75f70d2e
commit: 4e29874e95dbb4062f7e9528992bcfdb0100dfae [9/44] dyndbg: move flags field to a new structure
config: x86_64-randconfig-121-20240119 (https://download.01.org/0day-ci/archive/20240119/202401191243.Re7hZF0e-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191243.Re7hZF0e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191243.Re7hZF0e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/net/ethernet/dec/tulip/pnic2.c: note: in included file:
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here
--
   drivers/net/ethernet/dec/tulip/timer.c: note: in included file:
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here
--
   drivers/net/ethernet/dec/tulip/interrupt.c: note: in included file:
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here
--
   drivers/net/ethernet/dec/tulip/pnic.c: note: in included file:
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here
--
   drivers/net/ethernet/dec/tulip/21142.c: note: in included file:
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here
--
   drivers/net/ethernet/dec/tulip/tulip_core.c: note: in included file:
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here
>> drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse: sparse: Initializer entry defined twice
   drivers/net/ethernet/dec/tulip/tulip.h:546:25: sparse:   also defined here

vim +546 drivers/net/ethernet/dec/tulip/tulip.h

^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  528  
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  529  static inline void tulip_stop_rxtx(struct tulip_private *tp)
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  530  {
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  531  	void __iomem *ioaddr = tp->base_addr;
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  532  	u32 csr6 = ioread32(ioaddr + CSR6);
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  533  
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  534  	if (csr6 & RxTx) {
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  535  		unsigned i=1300/10;
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  536  		iowrite32(csr6 & ~RxTx, ioaddr + CSR6);
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  537  		barrier();
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  538  		/* wait until in-flight frame completes.
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  539  		 * Max time @ 10BT: 1500*8b/10Mbps == 1200us (+ 100us margin)
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  540  		 * Typically expect this loop to end in < 50 us on 100BT.
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  541  		 */
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  542  		while (--i && (ioread32(ioaddr + CSR5) & (CSR5_TS|CSR5_RS)))
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  543  			udelay(10);
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  544  
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  545  		if (!i)
726b65ad444dd1 drivers/net/tulip/tulip.h Joe Perches    2011-05-09 @546  			netdev_dbg(tp->dev, "tulip_stop_rxtx() failed (CSR5 0x%x CSR6 0x%x)\n",
b3bff39a2b3574 drivers/net/tulip/tulip.h Valerie Henson 2007-03-12  547  				   ioread32(ioaddr + CSR5),
b3bff39a2b3574 drivers/net/tulip/tulip.h Valerie Henson 2007-03-12  548  				   ioread32(ioaddr + CSR6));
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  549  	}
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  550  }
^1da177e4c3f41 drivers/net/tulip/tulip.h Linus Torvalds 2005-04-16  551  

:::::: The code at line 546 was first introduced by commit
:::::: 726b65ad444dd142e34d0087fcbba03d16b34ca6 tulip: Convert uses of KERN_DEBUG

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
