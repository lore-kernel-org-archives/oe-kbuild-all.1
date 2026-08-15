Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97383C2D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 13:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786799165; cv=none; b=ivgtt5oAwUzCeoDuyB50e0DxBMofZe6HWi03azlBFr8dFhwE66E7BmvYafq+XbCXZT9POG6F38UJdu+SbYGuDZIZ9t49X0zxtQt4ZNjjQY20d1z0gtS/s/h9geDRkSh/HhrNGyNfeMelDZUdxexOWvRmvu3MDAp+/RdODVx8y+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786799165; c=relaxed/simple;
	bh=qQwJjUf4mRyO/HFcnw/lfXzOrU0tWblGBaDDJbNK43Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jWpor9sqohpV+DVrFRnGsv+BS98jDFcBlbUT2DDqZU4tIsW8QkvMATk0Oui8NC1Tz13fYEqSBP4hkDhnB+mpcHB0Tp4Hq3QXYEjLiLWdVDa7lZDGjziqtlT4QQA3TvlrGKt+zSTsrwaDd5FyQ/UAhK7Y1Fkwz0euqaOFetNnuq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k5tcbvu6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k5tcbvu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786799163; x=1818335163;
  h=date:from:to:cc:subject:message-id;
  bh=qQwJjUf4mRyO/HFcnw/lfXzOrU0tWblGBaDDJbNK43Y=;
  b=k5tcbvu67vg+j+KMRNNCFpgCM+FR0ZyakZZef1ACP2yOfjpA4MO5xx5t
   G9ltd4WVPODVwWKdJ5I+XwibXyuca+RJkPLE/XrSeCw/DMTNovK+0o/BM
   OwmT+t0yghgGYMI9ARPMxUjjs0pf6CCr1ztT1HnhpY7XGrbuUKst9SuB5
   JLw75MczjrvDaL/Wfy5Nhp14SZrLmo1mnVZ2aoZRzghCiQ81NohLEHcfU
   jDGvE+hmKr0jaQXjGDMHx92XG2C3qZGsHm8ca45nFCX8a1XdnovYQQ+oP
   2FIW1zuZRRMcVHr+8TdJBcKBSflr4NqrjwS94jm3FpqhCusv3U20O0Zfg
   g==;
X-CSE-ConnectionGUID: 0Qr8FPkmRMG9AXq95fU+ZA==
X-CSE-MsgGUID: uwyHUy1OSAadHovWoTcWoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="91164725"
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="91164725"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 06:06:03 -0700
X-CSE-ConnectionGUID: MO03eYfMR6eNz56Gm1lsuQ==
X-CSE-MsgGUID: tMBv/ip9QemEyw8YYu2JFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,225,1779174000"; 
   d="scan'208";a="265084466"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Aug 2026 06:06:02 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvE5H-000000006Pd-2RP4;
	Sat, 15 Aug 2026 13:05:59 +0000
Date: Sat, 15 Aug 2026 15:05:53 +0200
From: kernel test robot <lkp@intel.com>
To: Nicolas Saenz Julienne <nsaenz@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: ./include/linux/kvm_host.h:2567:60: error: 'struct kvm' has
 no member named 'mem_attrs'
Message-ID: <202608151514.xoFBoCun-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Paolo-Bonzini/KVM-selftests-Take-into-account-mixed-memory-fault-flags/20260813-123530
head:   83181006a1a420fa5d069d732ab343c59be874ab
commit: ae0b806f33b5ff2feb15a636c5b5dde474daeade KVM: Introduce a generation number for memory attributes
date:   2 days ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260815/202608151514.xoFBoCun-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151514.xoFBoCun-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151514.xoFBoCun-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:16:
   ./include/linux/kvm_host.h: In function 'kvm_memslots_check_gen':
>> ./include/linux/kvm_host.h:2567:60: error: 'struct kvm' has no member named 'mem_attrs'
    2567 |         return slots->generation == slots_generation && kvm->mem_attrs.generation == attrs_generation;
         |                                                            ^~


vim +2567 ./include/linux/kvm_host.h

  2562	
  2563	static inline bool kvm_memslots_check_gen(struct kvm *kvm, u64 slots_generation,
  2564						  u64 attrs_generation, struct kvm_memslots **p_slots)
  2565	{
  2566		struct kvm_memslots *slots = *p_slots = kvm_memslots(kvm);
> 2567		return slots->generation == slots_generation && kvm->mem_attrs.generation == attrs_generation;
  2568	}
  2569	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
