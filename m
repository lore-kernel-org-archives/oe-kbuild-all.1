Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3862FF657
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 08:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785745012; cv=none; b=IazWfhy73vXr5mseCa2nn7PIp7964sYt7SdMQiPSvptl1YzikwzunEnbGnXM55wsgSzjb1nVb9BQKiCNU1csWJPJlvSQMpN9NtCuAS3fmf67z71bND9Lj5EfYs6yJYkKkczTPvARtU2zpsuRFSnRE6n8rQKlFojNEo9yeYrfzyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785745012; c=relaxed/simple;
	bh=CdrM/fN6t9hFnIsPNs/T8LrSyXZChHteYj4d5HOG+68=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uBc0KnBdy9jxreqpDqKsufLCl1LArG4OyOxkGrf3X//MrzSAJTVdQZUFPSfyO8T0YDtfZWb00SbOBX6+q0OFA0PvQ9rt2CKCmTftwkNQVk+2TeGsqgEyNovW76chjTZrT1TODp6DoeDIqmv5FIMyjiQujnH7nGhYjhV/nK9jGo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eaX658UM; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eaX658UM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785745010; x=1817281010;
  h=date:from:to:cc:subject:message-id;
  bh=CdrM/fN6t9hFnIsPNs/T8LrSyXZChHteYj4d5HOG+68=;
  b=eaX658UMnb/shTRRef59DtzVB4xP3DqKPitwDxb6WRCwH5lYaQY/Cyp6
   vqYDotszCpl83D+0n5/Vhh7Eo+w/JQZnicWa1hy4caa5J7PwTrOp5T72g
   dUKtPZrvP05g6l4N0oJg0L2Qr+y/BdI6MZMAukCeRJxlvCRDxDOM1D16T
   Lkq3HXJIaLpvitIZ84r+RNvJ8rQNNoENMxY8NbJJXJNWAIVS7b6Q6Oo8O
   sagPuUqGtTRQjbv0uAx5gBv2Iv2dr13GA4kZgomm15zpLJ/QmjcQQBtsu
   zbm5uiUEfiJdBFdsWSALcsiHrrSDGF2ZSG6sgqIOTX1fWsfjOjSo/wccf
   Q==;
X-CSE-ConnectionGUID: e4hkKy7rTp+ZPicaKiS2Ug==
X-CSE-MsgGUID: zVQ+ySlSSpequSio2w4QGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86045786"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="86045786"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 01:16:50 -0700
X-CSE-ConnectionGUID: rYsE6+8ISfWCluA6jTn0AA==
X-CSE-MsgGUID: fidOHhkHSYiGgMJ7TuwE8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; 
   d="scan'208";a="264987247"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Aug 2026 01:16:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqnqo-000000006VB-0ynG;
	Mon, 03 Aug 2026 08:16:46 +0000
Date: Mon, 03 Aug 2026 16:16:06 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:timers/arm64-arch-timer-errata-sk 1/8]
 include/clocksource/arm_arch_timer.h:113:13: warning:
 'read_sched_clock_is_arch_counter' defined but not used
Message-ID: <202608031502.QbZfDhXn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git timers/arm64-arch-timer-errata-sk
head:   93953a96f1d16c9f07597b46642d3e61581a6c85
commit: 0e8b09c97ac7de82054327e5d29eae6dedc6002e [1/8] clocksource/drivers/arm_arch_timer: Add read_sched_clock_is_arch_counter() predicate
config: xtensa-randconfig-002-20260803 (https://download.01.org/0day-ci/archive/20260803/202608031502.QbZfDhXn-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031502.QbZfDhXn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031502.QbZfDhXn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/soc/qcom/rpmh-rsc.c:30:
>> include/clocksource/arm_arch_timer.h:113:13: warning: 'read_sched_clock_is_arch_counter' defined but not used [-Wunused-function]
    static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/read_sched_clock_is_arch_counter +113 include/clocksource/arm_arch_timer.h

   112	
 > 113	static bool read_sched_clock_is_arch_counter(const struct clock_read_data *crd)
   114	{
   115		return false;
   116	}
   117	#endif
   118	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
