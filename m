Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79644DDC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 13:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776172605; cv=none; b=QvmDPI03ocbS1c9sJhtgCfrCZpyqGLE56hXAf4QupARga+BWr27TDUu7yXeqk56BLFFRqwGMZga/AYOkr4uSEZM7bwlN56EznK7ufqLL+v0is7wyRQdSmkfZVWK1T8xkZ3fn+iqtREYiHAhrcoI9OE0zkHdghcvkU8f1ad2j49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776172605; c=relaxed/simple;
	bh=Vavr/kl/m/lpjeGgZ28jfoVOsYtFxwQDEHw6PdqmslE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yr2OxSO/GI9iK8dysT2MtRhrSp1fjxAsBDQsXWiynB9zZOopVScYzYinXNnxPccvaPL3ZYwOIRHA0jc9X2+VUS7KTdxTuCpla1aMbAxzVSmUkGN+ywK06BR3S7BWU5i30Rc3C2n+FlILN4E4KZgRECvTaBEYZppG3lCeXfZXojA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DuRMY8Zv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuRMY8Zv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776172603; x=1807708603;
  h=date:from:to:cc:subject:message-id;
  bh=Vavr/kl/m/lpjeGgZ28jfoVOsYtFxwQDEHw6PdqmslE=;
  b=DuRMY8Zv5ePCYTySYO1d2tQxtVjRlbgNiz+7RNQoU8VPk2YYXcICAJzl
   Iz/EBpoiQyvCf1ZhyZNh+mnU0gSmUR3+mHIFiNEcK1WPpma5gYRWYZUIw
   8uuhZFo1gy9pKg3/9Xd4DVaFoMIEcn1CAO42ntlWvYR6BH08bKh40qEdw
   1QY2rn9rVP2V0vK3grKe3l6rHt9Vwwk/ZbxsEhqkQl/GWM334whL7MqBW
   /h73zco+1JnPkYgXnko8IsnGvUFEpSmavqoUUgRLdOsf+/5EQ+IORlGo3
   62l5axBnd2MorHTPkafHEdPBRwbaeCAWTcmeBc7M0pSJ4f24tz83Ea4OL
   A==;
X-CSE-ConnectionGUID: qr7vvX6OTe6iKqv+9yeggA==
X-CSE-MsgGUID: 2LfyVODGQsOxk+/DpT1wcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="102586231"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="102586231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 06:16:42 -0700
X-CSE-ConnectionGUID: 91DgcgexT2eqPqRRKJlWag==
X-CSE-MsgGUID: sAaovnRUSoqsYsbAwWbn4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="231841090"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 14 Apr 2026 06:16:41 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCdd9-000000001T7-0Xfg;
	Tue, 14 Apr 2026 13:16:39 +0000
Date: Tue, 14 Apr 2026 21:16:27 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/161 1/1] fs/smb/client/cifs_debug.h:15:21:
 warning: format '%u' expects argument of type 'unsigned int', but argument 6
 has type 'size_t' {aka 'long unsigned int'}
Message-ID: <202604142005.gQIn8BLU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/161
head:   0454146d4dafcc116237987b90a51737c9c1a599
commit: 0454146d4dafcc116237987b90a51737c9c1a599 [1/1] smb: client: Fix integer underflow in receive_encrypted_read()
config: x86_64-randconfig-071-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142005.gQIn8BLU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142005.gQIn8BLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142005.gQIn8BLU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb2ops.c:8:
   fs/smb/client/smb2ops.c: In function 'receive_encrypted_read':
   include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
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
>> fs/smb/client/cifs_debug.h:15:21: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
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
     719 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/kern_levels.h:11:25: note: in expansion of macro 'KERN_SOH'
      11 | #define KERN_ERR        KERN_SOH "3"    /* error conditions */
         |                         ^~~~~~~~
   include/linux/printk.h:719:28: note: in expansion of macro 'KERN_ERR'
     719 |         printk_ratelimited(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |                            ^~~~~~~~
   fs/smb/client/cifs_debug.h:89:17: note: in expansion of macro 'pr_err_ratelimited'
      89 |                 pr_err_ ## ratefunc("VFS: \\\\%s " fmt,                 \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:103:17: note: in expansion of macro 'cifs_server_dbg_func'
     103 |                 cifs_server_dbg_func(ratelimited, type, fmt,            \
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:15:21: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/printk.h:748:49: note: in expansion of macro 'pr_fmt'
     748 |                 __dynamic_pr_debug(&descriptor, pr_fmt(fmt), ##__VA_ARGS__);    \
         |                                                 ^~~~~~
   fs/smb/client/cifs_debug.h:92:17: note: in expansion of macro 'pr_debug_ratelimited'
      92 |                 pr_debug_ ## ratefunc("\\\\%s " fmt,                    \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:103:17: note: in expansion of macro 'cifs_server_dbg_func'
     103 |                 cifs_server_dbg_func(ratelimited, type, fmt,            \
         |                 ^~~~~~~~~~~~~~~~~~~~
   fs/smb/client/smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~


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
