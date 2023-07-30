Received: from mgamail.intel.com (unknown [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C603D8A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 15:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690730848; x=1722266848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JKSWB1gOKlRM7wEhbSfGll/1qJ+qwI4fuSvuKXr5tUA=;
  b=N445VmbpK+3swVQbMb6UmTkoxnzi5m7XUVxGECTGaSHM/rGUCaA600vm
   sIEFoW2/KlcWi24h9QaBFe8ArueIoxUbshsbh6yiTk0234CbPj/n+1bZF
   b2JOA59b0vfVYNtDeCSNvI31Sgl3YYlihcaky+B66F0vEh0VvxQagW3Jg
   JwtWtHUTejf5HqtEyAAkcHABR/Dkg+jEA2aVxEDU00tTNMWjaadbukTr8
   wh7oJznL2UsVQYpYxqAjod983tYnszY+jO6pbtLrWn8oQTdEuWqvanXRE
   95TQh0DvvtvGtg3Veyz8rkgyOwA7Pxazu+g3VUF6LzUMpPn5lBhRwzASc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="349154049"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="349154049"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 08:27:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="851770569"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="851770569"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Jul 2023 08:27:26 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQ8KL-0004eB-1C;
	Sun, 30 Jul 2023 15:27:25 +0000
Date: Sun, 30 Jul 2023 23:26:45 +0800
From: kernel test robot <lkp@intel.com>
To: Feiyang Chen <chenfeiyang@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [linux-next:master 3805/5027]
 ../lib/gcc/loongarch64-linux/12.3.0/plugin/include/config/loongarch/loongarch-opts.h:31:10:
 fatal error: loongarch-def.h: No such file or directory
Message-ID: <202307302343.wD6JE5ms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7b3af5a77e8d8da28f435f313e069aea5bcf172
commit: 66b198b500fa82bfdd10a508a08bf3440c3e72e2 [3805/5027] LoongArch: Allow building with kcov coverage
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230730/202307302343.wD6JE5ms-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230730/202307302343.wD6JE5ms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307302343.wD6JE5ms-lkp@intel.com/

All errors (new ones prefixed by >>):

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
