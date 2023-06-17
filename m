Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746A66FAE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jun 2023 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687017280; x=1718553280;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GvI4UZjdN303xouE4hKQ3g3qhxRKFseC8iRie+jil+o=;
  b=cJ9qbR+pfjFhd8B33TLQVD05vsUUlmdxk6ApKugAPsALsRYUmbaUoDxW
   ibTw4Y2suvN89EsfJ0Le0xDCxkTikR/GTb2+Rt/p5e4yzPjql+dDgYUCl
   Y+vMWarEZphbGj3lw+Q1jcj7bo+k1cMOp2/wcQogsUmFo76U/Twxh6rEs
   7IaB9giiJOO/IkegIv5DEyO5BCAUyY1Ep/Vaix75ZAlKcvpy2mAeqWiRI
   6/ZxOhc2gNAaq31elppvgxdGe4qEZYRlDg1QWNKzzcw6OKhcJTnt3islZ
   2EiYos4Xm+jQO2WgZzUBTqpF7v+P734+7uCafHxvod08Wh/S/ZnG/Sxjm
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="388283943"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="388283943"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 08:54:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="837371541"
X-IronPort-AV: E=Sophos;i="6.00,250,1681196400"; 
   d="scan'208";a="837371541"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 17 Jun 2023 08:54:38 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAYG5-0002sj-2k;
	Sat, 17 Jun 2023 15:54:37 +0000
Date: Sat, 17 Jun 2023 23:54:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/210-gpu 227/227] /bin/sh: 1: rustc: not found
Message-ID: <202306172349.xtgwHQvW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/210-gpu
head:   496a1b061691f01602aa63d2a8027cf3020d4bb8
commit: 496a1b061691f01602aa63d2a8027cf3020d4bb8 [227/227] rust: 1.70 compat hack
config: loongarch-randconfig-r035-20230617 (https://download.01.org/0day-ci/archive/20230617/202306172349.xtgwHQvW-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306172349.xtgwHQvW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306172349.xtgwHQvW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
--
   loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
   loongarch64-linux-gcc: error: unrecognized command-line option '-mexplicit-relocs'
   loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
   make[2]: *** [scripts/Makefile.build:252: scripts/mod/empty.o] Error 1 shuffle=1532226975
   loongarch64-linux-gcc: error: unrecognized command-line option '-mdirect-extern-access'
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1 shuffle=1532226975
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1285: prepare0] Error 2 shuffle=1532226975
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2 shuffle=1532226975
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
