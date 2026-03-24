Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C75F2D238F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 22:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774393051; cv=none; b=UWsEJERUkKduhsukZ0Y8ozuXgh7fGZCFLtR4/QtkiQMscIPnFUorZB2UMi6UDk26wR1cTu3IFgAq6yLwg2zjgqDB4dsab79xBYTP1e3k9XQ1ycVpfqDWAyhPc7M7gUjzus/sMQrpcf1eG/WvsRdlPU6seONnSQEzjGh0E9QlRa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774393051; c=relaxed/simple;
	bh=KbzHWsV8g8ft9Vlqgu14JCeqUNkTUt6Icf3Z63DwdFc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EJR85QJy9UrDGSdGs4hCjBkceCWsNC2fJR9tHm4YCmPxsfJdFzzOPvKA5ZfdOiKLNYBIaoCdupusPTrNiFmTY8WC9dL7tV/LZER/uP3GeKEQhYqHlTehberQ21tTHnUVoxHs3zmeF276mnLkvq0JfLw5V+c7S8Tcc+YP8yGLAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MYc6jwjt; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MYc6jwjt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774393050; x=1805929050;
  h=date:from:to:cc:subject:message-id;
  bh=KbzHWsV8g8ft9Vlqgu14JCeqUNkTUt6Icf3Z63DwdFc=;
  b=MYc6jwjt9YkLCj+4K08HzUmvJkI6KNDbv3G586eN0Hcp4k3IsX2RTVYS
   KoGNwZOgjDU2qsF2FIpMxGqQQAVeqKiAUNjHQ8Q0rPJRU4g5PUOjYumrI
   uHzxi+hfiG8+f49FAohfck3E9WulLqP0rRX/3zHOh8hfwYgdoW79nEkHE
   K4ckYf/CgRPNQilnCMMYELFCkEaj8UnIu62SUo9p440lTHmdUgmZIrz1g
   W3ck9a8e4cgIetmoZckRNZytuEyayz6qy368SsPF5TrEBznhqWpEZG4Gf
   d0SSGhW//W/mGG0e8gHVqo5kah2rHWZDaYh8oNxamj3fn/VA3O4kPrxiW
   w==;
X-CSE-ConnectionGUID: xOw75PvZRtC3+OtSRnNnEQ==
X-CSE-MsgGUID: /+v8kaaJTi+CdU1PzfzUgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86500554"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86500554"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 15:57:29 -0700
X-CSE-ConnectionGUID: YWdQlKJOQS2DcCKyseEwkg==
X-CSE-MsgGUID: IVHrsV7STVOsKxuZdoVq2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224760602"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Mar 2026 15:57:26 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Agc-000000005Xh-3rvn;
	Tue, 24 Mar 2026 22:57:22 +0000
Date: Wed, 25 Mar 2026 06:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 arch/x86/kvm/pkvm/../vmx/vmx.c:6224:7: warning: variable 'has_error_code' set
 but not used
Message-ID: <202603250659.VgWa6cax-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b28e01c379ff11bce445f0654f6016221fbf1b84
commit: 58576da065716240bdaa93b41de10110defd9e92 [1/1] ANDROID: pKVM: VMX: Handle EXIT_REASON_TASK_SWITCH
config: x86_64-randconfig-r063-20260325 (https://download.01.org/0day-ci/archive/20260325/202603250659.VgWa6cax-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250659.VgWa6cax-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250659.VgWa6cax-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/pkvm/../vmx/vmx.c:5603:6: warning: variable 'vect_info' set but not used [-Wunused-but-set-variable]
    5603 |         u32 vect_info;
         |             ^
>> arch/x86/kvm/pkvm/../vmx/vmx.c:6224:7: warning: variable 'has_error_code' set but not used [-Wunused-but-set-variable]
    6224 |         bool has_error_code = false;
         |              ^
>> arch/x86/kvm/pkvm/../vmx/vmx.c:6225:6: warning: variable 'error_code' set but not used [-Wunused-but-set-variable]
    6225 |         u32 error_code = 0;
         |             ^
>> arch/x86/kvm/pkvm/../vmx/vmx.c:6226:6: warning: variable 'tss_selector' set but not used [-Wunused-but-set-variable]
    6226 |         u16 tss_selector;
         |             ^
>> arch/x86/kvm/pkvm/../vmx/vmx.c:6227:27: warning: variable 'idt_index' set but not used [-Wunused-but-set-variable]
    6227 |         int reason, type, idt_v, idt_index;
         |                                  ^
   5 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_SCU
   Depends on [n]: X86_PLATFORM_DEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_X86_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_PRIVACY_SCREEN
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && X86 [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]


vim +/has_error_code +6224 arch/x86/kvm/pkvm/../vmx/vmx.c

83d4c286931c9d arch/x86/kvm/vmx.c Yang Zhang   2013-01-25  6219  
851ba6922ac575 arch/x86/kvm/vmx.c Avi Kivity   2009-08-24  6220  static int handle_task_switch(struct kvm_vcpu *vcpu)
37817f2982d0f5 arch/x86/kvm/vmx.c Izik Eidus   2008-03-24  6221  {
60637aacfd95c3 arch/x86/kvm/vmx.c Jan Kiszka   2008-09-26  6222  	struct vcpu_vmx *vmx = to_vmx(vcpu);
37817f2982d0f5 arch/x86/kvm/vmx.c Izik Eidus   2008-03-24  6223  	unsigned long exit_qualification;
e269fb2189fb86 arch/x86/kvm/vmx.c Jan Kiszka   2010-04-14 @6224  	bool has_error_code = false;
e269fb2189fb86 arch/x86/kvm/vmx.c Jan Kiszka   2010-04-14 @6225  	u32 error_code = 0;
37817f2982d0f5 arch/x86/kvm/vmx.c Izik Eidus   2008-03-24 @6226  	u16 tss_selector;
7f3d35fddd173e arch/x86/kvm/vmx.c Kevin Wolf   2012-02-08 @6227  	int reason, type, idt_v, idt_index;
64a7ec06681344 arch/x86/kvm/vmx.c Gleb Natapov 2009-03-30  6228  

:::::: The code at line 6224 was first introduced by commit
:::::: e269fb2189fb86d79d64c0ca74c6c1a549ad4aa3 KVM: x86: Push potential exception error code on task switches

:::::: TO: Jan Kiszka <jan.kiszka@siemens.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
