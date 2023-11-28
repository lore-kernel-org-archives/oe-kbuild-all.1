Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1131841
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Nov 2023 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hkE2S/Tf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701134193; x=1732670193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPDibDiH1QY1nnTg42tWsHMgebOzD5oREpOtqTLmfKY=;
  b=hkE2S/TfvCrkhAdnHvAoJH/zE9QW4jtQJqoCSoIwTGNBsbjkgAl3963N
   qsK9RJos1zbwBTPlJwuru+F1NwIy5+xsH/vtUKMWAxvF1Z4MTNE6d4QD/
   9Bw+Ib9R5WTrXkKeaC2eKau5nISE+YzNqzpiVVafaZx3n6F/kwpgyRd/9
   JQrwY633UV6zEd488zKRO3SuXYjlrD0OViLIYrFmuH5njVpBvHsUIKkJM
   xPU2pPKWjX/m0+eYJoJYDAFgaFSPwZv88u1kuHPyKWpU7ONMyrlyF8X4Y
   WTIVFm1e6mBK4SfWkT2pi4j9JpzykKm7FCfXon8z5zptUjIxPb910gAda
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="377856432"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="377856432"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 17:16:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="838901758"
X-IronPort-AV: E=Sophos;i="6.04,232,1695711600"; 
   d="scan'208";a="838901758"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 27 Nov 2023 17:16:29 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7miB-0006qg-26;
	Tue, 28 Nov 2023 01:16:27 +0000
Date: Tue, 28 Nov 2023 09:15:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/4] kernel/module/gki_module.c:35:6:
 warning: no previous prototype for function 'gki_is_module_protected_export'
Message-ID: <202311280744.NTyFzBOq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3ee517981de1c1915509c811d3cb583c930f8dff
commit: 552a021d7dfdf4a12c3d2553b4da8919a2a29f3f [1/4] ANDROID: GKI: Protect exports of protected GKI modules
config: arm-randconfig-003-20231128 (https://download.01.org/0day-ci/archive/20231128/202311280744.NTyFzBOq-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231128/202311280744.NTyFzBOq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311280744.NTyFzBOq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:35:6: warning: no previous prototype for function 'gki_is_module_protected_export' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_export(const char *name)
         |      ^
   kernel/module/gki_module.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | bool gki_is_module_protected_export(const char *name)
         | ^
         | static 
   kernel/module/gki_module.c:46:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/module/gki_module.c:46:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]


vim +/gki_is_module_protected_export +35 kernel/module/gki_module.c

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
