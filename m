Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EE022E402
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 23:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754089833; cv=none; b=teLfhoxrl1v0r1WXHnyf3C81W0qsHHHWHo4LE+CVEcM8+FdjiLHe3L1/6T16oP1d08OPuqNRqYRw/Mzg7CMDRLn1mapVHv3z50pRUEh0nellZPsmIiGhpXxnpViQcw16kpDXWqCEJpppXLK4JnFW0uUb8wsiba7W1meAnTyqqTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754089833; c=relaxed/simple;
	bh=2gJmIHA3/ys3ovA9hgYNIo4yVyAObaGBjvNIG0/pGvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aIwDY3UeXdZ3LDs9Lfq6q1ilWWrQeTNV2w+TBgbCv1XakhhO7dek8yZHD4MtTkzS0hcDAELBb0VC4BeI/P0r6JEtfFOP4SJJvTDiEX6sYkDtKqayemTwKXmdy0b3mMjc1M7drF88NoaWpjvXvkXhefpaJ3xVwCpZkL7sAW9Aj1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WuUvpJAP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WuUvpJAP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754089832; x=1785625832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2gJmIHA3/ys3ovA9hgYNIo4yVyAObaGBjvNIG0/pGvg=;
  b=WuUvpJAPvu6T7vjDm+MdaHtZsBEeiX09JMrjRWP5wHUI1nWT7l++vO0h
   vnJRunhYI4Xo7T2Ffg4u7rR4rQoKT0MzhUIBLO4nQ4tNI1VWUPsWh2F07
   g++2hluHO4oXreyG7/dSoUUO2+BXVKtux/gerA8Dxa5szeTSLGl0hpufp
   Q3LQPW1V96uk5Ap0eaIDe7R8aiVyx0WZUlzorBFOw/RGCBdnBXkpmRUOn
   0DFKvTxkISIeEfKWQAH9PGlUM3Y7XhMpEzeh9M8ArBnkwPEdC8MTpQmH3
   Qon1C0tB3osfUdp/CiM770UnqrB6ydGrUXtTo/njJz4ETEs72eZfyhql3
   A==;
X-CSE-ConnectionGUID: nrgItOFGQ5yhWNCitOnhcQ==
X-CSE-MsgGUID: CkwH53qRQyWtKfmy/M7wng==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="67015786"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="67015786"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2025 16:10:32 -0700
X-CSE-ConnectionGUID: sYXfxVbSTu+73X2WF4ajug==
X-CSE-MsgGUID: yyZ/9G4ERPOElxs/E3d4lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="167870122"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 01 Aug 2025 16:10:30 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhytQ-0001Jn-27;
	Fri, 01 Aug 2025 23:10:28 +0000
Date: Sat, 2 Aug 2025 01:09:52 +0200
From: kernel test robot <lkp@intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mripard:drm/tidss/field-api 4/15]
 drivers/gpu/drm/tidss/tidss_dispc.c:614:16: error: implicit declaration of
 function 'FIELD_PREP'
Message-ID: <202508020138.oqtP2qVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mripard/linux.git drm/tidss/field-api
head:   8e7aa9647fd4168ea2115bb34ca99eade5b0c751
commit: 73915f6d396b27101175651c8980a4269e98502f [4/15] drm/tidss: dispc: Switch to FIELD_PREP for FLD_VAL
config: parisc-randconfig-2001-20250801 (https://download.01.org/0day-ci/archive/20250802/202508020138.oqtP2qVI-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508020138.oqtP2qVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508020138.oqtP2qVI-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bug.h:5,
                    from include/linux/cpumask.h:15,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/notifier.h:14,
                    from include/linux/clk.h:14,
                    from drivers/gpu/drm/tidss/tidss_dispc.c:7:
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'CH':
   drivers/gpu/drm/tidss/tidss_dispc.c:516:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     516 |         WARN_ON((dispc->dev->power.runtime_status != RPM_ACTIVE) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:517:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     517 |                 (dispc->dev->power.runtime_status != RPM_RESUMING) &&
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c:518:35: error: 'struct dev_pm_info' has no member named 'runtime_status'
     518 |                 (dispc->dev->power.runtime_status != RPM_SUSPENDING));
         |                                   ^
   arch/parisc/include/asm/bug.h:86:32: note: in definition of macro 'WARN_ON'
      86 |         int __ret_warn_on = !!(x);                              \
         |                                ^
   drivers/gpu/drm/tidss/tidss_dispc.c: In function 'FLD_VAL':
>> drivers/gpu/drm/tidss/tidss_dispc.c:614:16: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
     614 |         return FIELD_PREP(GENMASK(start, end), val);
         |                ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_PREP +614 drivers/gpu/drm/tidss/tidss_dispc.c

   606	
   607	/*
   608	 * TRM gives bitfields as start:end, where start is the higher bit
   609	 * number. For example 7:0
   610	 */
   611	
   612	static u32 FLD_VAL(u32 val, u32 start, u32 end)
   613	{
 > 614		return FIELD_PREP(GENMASK(start, end), val);
   615	}
   616	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
