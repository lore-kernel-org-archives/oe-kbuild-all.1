Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32869156D1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 06:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689835262; x=1721371262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bo9I4YxRLAltxOBj6PeaCE5k0YJD2TiCVD+Ntoy5JtY=;
  b=B9anMjIcrukTEIVhRkCT4MMYzvtZnwHKahU4XXnJ/8/45s5Wj/LWjo9X
   UCt98sQkULSTD/Qdp6OfpsGbQacQMGcYrunOEj8opds1EEd8dyUtMcdZ8
   W8PA066ZpWz6Bkd7h9G+xMsV/Az2rDPyLWj36bpW9EiKf+cmPg8q63RaO
   C0lZFL/nW+vmPoJj27b3LIi7ouxtTUugrZoM6SNbldoygnEz/rdHj9ant
   ypkcIZjzK0hj7sfjs+hjAeoDgo5DZ8/PlqX0FH9qEotMGRCsBBPm3YUQR
   T4sha6AZ+SRC9ZAZ2BckhZd5XbBcmZ+5zF/FySU/4qQY1QCVe0Mco/8Q4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="365532418"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="365532418"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 23:40:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="794321652"
X-IronPort-AV: E=Sophos;i="6.01,218,1684825200"; 
   d="scan'208";a="794321652"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Jul 2023 23:36:50 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMNH4-0005oj-1v;
	Thu, 20 Jul 2023 06:36:36 +0000
Date: Thu, 20 Jul 2023 14:36:13 +0800
From: kernel test robot <lkp@intel.com>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 3050/3762]
 ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10:
 fatal error: loongarch-def.h: No such file or directory
Message-ID: <202307201439.A9MArfeq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c58c49dd89324b18a812762a2bfa5a0458e4f252
commit: 72c15ad1f3e1608dada57020e5b36971d51844da [3050/3762] LoongArch: Allow building with kcov coverage
config: loongarch-randconfig-r001-20230720 (https://download.01.org/0day-ci/archive/20230720/202307201439.A9MArfeq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307201439.A9MArfeq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307201439.A9MArfeq-lkp@intel.com/

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
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1 shuffle=1439962185
   make[4]: Target 'scripts/gcc-plugins/' not remade because of errors.
   make[3]: *** [scripts/Makefile.build:477: scripts/gcc-plugins] Error 2 shuffle=1439962185
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1259: scripts] Error 2 shuffle=1439962185
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=1439962185
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=1439962185
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
