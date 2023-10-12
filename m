Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851663F4AC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 21:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j4Yv/aVD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697147828; x=1728683828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ic9+Eoh/p4iEIKvzHDjg0OCJ69JDVRo7fwdDb9vxBeY=;
  b=j4Yv/aVDzrnBulS2ErXwo1jR15o0ZvGR0mThZa/CkF1esxPrIIaFgqPe
   gvr7SHPh7PRtp5JL64CeaSxulV3iPtS9xgt9gMcesKotoGT8dczA9lE0J
   v/NL/3zU71Ub4SK1tN0x5qew6NvA6Sp7eK5pvLIpZ9PpwO3+mWt5zoNUj
   2Ia5Jlvmuu3IqLujH52U8ZlHNhPvqKCpGPvisbuCkVnpiQnr6EfJVykiS
   uVjVDZ95SArD4ipofzwATJ8OLy17KGtPjIWPCN+DetLbN4WTzm0hysWXW
   BGbbc4B+3WSV+eqr4nkBPrqFMCtfCEknV+rwOjb8RbdA5MY5J1sPOpVBR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375401356"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="375401356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 14:56:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="704352222"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="704352222"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 12 Oct 2023 14:56:52 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qr3fm-0003vU-1b;
	Thu, 12 Oct 2023 21:56:50 +0000
Date: Fri, 13 Oct 2023 05:56:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/gki_module.c:35:6:
 warning: no previous prototype for function 'gki_is_module_protected_export'
Message-ID: <202310130534.6FrlOZ6n-lkp@intel.com>
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
commit: fd1e768866606ff230280f26faca797bb47bd8c0 [1/2] ANDROID: GKI: Protect exports of protected GKI modules
config: x86_64-randconfig-015-20230825 (https://download.01.org/0day-ci/archive/20231013/202310130534.6FrlOZ6n-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310130534.6FrlOZ6n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130534.6FrlOZ6n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:35:6: warning: no previous prototype for function 'gki_is_module_protected_export' [-Wmissing-prototypes]
   bool gki_is_module_protected_export(const char *name)
        ^
   kernel/gki_module.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gki_is_module_protected_export(const char *name)
   ^
   static 
   kernel/gki_module.c:46:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
   bool gki_is_module_unprotected_symbol(const char *name)
        ^
   kernel/gki_module.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   bool gki_is_module_unprotected_symbol(const char *name)
   ^
   static 
   2 warnings generated.


vim +/gki_is_module_protected_export +35 kernel/gki_module.c

    29	
    30	/**
    31	 * gki_is_module_protected_export - Is a symbol exported from a protected GKI module?
    32	 *
    33	 * @name:	Symbol being checked against exported symbols from protected GKI modules
    34	 */
  > 35	bool gki_is_module_protected_export(const char *name)
    36	{
    37		return bsearch(name, gki_protected_exports_symbols, NR_PROTECTED_EXPORTS_SYMBOLS,
    38			       MAX_PROTECTED_EXPORTS_NAME_LEN, cmp_name) != NULL;
    39	}
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
