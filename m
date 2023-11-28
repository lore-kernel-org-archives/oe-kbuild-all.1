Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E5F37B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 00:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vey+ATtK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701130881; x=1732666881;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ldYwliRgfmYQY/5Fp3UJc4cbBvwvIzDaWsysGwRRtV8=;
  b=Vey+ATtKq7V9RV5dMdSdxcwK0Mn0kSShl74N9EKCfWAdZ0qfu2kk90wv
   7t6p0jZ5xu7ctI00dKOZKZAYgBMKrnf35oukgt1/DfV9kQgr1ASqdqBqk
   krRCj1X4rBkN0xCE3iM9cLoLVgQNNx0QPng2SGcZH3gNH8Wx1qdMPEOUJ
   uJGaFpmz5gDcDnjFV6nd4mnmIAxXuRtMLgAfXj6zJQNUuV4c+0MydN03T
   cx/4FBJaYNqkjDiKz2x6lad1gyf2khy9DpZBg0bTQloHSrT65AGTCPhRf
   9IoonZZDtR06wRtyZfyteTET0wszaB5INsokyy1zeoSaEcQ4fmKIIO6zB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="423968513"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="423968513"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 16:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="718212961"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="718212961"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 27 Nov 2023 16:21:05 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7lqZ-0006oG-0w;
	Tue, 28 Nov 2023 00:21:03 +0000
Date: Tue, 28 Nov 2023 08:19:33 +0800
From: kernel test robot <lkp@intel.com>
To: Gao Xiang <xiang@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Xiang Gao <xiang@kernel.org>
Subject: [xiang:erofs/pageleak-detection 1/1] fs/erofs/compress.h:89:39:
 error: 'const struct erofs_sb_info' has no member named 'managed_cache'
Message-ID: <202311280634.HM6twAz5-lkp@intel.com>
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
config: i386-randconfig-002-20231127 (https://download.01.org/0day-ci/archive/20231128/202311280634.HM6twAz5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280634.HM6twAz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280634.HM6twAz5-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/erofs/utils.c:7:
   fs/erofs/compress.h: In function 'erofs_page_is_managed':
>> fs/erofs/compress.h:89:39: error: 'const struct erofs_sb_info' has no member named 'managed_cache'
      89 | #define MNGD_MAPPING(sbi)       ((sbi)->managed_cache->i_mapping)
         |                                       ^~
   fs/erofs/compress.h:93:33: note: in expansion of macro 'MNGD_MAPPING'
      93 |         return page->mapping == MNGD_MAPPING(sbi);
         |                                 ^~~~~~~~~~~~


vim +89 fs/erofs/compress.h

274812334b46de5 drivers/staging/erofs/compress.h Gao Xiang 2019-06-24  88  
622ceaddb7649ca fs/erofs/compress.h              Gao Xiang 2021-10-11 @89  #define MNGD_MAPPING(sbi)	((sbi)->managed_cache->i_mapping)
622ceaddb7649ca fs/erofs/compress.h              Gao Xiang 2021-10-11  90  static inline bool erofs_page_is_managed(const struct erofs_sb_info *sbi,
622ceaddb7649ca fs/erofs/compress.h              Gao Xiang 2021-10-11  91  					 struct page *page)
622ceaddb7649ca fs/erofs/compress.h              Gao Xiang 2021-10-11  92  {
622ceaddb7649ca fs/erofs/compress.h              Gao Xiang 2021-10-11  93  	return page->mapping == MNGD_MAPPING(sbi);
622ceaddb7649ca fs/erofs/compress.h              Gao Xiang 2021-10-11  94  }
622ceaddb7649ca fs/erofs/compress.h              Gao Xiang 2021-10-11  95  

:::::: The code at line 89 was first introduced by commit
:::::: 622ceaddb7649ca328832f50ba1400af778d75fa erofs: lzma compression support

:::::: TO: Gao Xiang <hsiangkao@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
