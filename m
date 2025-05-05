Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5535680
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 20:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746477945; cv=none; b=QsevHAK9qdETh+9qTPSJ2/IvKnHstRidmn8DCoD0kG0kEu8zMtcrxDjmdpoaRJanDNwUNa8mk7HfUihxdbHww/Qzd2R3GwSEVMaXZRob/FO/Cyf11+N1CKKu045XH14XXydrnbVBMCI1mwaOQb2WdvC6AxzmMN7FXPiIPTNqZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746477945; c=relaxed/simple;
	bh=oyzZGX2NtuusuY23kVPldyjxYgMrRinVHpQ5E14VYdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JKJiVI92PW26eFUnvC4YsbRQ0y3sHUK4GFeJOkP6NxlebJCGJurozRS/Xwyjf6ghoIZzM32kw5qdzzN2OOP0OHjs2BPIFMMbpQjNWzY7QogrGrmdrceFi0bn+GGjtRRRSCEDoL2JVxU7upMDPYvULDMDZVmYtG0kzVs5VJ9iyDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqS1pIGU; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqS1pIGU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746477943; x=1778013943;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oyzZGX2NtuusuY23kVPldyjxYgMrRinVHpQ5E14VYdE=;
  b=VqS1pIGUPVN2Qlwt9xtL0CuUlaT5YuU8y6Mtockvm1k1hvOsJlesykSo
   r3I3yvw4mi3G3ISPhJLi5R/Qf3tbK6/DReMUoLQfoKjG43KvNE47+bXMi
   jUIMawHHjHZtREHysocF6G8xAN43KaEonaOhP6DeLb/MRtCDVyGCBk8pn
   4LQ0SroLzdQry1USvRQAPeUxyPMJY+irsrMhpo5QIXoY1n+It6QAz6UuW
   VkIbzd3sF26iUJTGPBtEZiZC2bFjSph2zV2DXb4KPwszlk4Yy4sifiet0
   cKxtTaZa4vsyIZx4pRspc59VtaYuxm/JnSXfkg+8cxMe8FVNKWjtqKmEz
   A==;
X-CSE-ConnectionGUID: FBHXucK6Rku2vU71a4CdiQ==
X-CSE-MsgGUID: zhi647QKT7W1W1J4NeLtCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11424"; a="59095402"
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="59095402"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 13:45:43 -0700
X-CSE-ConnectionGUID: M1rfomuIRzmRRohQFPhttA==
X-CSE-MsgGUID: b3EGssKFRmCnkd9V4/Zd3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,264,1739865600"; 
   d="scan'208";a="172577584"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 May 2025 13:45:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uC2h0-00063x-32;
	Mon, 05 May 2025 20:45:38 +0000
Date: Tue, 6 May 2025 04:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: Robert Lin <robelin@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add
 WDIOC_GETTIMELEFT support
Message-ID: <202505060408.bJxeJLHT-lkp@intel.com>
References: <20250502043727.396896-2-robelin@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250502043727.396896-2-robelin@nvidia.com>

Hi Robert,

kernel test robot noticed the following build errors:

[auto build test ERROR on tip/timers/core]
[also build test ERROR on linus/master v6.15-rc5 next-20250505]
[cannot apply to daniel-lezcano/clockevents/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Robert-Lin/clocksource-drivers-timer-tegra186-add-WDIOC_GETTIMELEFT-support/20250502-123914
base:   tip/timers/core
patch link:    https://lore.kernel.org/r/20250502043727.396896-2-robelin%40nvidia.com
patch subject: [PATCH v7 1/3] clocksource/drivers/timer-tegra186: add WDIOC_GETTIMELEFT support
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20250506/202505060408.bJxeJLHT-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250506/202505060408.bJxeJLHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505060408.bJxeJLHT-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: drivers/clocksource/timer-tegra186.o: in function `tegra186_wdt_get_timeleft':
>> timer-tegra186.c:(.text+0x174): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
