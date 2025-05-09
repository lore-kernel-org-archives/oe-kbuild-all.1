Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEAC73477
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 May 2025 09:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746782152; cv=none; b=AoZQSbcZASxfa8TDdXakfVbLGV+Hg6TekFcWKAoV4VzSkTGrb0GcaDUBhwbn7knz96/H2XsE/Gj2BrguGXo2+pw3jnYY6/g56ZZIU4p9XGVju7ANnH406u+yeLXWkeg4calB3mXLAP1+5K3fNDJJOlFJimEPa7KJ57P9Jk3Nes8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746782152; c=relaxed/simple;
	bh=xkhbMuuiGyCHHudI/lxUj/nPBLoknRh3uBZAX2RiQrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ccvkanhrM0kgmyG0Va8ZRSAszfiosVrvK5PW0BQBDgoM4IEJwuBBdjXK+CIQ2jSMDi1nBldhLirdYqskvAZX3RLj1evwHIr6jDkPxPW3zFg4xhyE8IgZVQPcWmDLal3/TPiigH+6cJZRZcsXuTFRMimpBhzhqeKiPM+XlrMnYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GYZJrEJe; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GYZJrEJe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746782151; x=1778318151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkhbMuuiGyCHHudI/lxUj/nPBLoknRh3uBZAX2RiQrg=;
  b=GYZJrEJeIPWPKz5EX4CUxiwp4Qt5GfVgYTR5DvCbFzWD2E60sGe1qISG
   YntwKrDi5m21Cu+cQE64xE0c4jDTSocopdUNaEsN/r06EAsatUOLn5Vqy
   YaKGiDTw5er2DxxHOiPM2M9BGL788U3E65yNZz8T8tGqpnX8RKeq0N7Dl
   WWnceROtq/OFsexA7DGZIFCMGVH1CoScIfDjJ3gL1IsOkbV05BxgEjtnO
   5JrWgmpDeHdnutajk4vz5o4x/60WoQc9Klloadjg+7x/LtCxFK7Y5YtD1
   dANjwa4W5RsEPydpj2Fyks6meE2vSbJqE09A9tef87lT8dgPafj+bgUjo
   g==;
X-CSE-ConnectionGUID: 5tU5UnPUQKOTpgIWI3QeRg==
X-CSE-MsgGUID: T/Xt7pphT3+HddwEnAfZXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48470733"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48470733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 02:15:51 -0700
X-CSE-ConnectionGUID: bGM2i4EoSJG8oSsOZdflAw==
X-CSE-MsgGUID: Lf4qlP7MTDmPbpWQxC+dvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="159860242"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2025 02:15:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDJpb-000Br5-1B;
	Fri, 09 May 2025 09:15:47 +0000
Date: Fri, 9 May 2025 17:15:31 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 11/11] kismet: WARNING: unmet direct
 dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
Message-ID: <202505091746.dd84qpys-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   1c2d70f8f169526119c3724bf454b1e7cfd65a16
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [11/11] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20250509/202505091746.dd84qpys-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250509/202505091746.dd84qpys-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505091746.dd84qpys-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
