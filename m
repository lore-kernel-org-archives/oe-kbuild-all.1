Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6DB1C2B5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FTMZ+6fX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699025312; x=1730561312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hynph1M8Ibd6GNZ7OW5P7kCTBCahqEz1ha5NGWCOJDM=;
  b=FTMZ+6fXBRoEForC1c0fCBuaoXeFUoRwhzYDbytEDuIf39ndVLTlt3FO
   LqYaklupGizH01fWzebbVXdLygVy/KrL9DUJf3C5s5VbnwrX2JlpjAX74
   zOjDq6kd4tZXSa04sxyqZTOJa9uMnO1pfO79Ksi3qvcI0S9i0EcjAynx+
   hKHkmC9L7Uojk3D3dyBBDIiuRUA75ECDXOilO7KY08T7oAvKnxhsueWKL
   ZO0MwtPaqoOcDa+5OoEUSq6CJnvTp9ud5h9Ux0cHt1bUTkpyNaW3qeI+z
   AnPgBctrAlly6qDxMXFAyH0qoR42kmjlK2/Kz2giu1MpuPYiyXWCAlD15
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368307140"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="368307140"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 08:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="852291921"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="852291921"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2023 08:28:30 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyw60-0002dA-03;
	Fri, 03 Nov 2023 15:28:28 +0000
Date: Fri, 3 Nov 2023 23:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/sparc/kernel/traps_64.c:2839:13: warning: no previous prototype
 for 'trap_init'
Message-ID: <202311032350.zdir71xr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: 7e09cb0b84ac5d17086a65ca21479dfec600a232 of: Drop cpu.h include from of_device.h
date:   7 months ago
config: sparc-sparc64_defconfig (https://download.01.org/0day-ci/archive/20231103/202311032350.zdir71xr-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032350.zdir71xr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032350.zdir71xr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/sparc/kernel/traps_64.c:252:6: warning: no previous prototype for 'is_no_fault_exception' [-Wmissing-prototypes]
     252 | bool is_no_fault_exception(struct pt_regs *regs)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/sparc/kernel/traps_64.c:2034:6: warning: no previous prototype for 'do_mcd_err' [-Wmissing-prototypes]
    2034 | void do_mcd_err(struct pt_regs *regs, struct sun4v_error_entry ent)
         |      ^~~~~~~~~~
   arch/sparc/kernel/traps_64.c:2152:6: warning: no previous prototype for 'sun4v_nonresum_error_user_handled' [-Wmissing-prototypes]
    2152 | bool sun4v_nonresum_error_user_handled(struct pt_regs *regs,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/sparc/kernel/traps_64.c:2839:13: warning: no previous prototype for 'trap_init' [-Wmissing-prototypes]
    2839 | void __init trap_init(void)
         |             ^~~~~~~~~


vim +/trap_init +2839 arch/sparc/kernel/traps_64.c

^1da177e4c3f415 arch/sparc64/kernel/traps.c Linus Torvalds 2005-04-16  2837  
^1da177e4c3f415 arch/sparc64/kernel/traps.c Linus Torvalds 2005-04-16  2838  /* Only invoked on boot processor. */
^1da177e4c3f415 arch/sparc64/kernel/traps.c Linus Torvalds 2005-04-16 @2839  void __init trap_init(void)

:::::: The code at line 2839 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
