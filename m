Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE481234973
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Oct 2025 17:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761413679; cv=none; b=DROvWZY+RgUFvW9APQPuNCzTDE7GoXG8+h8erzZqixlHpux1E4CsbzeWUI7HNqaKA/bKnj+irtWwLbUGbfMeYcUFHuQLARMggpZArFO4PnKF0kTlMCVTnzusVxcS/GXoAZ+LrkcVIKoSW+cybwAOjbMpAlbo4ewZnXLyaoJeHtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761413679; c=relaxed/simple;
	bh=5xs9AUTUEN0TJVyTa/8Yi57TIockJBY/vCq7Lhrr2Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l+3S5fyQKM36TJBeclCQbsUFLW1xXuw2x2AcjQ08VNqKRe/0m0ivpNtuUuEFbQYTRrjQ83dtaViq+rqeRBVTBwOHlCEUy+CiBa+CtjAsbPEFWgqQE59XJrYsmqGafFTIkxbGtdCZKzOEwDOwLIAYxCoAiSklQPUx/N9X8W4jzhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A+FLU9By; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A+FLU9By"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761413677; x=1792949677;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5xs9AUTUEN0TJVyTa/8Yi57TIockJBY/vCq7Lhrr2Mg=;
  b=A+FLU9By0LSoJgkA/fXGPtf3sFw+/Z9QKW88ayKTfhkNrHbr1kBfvY7l
   xXg28N7j8yn78tzlgD11yQWzSVAvEvek9a0HKBzitTO/hXbAdl688ayYC
   volS1aD6434YhAE+hWBhSloWqTaU6tDD4qwDMOGaiR9sVhOfBbIkRtUSq
   o4H/B1ontESkFpHvzkiTrnVaiIb4TQeB4XzdOaAcO/mEg71NZ9MD5LCKh
   ytaBR05W7cZWjntkWUr0wln3xa1GtBRddWEFXLL3Ai+7AbYDZxvllAZnE
   AdFtrxlwVN1yVCi538KB+CvIHM0r9WaIKuKyVMhrnOBMpgPdkl2+K0Hfm
   g==;
X-CSE-ConnectionGUID: /cmXV9rOQiyjgp4PTEc3YA==
X-CSE-MsgGUID: 7ZsflRzxTdCpI6Mw+ZxOSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63465872"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="63465872"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 10:34:37 -0700
X-CSE-ConnectionGUID: B4B5xOHpQPeqXPqWpXCAnQ==
X-CSE-MsgGUID: L2ehcYtMSXi87Z916WqzCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184287570"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 25 Oct 2025 10:34:36 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCi93-000FTr-2b;
	Sat, 25 Oct 2025 17:33:46 +0000
Date: Sun, 26 Oct 2025 01:29:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field
 'call_used' has incomplete type 'pt_solution'
Message-ID: <202510260121.5zFoZ4F6-lkp@intel.com>
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
head:   ca1036e548e57768ca272bbd5f5cbde3b153f803
commit: f72cad446f70dd9383453a5ef36ada358c589f8f [2818/2818] gcc-plugins: Reorganize gimple includes for GCC 13
config: arm64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20251026/202510260121.5zFoZ4F6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260121.5zFoZ4F6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510260121.5zFoZ4F6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/sancov_plugin.c:22:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
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
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
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
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/stackleak_plugin.so] Error 1 shuffle=1096673560
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
