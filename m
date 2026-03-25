Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A19312815
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 05:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774417761; cv=none; b=FxmjOpPjy2GLdHv8BO9zi6xpaCewGHyfI/23BUCnkJ4SopW49yoKGNHH5shtXzUDyPvsMM12MRQYF+IqRsBoq1iLCAwk9zurIdX731zCKBL1I+gAO5OYlHEKBctcso+pJtpBKmmsrvM07wokKvuUMu4ydW7rkFKoVmA7y8mWlkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774417761; c=relaxed/simple;
	bh=llu1MMvw2SxUdoVVteWTUFklzRA6uLgbnC0urwp4tWw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SPWU5gadjRSLPXQZH6YiYqT5CjpBXIo7LCfZdj7eYeqGVJw0+eUuO12YuHEleVkYccs28RtRffZpYgOw4BAv28jOEuUONveo9c2ZrGViAu5s02oV+BYIvfu35aJ5jbOMm9MKm9N2fvIxtqLbI1zW93dTzbSzZW+0Kv6RdUBaeH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V+54NpSG; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+54NpSG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774417760; x=1805953760;
  h=date:from:to:cc:subject:message-id;
  bh=llu1MMvw2SxUdoVVteWTUFklzRA6uLgbnC0urwp4tWw=;
  b=V+54NpSGNhDQxAK/iFr+2AGMbQlytrXq4PNPm9pjXte7NL3OB2GGrPd4
   GZbllv3dq0SWyeVJ9gNgO8JSam5XkVMtJlqSfhw8lmhbsjb2PxaDOV65I
   pKy7NrD0YJ3K7Dgk5wUL+yT63inj587e1C5LZjg3SbJyJYnFyZCE0whOH
   lA9UAbLN1GQrd0GGo6bJHDgYCRkl1X7+bfibbtZAGTpOfdW+OKI4/337x
   LC5UIS6HJDMdMSO9rCTI/M85qsnTocy0NZkqm5J8QvA2UZZHWe3LTRl1y
   glxwAmajUGaGnlhV+mQSBBZYAXtnAGZerv/+ZHRl9Ky56/1sZjtB4MTBq
   Q==;
X-CSE-ConnectionGUID: B5EHyqnmQve77Q0dmm0XCg==
X-CSE-MsgGUID: A/fhMiMnR4+HNCysXa0l3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86142216"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86142216"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 22:49:18 -0700
X-CSE-ConnectionGUID: v6mRHOoyTsixH/UNaUfihQ==
X-CSE-MsgGUID: 4tR+5TolTteORWh5SQQJ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="228647095"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Mar 2026 22:49:17 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5H7C-000000006GJ-38IP;
	Wed, 25 Mar 2026 05:49:14 +0000
Date: Wed, 25 Mar 2026 13:48:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 4/4]
 arch/x86/platform/efi/memmap.c:94: warning: Function parameter or member
 'data' not described in 'efi_memmap_install'
Message-ID: <202603251358.4YpD6m0L-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   fc88a7504f0f262cc5b2e8a7f58b2a1108034856
commit: b898fae96331e9b9d67707e91c073118ae9e456d [4/4] efi: memmap: Move manipulation routines into x86 arch tree
config: i386-buildonly-randconfig-004-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251358.4YpD6m0L-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251358.4YpD6m0L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251358.4YpD6m0L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/platform/efi/memmap.c:94: warning: Function parameter or member 'data' not described in 'efi_memmap_install'
   arch/x86/platform/efi/memmap.c:94: warning: Excess function parameter 'ctx' description in 'efi_memmap_install'


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
