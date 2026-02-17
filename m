Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6C9286890
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771328802; cv=none; b=FI5fIL/QB2uktNyUFbMXF9Dk/Eb5s+2xLzLfMJ+9+zVhhdZeA0b8QQMtqfPVzQqwnHe9mfXhu7aPpd+JLCzlgf4JAe0kCv343hgLOiDNq5aQfvaZpd4nFj8Lkkg+0yjSVcG01MmTE+1BBgtY5aK5pLU90qPI7LSQLcN/2uCIJ4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771328802; c=relaxed/simple;
	bh=bjrFIGs5xznTKYrSIWFWi3jWMhxacaZklOI+SCMMa+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fLBKKmRssHRQXmKPrMbB6Sc4ye5gWF85zNKNiGZRD/mKQWx87gUKv1F0D/AAO0X2hZpvUyzDlLCxzM0VK8E7p2jYyIJm4kNB3l22hB50HEP7veNWc+6mvnBgU2gut2/qGub9qi/1RFpmmnW0cIBFq7ZxGqpXe01JoP41bf7z+mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbddGDsZ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbddGDsZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771328800; x=1802864800;
  h=date:from:to:cc:subject:message-id;
  bh=bjrFIGs5xznTKYrSIWFWi3jWMhxacaZklOI+SCMMa+0=;
  b=kbddGDsZOz9OnRSea8gcFd66b5hnNkhg7AEqD4fg0tNLtPdvUdp9zjTc
   TFyHy0Sr/SJMpMPm8UkJHBdK6iid2034aQxgLryL6tXYFTlZ+yhXtIXXz
   uoqEghq61bWAEXv5PddwzcKRGSLjJeF6LcG5MtkFFCZvXwzq55Qc+CqcX
   /SxyN2Aa9K8QBdwVJBdRUneB6mX84IcIb4NiQ1FrQFJWszhwZ2QGXSWQS
   57KW3Qs6vSpWHVRkJGnCvGiKYpoJOvcC0LfYtFyMYYM3D1CdfSl5q+J0f
   rr7RgbuiFXtRQyy8njNzF3IC4hSarzDrpiaPl0hMT3xyMIiwzl7yAo1Jr
   g==;
X-CSE-ConnectionGUID: yB+4a1xqTuyq71zzOr2K/Q==
X-CSE-MsgGUID: hdfQHY/ZSyuvM2ZKU8Tz3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72282789"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72282789"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 03:46:39 -0800
X-CSE-ConnectionGUID: v1TsERxdTEm37/spErHwVw==
X-CSE-MsgGUID: YYTUcM1aTf6B0mtEsxwm4g==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Feb 2026 03:46:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsJXH-000000010to-0CbG;
	Tue, 17 Feb 2026 11:46:35 +0000
Date: Tue, 17 Feb 2026 19:46:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 53/53]
 arch/x86/include/asm/kvm_pkvm.h:270:34: error: field 'domain_param' has
 incomplete type
Message-ID: <202602171921.YxIR61vm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   590a98f7b9783af3a52d4213d1f276148be94b4e
commit: f24cdadefceff37f8b2ffc66635ba5df50633b8c [53/53] ANDROID: pkvm: x86: Hypercalls for iommu domain management
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171921.YxIR61vm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171921.YxIR61vm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171921.YxIR61vm-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/setup.c:43:
   arch/x86/include/asm/kvm_pkvm.h:266:38: error: field 'lm_context_param' has incomplete type
     266 |         struct pkvm_lm_context_param lm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:267:45: error: field 'clear_translation_param' has incomplete type
     267 |         struct pkvm_clear_translation_param clear_translation_param;
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:268:38: error: field 'sm_context_param' has incomplete type
     268 |         struct pkvm_sm_context_param sm_context_param;
         |                                      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/kvm_pkvm.h:269:39: error: field 'pasid_table_param' has incomplete type
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^~~~~~~~~~~~~~~~~
>> arch/x86/include/asm/kvm_pkvm.h:270:34: error: field 'domain_param' has incomplete type
     270 |         struct pkvm_domain_param domain_param;
         |                                  ^~~~~~~~~~~~


vim +/domain_param +270 arch/x86/include/asm/kvm_pkvm.h

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
   268		struct pkvm_sm_context_param sm_context_param;
   269		struct pkvm_pasid_table_param pasid_table_param;
 > 270		struct pkvm_domain_param domain_param;
   271	} __aligned(PAGE_SIZE);
   272	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
