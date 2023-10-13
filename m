Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B856063CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 05:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dmuCMlUc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697176630; x=1728712630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X9zmQJREOWG7xLL6C1/Ak8QEpPQtCFYqW+Bg8Tz+4Ro=;
  b=dmuCMlUcM7p3uu4P/tgka8/Zu8YEYaAEkzbKGFNS+jYd/JWpjGCsmiSn
   K+GT7wir/J7m/5GJqb4iUOb9BZi4BxD4mwAUT2wQ9dK71uiON+h51DtPQ
   wj37G0gPcAmwBz7Xg00zLNdY/Eu4mu+t0ohjQvIv+c1T8OiAz0PEdyz/k
   P4bGqef67G0pNR6gZ9I4jV9TtF3FPyprdV9f4f3D/T5oY5yQsWJCUG7ka
   qd+cxYPxKj/WFco5jNIJL/LlnysWxWT+9oxINN/FpNPyUddWynSryn7Bj
   Fo14KTPmAnktfIMnlG8oUHzGIwfZc6STguozqCepn2NS8LJhDOUCtT2k3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="375458324"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="375458324"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 22:57:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="1086006764"
X-IronPort-AV: E=Sophos;i="6.03,221,1694761200"; 
   d="scan'208";a="1086006764"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 12 Oct 2023 22:57:04 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrBAU-0004OL-2B;
	Fri, 13 Oct 2023 05:57:02 +0000
Date: Fri, 13 Oct 2023 13:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-kitchen-sink 27/55] include/linux/dynamic_debug.h:68:31:
 error: 'struct _ddebug' has no member named 'filename'; did you mean
 '_filename'?
Message-ID: <202310131344.yt4iyiLT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jim,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/jimc/linux.git dd-kitchen-sink
head:   7e157cd3c1be4bbc30eddcbfea1ed696e904de89
commit: 2784be0ffb672e3a8e59b823be0a94629a558f66 [27/55] dyndbg: prep to isolate 3 repetetive fields
config: x86_64-randconfig-005-20231011 (https://download.01.org/0day-ci/archive/20231013/202310131344.yt4iyiLT-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231013/202310131344.yt4iyiLT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310131344.yt4iyiLT-lkp@intel.com/

Note: the jimc/dd-kitchen-sink HEAD 7e157cd3c1be4bbc30eddcbfea1ed696e904de89 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from include/linux/printk.h:564,
                    from include/linux/kernel.h:30,
                    from lib/dynamic_debug.c:16:
   lib/dynamic_debug.c: In function 'ddebug_change':
>> include/linux/dynamic_debug.h:68:31: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
      68 | #define desc_filename(d) (d)->filename
         |                               ^~~~~~~~
   lib/dynamic_debug.c:238:41: note: in expansion of macro 'desc_filename'
     238 |        !match_wildcard(query->filename, desc_filename(dp)) &&
         |                                         ^~~~~~~~~~~~~
>> include/linux/dynamic_debug.h:68:31: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
      68 | #define desc_filename(d) (d)->filename
         |                               ^~~~~~~~
   lib/dynamic_debug.c:240:20: note: in expansion of macro 'desc_filename'
     240 |          kbasename(desc_filename(dp))) &&
         |                    ^~~~~~~~~~~~~
>> include/linux/dynamic_debug.h:68:31: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
      68 | #define desc_filename(d) (d)->filename
         |                               ^~~~~~~~
   lib/dynamic_debug.c:242:22: note: in expansion of macro 'desc_filename'
     242 |          trim_prefix(desc_filename(dp))))
         |                      ^~~~~~~~~~~~~
>> include/linux/dynamic_debug.h:69:31: error: 'struct _ddebug' has no member named 'function'; did you mean '_function'?
      69 | #define desc_function(d) (d)->function
         |                               ^~~~~~~~
   lib/dynamic_debug.c:247:41: note: in expansion of macro 'desc_function'
     247 |        !match_wildcard(query->function, desc_function(dp)))
         |                                         ^~~~~~~~~~~~~
