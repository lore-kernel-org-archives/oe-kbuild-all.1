Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1132DC331
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776115133; cv=none; b=bkaauqAyRKRNzRNQErlm8JyjFhZTxwJr4EvWHNSwelpWm2kW6s1xL5kZSa/FErywKPVnhzXf2G+ZEXHBy3CKZfxzGMHxL1Gy/m9K6/a4BNq9BdFJQs6KE0348dlsrGYd0l4xOK4R3tumcNPJLiE5ehYpzYsCJJwJwpgiIHYNEAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776115133; c=relaxed/simple;
	bh=POuBM3eGPgHdP4WoQjw0zbNRAtJIYlKPp0pFNLaD0uM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=puViPpmeGxw5aubzrTDNqILfXiD+twUn4sF7P9PSQjA3v88v8ICSLnkxhXdZ2K/qgBxD5A91O/hhGVjz8a4CMR21zi/fLLEW+7qZWg035NnQ+s8lj04iFj8DHZWAztW1I8QrUJ53EWgVGW6TkLxeTYIyALRqWjtvj6f6eHorTRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GWENOcV6; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GWENOcV6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776115132; x=1807651132;
  h=date:from:to:cc:subject:message-id;
  bh=POuBM3eGPgHdP4WoQjw0zbNRAtJIYlKPp0pFNLaD0uM=;
  b=GWENOcV6rma1mwwjK89ly5wYmRVdMCrsRIrW3s3vvbLnrIcmPtlqImjc
   StJHi2BGVIu5yfkg3cu4QqeP5gVJj9yAdKcnNgD/v6m5wXNqMVaoM1Imi
   5YfX93bYt9dAyuzAWZkEoyrjdtsdGxL83N73FYOvNRob5rtJiWLT7ECLN
   57lxzCXOjtEn1F56f6Weq+30pMjBKrdZhEgDbVq22J046pU73tYZ6gRBd
   L/hnYopvcqCZggq5A/KdiUmFA9grO37uhs/zizAWDPYmakUqKV05WuhZf
   8r2VtMccBvUxOOCZISp1YCm63+stizLzvVBOouq5FdJPL1RiNyNkVZITa
   Q==;
X-CSE-ConnectionGUID: uGy1g7eKQlmfPHLz4RTFXg==
X-CSE-MsgGUID: MwdENaT7TAa5TsXezNUxGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="64595083"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="64595083"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 14:18:51 -0700
X-CSE-ConnectionGUID: KltcwxxwRYuCmlVpMCauCA==
X-CSE-MsgGUID: uemmTQY1SAqybY2EAJweMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="225166010"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 13 Apr 2026 14:18:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCOgB-000000000B3-3tow;
	Mon, 13 Apr 2026 21:18:47 +0000
Date: Mon, 13 Apr 2026 23:18:24 +0200
From: kernel test robot <lkp@intel.com>
To: Dudu Lu <phx0fer@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Steve French <stfrench@microsoft.com>
Subject: [samba-ksmbd:dudu-patch 1/1]
 fs/smb/client/cifs_debug.h:15:21: warning: format '%u' expects argument of
 type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned
 int'}
Message-ID: <202604132301.NxZMLudq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.samba.org/ksmbd.git dudu-patch
head:   0454146d4dafcc116237987b90a51737c9c1a599
commit: 0454146d4dafcc116237987b90a51737c9c1a599 [1/1] smb: client: Fix integer underflow in receive_encrypted_read()
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260413/202604132301.NxZMLudq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132301.NxZMLudq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604132301.NxZMLudq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/smb/client/smb2ops.c:23:
   fs/smb/client/smb2ops.c: In function 'receive_encrypted_read':
>> fs/smb/client/cifs_debug.h:15:21: warning: format '%u' expects argument of type 'unsigned int', but argument 5 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
      15 | #define pr_fmt(fmt) "CIFS: " fmt
         |                     ^~~~~~~~
   include/linux/dynamic_debug.h:231:29: note: in expansion of macro 'pr_fmt'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:9: note: in expansion of macro '__dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:261:9: note: in expansion of macro '_dynamic_func_call_cls'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/dynamic_debug.h:280:9: note: in expansion of macro '_dynamic_func_call'
     280 |         _dynamic_func_call(fmt, __dynamic_pr_debug,             \
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/printk.h:635:9: note: in expansion of macro 'dynamic_pr_debug'
     635 |         dynamic_pr_debug(fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~
   fs/smb/client/cifs_debug.h:145:17: note: in expansion of macro 'pr_debug'
     145 |                 pr_debug("\\\\%s " fmt,                                 \
         |                 ^~~~~~~~
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
