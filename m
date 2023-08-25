Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B2963E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 01:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692927509; x=1724463509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hJkHRnVLSbh3+V71DgZIxV6bNFJU3oYtsFQSMnoldqY=;
  b=Fg0CIkd3zVDHydo9DxAC5qAJSou9G2iZeoqeLZOt2rKaoG2836Asm+YN
   1lShubZdKgrrSwwgjyv6Orn/P3eeLCfUa2dVGv6xb7SZD9S1S2Kj3N2uC
   QxEWhG3JH5Ou0WcNFEjIY9rS9WKBl2CTCcCzfipnkr38OVFKOzcQD+hUK
   27ox87HJnNCIqmQligxyIA9iqLZySlB7vYSziUPEr84U+XF+0EPAm1th7
   cL+viAuZHAXNQRRcHDEziosiG6X4JhgU+t1u/aPk5xHxxQMVWDAQAjgZ9
   wYIAInt9PRGhw2bxbIX9KjcJDCqB9ZGl/hbLSEq5fBjh+3sNfQDQBY15Y
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438548814"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="438548814"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 18:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827406130"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827406130"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2023 18:38:26 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZLmF-00037C-0j;
	Fri, 25 Aug 2023 01:38:21 +0000
Date: Fri, 25 Aug 2023 09:37:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 7/7] kernel/gki_module.c:31:6:
 warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202308250912.kqKQ2ivk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   95e03075771681993b5c7881bf2e3815c20ab6a9
commit: e7451150cb701de01d6b836c496e1bd012d885cd [7/7] ANDROID: GKI: Add module load time symbol protection
config: x86_64-randconfig-015-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250912.kqKQ2ivk-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250912.kqKQ2ivk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250912.kqKQ2ivk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:31:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
   bool gki_is_module_unprotected_symbol(const char *name)
        ^
   kernel/gki_module.c:31:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gki_is_module_unprotected_symbol(const char *name)
   ^
   static 
   1 warning generated.


vim +/gki_is_module_unprotected_symbol +31 kernel/gki_module.c

    25	
    26	/**
    27	 * gki_is_module_unprotected_symbol - Is a symbol unprotected for unsigned module?
    28	 *
    29	 * @name:	Symbol being checked in list of unprotected symbols
    30	 */
  > 31	bool gki_is_module_unprotected_symbol(const char *name)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
