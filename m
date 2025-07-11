Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA31DDA1E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 17:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752254038; cv=none; b=at07LkAdEvQ+9Q25uH60lY4RoOkpGQ8T+xxNz9COn5NRVGf5ehWHyk6DRCouFMwoynwNe2sxeqozGKpOYczs13wuUw6V13ctXtaUlbWIjh9jJG0/gYBBj/YJgEgjl0MUNN0ffat4QPImIgV2Mlxf29jc3mj6wpWVendRqfjS/80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752254038; c=relaxed/simple;
	bh=6tf+lj6wIf/SDjac7MA4xKlfPryCzg6htxY5hBTwGAg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e63UFoxjC+l3BqDKaH13VdFoAeS65Z5LU3S5pDhikRxjx74+/CrxWv6MbkS+O6+DADWSt/OyLg0YRh2zkJWSfjYOJeuF4/Ev8Qx5v0UlvjgRHecgasUExHLy0l4BOqgJPOkcscS7Gna88zz0kpkffzzKekJj8sX+Uq6TGmO/K3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ru9xmSPc; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ru9xmSPc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752254036; x=1783790036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tf+lj6wIf/SDjac7MA4xKlfPryCzg6htxY5hBTwGAg=;
  b=Ru9xmSPc3crgh+6h+patWN3dlg1/X58seOsoYORXWkp6d3XW1isqIvqV
   KiXcg5SC5yZxCLzBZApD/StcJ0ColxZWwJ+be629Qc2fNzt3NthiRsrq6
   spwZ9Vm56rwIWwGR96UJktePdXD7+ZfBNNCFBFHQePUg2akMHwFRvnccQ
   7vBGW8pEUkNVaDE/nwOhPUIPXdANgbdZ+XCnMMxnT6SUFr35MVsTTTZbr
   Tf7xSir0+0aX5lldezgmV8hbCGUc9SaNMWhr7IClFqd4moXawBmvxVnQR
   Di9kLdwa1Sr/WDVq4D/OWms2EEDuunQ5+dQTbOPXpLmTet7A0drCWIKNn
   Q==;
X-CSE-ConnectionGUID: 94S5Yt+bRDOExgZ6KmfmXQ==
X-CSE-MsgGUID: ux0exMoxSx+/mPOTJG/17g==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="54271626"
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="54271626"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 10:13:56 -0700
X-CSE-ConnectionGUID: aJM/mnHATMuGPDpvc4MfEA==
X-CSE-MsgGUID: ir1aH5pfQK2hKe4P8HPh+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,304,1744095600"; 
   d="scan'208";a="160750387"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jul 2025 10:13:55 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaHJo-0006b3-1y;
	Fri, 11 Jul 2025 17:13:52 +0000
Date: Sat, 12 Jul 2025 01:13:24 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-6.16.0-rc5 53/77] ld.lld: error: undefined
 symbol: psci_cpu_suspend_enter
Message-ID: <202507120153.bxl16pLr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-6.16.0-rc5
head:   8a7f181d5501fa73b17dcb76340908f033b61b88
commit: e5fb9bee4b0bcb2f1182c04501be2cf254666046 [53/77] firmware/psci: Allow specifying an S2RAM state through CPU_SUSPEND
config: arm64-randconfig-004-20250711 (https://download.01.org/0day-ci/archive/20250712/202507120153.bxl16pLr-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 01c97b4953e87ae455bd4c41e3de3f0f0f29c61c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507120153.bxl16pLr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507120153.bxl16pLr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: psci_cpu_suspend_enter
   >>> referenced by psci.c
   >>>               drivers/firmware/psci/psci.o:(psci_cpu_suspend_s2ram_enter) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
