Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09CC36402D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 17:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779470488; cv=none; b=kf4w2HaC7WW3mCpfsD0k4Pn5leEDhIp3jYC99XlixMn1EL5Z52fCvtMKsLTZPcwEBZSosIlQaTdO7Bea6KxUvVzpVi12zhurEJDx3FOEcfu0B9VqrKO9DIB67OxPkVYrxCYhpoBCR7dItNqBt9xFnCxw2ifXjTehd0p6sFDGYTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779470488; c=relaxed/simple;
	bh=TRL2cwf3+7Z7+biN96EeV6p3epMie9UWjAketI4kCB4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ViSv45mfEySA4d+MTDt0KkppQ/LA/2P/bOJqdm4leo9NQsYPghGijpesdkfz4v7z0so0A9pfVWzfR2J44zJRPfuYlIBtVG7++wFP7+xbJf0IZLls4n4PVSpk7/K0UUyqnx5aGFAf8Y7wTrPV4BM90YVaLmA1ceFtUm8JUf+wow8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SRICd66C; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SRICd66C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779470486; x=1811006486;
  h=date:from:to:cc:subject:message-id;
  bh=TRL2cwf3+7Z7+biN96EeV6p3epMie9UWjAketI4kCB4=;
  b=SRICd66CjkOvzGLQsEfkkQuU7UOAGIaMftv7pdhU0WEkpUvmfQtpDmN+
   twY0Qt+yZKghxWrkTW9vW70+DMFA7zgtmALP6LO047vXPQcVSttQ/ZGeB
   5nPJT3My7dMc9umMbw8Y0Kw3FVvfj7e0AcUVQXszCqE4EQB6LFkYLYu5W
   YfeF1ymy1DEAZ/FLUGaQRV62tnyl+xcvqZJDO0KOQKvNQwkGZadEHy6Ky
   bdwsmWUFzcZJPawN2A9VfZWjWonH3UqUILY8UHFFwuSe/cSskeFg2EazT
   txhU5yky8TVDpnbHXVOQY11PvxWFFewMUVYugjZOcSN8Jph2ne6B6qMeq
   A==;
X-CSE-ConnectionGUID: FKeB5NnGSyi1D+qhej9wNQ==
X-CSE-MsgGUID: aoyF8B88Rqmh/Kd4tzyHRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="91513884"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="91513884"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 10:21:26 -0700
X-CSE-ConnectionGUID: BABpd8x9Tr6H1kI/T+D0aw==
X-CSE-MsgGUID: tXxBVE1GTIWvqxRfJNnocw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="236540774"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2026 10:21:24 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQTYo-000000002mv-24bF;
	Fri, 22 May 2026 17:21:22 +0000
Date: Sat, 23 May 2026 01:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 0/1]
 include/linux/dma-buf.h:547:2: error: static assertion failed due to
 requirement '__alignof(struct dma_buf::(unnamed at
 include/linux/dma-buf.h:547:2)) <= __alignof(struct dma_buf::(unnamed at
 include/linux/dma-buf.h:547:2))': include/linux/dma-buf.h:547:...
Message-ID: <202605230131.GZ69Re8e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   59d87130986d0a57ef63b29b5e823ed093472d5a
commit: e24cc2d5218669b7412788d57528059ec6ecee4e [0/1] ANDROID: ABI: refresh, CRC fixups and allowed breaks
config: i386-randconfig-061-20260522 (https://download.01.org/0day-ci/archive/20260523/202605230131.GZ69Re8e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260523/202605230131.GZ69Re8e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605230131.GZ69Re8e-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/exec.c:72:
>> include/linux/dma-buf.h:547:2: error: static assertion failed due to requirement '__alignof(struct dma_buf::(unnamed at include/linux/dma-buf.h:547:2)) <= __alignof(struct dma_buf::(unnamed at include/linux/dma-buf.h:547:2))': include/linux/dma-buf.h:547: u64 __kabi_reserved_backport1 is not aligned the same as atomic64_t nr_task_refs
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:2: note: expanded from macro 'ANDROID_BACKPORT_USE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:66:4: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      66 |                         __alignof__(struct { _new; }) <=                \
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 |                                 __alignof__(struct { _orig; }),         \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/dma-buf.h:547:2: note: expression evaluates to '8 <= 4'
     547 |         ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:189:2: note: expanded from macro 'ANDROID_BACKPORT_USE'
     189 |         _ANDROID_KABI_REPLACE(ANDROID_BACKPORT_RESERVE(number), _new)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:79:3: note: expanded from macro '_ANDROID_KABI_REPLACE'
      79 |                 _ANDROID_KABI_NORMAL_SIZE_ALIGN(_orig, _new); \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/android_kabi.h:66:34: note: expanded from macro '_ANDROID_KABI_NORMAL_SIZE_ALIGN'
      66 |                         __alignof__(struct { _new; }) <=                \
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~
      67 |                                 __alignof__(struct { _orig; }),         \
         |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +547 include/linux/dma-buf.h

   539	
   540		ANDROID_KABI_RESERVE(1);
   541		ANDROID_KABI_RESERVE(2);
   542		/**
   543		 * @nr_task_refs:
   544		 *
   545		 * The number of tasks that reference this buffer. For calculating PSS.
   546		 */
 > 547		ANDROID_BACKPORT_USE(1, atomic64_t nr_task_refs);
   548	};
   549	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
