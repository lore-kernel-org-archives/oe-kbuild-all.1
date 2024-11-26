Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC981D63C3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 15:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732635760; cv=none; b=SWX/HpxSCwwIbV4nKr6uelP7DBeiTuAZ8XiwobwDqI5oRDeFeAErhOD0lDuaI/hP06tw68pQfxCuiNpcj7o+hBQMoJeoshmYrsd3X6WP6oGb0U3VtWfhnEFf0T/Xqh3JH56xPTsG7k5+f1dDYMNY0kDzEwIJ3Szpq14TAnkJGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732635760; c=relaxed/simple;
	bh=3WyGqMEvNweL26J6Oe8xCH3TwV1Lxv+1Rl9Z2Pwj8Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g9muLtVWlijyvcvlHjxy1rkMryZNo66ayO284K79INFO0oXctg8lMz8QaLJeiii4f6QugQCJtoucexrMpf5DfOvAMnScEQ9ujqLZ+NFhY9g5nnJDVjW5FCW05tkMyOUhhuweY6QoHgVLryzD8990SWinTHm85d/kgfpIiGOvK9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ON9qTme/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ON9qTme/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732635759; x=1764171759;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3WyGqMEvNweL26J6Oe8xCH3TwV1Lxv+1Rl9Z2Pwj8Xs=;
  b=ON9qTme/hdjgXFJWF9J9TkP5izg3wDJO8TYUurj5I9XRfiz/cYAKNd0N
   NvpNPck5PVk1XG+i2NCehdwMssl/bWI3nyy21qRhSkHW7fLlu/4MO/gSf
   k8zJIvWzRGQvDTxNlS3FQjVG75aunknoh9Qb5GTiFlaoZmk/ZOPp36Vtk
   YoL+7lXA1oj49YxV2Gi6bG/B6o2o1soLekWXaxnQh7CUQDAXA0aBcL/ec
   xZiwTIRdBmvp7ZKqf4hYVHf9B/lfMedAbXMctIJD4SDDHeorEzExBU5lZ
   69d2WCwL7wtsclwkZVZ75CKxsvLs0t0l56lte7oBj4lAB7P16lNFDTa/E
   A==;
X-CSE-ConnectionGUID: IeL9J/CxR2+H6t7kzTR/qA==
X-CSE-MsgGUID: NYtOJk8tQUKxL55cKMDOrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="43462093"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="43462093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2024 07:42:38 -0800
X-CSE-ConnectionGUID: 6w3hGYDkTgy9Hs+t6LPJbA==
X-CSE-MsgGUID: +LidBc0YQ5iWi00LxSf1cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; 
   d="scan'208";a="114916668"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 07:42:37 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFxhz-0007NR-1m;
	Tue, 26 Nov 2024 15:42:35 +0000
Date: Tue, 26 Nov 2024 23:42:16 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 10/11]
 drivers/firmware/efi/libstub/zboot-decompress.c:42:13: warning: implicit
 declaration of function '__decompress'
Message-ID: <202411262318.M82fpGhj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   738cca58590ea7415e710f5ee3871b5187d8c2b9
commit: 689ef0c8c6fe169b879dd7b60d22b74f31979957 [10/11] efi zboot for x86
config: x86_64-buildonly-randconfig-003-20241126 (https://download.01.org/0day-ci/archive/20241126/202411262318.M82fpGhj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411262318.M82fpGhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411262318.M82fpGhj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/zboot-decompress.c: In function 'efi_zboot_decompress':
>> drivers/firmware/efi/libstub/zboot-decompress.c:42:13: warning: implicit declaration of function '__decompress' [-Wimplicit-function-declaration]
      42 |         if (__decompress(_gzdata_start, _gzdata_end - _gzdata_start, NULL, NULL,
         |             ^~~~~~~~~~~~


vim +/__decompress +42 drivers/firmware/efi/libstub/zboot-decompress.c

81b8598a12db97 Ard Biesheuvel 2024-11-20  36  
81b8598a12db97 Ard Biesheuvel 2024-11-20  37  efi_status_t efi_zboot_decompress(u8 *out, long outlen)
81b8598a12db97 Ard Biesheuvel 2024-11-20  38  {
81b8598a12db97 Ard Biesheuvel 2024-11-20  39  	free_mem_ptr = (unsigned long)&zboot_heap;
81b8598a12db97 Ard Biesheuvel 2024-11-20  40  	free_mem_end_ptr = free_mem_ptr + sizeof(zboot_heap);
81b8598a12db97 Ard Biesheuvel 2024-11-20  41  
81b8598a12db97 Ard Biesheuvel 2024-11-20 @42  	if (__decompress(_gzdata_start, _gzdata_end - _gzdata_start, NULL, NULL,

:::::: The code at line 42 was first introduced by commit
:::::: 81b8598a12db974574994b2c0448f1e2ebf4ff15 efi/libstub: Move zboot decompression code to a separate source file

:::::: TO: Ard Biesheuvel <ardb@kernel.org>
:::::: CC: Ard Biesheuvel <ardb@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
