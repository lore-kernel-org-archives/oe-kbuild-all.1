Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DC52D12E3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Aug 2025 06:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755068219; cv=none; b=R/hAYLDWqwN2ExWytjzMaK6WyagLaVCmKfS7UUxSM7YQpM8EeZykA8CE+GIiP3pp08FoX4nnS3sIvhJg0f8upu+AElZOUEyhPDFjqrQk7DmjpCoPnvZurzeUHxu8fcfhfBrOwbpaX6CWRFlc64N5uhXUjjNcl+aWuiUKhC9jMFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755068219; c=relaxed/simple;
	bh=Fd5muvCfFnfdCiDH6Qo4YFV9xIGOtRJbHcghkUgIl3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B5jvyNMSjztPF3giy8DZlNYkFDiAutgQHWcGUgxEYyL42GdNsCV+dmNuw4xOiZpcLFlUnAYFgNhxskgEr+HObbTOeyMQIHFPSY4BFA3dhEf8mVBIq+VZTQ6ZdNUKbD3ClpmmyuJuBCSNoMszucCh8DUI9kqQq6a6nclpCpn74eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AULa/tvQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AULa/tvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755068218; x=1786604218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fd5muvCfFnfdCiDH6Qo4YFV9xIGOtRJbHcghkUgIl3k=;
  b=AULa/tvQ86TWMuN4/+p8jqf46CZnMgbsAzaMowqM+Qjs1vBjd6Q0l23h
   i95agu1/MrjQJGUeVfKC9zvJWxwJQmCvf9ip1O3jAdiiz3+LZ02brJaNi
   tEfpbGYAAI5uqdVVz8Cfxi+HLu+TIlfdlpAfSXgDZYvLhZqk25cenTvCy
   M28ZpSKfI/tcELggRJMGK6WcT2gGgCbHeaHkEXjxw7emNuYfrtr9WAy8+
   RWMRxSNVD32H6dCe7ohP11ESeAo6GAOdqRFEiQxXrb4b1ZVBvatCgXEfu
   I/t5Q7i/1EPaY8QQZ5uiNlokzsPZUqrSK9TSoeBogtds4EYrDKaC0kBdY
   w==;
X-CSE-ConnectionGUID: kQ6Dvo9XRCicyGABz8gwsw==
X-CSE-MsgGUID: x57GOz14TN2RpQRj4TNA9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="67619773"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="67619773"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2025 23:56:39 -0700
X-CSE-ConnectionGUID: Vci90qSOSG2Awp9rsSxLXw==
X-CSE-MsgGUID: 7O19JFbjSoi+rbWkSbS4sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; 
   d="scan'208";a="171650881"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 12 Aug 2025 23:56:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1um5PV-0009dI-0Z;
	Wed, 13 Aug 2025 06:56:33 +0000
Date: Wed, 13 Aug 2025 14:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 1606/2153] fs/smb/client/cifs_debug.h:15:21:
 warning: format '%lu' expects argument of type 'long unsigned int', but
 argument 5 has type 'size_t' {aka 'unsigned int'}
Message-ID: <202508131441.o27616Pa-lkp@intel.com>
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
config: arm-randconfig-004-20250813 (https://download.01.org/0day-ci/archive/20250813/202508131441.o27616Pa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250813/202508131441.o27616Pa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508131441.o27616Pa-lkp@intel.com/

All warnings (new ones prefixed by >>):

                     ^~~~~~
   include/linux/printk.h:135:11: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
              ^~~
   include/linux/kern_levels.h:15:20: note: in expansion of macro 'KERN_SOH'
    #define KERN_DEBUG KERN_SOH "7" /* debug-level messages */
                       ^~~~~~~~
   include/linux/printk.h:693:12: note: in expansion of macro 'KERN_DEBUG'
     no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
               ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:65:3: note: in expansion of macro 'pr_debug_once'
      pr_debug_ ## ratefunc("%s: " fmt,   \
      ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:3: note: in expansion of macro 'cifs_dbg_func'
      cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);  \
      ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:4: note: in expansion of macro 'cifs_dbg'
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
       ^~~~~~~~
   fs/smb/client/smb2ops.c:777:46: note: format string is defined here
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
                                               ~~^
                                               %u
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb2ops.c:8:
   include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:486:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/once_lite.h:31:4: note: in expansion of macro 'printk'
       func(__VA_ARGS__);    \
       ^~~~
   include/linux/once_lite.h:11:2: note: in expansion of macro 'DO_ONCE_LITE_IF'
     DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~
   include/linux/printk.h:653:2: note: in expansion of macro 'DO_ONCE_LITE'
     DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
     ^~~~~~~~~~~~
   include/linux/printk.h:670:2: note: in expansion of macro 'printk_once'
     printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:670:14: note: in expansion of macro 'KERN_ERR'
     printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                 ^~~~~~~~
   fs/smb/client/cifs_debug.h:68:3: note: in expansion of macro 'pr_err_once'
      pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__); \
      ^~~~~~~
   fs/smb/client/cifs_debug.h:77:3: note: in expansion of macro 'cifs_dbg_func'
      cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);  \
      ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:4: note: in expansion of macro 'cifs_dbg'
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
       ^~~~~~~~
   fs/smb/client/smb2ops.c:777:46: note: format string is defined here
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
                                               ~~^
                                               %u
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb2ops.c:8:
   include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:135:11: note: in definition of macro 'no_printk'
      _printk(fmt, ##__VA_ARGS__);  \
              ^~~
   include/linux/kern_levels.h:15:20: note: in expansion of macro 'KERN_SOH'
    #define KERN_DEBUG KERN_SOH "7" /* debug-level messages */
                       ^~~~~~~~
   include/linux/printk.h:693:12: note: in expansion of macro 'KERN_DEBUG'
     no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
               ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:70:3: note: in expansion of macro 'pr_debug_once'
      pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);  \
      ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:3: note: in expansion of macro 'cifs_dbg_func'
      cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);  \
      ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:4: note: in expansion of macro 'cifs_dbg'
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
       ^~~~~~~~
   fs/smb/client/smb2ops.c:777:46: note: format string is defined here
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
                                               ~~^
                                               %u
   In file included from fs/smb/client/smb2ops.c:23:
