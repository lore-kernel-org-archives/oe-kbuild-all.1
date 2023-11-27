Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47866374C3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Nov 2023 17:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W6+DtWd+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701105646; x=1732641646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AwU0nP/T/epH7fAzzBcO+urzt4CkQZoEFBzr30P7lhQ=;
  b=W6+DtWd+iNePPeGVyV4VQXazzcECAsFFrzXKFYdeq4bCg1sLVNWh82nC
   Lb3cB09sDP3eSm+ANS26w+pxrfOF1IVWVW+MZkEGxbXBqTERH32Oy/3F+
   LBgfNcS+Nm/qiVfXKLt5KAijLJR+EhE6yAevXw4BZVyajjN57lNuHML/z
   SCu8Kp82GQUz8yfdB4oqGcNSLI7KcNBc+4lJfB6UtjgxvK2uVDSH5YfwK
   qXEIOrIV4aN0Az2AQQX1HzNpcVMDwkYEdXJV/HqCBtX9cTmd1XZuSrVrC
   jdw+zpDwj8mjydXXXW+L8EPLno0mQ9e36H9BAE6/h7OVjiX+20A/90WrR
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="459248639"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="459248639"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 09:20:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="16654931"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Nov 2023 09:20:44 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7fHm-0006V7-0v;
	Mon, 27 Nov 2023 17:20:42 +0000
Date: Tue, 28 Nov 2023 01:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <xiang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>
Subject: [xiang:erofs/pageleak-detection 1/1] fs/erofs/compress.h:93:26:
 error: no member named 'managed_cache' in 'struct erofs_sb_info'
Message-ID: <202311280111.lKcwijFa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/linux.git erofs/pageleak-detection
head:   204afbae38444fdd3b5ea37a94043f974b94967a
commit: 204afbae38444fdd3b5ea37a94043f974b94967a [1/1] erofs: (testing only) page leak detection
config: x86_64-randconfig-121-20231127 (https://download.01.org/0day-ci/archive/20231128/202311280111.lKcwijFa-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280111.lKcwijFa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280111.lKcwijFa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/erofs/utils.c:7:
>> fs/erofs/compress.h:93:26: error: no member named 'managed_cache' in 'struct erofs_sb_info'
           return page->mapping == MNGD_MAPPING(sbi);
                                   ^~~~~~~~~~~~~~~~~
   fs/erofs/compress.h:89:35: note: expanded from macro 'MNGD_MAPPING'
   #define MNGD_MAPPING(sbi)       ((sbi)->managed_cache->i_mapping)
                                    ~~~~~  ^
   1 error generated.


vim +93 fs/erofs/compress.h

274812334b46de drivers/staging/erofs/compress.h Gao Xiang 2019-06-24  88  
622ceaddb7649c fs/erofs/compress.h              Gao Xiang 2021-10-11  89  #define MNGD_MAPPING(sbi)	((sbi)->managed_cache->i_mapping)
622ceaddb7649c fs/erofs/compress.h              Gao Xiang 2021-10-11  90  static inline bool erofs_page_is_managed(const struct erofs_sb_info *sbi,
622ceaddb7649c fs/erofs/compress.h              Gao Xiang 2021-10-11  91  					 struct page *page)
622ceaddb7649c fs/erofs/compress.h              Gao Xiang 2021-10-11  92  {
622ceaddb7649c fs/erofs/compress.h              Gao Xiang 2021-10-11 @93  	return page->mapping == MNGD_MAPPING(sbi);
622ceaddb7649c fs/erofs/compress.h              Gao Xiang 2021-10-11  94  }
622ceaddb7649c fs/erofs/compress.h              Gao Xiang 2021-10-11  95  

:::::: The code at line 93 was first introduced by commit
:::::: 622ceaddb7649ca328832f50ba1400af778d75fa erofs: lzma compression support

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
