Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D93511C8D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Nov 2023 14:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrndvOKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700319475; x=1731855475;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S5Jo9FjmXPYw+Egh/gd+NOG2+Sql1ua9pW0EiQBmPcU=;
  b=GrndvOKa7YiMF3VwM57TJSOxLh53amqXB5YGCzltHynPclKn5sweGTFw
   Bqh0A98rbddbEPPufxN218kjX4XrKDhr2Udifu6rNEZeleprbYtXztMFr
   Nrv0PIn+FtoJbX8ixhCFZtBL5SHsU8S4jLjY0Khq8xbjoehU5ZNgfrVKE
   WF9v2O2jyLfodoiEcfWoD0wYW/BrNUqILbJf2YBEnnxIy4FBi4G7RKjzv
   33c91SOA04xGWN0UuHOLDe9XZp87r8ibi8wxRbwBmx7x8HcUvPyiZvka8
   HkA1ooO/LktAlI6AYC+msK+GbbPy6Ose31HpTexMfsvQqpUZ2apu5j57y
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="455726923"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="455726923"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2023 06:57:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10898"; a="1097367434"
X-IronPort-AV: E=Sophos;i="6.04,209,1695711600"; 
   d="scan'208";a="1097367434"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 18 Nov 2023 06:57:52 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4MlZ-0003zn-1W;
	Sat, 18 Nov 2023 14:57:49 +0000
Date: Sat, 18 Nov 2023 22:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [kabel:realtek-sfp-work 5/20] kismet: WARNING: unmet direct
 dependencies detected for WATCHDOG_CORE when selected by TURRIS_OMNIA_MCU
Message-ID: <202311182211.jyCNHlUN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kabel/linux.git realtek-sfp-work
head:   a7931b1e7b8bdade3975606bc26446fdccc6a40e
commit: e782cf907540b2d7116ecab2d403041d0eb9451f [5/20] platform: cznic: turris-omnia-mcu: Add support for MCU watchdog
config: alpha-kismet-CONFIG_WATCHDOG_CORE-CONFIG_TURRIS_OMNIA_MCU-0-0 (https://download.01.org/0day-ci/archive/20231118/202311182211.jyCNHlUN-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231118/202311182211.jyCNHlUN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311182211.jyCNHlUN-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for WATCHDOG_CORE when selected by TURRIS_OMNIA_MCU
   
   WARNING: unmet direct dependencies detected for WATCHDOG_CORE
     Depends on [n]: WATCHDOG [=n]
     Selected by [y]:
     - TURRIS_OMNIA_MCU [=y] && CZNIC_PLATFORMS [=y] && (MACH_ARMADA_38X || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
