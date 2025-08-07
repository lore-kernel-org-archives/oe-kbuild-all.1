Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6042528F3
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 15:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754581132; cv=none; b=GdBJzq0w3spnjkK41k5z/Uf5mk4y93EfjykLDWNUXUPYlJ2LWVM7nD/PDf7xnlvTBpc2WNNbMydTXFbBWk+WoAGYBXWECC/a2K8KRmwZRgf36ZM8+MjiwIoPZybu8NTcYj6g+Ql9ZuIB+4ER/bOouo5uhlWWAsge6oL3s69LOiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754581132; c=relaxed/simple;
	bh=3eRF/wSPltkWtWa0ZXm7VGOHoPxX8UgtMCDP5kRmpE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvHX/eX/UMOXRcF5qmLYSzu75ouqzZZtmzRBQIpHWUM/az2M0aAbybCeNu7xAoRxABBCuRIz98PS6MYc4xIGygVs9XHtKu5BmT0R5ljBZt3ZT6eqMqwscXtzXp/oF/wYhI6nCqlLdNrwIBmxXcabxZImzmxjET1Lt+ixqVmmflQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DLj26mRI; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DLj26mRI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754581130; x=1786117130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3eRF/wSPltkWtWa0ZXm7VGOHoPxX8UgtMCDP5kRmpE8=;
  b=DLj26mRIHo+BExm7g/Ncno+WWwcDV0+/6bApcCvQFYRtYZfg3gIggc/0
   2hvXtK+9w1DxCS3kMedAzozehivyJa35DpIUnUcwAI9pWZ8QHoT6axogW
   X/w11Temzrea3vDODFhsaiBfmpIAdSaSVNzMkXcwTKmUpbmWdlySoAxN8
   p2PID71S5XaSYN8ap/TAIbLCpV/0JNE3cVpQmoPx86u5MXQhYaBgj9Qex
   6cWc/0LOEmedNyvSBRZQlZYn1EHdgZTyYZDPQtME7gAeNEqUjbHlJ9V78
   WKO7fmLv9HINz2l3FgueCUhGpckefipYetA03jjyr7vvYQ6m83rLVSBB8
   A==;
X-CSE-ConnectionGUID: 8xAznEcBQgSHgt84jGsdbA==
X-CSE-MsgGUID: wDYj5HcnR/yHNA2ZkW9bEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57061788"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="57061788"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 08:38:48 -0700
X-CSE-ConnectionGUID: OCgQ/8UWT7GYyDc81fe8pg==
X-CSE-MsgGUID: Ubt3YZ3KTbC8Pdmc0e3MAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165445379"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 07 Aug 2025 08:38:47 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk2hY-0002va-2q;
	Thu, 07 Aug 2025 15:38:44 +0000
Date: Thu, 7 Aug 2025 23:38:06 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field
 'call_used' has incomplete type 'pt_solution'
Message-ID: <202508072352.wESgcLPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kees,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   28f1bd4270a018b383ca1545940ec78c60948458
commit: f72cad446f70dd9383453a5ef36ada358c589f8f [2818/2818] gcc-plugins: Reorganize gimple includes for GCC 13
config: arm64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250807/202508072352.wESgcLPa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508072352.wESgcLPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508072352.wESgcLPa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/stackleak_plugin.c:30:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/sancov_plugin.c:22:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from scripts/gcc-plugins/gcc-common.h:113:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field 'call_used' has incomplete type 'pt_solution'
     283 |   struct pt_solution call_used;
         |                      ^~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:10: note: forward declaration of 'struct pt_solution'
     283 |   struct pt_solution call_used;
         |          ^~~~~~~~~~~
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:284:22: error: field 'call_clobbered' has incomplete type 'pt_solution'
     284 |   struct pt_solution call_clobbered;
         |                      ^~~~~~~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:10: note: forward declaration of 'struct pt_solution'
     283 |   struct pt_solution call_used;
         |          ^~~~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'bool gimple_store_p(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2556:18: error: 'is_gimple_reg' was not declared in this scope; did you mean 'is_gimple_assign'?
    2556 |   return lhs && !is_gimple_reg (lhs);
         |                  ^~~~~~~~~~~~~
         |                  is_gimple_assign
   In file included from scripts/gcc-plugins/gcc-common.h:113:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field 'call_used' has incomplete type 'pt_solution'
     283 |   struct pt_solution call_used;
         |                      ^~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:10: note: forward declaration of 'struct pt_solution'
     283 |   struct pt_solution call_used;
         |          ^~~~~~~~~~~
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:284:22: error: field 'call_clobbered' has incomplete type 'pt_solution'
     284 |   struct pt_solution call_clobbered;
         |                      ^~~~~~~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:10: note: forward declaration of 'struct pt_solution'
     283 |   struct pt_solution call_used;
         |          ^~~~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'bool gimple_store_p(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2556:18: error: 'is_gimple_reg' was not declared in this scope; did you mean 'is_gimple_assign'?
    2556 |   return lhs && !is_gimple_reg (lhs);
         |                  ^~~~~~~~~~~~~
         |                  is_gimple_assign
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'tree_node* gimple_call_fndecl(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2790:10: error: 'gimple_call_addr_fndecl' was not declared in this scope; did you mean 'gimple_call_set_fndecl'?
    2790 |   return gimple_call_addr_fndecl (gimple_call_fn (gs));
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          gimple_call_set_fndecl
   In file included from scripts/gcc-plugins/gcc-common.h:113:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field 'call_used' has incomplete type 'pt_solution'
     283 |   struct pt_solution call_used;
         |                      ^~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:10: note: forward declaration of 'struct pt_solution'
     283 |   struct pt_solution call_used;
         |          ^~~~~~~~~~~
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:284:22: error: field 'call_clobbered' has incomplete type 'pt_solution'
     284 |   struct pt_solution call_clobbered;
         |                      ^~~~~~~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:10: note: forward declaration of 'struct pt_solution'
     283 |   struct pt_solution call_used;
         |          ^~~~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'tree_node* gimple_call_fndecl(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2790:10: error: 'gimple_call_addr_fndecl' was not declared in this scope; did you mean 'gimple_call_set_fndecl'?
    2790 |   return gimple_call_addr_fndecl (gimple_call_fn (gs));
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          gimple_call_set_fndecl
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'bool gimple_store_p(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2556:18: error: 'is_gimple_reg' was not declared in this scope; did you mean 'is_gimple_assign'?
    2556 |   return lhs && !is_gimple_reg (lhs);
         |                  ^~~~~~~~~~~~~
         |                  is_gimple_assign
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/stackleak_plugin.so] Error 1 shuffle=1096673560
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'tree_node* gimple_call_fndecl(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2790:10: error: 'gimple_call_addr_fndecl' was not declared in this scope; did you mean 'gimple_call_set_fndecl'?
    2790 |   return gimple_call_addr_fndecl (gimple_call_fn (gs));
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          gimple_call_set_fndecl
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/sancov_plugin.so] Error 1 shuffle=1096673560
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1 shuffle=1096673560
   make[3]: Target '__build' not remade because of errors.
   make[2]: *** [scripts/Makefile.build:503: scripts/gcc-plugins] Error 2 shuffle=1096673560
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1238: scripts] Error 2 shuffle=1096673560
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:194: __sub-make] Error 2 shuffle=1096673560
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
