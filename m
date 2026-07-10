Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD6D3F823A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687108; cv=none; b=S57xZyTXHXmw8xbtHP0kxxRBa2UnyARAyb6mTUIMV/Z5jdu1L4kIYx3ydEXioWzjhXVg77M0cmQHuCizu9WADVndn0aZczNr62X4xN5WDURGBtwXG4fpueW/KeGgkAd/W8l1uvFzI+R4zGo1iFiDrgqaLsfYWu1Lhov9QHUB43w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687108; c=relaxed/simple;
	bh=0peIXu2wL22ReYA/MTFZjjjafIh3u1ViJRd/Q8iGwr4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pzfp7n1gsFYri3//t/uCI0N+KivpKKlVVcAAWGfU/1/ZxEk/QykLyVirVfDBGbpYvZsfTcgik48G63IOjWIeA/KvtLyzDVnXyqcQlnKNvEwrcD7aAph7UvYXVMUhnUKb43wvtpCX3or+sRg3gcchlJglMZi03f88TTGnIlSKzt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V++A9Q9h; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V++A9Q9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783687106; x=1815223106;
  h=date:from:to:cc:subject:message-id;
  bh=0peIXu2wL22ReYA/MTFZjjjafIh3u1ViJRd/Q8iGwr4=;
  b=V++A9Q9hoaaWW9Kzw6O756MlW12VzwvTSC2cDEcUa1NoNiLBxKAUUbff
   MHUJCyPwJf+F248z5ZqgS/QDIxcnFIKvzMN2BnM+FDnNtqS0Vm0M2k2eN
   so82I1td4s8PaUdPV0nDmP5TJtBe8e6bQIqgRGaAKKmzwW2nPiZBF9KJW
   GS+BlzRGS5WjepDkYoMkxCtgfC/G1AxZ0bKtPAI2OzlBiF18rYR+VHZ1A
   AIYo6wQMLgnBx5nl+24XUaffvpMfCiD9EGMbfvyzwyrl9tiThkFjrVAs9
   YK+jejf6Wtcf6p3Phfu8ZP/fiiv+PisRvpBZeirRSPvCJGF29/26hW/wc
   w==;
X-CSE-ConnectionGUID: BrLzdl03SAG+0rQsUMO2Rw==
X-CSE-MsgGUID: zrojypOBR52nhtDmQs0s5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95756518"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95756518"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 05:38:26 -0700
X-CSE-ConnectionGUID: DCwEK6beTXql4bAs9ZFSRQ==
X-CSE-MsgGUID: 3ITsLje+TEmCMLR6V82BMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254372697"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 10 Jul 2026 05:38:24 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiAUn-00000000IuN-19Tj;
	Fri, 10 Jul 2026 12:38:21 +0000
Date: Fri, 10 Jul 2026 20:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10-2025-09 10/10]
 arch/x86/platform/efi/memmap.c:94: warning: Function parameter or member
 'data' not described in 'efi_memmap_install'
Message-ID: <202607102017.I5s87RY2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10-2025-09
head:   14da479a0598c499bcf969190a55f04cff7e15a1
commit: 31e0721aeabde29371f624f56ce2f403508527a5 [10/10] efi: memmap: Move manipulation routines into x86 arch tree
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260710/202607102017.I5s87RY2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 0a2fb2a2269da0e2a3e230beb6cad39ca314db33)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607102017.I5s87RY2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607102017.I5s87RY2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/platform/efi/memmap.c:94: warning: Function parameter or member 'data' not described in 'efi_memmap_install'
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
