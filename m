Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F1223B601
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 09:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152014; cv=none; b=uyv6IoxThZ6tTFdaL65PzIvq0FcDl3manoRp4587fy3lcNa2JJ9fob6qxX8Q8zTnN99A9VTXX1ZNeOXDhQ6kB6XCQV3VV7dj95gWuXFu94o97ocbf7bmIYtO3wHHRUvktT9oIQ/8T0c+K0sso4eqxLifnuis78wNBcY/93EFMPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152014; c=relaxed/simple;
	bh=kkmHy0VPqAMAAj2DjkK6S2NnbboMhfKxmCg6FCtVCNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MORWTd9VXUIih09am9YOl0DrgWsgAYlwTLUZtpUTv+U7U5VIJCfQZ3ka2m4qwgexXdieqLf/ZTVj5YLLxwk1XCVf1hkoa0H6gPHfivgyqbqH/Pkjyraa/TNOE3WRnJ1v1ihrTRJsWYZbazs6bPpbyniZoM3fEJhcZ88Inss4yDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ed3HoWnd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ed3HoWnd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750152012; x=1781688012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kkmHy0VPqAMAAj2DjkK6S2NnbboMhfKxmCg6FCtVCNc=;
  b=ed3HoWndGof09XbxgFB02hf+YB2Bd6zVj/cijMMbFxftsuw6CWtePXyh
   6GG4fL2fntT9zev8Tx/NYPiYA+/oLougFzodPNn9jd8M8/5R/cxKPrrlu
   /gfLTsuz4kgKZWvjj1r7gXD1p/7ZRalBHIQg5WeoKsGOf7Fm6jaGBHCX/
   exvwfB0pDUnDQzAGosJ894midkqV2dKi5kYLUu+az4pDd0qKeRAMv2OPg
   cbJg+1JXP8NRgV3UwgFKawDcBCb5sE+0BQzBsny472fL2wRkG+2rrH0qg
   6dB7IqnvQtOJNZLOvJl8QxWa4I8H41ittvmFGEfEBp4uvZQWtoAPccoaa
   g==;
X-CSE-ConnectionGUID: 07M1sD8KQg67xuA0iiUlUQ==
X-CSE-MsgGUID: nVT3PMSSSQCMX06ZAyxdYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="39925264"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="39925264"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 02:20:11 -0700
X-CSE-ConnectionGUID: aCTn1EGtTQ6J4msafUsjnw==
X-CSE-MsgGUID: ey+kNNqrQ66dD/dXx+d8yQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="149613220"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jun 2025 02:20:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRSUB-000Fov-2j;
	Tue, 17 Jun 2025 09:20:07 +0000
Date: Tue, 17 Jun 2025 17:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yushan Wang <wangyushan12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2402/2402]
 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c:346:29: sparse: sparse: symbol
 'hisi_noc_pmu_ids' was not declared. Should it be static?
Message-ID: <202506171713.Ayyiweme-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   852df0842f6ca5e0b4808eb4b1368aed4b492917
commit: 8c762db2e0376bd2f409e98db4c32990e431e1a6 [2402/2402] drivers/perf: hisi: Add support for HiSilicon NoC PMU
config: arm64-randconfig-r133-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171713.Ayyiweme-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171713.Ayyiweme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171713.Ayyiweme-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/hisilicon/hisi_uncore_noc_pmu.c:346:29: sparse: sparse: symbol 'hisi_noc_pmu_ids' was not declared. Should it be static?

vim +/hisi_noc_pmu_ids +346 drivers/perf/hisilicon/hisi_uncore_noc_pmu.c

   345	
 > 346	const struct acpi_device_id hisi_noc_pmu_ids[] = {
   347		{ "HISI04E0", },
   348		{ }
   349	};
   350	MODULE_DEVICE_TABLE(acpi, hisi_noc_pmu_ids);
   351	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
