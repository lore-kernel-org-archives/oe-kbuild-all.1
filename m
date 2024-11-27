Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C0D201022
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 22:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732745678; cv=none; b=Q2xdT4gkraG2tWlBC/PvtPaCpwiGefDtOFhoRrXOTxhTaDjLUWTJWTBsCmg8fNyd52epgSzn9ejUDzgPCSV0HT90z2mvdSqrn3SQ1UM4zATHM/sWQPx7AIvP9AIwDqRBSeY6FHqldWR5N2gw2aI+zZj5XShN+MaHdDLfHzAC5Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732745678; c=relaxed/simple;
	bh=MJ0P9FrunfREUamcr6i8vB0jIYATurrC61kNzzLg2PY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fe/ohiaaZPR58c6c4tPTGVxmsGl//WDav4ImszctkeJlqBVlogkhhMF3uhRXoJkLcvWR3K2pDiwqi+R8Kn4m6Ws0JDHrOQk9Qh6ujbrmCsf74KsoLtn22NfpxQbtiIQOVax80+zXVdMrs5pth3wdV0ScvshsKRxSdcSY8gUapXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fx3QTLjS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fx3QTLjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732745676; x=1764281676;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MJ0P9FrunfREUamcr6i8vB0jIYATurrC61kNzzLg2PY=;
  b=fx3QTLjSov9goOZQPKFJUvm1l28YlF/X3zPPINvY7rpcinf0eJmKWgI0
   a5KOiBxy2yrT30fSd96lU2bEth3waekC3WNRF5GjdwogsY8SWsVwtdX8z
   3sQjPHHyL0gz9fqWb50Yolofyc4MRlWm7ws2mlV7/0gcr73IkMDZS6l2L
   CvBwWMCezn8F7ZxA70jB6BEwt3fuSeROK9Xe8Rafo2acUeb0wGB0wark6
   msCa/mPietF2lLPASh7g9mnYsjgqIO+LMG4ZkX0CQtA0zQlbiH6n4CN5w
   +4bpWZnJ3V+rHuUseVP8l7zfDFXhFOcGYgIgVuAgv9n/QNU2Na3ouQi91
   w==;
X-CSE-ConnectionGUID: 9PJ9UBZtT/a+hLMrHRk2Wg==
X-CSE-MsgGUID: v/difWozQ8uEOdxWjlFlqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36894469"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="36894469"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 14:14:36 -0800
X-CSE-ConnectionGUID: HhCuSwuuT+eTuXlz3SjEAg==
X-CSE-MsgGUID: b+CbNY98TBKYTZENqyMsIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92900325"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 14:14:34 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGQIq-0008Os-0S;
	Wed, 27 Nov 2024 22:14:32 +0000
Date: Thu, 28 Nov 2024 06:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 151/328]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:222:26: error:
 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared; did you mean
 'KVM_CAP_ARM_SYSTEM_SUSPEND'?
Message-ID: <202411280612.6LAW1Bpn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c0d9896b3002fc622323de8e13e2217a746ef69d
commit: 68d457650f79d4b9f8f23b82a8d0a06c4c74419d [151/328] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411280612.6LAW1Bpn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280612.6LAW1Bpn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280612.6LAW1Bpn-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
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
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:32:36: error: type of formal parameter 1 is incomplete
      32 |                 pkvm_psci_notifier(notif, &host_ctxt->regs);
         |                                    ^~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: At top level:
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:51: warning: 'enum pkvm_psci_notification' declared inside parameter list will not be visible outside of this definition or declaration
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_cpu_suspend':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:26: error: 'PKVM_PSCI_CPU_SUSPEND' undeclared (first use in this function); did you mean 'KVM_PSCI_FN_CPU_SUSPEND'?
     191 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
         |                          KVM_PSCI_FN_CPU_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:26: note: each undeclared identifier is reported only once for each function it appears in
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function 'psci_system_suspend':
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:222:26: error: 'PKVM_PSCI_SYSTEM_SUSPEND' undeclared (first use in this function); did you mean 'KVM_CAP_ARM_SYSTEM_SUSPEND'?
     222 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
         |                          KVM_CAP_ARM_SYSTEM_SUSPEND
   arch/arm64/kvm/hyp/nvhe/psci-relay.c: In function '__kvm_host_psci_cpu_entry':
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:26: error: 'PKVM_PSCI_CPU_ENTRY' undeclared (first use in this function)
     249 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +222 arch/arm64/kvm/hyp/nvhe/psci-relay.c

   203	
   204	static int psci_system_suspend(u64 func_id, struct kvm_cpu_context *host_ctxt)
   205	{
   206		DECLARE_REG(unsigned long, pc, host_ctxt, 1);
   207		DECLARE_REG(unsigned long, r0, host_ctxt, 2);
   208	
   209		struct psci_boot_args *boot_args;
   210		struct kvm_nvhe_init_params *init_params;
   211	
   212		boot_args = this_cpu_ptr(&suspend_args);
   213		init_params = this_cpu_ptr(&kvm_init_params);
   214	
   215		/*
   216		 * No need to acquire a lock before writing to boot_args because a core
   217		 * can only suspend itself. Racy CPU_ON calls use a separate struct.
   218		 */
   219		boot_args->pc = pc;
   220		boot_args->r0 = r0;
   221	
 > 222		pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
   223	
   224		/* Will only return on error. */
   225		return psci_call(func_id,
   226				 __hyp_pa(&kvm_hyp_cpu_resume),
   227				 __hyp_pa(init_params), 0);
   228	}
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
