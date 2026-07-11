Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402F92D8364
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 17:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783790827; cv=none; b=n/lr5xElMsaJ5czEGZKmIkJ6UEg2W0rvjU0ejVdK3xYE+RBGQaKMUUuGHdj/f0CDOVOKyfB4lXnuqsVVfzuXhUE0H0cL9nnCdUUNMPiM+akOd6g/LuclZXJ+4Y3fQssE4OQq4wwN0ulokNHMmL6kBEsZSn/69MXI5LBQZCLS7Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783790827; c=relaxed/simple;
	bh=DfA7iRpxOSOGWQThg8bRQupa607HWot+boV0ozd/75I=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FZ1qJCUfz3wWcKMbTYrXAoQyijfiXCvAEkAG3ekPPOCFp2HflEIbCBWEZDudMOph3VaU0QyLf3PmOxx3PnK/INPFzhVPJK4Jdqk5L6fDyv9npH04pFCiazzf8DZXgDRROzqWQZEsV19BXegilrhD8GJFlAX/ouN6DcuAUcuLbmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyWt6hiw; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyWt6hiw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783790825; x=1815326825;
  h=date:from:to:cc:subject:message-id;
  bh=DfA7iRpxOSOGWQThg8bRQupa607HWot+boV0ozd/75I=;
  b=SyWt6hiwNGVt4lYLhYEa7nuaW2IcshLKAgcz330VSvzl+TgNjHR3qffn
   z/FQgZZA9xlJ/L6OwZGCEUeaeQmLpVOL1c5fAMyu6alCQN1/ep+jFx3Yl
   9BInTGTB2LmJMTGL/3YulUmaKhqJPToNbhimIitEKoMvJQDrKtGAGOYWd
   eCSlF87vW0PBalus7t/pQxNWfBz7+EFoX4UXc0NbHLtVZRlmnud/YkSwP
   5ZZ/eZlGgkGSzxtiI4EE4un1qud22p5PBmnvCpowBKSt4rbCNXKDloF8I
   gt5MKM+5fP6+sgbuVvFARkKUgfqpjDIiTI9tuZrIkiHAdBZ9gA+SnXmDQ
   w==;
X-CSE-ConnectionGUID: 2ookOF/gSd+JKlIR0sedvw==
X-CSE-MsgGUID: oYIzgkFNRROfSkzHgM/DYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="102017652"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="102017652"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 10:27:04 -0700
X-CSE-ConnectionGUID: dOOP+VupTEOlihLokzk8lg==
X-CSE-MsgGUID: HxKN/PG1RHOLslyPUSRQPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250742274"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2026 10:27:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wibTg-00000000KEL-1Rvm;
	Sat, 11 Jul 2026 17:27:00 +0000
Date: Sun, 12 Jul 2026 01:26:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/1] WARNING: modpost:
 vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove
 __init or EXPORT_SYMBOL.
Message-ID: <202607120153.4t6g7l9z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0026e4ecedf04706daa23af4ba4b973ff966a55e
commit: c0383ca2116fdaefcc84987374253442c64a6675 [0/1] Revert "ANDROID: memblock: Remove memblock_end_of_DRAM() export"
config: i386-randconfig-011-20260708 (https://download.01.org/0day-ci/archive/20260712/202607120153.4t6g7l9z-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120153.4t6g7l9z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120153.4t6g7l9z-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
