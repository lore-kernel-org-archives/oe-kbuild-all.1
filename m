Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431692566
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 22:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762035757; cv=none; b=FXSMYq9id6DrE4ZwCTXDdYc8JguzgGZXnZUE0gGzeA9428Bgs6kCjt0UehCD3jBx4l3h9tTpNhIjqnJg7BF0D8CZ/IYw9zT7REDVdWrS1rY36GEKOSZoMaYColKqvnfLbI7Uvk3T12PGAaAGIHTdNnUTOeIuaV9dJz8N3ViLBug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762035757; c=relaxed/simple;
	bh=+O8rFjtZzTXvUSaALm5D5J6IRDz6gpB/pf9MV4bwFCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alTn92hqaFFbFICqihEFCnUdADxP2I7LXQXaOGxdE+F60nrVxM/70ubqMQ+bOqCbryQFqcvVARwi1kk+TrVZ9JHwAwCi6wT03z8JYblgbWLPjcZvxY0fRwMBuPFECqbHTFf257AwbZDvwh31OPGWjNLZ4zBxNMAvh6AdQDx9GU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YnsDiRcG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YnsDiRcG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762035755; x=1793571755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+O8rFjtZzTXvUSaALm5D5J6IRDz6gpB/pf9MV4bwFCA=;
  b=YnsDiRcGifHJWpSs7IULAUDCPVsljICZNlX968/Z2E8fJEWukTZ5ZSqp
   EiDp8uitLS3mvXe3bQS1Rv0jCFrW/bujnXH0emEtrnEPQqQcl1p5HctEz
   PE3w/t8PaL3H64b4mb3dZrXSDvKT4rbL39dA9IFk4gvII2dYFF+luAs3J
   5zsUSI1Ko3/2Of/6S8xep7rAbnA+Rvstczr5h/2/G/vVY8jF8SvL4eEHT
   zf9pRvQj03TJz8coDJ1VYwfAoA8CUA3Ha6ROB1472dRdDsHrgnWJy8OkT
   V6Ot0WuPlKNlVcA269NTpkWiZY5PWNcDRyLkDAqxs/BVwAr3wPdyPd4/+
   g==;
X-CSE-ConnectionGUID: 9qRvZlOCRGaVcIivlzSL+w==
X-CSE-MsgGUID: WQQH2MIDT7OLNnppELjywA==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="66778140"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="66778140"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 15:22:34 -0700
X-CSE-ConnectionGUID: VbNSCWaiST+7h15oeY8mxQ==
X-CSE-MsgGUID: fcISoJymTsa87Vq+y8qeag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="190617197"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2025 15:22:33 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFJzS-000OjA-25;
	Sat, 01 Nov 2025 22:22:30 +0000
Date: Sun, 2 Nov 2025 06:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-drm-fix 51/83] init/main.c:1142:4: error: call to
 undeclared function '__chkp_no_side_effects'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202511020610.7MLrAIWl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-drm-fix
