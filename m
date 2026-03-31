Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF061925BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 02:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774925501; cv=none; b=DqkOS3i69WODxnq+/6l2VjZVdezPRPcopiaw/26fOXzCqFsyBrmKJ3VlfJBHlMzcU9fqEubWb/yAtTZhKeY8l9bN9Ym7hJ75zTa1L2XuqZVJtGn0Uf3IOqZ+3RaaWsWoopjg7BodbLzqcyfBrAr1HkKy6hq0mMJCw3a+FcJoD7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774925501; c=relaxed/simple;
	bh=5xz5kLtvY3S6qJ/+a0gxI+uLTpyBoCLIO7O5V5hIPnc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FI3KqLd2WMAcuEWa7VkxsahVKPJy4M6gcY0DeXri6EPMOsn71AGu13ilk0G1PnRBH1f10Y1FVUEsNh+1kQQcrQXITbvIepR6PRuTvAPNemQ8mtqMYpMLcZJTmPuxNgZ+S7UfDjBrcOurjuJboGW4qyvXCz+fK+6xiP7hXdG0t+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cejPZss+; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cejPZss+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774925500; x=1806461500;
  h=date:from:to:cc:subject:message-id;
  bh=5xz5kLtvY3S6qJ/+a0gxI+uLTpyBoCLIO7O5V5hIPnc=;
  b=cejPZss+JbWESrCUAWWagJ6tU6sqqrOaD+udRYFUDTct+1WVxYm0Bdfr
   l8fds+zl2PISi2zgNeDTbh6GcRe4R+uMRtDD3xtY2KV7MkcPkbttfZPE+
   G395hLYCjlTbMQQP7i00dI6Vm2BgosNwSbcatEpQwqEN4fwYtHwnmlnRY
   OdFBsJbXua+wZrUuxTz44S8SQNJMobm/2GV/WQckt6+3N/BZQpFHWiOrV
   NsmM54JpDM5ralVqND3K/h+o/qafeFg0ItOnR75zLFex/VViUxa86QpW5
   1EO6twprOSL2h6kh+is7cdB+0m30SVGNw0HmhJDx1IXqMF+NrjQs2KfTv
   w==;
X-CSE-ConnectionGUID: 2eDIyuFBSJCouS6S1OzrZQ==
X-CSE-MsgGUID: /cxh25AyShCfLxdMY7ILcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="101386414"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="101386414"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 19:51:39 -0700
X-CSE-ConnectionGUID: UOSqJCTfQ72gV887haU5KA==
X-CSE-MsgGUID: UnxoAksdQbCI63gZ3YuUNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="249278977"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 30 Mar 2026 19:51:37 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7PCZ-000000008Gf-0ZwQ;
	Tue, 31 Mar 2026 02:51:35 +0000
Date: Tue, 31 Mar 2026 04:51:21 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Dmitry Ilvokhin <d@ilvokhin.com>
Subject: [tglx-devel:irq/core 10/15] kernel/irq/manage.c:2069:15:
 warning: unused variable 'ret'
Message-ID: <202603310450.oEYtwqul-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irq/core
head:   441c9c1a006b0553ee042b3bd979e3f004b3292c
commit: 2e6275cf004188e749d79ba9b357ab47a94c4bfd [10/15] genirq: Cache the condition for /proc/interrupts exposure
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260331/202603310450.oEYtwqul-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603310450.oEYtwqul-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603310450.oEYtwqul-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/irq/manage.c: In function 'free_nmi':
>> kernel/irq/manage.c:2069:15: warning: unused variable 'ret' [-Wunused-variable]
    2069 |         void *ret;
         |               ^~~


vim +/ret +2069 kernel/irq/manage.c

  2065	
  2066	const void *free_nmi(unsigned int irq, void *dev_id)
  2067	{
  2068		struct irq_desc *desc = irq_to_desc(irq);
> 2069		void *ret;
  2070	
  2071		if (!desc || WARN_ON(!irq_is_nmi(desc)))
  2072			return NULL;
  2073	
  2074		if (WARN_ON(irq_settings_is_per_cpu_devid(desc)))
  2075			return NULL;
  2076	
  2077		/* NMI still enabled */
  2078		if (WARN_ON(desc->depth == 0))
  2079			disable_nmi_nosync(irq);
  2080	
  2081		return __cleanup_nmi(irq, desc);
  2082	}
  2083	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
