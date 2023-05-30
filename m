Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161D99462
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 07:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685431398; x=1716967398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QmE5raCYtoX7Rj64l5U6B0AGowV72uFpfHb/vvgCVaU=;
  b=FzHfg6VqOF1TicJ03YyNlysqpc+ODJmXk36PEFCP0EyAoD6SpWanwE2O
   2iM5reDoLmXsw0vHLZObXfaHgH4lQAUsFseaBJDjMBznC395gM1+jdwbv
   W+gnk8TlZWrFiqIXzJtJ/SqYv6vsFiopYbJkpWyq8spuOI0AuZ74Dar12
   Va5qbIufpEPX6DUyUKq0CHe2TgCpPRPXkGJKi4ZgcCSqQ++QSqCNLBN43
   luhirCVIcJL3bUv/2L5aOiXrtjVoDWMWTE4fu7LL5626EHPQmwF/s7zt0
   NTOd9wQ0epUn4DdnVROZ4KmprcwClpQnUPqye9dMSr8XVb56Ze/pwPCLD
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="334460183"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="334460183"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 00:23:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="706314237"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; 
   d="scan'208";a="706314237"
Received: from lkp-server01.sh.intel.com (HELO fd90924b3b99) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 May 2023 00:23:13 -0700
Received: from kbuild by fd90924b3b99 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3thI-0000Bu-1o;
	Tue, 30 May 2023 07:23:12 +0000
Date: Tue, 30 May 2023 15:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: Xi Ruoyao <xry111@xry111.site>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>
Subject: loongarch64-linux-gcc: error: unrecognized command-line option
 '-mexplicit-relocs'
Message-ID: <202305301542.s8Ekg4Z0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b817fded42d8fe3a0eb47b1149d907851a3c942
commit: 11cd8a648301af0ad6937ed9493519d1e93fd4c8 LoongArch: Adjust symbol addressing for AS_HAS_EXPLICIT_RELOCS
date:   8 months ago
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20230530/202305301542.s8Ekg4Z0-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=11cd8a648301af0ad6937ed9493519d1e93fd4c8
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 11cd8a648301af0ad6937ed9493519d1e93fd4c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=loongarch prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305301542.s8Ekg4Z0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
>> loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
>> loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
   make[2]: *** [scripts/Makefile.build:249: scripts/mod/empty.o] Error 1
>> loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
   make[2]: *** [scripts/Makefile.build:117: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1204: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:222: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
