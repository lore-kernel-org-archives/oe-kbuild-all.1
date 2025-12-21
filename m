Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3FB21CC4F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766307316; cv=none; b=EhecUQ+uuXy8+O66l1vgDgbu8O+jPv/N29p/5607kcgQV+6aeRXUBxaSOirEE9AO7jKNSYIBLWuRFDBvnElQHihy2IQUo7+41OWQKHOWIN6dtLgjam1vYIvjkFo/1NOwvG9LHUxUn0LXbJBmAgPGXBe1ov2sBqkUdUQ90nogPHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766307316; c=relaxed/simple;
	bh=+emYxEidIQvWgfcFN/NOCf1Vx0yCO7tiQbC9zsSXSas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lbrta9KJnHQhPjrcEiRFTXsdCeYaba0FGekCLkuPx8LUdstLT4uBbxyWuE1uN21VsSkwoYt71MiUwF7HYtcoltwVgPxSQ5dm2OlbSa5IFpl9JyGKlVTxfo7irxtQeZ0z/QkM9Dm05VBxrzV29olR4xmkAGYh5jSvSOanjtGhGRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crgIVWUI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crgIVWUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766307315; x=1797843315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+emYxEidIQvWgfcFN/NOCf1Vx0yCO7tiQbC9zsSXSas=;
  b=crgIVWUIVj5JAH8iZ7buI2Ff8DegtPJmT97YxAGNS8uin1epsGKoLLT1
   XGnXsPV+/XEnM4PfPoAHhTMImRcxOfzMQrhvHgrTrYQx9U0w2wjnLZdeL
   7f6E+x3iIu5K0/AZvHLVU9fav61y1d8qlpgYVLDTi2PUlP/c+K50QY0WA
   0XFQe8uFYyL2yDXIXz5vpYSmNOh4Qq0dOedHal9rZdh527r/34nnuMbMa
   oSViV/dbm31BODFVZz0vKnoH2QVq73tEufQTlTYiimo8cItcxAVl3HMeM
   hFX/9tMa+PqFfrVEnFDnlSG1nxTEwV4WPQ1po2Yh1VEMgZ8zEPcV7q0Go
   g==;
X-CSE-ConnectionGUID: 5t3mDPSASge4PgDH3rZCYg==
X-CSE-MsgGUID: OQnltLIqSoetyGVN+J3z/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68246895"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68246895"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 00:55:05 -0800
X-CSE-ConnectionGUID: 6oqjE0THTk+vE6gsuGYiow==
X-CSE-MsgGUID: eDDcN4ykToi7acgcpzVekg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198894164"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Dec 2025 00:55:03 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXFDR-000000005Td-0oTv;
	Sun, 21 Dec 2025 08:55:01 +0000
Date: Sun, 21 Dec 2025 16:54:06 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:pinctrl 7/14] include/linux/compiler.h:71:2: error: expected
 identifier or '(' before ')' token
Message-ID: <202512211836.UQzkULP6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git pinctrl
head:   a8805fb8a49841ef67f240537e28ed40ce539661
commit: 596864db6236b48f63f554719d00841b8c5ff80c [7/14] pinctrl: pinconf-generic: perform basic checks on pincfg properties
config: i386-buildonly-randconfig-003-20251221 (https://download.01.org/0day-ci/archive/20251221/202512211836.UQzkULP6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512211836.UQzkULP6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512211836.UQzkULP6-lkp@intel.com/

Note: the conor/pinctrl HEAD a8805fb8a49841ef67f240537e28ed40ce539661 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   drivers/pinctrl/pinconf-generic.c: In function 'parse_dt_cfg':
   drivers/pinctrl/pinconf-generic.c:226:16: warning: variable 'test' set but not used [-Wunused-but-set-variable]
     226 |         int i, test;
         |                ^~~~
   drivers/pinctrl/pinconf-generic.c: In function 'pinconf_generic_parse_dt_config':
   drivers/pinctrl/pinconf-generic.c:392:1: error: version control conflict marker in file
     392 | <<<<<<< HEAD
         | ^~~~~~~
   drivers/pinctrl/pinconf-generic.c:395:1: error: version control conflict marker in file
     395 | =======
         | ^~~~~~~
   drivers/pinctrl/pinconf-generic.c:407:45: error: expected statement before ')' token
     407 |                 pctldev->desc->custom_params)
         |                                             ^
   drivers/pinctrl/pinconf-generic.c:412:1: error: version control conflict marker in file
     412 | =======
         | ^~~~~~~
   drivers/pinctrl/pinconf-generic.c: At top level:
   drivers/pinctrl/pinconf-generic.c:419:9: warning: data definition has no type or storage class
     419 |         ret = 0;
         |         ^~~
   drivers/pinctrl/pinconf-generic.c:419:9: error: type defaults to 'int' in declaration of 'ret' [-Wimplicit-int]
   drivers/pinctrl/pinconf-generic.c:420:1: error: version control conflict marker in file
     420 | >>>>>>> e296cfc3eca6 (pinctrl: pinconf-generic: perform basic checks on pincfg properties)
         | ^~~~~~~
   In file included from include/linux/array_size.h:5,
                    from drivers/pinctrl/pinconf-generic.c:13:
