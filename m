Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856BB322749
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 03:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782185737; cv=none; b=Qr4H1Y74yFzXKLw8hYAqmrL69AYMruiKJ8dkk+xswyDL0Nwrnua7Pch+GIzBkY6hF/qdqolPMLY9TtWR3zcLi0OIH4mKkPoAD58PgkT/X5790U3XxGAc7GFd2s4nt/BASpbai0j0BQmhtlONueoYFGfoq1BQ8Fvwt0pntNKsOMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782185737; c=relaxed/simple;
	bh=mhSGEL+H6ZoLJ/utWyb8DbnoljRUDqWRcOOAwvTV2rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XBvXSEQQQ5pC80etqlldxiP0RDuQlVjc9i8k2k5XU3sdP8Q2yI9sa9Gwgg6k7sYcCaj3lQi76S1VeU2mDSDepFSdtGM1Kt6+ZMsI5X7pPo9ebTzKziYAOUSN3S6WbU9Bif+eRlz4T2TrRZxlw1QAcD2hgjqAMaX1colO6IRT5x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sg9TEB4Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sg9TEB4Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782185736; x=1813721736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mhSGEL+H6ZoLJ/utWyb8DbnoljRUDqWRcOOAwvTV2rg=;
  b=Sg9TEB4YNObcao9Ik0E2FBjrsK8It/AMoZzlFFSTLhEHQW8n78qxqMPD
   7F7blReZ8HqiUR2xA+SKqFIUmfqdbX0xerG1D90hn4b3QB2fv9i7KsIFD
   T7WvawUEL4GkyDGXMAN/cIVSbHdMdq8rGjyO8MFK2bgdlLHGD72E1mdPL
   Vir+dr3YopL0gcuYJGkzWhU6ZMkn8ylI6P4JiGVTBGrLs9nsFVSi3Aflg
   tCLUNN9y9QQwvf0VnfW1oYCkw+ngeySQfyOTEXyE8LAxGaUTwRBj5DIKn
   9SH6e4dArixfNXdhPM3DN1p1vNL1jgg484SMGXMRoOZyCCQEqi/cEurlL
   A==;
X-CSE-ConnectionGUID: 6Ja5+gpbQY2UnT9i+viitA==
X-CSE-MsgGUID: IVHo6AiuSYC1KZFcDohgew==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100348658"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100348658"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 20:35:36 -0700
X-CSE-ConnectionGUID: TCUoaFKzTS+QaQq8DLAX4A==
X-CSE-MsgGUID: nt4gpT/pRYCREXpHeQm0XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="254487248"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2026 20:35:35 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbrvA-000000002DV-2C4L;
	Tue, 23 Jun 2026 03:35:32 +0000
Date: Tue, 23 Jun 2026 11:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:mfd 22/124] Warning:
 drivers/pmdomain/zte/zx29-pm-domains.c:40 Excess struct member 'node_id'
 description in 'zx29_pm_domain'
Message-ID: <202606231134.ewZKj2Rt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Stefan,

First bad commit (maybe != root cause):

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel mfd
head:   c94d760b3ed42a18ecbae9e63d7010c770a8c042
commit: cfb352e50ab41c1d23528d144442d0f5f688c6ae [22/124] ARM: zte: Add a zx29 power domain controller.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260623/202606231134.ewZKj2Rt-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231134.ewZKj2Rt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231134.ewZKj2Rt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: drivers/pmdomain/zte/zx29-pm-domains.c:40 struct member 'bit' not described in 'zx29_pm_domain'
>> Warning: drivers/pmdomain/zte/zx29-pm-domains.c:40 Excess struct member 'node_id' description in 'zx29_pm_domain'
>> Warning: drivers/pmdomain/zte/zx29-pm-domains.c:62 expecting prototype for zx29_gpd_power_on(). Prototype was for zx29_usb_on() instead
>> Warning: drivers/pmdomain/zte/zx29-pm-domains.c:94 expecting prototype for zx29_gpd_power_off(). Prototype was for zx29_usb_off() instead
   Warning: drivers/pmdomain/zte/zx29-pm-domains.c:40 struct member 'bit' not described in 'zx29_pm_domain'
>> Warning: drivers/pmdomain/zte/zx29-pm-domains.c:40 Excess struct member 'node_id' description in 'zx29_pm_domain'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
