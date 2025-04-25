Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4107A235355
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745572981; cv=none; b=CH/bIOTOeqZ6QTAuOfiD9lNLwx0nbCS6RlLuU/wQbv8DekGptfEyqPQgObzCV8zl0se8XFgRuOa6Oc7iFDdU9WUskquB9YIp4XKZ1GeizN/RfjB9zRIcA+BLse/Jm4uudJiQ+gGTOEZNHsrjjIYrzwS0/tahnfWdKraB5L3gw7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745572981; c=relaxed/simple;
	bh=Hs3tuBTTXIjuV8wy5Fm9ThaFB6GwrDKyi2mMF9nm5hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EGuNdfGGf48YMJdHJoupX0ELc2thZ9UW5UcYCXSLm06pJ0FXg+gCyj6xIijjAJEOlY4H2KxhII89eIiTqPU3GX341VUHvMWIgvPw7AytyUdQHowrL2c7KEw+Wd05p9vhgSehb018I3d41lRQV/onVj0uROCJjnV/xyYwdsPcU/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FnOQj4UD; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FnOQj4UD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745572978; x=1777108978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hs3tuBTTXIjuV8wy5Fm9ThaFB6GwrDKyi2mMF9nm5hg=;
  b=FnOQj4UDg/6m/p7mr5ZNnAf04ROhevGMx4UZNb4WsL9ztJuNgcCwyROo
   7UbdyZJc5e8EVKrZKxNUY1GPblGRwu3sUjUVQQDnuLzmlUcDyOECihSd7
   9eQAwyrFZM8kEiUZQ9ndPNlzM+UrQg4XoSk1XyPOuHIVGtIdI3s9gHX/7
   JkIAYtQjcVEUpnpnze+PdhcgSCpWS+JpKnyc2I2puW64KAVCl0fNsSoiV
   Yeo9D+83yxMxXzC9aNQpTovqPZinXuRNUvrKZTa4fUuEVFt08Lz1f9aea
   BhRkgZi1Bx9CB9isLbJFXfJGn8BBe6JqF1eap7BQNXb++00VBRCzXPmYM
   g==;
X-CSE-ConnectionGUID: vQnTf5ZwSFi6KNiU3CYtBg==
X-CSE-MsgGUID: NMFRy/RTR6+8Ds3oSgddEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="51051826"
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="51051826"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2025 02:22:56 -0700
X-CSE-ConnectionGUID: NjnrwR5BSV24r7K1+cpMcQ==
X-CSE-MsgGUID: m8Cs97RuRIGzmkrCfgAXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,238,1739865600"; 
   d="scan'208";a="163923067"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 25 Apr 2025 02:22:55 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8FGm-00051T-2n;
	Fri, 25 Apr 2025 09:22:52 +0000
Date: Fri, 25 Apr 2025 17:22:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2818/2818]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gimple.h:283:22: error: field
 'call_used' has incomplete type 'pt_solution'
Message-ID: <202504251722.CMsFVxeH-lkp@intel.com>
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
head:   03a5184e2945a83bea4d2913f7163d6b50d38bac
commit: f72cad446f70dd9383453a5ef36ada358c589f8f [2818/2818] gcc-plugins: Reorganize gimple includes for GCC 13
config: arm64-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250425/202504251722.CMsFVxeH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504251722.CMsFVxeH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504251722.CMsFVxeH-lkp@intel.com/

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
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/sancov_plugin.so] Error 1 shuffle=1096673560
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/stackleak_plugin.so] Error 1 shuffle=1096673560
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
