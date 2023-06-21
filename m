Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF0F1FA9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 05:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687324379; x=1718860379;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+bKiLreyMBAW9zVQhgTCAVkBanLZd8FcHDE/2hYv2CA=;
  b=hmBhSY6TVIMtTdsdML3U2Kb2qkSmTfy9mhrw51A59uUCGw0VI27L5kO9
   2xAva92bGkL8okIfrMsj8Ob4/mW9LfHAoLZDb82WO0YfFZ0bl70zTfEto
   skPLjeRLOvTbq25S78o9tbqbpL+mXopF0NnNPFyemj7W9p91m33Jnlcez
   fqOnNWuilqYlpZeRXQGV2PzkF4PQ56V9LNPhXWL9cR9vQKoqDvXr6/BR6
   e7GKzpUJaZyo0qd46N8ODwAbxWgkL/B5iXdEWoCHhMvHZFa6NRfa8cCb7
   Z4gj1AjWk+9uAboucEbAwDp+2JLyyN5XFmlmVjmq41C3w4op8Pv41NMlP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340411776"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="340411776"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2023 22:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="708560165"
X-IronPort-AV: E=Sophos;i="6.00,259,1681196400"; 
   d="scan'208";a="708560165"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Jun 2023 22:12:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBq9I-0006Zn-2V;
	Wed, 21 Jun 2023 05:12:56 +0000
Date: Wed, 21 Jun 2023 13:12:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-2i 12/18] mips-linux-ld:
 lib/test_dynamic_debug_submod.o:(__dyndbg_class_users+0x4): undefined
 reference to `map_level_names'
Message-ID: <202306211331.IJvpYVNN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-2i
head:   706822e871c197cefca034dce9582e0fc916732b
commit: c3109b624b9d040f1002ae267886572688fd2d93 [12/18] dyndbg-API: promote DYNDBG_CLASSMAP_PARAM to API
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230621/202306211331.IJvpYVNN-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211331.IJvpYVNN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211331.IJvpYVNN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `_stext':
   (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
   arch/mips/kernel/head.o: in function `smp_bootstrap':
   (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x230): additional relocation overflows omitted from the output
>> mips-linux-ld: lib/test_dynamic_debug_submod.o:(__dyndbg_class_users+0x4): undefined reference to `map_level_names'
>> mips-linux-ld: lib/test_dynamic_debug_submod.o:(__dyndbg_class_users+0xc): undefined reference to `map_disjoint_names'
>> mips-linux-ld: lib/test_dynamic_debug_submod.o:(__dyndbg_class_users+0x14): undefined reference to `map_level_num'
>> mips-linux-ld: lib/test_dynamic_debug_submod.o:(__dyndbg_class_users+0x1c): undefined reference to `map_disjoint_bits'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
