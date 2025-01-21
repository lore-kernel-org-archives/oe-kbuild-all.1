Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E4126281
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Jan 2025 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737430396; cv=none; b=uQOxjTbQGaayoeTUwK1MnjQg/blDekYtowjeqyvaCqxG2vnSDiycbw1WYnfNMvLFxtBtCNygdmpj4la+2EBJpp8V/TFJF+KNBGqHdTdnCiOX3B1R7euRMq98/y6W91qO7+Xp5l6q8Slk1YENJQVklxLXxngLvPXuDiP/Emd3N5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737430396; c=relaxed/simple;
	bh=K1YSzZbu4SLN1YTVntSB2K6gqsUqhH6YUP0jgp0dWXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dqRg1YCO2ylydt9Yb/MUNB9/x6SRYip6Lc7bKpLKzrbGvmzSvP86gjIrTa0Wotde9ufU8mLQU3VD3QFCTkV75fA0v90gS0j8Ix7W/XQvIV3LIIfjJPHIDFZDI8eo/A7QtDq+BlRFZXPSbYVpd77U3O2ZmRx+bm8dCcfAGjp9Xbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kCOOikIa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kCOOikIa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737430395; x=1768966395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K1YSzZbu4SLN1YTVntSB2K6gqsUqhH6YUP0jgp0dWXo=;
  b=kCOOikIa4tY4TL/xOYOuNuHhcbHv1dQRBYfP/iTNTv/046VvNxUGEtiA
   kBY+iCnq9MvmjOY/2zPXptbStDWEICYOF+t/ZDpb2twaEJXRrgfO8/nKR
   imClscZVQbVHSl4pkNIplGlBsUFo0w+/7KAdx0Uk5X+164zNpeZxUiLO9
   7dZ9gqDv9RjNAryfer2i1PbefGLBIjlY9i3DMQAbI+Te4h6sgocfKzSBO
   S3VtO5E+omn8uczkFP8RineoroAvjUunG24m4/rwyng+8y6zW1sE7MTcU
   C8RFhNKPni34idU+6U0Yx9lUzao2sVwMHQlYplOMSKRsK18iwfHDlAmIw
   Q==;
X-CSE-ConnectionGUID: V3/lBAkSToC4x9cErZ5dnQ==
X-CSE-MsgGUID: QpNhLrbnRva9FuLsWDEjpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37703731"
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="37703731"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 19:33:14 -0800
X-CSE-ConnectionGUID: FGxj9RqgTp+0JD2Ku0mnSg==
X-CSE-MsgGUID: QzQVeDC9TziCYUAVyb/uHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,220,1732608000"; 
   d="scan'208";a="106804372"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Jan 2025 19:33:13 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ta50p-000XZH-19;
	Tue, 21 Jan 2025 03:33:11 +0000
Date: Tue, 21 Jan 2025 11:32:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-efi-zboot 29/30] x86-bzimage.c:undefined reference to
 `kaslr_get_random_long'
Message-ID: <202501211130.RHcGFaDQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-efi-zboot
head:   d9643e73517e2ecc1c3dac9a4724ddfb866620c3
commit: 8785c948523908af9cab93e4f845bdf476c653dc [29/30] efistub/x86: Refactor decompression flow to prepare for zboot support
config: i386-buildonly-randconfig-001-20250121 (https://download.01.org/0day-ci/archive/20250121/202501211130.RHcGFaDQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501211130.RHcGFaDQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501211130.RHcGFaDQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/firmware/efi/libstub/x86-stub.c: In function 'efi_pe_common_entry':
>> drivers/firmware/efi/libstub/x86-stub.c:457:9: warning: implicit declaration of function 'efi_stub_entry'; did you mean 'efi_pe_entry'? [-Wimplicit-function-declaration]
     457 |         efi_stub_entry(handle, sys_table_arg, boot_params);
         |         ^~~~~~~~~~~~~~
         |         efi_pe_entry
--
   ld: Unexpected GOT/PLT entries detected!
   ld: Unexpected run-time procedure linkages detected!
>> ld: Unexpected run-time relocations (.rel) detected!
   ld: drivers/firmware/efi/libstub/x86-bzimage.stub.o: in function `efi_get_seed':
>> x86-bzimage.c:(.text+0x51): undefined reference to `kaslr_get_random_long'
   ld: drivers/firmware/efi/libstub/x86-stub.stub.o: in function `efi_pe_common_entry':
>> x86-stub.c:(.text+0x212): undefined reference to `efi_stub_entry'
   ld: arch/x86/boot/compressed/vmlinux: hidden symbol `kaslr_get_random_long' isn't defined
   ld: final link failed: bad value

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