>> include/linux/dynamic_debug.h:68:31: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
      68 | #define desc_filename(d) (d)->filename
         |                               ^~~~~~~~
   include/linux/printk.h:427:19: note: in expansion of macro 'desc_filename'
     427 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:455:26: note: in expansion of macro 'printk_index_wrap'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:528:2: note: in expansion of macro 'printk'
     528 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   lib/dynamic_debug.c:126:3: note: in expansion of macro 'pr_info'
     126 |   pr_info(fmt, ##__VA_ARGS__);   \
         |   ^~~~~~~
   lib/dynamic_debug.c:132:29: note: in expansion of macro 'vnpr_info'
     132 | #define v4pr_info(fmt, ...) vnpr_info(4, fmt, ##__VA_ARGS__)
         |                             ^~~~~~~~~
   lib/dynamic_debug.c:283:4: note: in expansion of macro 'v4pr_info'
     283 |    v4pr_info("changed %s:%d [%s]%s %s => %s\n",
         |    ^~~~~~~~~
>> include/linux/dynamic_debug.h:69:31: error: 'struct _ddebug' has no member named 'function'; did you mean '_function'?
      69 | #define desc_function(d) (d)->function
         |                               ^~~~~~~~
   include/linux/printk.h:427:19: note: in expansion of macro 'desc_function'
     427 |   _p_func(_fmt, ##__VA_ARGS__);    \
         |                   ^~~~~~~~~~~
   include/linux/printk.h:455:26: note: in expansion of macro 'printk_index_wrap'
     455 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
         |                          ^~~~~~~~~~~~~~~~~
   include/linux/printk.h:528:2: note: in expansion of macro 'printk'
     528 |  printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
         |  ^~~~~~
   lib/dynamic_debug.c:126:3: note: in expansion of macro 'pr_info'
     126 |   pr_info(fmt, ##__VA_ARGS__);   \
         |   ^~~~~~~
   lib/dynamic_debug.c:132:29: note: in expansion of macro 'vnpr_info'
     132 | #define v4pr_info(fmt, ...) vnpr_info(4, fmt, ##__VA_ARGS__)
         |                             ^~~~~~~~~
   lib/dynamic_debug.c:283:4: note: in expansion of macro 'v4pr_info'
     283 |    v4pr_info("changed %s:%d [%s]%s %s => %s\n",
         |    ^~~~~~~~~
   lib/dynamic_debug.c: In function '__dynamic_emit_prefix':
>> include/linux/dynamic_debug.h:67:31: error: 'const struct _ddebug' has no member named 'modname'; did you mean '_modname'?
      67 | #define desc_modname(d)  (d)->modname
         |                               ^~~~~~~
   lib/dynamic_debug.c:784:5: note: in expansion of macro 'desc_modname'
     784 |     desc_modname(desc));
         |     ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:69:31: error: 'const struct _ddebug' has no member named 'function'; did you mean '_function'?
      69 | #define desc_function(d) (d)->function
         |                               ^~~~~~~~
   lib/dynamic_debug.c:787:5: note: in expansion of macro 'desc_function'
     787 |     desc_function(desc));
         |     ^~~~~~~~~~~~~
>> include/linux/dynamic_debug.h:68:31: error: 'const struct _ddebug' has no member named 'filename'; did you mean '_filename'?
      68 | #define desc_filename(d) (d)->filename
         |                               ^~~~~~~~
   lib/dynamic_debug.c:790:17: note: in expansion of macro 'desc_filename'
     790 |     trim_prefix(desc_filename(desc)));
         |                 ^~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'ddebug_proc_show':
>> include/linux/dynamic_debug.h:68:31: error: 'struct _ddebug' has no member named 'filename'; did you mean '_filename'?
      68 | #define desc_filename(d) (d)->filename
         |                               ^~~~~~~~
   lib/dynamic_debug.c:1113:18: note: in expansion of macro 'desc_filename'
    1113 |      trim_prefix(desc_filename(dp)), dp->lineno,
         |                  ^~~~~~~~~~~~~
>> include/linux/dynamic_debug.h:69:31: error: 'struct _ddebug' has no member named 'function'; did you mean '_function'?
      69 | #define desc_function(d) (d)->function
         |                               ^~~~~~~~
   lib/dynamic_debug.c:1114:29: note: in expansion of macro 'desc_function'
    1114 |      iter->table->mod_name, desc_function(dp),
         |                             ^~~~~~~~~~~~~
   lib/dynamic_debug.c: In function 'dynamic_debug_init':
>> include/linux/dynamic_debug.h:67:31: error: 'struct _ddebug' has no member named 'modname'; did you mean '_modname'?
      67 | #define desc_modname(d)  (d)->modname
         |                               ^~~~~~~
   lib/dynamic_debug.c:1550:12: note: in expansion of macro 'desc_modname'
    1550 |  modname = desc_modname(iter);
         |            ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:67:31: error: 'struct _ddebug' has no member named 'modname'; did you mean '_modname'?
      67 | #define desc_modname(d)  (d)->modname
         |                               ^~~~~~~
   lib/dynamic_debug.c:1555:23: note: in expansion of macro 'desc_modname'
    1555 |   if (strcmp(modname, desc_modname(iter))) {
         |                       ^~~~~~~~~~~~
>> include/linux/dynamic_debug.h:67:31: error: 'struct _ddebug' has no member named 'modname'; did you mean '_modname'?
      67 | #define desc_modname(d)  (d)->modname
         |                               ^~~~~~~
   lib/dynamic_debug.c:1564:14: note: in expansion of macro 'desc_modname'
    1564 |    modname = desc_modname(iter);
         |              ^~~~~~~~~~~~


vim +68 include/linux/dynamic_debug.h

    66	
  > 67	#define desc_modname(d)		(d)->modname
  > 68	#define desc_filename(d)	(d)->filename
  > 69	#define desc_function(d)	(d)->function
    70	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
