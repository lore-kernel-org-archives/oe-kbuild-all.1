Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793308238;
	b=4374KOaiPmeAf8dbS822EkkJxqn6f+OGlP9E7qAkLsx4m/LsQKaYCV0o74nMdIOS2/xx
	 sXRWES0ajEMcQNc6WrOab3mnvN+Yh2cCfvSEiRcQNF4rkO5k9SdjZ2p1bDK+637fVpkMw
	 4adm65XiJuoyxePhNGRKubhtUGG3kdBCUHiZ2To3Gr95Zj+LrlUJTmQlR9MfbE4Yr6cK8
	 JKd99uHB3g59RJ8uvE87XsCj9T4KegdTopsutdx4/qMMY+LFKNnNTVpH5yI+qcknSX6Nu
	 bP+PfDNq6aBWvNI4wyt9CuxLDrSp9aZMa86C9Rfy4qTU6YAL/9YK6nEuItXDzC5ASag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793308238;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5cUYLJIUQf6dhDw3BpMzD7Ue92T/wJf1G5x69dfmwr4=;
	b=Hhki75qp6X/jf4XosKIyWId0L1RgU1r6P8WxtZb8cYYcSImfoDzMPm7vEKllIsRLj738
	 cn54UMt1S6OoK/a/bHYlQODhSuKBKW301xskTaJDobjUkp6egD1lGn+/DlfJvVxLunCQL
	 3i1EBqCMjbm3pDTmmy02xQ3GwbG0X7ATF3yUK/m0t686PJ7rosHKP4jQ2WkN7whwmPwCB
	 7QjZI1jXh/VLnLEqdapujDimtBC3rXZn/Cd9i5mqyRmen8Rjf0jM4cAUBH9SsZkq1jvF+
	 t7gn6JkNLuqJISqEKuRganWHOOiqy2veZmln208o8XYWHRP8oP2bKIdo5RyLfTv4TaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cdMW8erX;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDFF606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 21:10:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CDFF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cdMW8erX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793308238; x=1824844238;
  h=date:from:to:cc:subject:message-id;
  bh=xKChhLn4Z5OXihL3JGn9CVM7xZIYNiy+x4saAW8HmlE=;
  b=cdMW8erXDQplD9JOP0X2CFNy0uqRPLLWdnPvK5Uo17T00jU+v0WB0FWw
   AVBCZA973gQ+c8Mcnk0PH5Wd270v/FCtwRfpB0OVwwFJEgnLHJ7gD5VXF
   taYE9d+Vv8ZWSo3pq7pANjMnfkVaSzcgCdZ9XQ5H60AkNmW1pUpVSSOcm
   6riBRpK+gWv1S2s5lLfZFhos7k0kD8G6vd8UiqG4dzRgsiEe3re7a6abW
   OibMdYl4vEvyDP5u7hmSlA49hGOX9o/dL0/J7Xk6o/LnBkHb9bNG4DeHZ
   CKCPNCZ34fxzb4PdJG6xG1sMmhDFjfpQfPAyWGebXb5oxpIjjz8PpsVpL
   Q==;
X-CSE-ConnectionGUID: ERRV5PW9SV2H883prUlgfA==
X-CSE-MsgGUID: N7CkmPeLS8qovjacJioL3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2099761"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="2099761"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 14:10:37 -0700
X-CSE-ConnectionGUID: dZlBuVXVS9iRX3+1lHKJZA==
X-CSE-MsgGUID: 5GcX6GzZQTijQrm7TmHjnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="7070336"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 29 Oct 2026 14:10:35 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMXOK-00000000awi-40N8;
	Thu, 29 Oct 2026 21:10:32 +0000
Date: Fri, 30 Oct 2026 05:10:16 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 4/4]
 arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1:
 warning: no previous prototype for function 'hyp_event_trace_filtered_smc'
Message-ID: <202610300520.2gOHE1sQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mostafa,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   16c3ec26766e69f67992c085e1fec7ed5ffb811f
commit: eea6841a3b9606ed64907c77030b1d50ebdd56fe [4/4] ANDROID: misc: pkvm_smc: Trace denied SMCs.
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20261030/202610300520.2gOHE1sQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300520.2gOHE1sQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300520.2gOHE1sQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:372:9: note: previous definition is here
     372 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:10:
   In file included from arch/arm64/include/asm/kvm_pkvm_module.h:6:
   In file included from arch/arm64/include/asm/kvm_pgtable.h:11:
   In file included from include/linux/kvm_host.h:16:
   In file included from include/linux/mm.h:2191:
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
   In file included from drivers/misc/pkvm-smc/pkvm-smc.c:13:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
>> arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: warning: no previous prototype for function 'hyp_event_trace_filtered_smc' [-Wmissing-prototypes]
       9 | HYP_EVENT(filtered_smc,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:126:1: note: expanded from here
     126 | hyp_event_trace_filtered_smc
         | ^
   arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h:9:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   7 warnings generated.


vim +/hyp_event_trace_filtered_smc +9 arch/arm64/include/asm/../../../../drivers/misc/pkvm-smc/pkvm/events.h

     8	
   > 9	HYP_EVENT(filtered_smc,

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
