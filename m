Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9597025524C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 16:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765642896; cv=none; b=DXga2PCegcqsnLe0LH5xl2ydJzr9+1Jx3G+LHy/gxZK2tNtEtOTgc+8rcGJ5Mfs4WNoazC9NPLJc7YfQvGFbTEI3YP7LWcN4dmhLAXf5EvHZzT8G/etsbxLybOJ8dLfp3eKeBdYO2hPu0Rmwjy7NWh9D0TgB6GGTjrU7UG9yGRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765642896; c=relaxed/simple;
	bh=ZjW3jmsdJiCwtE37XsWNxqCFJiV8mU+QwRiEMcdeFZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gFQT+2JLbwXx8MbG4skdglGKrwuQ/fGnuMgnOmqIacu+i+t817S05d/2zu44xvoZ5GTeSK3cTVG4cwSv2fHlrmPKMejAxf0G//hZOqHQ6KDNUqu6WEm+soFxEV0e+QtCegHikoOwrDdpo7xme8QYIadJY0fDQDxktKsiJ0le+TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+k8OSQ5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+k8OSQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765642895; x=1797178895;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZjW3jmsdJiCwtE37XsWNxqCFJiV8mU+QwRiEMcdeFZI=;
  b=G+k8OSQ5I0+xePKoO3/EAmCa+hgJJyLkIGogGfooQbt6hea51vC0mDGQ
   79nPDTWtvpxo7IiVjj/iKTOhkmn5WNKYa78pTitm5xNE7671Jt5y6bu0I
   upCnP77q0A/4owtbdxfHzPhxz/0vUUTzX6+QimjcHODoGaaXhsjbIYmXy
   QlfasIg0a4ddYXaSL4pT6v+cyDZEJVQcNrcGW3d8Vfm5qOVLVj1mVI2IK
   52sjetx5Muzt9cs6yawjlwAICWyUV4gsojEfU4QeOM3g9tZBwUiEm0Gnm
   f3z0/cxo8XgBSXbmOx4xByRie8R7xmQOQj4x5flqS9hn9fw40HAy2SBar
   w==;
X-CSE-ConnectionGUID: RB71f9iLSPCckwIgUv8kxg==
X-CSE-MsgGUID: fb/Ox6+jQN+wK9Dbpv6pFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71244082"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71244082"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 08:21:34 -0800
X-CSE-ConnectionGUID: t+WxSE0nTyGO5V5eT+lEXA==
X-CSE-MsgGUID: Gets/Vh1SxeRkzDfNigzzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="198162960"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Dec 2025 08:21:33 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUSN9-0000000027o-02fn;
	Sat, 13 Dec 2025 16:21:31 +0000
Date: Sat, 13 Dec 2025 17:21:07 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 40/40]
 arch/x86/platform/efi/memmap.c:94: warning: Function parameter or member
 'data' not described in 'efi_memmap_install'
Message-ID: <202512131739.FudVOSw5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   ebacb5ab3a1e5bf8dc788a29244f0e68d00a5bd6
commit: 0d01140e921757455730dcb6c00e45a0383f1716 [40/40] efi: memmap: Move manipulation routines into x86 arch tree
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131739.FudVOSw5-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131739.FudVOSw5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131739.FudVOSw5-lkp@intel.com/

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
