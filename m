Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0773148D9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 21:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787348955; cv=none; b=a+WRfe8K9mw1uedDjGpTxp8E7o7tr1zryYi4Y35MWeN/6CzpBLNWTmj4CVCaERAuJhFZ0rrpUia7PrCKLbn5OAmlRTW1Rsc1JqOM7SSKy2dUjDjTVouQ92M6ljnuP0iEEeNUcVFBC61xEA6gr/CXRA6fx5l48bk536hsG0PXn0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787348955; c=relaxed/simple;
	bh=MYin0fXhZWpW9Qo8oiJB9bR6g6FPElAX45fdB7z6xdk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PBTUo/ZPT1/AeHYe6YgokeTSF1RgDnAJYqYGGJ4eSTo/m4cTd8tzobPvbNe6IDc9Le7uQTyNKYoa1kJHb+4CYt3Jb6G2WItyYapSTCzxy7w0jdN5ZUnWCCflC63VNcxw2EdjZ+geSJxuLIfz20ZMwFVHQxAwoMwA16JPkh5Jr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCcnBNUE; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCcnBNUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787348953; x=1818884953;
  h=date:from:to:cc:subject:message-id;
  bh=MYin0fXhZWpW9Qo8oiJB9bR6g6FPElAX45fdB7z6xdk=;
  b=hCcnBNUETSiKSyRCuLtQX8vFsJcgrx8vcrDQby8i+DH7DmR826ALn2IM
   2W6wmgLQhDjh8pQrcpxo7IzODnkrD17nCaM+a7Dt69VWG5BMvZ5e9EYmA
   53AVo8gECqUCQ3hnkrz79dM3aywVWzaYkgJ/XTzl8qqc1RDBXI9W7ZrUv
   4tgw7Na4W2ZVMh9D6Spm2QUw3ID5QAtPV77BKxsKPkfgA/jUwjvwlG9pJ
   Lkw8sdg2ZJyPbjA0braai/eHz/gN91K9SgG2N0NFhV7INUDqpy/ckViK6
   AenByKHMiYmYk/ljLabro/UGuIg2sWElDCs+2xNIS42VtpsFfKbd5A2Lb
   A==;
X-CSE-ConnectionGUID: O2HCRD5fQr25JeZsLXTNLA==
X-CSE-MsgGUID: 7xhu/Z17Sx6kSQKE6se6Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="113441183"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="113441183"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 14:49:12 -0700
X-CSE-ConnectionGUID: iTsnxP8jS3KsTlVgqLB8aA==
X-CSE-MsgGUID: /eZ5K5nDTAemJNIA5JJTMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="264685470"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2026 14:49:11 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxX6q-00000000qVL-44Rl;
	Fri, 21 Aug 2026 21:49:08 +0000
Date: Sat, 22 Aug 2026 05:48:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 226/226]
 kernel/module/gki_module.c:35:6: warning: no previous prototype for
 'gki_is_module_protected_export'
Message-ID: <202608220526.oKFF1dyv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ramji,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d89a71b35286ef21319e2aeff62c77f2f7244cb7
commit: 552a021d7dfdf4a12c3d2553b4da8919a2a29f3f [226/226] ANDROID: GKI: Protect exports of protected GKI modules
config: arm64-randconfig-004-20260822 (https://download.01.org/0day-ci/archive/20260822/202608220526.oKFF1dyv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220526.oKFF1dyv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220526.oKFF1dyv-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for DEBUG_MAPLE_TREE
   Depends on [n]: DEBUG_KERNEL [=n]
   Selected by [m]:
   - TEST_MAPLE_TREE [=m] && RUNTIME_TESTING_MENU [=y]
   WARNING: unmet direct dependencies detected for VIDEO_V4L2_SUBDEV_API
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=n] && MEDIA_CONTROLLER [=y]
   Selected by [y]:
   - GKI_HIDDEN_MEDIA_CONFIGS [=y]


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
