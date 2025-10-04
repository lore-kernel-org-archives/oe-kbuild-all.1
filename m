Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91DB270552
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Oct 2025 02:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759543226; cv=none; b=dyi8DY7CFF1xaueVvcEi+0qzqQDnS+rpwq/J0yNAfA1FYqvBaHd3dbBGwY1O+VHcp2YABZquhp/1OF3F0QCmtDwPpCT76nwZ1q/R0+8TEww/q+joh26BTonVTRYlYGfxGAp14XOuugcaBsaUdwIX1F1sAhFyG83vNpUMzTeHez8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759543226; c=relaxed/simple;
	bh=cNqkmByI+gN0OsNfgDWGP8vKVI+QTc/J548N+NxsC2c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmhqmsNZekk6VV32/3Cl+ouGyNKON40C64ANckDOzcL3/7BrqLwh65aZQrLDEAcyTtB9Coqwg5qDcMCew8woX+rq3BkzYvjBm/v8ifzodx+P4GM3wqNa+DWcGAwS3xm2HgclmUvV9LhqZAwbDSPicFY4bW14cYS9h6HluRbndrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y/xhEc3Z; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y/xhEc3Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759543225; x=1791079225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=cNqkmByI+gN0OsNfgDWGP8vKVI+QTc/J548N+NxsC2c=;
  b=Y/xhEc3ZY0Wxsi99YuKgVu/XfiZZs63mxjg2Qk9Vrvkyi0S5kcvKeEeK
   s1zDzKokohP2XjP8om8aLpEqZt+LyGQQoFJhGzHfxCKIXG1XULMZbcvTg
   zgQQwJzNagFM5SHx9jOaVlcFFTmPHy1pk4Qtdqx8OJRigRZ5JRYpQSJ23
   rNQsSIPmfPJ4R3rGuxHy2Ithh0+A6MMkErKjgiOYiHXmwqOc6nJouwoN1
   hl39jB3lZ9Mi67yjbQpcamFoao2JBr/aOHFo/Sdbsk1huCcjfegq4Rphn
   bD/dgUKHKSKWTb2x0oF+dwovunFB/p/FcZOpSlkJH2U83lNxfxVuHmovb
   w==;
X-CSE-ConnectionGUID: i7v9EvPnSwapNBh1Iyi9lQ==
X-CSE-MsgGUID: G4cH8w+5SlK6EnBrY8p/jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="61858739"
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="61858739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 19:00:24 -0700
X-CSE-ConnectionGUID: YmZqrBX2SO2lLyQ6DsPD0g==
X-CSE-MsgGUID: CuM1XgN5SIumPYQbG4cLug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,314,1751266800"; 
   d="scan'208";a="183701864"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Oct 2025 19:00:23 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4rZM-00051T-0i;
	Sat, 04 Oct 2025 02:00:20 +0000
Date: Sat, 4 Oct 2025 09:59:34 +0800
From: kernel test robot <lkp@intel.com>
To: Evangelos Petrongonas <epetron@amazon.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 08/13] pci: Save only spec-defined configuration space
Message-ID: <202510040922.VjbvsiO2-lkp@intel.com>
References: <93623324232f4ec4dcda830d497ac2890b19215f.1759312886.git.epetron@amazon.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <93623324232f4ec4dcda830d497ac2890b19215f.1759312886.git.epetron@amazon.de>

