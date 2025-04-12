Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756CC1E8338
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Apr 2025 15:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744471291; cv=none; b=b58YpSoh4z5aKb8XS8VFxzcyU3JF8HLv171ZBNvuIG1BnkznqKnsUYkzj/1d5zG91Tph5GJYJQh3xGbJerXLQAMe79gJ6+YHEKI50G3qoW6Xclsa79HMC5cGQ7dI0UDGnXPBsaNcUcFLygRoCXbK/PPtOOVWKrmIdSeTCi+lNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744471291; c=relaxed/simple;
	bh=UHKyO03XzjNGBl+70SXRJ/EiALMT7m976/51b8U+CEY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a6DzzytwtDdOoWM4xJF8slmRJlrmK+j4aRXJcANusvlPgD4r76fa2zvm9SFAhqx/UOtEXcgJRlAy18jZ29oiSXqCbqAYimuvx44q+dPzZ3ixtWqGjnIBmlxY0LBimWKeyuHSyeJ9qUbZIfoUlwl0HupeHazkeDotlq2gf6/s7Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hDJa3Jql; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hDJa3Jql"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744471289; x=1776007289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UHKyO03XzjNGBl+70SXRJ/EiALMT7m976/51b8U+CEY=;
  b=hDJa3Jql4GJBAJhfKeg2sKmUAlj5K0WauemNnps/IVXZvdE5Hkbwgt4w
   KSbtd0hc+nkfuNEkyZKxknFmCHcMClhvia3BFX+lMFYpoJeHLHe2Sy99O
   jF+X75BZhXEFoVpw5U2DqN7uHVnDxkkYtH4htc4rDLhlBbv/DQe6UUSYY
   lL0dZsCkT0Cvo3hyfX58dLq97eTnGrUaljUSFGSOx5q7KsQcUN4Pv+q9j
   F/CXqZPi1NWLQucL5i0M6uF39E3djZNHfV/lb3rYe5Vd0MMn0TOrbjFD3
   I7FB0qF41bL2nqOyRSSgOhp84lHqJNuVf4FFMp0eUlh6dgvzWb9ZkLwk0
   A==;
X-CSE-ConnectionGUID: 6rX4SJ/KRU+a6EWI+Vzv2A==
X-CSE-MsgGUID: G5e+lrS/RBawvYgFMCo7Gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="71384990"
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="71384990"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 08:21:29 -0700
X-CSE-ConnectionGUID: CzBx/1KRQriH+7QIkFq2Sg==
X-CSE-MsgGUID: lc5ggqvUQi2Ec73jkLLmOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,208,1739865600"; 
   d="scan'208";a="134292791"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Apr 2025 08:21:28 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3cfd-000Bsy-1a;
	Sat, 12 Apr 2025 15:21:25 +0000
Date: Sat, 12 Apr 2025 23:20:38 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 6/6] drivers/misc/lkdtm/perms.c:89:1:
 warning: data definition has no type or storage class
Message-ID: <202504122303.zzwNcaYn-lkp@intel.com>
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
config: csky-randconfig-002-20250412 (https://download.01.org/0day-ci/archive/20250412/202504122303.zzwNcaYn-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250412/202504122303.zzwNcaYn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504122303.zzwNcaYn-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/misc/lkdtm/perms.c:89:1: warning: data definition has no type or storage class
      89 | ANNOTATE_NOCFI_SYM(execute_location);
         | ^~~~~~~~~~~~~~~~~~
   drivers/misc/lkdtm/perms.c:89:1: error: type defaults to 'int' in declaration of 'ANNOTATE_NOCFI_SYM' [-Wimplicit-int]
   drivers/misc/lkdtm/perms.c:89:1: error: parameter names (without types) in function declaration [-Wdeclaration-missing-parameter-type]


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
