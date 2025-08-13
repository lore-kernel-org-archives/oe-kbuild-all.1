Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8112E7184
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 13:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755090737; cv=none; b=oIm0zkTtVn0MaSr4hzit/WRbKDtCXWspTD1CPnBgpO0cdNizLnn47dYj1tPIVXlcxlHoRfr5MhSb/F6YOCHVGgtxPRw48VXhHsPOdCKWPGRp0VMxN0PDRXecpf5mhpBy6H3QSt/wio7AENNoGwwR+tppoDY8a8F6iVN7C11irM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755090737; c=relaxed/simple;
	bh=lwmwo2xIekjaLFzx/m1DZwokrVax9xwiba8s1bIWHxM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hLM1XxVUx/IgmwzODmEkd0YOtmRKGglchghO0gSDalu/lzOuZqKMI0U5rk+Rp6eJQOEeqhD4z5fomNyk8+ccJr2Xq2jdOQyQHH0MoQeJK7wHmWEoCnJ9RTbOk88cp/+d4HLChyBaTtS6Fys6iNX9TWpPIbhnUK74LpqO7xTa0P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1Wikz1a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1Wikz1a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755090735; x=1786626735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwmwo2xIekjaLFzx/m1DZwokrVax9xwiba8s1bIWHxM=;
  b=Y1Wikz1aC/I5cyI4W3pxrUH/iYRIjpzTD1X8hiEKPvRtvMlcex3keewm
   EEbKzTxhlLni2b4JjnYa+JVcBLmNo682r+3kpAbPEnvVlzHwzFH+m77ZF
   O8Fb7tF8xpcaha4OIbSggZGDUyZE7NFbd+1/f0X2aNEe0G8rvOLHA1/S2
   Az8y8sw6GpWHU+bI6ec7Y3KMbE6Es5Jrd+cTVXLqtnxQCRI8Thjdv+ScN
   92cbRY7yycDO6eelXszjCgY+ApKL4xBsMjQaECqwLcBg7NE2USxpheFNH
   xdBwSM3xWcxnII1ITiKkxVIeQi6paFnyf/Ms46zWWDk6AlhHdd2ZV63ly
   g==;
X-CSE-ConnectionGUID: pMYz3TNGToGoxHKDEvNmWw==
X-CSE-MsgGUID: +nxDdU/lTzOBas53l5w4mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="56592883"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="56592883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2025 06:12:14 -0700
X-CSE-ConnectionGUID: KvtlWUcjR0KDDef9qED0Fg==
X-CSE-MsgGUID: fZqK+LtoQH2ti7I+bz0Sug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="170918463"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 13 Aug 2025 06:12:13 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umBH1-00003r-0r;
	Wed, 13 Aug 2025 13:12:11 +0000
Date: Wed, 13 Aug 2025 15:11:21 +0200
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1606/2153] include/linux/kern_levels.h:5:25:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 4 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202508131547.Z7lYWSmb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   43c3c17f0c805882d1b48818b1085747a68c80ec
commit: ea594d2ccb6d05a769defa933a8740542fe1332b [1606/2153] smb3: fix for slab out of bounds on mount to ksmbd
config: arm-pxa_defconfig (https://download.01.org/0day-ci/archive/20250813/202508131547.Z7lYWSmb-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131547.Z7lYWSmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131547.Z7lYWSmb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb2ops.c:8:
   fs/smb/client/smb2ops.c: In function 'parse_server_interfaces':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:693:19: note: in expansion of macro 'KERN_DEBUG'
     693 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_once'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:653:9: note: in expansion of macro 'DO_ONCE_LITE'
     653 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:670:9: note: in expansion of macro 'printk_once'
     670 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:670:21: note: in expansion of macro 'KERN_ERR'
     670 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~
   fs/smb/client/cifs_debug.h:68:17: note: in expansion of macro 'pr_err_once'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:693:19: note: in expansion of macro 'KERN_DEBUG'
     693 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:17: note: in expansion of macro 'pr_debug_once'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   In file included from fs/smb/client/smb2ops.c:23:
   fs/smb/client/cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:751:49: note: in expansion of macro 'pr_fmt'
     751 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   fs/smb/client/cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_ratelimited'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:708:17: note: in expansion of macro 'printk'
     708 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:722:9: note: in expansion of macro 'printk_ratelimited'
--
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from smb2ops.c:8:
   smb2ops.c: In function 'parse_server_interfaces':
>> include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:693:19: note: in expansion of macro 'KERN_DEBUG'
     693 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_once'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:653:9: note: in expansion of macro 'DO_ONCE_LITE'
     653 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:670:9: note: in expansion of macro 'printk_once'
     670 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:670:21: note: in expansion of macro 'KERN_ERR'
     670 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~
   cifs_debug.h:68:17: note: in expansion of macro 'pr_err_once'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                 ^~~~~~~
   cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:135:25: note: in definition of macro 'no_printk'
     135 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:693:19: note: in expansion of macro 'KERN_DEBUG'
     693 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   cifs_debug.h:70:17: note: in expansion of macro 'pr_debug_once'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                 ^~~~~~~~~
   cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   In file included from smb2ops.c:23:
   cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:751:49: note: in expansion of macro 'pr_fmt'
     751 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_ratelimited'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   smb2ops.c:777:25: note: in expansion of macro 'cifs_dbg'
     777 |                         cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
         |                         ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:486:25: note: in definition of macro 'printk_index_wrap'
     486 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:708:17: note: in expansion of macro 'printk'
     708 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:722:9: note: in expansion of macro 'printk_ratelimited'


vim +5 include/linux/kern_levels.h

314ba3520e513a Joe Perches 2012-07-30  4  
04d2c8c83d0e3a Joe Perches 2012-07-30 @5  #define KERN_SOH	"\001"		/* ASCII Start Of Header */
04d2c8c83d0e3a Joe Perches 2012-07-30  6  #define KERN_SOH_ASCII	'\001'
04d2c8c83d0e3a Joe Perches 2012-07-30  7  

:::::: The code at line 5 was first introduced by commit
:::::: 04d2c8c83d0e3ac5f78aeede51babb3236200112 printk: convert the format for KERN_<LEVEL> to a 2 byte pattern

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
