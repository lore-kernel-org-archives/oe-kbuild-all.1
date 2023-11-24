Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E9482E821
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GmiS7GX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839438; x=1732375438;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3YjNlC0oMxAetzItTISMgogs92yyhrnl1QiSJzUelM=;
  b=GmiS7GX3+nmnLasjQ2vNUy0QXcikUBoLxeut6zj2XiBOuC0f3XlNP08e
   VKa3hcfcdzP+PZ/cY4y+kNMtXPsm+GpLgmkRBHB0xbiBeHrMJnbwpataS
   tBihXz4P6kOL/BrppE4FhH5R8UnUrBoLFRuHlNrbosyM83sDsi5PdbLGw
   R5I0Frs9QwuRpYgPOp8l3RcKTetOcEB3HfNLcnjyhIVizWLBLTM7FukDh
   iNN82/r65oZk2VUjpm8xotpE+YT1d/yCwIcbsbl156UkrKdbO70k0c7C2
   QZujpJpGfwnQeQi3yRfD97gR7O5KSvD8uhX5pe2XCUC0tDd9OM588PMNH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="456781787"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="456781787"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1014935605"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1014935605"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 07:23:54 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Y24-0002wl-2k;
	Fri, 24 Nov 2023 15:23:52 +0000
Date: Fri, 24 Nov 2023 23:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:dev-6.6 36/58] aspeed-sbc.c:undefined reference to
 `arch_debugfs_dir'
Message-ID: <202311241652.FFEP9obj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux dev-6.6
head:   9fd3fe525544779d6bc28fa948759535ff7232db
commit: 0297e91bee7edaedec63f71dde4a4f2e2d003a63 [36/58] ARM: soc: aspeed: Add secure boot controller support
config: openrisc-allyesconfig (https://download.01.org/0day-ci/archive/20231124/202311241652.FFEP9obj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241652.FFEP9obj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241652.FFEP9obj-lkp@intel.com/

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
   or1k-linux-ld: drivers/soc/aspeed/aspeed-sbc.o: in function `aspeed_sbc_init':
>> aspeed-sbc.c:(.init.text+0x130): undefined reference to `arch_debugfs_dir'
>> or1k-linux-ld: aspeed-sbc.c:(.init.text+0x13c): undefined reference to `arch_debugfs_dir'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
