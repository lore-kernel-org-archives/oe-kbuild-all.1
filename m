Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3573E1FDA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 19:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727897496; cv=none; b=WzqRaKovG2Z8UA52Nxo5z9U19nvavq96ak8SS33kll9n7fTLln8N16EG7Ri2OrQ3KoCo8Zu8+r3+oyoSS/Llbqz5rnlTxmnK/67nYpH9tEb6IyksARQEfC/b5D+E736BNjpStxj/DyjXhd+iUcfxXXlgmFfF9f1iwtL6AfAKTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727897496; c=relaxed/simple;
	bh=8NK9THSYkcGFOZHthqHfwk37VFUV08TmXCBiE6FWcVM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lewIGJ8gpQLiCDLLfQDdTWjMKcZIqGRrNa7cXgsJ9uG4Aa0qGxuAB3XkA2e08Ztsf65s70EOTWNHBb14mCT8kd90rATaq/dMKuzVmwJaNLYdHu8DU/YhPAls/GHrCzT7cQIu0LdoBtwiJZepZONPrEI2yijYPTMpOP9uirCLh4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aNZnN050; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNZnN050"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727897495; x=1759433495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8NK9THSYkcGFOZHthqHfwk37VFUV08TmXCBiE6FWcVM=;
  b=aNZnN050kzQHQmjLj6ucw5qouXzQjQ7++Epc2DE6V1JMGAkcDoEHR85F
   c0mQ7/hvnnr1BNjQHOFa8K410jb/76T30IIZE6gOH3AWzvpc5SWrEy9iO
   5U/tRDZrxgIiYSkt2HzA+cjVX9OLMPmIt7xD+fxRAQsKKW+ryaOaE8805
   vNBrB700b/tkmLPZu6Q/5GFRpOmwcGDRleDbMV/Epi+icqXiaVGcs0kDA
   fvonwgEFb0wuAKIS2tKn+Bsx98RVv1cW5qtD9ATt5UUmmYHQpL/T7WQ/M
   QEtvzmyqBHsCqkA2UiPOrnhjY3aJf8llj7xckRW6cPWGfSq07wfhDjMA4
   Q==;
X-CSE-ConnectionGUID: Yi/Haw9ARqWzFsifSPPiuw==
X-CSE-MsgGUID: I07ognCDTt2pXJKH29hREw==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="26948156"
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="26948156"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 12:31:34 -0700
X-CSE-ConnectionGUID: 07BA8PDoRzGjsjg6W2aBjw==
X-CSE-MsgGUID: GY+0iBdiRguGfBAFQNR2Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,172,1725346800"; 
   d="scan'208";a="111559853"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 02 Oct 2024 12:31:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sw54N-000UUP-0S;
	Wed, 02 Oct 2024 19:31:31 +0000
Date: Thu, 3 Oct 2024 03:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:brauner.file.rcuref 3/4]
 include/linux/rcuref_long.h:23:33: error: 'RCUREF_RELEASED' undeclared; did
 you mean 'RCUREF_LONG_RELEASED'?
Message-ID: <202410030339.irYmhoBt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git brauner.file.rcuref
head:   27f246a26d936193149b818fa5e024cd985675c0
commit: cb20f41ba36a8500ea0cca826b27ca58ede6123f [3/4] fs: port files to rcuref_long_t
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20241003/202410030339.irYmhoBt-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241003/202410030339.irYmhoBt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410030339.irYmhoBt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs.h:48,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1120,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/openrisc/kernel/asm-offsets.c:28:
   include/linux/rcuref_long.h: In function 'rcuref_long_read':
>> include/linux/rcuref_long.h:23:33: error: 'RCUREF_RELEASED' undeclared (first use in this function); did you mean 'RCUREF_LONG_RELEASED'?
      23 | #define RCUREF_LONG_RELEASED    RCUREF_RELEASED
         |                                 ^~~~~~~~~~~~~~~
   include/linux/rcuref_long.h:49:21: note: in expansion of macro 'RCUREF_LONG_RELEASED'
      49 |         return c >= RCUREF_LONG_RELEASED ? 0 : c + 1;
         |                     ^~~~~~~~~~~~~~~~~~~~
   include/linux/rcuref_long.h:23:33: note: each undeclared identifier is reported only once for each function it appears in
      23 | #define RCUREF_LONG_RELEASED    RCUREF_RELEASED
         |                                 ^~~~~~~~~~~~~~~
   include/linux/rcuref_long.h:49:21: note: in expansion of macro 'RCUREF_LONG_RELEASED'
      49 |         return c >= RCUREF_LONG_RELEASED ? 0 : c + 1;
         |                     ^~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:102: arch/openrisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +23 include/linux/rcuref_long.h

eea7922dd31c8d Christian Brauner 2024-09-18  11  
eea7922dd31c8d Christian Brauner 2024-09-18  12  #ifdef CONFIG_64BIT
eea7922dd31c8d Christian Brauner 2024-09-18  13  #define RCUREF_LONG_ONEREF	0x0000000000000000U
eea7922dd31c8d Christian Brauner 2024-09-18  14  #define RCUREF_LONG_MAXREF	0x7FFFFFFFFFFFFFFFU
eea7922dd31c8d Christian Brauner 2024-09-18  15  #define RCUREF_LONG_SATURATED   0xA000000000000000U
eea7922dd31c8d Christian Brauner 2024-09-18  16  #define RCUREF_LONG_RELEASED    0xC000000000000000U
eea7922dd31c8d Christian Brauner 2024-09-18  17  #define RCUREF_LONG_DEAD	0xE000000000000000U
eea7922dd31c8d Christian Brauner 2024-09-18  18  #define RCUREF_LONG_NOREF	0xFFFFFFFFFFFFFFFFU
eea7922dd31c8d Christian Brauner 2024-09-18  19  #else
eea7922dd31c8d Christian Brauner 2024-09-18  20  #define RCUREF_LONG_ONEREF	RCUREF_ONEREF
eea7922dd31c8d Christian Brauner 2024-09-18  21  #define RCUREF_LONG_MAXREF	RCUREF_MAXREF
eea7922dd31c8d Christian Brauner 2024-09-18  22  #define RCUREF_LONG_SATURATED	RCUREF_SATURATED
eea7922dd31c8d Christian Brauner 2024-09-18 @23  #define RCUREF_LONG_RELEASED	RCUREF_RELEASED
eea7922dd31c8d Christian Brauner 2024-09-18  24  #define RCUREF_LONG_DEAD	RCUREF_DEAD
eea7922dd31c8d Christian Brauner 2024-09-18  25  #define RCUREF_LONG_NOREF	RCUREF_NOREF
eea7922dd31c8d Christian Brauner 2024-09-18  26  #endif
eea7922dd31c8d Christian Brauner 2024-09-18  27  

:::::: The code at line 23 was first introduced by commit
:::::: eea7922dd31c8d9d6dc9a25a19fef7bc272f9e50 rcurf: add rcuref_long_*() helpers

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
