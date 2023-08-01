Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5B22CA5
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 17:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690910177; x=1722446177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HNzq64D9yFZ9qye2XYXuffEGIy26qFtvkRZXlG4DYFI=;
  b=mBbsMs0nXCh7P6zRYWdMTELsStn3bCH9JF4hWuIYwAZDwuXvzbKPIPLT
   W7ngFdkQVruykafvzjv3nMqx9vNVCsn5M82S5EU8gemzB1EVNmSoA/C5M
   YP3OhItqrcyd8EQ7ntKSTfaSOd5ZPpSNrGg1H8bBOTSIF/dB79/aqc0AT
   D1nAD5YyNnGNT3QBj7exmGbgnyYUf0b8NdJACfbYMvu+40wsz3eeYbVPQ
   daKo3JY5ohCM5S38a4qVkckEU8R172fzUPRKxaycLtIyqVVFJonJQiObi
   grp8/+bf4kXE/MM2jTTv2/+s5xN7BaQ5FTM0usaJhWmR9VsBJP9JKcH7P
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="435688230"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="435688230"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 10:11:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="732059163"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="732059163"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2023 10:11:27 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQsu6-0000S7-22;
	Tue, 01 Aug 2023 17:11:26 +0000
Date: Wed, 2 Aug 2023 01:10:50 +0800
From: kernel test robot <lkp@intel.com>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 5607/6031]
 ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10:
 fatal error: loongarch-def.h: No such file or directory
Message-ID: <202308020154.Xrcb9bWT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a734662572708cf062e974f659ae50c24fc1ad17
commit: 56ee0788a35a7dfc87ee7fe26ab8508047becb41 [5607/6031] LoongArch: Allow building with kcov coverage
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230802/202308020154.Xrcb9bWT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020154.Xrcb9bWT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020154.Xrcb9bWT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/options.h:8,
                    from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/tm.h:46,
                    from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/backend.h:28,
                    from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/gcc-plugin.h:30,
                    from scripts/gcc-plugins/gcc-common.h:7,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
>> ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
      31 | #include "loongarch-def.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   In file included from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/options.h:8,
                    from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/tm.h:46,
                    from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/backend.h:28,
                    from ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/gcc-plugin.h:30,
                    from scripts/gcc-plugins/gcc-common.h:7,
                    from scripts/gcc-plugins/latent_entropy_plugin.c:78:
>> ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10: fatal error: loongarch-def.h: No such file or directory
      31 | #include "loongarch-def.h"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/latent_entropy_plugin.so] Error 1
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1
   make[4]: Target 'scripts/gcc-plugins/' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:480: scripts/gcc-plugins] Error 2
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1271: scripts] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
