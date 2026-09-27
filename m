Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847532F8E9E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 18:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790532962; cv=none; b=MNVoPPBDY9mn7rKTgl0DAHdffCVt1pqwpBUy2+UoE5D6YNR6KMvhHQur3RNXk5j+Vx0eVEEE0ma4R8uZsDdbB14cFnb6BqDjyopViNESszxeau10qkzfpeSthMSvw4BVZERtzCsO0BQfA7fJh/3alku3Le9Fsf6fQDdudHQz32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790532962; c=relaxed/simple;
	bh=LjM//6HAkQJKpXHGMPjWjKXE/b07kYK6jRkxlUJe4eU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ghf42gcg5P3PqeUUFZIpsiNyRZEBH8EsHps0DrG7Ike4vb5eTtgr4a2ra66NH+eJ4Hbj2vFBltl8yrybWwmYbOA0PaUpJmJCXZQoMHidV/JWxs7YJ9uJdaCijK2+HFVnR0ZVegSOGHG3FiuUcQdUSPpZT6jVyuRDPqo/AOSUYXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BBAShp4m; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BBAShp4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790532959; x=1822068959;
  h=date:from:to:cc:subject:message-id;
  bh=LjM//6HAkQJKpXHGMPjWjKXE/b07kYK6jRkxlUJe4eU=;
  b=BBAShp4mrK12wEVlA+Ui7rpE/MCnuXt2xV5GXM1q6Fr8C7mGyMY/fl9r
   MbVTeaPm0f9s/bJhNnUBpZAjfnSI06BZxSI/nOPU69gv8ZmpHrhkOL4uO
   5uSphl2PVrlojPOGpYBTsTAa7ThrxrqlXHw2JXH7TGo/2HFQZbhs9IcNt
   gF/tj869abD14xIhF/xxjgwvrVnV/Li4F6kFocw0Eu2w4XUeC6qauKJSG
   5fGMM17djGGf5H3FUx0yRzHHdNjkamRviP8CNEN6orAZFcOE4tzJM2AWm
   nm15gBwuzj9kRg1vT8BnWnVzwgieydvtvCQPbc2nQGmnceoDHzaXAKDuJ
   Q==;
X-CSE-ConnectionGUID: 48k+/mE6Qiy43Vf6QicD4Q==
X-CSE-MsgGUID: vFwiW+3KRge9EDRQmVdo4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11918"; a="91104441"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="91104441"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 11:15:59 -0700
X-CSE-ConnectionGUID: UByGhLCuR8WP5FmWHvtoJg==
X-CSE-MsgGUID: oJzA/+I8Sumuy+PQ1NNYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274374308"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2026 11:15:57 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAtPn-000000000el-1nbp;
	Sun, 27 Sep 2026 18:15:55 +0000
Date: Sun, 27 Sep 2026 20:15:19 +0200
From: kernel test robot <lkp@intel.com>
To: Thorsten Blum <blum@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Paul Walmsley <pjw@kernel.org>
Subject: [riscv:for-next 6/6] arch/riscv/kernel/process.c:138:17:
 error: implicit declaration of function 'str_supported_unsupported'
Message-ID: <202609272053.WuVCdS70-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git for-next
head:   a06776565b9e73512e880a95b66c198ae8e7e24a
commit: a06776565b9e73512e880a95b66c198ae8e7e24a [6/6] riscv: process: Use str_supported_unsupported() in compat_mode_detect()
config: riscv-randconfig-r2104-20260927 (https://download.01.org/0day-ci/archive/20260927/202609272053.WuVCdS70-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609272053.WuVCdS70-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609272053.WuVCdS70-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/riscv/include/asm/bug.h:85,
                    from include/linux/bug.h:5,
                    from arch/riscv/include/asm/current.h:13,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/riscv/kernel/process.c:11:
   arch/riscv/kernel/process.c: In function 'compat_mode_detect':
>> arch/riscv/kernel/process.c:138:17: error: implicit declaration of function 'str_supported_unsupported' [-Wimplicit-function-declaration]
     138 |                 str_supported_unsupported(compat_mode_supported));
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   arch/riscv/kernel/process.c:137:9: note: in expansion of macro 'pr_info'
     137 |         pr_info("riscv: ELF compat mode %s",
         |         ^~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%s' expects argument of type 'char *', but argument 2 has type 'int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:584:9: note: in expansion of macro 'printk'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   include/linux/kern_levels.h:14:25: note: in expansion of macro 'KERN_SOH'
      14 | #define KERN_INFO       KERN_SOH "6"    /* informational */
         |                         ^~~~~~~~
   include/linux/printk.h:584:16: note: in expansion of macro 'KERN_INFO'
     584 |         printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |                ^~~~~~~~~
   arch/riscv/kernel/process.c:137:9: note: in expansion of macro 'pr_info'
     137 |         pr_info("riscv: ELF compat mode %s",
         |         ^~~~~~~


vim +/str_supported_unsupported +138 arch/riscv/kernel/process.c

   126	
   127	static int __init compat_mode_detect(void)
   128	{
   129		unsigned long tmp = csr_read(CSR_STATUS);
   130	
   131		csr_write(CSR_STATUS, (tmp & ~SR_UXL) | SR_UXL_32);
   132		compat_mode_supported =
   133				(csr_read(CSR_STATUS) & SR_UXL) == SR_UXL_32;
   134	
   135		csr_write(CSR_STATUS, tmp);
   136	
   137		pr_info("riscv: ELF compat mode %s",
 > 138			str_supported_unsupported(compat_mode_supported));
   139	
   140		return 0;
   141	}
   142	early_initcall(compat_mode_detect);
   143	#endif
   144	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
