Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72C9320A0E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 10:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771322495; cv=none; b=iqZIcZCxukPpziMJG4wH0e6xcgeY1ePV+zmBedqjF+pD87ZeTVjulA6XglkF7F0lh3AFv9FQhtBaYV3nw7H5WmDHjXibFmHwdLHYUNPYfd/qQ5TlCWuglssIQD3VirVmnj817W8RyzGATTKqA+lok7oesAufwXKgvpYL/pLYk2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771322495; c=relaxed/simple;
	bh=qcOawvraL2n3HS0wW1vPKojiz4DEZodGR9gGzG48wro=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZPxuszY940Ht39Yir1OWJ0RFLmkPHcTbfPfIoYrroLGP4PNMBHpEX+Ri7wxTc4kviV+X0I6e8iNCgNADQ8zadja3qFJK6hyMWKMMrTK5FL0/vZ78ETpe6z3M1/7yRQXMxTUoO/zFffIqjU5+MBkxyr787+8n1nQ0/jradrmhh88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLFawhUV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLFawhUV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771322494; x=1802858494;
  h=date:from:to:cc:subject:message-id;
  bh=qcOawvraL2n3HS0wW1vPKojiz4DEZodGR9gGzG48wro=;
  b=MLFawhUVEba0IYqpuDgScXifSiv0FkdITNppGRrricI40SpiYe8naKth
   vwAQAKjJnPTg8v+27o7wuW2Lzg2NAQl9VPorb3FVeO3MDVTq4yw8ZHQ9x
   zBTBOAL/ZF9gEgYueShQ2V0zNA9TnOH0gd54TT0Wwnp7YbVv21Mpkd+66
   5UZOzKuTsMceXuXZ3k+z+6LvnQuBv65+Go8cXrHc8aeMGlMKd0I2JXpkS
   aYt1E6nDT2+1qn3pvEcfkBYJYX/rHEd48nyIeeC0RGSIBhREukTbucc2f
   CGw/aieP/6oHxlG2g4w2Vtwi74EX9PidCvLte8drBIIxTbbTGEFr+qeuf
   Q==;
X-CSE-ConnectionGUID: jC6QGPyiSgiPd4JJ0BbEZQ==
X-CSE-MsgGUID: M/iSlL9mQQCg+MwP4/Nysg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="95017594"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="95017594"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 02:01:33 -0800
X-CSE-ConnectionGUID: Hn146C2yQnSCF1SNFFeeyg==
X-CSE-MsgGUID: 103uD6e1T2q2PHfmyQ8EvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213671605"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2026 02:01:32 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsHtZ-000000010p6-33uj;
	Tue, 17 Feb 2026 10:01:29 +0000
Date: Tue, 17 Feb 2026 18:01:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 53/53]
 arch/x86/include/asm/kvm_pkvm.h:269:39: error: field 'pasid_table_param' has
 incomplete type
Message-ID: <202602171707.DK2v4Den-lkp@intel.com>
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
commit: c3227e233875bf000ec6fc62cb11729cc3325c62 [53/53] ANDROID: pkvm: x86: PASID Table update hypercalls
config: i386-randconfig-141-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171707.DK2v4Den-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171707.DK2v4Den-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171707.DK2v4Den-lkp@intel.com/

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
>> arch/x86/include/asm/kvm_pkvm.h:269:39: error: field 'pasid_table_param' has incomplete type
     269 |         struct pkvm_pasid_table_param pasid_table_param;
         |                                       ^~~~~~~~~~~~~~~~~


vim +/pasid_table_param +269 arch/x86/include/asm/kvm_pkvm.h

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
 > 269		struct pkvm_pasid_table_param pasid_table_param;
   270	} __aligned(PAGE_SIZE);
   271	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
