Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0D347B432
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 16:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785861627; cv=none; b=gVbuehuHzvxSn8lrmTIyLyS0J2Fo21O3+Fvl+wXegyWVwNRtRXaPbh2xgtGyhXN/qm7axt9pTFi01U5OA25isTv/rp7nLuxqYNv+bKz1wBXNo3BfVrZk95ZARug1k4uNz+MpktRgFuUuxnpd2g6JYiDzJSiBpok6hI1Myz4fzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785861627; c=relaxed/simple;
	bh=+hPm6xBlAnx14pJOylO9qHi/O+qokNcWvrOQ+DHNT5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=IijNaU+KKvcghZsdNUSK0BSZkFqOd4F36E/90RPAAVyQ/41gEsmcYKKe6IrO8PTTSiyko88LV9qLWAMSimv0sWn4rRxis9pv7NMlvGWoGdxQ6UPQoDqcHhBv4xEQNu3jy8chwkUa34ftnVKNxCPzIH7oDZfsb0mHXXBd/43Lv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lxo5ppzx; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lxo5ppzx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785861613; x=1817397613;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hPm6xBlAnx14pJOylO9qHi/O+qokNcWvrOQ+DHNT5U=;
  b=lxo5ppzxFtmFcMbvU4EDHx7e26JXG0265motCIqOTAZBwIuESpQvYOlG
   6/aXMIQuLuAApLS4j1rvFF1rO2cgsbRgNCax56KIO1BdxnckpV5OXjUPQ
   T5DNje/5QftRI6V7QeZAeR56hEhlGN7jt0gxJqSmFxVzVcOkPJHn1zdtg
   NPZj+rEIZWlAh6FAWRsnAgJ2dE7JfP+uj6yUiVZc1FLi0xtl7/TX11B24
   MUMM1/BayGTVtsjWNUya7/XcBP7XVcmYfgdoJ/h954mRHX4+Nk5dI/tPZ
   gte0qFZKjSxr7GDFupngvp7gGGqIcH49eI0RHhUQWJtTRM7yadbhsHm+D
   A==;
X-CSE-ConnectionGUID: X59+56QXR1e7RBbL02/tQw==
X-CSE-MsgGUID: e/MreXTcR7u309GGMmFI7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="97577932"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="97577932"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 09:40:09 -0700
X-CSE-ConnectionGUID: NhfjER5/Spe/tBOPsFsEaQ==
X-CSE-MsgGUID: z4QgQdp6SeuY5rp/gApFAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; 
   d="scan'208";a="257677888"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Aug 2026 09:39:30 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrIAn-00000000AEL-3zyG;
	Tue, 04 Aug 2026 16:39:25 +0000
Date: Wed, 05 Aug 2026 00:39:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
 =?utf-8?Q?"=C5=81ukasz?= Bartosik" <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-go 48/59] lib/dynamic_debug.c:297:48: error:
 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
Message-ID: <202608050001.YJD5ca4x-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-shrink-go
head:   7bb5af008fa5bfb055e0dd2b34a688b094890c76
commit: cfa6f73e601bea4f41eb0a637c9baa23eefd545e [48/59] dyndbg: prep to isolate 3 repetetive fields
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260805/202608050001.YJD5ca4x-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608050001.YJD5ca4x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608050001.YJD5ca4x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/powerpc/include/asm/bug.h:116,
                    from include/linux/bug.h:5,
                    from include/linux/instrumented.h:10,
                    from include/asm-generic/bitops/instrumented-atomic.h:14,
                    from arch/powerpc/include/asm/bitops.h:321,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c: In function 'ddebug_match_desc':
