Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88199138C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Apr 2024 03:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711941545; cv=none; b=dRRKAoOHyqooLlsSkq++nTo2UyP4kz+JHpVb5MlZzmHeG7HtQIxxwGScKdsJLmQokWiwUZJMLwvIm4wFPa+EIBKTNCI5p1Mw8dZcKaKOtybbj38jytStIwzV5XZCs6FzWXUM4bmLbIF6m9q1CCgEsyI0z19lRxBGY/YcW+a5I/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711941545; c=relaxed/simple;
	bh=+c+h4Ii5zkcpHljlXGBPNAz+4lOFZKxYXL007ZmcQd4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S0DiW9ogdieda55Aw90iVzp5P7i7VWzj5rqTkxSKU334yJ/J7JVGAZylkM2d1LSUx3lIPKPCTY98HN59owRR5saAkFzd0a+TJ+zpA76r8UIde6Fr07SWzjjyaqZUoAKs/RPF42pVLcJHO2nj6XtQoI4eYxaI36UrTsLoDAafONc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RX1493Um; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RX1493Um"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711941544; x=1743477544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+c+h4Ii5zkcpHljlXGBPNAz+4lOFZKxYXL007ZmcQd4=;
  b=RX1493UmAlNFIBStlDGfswkwGmDWEjPAn37ZaGIdNW6K5+7xPpptrhEo
   4Ll9XuiuN07LTGyIL6ZmufjfexYhY/esHQxPjZScDfG2sFTPSo57PL7GI
   UiTaKHtEfbqRJ4Nn8i6RA8LCOHwSy1hlt9cQkqZ1EJQSwY5i1P9kIcHdp
   ZqTvByrgZslGP4X6T0W4YerrTP2j78JfOkdAJcdxEj8lDzphHMZvvct06
   UbQIOdow96WEvJbojehkEIc64kGg9S/G0EINLAPbctnAumSjcNJnTdQSk
   wczfCurRzSz798j3UQ0ucssYii35usrddyumqxenk2y8knyCG1yEeQX3V
   g==;
X-CSE-ConnectionGUID: SeVCOckGTtGmuoh7/B813g==
X-CSE-MsgGUID: fmCxdCo5Tb+ybyJwNgfu8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="24512912"
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="24512912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 20:19:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,171,1708416000"; 
   d="scan'208";a="22081589"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Mar 2024 20:19:02 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rr8CJ-0001ci-1y;
	Mon, 01 Apr 2024 03:18:59 +0000
Date: Mon, 1 Apr 2024 11:18:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18518/22010] kismet: WARNING: unmet
 direct dependencies detected for UACCE when selected by CRYPTO_DEV_HISI_QM
Message-ID: <202404011147.PNgq9zF6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6726609c5990ede3a9fdb318d1dc759d03678a1a
commit: c89f49b5f6b23b319f338f7e9e7e9b077ec8f5ff [18518/22010] crypto: hisilicon delete invlaid api and config
config: arm64-kismet-CONFIG_UACCE-CONFIG_CRYPTO_DEV_HISI_QM-0-0 (https://download.01.org/0day-ci/archive/20240401/202404011147.PNgq9zF6-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240401/202404011147.PNgq9zF6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404011147.PNgq9zF6-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for UACCE when selected by CRYPTO_DEV_HISI_QM
   
   WARNING: unmet direct dependencies detected for UACCE
     Depends on [n]: IOMMU_API [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_QM [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && PCI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
