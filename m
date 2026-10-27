Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109312;
	b=Y2lh2bJdRlTScHKdBbPDlIlsdUFvKqUXCBcZPv7ob7OJA3KbYMh75yI5ocNEcU9nwKMo
	 gUwogJyYOBF7ZJKFIeJz8NBomXkIuu+IkqWL+H7x9NsquV4lAF9uT/hQVjw970uI6vfAf
	 +Or8jNyf/KzUYpSne5O9nbWDga7u0y+QhxCFUiDiIFXdn34t16JH8BKmFYieMOXIyMbqH
	 M4y6qazCnVsrWiXFuxXaNPQiyS8Jv7MV+BNACeiQsVIBl2p19xT36sVvCAG7NcTIvvQ52
	 MDDR7u0dcEl5kJ5fhn+EeZO17Hs9Q/717hXDzXRpMbLsbi3IQ3G1R+wHrN53Ie8PGZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109312;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FsOXePtEaiL8knFYAeQ6VMilP1ugMy+X1ZMYvkzwnfY=;
	b=SlIfnKti4cmC7mtvA7BX6ofBYuvCtyfDW2++GXOW8rd6oG6ZWDVnS3kfYiZm3NHVxTgY
	 y4NAtfIXj3TByjx12ttImtpU7jRuqcN9TeEcsbJduacvo/KGs7fdpYmt2pDD9Mba/qE0B
	 uHf+3p5L5rj4RSLqe4sLomIlH28kxDx/urrBN3/+YxmkdPgrsbk3c1UT4TYClXPxt41nt
	 KQRLvtWrZ+csa63TK0po/Cmf9FA8+NjN0e1q25aNY8jwg/tt42Vsl5BCPPigyp63as12E
	 8XLTEZt2+6Mmbipg4HCQ5lnJ1N36BSx/1vyLgpsSdqY+T0exc6JClpQ3Cl5p8CXG1rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="QiQ/m9qj";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D09D606A327
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 13:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D09D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QiQ/m9qj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793109311; x=1824645311;
  h=date:from:to:cc:subject:message-id;
  bh=0RX7xeIMgbxl0V6Ig33FuF2pevuRHaszxnWKZH3rP6A=;
  b=QiQ/m9qjFmpZKZTYoJQS3PrC77j5LpDYXeQFLxncDFABOGDRXP8lWQtg
   LES3zyFPbpSXNtyGApup+oRDUxM1uT9OHAIg+JBltdFEm7M8668BT+N0+
   RlbkmuFSZMy+TNgF2cqonU5A7QCQcBa3Z1rvlPpoFOOym0MZHtvGnpSnm
   wikTIeL/dPOB9I0Mm13HNqCeG/8DMQzUMO8g8+23hhCY/OOfg9Ksags0K
   c5n9J2UsN50FJ91zL+pSQH2P1i+tD48RZfOo8flJKwg1GKKVCgNDrjS3W
   ZlC2EHA3DCE9JUYKFqAThowKs8D/5SmOGBCsvUiFU6J/55f6/Gzvd+QsO
   Q==;
X-CSE-ConnectionGUID: t52JwFUsRTGs8h9FPxPfGQ==
X-CSE-MsgGUID: 4/bUBTKpR6yZFkKJ13hSUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1840074"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1840074"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:55:10 -0700
X-CSE-ConnectionGUID: 4wjuZK4QRiGa0lajKmjEOg==
X-CSE-MsgGUID: oOq9yT9sQBe8o9wbtrtC7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4625314"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 27 Oct 2026 06:55:09 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLhdq-000000004XL-2N5a;
	Tue, 27 Oct 2026 13:55:06 +0000
Date: Tue, 27 Oct 2026 14:54:44 +0100
From: kernel test robot <lkp@intel.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kuba:dma 2/11] drivers/xen/swiotlb-xen.c:435:11: error:
 initialization of 'void * (*)(struct device *, size_t,  dma_addr_t *, gfp_t, 
 long unsigned int)' {aka 'void * (*)(struct device *, long unsigned int, 
 long long unsigned int *, unsigned int,  long unsigned int)'} ...
Message-ID: <202610271408.Ck6gnDo8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Jakub,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux.git dma
head:   cd9029ebe3033a797c066b493e4cfcf5337cf829
commit: 40f9c52cdcf8713402ec7a31c47511d06bdcf5d2 [2/11] dma-direct: pass the NUMA node to dma_direct_alloc()
config: arm64-randconfig-r2310-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271408.Ck6gnDo8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271408.Ck6gnDo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271408.Ck6gnDo8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/xen/swiotlb-xen.c:435:11: error: initialization of 'void * (*)(struct device *, size_t,  dma_addr_t *, gfp_t,  long unsigned int)' {aka 'void * (*)(struct device *, long unsigned int,  long long unsigned int *, unsigned int,  long unsigned int)'} from incompatible pointer type 'void * (*)(struct device *, size_t,  dma_addr_t *, gfp_t,  long unsigned int,  int)' {aka 'void * (*)(struct device *, long unsigned int,  long long unsigned int *, unsigned int,  long unsigned int,  int)'} [-Werror=incompatible-pointer-types]
     .alloc = dma_direct_alloc,
              ^~~~~~~~~~~~~~~~
   drivers/xen/swiotlb-xen.c:435:11: note: (near initialization for 'xen_swiotlb_dma_ops.alloc')
   cc1: some warnings being treated as errors


vim +435 drivers/xen/swiotlb-xen.c

eb1ddc00b81cb8 Stefano Stabellini 2013-10-09  429  
dceb1a6819ab2c Christoph Hellwig  2017-05-21  430  const struct dma_map_ops xen_swiotlb_dma_ops = {
566fb90e050dfa Christoph Hellwig  2022-04-22  431  #ifdef CONFIG_X86
dceb1a6819ab2c Christoph Hellwig  2017-05-21  432  	.alloc = xen_swiotlb_alloc_coherent,
dceb1a6819ab2c Christoph Hellwig  2017-05-21  433  	.free = xen_swiotlb_free_coherent,
566fb90e050dfa Christoph Hellwig  2022-04-22  434  #else
566fb90e050dfa Christoph Hellwig  2022-04-22 @435  	.alloc = dma_direct_alloc,

:::::: The code at line 435 was first introduced by commit
:::::: 566fb90e050dfa2132340bbdab9533b727dda6f1 swiotlb-xen: fix DMA_ATTR_NO_KERNEL_MAPPING on arm

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Christoph Hellwig <hch@lst.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
