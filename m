Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284C8199237
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765598280; cv=none; b=TGjnBnVPrjfGIuEsvhH1I6hlA5Q44QbgN3RXH8G0egXHFlAjOHT2T+WO6TEDowOg0YlL8uOH1OJaXdqvpann4pB846rjYsbBI9V/c45U1ibHCTfDYEXwwmOZpr7osIVa6e5PWYKihDDHGymyiCTZxGioXv9q54JSkSPm86oJ/jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765598280; c=relaxed/simple;
	bh=y7SHUYtBg2lxOVE6Klr/ZNaH9mhA6TKm6Pxj6rTfHd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A9MUtK37wxGOzTJcDSFJP8qh42euew2IltiD5r55WXWVgmaruEaj2bFZuWf07hPPDZY30YOXfu8joniGqSlnUeybxz2p5m8G2HDFH5mOnAB+NDqM291rxvkv3nRqQ9QOfqrkG/co73+LsXcsJtlbNgzsBTnDIp6Sv/fsc8iJeD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlZNvgs7; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlZNvgs7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765598278; x=1797134278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7SHUYtBg2lxOVE6Klr/ZNaH9mhA6TKm6Pxj6rTfHd8=;
  b=YlZNvgs7ldHD1NZChcuF0HDDibmtp9XyKTC9AYVtF7UhrfRnftJITZ9O
   G2BNxq5wsc55Zlyvc+yHvi6K66+eGYEuy44ZiJ+zdmHdHFL8XpH6yxJo1
   m/Giq5KYyOIxvj+1+HeUL2xbH387PRy7JHDFJ9LtnZihEPfJfAkYTatOC
   k5gC1wDEV13ElbZS0NzmSRIoKLztN6F3rAPncY6m4EdKumHTZsgJ3ZFYR
   oFo33k26fPyfZH7eKlHOV3c2plqOscn9ciJ6/U3rHR1p8EvoE8sizNZig
   ED9Qby8kr6f0JZh/pWm5RbKLaffTfXzCcbQbPoU8NdQ5Ogj+utMHdhQXe
   g==;
X-CSE-ConnectionGUID: YRIW6MwpTY+uvTfnNXRJGQ==
X-CSE-MsgGUID: Vd8aXO5NSpSCxR8MbQZ7gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67556136"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="67556136"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:57:57 -0800
X-CSE-ConnectionGUID: b5xDMDoSQZCIFZpF9uX5SQ==
X-CSE-MsgGUID: TRbdUkRQRgefWE8vIlJAZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197511430"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Dec 2025 19:57:56 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUGlW-0000000071F-06xB;
	Sat, 13 Dec 2025 03:57:54 +0000
Date: Sat, 13 Dec 2025 11:57:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type
 'struct pkvm_sm_context_param'
Message-ID: <202512131153.kbBLpBL6-lkp@intel.com>
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
commit: f8ecd866e541b10a412882b8e0b0d02c1a17df8d [18/18] ANDROID: pkvm: x86: Hypercalls for scalable mode context update.
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131153.kbBLpBL6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131153.kbBLpBL6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131153.kbBLpBL6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:87:
   arch/x86/include/asm/kvm_pkvm.h:266:31: error: field has incomplete type 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
   arch/x86/include/asm/kvm_pkvm.h:267:38: error: field has incomplete type 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
>> arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
   3 errors generated.


vim +268 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
   266		struct pkvm_lm_context_param lm_context_param;
   267		struct pkvm_clear_translation_param clear_translation_param;
 > 268		struct pkvm_sm_context_param sm_context_param;
   269	} __aligned(PAGE_SIZE);
   270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
