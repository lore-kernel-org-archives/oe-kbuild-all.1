Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE803DD524
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 12:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776168883; cv=none; b=rNfBYzVkhDakF6ou66S9LFv2DLGmvbeaLiVLZj4y6VERAhqliTcHeFSWO5gbtd16xCW+2ULKy+wnQZ8SwSeBuXO8caJ0ln6Im9df7bIl392PZ+00WcSWdnOOCP/GvDt1OCGODyBKuSnF7t31UZDMm5H3lHbbS5QKkjksqQ73IZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776168883; c=relaxed/simple;
	bh=1nkxT5kVCCJ+oANNh4wxkJS0wWv1oCMjV1PrCpHjGM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hg7eC1MlSmN5H6ljeAJop+SXls/BcvOzpkCUCol5GGxulG5Vkdk4Kt8vuqTpkM0UVXpJMgTK7DFCgL6Zh3R/TZsmg4rUVHICoJbU9P3CBvMb6BE7umnH0Rq8a/Qkkbf3TUjGHWchLJojAUrfToqBGlglky8okd5fbJLn7Deonxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fpQOEdF+; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fpQOEdF+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776168882; x=1807704882;
  h=date:from:to:cc:subject:message-id;
  bh=1nkxT5kVCCJ+oANNh4wxkJS0wWv1oCMjV1PrCpHjGM0=;
  b=fpQOEdF+d3TKy1noie8FpAnJ5blVkmK6ijZmJNSiS7a85MbQmOVxJ5Bv
   RET92eR1Zoe5HTzJGGqomwCWe9cdRaoHbhr57Z8+A/oe8As9yIqqZ+hCH
   2yMYVqD/smh0DMgqI53nKNQKDmgDu3YWBhPpxkqsMOG8+frl7lt+VWnaO
   SqNNE9y+XtO04aINyN74BFKvCBzSSJ/2z3/vRO5ZmU/bvf0SlYwFB3sWa
   AH7oIMUxo9y8pJyw+iYEzIa9oz6gID3cZI69lhT0NufNmyhVE8yyvNysW
   wsxKMC/J3oGkl+TLvfgGEjAcRUOq1ab84Suf07MPciu+1e3xYKD3qJJa8
   Q==;
X-CSE-ConnectionGUID: n3VXeeDfRRKLkLwURFkcnA==
X-CSE-MsgGUID: t8aQr7+ZT9Ww7yGuSUS3hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="88202222"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="88202222"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 05:14:40 -0700
X-CSE-ConnectionGUID: D7cr7IpNQ5GepXV2WPV3ww==
X-CSE-MsgGUID: cYIG4pRASkqE7pTgr+VdzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253479701"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Apr 2026 05:14:39 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCcf6-000000001Qz-3uNA;
	Tue, 14 Apr 2026 12:14:36 +0000
Date: Tue, 14 Apr 2026 20:14:33 +0800
From: kernel test robot <lkp@intel.com>
To: Steve French <stfrench@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [smfrench-smb3:pr/161 1/1] include/linux/kern_levels.h:5:25:
 warning: format '%u' expects argument of type 'unsigned int', but argument 4
 has type 'size_t' {aka 'long unsigned int'}
Message-ID: <202604142049.UjVpUMr5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/smfrench/smb3-kernel.git pr/161
head:   0454146d4dafcc116237987b90a51737c9c1a599
commit: 0454146d4dafcc116237987b90a51737c9c1a599 [1/1] smb: client: Fix integer underflow in receive_encrypted_read()
config: x86_64-buildonly-randconfig-003-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142049.UjVpUMr5-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142049.UjVpUMr5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142049.UjVpUMr5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:31,
                    from arch/x86/include/asm/bug.h:193,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:7,
                    from include/linux/pagemap.h:8,
                    from fs/smb/client/smb2ops.c:8:
   fs/smb/client/smb2ops.c: In function 'receive_encrypted_read':
>> include/linux/kern_levels.h:5:25: warning: format '%u' expects argument of type 'unsigned int', but argument 4 has type 'size_t' {aka 'long unsigned int'} [-Wformat=]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
         |                         ^~~~~~~~
   include/linux/printk.h:641:19: note: in expansion of macro 'KERN_DEBUG'
     641 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   fs/smb/client/cifs_debug.h:145:17: note: in expansion of macro 'pr_debug'
     145 |                 pr_debug("\\\\%s " fmt,                                 \
         |                 ^~~~~~~~
   fs/smb/client/smb2ops.c:4948:17: note: in expansion of macro 'cifs_server_dbg'
    4948 |                 cifs_server_dbg(VFS, "OriginalMessageSize %u too small for read response (%u)\n",
         |                 ^~~~~~~~~~~~~~~


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
