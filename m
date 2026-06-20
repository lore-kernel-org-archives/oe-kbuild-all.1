Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC164A32
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jun 2026 03:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781924436; cv=none; b=qWUJLTVkq4EIxo8qd4/J9CFAU9cFtfzPEAWQZdnWa7d7/fP54sZx3nSEqH8sFbU0yZSyt4Hyoy7eeOtBW5O/k4unfU1eFzu16HEsd2IyRGoh59s1N1mMEXKovZHZgHPaVK0EXm+L7YJGnE4fSN5HyADAaFcHdZ/95w7HKEgYDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781924436; c=relaxed/simple;
	bh=nSm0tpT7PBNpCOEmT++HeMOpcdf5jciHAQRWYyXB0do=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kD/CVCuvMu5JZ+wropjvpTly+1wHjBWy9T5dsrA1gbJps7gHDYXqnDNRL19XKaLQvZS0HiagOSADTZKvXiQJG2VFfObRbQe3wMvLON1Vl/gsr8C7zRp+hG1Y+QQC7l/1FGpiFVRWmQL65o2ksWzeVG095QQnDFxwx5ibhe+Fi/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hv1Wu5u8; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hv1Wu5u8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781924435; x=1813460435;
  h=date:from:to:cc:subject:message-id;
  bh=nSm0tpT7PBNpCOEmT++HeMOpcdf5jciHAQRWYyXB0do=;
  b=hv1Wu5u84tQka4MRifNKNOI4q6jZVdlQfgXZFCWcVQ/+0RpJVgZBdWt9
   uQCi4CUWjxIOd0dMV+KKh4PGRnL2GhwSGitg/51jHLzKOEzDSjaBKYG8N
   gmkAZl3JGgMoYFaqeoDk0CIOw7Ao1zylMyhA6OFWGgdme1528AM/ia4le
   yG/IMze3gE4hRpe2qJ1NhcsFrHHqkb9D0lJHRu0m0u3y1vD/UeQqLeAmA
   saB5F5cB3cr+qXnXLIoetjSu2or7qledmUYs4KH+Tt/MuJFIFqEC0wmuX
   9WN1peW0zRu7cZfo1W0AcQDxLUiQ3noaWyINoeueaSR/Y5SQbqNRYMtfs
   w==;
X-CSE-ConnectionGUID: CqLiLgwfSXKaHxTfuVmLpg==
X-CSE-MsgGUID: 7BL8mSWMTBaXls1uqix9ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11822"; a="82528071"
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="82528071"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2026 20:00:35 -0700
X-CSE-ConnectionGUID: 3mIR/8EpRKSVPPpwqF4xhQ==
X-CSE-MsgGUID: t0o5ot3AScCpMZNI2JBP1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,214,1774335600"; 
   d="scan'208";a="247612039"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 19 Jun 2026 20:00:33 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1walwc-000000005in-3nYh;
	Sat, 20 Jun 2026 03:00:30 +0000
Date: Sat, 20 Jun 2026 05:00:22 +0200
From: kernel test robot <lkp@intel.com>
To: Jing Wu <realwujing@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Qiliang Yuan <yuanql9@chinatelecom.cn>
Subject: include/linux/sched/isolation.h:104:52: warning: 'struct
 housekeeping_cbs' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202606200401.xuXyRgOT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Jing-Wu/sched-isolation-Replace-notifier-chain-with-explicit-callback-interface/20260618-111648
head:   1558ace3815ead46d20cb956f01d41f6c64fbf22
commit: c3a52f77e8143c35a98f8a3e04e16b852e12b2f3 sched/isolation: Replace notifier chain with explicit callback interface
date:   2 days ago
config: i386-randconfig-2006-20250804 (https://download.01.org/0day-ci/archive/20260620/202606200401.xuXyRgOT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260620/202606200401.xuXyRgOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606200401.xuXyRgOT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/irq/manage.c:21:
>> include/linux/sched/isolation.h:104:52: warning: 'struct housekeeping_cbs' declared inside parameter list will not be visible outside of this definition or declaration
     104 |                                             struct housekeeping_cbs *cbs) { return 0; }
         |                                                    ^~~~~~~~~~~~~~~~
   include/linux/sched/isolation.h:106:54: warning: 'struct housekeeping_cbs' declared inside parameter list will not be visible outside of this definition or declaration
     106 |                                               struct housekeeping_cbs *cbs) { return 0; }
         |                                                      ^~~~~~~~~~~~~~~~


vim +104 include/linux/sched/isolation.h

   100	
   101	static inline int housekeeping_update(struct cpumask *isol_mask) { return 0; }
   102	static inline void housekeeping_init(void) { }
   103	static inline int housekeeping_register_cbs(enum hk_type type,
 > 104						    struct housekeeping_cbs *cbs) { return 0; }
   105	static inline int housekeeping_unregister_cbs(enum hk_type type,
   106						      struct housekeeping_cbs *cbs) { return 0; }
   107	#endif /* CONFIG_CPU_ISOLATION */
   108	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
