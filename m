Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 705C8198AA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 23:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693006454; x=1724542454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iV9SW43WoN+lUHnCVydDy7CQLPixQ9DwVlQaUdtktnw=;
  b=Nw3q2HjQZsmpmwbL44b8F8tfq39daBGlE8PeKgk7TKzdRK8xQMYdavhJ
   J7/1+B6xhv7cMB8aFMpExq1XpKLeo2tDWA8Sfm8oAzsQ6KE4lYYJA4cxr
   VKNc0I3jGy1IU4as5EAOV9bWEFuB2NH4Y5qplGNTYwFh3vc0qt4mlA0gX
   IuuTIR7WNKLz09Z5qkzJEpILJ3Lh9ekAcqmD26HtyyZw/z6OqIHAR3nB0
   Qzq9KSQiwI/1f9lP23z5EA4wtnYCboFhzF9aBAuAnDtd/NERCmjf7ypdU
   PBX7c0K3RUZy3/XGbWhxzMjawPRo4iFRBsV4vwV3AwCCDGpNUdcPJWg0G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="359820292"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="359820292"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 16:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="803116401"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="803116401"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2023 16:34:12 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZgJf-00047l-38;
	Fri, 25 Aug 2023 23:34:11 +0000
Date: Sat, 26 Aug 2023 07:34:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/4] kernel/module/gki_module.c:35:6:
 warning: no previous prototype for 'gki_is_module_protected_export'
Message-ID: <202308260741.szJXfDDN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   20d8a8975810973603095dad03fd0c1a9eb06848
commit: 552a021d7dfdf4a12c3d2553b4da8919a2a29f3f [1/4] ANDROID: GKI: Protect exports of protected GKI modules
config: i386-buildonly-randconfig-001-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260741.szJXfDDN-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260741.szJXfDDN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260741.szJXfDDN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/gki_module.c:35:6: warning: no previous prototype for 'gki_is_module_protected_export' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_export(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module/gki_module.c:46:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      46 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=y] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]


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
