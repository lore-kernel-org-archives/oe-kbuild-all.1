Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299D2E267D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Sep 2025 14:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758983659; cv=none; b=NzBFP0F0MZffxdivBXlvIuaUEy8oz/MTexE2PLZ9aIryqcouXb0Bxr3rgcabqPXRR9i7ArnH9Q8lN4bFGvtqJ9lFpPKzUdTdmeKlralCqr4EhMTG8eG/xEseS1IgV+xGD8jbZ+sxl/Frk6LRVRpDB5ZPA0Pq7olRMt+8fV7kyIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758983659; c=relaxed/simple;
	bh=x3ica2lNBhHbX6QSnWNATI7InHwmZO2/vN0HUpQV0iU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TOr9xfW/Fks+IHeyZVctYXiL5ej9Xv95RBbGA1aaN39O1Dtvo8RyT+M6kOKqB5QSqMi9eKrtrYzSVTneYJwFj1k7xve4NyRMbdAfNSL+oXvgHrlv7NOCV/jy6x7NUXsKPO8yBN9JwXc0wxHtC6bGJqBxenbiNazyM2QEs9mS5x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuSMK6jc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuSMK6jc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758983658; x=1790519658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x3ica2lNBhHbX6QSnWNATI7InHwmZO2/vN0HUpQV0iU=;
  b=FuSMK6jcByE0BpIuB+7rZSeZ6f5wrvrNhiSOIFmv3u31VxXCafSJzV6n
   1CFr7IdqNwXt1CLSQINDCOBF6bxh5ZiAaSdRXLt95uKWbfsiD7sw2dPs4
   PgJrGgC7BKBYiSRVJJD82w1ZVhd2WE4B9SMC9l3ORR1rdVOg9N1Y/nKzH
   UnqAxPqONuG4QdZp7DWgejTvWcx/BFb44h9wgA+rxftM+edmV5XK9RtSb
   54rIOvaeMdxQlX9/Bwyp9u97a7FmEaeXurjiEQRwk+nnuIz1ubV27GoX+
   xD+OE6WWqmkdTrpG1mn9s/npaa8Vj+XzM1TnDe7xICT5LtRhA9MM/NypU
   A==;
X-CSE-ConnectionGUID: xSwoi+96ROi+21vl1l4bCw==
X-CSE-MsgGUID: 53DDeMaJTOSnD1z6l77WYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61182361"
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="61182361"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 07:34:17 -0700
X-CSE-ConnectionGUID: dS7FMNcjR+a/bNaM8LuWlA==
X-CSE-MsgGUID: BXNTg56WTducW7OymCA6sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,297,1751266800"; 
   d="scan'208";a="176972102"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 27 Sep 2025 07:34:15 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v2W04-00077J-2k;
	Sat, 27 Sep 2025 14:34:12 +0000
Date: Sat, 27 Sep 2025 22:33:41 +0800
From: kernel test robot <lkp@intel.com>
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [thermal:thermal/linux-next 23/24] make[6]: *** No rule to make
 target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by
 'drivers/thermal/renesas/'.
Message-ID: <202509272225.sARVqv2G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi John,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/linux-next
head:   79428e60897916401c9ed326f6ada4d7c7c997a3
commit: 19d3a401a617c68e9487f55b9f2efe213f8f949d [23/24] thermal/drivers/renesas/rzg3e: Add thermal driver for the Renesas RZ/G3E SoC
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20250927/202509272225.sARVqv2G-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272225.sARVqv2G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509272225.sARVqv2G-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[6]: *** No rule to make target 'drivers/thermal/renesas/rzg3e_thermal.o', needed by 'drivers/thermal/renesas/'.
   make[6]: Target 'drivers/thermal/renesas/' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
