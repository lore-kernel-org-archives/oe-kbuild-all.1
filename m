Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F8327706
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 20:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679691094; x=1711227094;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XLUPHucnwuTZnkcqEMlAOkO4QDoePZStioKVkb9wBlA=;
  b=HzvnFXeRhX69M1YmNeg7F2u1KVhdBGD9oFCvNLUHxSKo9Yt8vvEflaCT
   ZcP3dkbnNDPpvoC1mtNact1nxLl+i5J4+bDxAQLIP/iDI/QLkoj3x3QKJ
   +J9XI4cGEs2eGnyH8wh7FWZkECA0FSXyje9fUeGk7a3s64b3q1r2MYtTl
   NgWRWATf/rv/7fx9CPlL52uSgg+lc/OjK/9vH47BUJDUnzdChunk6gPBs
   /cCJN/vXbSKfNTKjYQtgoYDXfeoRfvEyzvmp6b/Ccq9aiTk8rgDCAvY1q
   WKf3ZSn/tGo0eR/w0kwLjEPpKlKRxVsdz7Qmri0DV3W2wP25fmTLVYNHN
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="342274312"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="342274312"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 13:51:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="747294676"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="747294676"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 24 Mar 2023 13:51:33 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfoNo-000Fe8-1p;
	Fri, 24 Mar 2023 20:51:32 +0000
Date: Sat, 25 Mar 2023 04:50:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 1/1] lib/test_map_h.c:37:14: warning: unused variable
 'caten'
Message-ID: <202303250408.OXzqRrBg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   a43c9ca75a0027cb9ece5c55b2287bb682e55416
commit: a43c9ca75a0027cb9ece5c55b2287bb682e55416 [1/1] include/linux/map.h: add new header, test it with test_map_h.c (RFC)
config: i386-randconfig-a011 (https://download.01.org/0day-ci/archive/20230325/202303250408.OXzqRrBg-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/a43c9ca75a0027cb9ece5c55b2287bb682e55416
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout a43c9ca75a0027cb9ece5c55b2287bb682e55416
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=i386 SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250408.OXzqRrBg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/test_map_h.c:37:14: warning: unused variable 'caten' [-Wunused-variable]
   static char* caten = MAPfn(__stringify, YES, NO, MAYBE);
                ^
   1 warning generated.


vim +/caten +37 lib/test_map_h.c

    21	
    22	#if defined(__i386__)
    23	/* avoid a "__compiletime_assert_" error */
    24	#define BUILD_BUG_STREQ(_var, ref)	 BUILD_BUG_ON(0)
    25	#else
    26	/* test w 2 exprs, for now */
    27	#define BUILD_BUG_STREQ(_var, ref) do {					\
    28		BUILD_BUG_ON(__builtin_memcmp(_var, ref, sizeof(ref)));		\
    29		BUILD_BUG_ON(__builtin_memcmp(_var, ref, __builtin_strlen(ref))); \
    30	} while (0)
    31	#endif
    32	#define BUILD_BUG_STREQ_I(_var, idx, ref) \
    33		BUILD_BUG_STREQ(_var##_slist[idx], ref)
    34	
    35	/* test MAPfn */
    36	static int sum = MAPfn( +, 1, 2, 3);
  > 37	static char* caten = MAPfn(__stringify, YES, NO, MAYBE);
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
