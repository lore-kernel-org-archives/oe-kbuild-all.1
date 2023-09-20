Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E0F29A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695224223; x=1726760223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=61CHg1hAMsPA3L+KkFYANwr/+aNVgCHUKETiWokS+8Q=;
  b=KaF48UAbSLB/PQOVRrrKV2HD0xxR+SnU5SuCAzqiNn33O1a/RPV+Yuq1
   x+9YjGibYcaYata35qBAJJdjyee5B0veOPfxuT71zRrgoiynI4ZcT1wOX
   GOV8v9h7OqUynXHKB7aHfya+pNXcPpjKpCPXElDMGglUVroom6UtVsKaF
   Irn2Jc3EywBMZ070HE20sB2b89PyJlxAnDInQI4QLSnZDVKJ3RwbjnJvJ
   qxFgGrPWl58xJWAz5iz3k5UtgQhdbmTTym6H0LKCxJGw5oi4Oxwb0Vu8Y
   7ylbT99pSC9iejDGwaSTmXpzH39KfY1l0g3pQYFVz7wKOrqngQJbWE7da
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="383002981"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="383002981"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 08:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="781745825"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="781745825"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Sep 2023 08:36:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qizFx-0008tG-28;
	Wed, 20 Sep 2023 15:36:50 +0000
Date: Wed, 20 Sep 2023 23:36:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:asahi-wip 470/550] /bin/sh: 1: rustc: not found
Message-ID: <202309202325.DN44vKqD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux asahi-wip
head:   9a9edd25dbcf254a48a908f499f9b7c2fb4710bd
commit: e9c28caea34ce4b1b8239d18458f8799c598c789 [470/550] rust: 1.70 compat hack
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230920/202309202325.DN44vKqD-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202325.DN44vKqD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202325.DN44vKqD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
--
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   expr: syntax error: unexpected argument '1.69.0'
   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
>> /bin/sh: 1: rustc: not found
   expr: syntax error: unexpected argument '1.69.0'
   In file included from scripts/gcc-plugins/gcc-common.h:54,
                    from scripts/gcc-plugins/randomize_layout_plugin.c:19:
   ../lib/gcc/mips-linux/13.2.0/plugin/include/c-family/c-common.h:173:10: fatal error: cp/cp-trait.def: No such file or directory
     173 | #include "cp/cp-trait.def"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/randomize_layout_plugin.so] Error 1
   In file included from scripts/gcc-plugins/gcc-common.h:54,
                    from scripts/gcc-plugins/latent_entropy_plugin.c:78:
   ../lib/gcc/mips-linux/13.2.0/plugin/include/c-family/c-common.h:173:10: fatal error: cp/cp-trait.def: No such file or directory
     173 | #include "cp/cp-trait.def"
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[4]: *** [scripts/gcc-plugins/Makefile:54: scripts/gcc-plugins/latent_entropy_plugin.so] Error 1
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
