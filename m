Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D021548C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 20:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776113933; cv=none; b=EtfQqZ3zfgyx4NE9v8TgIYW31YZk+SAg6O9xhlUaIrPg1kDNGPE+ACFiuNhMKYVLdXN9emaZhqUHDU+v2j8pN92k20i0WvcbyiIG61x45MoPuNGnk5tDh24AKR0SA/VhsLTurf1AowWKk331qQKfsHNKfN2CK9ILjmps2YyDHus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776113933; c=relaxed/simple;
	bh=I/lTVY25XBtLC+nhLedc70IBreuTKOCBz9kcyrKLNyk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UT/eJ9nvoD1Vv6ml7+znZHf3G3uMrAjM740vsev/sWTiC/6HHZcA3VRT97dDbStOSaCAwSlkBI5Qrv52X/hlJyXsyAOLfy9FqxkPvAHAvHFYW+U/nMu5W+vspgQ5hkL5k9X2OFlArZjVV38PJ2OTCgG0VUaqI+dAZcEe91LWJw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WhwKHne9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WhwKHne9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776113931; x=1807649931;
  h=date:from:to:cc:subject:message-id;
  bh=I/lTVY25XBtLC+nhLedc70IBreuTKOCBz9kcyrKLNyk=;
  b=WhwKHne9Vq0uwWcBNZABOnAdf86AjhYxM6b7Z9rKvEkU6xIoW3EbboRn
   yzNB8znosjCJMoPncBylJ30JdikIs5mjlQ44OePl/r67VrEfA5S403VWR
   uWeb81VPrH7pcocXNST6xQtVE4lw3UhLgCy7+XWMKJxabNFOV/GGWr3Kf
   VbGt1xt1o7bkbl7iHQkBAcJKyzqMob93Nq3RKNhlPTYlrLG4Ijt2TG4if
   I8rU0Q/mTfoih7HYaeavDRQ+UuC7fGaWl1RkH/euHTtT0ftUp0Od6qj5p
   Z6sBtqieAAxcTz+Qnrx95rDPkSiD4CeJrgmC7gkjiiGIEiRGZ2lv2yKqo
   A==;
X-CSE-ConnectionGUID: rXvV2H5vR1+syk1O2egH4w==
X-CSE-MsgGUID: iel0G8hRRVmAB0NzUGJ16g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="79644894"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="79644894"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 13:58:51 -0700
X-CSE-ConnectionGUID: HzHnLfMnSHu/+g9EhCJXBw==
X-CSE-MsgGUID: oaqdqsRDSGSbzmAb54B4Wg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2026 13:58:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCOMp-000000000AV-2IJp;
	Mon, 13 Apr 2026 20:58:47 +0000
Date: Mon, 13 Apr 2026 22:57:53 +0200
From: kernel test robot <lkp@intel.com>
To: Dudu Lu <phx0fer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:dudu-patch 1/1]
 include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of
 type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned
 int'}
