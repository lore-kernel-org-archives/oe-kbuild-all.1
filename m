Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCC3201023
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 07:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737615609; cv=none; b=QIoEvQDuwf/etyVvus8FAFXGSTUAAM2jndLKYT5lF2Y4jMVKinZS9dri+9btIV+wbGjn/OuMtAylRZOEKUfa7nnjf7iI585f5ZJyFCa3Hrj40ZO3YPa4zC7y4fh7nwNNfBtNG1Cq0mH4g+S/fwSnWYVj1O6FbCDS0P4OE8ZLKx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737615609; c=relaxed/simple;
	bh=1EgpwxHOwNAsQLZMpXWYELK23UzhvVgjB2zCUXFOPBM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tE+ZsS6eU/Ve8ykVvpkE1cl6gKP1QYXh0X0zYVuU6tPuMJNJWTiA2PQ4KXJZE+Nj6GSxZ3nUHGVfINQap8kXN0h02OBRf/hn91Up/M2Q48kxlIDe7QOgLRNlE1lr4/JODtWyXLoi8DWfkicL4yBHc4D8IrZyCjx3wiXkZZcg+5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNrS1Ern; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNrS1Ern"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737615608; x=1769151608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1EgpwxHOwNAsQLZMpXWYELK23UzhvVgjB2zCUXFOPBM=;
  b=LNrS1ErnoECPOq/0ezT02XoS+uuY2/jaNWlKuqozzUZcbrIBBAOevzo0
   RA9AidbN3aVH6JHY1GPCc2Wcig2a4xSPbKwjF+Oo6uwWCeCLN3Bj/aP1l
   hh2D4oOCxcNPOBGjvj0+bRteRIM8rNzrYhSA0Ia8lmMtIhLKkgeabUaSr
   kYL1qf/t8Tx6Lgx8sON0sAVV9AjiAbcG84Aafur1Tztj0A6mBiOxtfRrz
   QjICwlZcWR0sn5xs1z2+6tEzB+v0pkvgOncCjoY4rlcPQpsYoE+VfgpWZ
   JtFuLOHtsnJ6vgZNAXuCs0XU4Hh71fgV/Nw6q+ssI6yK9W7ACA2F2O6Te
   g==;
X-CSE-ConnectionGUID: H5aoE4sqTpebqlADGp0VJw==
X-CSE-MsgGUID: Z9sidUs9TZqCap2fg4eSlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37988327"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="37988327"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 23:00:07 -0800
X-CSE-ConnectionGUID: 4LXw3OH1RBOv1k+AEHqJuA==
X-CSE-MsgGUID: LESi/GnITCm6fkFYeslJAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="107919541"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jan 2025 23:00:06 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tarC7-000arD-2b;
	Thu, 23 Jan 2025 07:00:03 +0000
Date: Thu, 23 Jan 2025 14:59:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-6.14 8/8] include/linux/stddef.h:16:33: error:
 'struct io_async_msghdr' has no member named 'init'
Message-ID: <202501231454.MMbmaa2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-6.14
head:   eaf99654a6373a5807ec91dad44f828454a5c218
commit: eaf99654a6373a5807ec91dad44f828454a5c218 [8/8] io_uring: get rid of alloc cache init_once handling
config: csky-randconfig-002-20250123 (https://download.01.org/0day-ci/archive/20250123/202501231454.MMbmaa2W-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501231454.MMbmaa2W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501231454.MMbmaa2W-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/csky/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:339,
                    from include/linux/array_size.h:5,
                    from include/linux/kernel.h:16,
                    from io_uring/io_uring.c:42:
   io_uring/io_uring.c: In function 'io_ring_ctx_alloc':
>> include/linux/stddef.h:16:33: error: 'struct io_async_msghdr' has no member named 'init'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c:321:29: note: in expansion of macro 'offsetof'
     321 |                             offsetof(struct io_async_msghdr, init));
         |                             ^~~~~~~~


vim +16 include/linux/stddef.h

6e218287432472 Richard Knutsson 2006-09-30  14  
^1da177e4c3f41 Linus Torvalds   2005-04-16  15  #undef offsetof
14e83077d55ff4 Rasmus Villemoes 2022-03-23 @16  #define offsetof(TYPE, MEMBER)	__builtin_offsetof(TYPE, MEMBER)
3876488444e712 Denys Vlasenko   2015-03-09  17  

:::::: The code at line 16 was first introduced by commit
:::::: 14e83077d55ff4b88fe39f5e98fb8230c2ccb4fb include: drop pointless __compiler_offsetof indirection

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
