Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F153433E8C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 10:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783162462; cv=none; b=cgDHW39/kJt+Y46XOR3tTHMO4yIM8ZDQWlxAujkEf5eD0xFnPH9y6yGaw8eebP6NByMDSPu9WwWPDLyhyFXbjMW01SC0ttiWrEEyvhucEsRtitvZfRRZK3ynRmQo+DtBCxHV/WPsIyfkiirL+UdR9+FLraxqR2vjjGwdCfLkBA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783162462; c=relaxed/simple;
	bh=sOX3V7ylEZAS8Fnc1k6yPgIfgWW6eKW0C6tl6As87Ts=;
	h=Date:From:To:Cc:Subject:Message-ID; b=teRLJG9liXKC0dLYCCYDF7a9mtwXaLUGpIdKIGL8V3w69wZQdvm/ob+Tr1qM1NrEwND0tUJmRd4620b32KiF2uXBtT2BrRmccTwCUcdtegAPw34Onr3KADz4eHMhJ6D2KjFbWYuU0flAiTvcEAmmfQSAuX9nW3uEeAX5OefO7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQeUOIaP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQeUOIaP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783162460; x=1814698460;
  h=date:from:to:cc:subject:message-id;
  bh=sOX3V7ylEZAS8Fnc1k6yPgIfgWW6eKW0C6tl6As87Ts=;
  b=OQeUOIaP9fsiPkw1X34W6SYglQ+808tiztRA3FHPTWUqwK6tIOjsnhfU
   HWJ0WqvpUQgFWRJoWPUh3kvREUxuFYFaIWkwvf6AyoDGrgwqNYRYoiDl/
   hXFiZFK5Xdx4Vsh6DoLzbE3PN0rgt9mjxjg/5ZdomX5gTGUq6vMdT0RoI
   6WKCfhYP9QPaSeJsXkLyHo/ILyG4np/yzaAeIrwL2apObbye1w43xOJUH
   kl+pLhOTMQurkaGPEJkXR5SMa3sc4RifOA9xWaM2fA/xOsHjDeTHBqZEa
   /3EdzTXsVHjBLz0OQXrKCVnBCM3B98lttalPVJrzefecICWmORusly+Lq
   g==;
X-CSE-ConnectionGUID: PLSFa0RZQkeGKoHOav0Ldg==
X-CSE-MsgGUID: H5eQR/xNTQ+kKYdxhvZCFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="94478244"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="94478244"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2026 03:54:19 -0700
X-CSE-ConnectionGUID: muhDqqXEQHutMRNxpbKt2g==
X-CSE-MsgGUID: 3WUqfsghQBSJJxX2dAGBhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="291430434"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Jul 2026 03:54:17 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfy0I-00000000D0R-1mgd;
	Sat, 04 Jul 2026 10:54:06 +0000
Date: Sat, 04 Jul 2026 18:53:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-06 0/1]
 mm/kasan/kasan_test_c.c:48:6: sparse: sparse: symbol 'kasan_ptr_result' was
 not declared. Should it be static?
Message-ID: <202607041827.4Z0qYEh2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-06
head:   8a69376da734aa00bb02cd1155489c74454e4487
commit: a2f11547052001bd448ccec81dd1e68409078fbb [0/1] kasan: rust: Add KASAN smoke test via UAF
config: x86_64-randconfig-123-20260704 (https://download.01.org/0day-ci/archive/20260704/202607041827.4Z0qYEh2-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041827.4Z0qYEh2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a2f115470520 ("kasan: rust: Add KASAN smoke test via UAF")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041827.4Z0qYEh2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/kasan/kasan_test_c.c:48:6: sparse: sparse: symbol 'kasan_ptr_result' was not declared. Should it be static?
>> mm/kasan/kasan_test_c.c:49:5: sparse: sparse: symbol 'kasan_int_result' was not declared. Should it be static?

vim +/kasan_ptr_result +48 mm/kasan/kasan_test_c.c

7ce0ea19d50e4e mm/kasan/kasan_test.c Andrey Konovalov 2022-09-27  43  
adb72ae1915db2 lib/test_kasan.c      Daniel Axtens    2020-06-03  44  /*
0fd379253691e7 lib/test_kasan.c      Andrey Konovalov 2021-02-24  45   * Some tests use these global variables to store return values from function
0fd379253691e7 lib/test_kasan.c      Andrey Konovalov 2021-02-24  46   * calls that could otherwise be eliminated by the compiler as dead code.
adb72ae1915db2 lib/test_kasan.c      Daniel Axtens    2020-06-03  47   */
adb72ae1915db2 lib/test_kasan.c      Daniel Axtens    2020-06-03 @48  void *kasan_ptr_result;
83c4e7a0363bdb lib/test_kasan.c      Patricia Alfonso 2020-10-13 @49  int kasan_int_result;
83c4e7a0363bdb lib/test_kasan.c      Patricia Alfonso 2020-10-13  50  

:::::: The code at line 48 was first introduced by commit
:::::: adb72ae1915db28f934e9e02c18bfcea2f3ed3b7 kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE

:::::: TO: Daniel Axtens <dja@axtens.net>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
