Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92144607A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 15:52:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785513178; cv=none; b=N+qNj1hDCI/cp5d/79R08Go0DqAjtoaHfXN3wIVPnEEri4Zv5q8oyQdSVNAVNGGbKWj4LQBVqbA3YSaYC3svZfMdQmsruyIZhpQo5QbQ+1Ob40+6thUxaO7NE2LMzp29FtKFmXYGQMIPX7T0OpbF6yyN9IWEVfIMahxsbE+kbA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785513178; c=relaxed/simple;
	bh=2SBapXBMKwYGcgxRavSx/2F0lDhV8rWUSyT+seD7VtI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QCPb9Pl/gN2ARKt3MVKilBwgLViS6+/vN469hysli93kuDAIlwqwMp+8/DH8svJ5F9NoH9TG+7aJyci6AQNzQ9HO+sJ6OHNLIoACS69EGYERtp69s4DwcD3kqm7MBG+rhDOZnSOYr23484zfssajjOFlsxLLQ1xtCKH+t/3x+U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kikl8Ev4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kikl8Ev4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785513175; x=1817049175;
  h=date:from:to:cc:subject:message-id;
  bh=2SBapXBMKwYGcgxRavSx/2F0lDhV8rWUSyT+seD7VtI=;
  b=kikl8Ev4YZ0CDb4AMY5gwFFBTWWdFDhbhfF9otmy4qpUb8THEJTsUXea
   76bpokRtgzQJNlN+KIeulaWAtuHeRYzvZp9o+x9Nl2shQ4KocqlWd695g
   pnc39OC1c0xFrptB/aQEnsnpvXBRMmZN2IhvL+vet3+oIiGcZgEpL0had
   FCcBtLJbWxkRZ0QLkIjqJdqKc5/mCx/ce5Lp/ZLKhmJ1jCII35TFHRrVW
   anPi9ikvYrKlwGbqZ7/KkgbgLCiEETEvMyApiXsvXymF2FuVrAfkeZBmP
   8xHegrF2oPPVTCkwZPrhwbUUBY8WT/iwvGA/m8LTzq6Ck90a0WHc+RiLu
   Q==;
X-CSE-ConnectionGUID: epIO9sm9Rmm71Wr0avwLSg==
X-CSE-MsgGUID: bmGPwNEfRSGnx8srUCL5gQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="96498493"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="96498493"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 08:52:00 -0700
X-CSE-ConnectionGUID: 6NlMNsA6SzK8hQMxdC2PuQ==
X-CSE-MsgGUID: P4pPM3ULSLi+Mxvl4wjUFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="265665407"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 31 Jul 2026 08:51:57 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wppWd-000000001Tp-2Ig7;
	Fri, 31 Jul 2026 15:51:55 +0000
Date: Fri, 31 Jul 2026 23:51:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 5/5]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: 'enum
 pkvm_psci_notification' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202607312300.32NNdnwg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   d32bfdf6c3d809458c048ad6694ba52e9b6c7440
commit: 68d457650f79d4b9f8f23b82a8d0a06c4c74419d [5/5] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-003-20260731 (https://download.01.org/0day-ci/archive/20260731/202607312300.32NNdnwg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607312300.32NNdnwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607312300.32NNdnwg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
      28 | static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
         |                                        ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: parameter 1 ('notif') has incomplete type
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:13: error: function declaration isn't a prototype [-Werror=strict-prototypes]
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |             ^~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'pkvm_psci_notify':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:32:22: error: type of formal parameter 1 is incomplete
      32 |   pkvm_psci_notifier(notif, &host_ctxt->regs);
         |                      ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:51: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: error: 'PKVM_PSCI_CPU_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     191 |  pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~~~
         |                   KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:222:19: error: 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared (first use in this function); did you mean 'KVM_CAP_ARM_SYSTEM_SUSPEND'?
     222 |  pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
         |                   KVM_CAP_ARM_SYSTEM_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_entry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:19: error: 'PKVM_PSCI_CPU_ENTRY' undeclared (first use in this function)
     249 |  pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                   ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +28 arch/arm64/kvm/hyp/nvhe/psci-relay.c

    27	
  > 28	static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
    29	static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
    30	{
    31		if (smp_load_acquire(&pkvm_psci_notifier))
    32			pkvm_psci_notifier(notif, &host_ctxt->regs);
    33	}
    34	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
