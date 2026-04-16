Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27363815F8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 11:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776339408; cv=none; b=t5rzVnCXdjn1SjrvcN51+kr1aW5UtK45/HMcTyE13hRkXt9xCU40Mu7s9q9aL+BKjW7ZL0ogUUkRgHdlYxvdEiW4VEINWFprWmQNQ9C89B05nUXUSQkUoVSpXuOKH6xaaZtUvoQ/XZuT5Eh70fuPpK2PoH0jAIkTGOoAsK12s3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776339408; c=relaxed/simple;
	bh=ZOXV2hWvQdjNuRAWFY4W87eg+DFoSQhJZWD49Wo1Vr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ejI6iawUU7OeBp+hPJD8WeHjWRtQ44uIfd3L5dc+kjdgHoSOubjusWT6Qv4r0DdIt4IblfVgkfBhkiamB6gmUF580LAni65djG6e3d/32d9y0bXmPoOLn2ZMhbc8hRycXSwCSgKrw8pl6tYLE2mbZRjiW2A2phgFwxQOqcMztQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VHsLXOoF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VHsLXOoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776339407; x=1807875407;
  h=date:from:to:cc:subject:message-id;
  bh=ZOXV2hWvQdjNuRAWFY4W87eg+DFoSQhJZWD49Wo1Vr4=;
  b=VHsLXOoFeHy4qDgC7pWtTMZNjRKYYz9JpLZhd2+/DYBKI6QyyUNPUGod
   qLVvNoB3Ks65Y2+RlMzWp6ODFsRH2yhhRfrhGqVWybDZyMUA8+456IqI9
   MYJbsFRHzS+1RT4P8ptcYKllo7yU3FDRVKNkevbRLJm+5sosxe1gOEwIw
   SPWfn/p7ptNjevt3ilIBNXW0Ithk7d4UcerkRw/yVF0MseW/JXGQXaO1c
   rq7/XXDuiqvvB359fYyH9IVu3hndME/BefwL6wCiiyTMKF23a4NGVXU5e
   sPC80GMP1ub6ad9pSq3fCvF7KQkK6ZfYhGij8LbUkItUlzlqvI3wJjtRB
   w==;
X-CSE-ConnectionGUID: Mm+CQGzOTLm/md1es9xURw==
X-CSE-MsgGUID: QIk2tK79TIuXlVCaQBTNXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="77408088"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="77408088"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2026 04:36:46 -0700
X-CSE-ConnectionGUID: Nptc451vROCURjmU0qrQTw==
X-CSE-MsgGUID: nudGjg9ZQxiDfjrJSABgSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="225994025"
Received: from lkp-server01.sh.intel.com (HELO 7f3b36e5d6a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Apr 2026 04:36:44 -0700
Received: from kbuild by 7f3b36e5d6a5 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDL1W-000000001X4-0NoY;
	Thu, 16 Apr 2026 11:36:42 +0000
Date: Thu, 16 Apr 2026 19:36:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-05 2/2]
 ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning:
 invalid suffix on literal; C++11 requires a space between literal and string
 macro
Message-ID: <202604161932.kGHAoKUn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-05
head:   bf581392daead92533e13fb80d2387c6591c9c12
commit: cc97d7321595fc59db5808563efd851e64b675b7 [2/2] gcc-plugins: fix gcc 11 indigestion with plugins...
config: arm64-randconfig-001-20260416 (https://download.01.org/0day-ci/archive/20260416/202604161932.kGHAoKUn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 5.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604161932.kGHAoKUn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604161932.kGHAoKUn-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
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
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:24,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/gcc-plugin.h:31,
                    from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/plugin.h:23,
                    from scripts/gcc-plugins/gcc-common.h:9,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:102:21: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     102 |    fprintf ((FILE), "%s"HOST_WIDE_INT_PRINT_UNSIGNED"\n",\
         |                     ^
   /usr/include/openssl/engine.h:622:27: note: declared here
     622 | OSSL_DEPRECATEDIN_3_0 int ENGINE_init(ENGINE *e);
         |                           ^~~~~~~~~~~
   ../lib/gcc/aarch64-linux/5.5.0/plugin/include/config/elfos.h:170:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     170 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
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
   In file included from ../lib/gcc/aarch64-linux/5.5.0/plugin/include/tm.h:41:
>> ../lib/gcc/aarch64-linux/5.5.0/plugin/include/defaults.h:126:24: warning: invalid suffix on literal; C++11 requires a space between literal and string macro [-Wliteral-suffix]
     126 |       fprintf ((FILE), ","HOST_WIDE_INT_PRINT_UNSIGNED",%u\n",          \
         |                        ^
   ../libexec/gcc/aarch64-linux/5.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   make[2]: *** [scripts/Makefile.build:280: scripts/mod/empty.o] Error 1 shuffle=102804174
   ../libexec/gcc/aarch64-linux/5.5.0/cc1: error while loading shared libraries: libmpfr.so.4: cannot open shared object file: No such file or directory
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1 shuffle=102804174
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1214: prepare0] Error 2 shuffle=102804174
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2 shuffle=102804174
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
