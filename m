Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF962367DB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 16:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744473814; cv=none; b=ZNcefj7xRrGyKWAZbVVXJvzZQVpOVtxrAgUwBoDXben2ojzf0rlNiuOvk/0BleQvdVVrgVYNDP3QK8YETd3R5CsL4nE9Ym0LICaATWRC4O/ikbj9ac09cTIrQ0HXlh6wM2Q7rV8c0d7mgq5C6TeUb1onT/uV88zvRvsZ8SKtFD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744473814; c=relaxed/simple;
	bh=2YRlOaAejg/k6sk9hMiE2wjm/xtSlhcV5GriCcR7ilo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ls9PIgPws0JnW6Gz2SbbHKN668BX98tZFXtRL0LJTWbhckpME543yGTRI3bWpk9mA408MOW51wgiY/rOrnOz53vh7XtnqOsdTas+gANClxH5bxcq27lxRKE0jB7UFBwcOee3UWnKiW+V9DncJcCvmyu75nxI+S062SoxGbbFyxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMlik1sd; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMlik1sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744473812; x=1776009812;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2YRlOaAejg/k6sk9hMiE2wjm/xtSlhcV5GriCcR7ilo=;
  b=jMlik1sdEIQjFnBYGjeScxMlJjZgwUEideP6JS8nEVjutiaBcm8p4QNR
   cK6FuXzZGLG2CBHV0CHbngLaMF+ZHFfmj41iXro896mwrt6OjMo75NkVh
   yKrG04u4gFHx9YVXD8FQMbb4G26vswNpi9DeK9pXbE2LB4ou5g1zJx+dd
   65m/AMhRAT9XMAHztm5gsPBjWPvd8XMOEy7SBq4uiUDm7uDl9OHaa7iZu
   DZRoODhwLBk9orDvTfXB2oY/getBpy8CksssXdtiHGnQZEdcDSY1Tmk4W
   otYYVixvV8wQ0pGbaeV0S7FTRoAKV70hxMVddsFTXd6J6Xxp048nKdjSF
   g==;
X-CSE-ConnectionGUID: Cm93gML6TA+HN8mRf6Q3hQ==
X-CSE-MsgGUID: 9UbBye14Qg2xpxSzdzWFEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="45892064"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="45892064"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 09:03:31 -0700
X-CSE-ConnectionGUID: 8YJMYE5FTbyw7/CfqccJog==
X-CSE-MsgGUID: rBJhtD/8QaKtLAJTzNzx/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="129999881"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 12 Apr 2025 09:03:32 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3dKL-000Buk-0L;
	Sat, 12 Apr 2025 16:03:29 +0000
Date: Sun, 13 Apr 2025 00:02:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] drivers/misc/lkdtm/perms.c:89:1: error:
 type defaults to 'int' in declaration of 'ANNOTATE_NOCFI_SYM'
Message-ID: <202504122336.jXmwu5Al-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e
commit: c08c01c51ede1b79b73fe142e4bc9f7bb9d0ea5e [6/6] objtool: Validate kCFI calls
config: csky-randconfig-002-20250412 (https://download.01.org/0day-ci/archive/20250412/202504122336.jXmwu5Al-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122336.jXmwu5Al-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122336.jXmwu5Al-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/misc/lkdtm/perms.c:89:1: warning: data definition has no type or storage class
      89 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^~~~~~~~~~~~~~~~~~
>> drivers/misc/lkdtm/perms.c:89:1: error: type defaults to 'int' in declaration of 'ANNOTATE_NOCFI_SYM' [-Wimplicit-int]
>> drivers/misc/lkdtm/perms.c:89:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


vim +89 drivers/misc/lkdtm/perms.c

    70	
    71	static noinline __nocfi void execute_location(void *dst, bool write)
    72	{
    73		void (*func)(void);
    74		func_desc_t fdesc;
    75	
    76		pr_info("attempting ok execution at %px\n", do_nothing_ptr);
    77		do_nothing();
    78	
    79		if (write == CODE_WRITE) {
    80			memcpy(dst, do_nothing_ptr, EXEC_SIZE);
    81			flush_icache_range((unsigned long)dst,
    82					   (unsigned long)dst + EXEC_SIZE);
    83		}
    84		pr_info("attempting bad execution at %px\n", dst);
    85		func = setup_function_descriptor(&fdesc, dst);
    86		func();
    87		pr_err("FAIL: func returned\n");
    88	}
  > 89	ANNOTATE_NOCFI_SYM(execute_location);
    90	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
