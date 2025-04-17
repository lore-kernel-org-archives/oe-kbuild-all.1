Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3536B3C0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 16:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908006; cv=none; b=Pv/AKLsgr3Xh+BCdWOt2OgKxzd0il0Anc8i7nSYssq+aBgHiJEQh6Lz2QefWy8LO+TriOMnFQBluF5NKvtSQt4iXjWBgI+nT+lCR1ylcUPHB5cR1R+Y/IBE0GJoCqKqPJAKlfRbMR5kyQ2dImVC0Mv+zKPIPorSCi0IsrM4ynpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908006; c=relaxed/simple;
	bh=QX2dsSSXpmWOWVDHeQSc3CieaqYAdQ+0865nwzc+K5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qv+TXDdtPWtSzej3DXbT+wDqVpoCyn5SsRz8+kkCzRmbsk2/rE7ZRPXXY7ni4HV0QLRXiaL+qflvh9wxRqvqTKBAchckQ+gAxcGtGPG4+9sU+uS0M6mbF09xu704AlcmrNpIpqIJ2PLJNLal6X3GFmWboZgHBV2WG1Yj+PXpr4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sq3zWKuP; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sq3zWKuP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744908004; x=1776444004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QX2dsSSXpmWOWVDHeQSc3CieaqYAdQ+0865nwzc+K5g=;
  b=Sq3zWKuP8bfuSZWIsAFlOCGRdBr8b0tye7+XR7WrkuhFoAdRVl2hiSEO
   H3HpAEci4EYGmfbB0qul8vp9vIxyhqfKY4LFvkPU2BmHWMw3zB6JceqXF
   28iSssSbowPk35o1hY/3EKDlSpDn1sU+MkCe35fCK/ashtZUFXQOqa6W2
   WJ/cAQABlZ97dga5W9bp5F7Cg1p/dCIs6cjBKO4QuJFeHQPIS/Xk0deUE
   +MtSZFBCpnXXmFK6qL+AD3UUmTrHjE647ZnZrBdVp6dnXPNvCdCg1DRLR
   il4Yw6xR0DRJK0R0ZIkllSfurTYx2TqM32CcOU1wTgPPoZ/4zvY/K4BES
   w==;
X-CSE-ConnectionGUID: +pSoq/rmTParxhx0xdzWDw==
X-CSE-MsgGUID: erxdOrN8S8K3DG0CBSjqsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="57501108"
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="57501108"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 09:40:04 -0700
X-CSE-ConnectionGUID: zHSiIqf9S1mdHfUCQ2jDug==
X-CSE-MsgGUID: /D7tdPElS9qsHzf21CcTyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,219,1739865600"; 
   d="scan'208";a="130789573"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 09:40:02 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5SHQ-0000W9-1k;
	Thu, 17 Apr 2025 16:40:00 +0000
Date: Fri, 18 Apr 2025 00:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 22/34]
 arch/x86/include/asm/paravirt.h:12:61: error: unknown type name 'u32'
Message-ID: <202504180026.OVzpl4L0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   550382282c57dce94d75c76aa41974ae6304fff0
commit: 58a74d1c0ad30cf7a497fe00eb598f744d9c7890 [22/34] x86/msr: Move get_pv_msr_action() to <asm/paravirt.h>
config: i386-buildonly-randconfig-004-20250417 (https://download.01.org/0day-ci/archive/20250418/202504180026.OVzpl4L0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250418/202504180026.OVzpl4L0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180026.OVzpl4L0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/lib/cache-smp.c:2:
>> arch/x86/include/asm/paravirt.h:12:61: error: unknown type name 'u32'
      12 | static __always_inline enum pv_msr_action get_pv_msr_action(u32 msr)
         |                                                             ^~~


vim +/u32 +12 arch/x86/include/asm/paravirt.h

    11	
  > 12	static __always_inline enum pv_msr_action get_pv_msr_action(u32 msr)
    13	{
    14	#ifdef CONFIG_XEN_PV
    15		if (!__builtin_constant_p(msr)) {
    16			/* Is it safe to blindly do so? */
    17			return PV_MSR_NATIVE;
    18		}
    19	
    20		switch (msr) {
    21		case MSR_FS_BASE:
    22		case MSR_KERNEL_GS_BASE:
    23		case MSR_GS_BASE:
    24		case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
    25		case MSR_CORE_PERF_GLOBAL_STATUS:
    26		case MSR_CORE_PERF_GLOBAL_CTRL:
    27		case MSR_CORE_PERF_FIXED_CTR_CTRL:
    28		case MSR_IA32_APICBASE:
    29			return PV_MSR_PV;
    30	
    31		case MSR_STAR:
    32		case MSR_CSTAR:
    33		case MSR_LSTAR:
    34		case MSR_SYSCALL_MASK:
    35		case MSR_IA32_SYSENTER_CS:
    36		case MSR_IA32_SYSENTER_ESP:
    37		case MSR_IA32_SYSENTER_EIP:
    38			return PV_MSR_IGNORE;
    39	
    40		default:
    41			/*
    42			 * MSR access instructions RDMSR/WRMSR/WRMSRNS will be used.
    43			 *
    44			 * The hypervisor will trap and inject #GP into the guest and
    45			 * the MSR access instruction will be skipped.
    46			 */
    47			return PV_MSR_NATIVE;
    48		}
    49	#else
    50		return PV_MSR_NATIVE;
    51	#endif
    52	}
    53	#endif
    54	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
