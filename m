Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4D8F7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 07:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690271265; x=1721807265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+UEcqAzmziRcJLWTjRpkjJaUBAW6Z2hsgxQczXElrR4=;
  b=W71cXvdiN4jZ7SfqkJ/j05DyPpPeVIF/zXSiQOSrqTJgU0sjohiBu7bP
   tqRtrZTD9fbmmZccmqMxmNH/d4aGH6+4WXXl1KdQ1CWp+V+SVktsLxsDr
   d3fuVmxn7i8ReaZNuF9iUIxP/ysQqfeaJerPVRkgTu7hDx0vq1qXXMK5p
   /Hq3zQEB+uySqDr/QYyBNCHAZINxxoNzyoDh4AohkD8yIIf28oPa1TrCJ
   kjPn9hh1HDYJAnYoj5oVuIO/RxJf4qof9u7mAaLDzRrE/JW5kDr7iVQkA
   dniaVTLikzKbEh3iVnT1mpwSSx9RQTbCSH2pt0KHMJUz32ZnZVWiaIzz9
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347254848"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="347254848"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 00:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="796053862"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; 
   d="scan'208";a="796053862"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jul 2023 00:47:41 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOClg-000AR4-1L;
	Tue, 25 Jul 2023 07:47:40 +0000
Date: Tue, 25 Jul 2023 15:46:55 +0800
From: kernel test robot <lkp@intel.com>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 2984/4083]
 ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10:
 fatal error: loongarch-def.h: No such file or directory
Message-ID: <202307251531.p8ZLFTMZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   1e25dd7772483f477f79986d956028e9f47f990a
commit: f3a7aca1c0abf2a492edcbf332f69468f49672d6 [2984/4083] LoongArch: Allow building with kcov coverage
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230725/202307251531.p8ZLFTMZ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230725/202307251531.p8ZLFTMZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307251531.p8ZLFTMZ-lkp@intel.com/

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
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/latent_entropy_plugin.so] Error 1
   make[4]: Target 'scripts/gcc-plugins/' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:477: scripts/gcc-plugins] Error 2
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1259: scripts] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
