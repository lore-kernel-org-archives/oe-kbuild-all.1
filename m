Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951B3B4EBF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jul 2026 10:32:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889157; cv=none; b=V3v0ftqiZdaqSTcXlPDdcWsttcAGejOIS9DmC9+hf6RHLYKyYGEbmNQbhr0SX0YMgZLSWgV759tuV4C0+EuQNc2aFdFIzmW28xprymZGoRDEcrIcMYFhM1vrnw0PlsruSMkxHg2g5qopWh9haARQTt2NIuCbYm5wHqUTOywRGAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889157; c=relaxed/simple;
	bh=xda5VDWjsvhdtJH4ETTadCCxC3inXEJvaY2DiVJmlq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hCv6/Ug1/gz7ZmgxCWNCut9PXTiyJmsgewDevcfyPekLDi+/dwK3KH7AR2xoexe2IWw1l/4Agz4R0pM+2rFbR+CoFvCmewWLoeikexR6Nz9Y9tiG7prxHbp6MaZvs/K+jFj3FWWOr3GNgDrTgNh5OsCJfjMM0ssHdfcR4oeeDg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJXA2yiQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJXA2yiQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784889154; x=1816425154;
  h=date:from:to:cc:subject:message-id;
  bh=xda5VDWjsvhdtJH4ETTadCCxC3inXEJvaY2DiVJmlq0=;
  b=SJXA2yiQWrEB+xYV6ldybhVUC0GXpQwYthDVRi3dGraODCNu5rpiwRup
   RSYMNwM7AlyLTtq9XumPzVXXxRZk9EWIIBRlHbdX1eVl6YbRLI9RVz/u3
   u1Ye3tHj3+k3TdysckNu0+sMqH3I4I2Wk3nm/vBoyXalUP+O83J4cSSqd
   lEN6fRxq+JY4Jc2bfQn650mTxyaYAqFtwCDC55tpaBvTqunZb2B76P3hN
   yfHEvfrLh1gcxkuNLK2sPWBWRF5yjrkULTCiSmIyN06TAQEAg8YmYRJ7+
   82ujiOFBdoPdglFKdIx33iAeG6JOaZWRxkk42YUoO8VLzI+cCDnnGGGbR
   g==;
X-CSE-ConnectionGUID: zRQP/sNjQTSYM0TTyZsc6Q==
X-CSE-MsgGUID: 4Jw7B17sT76y+gnrsYCLmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="111100112"
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="111100112"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2026 03:32:32 -0700
X-CSE-ConnectionGUID: ZykHl4DXT4CYHuLxkj7Z2g==
X-CSE-MsgGUID: IZelD/hTTqiIyT8h0Xd4Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,182,1779174000"; 
   d="scan'208";a="254736061"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jul 2026 03:32:30 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnDCe-000000000xO-2g4f;
	Fri, 24 Jul 2026 10:32:28 +0000
Date: Fri, 24 Jul 2026 12:31:55 +0200
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:lazy-bounce 20/23] fs/iomap/ioend.c:315:undefined
 reference to `fs_bio_integrity_verify'
Message-ID: <202607241207.byP3AWSp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/hch/xfs lazy-bounce
head:   929a35b173fce4af373ed0e17f7329523fd40bcb
commit: 3c21461b020acab739ebb50d85316d12df319739 [20/23] iomap,xfs: move integrity verification to the file system
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260724/202607241207.byP3AWSp-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260724/202607241207.byP3AWSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607241207.byP3AWSp-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390x-linux-gnu-ld: fs/iomap/ioend.o: in function `iomap_ioend_integrity_verify':
>> fs/iomap/ioend.c:315:(.text+0x5ba): undefined reference to `fs_bio_integrity_verify'


vim +315 fs/iomap/ioend.c

8f02cecd80b993 Christoph Hellwig 2025-07-10  310  
3c21461b020aca Christoph Hellwig 2026-07-22  311  int iomap_ioend_integrity_verify(struct iomap_ioend *ioend)
5e347a75173d67 Christoph Hellwig 2026-07-22  312  {
5e347a75173d67 Christoph Hellwig 2026-07-22  313  	struct bvec_iter data_iter = BVEC_ITER_IOEND(ioend);
5e347a75173d67 Christoph Hellwig 2026-07-22  314  
5e347a75173d67 Christoph Hellwig 2026-07-22 @315  	return fs_bio_integrity_verify(&ioend->io_bio, &data_iter);
5e347a75173d67 Christoph Hellwig 2026-07-22  316  }
3c21461b020aca Christoph Hellwig 2026-07-22  317  EXPORT_SYMBOL_GPL(iomap_ioend_integrity_verify);
5e347a75173d67 Christoph Hellwig 2026-07-22  318  

:::::: The code at line 315 was first introduced by commit
:::::: 5e347a75173d67f7e56e7c2641dc7d5559db9f79 block,iomap: fix protection information verification with initial bvec offset

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
