Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5DB2D3EF6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753174597; cv=none; b=VoOG94OyFwWo2vF1Q7rU2HlN2QRxcBjgWVMC0qEx6P/G71j5eOZRUsy5w4C3OQa/WvjayEe/Ax858uqAUNgpb2f6J1FQBpeUpoYC6hdY213YvSb93rrXv8qQ1uZl26E2K0QnDNbwraMX7+0MggMnF97+afkd2sfcywTIsWIdP2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753174597; c=relaxed/simple;
	bh=n7GUxQI6ER9wlHaWQtYe+vTBqL8DUM9eAk6/oAER8so=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aKazFSoICV+1vu+rK9TpKcdbMRgDDXjztAZymRxDOsuaS06p3Ei/M5dD6MK6PyPNUjP2gHH8EJQc2KX81uC7nMGdN2ZmiZen20sqUsG4LZlLpJAzPsO446TOeNsBgLCAHGaNcGvIgSqzMjMfvl5Vg2aLqr81JTXDgbZPuN0fhnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fptPy8Rf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fptPy8Rf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753174595; x=1784710595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n7GUxQI6ER9wlHaWQtYe+vTBqL8DUM9eAk6/oAER8so=;
  b=fptPy8RfCB+ABxWZyLaFyy9ltDkT0XXNlGgtS+uXSTdfqt2uNZ0UB6e7
   hxxA0KAXPY75Y3d7EryhPZtMh6K/xtW6P3sgp4zRdS2nNrHs2r8+TYkCg
   dn7gbp2Azi6or3Zo/O9bWn+6DZUcWPB+WEtLWsMqD1BC98oWfJKl8+xPW
   tyMHOQ3yWOULSQQMGY25dwPmHC1ezWl8zcNcHPVGkR+eXRGWmETKanyyr
   GaHTsfe2zX04Mks2duGcjVo7pyTNY8bvteV0P5wocDHPNoEd3cst6kz1J
   MaccJUnEqyiLzeSGQMoQFErfdW9lHzu6ckkPumcAd5eYDLgfUJXJLcqP3
   Q==;
X-CSE-ConnectionGUID: QlAg/VjwTUKwl5UsMbHdLQ==
X-CSE-MsgGUID: R9T9fiRFSHue4cJurxY69A==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55357781"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55357781"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 01:56:34 -0700
X-CSE-ConnectionGUID: 64ADGsFhQDW1EFF5IIYxDw==
X-CSE-MsgGUID: U4iMy9kqQPSU48IrQyEXcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159170291"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 Jul 2025 01:56:34 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue8nX-000HcV-0t;
	Tue, 22 Jul 2025 08:56:31 +0000
Date: Tue, 22 Jul 2025 16:56:20 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] kismet: WARNING: unmet direct
 dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
Message-ID: <202507221627.whuLvNav-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   98170019bf7a4069eb0c41aba1bad66e55c20835
commit: 3aecfb5d583a915dc68f9fb5b5bc7dd643d5016d [9/9] anolis: spi: add support for Phytium SPI
config: x86_64-kismet-CONFIG_SPI_PHYTIUM-CONFIG_SPI_PHYTIUM_PLAT-0-0 (https://download.01.org/0day-ci/archive/20250722/202507221627.whuLvNav-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250722/202507221627.whuLvNav-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221627.whuLvNav-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SPI_PHYTIUM when selected by SPI_PHYTIUM_PLAT
   WARNING: unmet direct dependencies detected for SPI_PHYTIUM
     Depends on [n]: SPI [=y] && SPI_MASTER [=y] && (ARCH_PHYTIUM || COMPILE_TEST [=n])
     Selected by [y]:
     - SPI_PHYTIUM_PLAT [=y] && SPI [=y] && SPI_MASTER [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
