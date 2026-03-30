Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EC73C3C12
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 11:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870263; cv=none; b=Ql8GbSfCisKvlA7kLw4LUJqM1OgT+r+CzrRYU7d1n9zLM+n4xWc8eP4OHKEK/CPG/7Y0/DCBQ3x6KUBkB+02iwIdEkgRSSEFZge2dy34TzOyXCPiCB1T/5EpgIErJqxeN//rDovce3Sj/RcwCbxAEcN2fpULRakZ7bqn48TSsSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870263; c=relaxed/simple;
	bh=e1uP/8tuNmfV0RvPQLo+c/X3CYg40ug3cda+MITZHcs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WCVosAQznQaVuftjM98J/zK78eGTgnEcaxgS5RAd4u+4MzpvARDKLd46am0gD/5Cahcbd+6UBEtZO5vMFfEDwvaMRP2qfV1N/zhoN0O+zKInXApEjGqEo6wU7IL73ozZ4uV/TFqL1SIAU74oCv2LhnU7wCGOjpOtveG8w9d7JSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ht3WQOj3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ht3WQOj3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774870260; x=1806406260;
  h=date:from:to:cc:subject:message-id;
  bh=e1uP/8tuNmfV0RvPQLo+c/X3CYg40ug3cda+MITZHcs=;
  b=Ht3WQOj33qfyC4+XdPwOscO5VunfwSEcUj4duN00RtyPqF+XV6O9KlTh
   hrv/umRQY8HxstsL1cR9NQYzVAQGRMqTeiVk52MBh2UuqoVcP5xSmj2ZD
   xrjpXAQBn7ue5buBjytk0H34wzlSrlCUrin42cMJYGh4gTi3J3et86La5
   lwOK6D6iEwbSh6oAiyTiPIUtOAh8VtyXjnRAZYJkY/AlakejuhgDn3zHO
   2HFNBD/enJdRTw7szv92WP1bGJoTJ3Z9ldMk4SGtiCfcRZPGL57vfFdNE
   4gWRMo1jQs/lvXnMgMFilFCQfOxi+SMrDCJoDl/PkxkdoOJ3pjzd8E8lx
   Q==;
X-CSE-ConnectionGUID: nhTBUUTAThqzPD2e0+0tDg==
X-CSE-MsgGUID: z/bun3ObRPm/Z6b2p0hI8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="86477082"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="86477082"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 04:31:00 -0700
X-CSE-ConnectionGUID: udTAbJaPTBWY/SAwAY92Dg==
X-CSE-MsgGUID: omWe87i9Q4CqLcQw/y4q2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="256542503"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Mar 2026 04:30:59 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Apb-0000000011Z-48fE;
	Mon, 30 Mar 2026 11:30:55 +0000
Date: Mon, 30 Mar 2026 19:30:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/hyp/nvhe/switch.c:391:5: warning: no previous prototype for
 function '__pkvm_register_hyp_panic_notifier'
Message-ID: <202603301908.NRB3sRai-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 4b5a009cd21622260e1f19afbd0ff7440102b6d8 [5/5] ANDROID: KVM: arm64: Introduce a hyp panic module notifier
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603301908.NRB3sRai-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301908.NRB3sRai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301908.NRB3sRai-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/switch.c:391:5: warning: no previous prototype for function '__pkvm_register_hyp_panic_notifier' [-Wmissing-prototypes]
     391 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         |     ^
   arch/arm64/kvm/hyp/nvhe/switch.c:391:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     391 | int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__pkvm_register_hyp_panic_notifier +391 arch/arm64/kvm/hyp/nvhe/switch.c

   389	
   390	static void (*hyp_panic_notifier)(struct user_pt_regs *regs);
 > 391	int __pkvm_register_hyp_panic_notifier(void (*cb)(struct user_pt_regs *regs))
   392	{
   393		return cmpxchg(&hyp_panic_notifier, NULL, cb) ? -EBUSY : 0;
   394	}
   395	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
