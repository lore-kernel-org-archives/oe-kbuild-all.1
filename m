Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E4B2B56F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Aug 2023 18:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692730364; x=1724266364;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDA/Z6kXajr7mkHh0vUBOEEvlZZlIdEI96D4iaQUwDw=;
  b=AJAlFkegRn3UzXyiBpf+tWRo1GVE2Ildvv4WrIvKbTrltRAhtVfgwSWm
   Xz61GJnrPWre/9TBweLa6pMX9+BGcXPEAN4LJxQo3zDBAgePInsFHde7h
   5pnLtuIUkGTOd9qP+OELMHiKeFTNBWumPDCSYWd5qKRt2E8WcXlOxXTi8
   2GIDmFIZUipD/NS7JtQfI/hs0l1Iys+UZlOSDdrpRPgKdooTGDfCTiukj
   UQ6/cE8++aIBK4bQWXPu+jpyKanyYa+L2nVWzfnzi9tbDBvDcX0QGj1Uv
   529IirmjfPUnXTXP33tbFkCn1rf0KbQWEp4j990eKuFKk7bY+oel488ft
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="364147893"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; 
   d="scan'208";a="364147893"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 11:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="1067169108"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="1067169108"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 22 Aug 2023 11:52:37 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYWUR-0000S7-2a;
	Tue, 22 Aug 2023 18:52:33 +0000
Date: Wed, 23 Aug 2023 02:51:35 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/sparc/kernel/traps_64.c:2839:13: error: no previous prototype
 for 'trap_init'
Message-ID: <202308230215.bfQqngTC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f7757129e3dea336c407551c98f50057c22bb266
commit: 7e09cb0b84ac5d17086a65ca21479dfec600a232 of: Drop cpu.h include from of_device.h
date:   4 months ago
config: sparc-randconfig-r024-20230821 (https://download.01.org/0day-ci/archive/20230823/202308230215.bfQqngTC-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230823/202308230215.bfQqngTC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308230215.bfQqngTC-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/sparc/kernel/traps_64.c:252:6: error: no previous prototype for 'is_no_fault_exception' [-Werror=missing-prototypes]
     252 | bool is_no_fault_exception(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/traps_64.c:2034:6: error: no previous prototype for 'do_mcd_err' [-Werror=missing-prototypes]
    2034 | void do_mcd_err(struct pt_regs *regs, struct sun4v_error_entry ent)
         |      ^~~~~~~~~~
   arch/sparc/kernel/traps_64.c:2152:6: error: no previous prototype for 'sun4v_nonresum_error_user_handled' [-Werror=missing-prototypes]
    2152 | bool sun4v_nonresum_error_user_handled(struct pt_regs *regs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/kernel/traps_64.c:2839:13: error: no previous prototype for 'trap_init' [-Werror=missing-prototypes]
    2839 | void __init trap_init(void)
         |             ^~~~~~~~~
   cc1: all warnings being treated as errors


vim +/trap_init +2839 arch/sparc/kernel/traps_64.c

^1da177e4c3f41 arch/sparc64/kernel/traps.c Linus Torvalds 2005-04-16  2837  
^1da177e4c3f41 arch/sparc64/kernel/traps.c Linus Torvalds 2005-04-16  2838  /* Only invoked on boot processor. */
^1da177e4c3f41 arch/sparc64/kernel/traps.c Linus Torvalds 2005-04-16 @2839  void __init trap_init(void)

:::::: The code at line 2839 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