>> lib/dynamic_debug.c:297:48: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
     297 |                                            dp->filename ? dp->filename : "?",
         |                                                ^~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:705:17: note: in expansion of macro 'printk'
     705 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:719:9: note: in expansion of macro 'printk_ratelimited'
     719 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:296:25: note: in expansion of macro 'pr_err_ratelimited'
     296 |                         pr_err_ratelimited("ddebug: NULL format string at %s:%s:%u\n",
         |                         ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:297:63: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
     297 |                                            dp->filename ? dp->filename : "?",
         |                                                               ^~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:705:17: note: in expansion of macro 'printk'
     705 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:719:9: note: in expansion of macro 'printk_ratelimited'
     719 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:296:25: note: in expansion of macro 'pr_err_ratelimited'
     296 |                         pr_err_ratelimited("ddebug: NULL format string at %s:%s:%u\n",
         |                         ^~~~~~~~~~~~~~~~~~
>> lib/dynamic_debug.c:298:48: error: 'struct _ddebug' has no member named 'function'; did you mean '_function'?
     298 |                                            dp->function ? dp->function : "?",
         |                                                ^~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:705:17: note: in expansion of macro 'printk'
     705 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:719:9: note: in expansion of macro 'printk_ratelimited'
     719 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:296:25: note: in expansion of macro 'pr_err_ratelimited'
     296 |                         pr_err_ratelimited("ddebug: NULL format string at %s:%s:%u\n",
         |                         ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:298:63: error: 'struct _ddebug' has no member named 'function'; did you mean '_function'?
     298 |                                            dp->function ? dp->function : "?",
         |                                                               ^~~~~~~~
   include/linux/printk.h:483:33: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:705:17: note: in expansion of macro 'printk'
     705 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:719:9: note: in expansion of macro 'printk_ratelimited'
     719 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   lib/dynamic_debug.c:296:25: note: in expansion of macro 'pr_err_ratelimited'
     296 |                         pr_err_ratelimited("ddebug: NULL format string at %s:%s:%u\n",
         |                         ^~~~~~~~~~~~~~~~~~


vim +297 lib/dynamic_debug.c

cfa6f73e601bea Jim Cromie  2023-09-15  265  
e9d376f0fa66bd Jason Baron 2009-02-05  266  /*
85f7f6c0edb841 Jim Cromie  2011-12-19  267   * Search the tables for _ddebug's which match the given `query' and
85f7f6c0edb841 Jim Cromie  2011-12-19  268   * apply the `flags' and `mask' to them.  Returns number of matching
85f7f6c0edb841 Jim Cromie  2011-12-19  269   * callsites, normally the same as number of changes.  If verbose,
85f7f6c0edb841 Jim Cromie  2011-12-19  270   * logs the changes.  Takes ddebug_lock.
e9d376f0fa66bd Jason Baron 2009-02-05  271   */
83998bfdcf2e5f Jim Cromie  2025-11-18  272  static bool ddebug_match_desc(const struct ddebug_query *query,
83998bfdcf2e5f Jim Cromie  2025-11-18  273  			      struct _ddebug *dp,
a99144b08bf397 Jim Cromie  2025-11-18  274  			      struct _ddebug_info *di,
a99144b08bf397 Jim Cromie  2025-11-18  275  			      int selected_class)
83998bfdcf2e5f Jim Cromie  2025-11-18  276  {
a99144b08bf397 Jim Cromie  2025-11-18  277  	struct ddebug_class_map *site_map;
83998bfdcf2e5f Jim Cromie  2025-11-18  278  
83998bfdcf2e5f Jim Cromie  2025-11-18  279  	/* match against the source filename */
83998bfdcf2e5f Jim Cromie  2025-11-18  280  	if (query->filename &&
cfa6f73e601bea Jim Cromie  2023-09-15  281  	    !match_wildcard(query->filename, desc_filename(dp)) &&
83998bfdcf2e5f Jim Cromie  2025-11-18  282  	    !match_wildcard(query->filename,
cfa6f73e601bea Jim Cromie  2023-09-15  283  			    kbasename(desc_filename(dp))) &&
83998bfdcf2e5f Jim Cromie  2025-11-18  284  	    !match_wildcard(query->filename,
cfa6f73e601bea Jim Cromie  2023-09-15  285  			    trim_prefix(desc_filename(dp))))
83998bfdcf2e5f Jim Cromie  2025-11-18  286  		return false;
83998bfdcf2e5f Jim Cromie  2025-11-18  287  
83998bfdcf2e5f Jim Cromie  2025-11-18  288  	/* match against the function */
83998bfdcf2e5f Jim Cromie  2025-11-18  289  	if (query->function &&
cfa6f73e601bea Jim Cromie  2023-09-15  290  	    !match_wildcard(query->function, desc_function(dp)))
83998bfdcf2e5f Jim Cromie  2025-11-18  291  		return false;
83998bfdcf2e5f Jim Cromie  2025-11-18  292  
83998bfdcf2e5f Jim Cromie  2025-11-18  293  	/* match against the format */
83998bfdcf2e5f Jim Cromie  2025-11-18  294  	if (query->format) {
83998bfdcf2e5f Jim Cromie  2025-11-18  295  		if (!dp->format) {
e653e17e49b60c Jim Cromie  2026-08-03  296  			pr_err_ratelimited("ddebug: NULL format string at %s:%s:%u\n",
83998bfdcf2e5f Jim Cromie  2025-11-18 @297  					   dp->filename ? dp->filename : "?",
83998bfdcf2e5f Jim Cromie  2025-11-18 @298  					   dp->function ? dp->function : "?",
83998bfdcf2e5f Jim Cromie  2025-11-18  299  					   dp->lineno);
83998bfdcf2e5f Jim Cromie  2025-11-18  300  			return false;
83998bfdcf2e5f Jim Cromie  2025-11-18  301  		}
83998bfdcf2e5f Jim Cromie  2025-11-18  302  		if (*query->format == '^') {
83998bfdcf2e5f Jim Cromie  2025-11-18  303  			char *p;
83998bfdcf2e5f Jim Cromie  2025-11-18  304  			/* anchored search. match must be at beginning */
83998bfdcf2e5f Jim Cromie  2025-11-18  305  			p = strstr(dp->format, query->format + 1);
83998bfdcf2e5f Jim Cromie  2025-11-18  306  			if (p != dp->format)
83998bfdcf2e5f Jim Cromie  2025-11-18  307  				return false;
83998bfdcf2e5f Jim Cromie  2025-11-18  308  		} else if (!strstr(dp->format, query->format)) {
83998bfdcf2e5f Jim Cromie  2025-11-18  309  			return false;
83998bfdcf2e5f Jim Cromie  2025-11-18  310  		}
83998bfdcf2e5f Jim Cromie  2025-11-18  311  	}
83998bfdcf2e5f Jim Cromie  2025-11-18  312  
83998bfdcf2e5f Jim Cromie  2025-11-18  313  	/* match against the line number range */
83998bfdcf2e5f Jim Cromie  2025-11-18  314  	if (query->first_lineno &&
83998bfdcf2e5f Jim Cromie  2025-11-18  315  	    dp->lineno < query->first_lineno)
83998bfdcf2e5f Jim Cromie  2025-11-18  316  		return false;
83998bfdcf2e5f Jim Cromie  2025-11-18  317  	if (query->last_lineno &&
83998bfdcf2e5f Jim Cromie  2025-11-18  318  	    dp->lineno > query->last_lineno)
83998bfdcf2e5f Jim Cromie  2025-11-18  319  		return false;
83998bfdcf2e5f Jim Cromie  2025-11-18  320  
a99144b08bf397 Jim Cromie  2025-11-18  321  	/*
a99144b08bf397 Jim Cromie  2025-11-18  322  	 * above are all satisfied, so we can make final decisions:
a99144b08bf397 Jim Cromie  2025-11-18  323  	 * 1- class FOO or implied class __DEFAULT__
a99144b08bf397 Jim Cromie  2025-11-18  324  	 * 2- site.is_classed or not
a99144b08bf397 Jim Cromie  2025-11-18  325  	 */
a99144b08bf397 Jim Cromie  2025-11-18  326  	if (query->class_string) {
a99144b08bf397 Jim Cromie  2025-11-18  327  		/* class FOO given, exact match required */
a99144b08bf397 Jim Cromie  2025-11-18  328  		return (dp->class_id == selected_class);
a99144b08bf397 Jim Cromie  2025-11-18  329  	}
a99144b08bf397 Jim Cromie  2025-11-18  330  	/* query class __DEFAULT__ by omission. */
a99144b08bf397 Jim Cromie  2025-11-18  331  	if (dp->class_id == _DPRINTK_CLASS_DFLT) {
a99144b08bf397 Jim Cromie  2025-11-18  332  		/* un-classed site */
83998bfdcf2e5f Jim Cromie  2025-11-18  333  		return true;
83998bfdcf2e5f Jim Cromie  2025-11-18  334  	}
a99144b08bf397 Jim Cromie  2025-11-18  335  	/* site is class'd */
a99144b08bf397 Jim Cromie  2025-11-18  336  	site_map = ddebug_find_map_by_class_id(di, dp->class_id);
a99144b08bf397 Jim Cromie  2025-11-18  337  	if (!site_map) {
904a768d78c408 Jim Cromie  2026-03-12  338  		pr_warn_ratelimited("unknown class_id %d, check %s's CLASSMAP definitions\n",
904a768d78c408 Jim Cromie  2026-03-12  339  			  dp->class_id, di->mod_name);
a99144b08bf397 Jim Cromie  2025-11-18  340  		return false;
a99144b08bf397 Jim Cromie  2025-11-18  341  	}
a99144b08bf397 Jim Cromie  2025-11-18  342  	/* module(-param) decides protection */
a99144b08bf397 Jim Cromie  2025-11-18  343  	return !ddebug_class_wants_protection(site_map);
a99144b08bf397 Jim Cromie  2025-11-18  344  }
83998bfdcf2e5f Jim Cromie  2025-11-18  345  

:::::: The code at line 297 was first introduced by commit
:::::: 83998bfdcf2e5f0513ad68f0e0f5b328fe0937b5 dyndbg: factor ddebug_match_desc out from ddebug_change

:::::: TO: Jim Cromie <jim.cromie@gmail.com>
:::::: CC: Jim Cromie <jim.cromie@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
