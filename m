Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FDA1CA87
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Sep 2023 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695054299; x=1726590299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y+NFO0qPHOJgCDm2A2F8161JwSN2yP7AX8rHLKx9KJk=;
  b=W/pw7OdRnXUSwHMb1jKXPn45gIxEVYn3/0sum62iRpqB2aPjZkejCyAm
   z9P0W2w8LBZkC5uAS4HxBF0atthZFvujo7xt9//J3Nwznh2KupEFXozW5
   9LA2El5BVzWrI5DZFo4SNNChw4BENU0u4a1ntCv6AWH/zQrw0zyYcOUWF
   PhN7ZIypyHG8fzsQ/gRnfFci6BJX10WE7gMRJzdo8VgpBkhGsIDMU2PBG
   YtaJUMdYpkOaexwaROq6r2sDA/c5ocCy6qcYV4ImJLqMWKreccJyU8LnL
   O6+CGgmDsVyhiwnmR9MoX3+pRfx22jiuojLh4VomKEIEWdtPvBFClBK4X
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="382450177"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="382450177"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 09:24:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="1076642825"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="1076642825"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Sep 2023 09:24:57 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qiH3P-0006HQ-10;
	Mon, 18 Sep 2023 16:24:55 +0000
Date: Tue, 19 Sep 2023 00:24:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-fix-5k 29/29] or1k-linux-ld: test_dynamic_debug.c:undefined
 reference to `dd_mt_sites'
Message-ID: <202309190022.1SbaEIvw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-fix-5k
head:   4ddb17b77bfb55e87a4ee98d72b9432d229fb1a6
commit: 4ddb17b77bfb55e87a4ee98d72b9432d229fb1a6 [29/29] dyndbg: add sites_mt into _ddebug_info
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20230919/202309190022.1SbaEIvw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230919/202309190022.1SbaEIvw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309190022.1SbaEIvw-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/openrisc/kernel/head.o: in function `_dispatch_do_ipage_fault':
   (.text+0x900): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   (.text+0xa00): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_dtranslation':
   (.head.text+0x21bc): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   arch/openrisc/kernel/head.o: in function `exit_with_no_itranslation':
   (.head.text+0x2264): relocation truncated to fit: R_OR1K_INSN_REL_26 against `no symbol'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0xf4): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `memset' defined in .text section in arch/openrisc/lib/memset.o
   init/main.o: in function `rdinit_setup':
   main.c:(.init.text+0x14c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `memset' defined in .text section in arch/openrisc/lib/memset.o
   init/main.o: in function `do_early_param':
   main.c:(.init.text+0x27c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `parameq' defined in .text section in kernel/params.o
   init/main.o: in function `unknown_bootoption':
   main.c:(.init.text+0x564): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `parameqn' defined in .text section in kernel/params.o
   init/main.o: in function `setup_boot_config':
   main.c:(.init.text+0xc2c): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `parse_args' defined in .text section in kernel/params.o
   init/main.o: in function `setup_command_line':
   main.c:(.init.text+0xf74): relocation truncated to fit: R_OR1K_INSN_REL_26 against symbol `memcpy' defined in .text section in arch/openrisc/lib/memcpy.o
   init/main.o: in function `initcall_blacklist':
   main.c:(.init.text+0x10d4): additional relocation overflows omitted from the output
   or1k-linux-ld: lib/test_dynamic_debug.o: in function `do_prints':
   test_dynamic_debug.c:(.text+0x2ec): undefined reference to `dd_mt_sites'
>> or1k-linux-ld: test_dynamic_debug.c:(.text+0x2f0): undefined reference to `dd_mt_sites'
   or1k-linux-ld: lib/test_dynamic_debug_submod.o: in function `do_prints':
   test_dynamic_debug_submod.c:(.text+0x2ec): undefined reference to `dd_mt_sites'
>> or1k-linux-ld: test_dynamic_debug_submod.c:(.text+0x2f0): undefined reference to `dd_mt_sites'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
