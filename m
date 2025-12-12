Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0922B155757
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571970; cv=none; b=DMgBDXA01BBot09OqgJxc2TAmqmgWRWVY4wup5/8QxGvqkI0MxGiOzOs6WhulAWxj649nHf1K/+9hwaDI5GWTgN71PUSdbhHZ3vWUxEgHciKJ2RHonKzQxFdrH3D6LCtAgiNbl9zi5uUxaQYeQ/FYnNXzf38Bj14gdqxzB2fM5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571970; c=relaxed/simple;
	bh=fy+w9J+W3bmrcHdivWHsTdjlBAwVmqVGs2ovonhCVQg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E+0er/da9dwUgyetSJuGrt/i1vCkh1iU3ulmkhYt4UzvsgZKQpkBOEZGvQpIFVB8hwq3VcCxdUf83jeO9SFzE80G55HcivHsLpuEJxLrOAAbVE6RTkd8fjHH5dLcwVvkgjHEKXXoJ86rSO+J/kPEnrMnE7UwqK6lBC6x61mamCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W4kZc0Ir; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W4kZc0Ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765571969; x=1797107969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fy+w9J+W3bmrcHdivWHsTdjlBAwVmqVGs2ovonhCVQg=;
  b=W4kZc0Irco2+Iwpsht5bEMQUqwj7KKRdjRQueADj/Ot3SfxMeVtL7Sct
   Mzj3GwsIYWD5GEKN+rnpokExG2pixUEQXLLVBRxOFFPM2N73LxhVvLlDJ
   6eZ/Bbg5Nwhbq98C96KEn/GF6KYQJ0/GX9p97Tr28dMJDMCT70tTH60Z2
   zSeuERdB3zHdoiqcQ3ZV/QAvEHFDEA015tBfjL9qo0TfC+8LKI7uMN3qc
   QxaSZF5ESpt5zcCJXnMwvc/b8T9jTTc/QiffhVLfhCmBJ7JGWro5SWdrZ
   tv05qjtPl6T3d9+i/fhKXhIdzYaUo9NNs4e+fFI/WhpD7MWEhrvdwaGhF
   Q==;
X-CSE-ConnectionGUID: vuQFxxoUTUaJpK22g4LmCA==
X-CSE-MsgGUID: fkKHtuILRKK/I1O/9IPdSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77896163"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="77896163"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 12:39:29 -0800
X-CSE-ConnectionGUID: SnIYm15fSbmIMpEHCFd89A==
X-CSE-MsgGUID: WsxkGCPhRNKYzIPTgfL98w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="201666545"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Dec 2025 12:39:28 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU9vB-000000006ab-17hm;
	Fri, 12 Dec 2025 20:39:25 +0000
Date: Sat, 13 Dec 2025 04:38:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has
 incomplete type
Message-ID: <202512130433.iFWEiQiu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   da2da0badf05a4631edf06f9a37e822b20875663
commit: 8ef015afc176a3d8627c1c1e6f561494d211e057 [18/18] ANDROID: pkvm: x86: Hypercalls for legacy mode context tables
config: i386-randconfig-141-20251213 (https://download.01.org/0day-ci/archive/20251213/202512130433.iFWEiQiu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130433.iFWEiQiu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130433.iFWEiQiu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
>> arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~


vim +/lm_context_param +266 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
 > 266		struct pkvm_lm_context_param lm_context_param;
 > 267		struct pkvm_clear_translation_param clear_translation_param;
   268	} __aligned(PAGE_SIZE);
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
