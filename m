Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E20F746B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692690086; x=1724226086;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5tXjqrADKxzZ3UQ4isKKazwcNxKZB7yfmdAdSfSvN0=;
  b=UlzQ53HSWDWC+pK+1as6TpoLpGh3J8sqdytArUdCWyZGWkeLax+ODO78
   XQ+wxebb5MriJtnEasS+4AetPDYMB6WkFJFzSIyS0onsiU09I93JmxPfi
   kMboQeAQiu0Upqr4nKfGEVn0OerS1LXU8mWFKw/rfumWpDgQBc9YOZZrM
   oDJRzok1KztkEUJaSQU3+gyYW26dlbsZPZzdoagt2JJDd98NNSOTlF8M7
   ak93/fVY+exuHpv+UU5xL6fWMmHv61h8s3dUWBKgcjAgtEMveR7vtWMaX
   IOSHgHbpdWNyvz80dwDjLH5ffirrPIvzLs+VeBkQygG8x8KuA3vnq/A2h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437724550"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="437724550"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 00:40:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850510538"
X-IronPort-AV: E=Sophos;i="6.01,192,1684825200"; 
   d="scan'208";a="850510538"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 00:40:54 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYM0T-0001Wl-31;
	Tue, 22 Aug 2023 07:40:53 +0000
Date: Tue, 22 Aug 2023 15:39:55 +0800
From: kernel test robot <lkp@intel.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <keescook@chromium.org>
Subject: [stable:linux-5.10.y 53/9999]
 ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/c-family/c-common.h:173:10:
 fatal error: cp/cp-trait.def: No such file or directory
Message-ID: <202308221505.E6TdfHeU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-5.10.y
head:   da742ebfa00c3add4a358dd79ec92161c07e1435
commit: 1eee36a5520b5a89fb4d0d6af6f9cb0217a3164f [53/9999] gcc-plugins: simplify GCC plugin-dev capability test
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230822/202308221505.E6TdfHeU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308221505.E6TdfHeU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308221505.E6TdfHeU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/include/c++/12/initializer_list:36,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/system.h:242,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/gcc-plugin.h:28,
                    from scripts/gcc-plugins/gcc-common.h:7,
                    from scripts/gcc-plugins/latent_entropy_plugin.c:78:
   /usr/include/c++/12/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
      32 | #error This file requires compiler and library support \
         |  ^~~~~
   In file included from /usr/include/c++/12/initializer_list:36,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/system.h:242,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/gcc-plugin.h:28,
                    from scripts/gcc-plugins/gcc-common.h:7,
                    from scripts/gcc-plugins/structleak_plugin.c:32:
   /usr/include/c++/12/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
      32 | #error This file requires compiler and library support \
         |  ^~~~~
   In file included from /usr/include/c++/12/initializer_list:36,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/system.h:242,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/gcc-plugin.h:28,
                    from scripts/gcc-plugins/gcc-common.h:7,
                    from scripts/gcc-plugins/arm_ssp_per_task_plugin.c:3:
   /usr/include/c++/12/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
      32 | #error This file requires compiler and library support \
         |  ^~~~~
   In file included from /usr/include/c++/12/initializer_list:36,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/system.h:242,
                    from ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/gcc-plugin.h:28,
                    from scripts/gcc-plugins/gcc-common.h:7,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
   /usr/include/c++/12/bits/c++0x_warning.h:32:2: error: #error This file requires compiler and library support for the ISO C++ 2011 standard. This support must be enabled with the -std=c++11 or -std=gnu++11 compiler options.
      32 | #error This file requires compiler and library support \
         |  ^~~~~
   In file included from scripts/gcc-plugins/gcc-common.h:76:
>> ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/c-family/c-common.h:173:10: fatal error: cp/cp-trait.def: No such file or directory
     173 | #include "cp/cp-trait.def"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/latent_entropy_plugin.so] Error 1
   In file included from scripts/gcc-plugins/gcc-common.h:76:
>> ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/c-family/c-common.h:173:10: fatal error: cp/cp-trait.def: No such file or directory
     173 | #include "cp/cp-trait.def"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/structleak_plugin.so] Error 1
   In file included from scripts/gcc-plugins/gcc-common.h:76:
>> ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/c-family/c-common.h:173:10: fatal error: cp/cp-trait.def: No such file or directory
     173 | #include "cp/cp-trait.def"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/arm_ssp_per_task_plugin.so] Error 1
   In file included from scripts/gcc-plugins/gcc-common.h:76:
>> ../lib/gcc/arm-linux-gnueabi/13.2.0/plugin/include/c-family/c-common.h:173:10: fatal error: cp/cp-trait.def: No such file or directory
     173 | #include "cp/cp-trait.def"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/gcc-plugins/Makefile:47: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1
   make[3]: Target '__build' not remade because of errors.
   make[2]: *** [scripts/Makefile.build:497: scripts/gcc-plugins] Error 2
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1199: scripts] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:185: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