Message-ID: <202604132216.nFUmyB6T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git dudu-patch
head:   0454146d4dafcc116237987b90a51737c9c1a599
commit: 0454146d4dafcc116237987b90a51737c9c1a599 [1/1] smb: client: Fix integer underflow in receive_encrypted_read()
config: x86_64-rhel-9.4-func (https://download.01.org/0day-ci/archive/20260413/202604132216.nFUmyB6T-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132216.nFUmyB6T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132216.nFUmyB6T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb2ops.c:8:
   fs/smb/client/smb2ops.c: In function 'receive_encrypted_read':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:690:19: note: in expansion of macro 'KERN_DEBUG'
     690 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:85:17: note: in expansion of macro 'pr_debug_once'
      85 |                 pr_debug_ ## ratefunc("%s: \\\\%s " fmt,                \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:101:17: note: in expansion of macro 'cifs_server_dbg_func'
     101 |                 cifs_server_dbg_func(once, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:650:9: note: in expansion of macro 'DO_ONCE_LITE'
     650 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:667:9: note: in expansion of macro 'printk_once'
     667 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:667:21: note: in expansion of macro 'KERN_ERR'
     667 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~
   fs/smb/client/cifs_debug.h:89:17: note: in expansion of macro 'pr_err_once'
      89 |                 pr_err_ ## ratefunc("VFS: \\\\%s " fmt,                 \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:101:17: note: in expansion of macro 'cifs_server_dbg_func'
     101 |                 cifs_server_dbg_func(once, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:690:19: note: in expansion of macro 'KERN_DEBUG'
     690 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:92:17: note: in expansion of macro 'pr_debug_once'
      92 |                 pr_debug_ ## ratefunc("\\\\%s " fmt,                    \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:101:17: note: in expansion of macro 'cifs_server_dbg_func'
     101 |                 cifs_server_dbg_func(once, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   In file included from fs/smb/client/smb2ops.c:23:
   fs/smb/client/cifs_debug.h:15:21: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:748:49: note: in expansion of macro 'pr_fmt'
     748 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   fs/smb/client/cifs_debug.h:85:17: note: in expansion of macro 'pr_debug_ratelimited'
      85 |                 pr_debug_ ## ratefunc("%s: \\\\%s " fmt,                \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:103:17: note: in expansion of macro 'cifs_server_dbg_func'
     103 |                 cifs_server_dbg_func(ratelimited, type, fmt,            \
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:705:17: note: in expansion of macro 'printk'
     705 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:719:9: note: in expansion of macro 'printk_ratelimited'
--
   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from smb2ops.c:8:
   smb2ops.c: In function 'receive_encrypted_read':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:690:19: note: in expansion of macro 'KERN_DEBUG'
     690 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   cifs_debug.h:85:17: note: in expansion of macro 'pr_debug_once'
      85 |                 pr_debug_ ## ratefunc("%s: \\\\%s " fmt,                \
         |                 ^~~~~~~~~
   cifs_debug.h:101:17: note: in expansion of macro 'cifs_server_dbg_func'
     101 |                 cifs_server_dbg_func(once, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~~~
   smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:650:9: note: in expansion of macro 'DO_ONCE_LITE'
     650 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:667:9: note: in expansion of macro 'printk_once'
     667 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:667:21: note: in expansion of macro 'KERN_ERR'
     667 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~
   cifs_debug.h:89:17: note: in expansion of macro 'pr_err_once'
      89 |                 pr_err_ ## ratefunc("VFS: \\\\%s " fmt,                 \
         |                 ^~~~~~~
   cifs_debug.h:101:17: note: in expansion of macro 'cifs_server_dbg_func'
     101 |                 cifs_server_dbg_func(once, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~~~
   smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:690:19: note: in expansion of macro 'KERN_DEBUG'
     690 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   cifs_debug.h:92:17: note: in expansion of macro 'pr_debug_once'
      92 |                 pr_debug_ ## ratefunc("\\\\%s " fmt,                    \
         |                 ^~~~~~~~~
   cifs_debug.h:101:17: note: in expansion of macro 'cifs_server_dbg_func'
     101 |                 cifs_server_dbg_func(once, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~~~~~~~~
   smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   In file included from smb2ops.c:23:
   cifs_debug.h:15:21: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:748:49: note: in expansion of macro 'pr_fmt'
     748 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   cifs_debug.h:85:17: note: in expansion of macro 'pr_debug_ratelimited'
      85 |                 pr_debug_ ## ratefunc("%s: \\\\%s " fmt,                \
         |                 ^~~~~~~~~
   cifs_debug.h:103:17: note: in expansion of macro 'cifs_server_dbg_func'
     103 |                 cifs_server_dbg_func(ratelimited, type, fmt,            \
         |                 ^~~~~~~~~~~~~~~~~~~~
   smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:483:25: note: in definition of macro 'printk_index_wrap'
     483 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:705:17: note: in expansion of macro 'printk'
     705 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:719:9: note: in expansion of macro 'printk_ratelimited'


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
