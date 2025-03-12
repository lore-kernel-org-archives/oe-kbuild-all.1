Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29D71DED40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 05:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741758088; cv=none; b=T0wtVkEhb+4XKAcNuk0xXARrdYAyngnvuWNnyozF1yVVcsGgrEJ0ZpLwvF4eBtYTNCSBnspOfY7QuMYoB9UsdhNiAyCkQSZTWkEc2savidZyaepo+Cyu3YzzN8YmAnbgGHwkcvkaNP2S4+b0601X5ETwtt3HOqfKfCJdOIb/Lu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741758088; c=relaxed/simple;
	bh=Hly95rB7cJPOeX4xQyWuUn+N5asxcoX1u7IMEAz5c0o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8CIn1nhvz8fZLTXRFtAC7xoQ3AWwmJxljgw00mMe2lif02gUZDaL1t98MKdJ6prARdhhbH//P4fH2DMEPmdP5NA4GqT/lzaGSqphIcCywXJDs6kNmkBlQT6WG/+joCNT04APsszRve05EKjq7VJch/Zvk6uNE2bKh8jKurL7fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCnp1qut; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCnp1qut"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741758087; x=1773294087;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hly95rB7cJPOeX4xQyWuUn+N5asxcoX1u7IMEAz5c0o=;
  b=jCnp1qutFnOlonqsCrIb0j0yY3givBbKc00gWAwchlpbjh3chKOFTJei
   ONaDcTtLMjxYwSrs70n8F83K/PtL6nJpVwEXA3HNZ9W2phWLAlDgv4ZYr
   LycaAkuHS3vyJk0gJuuohnjra1EpWkCE1vOqrZ26DcFet0q7y40lzSrQj
   BNNh/507LyokIb6vGlLdJiQPZHUk03f8VvifV5QFwrF5lFqOeTwVPmVKs
   XJCHEFaEf0CX9/O1RBxBPYZSpb5JamtdxUkiRhiHqmT6wMyFRqPOqIaCE
   roX3AGUciDj4CLBVzydkO712MjWf5b/A4qIYH5CarEeG7e0He9tt2c+iy
   A==;
X-CSE-ConnectionGUID: 6nQlJGQqSqSwx2/2Wcc/bw==
X-CSE-MsgGUID: Q0B0+idIS1esHMXxSrOZVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="54208349"
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="54208349"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 22:41:24 -0700
X-CSE-ConnectionGUID: R0OKHaJeQJCwvhZdvs4DTA==
X-CSE-MsgGUID: y9TD09ysQe+CiIkeFK2LnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,240,1736841600"; 
   d="scan'208";a="120487877"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Mar 2025 22:41:22 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsEqG-00089y-13;
	Wed, 12 Mar 2025 05:41:20 +0000
Date: Wed, 12 Mar 2025 13:40:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:_r8 64/70] kernel/module/main.c:2641:10: warning: format
 specifies type 'char *' but the argument has type 'int'
Message-ID: <202503121305.Y1cIpLhr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git _r8
head:   d2e2e629f0a887e71446afa03ead92dc5a4af57c
commit: 1f2e18de8214b240046f219f0c37aeeee89a48b0 [64/70] dyndbg: split __dyndbg_sites section out from __dyndbg_descriptors
config: i386-buildonly-randconfig-002-20250312 (https://download.01.org/0day-ci/archive/20250312/202503121305.Y1cIpLhr-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250312/202503121305.Y1cIpLhr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121305.Y1cIpLhr-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/module/main.c:2641:10: warning: format specifies type 'char *' but the argument has type 'int' [-Wformat]
    2640 |                 pr_err("module: %s section-pair lengths: %d != %d: __dyndbg_{descriptors,codeorgs}\n",
         |                                 ~~
         |                                 %d
    2641 |                        mod->dyndbg_info.descs.len != mod->dyndbg_info.sites.len, mod->name);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> kernel/module/main.c:2641:68: warning: format specifies type 'int' but the argument has type 'char *' [-Wformat]
    2640 |                 pr_err("module: %s section-pair lengths: %d != %d: __dyndbg_{descriptors,codeorgs}\n",
         |                                                          ~~
         |                                                          %s
    2641 |                        mod->dyndbg_info.descs.len != mod->dyndbg_info.sites.len, mod->name);
         |                                                                                  ^~~~~~~~~
   include/linux/printk.h:544:33: note: expanded from macro 'pr_err'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ~~~     ^~~~~~~~~~~
   include/linux/printk.h:501:60: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ~~~    ^~~~~~~~~~~
   include/linux/printk.h:473:19: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ~~~~    ^~~~~~~~~~~
>> kernel/module/main.c:2640:51: warning: more '%' conversions than data arguments [-Wformat-insufficient-args]
    2640 |                 pr_err("module: %s section-pair lengths: %d != %d: __dyndbg_{descriptors,codeorgs}\n",
         |                                                                ~^
   include/linux/printk.h:544:25: note: expanded from macro 'pr_err'
     544 |         printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                                ^~~
   include/linux/printk.h:391:21: note: expanded from macro 'pr_fmt'
     391 | #define pr_fmt(fmt) fmt
         |                     ^~~
   include/linux/printk.h:501:53: note: expanded from macro 'printk'
     501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                                                     ^~~
   include/linux/printk.h:473:11: note: expanded from macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   3 warnings generated.


vim +2641 kernel/module/main.c

  2616	
  2617		mod->extable = section_objs(info, "__ex_table",
  2618					    sizeof(*mod->extable), &mod->num_exentries);
  2619	
  2620		if (section_addr(info, "__obsparm"))
  2621			pr_warn("%s: Ignoring obsolete parameters\n", mod->name);
  2622	
  2623	#ifdef CONFIG_DYNAMIC_DEBUG_CORE
  2624		mod->dyndbg_info.descs.start = section_objs(info, "__dyndbg_descriptors",
  2625							    sizeof(*mod->dyndbg_info.descs.start),
  2626							    &mod->dyndbg_info.descs.len);
  2627		mod->dyndbg_info.maps.start = section_objs(info, "__dyndbg_class_maps",
  2628							   sizeof(*mod->dyndbg_info.maps.start),
  2629							   &mod->dyndbg_info.maps.len);
  2630		mod->dyndbg_info.users.start = section_objs(info, "__dyndbg_class_users",
  2631							   sizeof(*mod->dyndbg_info.users.start),
  2632							   &mod->dyndbg_info.users.len);
  2633		mod->dyndbg_info.sites.start = section_objs(info, "__dyndbg_codeorgs",
  2634							    sizeof(*mod->dyndbg_info.sites.start),
  2635							    &mod->dyndbg_info.sites.len);
  2636		/* these 2 sections must match */
  2637		if (!!mod->dyndbg_info.descs.start ^ !!mod->dyndbg_info.sites.start)
  2638			pr_err("module: %s missing one-of __dyndbg_{descriptors,codeorgs} sections\n", mod->name);
  2639		if (mod->dyndbg_info.descs.len != mod->dyndbg_info.sites.len)
> 2640			pr_err("module: %s section-pair lengths: %d != %d: __dyndbg_{descriptors,codeorgs}\n",
> 2641			       mod->dyndbg_info.descs.len != mod->dyndbg_info.sites.len, mod->name);
  2642	#endif
  2643	
  2644		return 0;
  2645	}
  2646	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
