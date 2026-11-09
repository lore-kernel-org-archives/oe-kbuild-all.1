Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794247819;
	b=Fy2ENNi8dsxvf2gl+FQdk+LaGJk069H4I/UHoZDY4OopNp0w2/p4rBJBw7B4wTMn/SBL
	 IJ2eNIoNoSMDKX9ntjai5NtRrjXkP65IURwfeJl3rVDlN732cPskr6irHdl5n63Y+nixq
	 j7W8GVmRrRtjR7saBhpBv/0a+/MXijZmlcPyy5mxCjzbuJBx8ByTsbTOV8twwlwMyLj7h
	 ZuijkPytV9Voi5POYnVaOUJCG3gTu3C6HlpDJdPIClvIt+5eBQTEPw/+XZFEl1YKWKDd0
	 0MpqhGfxyEnCfrFhttZyAOzP5DXIemQmcrDlSA7iTf5qRQHcxQlnshWiarkoP3wu/JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794247819;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=lgu8nqvcCGt9UfKhF717kM4XHSYAZ+qH3iJmzQN6ffk=;
	b=iu3tsRi2WkX78qd778QlYpSxtUul7ICyNGDvB23wPZCUUduaiLddWQZwMN/w2vuAUQ9S
	 vt1DQIYSiZgu5M9ERNTX0g3N5mcLU24YNlffVByaIvLizkqdbQ7/BQgz0JvsfCyowKsT6
	 5e0xOggtf5MSFOmNwtwekvq5YnqFgQ3i86yWZPw1J84auICLK7dgb+ba4hTJIdq1+PF3C
	 L0nzNt8kOwbCVgqFli5zUCbGAUZhhmH52VgQ+uYDT6h+k4TGr/EvnsccTgSfIba78jCiU
	 QPffj6pFPDMLSL0x7QriyvAIWQx/Z1FtbKV6mXaMARXCFDpCBtV00ceKt2zGk1xfzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HjY+UdAU;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66C3606A339
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 18:10:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E66C3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HjY+UdAU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794247819; x=1825783819;
  h=date:from:to:cc:subject:message-id;
  bh=R+7UJmvplARB2D5tt+lSF+TupyYmwbuJ8fGl1Z5WuKU=;
  b=HjY+UdAUfk3V9AZ0cvalPF0WV4rwhqJiArU06vPrxbNzcojlv5lUegOx
   2zp3R/QXkHWkQfT0dE7Ro/owSLZut8FXA5WjO8Uc662NdNT+MleqBIsha
   3ok3mj21qI86xEEMLdwtLD07a74DJGDVoMl3s4/gi/tw6jaxhnmWwxUYL
   QSJl1NqdrnlSkhYUOqVDPk30XuiMqJc1jgiC9fDqZH0BHLrsLTXnUesfF
   a1DocJKKvHb/4VNkcepB57vsl49/lpPW0RabIYw16YVUFMVxA5NU1L9C2
   T2q+RT2duAQeGjXn0IFFogEXewTWyFF9maeFMc8O+iNc36U3wPQCi2Fvo
   Q==;
X-CSE-ConnectionGUID: w78h2uL8QA2jM6fTX3uJAg==
X-CSE-MsgGUID: G6wcasLKR66vuWk9IUBDkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2867676"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="2867676"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 10:10:19 -0800
X-CSE-ConnectionGUID: pnVEhfusSHeahEGS63Sb0w==
X-CSE-MsgGUID: 1gHAWmoJQhuMW7i+d2n+nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="7929637"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 09 Nov 2026 10:10:17 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQTot-000000000Qh-0Ill;
	Mon, 09 Nov 2026 18:10:15 +0000
Date: Mon, 09 Nov 2026 19:09:15 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: declaration of 'enum
 pkvm_psci_notification' will not be visible outside of this function
Message-ID: <202611091937.2ow5eyX2-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ed54096456f66d61be3303aef4a9485e4b53b762
commit: a6f552f0abf27513c692c5dcd8e470c9dbea8b53 [1/1] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-2002-20261109 (https://download.01.org/0day-ci/archive/20261109/202611091937.2ow5eyX2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0d1bc7245734217f06f9bb7e09f9dfd09d31361b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611091937.2ow5eyX2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611091937.2ow5eyX2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp/nvhe/psci-relay.c:7:
   In file included from arch/arm64/include/asm/kvm_asm.h:50:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      28 | static void (*pkvm_psci_notifier)(enum pkvm_psci_notification, struct user_pt_regs *);
         |                                        ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:58: error: variable has incomplete type 'enum pkvm_psci_notification'
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                                          ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:29:35: note: forward declaration of 'enum pkvm_psci_notification'
      29 | static void pkvm_psci_notify(enum pkvm_psci_notification notif, struct kvm_cpu_context *host_ctxt)
         |                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:51: warning: declaration of 'enum pkvm_psci_notification' will not be visible outside of this function [-Wvisibility]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |                                                   ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:5: warning: no previous prototype for function '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         |     ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:35:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      35 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct user_pt_regs *))
         | ^
         | static 
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:191:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_SUSPEND'
     191 |         pkvm_psci_notify(PKVM_PSCI_CPU_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:223:19: error: use of undeclared identifier 'PKVM_PSCI_SYSTEM_SUSPEND'
     223 |         pkvm_psci_notify(PKVM_PSCI_SYSTEM_SUSPEND, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:251:19: error: use of undeclared identifier 'PKVM_PSCI_CPU_ENTRY'
     251 |         pkvm_psci_notify(PKVM_PSCI_CPU_ENTRY, host_ctxt);
         |                          ^~~~~~~~~~~~~~~~~~~
   8 warnings and 4 errors generated.


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
