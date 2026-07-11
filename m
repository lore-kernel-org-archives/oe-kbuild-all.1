Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B2534AB03
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 09:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783763426; cv=none; b=qpy+J2cnHx2vHPNDB0TrykStGgIIGuo2bV3sijd75CwVa+49ul2KoGJSFtxRBt9j6tZyaNDXJPUADnb9y7KTpReTaL1JLE6N7x5n3IdVuZHQfA2mOUgcwj74D70R2fbhuNTOhBfn07UEQWHvDCaI2x6xm3R+5qjhEHhDPSy9cfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783763426; c=relaxed/simple;
	bh=qUoCyUc4PdNUYouest8xa0GgWHWpt9gG1PFV/MUXDAo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IYLuooabhYUGnFEbEBpGEocXDmRNDQM/p/sXg4Lyu9g3Nz3nodZ22e44BY9Iocj+Emepre64sCYTAvNJHuNsRCNaYVLkkihYFz54k+RaxiPz+41H/DowsjvGZ/0o7rRI4llzJee3BwQ3a0/2OnhRIPBF7RERFLqgps+oOA3C2c8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEkRc9rA; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEkRc9rA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783763425; x=1815299425;
  h=date:from:to:cc:subject:message-id;
  bh=qUoCyUc4PdNUYouest8xa0GgWHWpt9gG1PFV/MUXDAo=;
  b=nEkRc9rAm5ZUewxvPWNnghUoV2/xckIqcGWIT7iyZ93irT5j0ZfvP/ea
   /3/zv2hBcjdJN/pXCXv5KXOpKj741hrAuNwXqGxP/hnZmXhmD4hpDuaBI
   lmFUEXSxSBLSjBL8FZT6v6gVw6Ev4RBoRcKw6s3yW1LvPbaDpr5QCseJQ
   QeFFhILwSIb9N6Uff58Vfih9uZL6ae4fCHIJQvcRhXWt4sf6trSCHOYDY
   QtVeUIZ54sqDU6LTd6JKQvJEma/a2fLNQOcqpJ9w0WFFb7Xe4s39BM/9u
   Zw98CvcBsT6acAtazbEW0pgfwo5HzpIIk3skpPw90rpGXSrhVx+g8oJJT
   A==;
X-CSE-ConnectionGUID: JcHnQ++BRgawz1eikQBLbw==
X-CSE-MsgGUID: Af+5+5o9Qme2nmmBHAkB8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94800636"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94800636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 02:50:24 -0700
X-CSE-ConnectionGUID: IAqS2oqPRHmsTJZvxVTU8w==
X-CSE-MsgGUID: OW7/gOVuQ7KcYe2BMKK62g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255747421"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 11 Jul 2026 02:50:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiULk-00000000JxK-0ghW;
	Sat, 11 Jul 2026 09:50:20 +0000
Date: Sat, 11 Jul 2026 17:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 16/16] Warning:
 drivers/dma-buf/dma-heap.c:45 struct member 'heap_cdev' not described in
 'dma_heap'
Message-ID: <202607111724.f6t0E4Nu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   7bc9a2fb983f2f1c49c6e3f47478befd7ac1f94b
commit: a5f9b0171db0c1e78d2c8da744f82ee20b2064fb [16/16] Merge 3e443d167327 ("Merge tag 'docs-6.16' of git://git.lwn.net/linux") into android-mainline
config: x86_64-randconfig-014 (https://download.01.org/0day-ci/archive/20260711/202607111724.f6t0E4Nu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607111724.f6t0E4Nu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607111724.f6t0E4Nu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_devt' not described in 'dma_heap'
   Warning: drivers/dma-buf/dma-heap.c:45 struct member 'list' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_cdev' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'refcount' not described in 'dma_heap'
>> Warning: drivers/dma-buf/dma-heap.c:45 struct member 'heap_dev' not described in 'dma_heap'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
