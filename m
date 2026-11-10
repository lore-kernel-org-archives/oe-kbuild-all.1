Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341438;
	b=HJLNu5ePxJZbGG9YnwXqkq9AHLtFodmgD46ng0wI0eY5lGjr28IKkn8jHA3qHssB8ZO9
	 I8Egr87xKwSo8KEAwe85bM+B/KPEHWD4eYBb6gr6LYAcGN1lyQV7DjozlOzV5ZOhe+pIT
	 BXXeaDOr1FTk23oTIBcSd0bpZm34Z373aYzMdDEJdt+6jiWuWPDkv2tRtOym/4YjyPdCM
	 GJguqbh+vTvc1HgzE4Cu922Dhj7ZCIkAUyeIpcQgkOeluJdcVkFsFLUKVky3e/aYJels6
	 ny9hwjBgO6FiA65xsl9aOI4a8+IMkB+7fGwh2FcvP68ly8Ys4BCOYOoSMZqQI1oLg0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341438;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mguWoGMfeCS+DDnWKnDdE+1JVNhqt2gk6moOKQ5OlTs=;
	b=Pq8Wfl5DwiGrd2wRwBIGKcpC7uL988dd/3lTtsGpGm5HomZlQFdGOnYfpJYCOrRxXk6i
	 WTFLkcQWIDZevuw0EI1/v/g4e4uTvWy/eU1nRIcz5Z5DDO3gJWLZLy2jaydzT1f+wWCYv
	 l7BmZc/1jr5hkh+VEG84/XJcUPVF2/Dal/6MDGrSq0rtyOsYYylT+mXv69yrG0E/02nm2
	 dVrzyCmJYW7lr3F75mOE9Wf1Yz26KhTGgtHRatkIGMd+Ns8CwktnJAPICItf59eu8G+52
	 xYWb87yliQFCDLojYTusziIo2X0QY2fxPvopS5+rnj+De/Ly3TYdNJnsnCel5LN90Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g1id1pZ8;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5278606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 20:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5278606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g1id1pZ8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794341437; x=1825877437;
  h=date:from:to:cc:subject:message-id;
  bh=jNeUuympBlp815zZn15HqOovv6XzqvCOBvU1fUIZoLc=;
  b=g1id1pZ8E9TZxrVYzWKv+aMT1s2QfLY6vi1ORFys3W5qjlD+MYIOab35
   tyL7G4LTnKvoiEL/ALGimTOH3vSw01qq+S6B744zEuiDa3icwPsWiFQlE
   b7dnyGxpcwaSy4NSanEBEZTM9ibjXswB7W4A3eSZRXnzWWDi9fezoUnuh
   h9h/mATFefnxAW7Xdr9gDPjKKdtcI/IjVe0lok25yzu6TKRimC2v7Cekj
   JJaIgQ/YsTgz1LL68Ap0l4Xs3+0Cx5RKUsI7c/kM/p++N1vT9ilLWCBth
   d61UhGXdNmAMYlKFdE9SrDQqm9Ub1ju/0yQsI63t+kwbpx2IVdRGTm808
   Q==;
X-CSE-ConnectionGUID: uShNvMVDRmG/tnWt0kMcjA==
X-CSE-MsgGUID: tJuL5xLUTjijx0m1orm1CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2992506"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2992506"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 12:10:36 -0800
X-CSE-ConnectionGUID: mcyj+yHKSseAmy5OnybUpg==
X-CSE-MsgGUID: cU9CNVwfQtiwOG9TMEfOOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="10118108"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 10 Nov 2026 12:10:34 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQsAo-000000000LT-2r7x;
	Tue, 10 Nov 2026 20:10:30 +0000
Date: Tue, 10 Nov 2026 21:10:29 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 2/2]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: 'enum
 pkvm_psci_notification' declared inside parameter list will not be visible
 outside of this definition or declaration
Message-ID: <202611102152.VYIBQedM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   ab1b4fc5ca8eed85eb9259015586db20a639526a
commit: 68d457650f79d4b9f8f23b82a8d0a06c4c74419d [2/2] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-r2105-20261110 (https://download.01.org/0day-ci/archive/20261110/202611102152.VYIBQedM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611102152.VYIBQedM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611102152.VYIBQedM-lkp@intel.com/

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
