Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765732376B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 22:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S338ah9W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699050315; x=1730586315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+oKiD9lHjzcEymhf0eNoGLgt+il2+nhhtokOR2Mrc5k=;
  b=S338ah9W96VefqYF7blu0KZ3lR6L+ZAUo0jjL5Y6/Eyodlh80E0IecEj
   lIOQnIGMdrx5suJJ80KzStN7c/L9RKy/MwGqkx7L1kr93oQiZLbx46m05
   6S7wxwgN7K8rHHAabTJ0YGyVehtQ4Vonc5C2mtoJ4n7Ei+FT2Xv4qyWuk
   gi6SRlYfWK4BOSg70Vuud5gvfTQPAQHV215vescNCVerjUg6MmVzS/cAn
   /NE0OyYHUEI5niOgrMSgDvw6LB1jGnzz7keaWDVzBoReLTVsf7kOOsADb
   3+llDsAMiwRX8KmYfOyb/o1sWYPxdutdpuknPNnJdvbaJeEpoBI30B03v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1987758"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1987758"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 15:25:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="3049769"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Nov 2023 15:25:07 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qz2bB-000308-0p;
	Fri, 03 Nov 2023 22:25:05 +0000
Date: Sat, 4 Nov 2023 06:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>
Subject: kismet: WARNING: unmet direct dependencies detected for
 CPU_DCACHE_WRITETHROUGH when selected by ARCH_DAVINCI_DA830
Message-ID: <202311040615.3JpahwtF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6bdfe2d88b9ff8b0cce32ce87cd47c0e9d665f48
commit: f962396ce29244d9a64f241481fa73fa370404c3 ARM: davinci: support multiplatform build for ARM v5
date:   4 years, 2 months ago
config: arm-kismet-CONFIG_CPU_DCACHE_WRITETHROUGH-CONFIG_ARCH_DAVINCI_DA830-0-0 (https://download.01.org/0day-ci/archive/20231104/202311040615.3JpahwtF-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311040615.3JpahwtF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311040615.3JpahwtF-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CPU_DCACHE_WRITETHROUGH when selected by ARCH_DAVINCI_DA830
   
   WARNING: unmet direct dependencies detected for CPU_DCACHE_WRITETHROUGH
     Depends on [n]: (CPU_ARM740T [=n] || CPU_ARM920T [=n] || CPU_ARM922T [=n] || CPU_ARM925T [=n] || CPU_ARM926T [=n] || CPU_ARM940T [=n] || CPU_ARM946E [=n] || CPU_ARM1020 [=n] || CPU_FA526 [=n]) && !CPU_DCACHE_DISABLE [=n]
     Selected by [y]:
     - ARCH_DAVINCI_DA830 [=y] && ARCH_DAVINCI [=y] && (!ARCH_DAVINCI_DMx [=y] || AUTO_ZRELADDR [=y] && ARM_PATCH_PHYS_VIRT [=y]) && !CPU_DCACHE_DISABLE [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
