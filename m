Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4DD1FCA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Mar 2023 07:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679383524; x=1710919524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zvA07OdicsNACTbtOlYllIV1MOZxrdiOl+j45QGLIaU=;
  b=XWi2naDjoNNrs4bR1Sddo+nIU2Xq+qVkNUuwRaHv7InpSmEfVli2Ix/w
   H9TuxYtmX85pW/5Km+SXooU+nVOfoKw88q2OFS3HjOKQa0i9zWfnYHRgS
   yL+3GQpUPtxmhWGQ6GCS01CvEGpaG4STA3+J/dY9s4PLcnDspbEP61sjH
   qzzMPXuojUG7c0yaUES4TzQJ921F8SOBtjhlZ6JOegUpFLq295B3H27v4
   sNhC/cBYPGzoFkVFHDPhXkFSda/I/1EspxzY9Q8oXzzA1lOnOou258yPO
   e/HWV0V5UrOcrAvT9TpgMAwANgVcsflPDRrAaVhl6uNcYAwCf9DKAoYHK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="341227738"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="341227738"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 00:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10655"; a="1010827578"
X-IronPort-AV: E=Sophos;i="5.98,278,1673942400"; 
   d="scan'208";a="1010827578"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Mar 2023 00:25:18 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peWMv-000BiU-30;
	Tue, 21 Mar 2023 07:25:17 +0000
Date: Tue, 21 Mar 2023 15:24:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:maph 1/1] lib/test_map_h.c:25:39: error: expected ',' or ')',
 found "("
Message-ID: <202303211534.FXXTYfTR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git maph
head:   d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
commit: d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593 [1/1] include/linux/map.h: add new header, test it with test_map_h.c (RFC)
config: alpha-randconfig-r011-20230319 (https://download.01.org/0day-ci/archive/20230321/202303211534.FXXTYfTR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/jimc/linux/commit/d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc maph
        git checkout d23ecc1b5bd07a90e9bea919ecf2c1b8e5182593
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash lib/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303211534.FXXTYfTR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/test_map_h.c:25:39: error: expected ',' or ')', found "("
      25 |   #define BUILD_BUG_STREQ(BUILD_BUG_ON(0))
         |                                       ^
   lib/test_map_h.c: In function 'MAPH_BUILD_BUG':
>> lib/test_map_h.c:37:9: error: implicit declaration of function 'BUILD_BUG_STREQ'; did you mean 'BUILD_BUG_ON'? [-Werror=implicit-function-declaration]
      37 |         BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
         |         ^~~~~~~~~~~~~~~
         |         BUILD_BUG_ON
>> lib/test_map_h.c:37:25: error: 'debug_cats' undeclared (first use in this function)
      37 |         BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
         |                         ^~~~~~~~~~
   lib/test_map_h.c:37:25: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +25 lib/test_map_h.c

    22	
    23	/* ARCH=i386 has compile-time errs from this otherwize */
    24	#if !defined(__i386__)
  > 25	  #define BUILD_BUG_STREQ(BUILD_BUG_ON(0))
    26	#else
    27	/* test 2 ways, for now */
    28	#define BUILD_BUG_STREQ(_var, idx, ref) do {				\
    29			BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, sizeof(ref))); \
    30			BUILD_BUG_ON(__builtin_memcmp(_var##_slist[idx], ref, __builtin_strlen(ref))); \
    31		} while (0)
    32	#endif
    33	
    34	/* force compile, though its not called */
    35	static void __used MAPH_BUILD_BUG(void)
    36	{
  > 37		BUILD_BUG_STREQ(debug_cats, 0, "DRMx_CORE");
    38		BUILD_BUG_STREQ(debug_cats, 1, "DRMx_DRIVER");
    39		BUILD_BUG_STREQ(debug_cats, 2, "DRMx_KMS");
    40	#ifdef FORCE_FAIL
    41		/* properly breaks compile */
    42		BUILD_BUG_STREQ(debug_cats, 1, "'not-in-map'");
    43	#endif
    44	}
    45	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
