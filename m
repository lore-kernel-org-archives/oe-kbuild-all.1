Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68740283FD8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 11:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748433423; cv=none; b=h5p+EMtXHlXTwuxncErCpurPEgiVK7KhjgsT6Ly1Gch3nQPXsizKmhIYj7jcrFL73C/xKxw0SZDo4Ok/1v5suJB1lJjj3xPJHCAUJkX/iUOL/5WgVtT7j4tU+DXRcPK96O1wxjyQwcrMB9EQ1eOGLnFL9MxFW/zPfTgx1X/1NFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748433423; c=relaxed/simple;
	bh=kze7PqNxqyeEFeyPKHfFqjm0TZE/rWvmQabBnSrxldE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uFyCWCFC2jm9sUnDPpeM9o8gAXHs1jDvdFKfgchj051PWOoXpEXl5FEp1FUweI7p0LhTSnC6U7fz0N4a6w+8vxhBayzKJnJNMy0Y/zZVQMfpHBw2k5IcKlwT4zKanfdQa8u501wZdhjOHbKsbaxXn+YCtxquzUtEwvLMAQ+mNuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7M2ATWn; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7M2ATWn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748433422; x=1779969422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kze7PqNxqyeEFeyPKHfFqjm0TZE/rWvmQabBnSrxldE=;
  b=E7M2ATWnQNL09Nb58TMlVruqC6hEp2i+eCIgNuu1oog7DNKk2oAMfv/x
   jftV5mdsQG2HttXo/Isvjx85GkwdcBXkx6gB34Gyik5gtDLO6d2WTrF0C
   QGX2L8/KdnhFNUBuREYYyO+I2u0WQldNy9yGXvANNlyi/Cy/N9UpKF05P
   NvNVdgxsCy3j8IL+Z9faowINKGYzJV92EUgm9zlO495DixG9K2A3o6rfU
   9VlJ9sjTzNMjPiHOQLXG3+nOp2OJhzzPJTCVnQt6bSZGU2avDijrLvR2C
   WeG+y21q4CtOXW2Q8sniGentBC21gvRxBxV1bg8x9eH/fMb6aksFfFaE7
   Q==;
X-CSE-ConnectionGUID: 2gZz4/eSTqeUe4L31xEcDw==
X-CSE-MsgGUID: KkHLsq6SQrGbE7/dYTLQfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61803641"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="61803641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 04:57:01 -0700
X-CSE-ConnectionGUID: h5qP67ydQay1kMWrM31+gw==
X-CSE-MsgGUID: ot0z6ICVQDOebMQlNNH5fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="143861056"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 May 2025 04:57:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKFOz-000VdU-0H;
	Wed, 28 May 2025 11:56:57 +0000
Date: Wed, 28 May 2025 19:56:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field
 'call_used' has incomplete type 'pt_solution'
Message-ID: <202505281944.fdZnA0qa-lkp@intel.com>
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
head:   d03fdb99fa55811842f0129f5228be8e8213494f
commit: f72cad446f70dd9383453a5ef36ada358c589f8f [2818/2818] gcc-plugins: Reorganize gimple includes for GCC 13
config: arm64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250528/202505281944.fdZnA0qa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505281944.fdZnA0qa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505281944.fdZnA0qa-lkp@intel.com/

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
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'tree_node* gimple_call_fndecl(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2790:10: error: 'gimple_call_addr_fndecl' was not declared in this scope; did you mean 'gimple_call_set_fndecl'?
    2790 |   return gimple_call_addr_fndecl (gimple_call_fn (gs));
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          gimple_call_set_fndecl
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
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h: In function 'tree_node* gimple_call_fndecl(const_gimple)':
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:2790:10: error: 'gimple_call_addr_fndecl' was not declared in this scope; did you mean 'gimple_call_set_fndecl'?
    2790 |   return gimple_call_addr_fndecl (gimple_call_fn (gs));
         |          ^~~~~~~~~~~~~~~~~~~~~~~
         |          gimple_call_set_fndecl
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/stackleak_plugin.so] Error 1 shuffle=1096673560
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/sancov_plugin.so] Error 1 shuffle=1096673560
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1 shuffle=1096673560
   make[3]: Target '__build' not remade because of errors.
   make[2]: *** [scripts/Makefile.build:503: scripts/gcc-plugins] Error 2 shuffle=1096673560
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1235: scripts] Error 2 shuffle=1096673560
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:194: __sub-make] Error 2 shuffle=1096673560
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
