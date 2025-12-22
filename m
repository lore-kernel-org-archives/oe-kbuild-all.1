Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D262333D51F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 10:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766399165; cv=none; b=fa3Zxw02Xx+OjkvVq2EFjLYFcrD55iIolVVtkyscHMr3G2neH5JdrvI109K2ZjacodFdluOzFAA7VhJ/vWAw+we/PNVCy9DXetdqQKpI0gNhOWRyhBh2VbU8ZUaIxP14yib0Tm7Qx/dRamtBTbSu5Rko1nmViOJ35AhQMoEn2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766399165; c=relaxed/simple;
	bh=W6G0Y54AKitJY4BXJSSvb5I7FlUQE9YTG2qdYCg2/WQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XwAPluGaEv+zTWKfFqnE+FRjuSagZ4Ggv36C52l2YUkcz0TGhZlVroLLrVV1GpNFVb/DqMOOCKALJAgWQ1qUoBxGA9yDeTy0DO8G0/R3j0Ax3i9d+LyKTvIEeLIqdIkR7F6FDQ1Q/wg1dpHTgV53Llw2MaLtYzdKqSJPoWUGyMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0s2pzzW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0s2pzzW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766399161; x=1797935161;
  h=date:from:to:cc:subject:message-id;
  bh=W6G0Y54AKitJY4BXJSSvb5I7FlUQE9YTG2qdYCg2/WQ=;
  b=R0s2pzzWxRFAYlvhytp3f0mP1tNIa7oSirZgD7f/8DKi7XI+FFFOiOuZ
   no/2Yr1GwsjgXZQkmlBwKOJ8o7ffhYrMkpplzvhtKpTXZbFmrG+y0OP+0
   eu2mDLPCpDe5ZdxW45ArLO6mK3KEfZcxj5ROEoyWZLWm4C3u19mwTRigs
   OY3z1w4tZ6ZPI+G5KJMH0VvhyIesYyuuCDWF/As9VELyzN2ukFqZub+KG
   IL+XA5XmsMaYxiGgOMhyYZd/Cp1ihl2o4hKDmKcdHjH+A2gsgy2FadtpM
   SmsVmUdnX3oXE1qnVzpldRkJKW5Dxy24fAcjmW0l+d21W6vuD11vfo5Hk
   g==;
X-CSE-ConnectionGUID: R5PE4wziTB2zVzzPQoLuOg==
X-CSE-MsgGUID: U3DRJY1/TpuBu3+8Y5m4CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68297234"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68297234"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 02:26:01 -0800
X-CSE-ConnectionGUID: 4kWIjmNwS3miMJwqAxjKSQ==
X-CSE-MsgGUID: KKoFmCycQxWVGY4f+vMSVg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 02:25:59 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXd6z-000000000Ny-1n3N;
	Mon, 22 Dec 2025 10:25:57 +0000
Date: Mon, 22 Dec 2025 18:24:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 42/42]
 arch/x86/platform/efi/memmap.c:94: warning: Excess function parameter 'ctx'
 description in 'efi_memmap_install'
Message-ID: <202512221830.3WosvhG4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ard,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 0d01140e921757455730dcb6c00e45a0383f1716 [42/42] efi: memmap: Move manipulation routines into x86 arch tree
config: x86_64-randconfig-015-20251213 (https://download.01.org/0day-ci/archive/20251222/202512221830.3WosvhG4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221830.3WosvhG4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221830.3WosvhG4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/platform/efi/memmap.c:94: warning: Function parameter or member 'data' not described in 'efi_memmap_install'
>> arch/x86/platform/efi/memmap.c:94: warning: Excess function parameter 'ctx' description in 'efi_memmap_install'


vim +94 arch/x86/platform/efi/memmap.c

    82	
    83	/**
    84	 * efi_memmap_install - Install a new EFI memory map in efi.memmap
    85	 * @ctx: map allocation parameters (address, size, flags)
    86	 *
    87	 * Unlike efi_memmap_init_*(), this function does not allow the caller
    88	 * to switch from early to late mappings. It simply uses the existing
    89	 * mapping function and installs the new memmap.
    90	 *
    91	 * Returns zero on success, a negative error code on failure.
    92	 */
    93	int __init efi_memmap_install(struct efi_memory_map_data *data)
  > 94	{
    95		efi_memmap_unmap();
    96	
    97		return __efi_memmap_init(data);
    98	}
    99	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
