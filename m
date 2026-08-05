Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3B2365A0F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Aug 2026 08:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785918310; cv=none; b=mTis1mRih7P6Ow2yY3fbUCkUebtvGHpaG6zM2+5tKVQbRD36Wq+3BCcuqyZC6A66ZxHxIojtvfFjxoU8OXw+eStapNdD+K7XQoQsnFkrYXbbhX7m7nqBwWzIBPeuA0rWo8UKQNpPV5BMTF7Pc3+sXShJBVXWncQJJXWS65r4kw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785918310; c=relaxed/simple;
	bh=FO/OX3dwoUFGf5a4LG1JXpR7ZbaM5DFIBsoS+PyrqRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BOrf1p3R03dudOWOoylkWGVklLODabF/rVid+IrOYTbNjulJpWuSwQjJWOHU+69VC7tjExCZPmKO/+c1iiWPTmeowwYpa685HN2T9PpPPGygNyKKFZjY1TJVmMkYPzCcC1bHzwrHDrQAEaY4q9+HtCZl9NJkM9qrP4vycGyHbAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LkbnSOWe; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LkbnSOWe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785918308; x=1817454308;
  h=date:from:to:cc:subject:message-id;
  bh=FO/OX3dwoUFGf5a4LG1JXpR7ZbaM5DFIBsoS+PyrqRk=;
  b=LkbnSOWeQJaWx/6qqez2CG6qRrPY07jvJybEdDvsL4OLno+ClGtHmTwf
   vE9UByUYzhfMTiEaWa+JN/bwtZugwZBx5lHeLhMZXJ5A8vTzuCrKck9GH
   u7OlAcK1cQL93+em5+SWTuM0we4CIknxS/EtVnd5XNeygf6k0PrKfvBzk
   7A4WArJoSYybZv7D3VP/zu3YMafat2xhsanHdp3ymvoedmzyrTZo/DU7m
   S4FHpIVD7C/7rzxtSqg7ZkZoHY+mSh/CumtA7CxYSEm12u/scBPpmUTfK
   i658MsK/cP8aTMPmb/BabwrKnQYc37hBOQXVjlURXlqTzA0E6ntEGo7Ce
   A==;
X-CSE-ConnectionGUID: nYrWmDvnRpuxX9TkPCy54g==
X-CSE-MsgGUID: nJyRuNGgQh2y/qRleK6JHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86344720"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86344720"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 01:25:08 -0700
X-CSE-ConnectionGUID: BipRFXziQfOCitMJyww+Xw==
X-CSE-MsgGUID: R0IaBC78TOaDERoApxUjeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="263725672"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2026 01:24:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrWux-00000000Bub-0Svd;
	Wed, 05 Aug 2026 08:24:03 +0000
Date: Wed, 05 Aug 2026 16:23:57 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [peterz-queue:locking/core 17/21]
 arch/x86/boot/../include/asm/cpufeatures.h:228:68: warning: "/*" within
 comment
Message-ID: <202608051607.JJhH225u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
head:   098a858bcdad1b6327e23274626c9fb36c5932fc
commit: 6cbc4e025e8c31cdc861ad9f2f53dc0eb290d586 [17/21] x86/paravirt: Use static_call() for the paravirt spinlock ops
config: i386-randconfig-141-20260805 (https://download.01.org/0day-ci/archive/20260805/202608051607.JJhH225u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260805/202608051607.JJhH225u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608051607.JJhH225u-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/boot/mkcpustr.c:15:
>> arch/x86/boot/../include/asm/cpufeatures.h:228:68: warning: "/*" within comment [-Wcomment]
     228 | /* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */


vim +228 arch/x86/boot/../include/asm/cpufeatures.h

   222	
   223	#define X86_FEATURE_VMMCALL		( 8*32+15) /* "vmmcall" Prefer VMMCALL to VMCALL */
   224	#define X86_FEATURE_XENPV		( 8*32+16) /* Xen paravirtual guest */
   225	#define X86_FEATURE_EPT_AD		( 8*32+17) /* "ept_ad" Intel Extended Page Table access-dirty bit */
   226	#define X86_FEATURE_VMCALL		( 8*32+18) /* Hypervisor supports the VMCALL instruction */
   227	#define X86_FEATURE_VMW_VMMCALL		( 8*32+19) /* VMware prefers VMMCALL hypercall instruction */
 > 228	/* free: was #define X86_FEATURE_PVUNLOCK               ( 8*32+20) /* PV unlock function */
   229	#define X86_FEATURE_VCPUPREEMPT		( 8*32+21) /* PV vcpu_is_preempted function */
   230	#define X86_FEATURE_TDX_GUEST		( 8*32+22) /* "tdx_guest" Intel Trust Domain Extensions Guest */
   231	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
