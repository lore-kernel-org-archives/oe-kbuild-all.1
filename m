Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30ABC1957FF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 23:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740786215; cv=none; b=ncLmAlJj6/0ojH2iWbKmtj9cx11Q42NiHHBS7bQ6xJXUdJT25ioqv1Y5k/54DoIXj3MstU3r4OojO+V7+pwxdNA7ksOmqiHB3rQGSSi9I7+Bxbyr7uxHIMz7Ed9DW1AtkX6ozQo8scgIU8htAtAxXOgop5svwEXe3yug717cZ1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740786215; c=relaxed/simple;
	bh=r4tR+amP7rqHwdIw4ETWY99bGMM8iAb5qO4vyxrRVIg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bHHRUSAxQkuQy8Gp7oTVf5N8G7NN80iimXVvEH0a/rjyKDrZ3d9+ZVsT32UtMbICajuvfp/9qbSuPN+Dk1PzRe52q/yvwcDHBBQT+AIN/XacFLDKm8m4tI1C6Prl3jEL9kFUBCtoOshRv+T8rU6A/hLjux9tieVAanl2DyGkv9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+uy4o/X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+uy4o/X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740786213; x=1772322213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r4tR+amP7rqHwdIw4ETWY99bGMM8iAb5qO4vyxrRVIg=;
  b=K+uy4o/XMEpRB1Lh5PXjYySfnIY52U1LjaowizlHzfygSvpVAONKFtZv
   amCcfbo3CP8H1ow0PnJVxTa9Hv5zd7ZSQATRJBFyotPIfWo+JFfQVir3j
   onW2NTm+/G0BDLHA7iZKth9NQ/m86Pf3uUp5GUKFyIfqgxi40PWMi/5xm
   Bh+lsdTuXiHA9qqJTfshOh4zgf3KBh9RmNuVqNXCpsP5EdiMyRfddlwUa
   uBBmVdlHczOcdViLL1FmxYkQtU6gztX+mLO2FKKX7dFMu1I5xyZJEkgyF
   J+e2OcJtAvL/H7zcV8GjiaDXHDilchRi1uv0kEeOD9nBIeIQYVU1eEa42
   w==;
X-CSE-ConnectionGUID: OeynMPRGSZuxNqBe7vUVVA==
X-CSE-MsgGUID: eVe1HsBOS9GU+xHm5YeLoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="40902057"
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="40902057"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 15:43:32 -0800
X-CSE-ConnectionGUID: kdRaaFnIRVOTV5c5UlRCLg==
X-CSE-MsgGUID: 8jD+3bmdTa2VHpadVfml5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,323,1732608000"; 
   d="scan'208";a="122470707"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Feb 2025 15:43:31 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toA0u-000Fdi-1S;
	Fri, 28 Feb 2025 23:43:28 +0000
Date: Sat, 1 Mar 2025 07:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 0/1]
 mm/kasan/kasan_test_c.c:48:6: sparse: sparse: symbol 'kasan_ptr_result' was
 not declared. Should it be static?
Message-ID: <202503010739.VvEtlzuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Matthew,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   0f76c0730afab52b8c89c218219f5d7acc2f3048
commit: a2f11547052001bd448ccec81dd1e68409078fbb [0/1] kasan: rust: Add KASAN smoke test via UAF
config: x86_64-randconfig-122-20250301 (https://download.01.org/0day-ci/archive/20250301/202503010739.VvEtlzuJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010739.VvEtlzuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010739.VvEtlzuJ-lkp@intel.com/

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