Hi Evangelos,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/next]
[also build test WARNING on pci/for-linus awilliam-vfio/next rafael-pm/linux-next rafael-pm/bleeding-edge linus/master awilliam-vfio/for-linus v6.17 next-20251003]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Evangelos-Petrongonas/pci-pcsc-Add-plumbing-for-the-PCI-Configuration-Space-Cache-PCSC/20251003-170925
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/93623324232f4ec4dcda830d497ac2890b19215f.1759312886.git.epetron%40amazon.de
patch subject: [RFC PATCH 08/13] pci: Save only spec-defined configuration space
config: arm64-randconfig-002-20251004 (https://download.01.org/0day-ci/archive/20251004/202510040922.VjbvsiO2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040922.VjbvsiO2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040922.VjbvsiO2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/printk.h:623,
                    from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from arch/arm64/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:13,
                    from drivers/pci/pci.c:11:
   drivers/pci/pci.c: In function 'pci_save_state':
>> include/linux/dynamic_debug.h:273:26: warning: array subscript 52 is above array bounds of 'u32[16]' {aka 'unsigned int[16]'} [-Warray-bounds]
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
                             ^
   include/linux/dynamic_debug.h:224:3: note: in definition of macro '__dynamic_func_call_cls'
      func(&id, ##__VA_ARGS__);   \
      ^~~~
   include/linux/dynamic_debug.h:250:2: note: in expansion of macro '_dynamic_func_call_cls'
     _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
     ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   include/linux/pci.h:2790:36: note: in expansion of macro 'dev_dbg'
    #define pci_dbg(pdev, fmt, arg...) dev_dbg(&(pdev)->dev, fmt, ##arg)
                                       ^~~~~~~
   drivers/pci/pci.c:1793:3: note: in expansion of macro 'pci_dbg'
      pci_dbg(dev,
      ^~~~~~~
>> include/linux/dynamic_debug.h:273:26: warning: array subscript 52 is above array bounds of 'u32[16]' {aka 'unsigned int[16]'} [-Warray-bounds]
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
                             ^
   include/linux/dynamic_debug.h:224:3: note: in definition of macro '__dynamic_func_call_cls'
      func(&id, ##__VA_ARGS__);   \
      ^~~~
   include/linux/dynamic_debug.h:250:2: note: in expansion of macro '_dynamic_func_call_cls'
     _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
     ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   include/linux/pci.h:2790:36: note: in expansion of macro 'dev_dbg'
    #define pci_dbg(pdev, fmt, arg...) dev_dbg(&(pdev)->dev, fmt, ##arg)
                                       ^~~~~~~
   drivers/pci/pci.c:1769:3: note: in expansion of macro 'pci_dbg'
      pci_dbg(dev,
      ^~~~~~~
   include/linux/dynamic_debug.h:273:26: warning: array subscript 60 is above array bounds of 'u32[16]' {aka 'unsigned int[16]'} [-Warray-bounds]
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
                             ^
   include/linux/dynamic_debug.h:224:3: note: in definition of macro '__dynamic_func_call_cls'
      func(&id, ##__VA_ARGS__);   \
      ^~~~
   include/linux/dynamic_debug.h:250:2: note: in expansion of macro '_dynamic_func_call_cls'
     _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:273:2: note: in expansion of macro '_dynamic_func_call'
     _dynamic_func_call(fmt, __dynamic_dev_dbg,   \
     ^~~~~~~~~~~~~~~~~~
   include/linux/dev_printk.h:165:2: note: in expansion of macro 'dynamic_dev_dbg'
     dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   include/linux/pci.h:2790:36: note: in expansion of macro 'dev_dbg'
    #define pci_dbg(pdev, fmt, arg...) dev_dbg(&(pdev)->dev, fmt, ##arg)
                                       ^~~~~~~
   drivers/pci/pci.c:1776:3: note: in expansion of macro 'pci_dbg'
      pci_dbg(dev,
      ^~~~~~~


vim +273 include/linux/dynamic_debug.h

9049fc745300c5 Jason Baron      2016-08-03  209  
ca90fca7f7b518 Jim Cromie       2022-09-04  210  /*
ca90fca7f7b518 Jim Cromie       2022-09-04  211   * Factory macros: ($prefix)dynamic_func_call($suffix)
ca90fca7f7b518 Jim Cromie       2022-09-04  212   *
ca90fca7f7b518 Jim Cromie       2022-09-04  213   * Lower layer (with __ prefix) gets the callsite metadata, and wraps
ca90fca7f7b518 Jim Cromie       2022-09-04  214   * the func inside a debug-branch/static-key construct.  Upper layer
ca90fca7f7b518 Jim Cromie       2022-09-04  215   * (with _ prefix) does the UNIQUE_ID once, so that lower can ref the
ca90fca7f7b518 Jim Cromie       2022-09-04  216   * name/label multiple times, and tie the elements together.
ca90fca7f7b518 Jim Cromie       2022-09-04  217   * Multiple flavors:
ca90fca7f7b518 Jim Cromie       2022-09-04  218   * (|_cls):	adds in _DPRINT_CLASS_DFLT as needed
ca90fca7f7b518 Jim Cromie       2022-09-04  219   * (|_no_desc):	former gets callsite descriptor as 1st arg (for prdbgs)
ca90fca7f7b518 Jim Cromie       2022-09-04  220   */
ca90fca7f7b518 Jim Cromie       2022-09-04  221  #define __dynamic_func_call_cls(id, cls, fmt, func, ...) do {	\
ca90fca7f7b518 Jim Cromie       2022-09-04  222  	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);	\
47cdd64be4832f Rasmus Villemoes 2019-03-07  223  	if (DYNAMIC_DEBUG_BRANCH(id))				\
47cdd64be4832f Rasmus Villemoes 2019-03-07  224  		func(&id, ##__VA_ARGS__);			\
e9d376f0fa66bd Jason Baron      2009-02-05  225  } while (0)
ca90fca7f7b518 Jim Cromie       2022-09-04  226  #define __dynamic_func_call(id, fmt, func, ...)				\
ca90fca7f7b518 Jim Cromie       2022-09-04  227  	__dynamic_func_call_cls(id, _DPRINTK_CLASS_DFLT, fmt,		\
ca90fca7f7b518 Jim Cromie       2022-09-04  228  				func, ##__VA_ARGS__)
e9d376f0fa66bd Jason Baron      2009-02-05  229  
ca90fca7f7b518 Jim Cromie       2022-09-04  230  #define __dynamic_func_call_cls_no_desc(id, cls, fmt, func, ...) do {	\
ca90fca7f7b518 Jim Cromie       2022-09-04  231  	DEFINE_DYNAMIC_DEBUG_METADATA_CLS(id, cls, fmt);		\
47cdd64be4832f Rasmus Villemoes 2019-03-07  232  	if (DYNAMIC_DEBUG_BRANCH(id))					\
47cdd64be4832f Rasmus Villemoes 2019-03-07  233  		func(__VA_ARGS__);					\
e9d376f0fa66bd Jason Baron      2009-02-05  234  } while (0)
ca90fca7f7b518 Jim Cromie       2022-09-04  235  #define __dynamic_func_call_no_desc(id, fmt, func, ...)			\
ca90fca7f7b518 Jim Cromie       2022-09-04  236  	__dynamic_func_call_cls_no_desc(id, _DPRINTK_CLASS_DFLT,	\
ca90fca7f7b518 Jim Cromie       2022-09-04  237  					fmt, func, ##__VA_ARGS__)
e9d376f0fa66bd Jason Baron      2009-02-05  238  
47cdd64be4832f Rasmus Villemoes 2019-03-07  239  /*
47cdd64be4832f Rasmus Villemoes 2019-03-07  240   * "Factory macro" for generating a call to func, guarded by a
e5ebffe18e5add Jim Cromie       2020-07-19  241   * DYNAMIC_DEBUG_BRANCH. The dynamic debug descriptor will be
47cdd64be4832f Rasmus Villemoes 2019-03-07  242   * initialized using the fmt argument. The function will be called with
47cdd64be4832f Rasmus Villemoes 2019-03-07  243   * the address of the descriptor as first argument, followed by all
47cdd64be4832f Rasmus Villemoes 2019-03-07  244   * the varargs. Note that fmt is repeated in invocations of this
47cdd64be4832f Rasmus Villemoes 2019-03-07  245   * macro.
47cdd64be4832f Rasmus Villemoes 2019-03-07  246   */
ca90fca7f7b518 Jim Cromie       2022-09-04  247  #define _dynamic_func_call_cls(cls, fmt, func, ...)			\
ca90fca7f7b518 Jim Cromie       2022-09-04  248  	__dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
47cdd64be4832f Rasmus Villemoes 2019-03-07  249  #define _dynamic_func_call(fmt, func, ...)				\
ca90fca7f7b518 Jim Cromie       2022-09-04  250  	_dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
ca90fca7f7b518 Jim Cromie       2022-09-04  251  
47cdd64be4832f Rasmus Villemoes 2019-03-07  252  /*
47cdd64be4832f Rasmus Villemoes 2019-03-07  253   * A variant that does the same, except that the descriptor is not
47cdd64be4832f Rasmus Villemoes 2019-03-07  254   * passed as the first argument to the function; it is only called
47cdd64be4832f Rasmus Villemoes 2019-03-07  255   * with precisely the macro's varargs.
47cdd64be4832f Rasmus Villemoes 2019-03-07  256   */
ca90fca7f7b518 Jim Cromie       2022-09-04  257  #define _dynamic_func_call_cls_no_desc(cls, fmt, func, ...)		\
ca90fca7f7b518 Jim Cromie       2022-09-04  258  	__dynamic_func_call_cls_no_desc(__UNIQUE_ID(ddebug), cls, fmt,	\
ca90fca7f7b518 Jim Cromie       2022-09-04  259  					func, ##__VA_ARGS__)
47cdd64be4832f Rasmus Villemoes 2019-03-07  260  #define _dynamic_func_call_no_desc(fmt, func, ...)			\
ca90fca7f7b518 Jim Cromie       2022-09-04  261  	_dynamic_func_call_cls_no_desc(_DPRINTK_CLASS_DFLT, fmt,	\
ca90fca7f7b518 Jim Cromie       2022-09-04  262  				       func, ##__VA_ARGS__)
ca90fca7f7b518 Jim Cromie       2022-09-04  263  
ca90fca7f7b518 Jim Cromie       2022-09-04  264  #define dynamic_pr_debug_cls(cls, fmt, ...)				\
ca90fca7f7b518 Jim Cromie       2022-09-04  265  	_dynamic_func_call_cls(cls, fmt, __dynamic_pr_debug,		\
ca90fca7f7b518 Jim Cromie       2022-09-04  266  			   pr_fmt(fmt), ##__VA_ARGS__)
47cdd64be4832f Rasmus Villemoes 2019-03-07  267  
47cdd64be4832f Rasmus Villemoes 2019-03-07  268  #define dynamic_pr_debug(fmt, ...)				\
47cdd64be4832f Rasmus Villemoes 2019-03-07  269  	_dynamic_func_call(fmt, __dynamic_pr_debug,		\
47cdd64be4832f Rasmus Villemoes 2019-03-07  270  			   pr_fmt(fmt), ##__VA_ARGS__)
47cdd64be4832f Rasmus Villemoes 2019-03-07  271  
47cdd64be4832f Rasmus Villemoes 2019-03-07  272  #define dynamic_dev_dbg(dev, fmt, ...)				\
47cdd64be4832f Rasmus Villemoes 2019-03-07 @273  	_dynamic_func_call(fmt, __dynamic_dev_dbg, 		\
47cdd64be4832f Rasmus Villemoes 2019-03-07  274  			   dev, fmt, ##__VA_ARGS__)
47cdd64be4832f Rasmus Villemoes 2019-03-07  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
