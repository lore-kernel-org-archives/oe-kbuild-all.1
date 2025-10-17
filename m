Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30EE42264A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Oct 2025 15:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760715815; cv=none; b=LDUPXlnc4EIA9MXSgQ1ZUGb1jSqHsAbaczjLH+3S+9XoQR3hZVForo+mtMo2MXa4iARTyoUMuL8Cqq0Y3lhck+FOrnOkKv1DfjCTwL9YkLkx4V8iPNDFvVWKFr06fIe9kFKAJLkVRW7py1c7pbkTBSD3FTjgfXx3y9cA0e281do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760715815; c=relaxed/simple;
	bh=5zA5Dmo8FOiMyDKYdvA9i+X42MyTHtRZrZlg9//mreA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CJZa7eEfX0r2zeCvveryRZTlaZk8kq+9LXzPygJ1teaawkqg7o4sv1uTB4x09xIl65bG6WVEIqecEggDMsG0ZhAv3YjYJ+QRbFOOt8lgK+EVu8MWLWmgMhoqVq2Ww3xh2OgrZQOIDOXso2uiykjX/nQRhgQgUDDLTYfMw0njDqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkJuFe7c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkJuFe7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760715813; x=1792251813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zA5Dmo8FOiMyDKYdvA9i+X42MyTHtRZrZlg9//mreA=;
  b=CkJuFe7cpFvc2SwPl08a4uOc55vWINuJnBdy9b45DIsijoFOTjcFZXgL
   2itrWapqL63BULVF2/eLdE8Oiy06UA7GWe8J9lfQ41p3/d5NXNg9weKYy
   LiSmRLn+DMOSeBW/UTEaTgUVkOJq9lgldtGyJFj5YYkruDYVpenKb2x5Q
   Dg0XkrORWzM+7EDZASqDnqYYvF0Z6sfGWjyUlf6ETjtPfICllExGYM0wq
   kaF06NI611ZNS2svtIyi+uuqO5F4IuMqp3EHvgpWx9rVhNlO4MbisG0Nb
   XKzVB6beiiq/ensG6KiwbOH9YRJ9RYHKQfPXDfEIvZxh3aPlHefCBkVGm
   g==;
X-CSE-ConnectionGUID: N4a6MLfuQ0eP6PgQJBDagQ==
X-CSE-MsgGUID: a6mdgbUeRfWjsEBbJ9KQQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="62832391"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="62832391"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2025 08:43:32 -0700
X-CSE-ConnectionGUID: 738e3qMKTWqCCMCYOPwu+w==
X-CSE-MsgGUID: rxLn6BzjRuapsHkaer9Bkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; 
   d="scan'208";a="181946918"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 Oct 2025 08:43:31 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9mc4-0006sW-34;
	Fri, 17 Oct 2025 15:43:28 +0000
Date: Fri, 17 Oct 2025 23:42:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field
 'call_used' has incomplete type 'pt_solution'
Message-ID: <202510172354.wyDqeDLb-lkp@intel.com>
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
head:   8d2412bb9958a209d2d0344ea1b88dd633699677
commit: f72cad446f70dd9383453a5ef36ada358c589f8f [2818/2818] gcc-plugins: Reorganize gimple includes for GCC 13
config: arm64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20251017/202510172354.wyDqeDLb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251017/202510172354.wyDqeDLb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510172354.wyDqeDLb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/stackleak_plugin.c:30:
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
                    from scripts/gcc-plugins/sancov_plugin.c:22:
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
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/sancov_plugin.so] Error 1 shuffle=1096673560
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
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1 shuffle=1096673560
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/stackleak_plugin.so] Error 1 shuffle=1096673560
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
