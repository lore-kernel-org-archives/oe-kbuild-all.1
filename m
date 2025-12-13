Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD4D1F8AC8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 04:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765601583; cv=none; b=RitIIW46pOpiR/4oqH194M7EHemDkXO1MKznYTieRYdRlvUCiPA8CUELm9TFiXdUdWrY/PuX1idVjrEPs26QDDdVXFKoDM2uiVLfaFjeowV6g1wp+04mvf2Vy8HpacWPnuM1BMpVAclQgYFxDHUcSyzvKwDwMnkP/7sfTCNs7uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765601583; c=relaxed/simple;
	bh=4D6mlV4cCdD/m92He9SZA4jFr69ikJV6dyzQlA/nXss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qqAvXIENXxW0OhtoW2dfVLkaBPv2DvBJMrOt4kkIi0DNBmHw/nSr1gk4ERbZxu4q9JYcHhdJFvNVe2qoNPKRvE+ZDh3jNRWduhBAxFZpa0nM4Xyl5sxXOozpoKgNAkOd4VFeQQJ1lNsOBJNUTKJaomwqvGhSWncJ6sU/OihNDGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4OUVbs8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4OUVbs8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765601582; x=1797137582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4D6mlV4cCdD/m92He9SZA4jFr69ikJV6dyzQlA/nXss=;
  b=c4OUVbs8HEGWGKkZiEhUQFlERnkdL/IaDmhGEHv3Exv/wRXzbr6L80XA
   4aEGN17hZLpufaSMtKUdF1iPetwHh2XKqqeEKyrKIuKuWrtBZeCo1v9cX
   soz9/UuBQoACjKZgsnSXlKrwqx+m3qh6V+Pk/JsRWT4G4YOtbe2IEuCat
   SzayLDfW9I78DMJ3PqI8GYGc/uHDWArjfAx7tBWszeprLqIVq14cZv/q5
   W2jQ04f715uvgxfMCxAIndwsWz9YuTA3R680V3Gma4sRWP5nuKxfgJNDN
   HaJOQ/N48w3AU9LrC32bjsbiONtASDCNG/1+Y/0Di89Iu4yrPugx1G9Fg
   w==;
X-CSE-ConnectionGUID: S+YnUFgoQWaekFH4c7rnIg==
X-CSE-MsgGUID: /aMSpfWCTnaVaNSKtjOCFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="93073533"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="93073533"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 20:53:00 -0800
X-CSE-ConnectionGUID: h9Oy9hOzRm+G7rFJyGfwgQ==
X-CSE-MsgGUID: gCUKHxfgTxy8HKB5oNq/Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="228313574"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Dec 2025 20:53:00 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUHcn-00000000749-26Wu;
	Sat, 13 Dec 2025 04:52:57 +0000
Date: Sat, 13 Dec 2025 12:52:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 arch/x86/include/asm/kvm_pkvm.h:269:32: error: field has incomplete type
 'struct pkvm_pasid_table_param'
Message-ID: <202512131202.LY95mAAL-lkp@intel.com>
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
commit: c3227e233875bf000ec6fc62cb11729cc3325c62 [18/18] ANDROID: pkvm: x86: PASID Table update hypercalls
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131202.LY95mAAL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131202.LY95mAAL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131202.LY95mAAL-lkp@intel.com/

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
   arch/x86/include/asm/kvm_pkvm.h:268:31: error: field has incomplete type 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:268:9: note: forward declaration of 'struct pkvm_sm_context_param'
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                ^
>> arch/x86/include/asm/kvm_pkvm.h:269:32: error: field has incomplete type 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^
   arch/x86/include/asm/kvm_pkvm.h:269:9: note: forward declaration of 'struct pkvm_pasid_table_param'
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                ^
   4 errors generated.


vim +269 arch/x86/include/asm/kvm_pkvm.h

   258	
   259	union pkvm_pv_param {
   260		struct kvm_segment seg;
   261		struct msr_data msr;
   262		struct desc_ptr desc;
   263		struct eoi_exitmap eoi_exit_bitmap;
   264	
   265		/* IOMMU hypercall params */
   266		struct pkvm_lm_context_param lm_context_param;
 > 267		struct pkvm_clear_translation_param clear_translation_param;
   268		struct pkvm_sm_context_param sm_context_param;
 > 269		struct pkvm_pasid_table_param pasid_table_param;
   270	} __aligned(PAGE_SIZE);
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
