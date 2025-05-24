Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5402DCBFE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748067267; cv=none; b=K03CEZHA4ElVYKW+A5Y8ZYxyxlC8yR+z8ohWhv3b9Mhb+ll7vQLCXzs4sCESRBvz3PKH2N0LYb4osYOQXkUFMFvTgQGXNK7KmVYZUZ/jrZtmeNt/BgrMFD4w2s3wGKGLNSNbVkGoqOVUJ9HhY7hW3NdoZcQu2x8Xn34TPpyJW2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748067267; c=relaxed/simple;
	bh=faYRy0E9pwLkZA/1CUU/a9bly7DETH67mefiTUUKsB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QoA2nmzqKMwpv1saLmTmWVG+d/DQG3cPmOAVcoDZBDVv0nyqd8LyM9+6IrHn1mn+9HESHwUwZo8p+iWVOfd/a+08brHTJy5TGSC1vO8miNDpDpOYtwPEi+f2r2jteD9O7zv+GjbgYvqTPQUCHdw2T4PzA0Ttb1TBuP+irugHTZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UabV/qBn; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UabV/qBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748067266; x=1779603266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=faYRy0E9pwLkZA/1CUU/a9bly7DETH67mefiTUUKsB0=;
  b=UabV/qBnOgCRBbCIibXr/4wRNxkdZRGCp/PRmeAv475gUzWIpdqSCFsM
   F1ORFqy8HzufRICYk1gllGbkhujKGQ3EyMfI2uopVHz+RtzSrlgaClBIL
   622U4yoEw9vxoGBemXXZufCU4xoWGZy3nKj/ZE1aDD7s6WF5pTd8z9EL9
   GCuZ63CSLwyX5d1NJAzKUwNcpqY4qaxrXleMyiCTTPFMG5BoFWbtWCfUz
   qs5QByVKUDUMrhAQdtU8ID3nJEO+GzHbjHQDwXoZIlOe73whcSFB409Gz
   IU2aDlIwFB4T1QnuxxQXa8gJW5gEyAZR7xw+TBcbgCZN9rz7nCiDDGlGJ
   Q==;
X-CSE-ConnectionGUID: dNnJOV4JSzCKZoBknoPwNQ==
X-CSE-MsgGUID: E2qBvK5vRPOIAKFu6tHf8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50002282"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50002282"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:14:25 -0700
X-CSE-ConnectionGUID: IG/T/rjNTci5Ext8UF8C0w==
X-CSE-MsgGUID: Cxh22LT1QCycCTL1PNNj8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146312147"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2025 23:14:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIi9F-000Qyq-2p;
	Sat, 24 May 2025 06:14:21 +0000
Date: Sat, 24 May 2025 14:14:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ankur Arora <ankur.a.arora@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [jlayton:uek-localio 2022/2262] include/linux/highmem.h:265:2:
 error: implicit declaration of function 'clear_user_page_uncached'; did you
 mean 'clear_user_highpage_uncached'?
Message-ID: <202505241453.sZ2V66eQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 52d04c3d020deba9a0461bf9d8bcf748ec2eb3ad [2022/2262] x86/clear_page: add clear_page_uncached()
config: s390-randconfig-002-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241453.sZ2V66eQ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241453.sZ2V66eQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241453.sZ2V66eQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/skbuff.h:17,
                    from include/linux/if_ether.h:19,
                    from arch/s390/include/asm/diag.h:12,
                    from arch/s390/include/asm/kvm_para.h:25,
                    from include/uapi/linux/kvm_para.h:37,
                    from include/linux/kvm_para.h:5,
                    from include/linux/kvm_host.h:41,
                    from arch/s390/kernel/asm-offsets.c:11:
   include/linux/highmem.h: In function 'clear_user_highpage_uncached':
>> include/linux/highmem.h:265:2: error: implicit declaration of function 'clear_user_page_uncached'; did you mean 'clear_user_highpage_uncached'? [-Werror=implicit-function-declaration]
     clear_user_page_uncached(addr, vaddr, page);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     clear_user_highpage_uncached
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:102: arch/s390/kernel/asm-offsets.s] Error 1 shuffle=1628510533
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1270: prepare0] Error 2 shuffle=1628510533
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1628510533
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1628510533
   make: Target 'prepare' not remade because of errors.


vim +265 include/linux/highmem.h

   259	
   260	#ifndef clear_user_highpage_uncached
   261	static inline void clear_user_highpage_uncached(struct page *page, unsigned long vaddr)
   262	{
   263		void *addr = kmap_atomic(page);
   264	
 > 265		clear_user_page_uncached(addr, vaddr, page);
   266		kunmap_atomic(addr);
   267	}
   268	#endif
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