>> include/linux/compiler.h:71:2: error: expected identifier or '(' before ')' token
      71 | })
         |  ^
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/pinctrl/pinconf-generic.c:423:9: note: in expansion of macro 'if'
     423 |         if (ncfg == 0) {
         |         ^~
   drivers/pinctrl/pinconf-generic.c:433:9: warning: data definition has no type or storage class
     433 |         *configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
         |         ^
   drivers/pinctrl/pinconf-generic.c:433:10: error: type defaults to 'int' in declaration of 'configs' [-Wimplicit-int]
     433 |         *configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
         |          ^~~~~~~
   In file included from include/linux/percpu.h:5,
                    from arch/x86/include/asm/msr.h:16,
                    from arch/x86/include/asm/tsc.h:11,
                    from arch/x86/include/asm/timex.h:6,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/debugfs.h:15,
                    from drivers/pinctrl/pinconf-generic.c:14:
   include/linux/alloc_tag.h:263:1: error: braced-group within expression allowed only inside a function
     263 | ({                                                                      \
         | ^
   include/linux/string.h:305:25: note: in expansion of macro 'alloc_hooks'
     305 | #define kmemdup(...)    alloc_hooks(kmemdup_noprof(__VA_ARGS__))
         |                         ^~~~~~~~~~~
   drivers/pinctrl/pinconf-generic.c:433:20: note: in expansion of macro 'kmemdup'
     433 |         *configs = kmemdup(cfg, ncfg * sizeof(unsigned long), GFP_KERNEL);
         |                    ^~~~~~~
>> include/linux/compiler.h:55:23: error: expected identifier or '(' before 'if'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                       ^~
   drivers/pinctrl/pinconf-generic.c:434:9: note: in expansion of macro 'if'
     434 |         if (!*configs) {
         |         ^~
>> include/linux/compiler.h:71:2: error: expected identifier or '(' before ')' token
      71 | })
         |  ^
   include/linux/compiler.h:57:69: note: in expansion of macro '__trace_if_value'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                                     ^~~~~~~~~~~~~~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   drivers/pinctrl/pinconf-generic.c:434:9: note: in expansion of macro 'if'
     434 |         if (!*configs) {
         |         ^~
   drivers/pinctrl/pinconf-generic.c:439:9: warning: data definition has no type or storage class
     439 |         *nconfigs = ncfg;
         |         ^
   drivers/pinctrl/pinconf-generic.c:439:10: error: type defaults to 'int' in declaration of 'nconfigs' [-Wimplicit-int]
     439 |         *nconfigs = ncfg;
         |          ^~~~~~~~
   drivers/pinctrl/pinconf-generic.c:439:21: error: 'ncfg' undeclared here (not in a function)
     439 |         *nconfigs = ncfg;
         |                     ^~~~
   drivers/pinctrl/pinconf-generic.c:441:4: error: expected '=', ',', ';', 'asm' or '__attribute__' before ':' token
     441 | out:
         |    ^
   drivers/pinctrl/pinconf-generic.c:443:9: error: expected identifier or '(' before 'return'
     443 |         return ret;
         |         ^~~~~~
   drivers/pinctrl/pinconf-generic.c:444:1: error: expected identifier or '(' before '}' token
     444 | }
         | ^
   drivers/pinctrl/pinconf-generic.c: In function 'pinconf_generic_parse_dt_config':
   drivers/pinctrl/pinconf-generic.c:417:9: warning: control reaches end of non-void function [-Wreturn-type]
     417 |         }
         |         ^


vim +71 include/linux/compiler.h

2bcd521a684cc9 Steven Rostedt 2008-11-21  49  
2bcd521a684cc9 Steven Rostedt 2008-11-21  50  #ifdef CONFIG_PROFILE_ALL_BRANCHES
2bcd521a684cc9 Steven Rostedt 2008-11-21  51  /*
2bcd521a684cc9 Steven Rostedt 2008-11-21  52   * "Define 'is'", Bill Clinton
2bcd521a684cc9 Steven Rostedt 2008-11-21  53   * "Define 'if'", Steven Rostedt
2bcd521a684cc9 Steven Rostedt 2008-11-21  54   */
a15fd609ad53a6 Linus Torvalds 2019-03-20 @55  #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
a15fd609ad53a6 Linus Torvalds 2019-03-20  56  
a15fd609ad53a6 Linus Torvalds 2019-03-20  57  #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
a15fd609ad53a6 Linus Torvalds 2019-03-20  58  
a15fd609ad53a6 Linus Torvalds 2019-03-20  59  #define __trace_if_value(cond) ({			\
2bcd521a684cc9 Steven Rostedt 2008-11-21  60  	static struct ftrace_branch_data		\
e04462fb82f8dd Miguel Ojeda   2018-09-03  61  		__aligned(4)				\
33def8498fdde1 Joe Perches    2020-10-21  62  		__section("_ftrace_branch")		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  63  		__if_trace = {				\
2bcd521a684cc9 Steven Rostedt 2008-11-21  64  			.func = __func__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  65  			.file = __FILE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  66  			.line = __LINE__,		\
2bcd521a684cc9 Steven Rostedt 2008-11-21  67  		};					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  68  	(cond) ?					\
a15fd609ad53a6 Linus Torvalds 2019-03-20  69  		(__if_trace.miss_hit[1]++,1) :		\
a15fd609ad53a6 Linus Torvalds 2019-03-20  70  		(__if_trace.miss_hit[0]++,0);		\
a15fd609ad53a6 Linus Torvalds 2019-03-20 @71  })
a15fd609ad53a6 Linus Torvalds 2019-03-20  72  

:::::: The code at line 71 was first introduced by commit
:::::: a15fd609ad53a631a927c6680e8fb606f42a712b tracing: Simplify "if" macro code

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
