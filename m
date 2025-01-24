Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACCD1D9A48
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 06:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737698878; cv=none; b=cSLSLaV9COZmQ6K3kUfxaJngSW5xE/u2Qg7/f2CMqfIUPNGg3NVUI00IxOztBZyeBAD/U8FCIv0P3hRk0CUFncewVloe/uMNV1kVNjOscYrZLw7HF44HltL/NBeYX7zkduUCWfCI61uSXFmhUprKd4zzJ0mn6IJAydqiSHdYmaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737698878; c=relaxed/simple;
	bh=wBG6Efa1cDicOfRdhAxmzL/1tmOJUHn/tU6XU5KJXnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ezMdDPfuVNhVSqNr1abvLFZQUMqKxmlTYWFqC91USZWTCe3RAKinDo75kO9zGmyTAZhO4O5l6ml+QLihwqWqzqpReXeRTm1WJWGebdPLY/OY9pZiBAg9VyeCKqTWH+qn0ouhKcd+dsgtfkhJXF/pJSYEUG/R7tlNuvu2103qMoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tnr+8V+K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tnr+8V+K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737698876; x=1769234876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wBG6Efa1cDicOfRdhAxmzL/1tmOJUHn/tU6XU5KJXnM=;
  b=Tnr+8V+KJpW6/o+fNGMOlZNONYEjibW0Tsf//Vn+KoFUIvOsYHvKHST1
   tvjE3n/7qh3NQej+TZ8E+YsdKr8/1rfn/ymdSpil8pKFlIQaUtUT3w4kj
   WwyJnX/dglCE1Cbxx+/TYkjH1jjJ0KMt1oDUMsMhZ4AFCX9iOaCyQAj89
   qvFGF6u+gMFXfZRH1NYFOTpd3MlvQTwp/PvoBx2yyqP+gW5/2ZPD3XBqB
   LkYppMh5YPdqKNZZyFIuwJATWPbLqCEsBsxj8ExyiHLCgyAiPuxtVLZ+s
   8RssEcmTUJUxNhptxV2I1t/CSbDIcvDw7IoyKQM9wWQocBzTgeO8cpIwI
   g==;
X-CSE-ConnectionGUID: DDBEG5qsRcyWa+VESHRnFg==
X-CSE-MsgGUID: MMjQwDSJQ1e0CRsKyNv98w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41988050"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="41988050"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 22:07:55 -0800
X-CSE-ConnectionGUID: wzEv1t6RQtCGEQYfJm4AsQ==
X-CSE-MsgGUID: o5PwbrQeRuSL751NOE48Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="107488951"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jan 2025 22:07:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbCrA-000cFL-0d;
	Fri, 24 Jan 2025 06:07:52 +0000
Date: Fri, 24 Jan 2025 14:07:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 228/228]
 mm/kasan/kasan_test.c:36:6: sparse: sparse: symbol 'kasan_ptr_result' was
 not declared. Should it be static?
Message-ID: <202501241450.C7PC0znL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   2c8b3afe8866ca4bb189aa69f1185ff225dabfa3
commit: f7e01ab828fd4bf6d25b1f143a3994241e8572bf [228/228] kasan: move tests to mm/kasan/
config: arm-randconfig-r132-20250124 (https://download.01.org/0day-ci/archive/20250124/202501241450.C7PC0znL-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241450.C7PC0znL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241450.C7PC0znL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test.c:36:6: sparse: sparse: symbol 'kasan_ptr_result' was not declared. Should it be static?
>> mm/kasan/kasan_test.c:37:5: sparse: sparse: symbol 'kasan_int_result' was not declared. Should it be static?

vim +/kasan_ptr_result +36 mm/kasan/kasan_test.c

f33a01492a24a2 lib/test_kasan.c Walter Wu        2020-08-06  31  
adb72ae1915db2 lib/test_kasan.c Daniel Axtens    2020-06-03  32  /*
0fd379253691e7 lib/test_kasan.c Andrey Konovalov 2021-02-24  33   * Some tests use these global variables to store return values from function
0fd379253691e7 lib/test_kasan.c Andrey Konovalov 2021-02-24  34   * calls that could otherwise be eliminated by the compiler as dead code.
adb72ae1915db2 lib/test_kasan.c Daniel Axtens    2020-06-03  35   */
adb72ae1915db2 lib/test_kasan.c Daniel Axtens    2020-06-03 @36  void *kasan_ptr_result;
83c4e7a0363bdb lib/test_kasan.c Patricia Alfonso 2020-10-13 @37  int kasan_int_result;
83c4e7a0363bdb lib/test_kasan.c Patricia Alfonso 2020-10-13  38  

:::::: The code at line 36 was first introduced by commit
:::::: adb72ae1915db28f934e9e02c18bfcea2f3ed3b7 kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