head:   7c56937db9e56927f30d9fdecccb793062970841
commit: 2e269d22cc3745e6ec155def01e90aad73ac490b [51/83] no-side-h-func-calls
config: x86_64-randconfig-012-20251031 (https://download.01.org/0day-ci/archive/20251102/202511020610.7MLrAIWl-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251102/202511020610.7MLrAIWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511020610.7MLrAIWl-lkp@intel.com/

Note: the jimc/dd-drm-fix HEAD 7c56937db9e56927f30d9fdecccb793062970841 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> init/main.c:1142:4: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1142 |                         pr_debug("blacklisting initcall %s\n", str_entry);
         |                         ^
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:413:2: note: expanded from macro '__dynamic_func_call_cls'
     413 |         __chkp_no_side_effects(id)                              \
         |         ^
>> init/main.c:1142:4: error: expected ';' after expression
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:414:2: note: expanded from macro '__dynamic_func_call_cls'
     414 |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
         |         ^
   include/linux/dynamic_debug.h:351:2: note: expanded from macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     351 |         static struct _ddebug_site  __aligned(8)                \
         |         ^
>> init/main.c:1142:4: error: use of undeclared identifier '__UNIQUE_ID__ddebug739'
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:109:1: note: expanded from here
     109 | __UNIQUE_ID__ddebug739
         | ^
   init/main.c:1175:4: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1175 |                         pr_debug("initcall %s blacklisted\n", fn_name);
         |                         ^
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:413:2: note: expanded from macro '__dynamic_func_call_cls'
     413 |         __chkp_no_side_effects(id)                              \
         |         ^
   init/main.c:1175:4: error: expected ';' after expression
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:414:2: note: expanded from macro '__dynamic_func_call_cls'
     414 |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
         |         ^
   include/linux/dynamic_debug.h:351:2: note: expanded from macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     351 |         static struct _ddebug_site  __aligned(8)                \
         |         ^
>> init/main.c:1175:4: error: use of undeclared identifier '__UNIQUE_ID__ddebug741'
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:121:1: note: expanded from here
     121 | __UNIQUE_ID__ddebug741
         | ^
   init/main.c:1384:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1384 |         pr_debug("  with arguments:\n");
         |         ^
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:413:2: note: expanded from macro '__dynamic_func_call_cls'
     413 |         __chkp_no_side_effects(id)                              \
         |         ^
   init/main.c:1384:2: error: expected ';' after expression
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:414:2: note: expanded from macro '__dynamic_func_call_cls'
     414 |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
         |         ^
   include/linux/dynamic_debug.h:351:2: note: expanded from macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     351 |         static struct _ddebug_site  __aligned(8)                \
         |         ^
>> init/main.c:1384:2: error: use of undeclared identifier '__UNIQUE_ID__ddebug743'
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:148:1: note: expanded from here
     148 | __UNIQUE_ID__ddebug743
         | ^
   init/main.c:1386:3: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1386 |                 pr_debug("    %s\n", *p);
         |                 ^
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:413:2: note: expanded from macro '__dynamic_func_call_cls'
     413 |         __chkp_no_side_effects(id)                              \
         |         ^
   init/main.c:1386:3: error: expected ';' after expression
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:414:2: note: expanded from macro '__dynamic_func_call_cls'
     414 |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
         |         ^
   include/linux/dynamic_debug.h:351:2: note: expanded from macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     351 |         static struct _ddebug_site  __aligned(8)                \
         |         ^
>> init/main.c:1386:3: error: use of undeclared identifier '__UNIQUE_ID__ddebug745'
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:158:1: note: expanded from here
     158 | __UNIQUE_ID__ddebug745
         | ^
   init/main.c:1387:2: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1387 |         pr_debug("  with environment:\n");
         |         ^
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:413:2: note: expanded from macro '__dynamic_func_call_cls'
     413 |         __chkp_no_side_effects(id)                              \
         |         ^
   init/main.c:1387:2: error: expected ';' after expression
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:414:2: note: expanded from macro '__dynamic_func_call_cls'
     414 |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
         |         ^
   include/linux/dynamic_debug.h:351:2: note: expanded from macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     351 |         static struct _ddebug_site  __aligned(8)                \
         |         ^
>> init/main.c:1387:2: error: use of undeclared identifier '__UNIQUE_ID__ddebug747'
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:168:1: note: expanded from here
     168 | __UNIQUE_ID__ddebug747
         | ^
   init/main.c:1389:3: error: call to undeclared function '__chkp_no_side_effects'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1389 |                 pr_debug("    %s\n", *p);
         |                 ^
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:413:2: note: expanded from macro '__dynamic_func_call_cls'
     413 |         __chkp_no_side_effects(id)                              \
         |         ^
   init/main.c:1389:3: error: expected ';' after expression
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:441:2: note: expanded from macro '_dynamic_func_call_cls'
     441 |         __dynamic_func_call_cls(__UNIQUE_ID(_ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:414:2: note: expanded from macro '__dynamic_func_call_cls'
     414 |         DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);        \
         |         ^
   include/linux/dynamic_debug.h:351:2: note: expanded from macro 'DEFINE_DYNAMIC_DEBUG_METADATA_CLS'
     351 |         static struct _ddebug_site  __aligned(8)                \
         |         ^
>> init/main.c:1389:3: error: use of undeclared identifier '__UNIQUE_ID__ddebug749'
   include/linux/printk.h:638:2: note: expanded from macro 'pr_debug'
     638 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^
   include/linux/dynamic_debug.h:462:2: note: expanded from macro 'dynamic_pr_debug'
     462 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^
   include/linux/dynamic_debug.h:443:2: note: expanded from macro '_dynamic_func_call'
     443 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=0 to see all)
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:178:1: note: expanded from here
     178 | __UNIQUE_ID__ddebug749
         | ^
   18 errors generated.
..


vim +/__chkp_no_side_effects +1142 init/main.c

7b0b73d76651e5 Prarit Bhargava  2014-06-04  1132  
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1133  static int __init initcall_blacklist(char *str)
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1134  {
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1135  	char *str_entry;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1136  	struct blacklist_entry *entry;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1137  
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1138  	/* str argument is a comma-separated list of functions */
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1139  	do {
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1140  		str_entry = strsep(&str, ",");
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1141  		if (str_entry) {
7b0b73d76651e5 Prarit Bhargava  2014-06-04 @1142  			pr_debug("blacklisting initcall %s\n", str_entry);
c6f239796b55db Guo Weikang      2025-01-02  1143  			entry = memblock_alloc_or_panic(sizeof(*entry),
7e1c4e27928e5f Mike Rapoport    2018-10-30  1144  					       SMP_CACHE_BYTES);
c6f239796b55db Guo Weikang      2025-01-02  1145  			entry->buf = memblock_alloc_or_panic(strlen(str_entry) + 1,
7e1c4e27928e5f Mike Rapoport    2018-10-30  1146  						    SMP_CACHE_BYTES);
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1147  			strcpy(entry->buf, str_entry);
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1148  			list_add(&entry->next, &blacklisted_initcalls);
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1149  		}
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1150  	} while (str_entry);
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1151  
f9a40b08906583 Randy Dunlap     2022-03-23  1152  	return 1;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1153  }
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1154  
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1155  static bool __init_or_module initcall_blacklisted(initcall_t fn)
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1156  {
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1157  	struct blacklist_entry *entry;
c8cdd2be213f0f Rasmus Villemoes 2016-05-20  1158  	char fn_name[KSYM_SYMBOL_LEN];
0fd5ed8d897cff Rasmus Villemoes 2016-06-24  1159  	unsigned long addr;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1160  
c8cdd2be213f0f Rasmus Villemoes 2016-05-20  1161  	if (list_empty(&blacklisted_initcalls))
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1162  		return false;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1163  
0fd5ed8d897cff Rasmus Villemoes 2016-06-24  1164  	addr = (unsigned long) dereference_function_descriptor(fn);
0fd5ed8d897cff Rasmus Villemoes 2016-06-24  1165  	sprint_symbol_no_offset(fn_name, addr);
c8cdd2be213f0f Rasmus Villemoes 2016-05-20  1166  
841c06d71e25a4 Prarit Bhargava  2016-08-02  1167  	/*
841c06d71e25a4 Prarit Bhargava  2016-08-02  1168  	 * fn will be "function_name [module_name]" where [module_name] is not
841c06d71e25a4 Prarit Bhargava  2016-08-02  1169  	 * displayed for built-in init functions.  Strip off the [module_name].
841c06d71e25a4 Prarit Bhargava  2016-08-02  1170  	 */
841c06d71e25a4 Prarit Bhargava  2016-08-02  1171  	strreplace(fn_name, ' ', '\0');
841c06d71e25a4 Prarit Bhargava  2016-08-02  1172  
e6fd1fb3b5b58f Geliang Tang     2016-03-15  1173  	list_for_each_entry(entry, &blacklisted_initcalls, next) {
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1174  		if (!strcmp(fn_name, entry->buf)) {
7b0b73d76651e5 Prarit Bhargava  2014-06-04 @1175  			pr_debug("initcall %s blacklisted\n", fn_name);
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1176  			return true;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1177  		}
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1178  	}
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1179  
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1180  	return false;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1181  }
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1182  #else
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1183  static int __init initcall_blacklist(char *str)
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1184  {
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1185  	pr_warn("initcall_blacklist requires CONFIG_KALLSYMS\n");
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1186  	return 0;
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1187  }
7b0b73d76651e5 Prarit Bhargava  2014-06-04  1188  

:::::: The code at line 1142 was first introduced by commit
:::::: 7b0b73d76651e5f88c88b76efa18d719f832bf6f init/main.c: add initcall_blacklist kernel parameter

:::::: TO: Prarit Bhargava <prarit@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
