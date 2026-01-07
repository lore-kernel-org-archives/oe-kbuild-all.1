Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956F74A33
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Jan 2026 03:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767756082; cv=none; b=N2WgmzLM7qgKgnD6/VmSEDx7wZx0wDebjNxm2yrq8qxgjRR+QamDPbIgH6VB1Ko1u8DrUpoCt2xQhk8GfePnn7Bss6X0NRyTUsyNpIK1xjCJnLPOWrQEFTPrXWA/n4CAwU5qxAEHLRP/fohwsbgeSn5/nyCudhuY6gqwGiczpGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767756082; c=relaxed/simple;
	bh=mRKNHZf7eLHvDTnEPomQcwHRALcowdJNV5ko1UuUlT4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gWww9a1bv20PRpanTu+lUCEPVtBaDdfpoFR+ewWyADVL1i3i8xz7RyM8hc5hhUtujLeEM/GUA8y5h9A2Bfzwc68BtGKuUfZehrY4EzNxFWtzfeMlSdFVsCLvQ5OEea+Gj2b4aFPIIIOCegboEvIMz6DaOfGYzr+78qBbxvhA19s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NLLa9pnL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NLLa9pnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767756080; x=1799292080;
  h=date:from:to:cc:subject:message-id;
  bh=mRKNHZf7eLHvDTnEPomQcwHRALcowdJNV5ko1UuUlT4=;
  b=NLLa9pnLuhhYaQkshjWrAMjllPGlT+duRxgYhEkokGb49hx0WkSkk0Xe
   YL5yTjoDqbetVR7R8GV6l3D6lmB0zNISEvXZCAc41e0/haUUD7aGhpxm2
   t85MzFePts/0ZXHyQPT6LzgEtK7DIlD4uKTJk0FgUcJOZOTTJ7qXv7vRS
   S6ZbzE8glICDSIeytr9XGZWfddY8sdq4FccBFnP3qGIT65vYQDULREISQ
   bEBsDiwL4F20zUnMxyNzBpga63efzsaJNMsCvAW8REqwdWp00vRwMsCZY
   dBSMEFu/5qsaXjiIejkLHjN65bqsy0mhf3V23Jtf/h2Ok/8n/lTW5S0YI
   g==;
X-CSE-ConnectionGUID: qCFherQrSqa0bgmB4rAPNA==
X-CSE-MsgGUID: EzKk/irURDa2WxfHf2Yjyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="68318598"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="68318598"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 19:21:20 -0800
X-CSE-ConnectionGUID: otGHJbbXQVKPNIoHsQHImA==
X-CSE-MsgGUID: SDW5ZCnHQXyu9EeSh2PMow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="202867409"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jan 2026 19:21:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdK6l-000000003Qb-1eiJ;
	Wed, 07 Jan 2026 03:21:15 +0000
Date: Wed, 07 Jan 2026 11:20:17 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Vishal Annapurve <vannapurve@google.com>,
 Ackerley Tng <ackerleytng@google.com>
Subject: [intel-tdx:huge_page_v3 289/499]
 arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1135:24: error: implicit
 declaration of function 'kvm_range_has_vm_memory_attributes'; did you mean
 'kvm_get_memory_attributes'?
Message-ID: <202601071127.s4MO1DjL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel/tdx.git huge_page_v3
head:   deceaf0d419ad678d86b42a3f71e1a6b588163fe
commit: 3f9ad14d4d31a8634525c24cdec04f78d926dba6 [289/499] KVM: Let userspace disable per-VM mem attributes, enable per-gmem attributes
config: x86_64-randconfig-012-20260107 (https://download.01.org/0day-ci/archive/20260107/202601071127.s4MO1DjL-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260107/202601071127.s4MO1DjL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601071127.s4MO1DjL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/guest_memfd.c: In function 'kvm_gmem_range_is_private':
>> arch/x86/kvm/../../../virt/kvm/guest_memfd.c:1135:24: error: implicit declaration of function 'kvm_range_has_vm_memory_attributes'; did you mean 'kvm_get_memory_attributes'? [-Wimplicit-function-declaration]
    1135 |                 return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                        kvm_get_memory_attributes


vim +1135 arch/x86/kvm/../../../virt/kvm/guest_memfd.c

1f6c06b177513e Paolo Bonzini 2024-02-14  1129  
36cf63bb5df688 Fuad Tabba    2025-07-29  1130  #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_POPULATE
82dc58b5815bae Ackerley Tng  2025-09-29  1131  static bool kvm_gmem_range_is_private(struct gmem_inode *gi, pgoff_t index,
82dc58b5815bae Ackerley Tng  2025-09-29  1132  				      size_t nr_pages, struct kvm *kvm, gfn_t gfn)
82dc58b5815bae Ackerley Tng  2025-09-29  1133  {
82dc58b5815bae Ackerley Tng  2025-09-29  1134  	if (vm_memory_attributes)
82dc58b5815bae Ackerley Tng  2025-09-29 @1135  		return kvm_range_has_vm_memory_attributes(kvm, gfn, gfn + nr_pages,
82dc58b5815bae Ackerley Tng  2025-09-29  1136  						       KVM_MEMORY_ATTRIBUTE_PRIVATE,
82dc58b5815bae Ackerley Tng  2025-09-29  1137  						       KVM_MEMORY_ATTRIBUTE_PRIVATE);
82dc58b5815bae Ackerley Tng  2025-09-29  1138  
e7960cb7d3cabe Ackerley Tng  2025-05-06  1139  	return kvm_gmem_range_has_attributes(&gi->attributes, index, nr_pages,
e7960cb7d3cabe Ackerley Tng  2025-05-06  1140  					     KVM_MEMORY_ATTRIBUTE_PRIVATE);
82dc58b5815bae Ackerley Tng  2025-09-29  1141  }
82dc58b5815bae Ackerley Tng  2025-09-29  1142  

:::::: The code at line 1135 was first introduced by commit
:::::: 82dc58b5815baeb249f1fb24f544fe723961d2b4 KVM: guest_memfd: Update kvm_gmem_populate() to use gmem attributes

:::::: TO: Ackerley Tng <ackerleytng@google.com>
:::::: CC: Vishal Annapurve <vannapurve@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
