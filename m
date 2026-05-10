Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2666533507C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 May 2026 20:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778446193; cv=none; b=hDGIPHD8FHHwia9zxOXTeUxRQmd3fuF0aXkLWV8a8t4DpEpvUi4PAphWn8LM4HQ9W+dnHr/GQtc8o2Xi7PNca6xIdIEqG4w9t153XjCnTHx9RgT20i1FS/CCjGGsI1OQP8sXv5RP3tV9PEr0i1Kqz3dlf+n5T0zNeeTcK5NXF/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778446193; c=relaxed/simple;
	bh=ZA03UF8t0Zknwe0KDjJAn3645XnyMtfaeNKcMOwmFuo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OVmPIIfah2ITBPDcMUTckVi5RneyJbCnDIPNljt8YlvvosPq1fSONy6JDze6+VMdEQfPU/4KzQ2s0aMY33SzHjRBUO4xhri42TbE9USkA9U5qEDB1QwYmEksaPL6X0dGcJnGQUClhxWYX5HCHuYAYzeMw+yXkIeYCLCY4lPZaN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQgvWDsN; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQgvWDsN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778446192; x=1809982192;
  h=date:from:to:cc:subject:message-id;
  bh=ZA03UF8t0Zknwe0KDjJAn3645XnyMtfaeNKcMOwmFuo=;
  b=WQgvWDsN1DgdPhL+vTn8RfQfH1GVaFjn44lmm+Y2VRgC4N2caChigl2b
   7bmZGERx/PsIRM0X/kywSvxrD086Tx066F4dBVDctxYwX5Y/6T/DJw7mw
   SxXEnndwx93hVLqtOwDu4K5x1KFJdcY+Fm3ioLwuxFADNqfH7TvnaL2Ss
   PBdIqcxLOEwq9TAeJX11ePcF7ZdtW0sQadL0vvy7azOmnYcNVvhU4fsW0
   1ZyjwrpSObZG9TaOb8vK/P+5QYDZ5Oq30QMyxQPl3erVGDIBp+vGE6QKo
   j9faSOkKZO9kG3mIqkoexsIUlRd3qnhWAuhvefelegt4Fb3oIszkmm46n
   w==;
X-CSE-ConnectionGUID: ImuTsApIR963NyxK4F4/iQ==
X-CSE-MsgGUID: IEFYrEW4Q4CPLeRI1lNf+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="79064708"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="79064708"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 13:49:49 -0700
X-CSE-ConnectionGUID: nG3GUyVaTQ6qwNNADGKmFg==
X-CSE-MsgGUID: g9qc7e8FSKiZWc6KvwKPWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="242250777"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 10 May 2026 13:49:48 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMB5t-000000007mD-3R89;
	Sun, 10 May 2026 20:49:45 +0000
Date: Sun, 10 May 2026 22:49:24 +0200
From: kernel test robot <lkp@intel.com>
To: Boris Brezillon <bbrezillon@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: Warning: drivers/gpu/drm/drm_gem.c:1630 function parameter
 'dev' not described in 'drm_gem_lru_scan'
Message-ID: <202605102247.HMBfc0Vu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Boris-Brezillon/drm-panthor-Don-t-use-the-racy-drm_gem_lru_remove-helper/20260510-224314
head:   1420cf2a3703ad635e3b61cc82035cc312dcd6f9
commit: 1420cf2a3703ad635e3b61cc82035cc312dcd6f9 drm/gem: Make the GEM LRU lock part of drm_device
date:   6 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260510/202605102247.HMBfc0Vu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102247.HMBfc0Vu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605102247.HMBfc0Vu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_gem.c:1630 function parameter 'dev' not described in 'drm_gem_lru_scan'
>> Warning: drivers/gpu/drm/drm_gem.c:1630 function parameter 'dev' not described in 'drm_gem_lru_scan'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
