Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D95E140E34
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 19:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728935765; cv=none; b=Rskto8Fr3IJgztJ1nbZQ1jpXvSX7+eLUN6sBOoJi4oDy1E6LhxAZ0GM6S3peH5AFDrbE3c4f1xCig6tC52qI2GB2EDulHtltFctB4x9DAlq1tsc9LEMx5JYHXvduE6snGFE8z3jl2H6JIxJAuWlaehYhQf3wp37F7DkF7W9VVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728935765; c=relaxed/simple;
	bh=1GAcvT38T9wAyTqf6Bq2+DoXL3gdC/a/fqQiqJ14ndQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pwZlciYsanF2uE1BAdKeDiZeTaV/s+F1EbuB4OnGhPqzgD221M7xjSlKiGJ2eSMnuVkG6NMnzjxpMjS+6mIsBEQ7aOJrv8kICFU/0KJ0m2OzPQUPnK3jAaKhlbL8s7p8xLfZV0RNxY7OiBkNca5cKKMtBv5I6WjuaNmdre+IuT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIPFdz/w; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIPFdz/w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728935763; x=1760471763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1GAcvT38T9wAyTqf6Bq2+DoXL3gdC/a/fqQiqJ14ndQ=;
  b=TIPFdz/wdVG3RC5bAHNLl1d9mKkbLKvR7VOBe/6MDfoHWVFaZXCns+Ca
   b/UgVYFfEABqGQSedfWN2CkIKx9ASduAZStPz0HCuyLdwphe+2KU7B7G5
   t/MpJJ3WHzfLUkgRmLPCaoE87tU1wsZ5F75BGz5ISKRBoMnwzdjnwtyRa
   YLTp926i3oC6guTETajrBywj+axYI8QnU6HoNYjXSgIudBPnDXn2f1SLt
   AZ/UMtj/Q4f6j2JxQUlegAwoyyZHe1algQDZAzKEikaTlPBrVhpSPMDib
   bm5V4//ZWBQrrAm8cYjMV9XVmdwWSvXRjgBqB0Rl4UQsoUuKLDYJbbLWh
   A==;
X-CSE-ConnectionGUID: lMv7yr1JSe+7fGmGXugKUg==
X-CSE-MsgGUID: x5onVvFNQDyK1LBFZeRYFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28489935"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="28489935"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 12:56:03 -0700
X-CSE-ConnectionGUID: xVGXjH3OTmKKZIarOHpLDQ==
X-CSE-MsgGUID: ph6OpW5ESyehKDfBAzjxow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="81649910"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Oct 2024 12:56:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0RAd-000H4N-1H;
	Mon, 14 Oct 2024 19:55:59 +0000
Date: Tue, 15 Oct 2024 03:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.experiments 3/3]
 include/linux/rcuref_long.h:23:33: error: 'RCUREF_RELEASED' undeclared; did
 you mean 'RCUREF_LONG_RELEASED'?
Message-ID: <202410150349.hvLkCTU4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.experiments
head:   007604382bae5e5955ef294a676bd3eb1c1bbac2
commit: 007604382bae5e5955ef294a676bd3eb1c1bbac2 [3/3] fs: port files to rcuref_long_t
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20241015/202410150349.hvLkCTU4-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150349.hvLkCTU4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150349.hvLkCTU4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/fs.h:48,
                    from include/linux/huge_mm.h:8,
                    from include/linux/mm.h:1120,
                    from arch/arc/kernel/asm-offsets.c:7:
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
   make[3]: *** [scripts/Makefile.build:102: arch/arc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +23 include/linux/rcuref_long.h

d72d156a1254d8 Christian Brauner 2024-09-18  11  
d72d156a1254d8 Christian Brauner 2024-09-18  12  #ifdef CONFIG_64BIT
d72d156a1254d8 Christian Brauner 2024-09-18  13  #define RCUREF_LONG_ONEREF	0x0000000000000000U
d72d156a1254d8 Christian Brauner 2024-09-18  14  #define RCUREF_LONG_MAXREF	0x7FFFFFFFFFFFFFFFU
d72d156a1254d8 Christian Brauner 2024-09-18  15  #define RCUREF_LONG_SATURATED   0xA000000000000000U
d72d156a1254d8 Christian Brauner 2024-09-18  16  #define RCUREF_LONG_RELEASED    0xC000000000000000U
d72d156a1254d8 Christian Brauner 2024-09-18  17  #define RCUREF_LONG_DEAD	0xE000000000000000U
d72d156a1254d8 Christian Brauner 2024-09-18  18  #define RCUREF_LONG_NOREF	0xFFFFFFFFFFFFFFFFU
d72d156a1254d8 Christian Brauner 2024-09-18  19  #else
d72d156a1254d8 Christian Brauner 2024-09-18  20  #define RCUREF_LONG_ONEREF	RCUREF_ONEREF
d72d156a1254d8 Christian Brauner 2024-09-18  21  #define RCUREF_LONG_MAXREF	RCUREF_MAXREF
d72d156a1254d8 Christian Brauner 2024-09-18  22  #define RCUREF_LONG_SATURATED	RCUREF_SATURATED
d72d156a1254d8 Christian Brauner 2024-09-18 @23  #define RCUREF_LONG_RELEASED	RCUREF_RELEASED
d72d156a1254d8 Christian Brauner 2024-09-18  24  #define RCUREF_LONG_DEAD	RCUREF_DEAD
d72d156a1254d8 Christian Brauner 2024-09-18  25  #define RCUREF_LONG_NOREF	RCUREF_NOREF
d72d156a1254d8 Christian Brauner 2024-09-18  26  #endif
d72d156a1254d8 Christian Brauner 2024-09-18  27  

:::::: The code at line 23 was first introduced by commit
:::::: d72d156a1254d8298d22a59f13b5ed47126b6b5d rcurf: add rcuref_long_*() helpers

:::::: TO: Christian Brauner <brauner@kernel.org>
:::::: CC: Christian Brauner <brauner@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
