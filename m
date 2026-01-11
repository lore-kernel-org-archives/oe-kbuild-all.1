Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60237347DD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 23:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768173676; cv=none; b=DaeDTB1PyS6T7+RizLNmqFTDzWNeFOhb7dMoc8/r5VulBRwmByf3TXEHeJ4EetzNJah6ZQzCxX3Bmr6YnvUGuSVmYku27brcCmtSbPbKTnIhTwCUfdJaoeZnINC+1Kx4ioYLq6mfPebNSh67cws2gr296XbpEt3uMF24lJ10Q8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768173676; c=relaxed/simple;
	bh=rmg9khLx+bVFsxKuQfDqFDH5if1gqst1PadqBIEWdl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pkvXu4BQKmh+zH32dndf7UtvFucedUZsjS/fpJG4YDKIN8MEW2dwa+doCrwQvY0gM2h22DWoER42CHAyg3aVYUTuSNmJIzkDg7y313dyXmra8LXwVU5zVoVEsSVj89Mj/NGsJ6vjRWKKKHeLKXIDmAsO8dD1bzQePsf1opcpyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4ENHiKa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4ENHiKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768173675; x=1799709675;
  h=date:from:to:cc:subject:message-id;
  bh=rmg9khLx+bVFsxKuQfDqFDH5if1gqst1PadqBIEWdl8=;
  b=M4ENHiKadjADFCiVk/s5TO8UIA2hQhgNAQiT5uFbAXfv6O+hv/Wh+j9P
   /fpIMq0/l5D1VtlYrdbm1kxWJq9TEP1Y3ih/fMxO+qsbgaVThKjxcB7Sj
   8XGPC6fUskYOTjrnDftxdFNzBuPz2aEmN9xlCOmYyOoD8EkjZHIk9ZZve
   Khz+CMEbGrIxe2Uz1raQCJociLkJlwlygz8lTYGm7KGoLBLzi8C6iNRxI
   ae7xZRX4bNQ93j3GAegAemV9XZdChLSt+ifPS0EZa6n+AgWI2TrizqWDd
   2nnpTUosH4E/X+WCpyUTi8isF/aW8b+T2nkjiuXyLj/iMiIJo1Y+amma1
   A==;
X-CSE-ConnectionGUID: HyAizRIERGSfU7/wuo/18A==
X-CSE-MsgGUID: FxMN1mexQ2WyqMQl9ndlTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69503227"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69503227"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:21:15 -0800
X-CSE-ConnectionGUID: +QN/Lz2eRp+i4oFFr7EQ2g==
X-CSE-MsgGUID: gNF3/ucTQd+zYIHbIhf25A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203097807"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Jan 2026 15:21:13 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf4kA-00000000Cla-2l99;
	Sun, 11 Jan 2026 23:21:10 +0000
Date: Mon, 12 Jan 2026 07:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [akpm-mm:mm-unstable 47/164] ERROR: modpost:
 "arch_enter_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
Message-ID: <202601120711.6hvwP9kh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   4d2d0ad5d6a267cb4473e5f50e1b363e8a9fac3d
commit: 5c2d9373a742480bdf4d679da96fef6bbaf4db75 [47/164] mm: add basic tests for lazy_mmu
config: sparc-randconfig-r072-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120711.6hvwP9kh-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.3.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120711.6hvwP9kh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120711.6hvwP9kh-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "arch_enter_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
>> ERROR: modpost: "arch_leave_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
>> ERROR: modpost: "arch_flush_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
