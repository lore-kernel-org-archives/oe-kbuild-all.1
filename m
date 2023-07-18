Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373210EA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jul 2023 08:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689669749; x=1721205749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cQzIo0Wsup6OadOc7VaM/jAMvwiR2TdK8T84eVrceYU=;
  b=I3iOpuqkMezrvfjnWt68TN0ZT7lDJO+P5s96Vowo6l6xEgzP93VKZFtd
   qSSZsm6Bw0K5pKHHlXUAGJAqFz/HnQ6MEnWDkOuGqyz2oEB8GMp3R+o06
   h2ZV1SjkBd4HoOR6VKmuvZYIgB6tSf7W5+Novgy5ZpxEjPBonhpYMpxMp
   j2vgmONaH9lSKQdhQqC1Ega9ExqpVf3+h33zt2OVGdn57zkD9UqJUr2NS
   DDMe9NOkzq7nryCZVptkOKwIIlQQy5MDvzbg8bQlpuAiS8hdQLpjAlLHE
   gq5SJ2MbWmYFVYYGTm2260OSI0vfyn+eBpAIQai4CqrutOR2bt0JEacrf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="356089832"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="356089832"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 01:42:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="970164414"
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200"; 
   d="scan'208";a="970164414"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 18 Jul 2023 01:42:24 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qLgHm-0000NX-0S;
	Tue, 18 Jul 2023 08:42:24 +0000
Date: Tue, 18 Jul 2023 16:41:15 +0800
From: kernel test robot <lkp@intel.com>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, Huacai Chen <chenhuacai@kernel.org>
Subject: [chenhuacai-loongson:loongarch-next 5/9]
 ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10:
 fatal error: loongarch-def.h: No such file or directory
Message-ID: <202307181636.4CpHHj2H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   27cd98b9e77cd45eaf86d71474a512cb073e5a4c
commit: dcb49d911f85b5c3ae398c74bc8223a349debdd1 [5/9] LoongArch: Allow building with kcov coverage
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230718/202307181636.4CpHHj2H-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230718/202307181636.4CpHHj2H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307181636.4CpHHj2H-lkp@intel.com/

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
