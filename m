Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1291E0E14
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 01:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779326274; cv=none; b=gatL7F338D9t1WWWaMZr/UrSEAKwtvXRn1ii9UbGGdsMTdj74ZZJiJVtZyxZcZoKwGStO69Sk09sBxed6E+nxWkoVJkacc7qk/823CuQ/qA8zrwSZFoR+ptuzmwQ9Ep4anVKoD4MrkR0Ec2/we4r/DkGFbKi8h6aF9eXiC9h9a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779326274; c=relaxed/simple;
	bh=jzWXndLOgQcMvLGjhV08GH2u7ciKL93mPYDx4EbckH4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a7b7DxkzKFJXm6vRhFiMu4bvPugaZPjm4aLC3A2LHx1ru3XsVGmmYadVJKe3eHkyU+llYyX7atWdpuGiaMS3dgW24S36fs8FTzcy49j4nAnJthRvJDPzXXj9vwDCyVy1cr+8E7J6paf9hUqQB6S2x6bF4OEZgF3co8xqpAj2MwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nxfKxLEl; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nxfKxLEl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779326272; x=1810862272;
  h=date:from:to:cc:subject:message-id;
  bh=jzWXndLOgQcMvLGjhV08GH2u7ciKL93mPYDx4EbckH4=;
  b=nxfKxLEltXT84iqtUYRAd00f1uabjgerYt0RWz2EDZ0DuEsf993KnXra
   KfAfZqGBH5HzFf3kgLG4OTfOeFTYs7VVOfH1KSlAXAgLPo5dXA0FS0KG3
   2zm6CVmd4Hwy9/XXqUUlWEHMbaCROIfJk0AvG825J0UbZDxlXQLrMHgTY
   H1XsO7biJ/ehcWVRN3c5fHYIh7a+NTVT0kF5wHPvarYqJ5NvOTlxbyTO9
   eLHwiD3UaXg2GfeQ4GBFPfLQSrFkp+JT0GO2WprnqkokO2c9hF4chgz+l
   j78LUMGFlMFkUJ9bAhsxgRwqxL0tj14dlXYPqjsQz5JDN1M3yf3sJ8Lsm
   g==;
X-CSE-ConnectionGUID: 58wkBWGQQpOSqMXgpyenpA==
X-CSE-MsgGUID: yJe5dZgzSnG8tkKUwAxniw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80091100"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80091100"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 18:17:51 -0700
X-CSE-ConnectionGUID: yjieJygYSYuiqlkPFzg05A==
X-CSE-MsgGUID: yWWErOQORvWE8cXfQVuhSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="244678244"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 20 May 2026 18:17:48 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPs2B-0000000048x-2cwh;
	Thu, 21 May 2026 01:17:14 +0000
Date: Thu, 21 May 2026 09:12:50 +0800
From: kernel test robot <lkp@intel.com>
To: "David Lechner (TI)" <dlechner@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dlech:b4/iio-adc-ti-ads122c14 3/4]
 ti-ads112c14.c:(.text.ads112c14_populate_tables+0x1c4): undefined reference
 to `__aeabi_uldivmod'
Message-ID: <202605210925.5Sl6w1ff-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/dlech/linux b4/iio-adc-ti-ads122c14
head:   4a3600a0052aa9fbf058af069a2b0282a8922432
commit: b5b1b66752a90560368bb9ac27e8aadf2b598362 [3/4] iio: adc: ti-ads112c14: implement gain on internal short SYS_MON channel
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260521/202605210925.5Sl6w1ff-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210925.5Sl6w1ff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210925.5Sl6w1ff-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/iio/adc/ti-ads112c14.o: in function `ads112c14_populate_tables':
>> ti-ads112c14.c:(.text.ads112c14_populate_tables+0x1c4): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: sound/soc/tegra/tegra210_mixer.o: in function `tegra210_mixer_configure_gain':
   tegra210_mixer.c:(.text.tegra210_mixer_configure_gain+0x364): undefined reference to `__aeabi_uldivmod'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
