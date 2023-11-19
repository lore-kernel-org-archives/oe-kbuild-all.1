Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E47F7F3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Nov 2023 01:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWcb+hh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700359074; x=1731895074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qN9skTXVoFZZSlyX+VNOQpfYZIAzaQ+mbVciBNMHxoc=;
  b=QWcb+hh3FDZnKKlE+Hazdivo3DIBvdQ+oMgDLY3otZlCMQ+E4WZ0Brva
   yLQavVPdP04Zanmm7atLHRTfn+kMC84Sg01K+fvcqO8KjOa4D+mmbTj4U
   g0BAcvn+XC28wC558WWQH6ByzhT+SYKVHaArbexhxzhvZUAalVY6QCkrh
   7lvFjoYYcdgOK3mvtYsvG1PXzqAH1bNcEo5y5KgQiIJE6jj5j/YU04Rvt
   WQxKFkVZt81cAKC0a9UpXpbpwNsb8eWE/QDkj7kSOCrlZviqEMXZPfGRu
   X4mSDZzFQfT0I5rW3lJS8HZRM5buLEflT0TV7fCyOLvzdMqK5SxAB9rW3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="457967539"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="457967539"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 17:57:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="7196299"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2023 17:57:52 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4X4H-0004WY-24;
	Sun, 19 Nov 2023 01:57:49 +0000
Date: Sun, 19 Nov 2023 09:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_WM8731_I2C when selected by SND_SOC_DB1200
Message-ID: <202311190914.zX7FPiKo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b8f1fa2419c19c81bc386a6b350879ba54a573e1
commit: 9dc15f81baf273b5aaaa3302ee8faacd78f361fd ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules
date:   1 year, 8 months ago
config: mips-kismet-CONFIG_SND_SOC_WM8731_I2C-CONFIG_SND_SOC_DB1200-0-0 (https://download.01.org/0day-ci/archive/20231119/202311190914.zX7FPiKo-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231119/202311190914.zX7FPiKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311190914.zX7FPiKo-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM8731_I2C when selected by SND_SOC_DB1200
   
   WARNING: unmet direct dependencies detected for SND_SOC_WM8731_I2C
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_DB1200 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AU1XPSC [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
