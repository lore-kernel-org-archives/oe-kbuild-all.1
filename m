Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5573E37F72E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205904; cv=none; b=gmW0qFUMVg13sFwM1RnTyCrJDzJbuESn61tr5EFHFDpA1tkTge7wNMamCYozIHhgZPVZklEq5gzbapLbcuuwqaqCFXEuCiDDtlJq1T2KKOgB7t6h/aKhutOEVtBYgVuBwxtNecrLfwisInUKu6gO9gHJNJNectRtLjbereSoI40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205904; c=relaxed/simple;
	bh=fTH4PVsTZi0P8/+Ed0GOwUPPjrWLF/OQZHrZi+llBgA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u7Xv4kyym26fUkHcBOL3+8sY2vKBetTQJy+WGL0LGAKq+tbxlOQ0FbsWBUIsvgzfwD5ze72oCdfx8+H8I0qabaPpVypIThLbtsrIuZRw6i85Q0v0bkSXvqEaBOdS5Mf7hX6Fjf4xDrXjVX4W+LF0sOjprDparSJZLB+lNR/yxug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CotVe3EM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CotVe3EM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205903; x=1806741903;
  h=date:from:to:cc:subject:message-id;
  bh=fTH4PVsTZi0P8/+Ed0GOwUPPjrWLF/OQZHrZi+llBgA=;
  b=CotVe3EMALokz9IkUEgbB1sIO91CerEejaNoYrZ07DfoNageYlrjx6Xa
   WAEtSWdj9P4qoce+S4bqjwSgK8g1xAp61zID0+kI376b3FWoIL6HQ1U9m
   Q7NN8Cfy19XNJpa1+RZ8a8oH6cpNZvcMo9fV8TX4fJ5Q7Ux4QcYYTk4oC
   NeyS7Ljdb9E0ccuOPpvUkXC9PynwLa0r1XkVMLpJ3H2Pt67ZmOUp8PAjv
   P3aXkro5krRpeWO7qheh4YfcVO5ss4yu0gSSqYk47BYg5Zi1SQQlt82ro
   XdRo7IiNafxk1eD/moGvnSjk6uMH5KzPfi0t5Yc+kRqoGhx8+G/szGoaZ
   A==;
X-CSE-ConnectionGUID: 1oxMKd+rTqa4830bxrGUCw==
X-CSE-MsgGUID: HvNB3jL9TdqMQTxFxJuQ4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86888902"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86888902"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:45:00 -0700
X-CSE-ConnectionGUID: pZgG30GARhm+C5SlHu/CuA==
X-CSE-MsgGUID: Z467MQULS+2O12phZkWljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368669"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:44:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a9A-0000000015P-1I6d;
	Fri, 03 Apr 2026 08:44:56 +0000
Date: Fri, 03 Apr 2026 16:44:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 kernel/gki_module.c:35:6: warning: no previous prototype for function
 'gki_is_module_protected_export'
Message-ID: <202604030630.VlFOh44H-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   3345d7186397130229186427c1c89125d9687c46
commit: eaee7326d38a1c4876c97e06f770c2e7f31604f1 [1/1] ANDROID: GKI: Fix copying of protected_exports
config: arm-randconfig-001-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030630.VlFOh44H-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e3cbd9984a78422c3799629eb6b5f7f7818c1a11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030630.VlFOh44H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030630.VlFOh44H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/gki_module.c:35:6: warning: no previous prototype for function 'gki_is_module_protected_export' [-Wmissing-prototypes]
      35 | bool gki_is_module_protected_export(const char *name)
         |      ^
   kernel/gki_module.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | bool gki_is_module_protected_export(const char *name)
         | ^
         | static 
   kernel/gki_module.c:55:6: warning: no previous prototype for function 'gki_is_module_unprotected_symbol' [-Wmissing-prototypes]
      55 | bool gki_is_module_unprotected_symbol(const char *name)
         |      ^
   kernel/gki_module.c:55:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      55 | bool gki_is_module_unprotected_symbol(const char *name)
         | ^
         | static 
   2 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for HVC_DRIVER
   Depends on [n]: TTY [=n]
   Selected by [y]:
   - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]


vim +/gki_is_module_protected_export +35 kernel/gki_module.c

fd1e768866606f Ramji Jiyani 2022-12-16  29  
fd1e768866606f Ramji Jiyani 2022-12-16  30  /**
fd1e768866606f Ramji Jiyani 2022-12-16  31   * gki_is_module_protected_export - Is a symbol exported from a protected GKI module?
fd1e768866606f Ramji Jiyani 2022-12-16  32   *
fd1e768866606f Ramji Jiyani 2022-12-16  33   * @name:	Symbol being checked against exported symbols from protected GKI modules
fd1e768866606f Ramji Jiyani 2022-12-16  34   */
fd1e768866606f Ramji Jiyani 2022-12-16 @35  bool gki_is_module_protected_export(const char *name)
fd1e768866606f Ramji Jiyani 2022-12-16  36  {
a6eaf3db80788a Ramji Jiyani 2022-12-18  37  	if (NR_UNPROTECTED_SYMBOLS) {
fd1e768866606f Ramji Jiyani 2022-12-16  38  		return bsearch(name, gki_protected_exports_symbols, NR_PROTECTED_EXPORTS_SYMBOLS,
fd1e768866606f Ramji Jiyani 2022-12-16  39  		       MAX_PROTECTED_EXPORTS_NAME_LEN, cmp_name) != NULL;
a6eaf3db80788a Ramji Jiyani 2022-12-18  40  	} else {
a6eaf3db80788a Ramji Jiyani 2022-12-18  41  		/*
a6eaf3db80788a Ramji Jiyani 2022-12-18  42  		 * If there are no symbols in unprotected list; We don't need to
a6eaf3db80788a Ramji Jiyani 2022-12-18  43  		 * protect exports as there is no KMI enforcement.
a6eaf3db80788a Ramji Jiyani 2022-12-18  44  		 * Treat everything exportable in this case.
a6eaf3db80788a Ramji Jiyani 2022-12-18  45  		 */
a6eaf3db80788a Ramji Jiyani 2022-12-18  46  		return false;
a6eaf3db80788a Ramji Jiyani 2022-12-18  47  	}
e7451150cb701d Ramji Jiyani 2022-09-21  48  }
e7451150cb701d Ramji Jiyani 2022-09-21  49  

:::::: The code at line 35 was first introduced by commit
:::::: fd1e768866606ff230280f26faca797bb47bd8c0 ANDROID: GKI: Protect exports of protected GKI modules

:::::: TO: Ramji Jiyani <ramjiyani@google.com>
:::::: CC: Treehugger Robot <treehugger-gerrit@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
