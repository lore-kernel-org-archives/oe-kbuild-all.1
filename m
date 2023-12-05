Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E7515EBC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 07:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRBIJu/e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701760692; x=1733296692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cjnGOZOte1UBYYaRmDetD98r+hjV2T7R/r9+2UpDPcw=;
  b=IRBIJu/eG4hMjIiwCGNe8qgVb94TlNY5V9KgHLoB/5Hg71i5OiiI7mmS
   6Zjr7fFWoFZpDe4vuQmoSty2uUNheWbaRGmdvzr4qgLyhqu9nHWIdBI2y
   N1G62P+AX7B26OM5fJVMXNhfxgIIaTsjiX+WlPajXTN5aQMix2CHFE1bf
   4HYvhp9AvCTVAKgk1V0R0PnmCXN+QtIO5d7ASJPxlK0FHo43NsKV5gIYS
   /QyNg7vRFciLLYScE+EikxHK9ihGvhTd7zcMGf3Ahpqvo0N6VOza9n9oB
   1KJ1bNP4hcrnFTOjHfdZQzBlnC6S7u9vXSHEXWGY80iBOjvW5W4NwPfI3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="7195034"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="7195034"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 23:18:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="894278127"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="894278127"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 04 Dec 2023 23:18:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAPh0-0008UY-2x;
	Tue, 05 Dec 2023 07:18:06 +0000
Date: Tue, 5 Dec 2023 15:17:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:lukas-v2.1 23/26] lib/dynamic_debug.c:631:7: warning: no
 previous prototype for '__skip_spaces'
Message-ID: <202312051528.CACzqGc3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git lukas-v2.1
head:   20d113eb6f9ac604fce8e97eefae3b07e133d148
commit: bd5e2662b6cfb19528fe8c93525a6058fa235049 [23/26] dyndbg: __skip_spaces
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20231205/202312051528.CACzqGc3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051528.CACzqGc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051528.CACzqGc3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:17,
                    from lib/dynamic_debug.c:16:
   include/net/inet_connection_sock.h: In function 'inet_csk_clear_xmit_timer':
   include/linux/dynamic_debug.h:224:28: error: 'struct _ddebug' has no member named 'flags'
     224 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:242:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     242 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:267:9: note: in expansion of macro '__dynamic_func_call_cls'
     267 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls'
     269 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:288:9: note: in expansion of macro '_dynamic_func_call'
     288 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   include/net/inet_connection_sock.h:211:17: note: in expansion of macro 'pr_debug'
     211 |                 pr_debug("inet_csk BUG: unknown timer value\n");
         |                 ^~~~~~~~
   include/net/inet_connection_sock.h: In function 'inet_csk_reset_xmit_timer':
   include/linux/dynamic_debug.h:224:28: error: 'struct _ddebug' has no member named 'flags'
     224 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:242:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     242 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:267:9: note: in expansion of macro '__dynamic_func_call_cls'
     267 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls'
     269 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:288:9: note: in expansion of macro '_dynamic_func_call'
     288 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   include/net/inet_connection_sock.h:225:17: note: in expansion of macro 'pr_debug'
     225 |                 pr_debug("reset_xmit_timer: sk=%p %d when=0x%lx, caller=%p\n",
         |                 ^~~~~~~~
   include/linux/dynamic_debug.h:224:28: error: 'struct _ddebug' has no member named 'flags'
     224 |         unlikely(descriptor.flags & _DPRINTK_FLAGS_ENABLED)
         |                            ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/dynamic_debug.h:242:13: note: in expansion of macro 'DYNAMIC_DEBUG_BRANCH'
     242 |         if (DYNAMIC_DEBUG_BRANCH(id))                           \
         |             ^~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:267:9: note: in expansion of macro '__dynamic_func_call_cls'
     267 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:269:9: note: in expansion of macro '_dynamic_func_call_cls'
     269 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:288:9: note: in expansion of macro '_dynamic_func_call'
     288 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:579:9: note: in expansion of macro 'dynamic_pr_debug'
     579 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   include/net/inet_connection_sock.h:240:17: note: in expansion of macro 'pr_debug'
     240 |                 pr_debug("inet_csk BUG: unknown timer value\n");
         |                 ^~~~~~~~
   lib/dynamic_debug.c: At top level:
   lib/dynamic_debug.c:207:7: warning: no previous prototype for 'show_T_args' [-Wmissing-prototypes]
     207 | char *show_T_args(struct dd_ctrl *ctrl, char *p)
         |       ^~~~~~~~~~~
>> lib/dynamic_debug.c:631:7: warning: no previous prototype for '__skip_spaces' [-Wmissing-prototypes]
     631 | char *__skip_spaces(const char *str)
         |       ^~~~~~~~~~~~~


vim +/__skip_spaces +631 lib/dynamic_debug.c

   630	
 > 631	char *__skip_spaces(const char *str)
   632	{
   633		str = skip_spaces(str);
   634		if (*str == ',')
   635			str = skip_spaces(++str);
   636		return (char *)str;
   637	}
   638	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
