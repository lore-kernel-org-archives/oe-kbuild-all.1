Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9DF2E638
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 20:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705609371; cv=none; b=TZmYty9fBvjGmDo+xyX5XzA2Iv4vctHHCgu4GgfpVbr5FKVuu/0NOrlxd2nCqNgcn/xqDE9SKmeMTavgN6sY5QTjxIrCI7m2dwKKMD2gXgOFLXPTdXdu2YSOI7ny93GOjGt+TUE0ShGNLlfD1ftREeYNd7GnvrApYmxQ/wv8Q5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705609371; c=relaxed/simple;
	bh=9/u2Y1mGN7XPsq3atz4d3HNvXSjEW9MK24zeb/G8EZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mA/QdzcbbWxMN/Jd17My7V1bqKAdCs5T7Bs8P0JmPezMyO7cjKaVfNB4bM4dIUx628jwkyF9+hJFIHz4lnIvE3107AUKns8SAGOFdTfiaWa83yzqB7sWCIm4Okg/m7DO9jZuTYZGOfEKKVMRKdKXkLTwbEzRh+hRUxP3l6AirBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0UzFNER; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0UzFNER"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705609368; x=1737145368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/u2Y1mGN7XPsq3atz4d3HNvXSjEW9MK24zeb/G8EZc=;
  b=c0UzFNERqtZrAPaRN4IXyp8kws2hfJC6LomPcXrqIzXuiHrNPHZbsxNB
   vrguiW3VC6nJ7vJS7oL3JO6A05sNN54yGrRtU/h0Xjs4pJBd7duVs840Q
   GOPwXPFqPsYm2sJhcWC3dCulbIV03GDRxdFiuw/f9xyvWBPKtG41eXHlH
   7Swrbpxgc913f4k8iwhN9HLdxAR+jXI6lc489Otpq+cQswEHHw3QhJnVE
   dsgRsO0RNcvtlU+x5bXxUSUn4D/p3XOSdFaEmuiyrCCuP03L8Gpc8HNKp
   hb8N7DG90soi3kHCng3dFtwr9FNYVv6vMtToBRkd+L5SGnAzbMFU2ZPFU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7964289"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7964289"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 12:13:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="875185072"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="875185072"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Jan 2024 12:13:29 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQYlT-0003Ie-24;
	Thu, 18 Jan 2024 20:13:27 +0000
Date: Fri, 19 Jan 2024 04:12:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:mlx5_wc 2/10] arch/s390/include/asm/io.h:82:9: error:
 implicit declaration of function 'zpci_memcpy_toio'
Message-ID: <202401190425.wdWHtmtI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux mlx5_wc
head:   75d97676a69279a7b9ab70452bd1e97c0a5df3f9
commit: ad883e9437958651d52e49b456a3c545d56d2e48 [2/10] s390: Implement __iowrite32_copy()
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240119/202401190425.wdWHtmtI-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190425.wdWHtmtI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401190425.wdWHtmtI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/linux/msi.h:27,
                    from include/linux/kvm_host.h:19,
                    from arch/s390/kernel/asm-offsets.c:11:
   arch/s390/include/asm/io.h: In function '__iowrite32_copy':
>> arch/s390/include/asm/io.h:82:9: error: implicit declaration of function 'zpci_memcpy_toio' [-Werror=implicit-function-declaration]
      82 |         zpci_memcpy_toio(to, from, count * 4);
         |         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:116: arch/s390/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1191: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/zpci_memcpy_toio +82 arch/s390/include/asm/io.h

    77	
    78	/* combine single writes by using store-block insn */
    79	static inline void __iowrite32_copy(void __iomem *to, const void *from,
    80					    size_t count)
    81	{
  > 82		zpci_memcpy_toio(to, from, count * 4);
    83	}
    84	#define __iowrite32_copy __iowrite32_copy
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
