Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D5272618
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 05:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765517008; cv=none; b=u/wTVrlIVWvZUydFn8XsBSTOiNcht9BtSU0OfvVsRYm+J/3jQ7MK4eCjidP72bI+MR2Pqf0YWK2uRZUYQ0KQnpDyX8ZyGczYODHbuBaquwTWugq2k5zudGc1B6NyJQV2bdWBUZ1O5MNVRG+qb4heXRPliACI2jTIbaFY2/0ihpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765517008; c=relaxed/simple;
	bh=HBH9M169EyxswxxcXy83Gtw58wnt9DIP0DG3n/W9nwc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hsse8cDfcBgV2B+QmxipShgkhVRjL2EiXHL8pqP5UNR6R2bxmGI/YycMcQeWQ9R5I9in4wOjZENksOZh0S7R5PtYvS2Q9BUyqILreM75lkWmdYG3vEn+UV1PIPWEzrlse7gjjhVuTTRjuIdSXOjltjumYUq0n6zEoamgO2xUGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mdn755X3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mdn755X3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765517008; x=1797053008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HBH9M169EyxswxxcXy83Gtw58wnt9DIP0DG3n/W9nwc=;
  b=Mdn755X3K7RGfGBoDgi4jPuyW4Augw8EJRm5LMNPuaFIoRqiXEy0sXFs
   j0Svy8HaS8PghlzZ+FaTh/UNu0VJIy/LSeACsifIV4tIEHmHMdqjFA1in
   j77OA8t1A7xye5+R4sUv8KX1I6Lg8Ioc7GOezR90DS++l+k0yM6eRudGi
   JHNTsyc9MewPjoAaoVoMfYQP7kE+m8t1iY3/N2N8+w1Sj6rY8SlCFjeGd
   zje2QMuQjTcCDAiv4EoFmI1G8UOUNMje+wm3xsFlE9R3vqxbnbSag63sn
   tSfR3Tx7eInTvkD4UFgN9AnkqUTl3ilFNeyoeHLfu26Vrq5tVGixN4Si9
   A==;
X-CSE-ConnectionGUID: 9I3n85peQoWoY7lOGfVRxA==
X-CSE-MsgGUID: 36f6Ta2nQq60J93J8XGSEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78615691"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78615691"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 21:23:27 -0800
X-CSE-ConnectionGUID: aLokKDnXTy+ytjQ/zHZNUg==
X-CSE-MsgGUID: RBmPKIgeTlufvvVxDOGTsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="234390041"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2025 21:23:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTvch-000000005aJ-1k9r;
	Fri, 12 Dec 2025 05:23:23 +0000
Date: Fri, 12 Dec 2025 13:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 4/4] WARNING: modpost: vmlinux:
 memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or
 EXPORT_SYMBOL.
Message-ID: <202512121350.P0ZqJowR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   3a6f5d8bb93a24a08c3bcf615b349a5d93e4a265
commit: c0383ca2116fdaefcc84987374253442c64a6675 [4/4] Revert "ANDROID: memblock: Remove memblock_end_of_DRAM() export"
config: i386-randconfig-002-20251211 (https://download.01.org/0day-ci/archive/20251212/202512121350.P0ZqJowR-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121350.P0ZqJowR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121350.P0ZqJowR-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-mgr-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-bridge-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fpga/tests/fpga-region-test.o

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
