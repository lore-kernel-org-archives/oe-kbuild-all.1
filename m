Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8D621E3C8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Oct 2024 00:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729037703; cv=none; b=DZPmEoVxK4UG7g90MhNBlfR0jueXIjcUr+HbCd4RcjY/w/dFg57ScDiG9GVwYyQyHI0f80Clb842jxUwg0TeYrMA1iWwPsSBtKVIIaORKnWSavaw1QrEMiW1tGDamqc5EbAqDl+bLSHi9wQYariCIFReU0Wt66ck/mdPykdR0/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729037703; c=relaxed/simple;
	bh=FFPPyRzCAFspIHvciQjhcfWr+FjfPBKAS1nXeloOHE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gnewvjP3x46gGZZX9+wGFiDaoSwjTnJkrzbRdUlyKp4UBDKZYLPxvBKwNzz/KCpeFypnKnfZz9ugIYbWKvsHGyRGyWUFdvmXsvcMn8OyXSn8J+vY/BATmB4p9iGF51GA6xQVlXISt+kF8OPKD6r6ACCHJTNydIWLelikR3EeU2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BclhsrYc; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BclhsrYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729037703; x=1760573703;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFPPyRzCAFspIHvciQjhcfWr+FjfPBKAS1nXeloOHE0=;
  b=BclhsrYc98ixYUetRFmCScsQewa4iMXHUR/dMFNX6OeA3dr1SW2jKohk
   1u2xxAjgRZPyYAzcUQRvYtWToP14HIjKjI6ve2kBd7W5tR0hL/TwYoHKo
   m2Xe2KejG94Up6l64JLks9YUppqZFmNKAHJzSh2rvbSnfSpl4R19jwDY7
   HRcNIFp7PM5m2SLB1mrydHIIS4pTtMX7BR0He8sQTkyOibPhFNfyoJRzR
   zVSCkGhtgImztMowW0gUqzOE862E5io+IawfvT79khY4dHD/vzy5De8vt
   hpW/4cnW8or+SR2VBOrg/5l5iRXRbSpaY2JGw0Se+fm2SCIHXTNJAhZWQ
   g==;
X-CSE-ConnectionGUID: vNI8jEGuReOG+Eq1CkEc7g==
X-CSE-MsgGUID: heADRf28QPev8Z1Y8agxyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51002295"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51002295"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 17:15:02 -0700
X-CSE-ConnectionGUID: gtl2h5FgTniLsp736839PQ==
X-CSE-MsgGUID: g9ir352qS5mVbzkX1cuyWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,206,1725346800"; 
   d="scan'208";a="115502950"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Oct 2024 17:15:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0rgo-000K5L-1w;
	Wed, 16 Oct 2024 00:14:58 +0000
Date: Wed, 16 Oct 2024 08:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 2676/4439]
 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c:27:34: sparse: sparse: symbol
 's6e3ha8_supplies' was not declared. Should it be static?
Message-ID: <202410160810.0jaNgxB2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b852e1e7a0389ed6168ef1d38eb0bad71a6b11e8
commit: 779679d3c1640d8f45c75b1e15831180ab2712e2 [2676/4439] drm/panel: Add support for S6E3HA8 panel driver
config: openrisc-randconfig-r111-20241015 (https://download.01.org/0day-ci/archive/20241016/202410160810.0jaNgxB2-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241016/202410160810.0jaNgxB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410160810.0jaNgxB2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c:27:34: sparse: sparse: symbol 's6e3ha8_supplies' was not declared. Should it be static?

vim +/s6e3ha8_supplies +27 drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c

    26	
  > 27	const struct regulator_bulk_data s6e3ha8_supplies[] = {
    28		{ .supply = "vdd3" },
    29		{ .supply = "vci" },
    30		{ .supply = "vddr" },
    31	};
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
