Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6F428E16
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJ5HL8aQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697140117; x=1728676117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N3v2/IxosKtn5bUyP8/AFV1hk0ktS/3+Q0RXfQwt/bg=;
  b=gJ5HL8aQZt/1xmGZy1FNzK3quWeMP7Cl5y3+9HKa2yVh9PmLc276zLbS
   FCrFvw6Ub+Ws9cNpDFgK+C8vX4SWLSwtHeclIzichPonJ7/8OgjsE423N
   F8f4Q+ruBZHPAZDrc5v2h9caFP6scMwb/EtrR9aWxa8LjIDG64hqQ6G46
   OISsICd0yoja6eaATjpWPUJthLcxlGbLfP7O/Ok/ltXbAdgA1DLeGTBuJ
   foAC0l33M/iZ7ubVOYqPfCqcfHbjLvbenSx/QePlR2OS+k+CFz5I2f9XZ
   xEcHgEIRzC6iJ0cGlTHdgubX/XTMLaVcxxlddLiuDj4ok+k3Cx2Xh0eQD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="370096742"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="370096742"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 12:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="731053463"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="731053463"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Oct 2023 12:48:36 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr1fd-0003o5-3A;
	Thu, 12 Oct 2023 19:48:33 +0000
Date: Fri, 13 Oct 2023 03:48:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 7/7] kernel/gki_module.c:31:6:
 warning: no previous prototype for function
 'gki_is_module_unprotected_symbol'
Message-ID: <202310130322.XHmbjiCN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   e2dadb5022c01186d167de5f89f821506f6a8cb6
commit: e7451150cb701de01d6b836c496e1bd012d885cd [7/7] ANDROID: GKI: Add module load time symbol protection
config: x86_64-randconfig-015-20230825 (https://download.01.org/0day-ci/archive/20231013/202310130322.XHmbjiCN-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130322.XHmbjiCN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130322.XHmbjiCN-lkp@intel.com/

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
