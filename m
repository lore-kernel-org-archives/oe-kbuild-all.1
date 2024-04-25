Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838C685261
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Apr 2024 11:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714044238; cv=none; b=jncvNpbGP1kTHoYCsEiHeXPElwO4Av8XZDcNnLO5hPZRIDl64M3d2dGmqWd1LYwylcBr3e3RljFgQMsTkNftn62tHaWM/v1OCp9X0nHnEnCo1G+g1VM16Id8yBOPaPcVKd68ckAOSnO/4tQp2s9F4Scf5XT9Kj0tckxGjfN08zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714044238; c=relaxed/simple;
	bh=vBQxAqzjRg7h6Gmwu2q7ve2gc+CDOH7N8Cvs/UkMjYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C3WhNylK3yS12iWtJZ2lzP55qiNuMUpA0mqlpTwRc4cYbbocfMnFr68TbIYG3AME+F5ucZ486j+bN2Lb6tv06w2jGtdQqld2fMr1Yx0n9Dpaik4CaDCFiCBi2CRhI+nKpkgK0u2ivix+r6hhRWviAy6FrbN8vSSV9VUZ5bGY4R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alStFddd; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alStFddd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714044236; x=1745580236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vBQxAqzjRg7h6Gmwu2q7ve2gc+CDOH7N8Cvs/UkMjYs=;
  b=alStFddd2nA1ZMqch1tnsOVt4WzaFzAObyrq9TN7YZDFED3s9lS3JTAT
   STV1VxxE82e1l+t/fBH8jIMxO+sJAutGfvZ0C7fUtwmn1m+4KPXnESR5G
   C2D70uVQyrHocolE+wnWzX9HOdVzb87VxW6iQFg5wZ+Pnd05zEOez1G8k
   6AMmFwaWLWpBKVbX/LtcQm94t9c3LY9YjSxDw7uI/TVOHt01Kq/HJOqw4
   diRWlgbpiLciBe6JJ/WTmRlBBnDf4Ysgf7P0fWglcDR4fs5U9HV92bRhN
   wUDRJOkIbxV++u1nrHQG7wwdWEXTTJgytc5K5FXpuYO4bXN1jVnbVCj8i
   A==;
X-CSE-ConnectionGUID: 0pPgyZT0TF6zGHAQqdMD7g==
X-CSE-MsgGUID: 8bJ4WZ50RLeNUyrMCwx4Qw==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="9589622"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="9589622"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 04:23:55 -0700
X-CSE-ConnectionGUID: Y8l6kl9CR2ad4Xi0PBxH8g==
X-CSE-MsgGUID: GV/R29FuRuqRcbr0JNAtcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="48303006"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2024 04:23:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzxCi-0002IO-23;
	Thu, 25 Apr 2024 11:23:52 +0000
Date: Thu, 25 Apr 2024 19:23:14 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 9/10] crypto/fips140-module.c:46:11:
 sparse: sparse: symbol '__initcall_start_marker' was not declared. Should it
 be static?
Message-ID: <202404251918.dRQcw18e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   c61278bb705a1891885b578a71656264da61be5b
commit: c6d5a767217ce93403528e99f1a1eb401a26eeb3 [9/10] ANDROID: fips140: add kernel crypto module
config: arm64-randconfig-r112-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251918.dRQcw18e-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 5ef5eb66fb428aaf61fb51b709f065c069c11242)
reproduce: (https://download.01.org/0day-ci/archive/20240425/202404251918.dRQcw18e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404251918.dRQcw18e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/fips140-module.c:46:11: sparse: sparse: symbol '__initcall_start_marker' was not declared. Should it be static?
>> crypto/fips140-module.c:47:11: sparse: sparse: symbol '__initcall_end_marker' was not declared. Should it be static?
>> crypto/fips140-module.c:62:10: sparse: sparse: symbol '__text_start' was not declared. Should it be static?
>> crypto/fips140-module.c:63:10: sparse: sparse: symbol '__rodata_start' was not declared. Should it be static?

vim +/__initcall_start_marker +46 crypto/fips140-module.c

    45	
  > 46	const u32 __initcall_start_marker __section(".initcalls._start");
  > 47	const u32 __initcall_end_marker __section(".initcalls._end");
    48	
    49	const u8 __fips140_text_start __section(".text.._start");
    50	const u8 __fips140_text_end __section(".text.._end");
    51	
    52	const u8 __fips140_rodata_start __section(".rodata.._start");
    53	const u8 __fips140_rodata_end __section(".rodata.._end");
    54	
    55	/*
    56	 * We need this little detour to prevent Clang from detecting out of bounds
    57	 * accesses to __fips140_text_start and __fips140_rodata_start, which only exist
    58	 * to delineate the section, and so their sizes are not relevant to us.
    59	 */
    60	const u32 *__initcall_start = &__initcall_start_marker;
    61	
  > 62	const u8 *__text_start = &__fips140_text_start;
  > 63	const u8 *__rodata_start = &__fips140_rodata_start;
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
