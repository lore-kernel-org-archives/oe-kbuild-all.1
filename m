Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 312EF86250
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 05:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753768606; cv=none; b=CKIo33kelFSZdpnf7QcuIDEaBDwOhwTEk67rLBUQ/XKDLFBL26Vw5F6/AgWFzXjHDvvGeYO+XoEgA41tcXS+Ed3qmBve2DgQb9y1oXrcYhmeZIPb1luDhHwg4kK2JlnvCthqfYmyT3vH2v+PaosLPxLl0AD31BjiQEuo8JyYRig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753768606; c=relaxed/simple;
	bh=5aQ51rmap1Kq7xhZvrTGUkBr3qSl6sCBkpRMBzj//KY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YwRbMyZls3qwi6HUhm/7+raHDTpalBgfQCgWCpghol6qwlBh8pufaq/Xnb7woxJLporvfrPiPgHepRECIjrNhhlSNx6gFulTMGea4OCqDHRqRS5r+Myb94vRU263pvdIPHGRWdJP4582dcHqI/g71XG8iRnhrIZHLx5GxhCAO2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD3bzCKf; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD3bzCKf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753768605; x=1785304605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5aQ51rmap1Kq7xhZvrTGUkBr3qSl6sCBkpRMBzj//KY=;
  b=PD3bzCKfVvi+/xIfGJ7U2XlHPqrmD3edTWWhY3uKANLakcvb8HVS4bjX
   nHKz/xHdzYQkgukFL0gF7GakCT5jxcw6qN83t3im1qjwsH3asCwWeoMRz
   176NY59H9ivZTQ5f3QnE/9gEDZgVmhANwy0TlB6clo+mD9Pi8phIAYoxH
   3LXSZzfALNu/LeKJ9rV0hmDr6K7/Gx6yKDucZwZES3KZPw7LGIEU5HhsR
   BRR1Zb//3BCZvdhBu3VlgGW6SQrfszcyIlfV/49Bpv7190ZxBkoQEpcG8
   cLBWTNqG8fFCm/pqBPk/R8EYQ4Z7jwukRmlYh+RRLLrKQFAcf/Zd0aFny
   g==;
X-CSE-ConnectionGUID: 0kAVzyGoQsmaPh5cBjrRFw==
X-CSE-MsgGUID: exlbcTQ2Toui717JR83f7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73477693"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="73477693"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2025 22:56:43 -0700
X-CSE-ConnectionGUID: lBo+75fLSQmXZcYehYyxsg==
X-CSE-MsgGUID: sfar+3wtRd+kgrJDQnqiPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; 
   d="scan'208";a="162486921"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Jul 2025 22:56:41 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugdKJ-00012f-1Z;
	Tue, 29 Jul 2025 05:56:39 +0000
Date: Tue, 29 Jul 2025 13:56:27 +0800
From: kernel test robot <lkp@intel.com>
To: Ian Rogers <irogers@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: [thomas-weissschuh:vdso/unaligned 1/3] include/rdma/iba.h:48:16:
 sparse: sparse: incorrect type in argument 1 (different modifiers)
Message-ID: <202507291356.KX5dMLQw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/unaligned
head:   d826530fc107faa320a7a88b939b72fa5f6734b5
commit: 3e7bf09e7bd5dce36df14f6770211fd1bc98a538 [1/3] vdso: Switch get/put unaligned from packed struct to memcpy
config: i386-randconfig-062-20250729 (https://download.01.org/0day-ci/archive/20250729/202507291356.KX5dMLQw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507291356.KX5dMLQw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507291356.KX5dMLQw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/infiniband/core/cm.c:1296:20: sparse: sparse: cast from restricted __be32
   drivers/infiniband/core/cm.c: note: in included file (through include/rdma/ibta_vol1_c12.h, drivers/infiniband/core/cm_msgs.h):
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *
>> include/rdma/iba.h:48:16: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected void * @@     got restricted __be64 const * @@
   include/rdma/iba.h:48:16: sparse:     expected void *
   include/rdma/iba.h:48:16: sparse:     got restricted __be64 const *

vim +48 include/rdma/iba.h

d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  41  
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  42  static inline u64 _iba_get64(const __be64 *ptr)
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  43  {
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  44  	/*
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  45  	 * The mads are constructed so that 32 bit and smaller are naturally
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  46  	 * aligned, everything larger has a max alignment of 4 bytes.
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  47  	 */
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16 @48  	return be64_to_cpu(get_unaligned(ptr));
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  49  }
d05d4ac4c9316a2 Leon Romanovsky 2020-01-16  50  

:::::: The code at line 48 was first introduced by commit
:::::: d05d4ac4c9316a2e2ea5be434a7f7a021ec44a3c RDMA/cm: Add SET/GET implementations to hide IBA wire format

:::::: TO: Leon Romanovsky <leonro@mellanox.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
