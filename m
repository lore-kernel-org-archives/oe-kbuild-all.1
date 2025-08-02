Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2416B149DF0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 13:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754142853; cv=none; b=gihU1jSz9dlp0qSwytK5DVcIP4fEGjFu2mvfdL8LOBUIq+THvjryEZ1gAVk89j+UsjdJh+Kj8ni8EMpmJESpND9kx2rzrwSmMSyqc6n0WJeRXsZmMZvjsMmFI8U0zMb1d8KjF8PzQHIs9jUsBPd/EfJYlmgfJAGb9SR/17kK5WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754142853; c=relaxed/simple;
	bh=sZYFL+DlHnwnmBxE98YJgOOnL9vH+kc03VHFt1T2ebs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbnbX2dlOgaD1/5jjB0FIlH7IeOBw9h6m+bRh3ft9r5+XS4h3CBI0KdqrfkaEksP3AQeEOMFD1A7y1l4u+vf379/bJjz+11c98TNg5OXM0IgDWL/woLsf/+4BLADFh7BD/up6oihksxDOK39/v3+iBpzn8LaT/UjRUI2AUTO9xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K+Uq+GMW; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K+Uq+GMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754142852; x=1785678852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZYFL+DlHnwnmBxE98YJgOOnL9vH+kc03VHFt1T2ebs=;
  b=K+Uq+GMWKuegzDTjCOdeXt39FrYQN8gIs0BjIYeI3bPeHNG76FOnshZe
   WA0WEEdPkqF7G98abwaJY5tNd41HDr5qe+6PFEPnm0YYcoVJ11IYMg90S
   CVVYrCa0fkdUYmC0TK8po7b4dbhC9cQzupHxCl1G1O+XGPUPHP3wVxR5m
   ppoq93cAZ8OPYQaVq9JOgBEm5Kwtt6EpR5o3KrPifmdpihCWCPkVjguop
   QUucncwo7+z0WjNNokLyqUzUcmX2UzEQJn2fJwIAkb0Ygkti111S26vvh
   womitfiykdDMW/skeWHNlMDSu6veq1E21GIE2muEwCFJBaIVXTCmLdi4d
   A==;
X-CSE-ConnectionGUID: mPLnT0TOQNSdeoLRP+Z8Qg==
X-CSE-MsgGUID: zZsmHFFvQg6rXAMQadJN/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11510"; a="44062110"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="44062110"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 06:54:11 -0700
X-CSE-ConnectionGUID: PtBtRKVlSz2nKWvq3KHSrg==
X-CSE-MsgGUID: cOzPOntARLOINLlP+ccxsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="194738859"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Aug 2025 06:54:10 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiCgZ-0005Oi-1Q;
	Sat, 02 Aug 2025 13:54:07 +0000
Date: Sat, 2 Aug 2025 21:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>
Subject: [netdev-net:main 15/21] kismet: WARNING: unmet direct dependencies
 detected for ZL3073X when selected by ZL3073X_I2C
Message-ID: <202508022110.nTqZ5Ylu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git main
head:   1dbf1d590d10a6d1978e8184f8dfe20af22d680a
commit: a4f0866e3dbbf3fee4078bce0b78d65a0875c0bc [15/21] dpll: Make ZL3073X invisible
config: nios2-kismet-CONFIG_ZL3073X-CONFIG_ZL3073X_I2C-0-0 (https://download.01.org/0day-ci/archive/20250802/202508022110.nTqZ5Ylu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250802/202508022110.nTqZ5Ylu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022110.nTqZ5Ylu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for ZL3073X when selected by ZL3073X_I2C
   WARNING: unmet direct dependencies detected for ZL3073X
     Depends on [n]: NET [=n]
     Selected by [y]:
     - ZL3073X_I2C [=y] && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
