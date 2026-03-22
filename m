Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888E0C14A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 19:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774208317; cv=none; b=VFOl08t0ehg96QJQyLa0POYeo3z+R95nWKPfutuEG/dRT4NRV42NIZMYdBrlgMDNhrbRVWkHNiI/2tt30xtt66RipksGwMDTxIJol9As/SLpWpU67MVOrdlqHMfo2LptJRIOS0gFgYXrt2uojrktUCGnccpoeYCsN/mOpCO6iJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774208317; c=relaxed/simple;
	bh=dAYx5kUF1qZJ7FzT9BSzuKFAtrZvIdW8p1AahSjXWqE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FmTokeQwRIOsnut4ZxuIYU5w1RY55GrF/EbUatXI6wSiHW7COYAkUwiLy5o7e59Os58px8t7CRepnzBvJpCTZZfX8RDe0U/MfDp9xQiBhOcA84VFSiQDVOWZbAqlu2hCf5tHaHl28OELY1NBL9eF1PvnLYPA1epb6SiDP90gk7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOb6jZ6y; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOb6jZ6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774208316; x=1805744316;
  h=date:from:to:cc:subject:message-id;
  bh=dAYx5kUF1qZJ7FzT9BSzuKFAtrZvIdW8p1AahSjXWqE=;
  b=mOb6jZ6yfpaSNOvVv38ZpBChMHGRGM1GhEAW+pEiGyxt9yfX5N0HRr2i
   CoOu3QcnEPh0acjGMcSPxr5vTqiGLCAiygzQe8B3mYlpVBDYn/Fcnc3j9
   3+KkDiOxODGZCsNRgznUlVjGmP8muaJjlszRY1hh+wc49V0MgGT6WSiRP
   buv2zqZMkUxlEE+udZ2G0L4zyQ9wdbIuLkWvUQI/Q1ylSBQZE/N7paZ6a
   Ypia9MH3/82d0h/0hHAWVjh1NGM7e0gnwd5KHbcBknkvtCCufiCDE1dAm
   tC5YKfsPFeOOlhhfJFAJccwmFAuqrAvPbOO1+im1+0PaJtV4mKW+MSpZj
   w==;
X-CSE-ConnectionGUID: 6ARgHGNTQ4GynesNA1vBdA==
X-CSE-MsgGUID: H9vZoK9aQVaJBtpP0EBwXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86692754"
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="86692754"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 12:38:36 -0700
X-CSE-ConnectionGUID: EV/0nB0USDaqNcCoW5sK7w==
X-CSE-MsgGUID: l6CS7kpfRWCT0K42iIw1oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,135,1770624000"; 
   d="scan'208";a="223036127"
Received: from lkp-server02.sh.intel.com (HELO c2cbc2b066eb) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Mar 2026 12:38:34 -0700
Received: from kbuild by c2cbc2b066eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4ObI-0000000001S-0ZYy;
	Sun, 22 Mar 2026 19:37:21 +0000
Date: Mon, 23 Mar 2026 03:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 2/2]
 mm/kasan/kasan_test_c.c:48:6: sparse: sparse: symbol 'kasan_ptr_result' was
 not declared. Should it be static?
Message-ID: <202603230350.eZJwwzkn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   117047e314aaff9eaa0d7221ec3c33df105bec04
commit: a2f11547052001bd448ccec81dd1e68409078fbb [2/2] kasan: rust: Add KASAN smoke test via UAF
config: arm64-randconfig-r122-20260322 (https://download.01.org/0day-ci/archive/20260323/202603230350.eZJwwzkn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603230350.eZJwwzkn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603230350.eZJwwzkn-lkp@intel.com/

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