>> fs/smb/client/cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    #define pr_fmt(fmt) "CIFS: " fmt
                        ^~~~~~~~
   include/linux/printk.h:751:35: note: in expansion of macro 'pr_fmt'
      __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__); \
                                      ^~~~~~
   fs/smb/client/cifs_debug.h:65:3: note: in expansion of macro 'pr_debug_ratelimited'
      pr_debug_ ## ratefunc("%s: " fmt,   \
      ^~~~~~~~~
   fs/smb/client/cifs_debug.h:79:3: note: in expansion of macro 'cifs_dbg_func'
      cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__); \
      ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:4: note: in expansion of macro 'cifs_dbg'
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
       ^~~~~~~~
   fs/smb/client/smb2ops.c:777:46: note: format string is defined here
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
                                               ~~^
                                               %u
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm/include/asm/bug.h:60,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb2ops.c:8:
   include/linux/kern_levels.h:5:18: warning: format '%lu' expects argument of type 'long unsigned int', but argument 3 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    #define KERN_SOH "\001"  /* ASCII Start Of Header */
                     ^~~~~~
   include/linux/printk.h:486:11: note: in definition of macro 'printk_index_wrap'
      _p_func(_fmt, ##__VA_ARGS__);    \
              ^~~~
   include/linux/printk.h:708:3: note: in expansion of macro 'printk'
      printk(fmt, ##__VA_ARGS__);    \
      ^~~~~~
   include/linux/printk.h:722:2: note: in expansion of macro 'printk_ratelimited'
     printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
     ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:18: note: in expansion of macro 'KERN_SOH'
    #define KERN_ERR KERN_SOH "3" /* error conditions */
                     ^~~~~~~~
   include/linux/printk.h:722:21: note: in expansion of macro 'KERN_ERR'
     printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
                        ^~~~~~~~
   fs/smb/client/cifs_debug.h:68:3: note: in expansion of macro 'pr_err_ratelimited'
      pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__); \
      ^~~~~~~
   fs/smb/client/cifs_debug.h:79:3: note: in expansion of macro 'cifs_dbg_func'
      cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__); \
      ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:4: note: in expansion of macro 'cifs_dbg'
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
       ^~~~~~~~
   fs/smb/client/smb2ops.c:777:46: note: format string is defined here
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
                                               ~~^
                                               %u
   In file included from fs/smb/client/smb2ops.c:23:
   fs/smb/client/cifs_debug.h:15:21: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
    #define pr_fmt(fmt) "CIFS: " fmt
                        ^~~~~~~~
   include/linux/printk.h:751:35: note: in expansion of macro 'pr_fmt'
      __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__); \
                                      ^~~~~~
   fs/smb/client/cifs_debug.h:70:3: note: in expansion of macro 'pr_debug_ratelimited'
      pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);  \
      ^~~~~~~~~
   fs/smb/client/cifs_debug.h:79:3: note: in expansion of macro 'cifs_dbg_func'
      cifs_dbg_func(ratelimited, type, fmt, ##__VA_ARGS__); \
      ^~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:777:4: note: in expansion of macro 'cifs_dbg'
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
       ^~~~~~~~
   fs/smb/client/smb2ops.c:777:46: note: format string is defined here
       cifs_dbg(VFS, "%s: invalid Next pointer %lu > %zd\n",
                                               ~~^
                                               %u


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
