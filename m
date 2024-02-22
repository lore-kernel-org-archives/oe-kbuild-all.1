Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7C045973
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 11:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601715; cv=none; b=pOY+Lz5hwdg7/ZX3y+DQYSfi5t/JnfpJX4GoinJ/353iNWLOL5m5Jvn6JADqk5PlxTSqoWwgAVHWUXwX+NOdx7aE0qI4tmEx5g8vz86F7tMIcCgRzO8P5ShyobDkD/BWyj1h/gC9ZE/5zY8xsppqZ1lX6SOEY76DHaa0e+p5zaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601715; c=relaxed/simple;
	bh=74gUcMe02sidwhRQIqooc8gqburKNimWY0eCaBBkGnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NuV/dKrZwyxdLqkcNthvkp6oBkjhqipDAH/cdgXi/av8H/3lcggGoifAzg7H3mpVi5GYYlxwsWYZ3uf7mAkal5GLdCRiN/SjyHs404WGXIkXcFWk54frQrN+jFc98BV4yg95LER0E4i1DEFiTWOXGhzjovM1VhqCY6UyN/nIZvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HYu1KjWj; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HYu1KjWj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708601713; x=1740137713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=74gUcMe02sidwhRQIqooc8gqburKNimWY0eCaBBkGnQ=;
  b=HYu1KjWjP9SxnYL0wAuhmGb+RWLUAgEBf9Cf4Mu1TRsejHDtLdGP5vAe
   LNsm+0Is/OHB1GBAWdA4Qii6IRrIoFhE0MpRXT+unNfrVltmiZq5qr1GH
   w6J9KoavUeYylpYOcdL44+8UcjGgjEvMN5/wCOhKhq+li+Cp3mhx40zlA
   2zWr8yL233EskvallGJtJK4PiAiC+xqRghWK9q2nGKC5NkRl21JMcKfeU
   t3z4EUBeO52mOuHrPtyJi2D0OaojQMKhClFcP0cG6OJFGFxNFPNgOGNLP
   QXMnPimSW1YEhwiFWBahlI/Jp82pzxua6DIhNTNZ62UYP3e7uGKUxixCt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14243264"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="14243264"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 03:35:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; 
   d="scan'208";a="10146269"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 22 Feb 2024 03:35:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd7M5-0006Gg-0b;
	Thu, 22 Feb 2024 11:35:09 +0000
Date: Thu, 22 Feb 2024 19:34:31 +0800
From: kernel test robot <lkp@intel.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [riteshharjani:ext2-iomap-rebase-v1 18/20] fs/ext2/inode.c:981:35:
 error: initialization of 'int (*)(struct iomap_writepage_ctx *, struct inode
 *, loff_t,  unsigned int)' {aka 'int (*)(struct iomap_writepage_ctx *,
 struct inode *, long long int,  unsigned int)'} from incompatible pointer
 type 'int...
Message-ID: <202402221932.2qY9fjs9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/riteshharjani/linux ext2-iomap-rebase-v1
head:   15e7b48cbf2af2424d794e3cffd1e49d4144d995
commit: ff07adc7c4187eb7ea9ce174d8d9207d8a46c869 [18/20] ext2: Convert ext2 regular file buffered I/O to use iomap
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240222/202402221932.2qY9fjs9-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402221932.2qY9fjs9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402221932.2qY9fjs9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ext2/inode.c:981:35: error: initialization of 'int (*)(struct iomap_writepage_ctx *, struct inode *, loff_t,  unsigned int)' {aka 'int (*)(struct iomap_writepage_ctx *, struct inode *, long long int,  unsigned int)'} from incompatible pointer type 'int (*)(struct iomap_writepage_ctx *, struct inode *, loff_t)' {aka 'int (*)(struct iomap_writepage_ctx *, struct inode *, long long int)'} [-Werror=incompatible-pointer-types]
     981 |         .map_blocks             = ext2_write_map_blocks,
         |                                   ^~~~~~~~~~~~~~~~~~~~~
   fs/ext2/inode.c:981:35: note: (near initialization for 'ext2_writeback_ops.map_blocks')
   cc1: some warnings being treated as errors


vim +981 fs/ext2/inode.c

   979	
   980	static const struct iomap_writeback_ops ext2_writeback_ops = {
 > 981		.map_blocks		= ext2_write_map_blocks,
   982	};
   983	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
