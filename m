Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2E62459DC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 02:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781317339; cv=none; b=uciZ9fslmVbQXuZDyDY11AlZLDyVtwRo4PooxW//QeS1nCFBwS/9rprMe2rvTavcpZz3jqHAclah2TRHv5WqlPGuCWU7w0j87Q0dv3f9ruOyJGRR9OlAi/Xt9+x50sRcHPxfzAQbsgTFkLNbL3SzqdiNXUUNKqRR5WYuhT8Qfm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781317339; c=relaxed/simple;
	bh=UJi+Un2l7H5+m7vjtfQiP4hmxC4aPKvH+kraswM7Two=;
	h=Date:From:To:Cc:Subject:Message-ID; b=geIPyTwq7IJiaToRm+Xpe0grmcJAUpXE+N5UsNUOzUWW0pNpZbrnU6PelYRfFEEvzDVe3pYqMysQ7Y3pfEcw0qnb1fUu4THms0mqzV0BUizzI59RajXxyEPvOaB+F+EMj3NqknFbcnZtqNe8aWy1uqAy1aA0zCLN1V6PkVEKVe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ov098eg0; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ov098eg0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781317338; x=1812853338;
  h=date:from:to:cc:subject:message-id;
  bh=UJi+Un2l7H5+m7vjtfQiP4hmxC4aPKvH+kraswM7Two=;
  b=Ov098eg0G2RpFQpF1uwxeD4rWKjSbS8UXqx4vWOE3+5X5fMgNOIFTNrE
   q224T6J8zySCsV54SgsMQXzVUOgDev+dFWa1uWb1wrSTf0WGBQybKiAQj
   iSLBpxGSAyc09Ylqfiv3loe98YobRMIziC6hBzsNNmcK+LEV50vseLmV0
   k4DA76UNxPpcnSy/gy+mdGF3uMMmxMROc91eSFJuQFLQ2f0O0nlsnVe0V
   nsfUmD7dMCVXJG2tRTf4ZulK6YNPV704AQoThGX3C6Xw8nxvu+olb+EYL
   ttlTnMgRWo8K+x/IMII7H81TovNSG1HKTxJyFUer6Alt5xRAKs9mLBn7Z
   Q==;
X-CSE-ConnectionGUID: tOY1eBwjR3OGYjrkmNLJuA==
X-CSE-MsgGUID: 0Sd+ovbZS420EStt57R73g==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="107586564"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="107586564"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 19:22:17 -0700
X-CSE-ConnectionGUID: L0Athlv7SpOfXlLGuuwJnw==
X-CSE-MsgGUID: elF/7oD7Q3W9PI7/WR3TEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="277169249"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 12 Jun 2026 19:22:16 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYE0j-000000004PV-2rOE;
	Sat, 13 Jun 2026 02:22:13 +0000
Date: Sat, 13 Jun 2026 04:21:22 +0200
From: kernel test robot <lkp@intel.com>
To: Colton Lewis <coltonlewis@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: ./include/kvm/arm_pmu.h:278:52: warning: 'struct arm_pmu'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202606130454.x4GYyi5q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Colton-Lewis/arm64-cpufeature-Add-cpucap-for-HPMN0/20260613-033645
head:   f0ac8bf7b4ea424f35b3e1d9432624eb4b17bf83
commit: fc23a2e4c3d4ad64dd0b5a4442738a685db5f944 perf: arm_pmuv3: Handle IRQs for Partitioned PMU guest counters
date:   7 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260613/202606130454.x4GYyi5q-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606130454.x4GYyi5q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606130454.x4GYyi5q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ./arch/arm64/include/asm/kvm_host.h:38,
                    from ./include/linux/kvm_host.h:45,
                    from arch/arm64/kernel/asm-offsets.c:16:
>> ./include/kvm/arm_pmu.h:278:52: warning: 'struct arm_pmu' declared inside parameter list will not be visible outside of this definition or declaration
     278 | static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
         |                                                    ^~~~~~~


vim +278 ./include/kvm/arm_pmu.h

   277	
 > 278	static inline void kvm_pmu_handle_guest_irq(struct arm_pmu *pmu, u64 pmovsr) {}
   279	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
