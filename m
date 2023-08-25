Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A7CA60
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 14:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692975271; x=1724511271;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qOioBO+aNV5WTbp2xeOmmMm4UJBslbR8VDYI4YxmRMI=;
  b=nwah5LkL7l6q3bxWkKNxvX5Vxlqdyn7n1uPTAl8BfyLmK2hUqqwF4wxb
   SUrrF9dZJHW7aXeVvvr3pW32GSFMkmgF++tt0NYq/jEc8sBe0XlTrMRVA
   OiqNzjQkVa7GHNyunXOpncwDkxqty5+zWFl7F7g6ooz9M73rhDzMf4fu1
   VfyJmQFctrreFF5cpBE6qEk/bo1EUByQ5lBXq0MCEDc0s+fjGEazqYeuB
   UMyIO6BvmK97U3otAmcZ/2E9c2pWKF0DyhEVmuh8zS8ZQq4Fb5KCIpKVw
   koapALqRN3ZIYLbrQrnl3EuQ51RHVmvYj8+7tomMLsfyAv6jz2szYMAOc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="364921712"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="364921712"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 07:54:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="852003601"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="852003601"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2023 07:54:19 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZYCY-0003iD-2n;
	Fri, 25 Aug 2023 14:54:19 +0000
Date: Fri, 25 Aug 2023 22:53:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/2] kernel/gki_module.c:35:6:
 warning: no previous prototype for function 'gki_is_module_protected_export'
Message-ID: <202308252234.KUIaashZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   e8b59bcd783be655164b6032e551cd2a30a5d749
commit: fd1e768866606ff230280f26faca797bb47bd8c0 [1/2] ANDROID: GKI: Protect exports of protected GKI modules
config: x86_64-randconfig-015-20230825 (https://download.01.org/0day-ci/archive/20230825/202308252234.KUIaashZ-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308252234.KUIaashZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308252234.KUIaashZ-lkp@intel.com/

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
