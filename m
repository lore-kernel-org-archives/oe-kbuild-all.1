Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0472032D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Dec 2025 23:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767049320; cv=none; b=V10dfOU/DLgM9NVgDFNocXEhsjkw54ZbGVLe+gtXgxEpuVdLKJTY/MuKi8ZR0kaKnl7gH8IP7fjkY6+aTxH7SSFWL5f6xpyV7BSUsUOKOah+GscOxBQqf38aZMKuOfzDGwQnMqWkwkWUhNYPGL6GHPamUSGf2hAYh+oYkgtlb3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767049320; c=relaxed/simple;
	bh=EDQ2OuSi2g6IhITMd0Rx686JmDw8KNPzXf5W2npizHE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=DWJFQQyJh4lfONh5qNg5ZpfDnI1zcNxx+4vRJhzXizTQtbl4V2gtbEHCWplcIq+F2ivGNKL6pLRK6x+6gYljy/2HoPKUkZTJf+iinGGHBe87MyoFFchphqBOi0bm3JRIMTy0TFHRk/cO0wd09UHve23dEG3loAaysiz0tGBp03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzkdgaZ8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzkdgaZ8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767049318; x=1798585318;
  h=date:from:to:cc:subject:message-id;
  bh=EDQ2OuSi2g6IhITMd0Rx686JmDw8KNPzXf5W2npizHE=;
  b=DzkdgaZ8+AlN8UmACrQKSbR/EQwjBmKwqC/6rQzPlXPps8HCrH67QWqX
   +ZhyMmmCIUgbk3AS7kJgKNCnBHGudsQzW9ZAtOGharufKzOQTq9r+qkri
   LNdANlqMhKiZiWBg07L+aQ7UaGoqwxhzZsT5D+dgB09SLzqOlApM4R6YI
   xonDNOP8QwqAG5f7aZaSaKzpOIXOKzDdlcFPTnA2w6R9Hr2WaN5zHbgKi
   17hNKNldg7EXy7CysJG1CDnieM065tzRar+L8bCP566kIyZYsr9gU0cMi
   RFwxl7oOStnnuQeVplXLagEysPxPNe9VanlgvXNX28Sw3mWvgVFTRGqqh
   g==;
X-CSE-ConnectionGUID: 5lXkxh5HRIKF6JB6dTSn0A==
X-CSE-MsgGUID: ssbXW8gGSruGHFkh3bq/Mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="68815087"
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="68815087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Dec 2025 15:01:58 -0800
X-CSE-ConnectionGUID: F24ZAtXKTyS8wHHJGmKPEA==
X-CSE-MsgGUID: nq+4y4YpTAaufp8p210IxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,187,1763452800"; 
   d="scan'208";a="205559989"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 29 Dec 2025 15:01:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaMFN-0000000086v-48pq;
	Mon, 29 Dec 2025 23:01:53 +0000
Date: Tue, 30 Dec 2025 07:01:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: ld.lld: error: undefined symbol:
 riscv_noncoherent_register_cache_ops
Message-ID: <202512300659.54hsZftH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8640b74557fc8b4c300030f6ccb8cd078f665ec8
commit: 4d1608d0ab3365d1ef9447bdbc0cb4c0962f1774 cache: Make top level Kconfig menu a boolean dependent on RISCV
date:   5 weeks ago
config: riscv-randconfig-r064-20251230 (https://download.01.org/0day-ci/archive/20251230/202512300659.54hsZftH-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251230/202512300659.54hsZftH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512300659.54hsZftH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: riscv_noncoherent_register_cache_ops
   >>> referenced by ax45mp_cache.c
   >>>               drivers/cache/ax45mp_cache.o:(ax45mp_cache_init) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for AX45MP_L2_CACHE
   Depends on [n]: CACHEMAINT_FOR_DMA [=n]
   Selected by [y]:
   - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && !DMA_DIRECT_REMAP [=n] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
