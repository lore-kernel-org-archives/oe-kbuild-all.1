Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4C76ABA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 13:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692623079; x=1724159079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WT1mX6rZ3L49id0vZmYLCrufKE+Qm4pO3vdTIW7M3S4=;
  b=U34jNw1RZORV2H3i7qolbM5Ho8WBCZbTRRxkBh2Tn0oTnG2FTRtonUdk
   Du+s7+kU688eKMZuhaVvsvP0AQahLmnygqv47QEfA+lafznVkHzOYNVjm
   TakZIV3RwIVjzoY9Eo9dQJ582YtgyhaY41/rW6UFcxCBmRhwHxG5WZ2yc
   IpZSWUnIg2FQt+hRvdoO8jhHkBYDnMJZXCRR0RlrRjWS5ebtXjPNw7igx
   GSlC+4Osz9ACK1raQ9rX+r0IEwoZUQIoCKX1fUgb4gI4upsnJReyZfWhW
   kfO9FJA4eKAGW8FhLDUrd7j6B7xCXoXxWgMPDuIDs35P9OHWohxx+3QzR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="373554348"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="373554348"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:04:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="729425282"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="729425282"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Aug 2023 06:04:18 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qY4Zt-0000VH-2u;
	Mon, 21 Aug 2023 13:04:17 +0000
Date: Mon, 21 Aug 2023 21:03:51 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 7/30] fs/smb/client/cifs_debug.h:15:21:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 7 has type 'unsigned int'
Message-ID: <202308212051.TKT4uSNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   d98064c4bf02eba42e22917aecccfb339c094d26
commit: 9278a88ed9fd5de83c156b392c103954d197661d [7/30] iov: Add a 2-level bvec iterator
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230821/202308212051.TKT4uSNR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230821/202308212051.TKT4uSNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308212051.TKT4uSNR-lkp@intel.com/

All warnings (new ones prefixed by >>):

                    from arch/alpha/include/asm/bug.h:23,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:13,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/alpha/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/smb/client/file.c:11:
   fs/smb/client/file.c: In function 'cifs_write_from_iter':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:634:9: note: in expansion of macro 'no_printk'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:634:19: note: in expansion of macro 'KERN_DEBUG'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_once'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3426:17: note: in expansion of macro 'cifs_dbg'
    3426 |                 cifs_dbg(FYI, "write_from_iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:594:9: note: in expansion of macro 'DO_ONCE_LITE'
     594 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:611:9: note: in expansion of macro 'printk_once'
     611 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:611:21: note: in expansion of macro 'KERN_ERR'
     611 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~
   fs/smb/client/cifs_debug.h:68:17: note: in expansion of macro 'pr_err_once'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3426:17: note: in expansion of macro 'cifs_dbg'
    3426 |                 cifs_dbg(FYI, "write_from_iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:634:9: note: in expansion of macro 'no_printk'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:634:19: note: in expansion of macro 'KERN_DEBUG'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:17: note: in expansion of macro 'pr_debug_once'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3426:17: note: in expansion of macro 'cifs_dbg'
    3426 |                 cifs_dbg(FYI, "write_from_iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   In file included from fs/smb/client/file.c:32:
>> fs/smb/client/cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:692:49: note: in expansion of macro 'pr_fmt'
     692 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   fs/smb/client/cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_ratelimited'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3426:17: note: in expansion of macro 'cifs_dbg'
    3426 |                 cifs_dbg(FYI, "write_from_iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:649:17: note: in expansion of macro 'printk'
     649 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:663:9: note: in expansion of macro 'printk_ratelimited'
     663 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:663:28: note: in expansion of macro 'KERN_ERR'
     663 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   fs/smb/client/cifs_debug.h:68:17: note: in expansion of macro 'pr_err_ratelimited'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3426:17: note: in expansion of macro 'cifs_dbg'
    3426 |                 cifs_dbg(FYI, "write_from_iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   fs/smb/client/cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:692:49: note: in expansion of macro 'pr_fmt'
     692 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   fs/smb/client/cifs_debug.h:70:17: note: in expansion of macro 'pr_debug_ratelimited'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3426:17: note: in expansion of macro 'cifs_dbg'
    3426 |                 cifs_dbg(FYI, "write_from_iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   fs/smb/client/file.c: In function 'cifs_send_async_read':
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:634:9: note: in expansion of macro 'no_printk'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:634:19: note: in expansion of macro 'KERN_DEBUG'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_once'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3957:17: note: in expansion of macro 'cifs_dbg'
    3957 |                 cifs_dbg(FYI, "read-to-iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:594:9: note: in expansion of macro 'DO_ONCE_LITE'
     594 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:611:9: note: in expansion of macro 'printk_once'
     611 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:611:21: note: in expansion of macro 'KERN_ERR'
     611 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                     ^~~~~~~~
   fs/smb/client/cifs_debug.h:68:17: note: in expansion of macro 'pr_err_once'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3957:17: note: in expansion of macro 'cifs_dbg'
    3957 |                 cifs_dbg(FYI, "read-to-iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:634:9: note: in expansion of macro 'no_printk'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:634:19: note: in expansion of macro 'KERN_DEBUG'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:17: note: in expansion of macro 'pr_debug_once'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3957:17: note: in expansion of macro 'cifs_dbg'
    3957 |                 cifs_dbg(FYI, "read-to-iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
>> fs/smb/client/cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 7 has type 'unsigned int' [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:692:49: note: in expansion of macro 'pr_fmt'
     692 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   fs/smb/client/cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_ratelimited'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3957:17: note: in expansion of macro 'cifs_dbg'
    3957 |                 cifs_dbg(FYI, "read-to-iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:427:25: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                         ^~~~
   include/linux/printk.h:649:17: note: in expansion of macro 'printk'
     649 |                 printk(fmt, ##__VA_ARGS__);                             \
         |                 ^~~~~~
   include/linux/printk.h:663:9: note: in expansion of macro 'printk_ratelimited'
     663 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:663:28: note: in expansion of macro 'KERN_ERR'
     663 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   fs/smb/client/cifs_debug.h:68:17: note: in expansion of macro 'pr_err_ratelimited'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3957:17: note: in expansion of macro 'cifs_dbg'
    3957 |                 cifs_dbg(FYI, "read-to-iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~
   fs/smb/client/cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 6 has type 'unsigned int' [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:692:49: note: in expansion of macro 'pr_fmt'
     692 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   fs/smb/client/cifs_debug.h:70:17: note: in expansion of macro 'pr_debug_ratelimited'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:79:17: note: in expansion of macro 'cifs_dbg_func'
      79 |                 cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__);   \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:3957:17: note: in expansion of macro 'cifs_dbg'
    3957 |                 cifs_dbg(FYI, "read-to-iter len=%zx/%zx nsegs=%u/%lu/%u\n",
         |                 ^~~~~~~~


vim +15 fs/smb/client/cifs_debug.h

a0a3036b81f1f6 fs/cifs/cifs_debug.h Joe Perches 2020-04-14  14  
a0a3036b81f1f6 fs/cifs/cifs_debug.h Joe Perches 2020-04-14 @15  #define pr_fmt(fmt) "CIFS: " fmt
a0a3036b81f1f6 fs/cifs/cifs_debug.h Joe Perches 2020-04-14  16  

:::::: The code at line 15 was first introduced by commit
:::::: a0a3036b81f1f66fa3333559ecfe18f5bbfa5076 cifs: Standardize logging output

:::::: TO: Joe Perches <joe@perches.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
