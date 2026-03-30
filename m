Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326203876D5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864142; cv=none; b=EL9nmzkpLLY4QabRsSWnGXQ4l0YHDPJIWgliQbH0LLU1vonj8XU/ksJRRNX4fxR6aSy8RlITixRaK3VNPS7LDIJToP83Mls8mPaiZp7NOHg52TKFjltpSf4DmFKFlTFdy2QIhjOVG5mzEKjc4kJBQ56UUs9Kr6nBeImgrDJalek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864142; c=relaxed/simple;
	bh=rolUwMpOxs57zNwjA1CQ7rhVcS+7b8uly2np3sZDg+8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b5t8QWms86LQT822cUq2WaFsIsU68xi/Il8QT+5Z+lcSf/2vtKzb5IZYvBRc5DSw/dmc/N34q82VIKFN3bVtIDHOL+bb8gm2uz+OflVqb2PMxdYyCWPzbgaulV3SFZPe0v+ihxwvWKOBQezKYvbi6Qf45aqoV2Xw5CUANrnj7OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ddrym+AD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ddrym+AD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774864139; x=1806400139;
  h=date:from:to:cc:subject:message-id;
  bh=rolUwMpOxs57zNwjA1CQ7rhVcS+7b8uly2np3sZDg+8=;
  b=ddrym+ADKwOy4OeKsSWeYaDjQ/hV9S17fHLdDGqumEMzQnSpEb4PRAGw
   ePAXrXwIYsj5eUM5BIVFwXqBTDZ/gWXS2HA4sEVHSfLPtySXvHyDkVznf
   Oq7Wh+9PaUq4KYXbP2cxwP6VNuJ2A3YuLiVIfLLBWcxGBhkkFMtZgH/QS
   DeL1GtCIqWHFbsdclvl6ix/KPopwet/0aHkS95ZEB5INH0gJCj/n5Y2S7
   xhMbG3pWheeL6JKrhM/dTdJGnxxCoU80GILlNbEx2DecbqH+MHRhvKw8e
   uVtRTnPQMIxOgiPcw6tMBkpExWGAIhrVJ5BPGXamREb/8hkyBfCWeWYPr
   w==;
X-CSE-ConnectionGUID: q+pYSUX1TPSL6zm4lhJHTQ==
X-CSE-MsgGUID: acGg7pAtQAOj+sgtsGjDyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="101310604"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="101310604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 02:48:52 -0700
X-CSE-ConnectionGUID: tS6C47u8S1KVaT4kFqB9NQ==
X-CSE-MsgGUID: QgWFDin1QeWH00yUVBeZRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="249211002"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2026 02:48:51 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w79En-000000000vX-0F50;
	Mon, 30 Mar 2026 09:48:49 +0000
Date: Mon, 30 Mar 2026 17:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-poly-aosp-pixel-malibu-staging 5/5]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for
 function '__pkvm_register_psci_notifier'
Message-ID: <202603301724.Yg6rrCOp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common mirror-poly-aosp-pixel-malibu-staging
head:   5de4567efb4a2a85c5768504b0f45f278e9b13a2
commit: 68d457650f79d4b9f8f23b82a8d0a06c4c74419d [5/5] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260330/202603301724.Yg6rrCOp-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260330/202603301724.Yg6rrCOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301724.Yg6rrCOp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for function '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/__pkvm_register_psci_notifier +35 arch/arm64/kvm/hyp/nvhe/psci-relay.c

    34	
  > 35	int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
    36	{
    37		/*
    38		 * Paired with smp_load_acquire(&pkvm_psci_notifier) in
    39		 * pkvm_psci_notify(). Ensure memory stores hapenning during a pKVM module
    40		 * init are observed before executing the callback.
    41		 */
    42		return cmpxchg_release(&pkvm_psci_notifier, NULL, cb) ? -EBUSY : 0;
    43	}
    44	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
