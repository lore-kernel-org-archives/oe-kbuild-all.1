Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1C6338F25
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 08:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765960825; cv=none; b=UZIsbGjjEpeQSbqNw/2pkHQw8kb6JpUZpFBUGDVyGLl44j8HOe3lRomi5QwsMRiPBcEhwfFfJC+CECp8XURRYjRZGn21qWzLDOX1xlBgOMadXiYc3n2S3kjl9KHVl69WfyUbuzSmvJxD26Xa9hHgTNGLZJ8fyTf8qHelddxtCYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765960825; c=relaxed/simple;
	bh=Y8G+28joh8HQbyClTxD4meBtB4SsfELakEOCOhwAmec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=drGnGMP8zxk00dz8wq35nPc5C6i99Z4iMuRWNgWiCukuH01r8PL3IEei+Gn4C+0Kx9Cw98nMxbsxov43SdWYcp+D/oZ24w5o6SHt5rxKJVxH989qGOKYgf9WLZ5rN/Z/3xR3OctS+LH374ClvJOX7smQIzsvnv+UsoYBhnUsULI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PQKgq0GQ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PQKgq0GQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765960824; x=1797496824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y8G+28joh8HQbyClTxD4meBtB4SsfELakEOCOhwAmec=;
  b=PQKgq0GQFtvyuZXMjPIWmT+1NPGV8InHtZQCq2zg18hsTpl6BfR3Rkx6
   Mg1BNf6XcufXIn/NN9X/nP+ZFxlsDa46i/gH0lf3zaJAJfv5pHaL8G9Hz
   R08JXHy4pM+N6EqH1oLJRn/mBD2bTc9hvY+8Zboj43hFVBiCIdKij4i6M
   /DVpcsm8aNX9hEcCzJEExSAA0cD4Wb7IbcKG9N+rpEo8i3OrAbXpIxCMr
   GzhiRMxZO/yUeDDFVfPiNxB1GFNJOpIfWxGdJYi7r/PlZ0mNYwiMvDlAJ
   4rXIyDTWc2NJqTu+LXHbjxcLqQ6yetxdkibtoK6NlbDODh+MdzjAkqP6K
   Q==;
X-CSE-ConnectionGUID: PxW3GiLkQFGYdVGwsU+TSQ==
X-CSE-MsgGUID: s+8qsMrJTbqFxS19rDq9Xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="93368333"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="93368333"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 00:40:23 -0800
X-CSE-ConnectionGUID: OYkyQ/h/SoSLqXX4X/2QRQ==
X-CSE-MsgGUID: 8HYDGgxdRcGu87clE13ngA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; 
   d="scan'208";a="198740167"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Dec 2025 00:40:22 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVn51-000000000EX-3tXy;
	Wed, 17 Dec 2025 08:40:19 +0000
Date: Wed, 17 Dec 2025 16:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 1/1]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:28:40: warning: declaration of 'enum
 pkvm_psci_notification' will not be visible outside of this function
Message-ID: <202512171611.1LHZBVro-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Quentin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   adfcc1116ee5759e1bf9628f25f61398f9d17a0e
commit: a6f552f0abf27513c692c5dcd8e470c9dbea8b53 [1/1] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-003-20251217 (https://download.01.org/0day-ci/archive/20251217/202512171611.1LHZBVro-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512171611.1LHZBVro-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512171611.1LHZBVro-lkp@intel.com/

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
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
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
   9 warnings and 4 errors generated.


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
