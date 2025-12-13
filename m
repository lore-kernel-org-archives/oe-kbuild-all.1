Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191692F291A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 03:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765595576; cv=none; b=AMYIkoKKB2e9jbMAgTc3YmvFOOEb016d9LQ0AtzDH5UCyYVmohTMLssMAA3sVkPpYI/Wz7VUtW0Doy5YKa+KVb3/8RE9vBlTdJEXGjIQ4baqB1xXA/Jl+Fh+RGDMLCBUeVlQTKV0j4BQZp5UKVkokMqaV0cf1PNvzTvbHe5A04w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765595576; c=relaxed/simple;
	bh=SIeYK1oKk62rgVZuR7vQXILA+vmJZSnqHXaGoZmEBKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OLECmH7N0ORMLX2Se8+vkFgXgeAbQLxuKgE06dM39jsKO5Ag52i7bgeTaeD1M+DDucfOESB8z1Jb/Wzm8SzIUI80csps5LMG/Yx6UXmkwQhUpWM23kuqTVRC9DnxYNygvQ6TtjhAmZ73zUNzYn+sGd8Elnu2G5exAhkrXXuT8TQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FEFj+fwl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FEFj+fwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765595575; x=1797131575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SIeYK1oKk62rgVZuR7vQXILA+vmJZSnqHXaGoZmEBKA=;
  b=FEFj+fwlG4YAc4WEF2CRhpvtt/2VZUoUtttUOtOeUsQf0kuu73MzB0w4
   oMKrhOlMbGVwCVwFqmIwGbMr5ug/ED+JU9KfdIGmMyHoANvict9EU+yZt
   B2jxu2CQFRVd4K3b+/BvTjS8E8c7qL8WSTwvLs5QKGcT8SoT1+ViV0EN5
   Xo7RYEPM0kJVLc7CdIfTzjpcKNngf1u8wIR/w52QtkHcabn60YV3PGyLW
   y9DEHCl9tPDTBA0mCJPJ0Ev2dFLXxnDiQD0uDTu30mUKqroNya3+HpBCH
   PG8l3Nl03+Wj2mnDPLlP8lssMRosAyBOBPesujhZbzkpztKjL5nl6ee0o
   w==;
X-CSE-ConnectionGUID: 6FLa5W+pQOWsFSxv2ENj6Q==
X-CSE-MsgGUID: gY2RDDwcRPyPxgtU2Ro8pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="90248669"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="90248669"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 19:12:55 -0800
X-CSE-ConnectionGUID: 6RP6QGGNT6CWPlYbONL4TA==
X-CSE-MsgGUID: mTVn4Z1QT0Wy6W8RYA6HRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="197738819"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 Dec 2025 19:12:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUG3v-000000006z3-2rZM;
	Sat, 13 Dec 2025 03:12:51 +0000
Date: Sat, 13 Dec 2025 11:12:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 18/18]
 arch/x86/include/asm/kvm_pkvm.h:266:31: error: field has incomplete type
 'struct pkvm_lm_context_param'
Message-ID: <202512131116.5iu9d1US-lkp@intel.com>
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
config: x86_64-randconfig-161-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131116.5iu9d1US-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131116.5iu9d1US-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131116.5iu9d1US-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/x86.c:87:
>> arch/x86/include/asm/kvm_pkvm.h:266:31: error: field has incomplete type 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^
   arch/x86/include/asm/kvm_pkvm.h:266:9: note: forward declaration of 'struct pkvm_lm_context_param'
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                ^
>> arch/x86/include/asm/kvm_pkvm.h:267:38: error: field has incomplete type 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^
   arch/x86/include/asm/kvm_pkvm.h:267:9: note: forward declaration of 'struct pkvm_clear_translation_param'
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                ^
   2 errors generated.


vim +266 arch/x86/include/asm/kvm_pkvm.h

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
