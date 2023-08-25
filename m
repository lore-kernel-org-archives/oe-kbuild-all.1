Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8095CAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 20:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692997165; x=1724533165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKFiyhkGwBOp/0DmZoUyVxR0FIF9aVt+GIKYOHXs8cc=;
  b=K9yqc6SttsEjbRTUEowgAs6fKZvS7y82LSV3wP3kVlCL7D5rXkDH6A6J
   W4BzKKFZFiOlYupdOH8LKT4yEPWb2fW2sGa0bXOwAlAJzsIrm9hr3bLCe
   xLb759uBU+wEZLlp27Xqz6EqkQIylZ8s7z7J0c9vT0hOC9aYroXS5oXon
   pxZRAN0s7n45MesBwguDgpsheYUSiXX8PESu51hicm2wEJoByuIRCtxLF
   0W2EgIkl0fz5b4kd9kPYcwqtr6IYoW6P3YqaX4coxSpgOyyWCWmOG9P+5
   tiAOlZqTCOEUtzU9thpl6vzcJ/KvDquSTQJAcxgSaeqd8MIU/IuKSy18j
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="461165923"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="461165923"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 13:59:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="803090261"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="803090261"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 25 Aug 2023 13:59:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZdtl-0003zz-2o;
	Fri, 25 Aug 2023 20:59:17 +0000
Date: Sat, 26 Aug 2023 04:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline 4/4]
 kernel/module/gki_module.c:31:6: warning: no previous prototype for
 'gki_is_module_unprotected_symbol'
Message-ID: <202308260420.PE1qXC3Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   d5d494baf2b758b2b19326fa7ae6ccb332c00b33
commit: e9669eeb2f4580e44226cf1b582340f4b6388387 [4/4] ANDROID: GKI: Add module load time symbol protection
config: i386-buildonly-randconfig-001-20230826 (https://download.01.org/0day-ci/archive/20230826/202308260420.PE1qXC3Q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260420.PE1qXC3Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260420.PE1qXC3Q-lkp@intel.com/

All error/warnings (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "devm_usb_get_phy_by_phandle" [drivers/power/supply/isp1704_charger.ko] undefined!
>> ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/isp1704_charger.ko] undefined!
>> ERROR: modpost: "devm_usb_get_phy" [drivers/power/supply/bq256xx_charger.ko] undefined!
--
>> kernel/module/gki_module.c:31:6: warning: no previous prototype for 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      31 | bool gki_is_module_unprotected_symbol(const char *name)
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


vim +/gki_is_module_unprotected_symbol +31 kernel/module/gki_module.c

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
