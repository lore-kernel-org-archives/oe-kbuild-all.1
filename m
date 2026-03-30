Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBDCF3A7F66
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 07:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774857041; cv=none; b=ErJIeLx1wbZc4zrZnW4MoN4Cab7wvpNYFt2w+Yu6qRQDScTAgvvGFSBRIyrONBi9oTIFcv4dTCISYAbfEiQft1p+pWbCFK5Pvduu3Mi4oBCgVb8WrPuQmBcEleGQYXNY2iEp18c760Ze21vgMKGZrCi8Y++kZWIPMb7hPfOR+FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774857041; c=relaxed/simple;
	bh=5dQKsOd3RKFKbl9VCbFi3d9OVoE1lH5x26iIJzoM/hk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OCuFUgfeeCRD8cVfPkY24zAPMf70b++caipB6+lOTflrwSxcky/AlGqbSXx9F6bKznrmuqgHROXHWKS726aIVo3fSkotVj67T/ruVpwXGK8n0ouLO0O8VcuE0Pf4OCFtqPylKKfO2R8Fg5W4FzwpopD4BnkZ3JbsbkXmnuAxEp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EzD/0Uz2; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EzD/0Uz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774857040; x=1806393040;
  h=date:from:to:cc:subject:message-id;
  bh=5dQKsOd3RKFKbl9VCbFi3d9OVoE1lH5x26iIJzoM/hk=;
  b=EzD/0Uz2XXQ8J21k2qkh416PZWIYCe2J9mYBx5/L0iOECajTWSlBjS1V
   1AZTUY2TR7warA3N8c5BIsLMFUQ8DPl8Pk2KejSI3pTyZnQrzUMB3OhUz
   ffZ08Yur8dvV+THzVZM3U6rqrGSxPQcsmxoHIoMoYn7E/Bc/7ntbCWhVU
   roTI/YZ3vRzaHwlOMQSgqOvsQEHBfhvHFBlMjR/RqboAazAiweFihlO8E
   bz3GRGTSnfZaokwQ3Lr4yyT2DhUcvXfa3Ks3cmp1uNoaCcHTGOSPXtyaA
   R8eLOjogxHV6i85T1uihA/9Hfc8KOaiguYoy/zao4lFeSrg8Xbxp2Jscp
   Q==;
X-CSE-ConnectionGUID: PVqv8S/5TX6zEhiiaAW5ZQ==
X-CSE-MsgGUID: 6SWH9O3LRcC4lREimX8Esg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86535289"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86535289"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 00:50:36 -0700
X-CSE-ConnectionGUID: hiR5gr1rSSeSmtt9rL6xIQ==
X-CSE-MsgGUID: nQu1+GzSTvKxRG55M6arwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="263912735"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Mar 2026 00:50:35 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w77OK-000000000pf-3e2g;
	Mon, 30 Mar 2026 07:50:32 +0000
Date: Mon, 30 Mar 2026 15:49:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for
 function 'hyp_puts'
Message-ID: <202603301512.dqOai7bJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: ea53aa5d800829a9adc17df0b6615eb845a9314b [5/5] ANDROID: KVM: arm64: Add serial framework for pKVM
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603301512.dqOai7bJ-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301512.dqOai7bJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301512.dqOai7bJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/serial.c:42:6: warning: no previous prototype for function 'hyp_puts' [-Wmissing-prototypes]
      42 | void hyp_puts(const char *s)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:42:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      42 | void hyp_puts(const char *s)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:54:6: warning: no previous prototype for function 'hyp_putx64' [-Wmissing-prototypes]
      54 | void hyp_putx64(u64 x)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:54:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      54 | void hyp_putx64(u64 x)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:60:6: warning: no previous prototype for function 'hyp_putc' [-Wmissing-prototypes]
      60 | void hyp_putc(char c)
         |      ^
   arch/arm64/kvm/hyp/nvhe/serial.c:60:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      60 | void hyp_putc(char c)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/serial.c:66:5: warning: no previous prototype for function '__pkvm_register_serial_driver' [-Wmissing-prototypes]
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         |     ^
   arch/arm64/kvm/hyp/nvhe/serial.c:66:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      66 | int __pkvm_register_serial_driver(void (*cb)(char))
         | ^
         | static 
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/hyp_puts +42 arch/arm64/kvm/hyp/nvhe/serial.c

    41	
  > 42	void hyp_puts(const char *s)
    43	{
    44		if (!hyp_serial_enabled())
    45			return;
    46	
    47		while (*s)
    48			__hyp_putc(*s++);
    49	
    50		__hyp_putc('\n');
    51		__hyp_putc('\r');
    52	}
    53	
  > 54	void hyp_putx64(u64 x)
    55	{
    56		if (hyp_serial_enabled())
    57			__hyp_putx4n(x, 64);
    58	}
    59	
  > 60	void hyp_putc(char c)
    61	{
    62		if (hyp_serial_enabled())
    63			__hyp_putc(c);
    64	}
    65	
  > 66	int __pkvm_register_serial_driver(void (*cb)(char))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
