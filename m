Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CA5624
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 00:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715990647; cv=none; b=j5k+uwXPaSwNer/Rqc2JUhZ5Mkulr+NpYa3QmnhNxszDRw1BtTUJjrxLHxT+SWB6qT5+N7dA2Psj0TosghPZrzchc3I1gq43if6k1UgZy9HxpGaGOtYEwJRPyXj6YjIC3Sq/KWW8BRpTXmYWJiWw9wYaWC8EGfmNQSwCbBioFec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715990647; c=relaxed/simple;
	bh=mNACX4cmBUcEMBF+MqpDi0+x51bDvZT5KPufHJdjHzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aymTO56mLvhFaN8Orchr3SwS7Slb7cXJbCye/qIPPZHJ+5NEyrTrkCgJNuc+Olx7ZsXmtVA9ExmuAVfkhOJZnA6949wR1/z9u+LT49ZCjjKWTsmky46uk+0xHIR3YYCqnTTOT+ioh+pX6zy41euPelTcczBh1M3k4G6Usqok584=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNkGc2gM; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNkGc2gM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715990645; x=1747526645;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mNACX4cmBUcEMBF+MqpDi0+x51bDvZT5KPufHJdjHzk=;
  b=gNkGc2gMAGFNu8eatNj7ZL1oesi1vwgmJbXSTvm/7zJuzVfaOFlzk5PD
   /9UTLYEnAa3DyeZa0mNBl8fLG7ikK6wR6kJRRoXucg45RwPEJDT5eqHGg
   +Oi8bAAxn2oBs0izaIc3kJfnKuUkzzBFoVfwmtg3g03kcSlHhsBKXHDcA
   YEkiqx+RrxaTDWnb+c8c9L3hn/79XxD2BBcf7U/mxH++1dVQc/IUmaPrt
   tXhs0WJZzkiw+B0Ar/EW53esD/cbA+dMC/9I33kPg51rHpUbPrCnwJ4Vb
   ODSohsnVh9z651KtHG1sj2ytXilcU5N3hAz93WxFw0VrApfGuam1p2mXB
   g==;
X-CSE-ConnectionGUID: NhuVa+gtQfuhAUPWOfwS0Q==
X-CSE-MsgGUID: oeCA2xiET+aOqccwtMrSEA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="34705212"
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="34705212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 17:04:05 -0700
X-CSE-ConnectionGUID: 7vqEs1kISeyvEft/IpxwKQ==
X-CSE-MsgGUID: MPji2dZlQAWRpO0YI3XJQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,169,1712646000"; 
   d="scan'208";a="32561568"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 17 May 2024 17:04:04 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s87YG-0001LW-1C;
	Sat, 18 May 2024 00:03:53 +0000
Date: Sat, 18 May 2024 08:00:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenxiang <chenxiang66@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7348/9645]
 arch/arm64/kernel/cpufeature.c:2209:50: error: use of undeclared identifier
 'enable_pseudo_nmi'; did you mean 'enable_percpu_nmi'?
Message-ID: <202405180744.AsLBV6aC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   82db6deaf0ed47731fce29fb698bbc9b1ff793ac
commit: b8c8255e1d74937638bca666264404952c60395a [7348/9645] arm64: Decouple KVM from CONFIG_ARM64_NMI
config: arm64-randconfig-r052-20240518 (https://download.01.org/0day-ci/archive/20240518/202405180744.AsLBV6aC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fa9b1be45088dce1e4b602d451f118128b94237b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405180744.AsLBV6aC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405180744.AsLBV6aC-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/cpufeature.c:67:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/crash_core.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2204:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm64/kernel/cpufeature.c:2209:50: error: use of undeclared identifier 'enable_pseudo_nmi'; did you mean 'enable_percpu_nmi'?
    2209 |         else if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && enable_pseudo_nmi) {
         |                                                         ^~~~~~~~~~~~~~~~~
         |                                                         enable_percpu_nmi
   include/linux/interrupt.h:240:13: note: 'enable_percpu_nmi' declared here
     240 | extern void enable_percpu_nmi(unsigned int irq, unsigned int type);
         |             ^
>> arch/arm64/kernel/cpufeature.c:2209:50: warning: address of function 'enable_percpu_nmi' will always evaluate to 'true' [-Wpointer-bool-conversion]
    2209 |         else if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && enable_pseudo_nmi) {
         |                                                      ~~ ^~~~~~~~~~~~~~~~~
   arch/arm64/kernel/cpufeature.c:2209:50: note: prefix with the address-of operator to silence this warning
    2209 |         else if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && enable_pseudo_nmi) {
         |                                                         ^
         |                                                         &
   2 warnings and 1 error generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +2209 arch/arm64/kernel/cpufeature.c

  2191	
  2192	static bool use_nmi(const struct arm64_cpu_capabilities *entry, int scope)
  2193	{
  2194		if (!has_cpuid_feature(entry, scope))
  2195			return false;
  2196	
  2197		/*
  2198		 * NMI support was not enabled in the kernel, but can still be
  2199		 * used by guests. Let the world know.
  2200		 *
  2201		 * Having both real and pseudo NMIs enabled simultaneously is
  2202		 * likely to cause confusion.  Since pseudo NMIs must be
  2203		 * enabled with an explicit command line option, if the user
  2204		 * has set that option on a system with real NMIs for some
  2205		 * reason assume they know what they're doing.
  2206		 */
  2207		if (!IS_ENABLED(CONFIG_ARM64_NMI))
  2208			pr_info("CONFIG_ARM64_NMI disabled, using NMIs for guests only\n");
> 2209		else if (IS_ENABLED(CONFIG_ARM64_PSEUDO_NMI) && enable_pseudo_nmi) {
  2210			pr_info("Pseudo NMI enabled, not using architected NMI\n");
  2211			return false;
  2212		}
  2213	
  2214		return true;
  2215	}
  2216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
