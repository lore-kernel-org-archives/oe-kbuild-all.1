Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBE92B2F2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Nov 2024 18:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731781799; cv=none; b=Geg0+zr9p4GZBwhhmJWegnNBLNvHe5CvpS4e9EsMCY/n6vocoxkHWl3D3aZ7yv1pbuoNsq5Z4CZeStF5W1kqBTQ3lmkrVnx9+y9mOgnZqkSiVOjBIs1A4WYx7yCRAVylDNvdLihaDVorTROV0otCIhT7jhGPYbBkxLH2toVs3R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731781799; c=relaxed/simple;
	bh=nFlUpd+jeYOLpVibXbW9A1G9mum7QXEFOynzhIpDp84=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u2ym1AyRChk/wWATxLTpZADdRaJkLzhdj5DvYR+BisKYIfcgI976Eb/3b03j9Slcg8h7NUxUcs8CcDFvINpJX9IOFcRXSFrar3QdC333SI5WdvmYUizzDt01Nu2zv6kbOLc4WaynSrco3x/ANCJNbwwCPKdHWudT/GUU2Lr9FVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BDMjIxtQ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BDMjIxtQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731781798; x=1763317798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nFlUpd+jeYOLpVibXbW9A1G9mum7QXEFOynzhIpDp84=;
  b=BDMjIxtQLl+GYBcKyh0146B+j8naxUFkRuM0XXaYPudXQfAeUlNPREJp
   JeriW6j/9cbnaS6rPniO3oAiM5W5pTZeBlYK7icjKiB8k0MltIi6tcfeu
   udHrBuBDJHO9qtLlz8DD2ZdAxdXtr1X6z0USdcVWGaIjvvQMrEqWH2qax
   paIthI0oC7UJOosANReXueASrhXLxi6dZSAEua8otb7l2JkuLVqf8LBor
   RvBE6glCpGYyfcLpjZ7/RRdkOQmPVtotOcpTQZkP3tA5yfe2aFKByV2DM
   fEtgwMauKSjPV6tcwEjWQz+mubcHFBAlpCgTvX5YbQqsib9yPIifhWnWK
   w==;
X-CSE-ConnectionGUID: gAi1P/SJTJC9l3Bgu3VjVA==
X-CSE-MsgGUID: nZr7UeqzRXqN+cP8uSVARw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31160691"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="31160691"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 10:29:57 -0800
X-CSE-ConnectionGUID: SO1u00pRTSC4KPCLB3HMVQ==
X-CSE-MsgGUID: Ew6CFzSETdKjXgGC4DmO3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="93782359"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Nov 2024 10:29:55 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCNYP-00011f-1d;
	Sat, 16 Nov 2024 18:29:53 +0000
Date: Sun, 17 Nov 2024 02:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop-pkvm-ia-2024-15-11-v1 209/259]
 arch/x86/coco/pkvm/pkvm.c:50:6: warning: no previous prototype for function
 'pkvm_get_ve_info'
Message-ID: <202411170231.YsUdeC2X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop-pkvm-ia-2024-15-11-v1
head:   ab957086535d11209d7d6dd96172900d714fb5fb
commit: 0b97a4c41ed1bcb8f14bd5c08e1714877bb0c2a8 [209/259] ANDROID: pkvm: x86: Add pkvm guest virtualization exception (#VE)
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241117/202411170231.YsUdeC2X-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411170231.YsUdeC2X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411170231.YsUdeC2X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/coco/pkvm/pkvm.c:50:6: warning: no previous prototype for function 'pkvm_get_ve_info' [-Wmissing-prototypes]
      50 | void pkvm_get_ve_info(struct ve_info *ve)
         |      ^
   arch/x86/coco/pkvm/pkvm.c:50:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      50 | void pkvm_get_ve_info(struct ve_info *ve)
         | ^
         | static 
   arch/x86/coco/pkvm/pkvm.c:105:2: error: call to undeclared function 'cc_set_vendor'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     105 |         cc_set_vendor(CC_VENDOR_PKVM);
         |         ^
   1 warning and 1 error generated.


vim +/pkvm_get_ve_info +50 arch/x86/coco/pkvm/pkvm.c

    49	
  > 50	void pkvm_get_ve_info(struct ve_info *ve)
    51	{
    52		/* Reuse the tdx output for pkvm. */
    53		struct tdx_module_output out;
    54	
    55		__pkvm_module_call(PKVM_GHC_GET_VE_INFO, &out);
    56	
    57		/* Transfer the output parameters */
    58		ve->exit_reason = out.rcx;
    59		ve->exit_qual   = out.rdx;
    60		ve->gla         = out.r8;
    61		ve->gpa         = out.r9;
    62	}
    63	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
