Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7D3644C9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Sep 2026 06:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790577402; cv=none; b=Op4NT4jY6OZ4e1j9hc7CF28xXNUJMMRTIujDy+7IZeaG9KZO4TXXsegKzipFlapJXm0BjP9Ds1/zS58BDxGLVk8FInIhDa0PLiiBBVOLZyq5LwGt3noJvhlI3OEWEJXFm9JUTvCTWuWQuwQzi1wYy1fNT5TTz8yMBODMm0TWI7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790577402; c=relaxed/simple;
	bh=Nz0rdmckJ7vhF75vYgQNS9phnLiCpNrsDrzj0qFRCS0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q2xUhaTFdKn0Qn2po5fQ6VQZuXBXbv/J65FRxwrRHOKPrK8oZQ3+3YaT7V75i8Vpq8jY724EsdCC8iJFsvOLfb299fn7zBUVrNvjDs0DVXT/xCT9p5mE20glwqF6GNpT2rTs6h4y7Xs6E6q4Y956K9qduHAbtc14SuQ4rpIBCRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LQICIP1+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LQICIP1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790577400; x=1822113400;
  h=date:from:to:cc:subject:message-id;
  bh=Nz0rdmckJ7vhF75vYgQNS9phnLiCpNrsDrzj0qFRCS0=;
  b=LQICIP1+gx4gz9YLtguCWuyf/tLTzH9SJL+92D0fU+OmHjHoh/JftbP2
   qRQ8lH+6DWbrS/xoaU9HFW0ccXHjQIyWYCUcu7fZXGXoajRsymz0toY7n
   +Db0FmYzvif9ARWwcypfdFTRd3IyIRMHYW3Q6eUGI+qmLs4tzi5XlZkSe
   d/2wLzkY9cLL1JKk6ZVml310Hc2wM00b+T3H9Jw9ykZshe9/WsTxgYrMB
   KOXA3fUswFJg6nRkEOczKXhbtgTH0EBtg/RLPye2Aid9muiXVDT47H8zA
   /deUkYtZxYCG0tyjOEq8QWZ3ZPl7NxPVh8ByplV3dCeg9c2UN0dBtZjEN
   w==;
X-CSE-ConnectionGUID: u7Wdo2pIQh6I1np50jZrGg==
X-CSE-MsgGUID: bnntFuY/QgCTYp44uEz2Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="116797174"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="116797174"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 23:36:39 -0700
X-CSE-ConnectionGUID: zy4ZOEQFR/mUJ2xth5RpWw==
X-CSE-MsgGUID: YDIK3GhFSLGV5YVmLNeLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="278312060"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2026 23:36:37 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xB4yZ-00000000Ne3-2353;
	Mon, 28 Sep 2026 06:36:35 +0000
Date: Mon, 28 Sep 2026 14:35:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-06 1/1]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning:
 invalid suffix on literal; C++11 requires a space between literal and string
 macro
Message-ID: <202609281448.7YT9cNWu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Valdis,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-06
head:   dd5cd8a9688f75f3461daf5990ad5f41f3404fb1
commit: cc97d7321595fc59db5808563efd851e64b675b7 [1/1] gcc-plugins: fix gcc 11 indigestion with plugins...
config: arm64-randconfig-1003-20260928 (https://download.01.org/0day-ci/archive/20260928/202609281448.7YT9cNWu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260928/202609281448.7YT9cNWu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609281448.7YT9cNWu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/extract-cert.c: In function 'display_openssl_errors':
   scripts/extract-cert.c:46:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      46 |         while ((e = ERR_get_error_line(&file, &line))) {
         |         ^~~~~
   In file included from scripts/extract-cert.c:23:
   /usr/include/openssl/err.h:426:15: note: declared here
     426 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'drain_openssl_errors':
   scripts/extract-cert.c:59:9: warning: 'ERR_get_error_line' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
      59 |         while (ERR_get_error_line(&file, &line)) {}
         |         ^~~~~
   /usr/include/openssl/err.h:426:15: note: declared here
     426 | unsigned long ERR_get_error_line(const char **file, int *line);
         |               ^~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c: In function 'main':
   scripts/extract-cert.c:124:17: warning: 'ENGINE_load_builtin_engines' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     124 |                 ENGINE_load_builtin_engines();
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from scripts/extract-cert.c:24:
   /usr/include/openssl/engine.h:358:28: note: declared here
     358 | OSSL_DEPRECATEDIN_3_0 void ENGINE_load_builtin_engines(void);
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:126:17: warning: 'ENGINE_by_id' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     126 |                 e = ENGINE_by_id("pkcs11");
         |                 ^
   /usr/include/openssl/engine.h:336:31: note: declared here
     336 | OSSL_DEPRECATEDIN_3_0 ENGINE *ENGINE_by_id(const char *id);
         |                               ^~~~~~~~~~~~
   scripts/extract-cert.c:128:17: warning: 'ENGINE_init' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     128 |                 if (ENGINE_init(e))
         |                 ^~
   /usr/include/openssl/engine.h:622:27: note: declared here
     622 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         |                           ^~~~~~~~~~~
   scripts/extract-cert.c:133:25: warning: 'ENGINE_ctrl_cmd_string' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     133 |                         ERR(!ENGINE_ctrl_cmd_string(e, "PIN", key_pass, 0), "Set PKCS#11 PIN");
         |                         ^~~
   /usr/include/openssl/engine.h:479:5: note: declared here
     479 | int ENGINE_ctrl_cmd_string(ENGINE *e, const char *cmd_name, const char *arg,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   scripts/extract-cert.c:134:17: warning: 'ENGINE_ctrl_cmd' is deprecated: Since OpenSSL 3.0 [-Wdeprecated-declarations]
     134 |                 ENGINE_ctrl_cmd(e, "LOAD_CERT_CTRL", 0, &parms, NULL, 1);
         |                 ^~~~~~~~~~~~~~~
   /usr/include/openssl/engine.h:450:27: note: declared here
     450 | OSSL_DEPRECATEDIN_3_0 int ENGINE_ctrl_cmd(ENGINE *e, const char *cmd_name,
         |                           ^~~~~~~~~~~~~~~
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/stackleak_plugin.c:30:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   ../libexec/gcc/aarch64-linux/5.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   ../libexec/gcc/aarch64-linux/5.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   make[2]: *** [scripts/Makefile.build:280: scripts/mod/empty.o] Error 1 shuffle=118727232
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1 shuffle=118727232
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1214: prepare0] Error 2 shuffle=118727232
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2 shuffle=118727232
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
