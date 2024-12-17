Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C659613D25E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 04:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734409777; cv=none; b=qrThoqhl7m39jZVDJ5M4q4kDRAwPhLHQ7MH/Sz4akCiRKkIUaCnMlIoiDJn1Xl68diUJDOCijgR2+5pm9AUkKTq1Z4TO+e05O76Ibfkazh4zB5I0VJMwNwrJYPa/UmFbbxXGhB+z85ayXWC60clYSUIdouTrzqRtdE7ncPQojuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734409777; c=relaxed/simple;
	bh=mzY1qN/iXKCF68+x4GSWeQIt8GkGZerZCuuXImnGAkU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YfomHGZcHOYx1WDECfDj6DRR+n3Q8A6tfCaSfMGIMvvzZLflwB79i24Q5j5/srQln6Tw5jpScMYghY6LQPIQMs7Ct6XROK9FRa2lZyaO1pZkNjIhRP3W9hRtCMqcDhc1Qlde6MrO92RVPWcTF2MJRokUqGXkGagpzVoeaPHGOak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nlSfkGoX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nlSfkGoX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734409776; x=1765945776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mzY1qN/iXKCF68+x4GSWeQIt8GkGZerZCuuXImnGAkU=;
  b=nlSfkGoXzXwLU7a1VsQvh5NPYQ2W2GWNkTigvun78c5UdOvxDSQ9lUNX
   e+E+QX0QlSBvC8rJX89V6CvyeIUo95xrSufbSYoU9mhjr7+DDnPAbVB21
   y20y1KV85+lrQ40lQ/DrmlAXkE3pXc5pUMtP92bxmFOoY9IYYLMwXAkI9
   fbqFbnG8epfejrCZBaYytPr09VGMph4EqErdGiaN+0ry+Q4cCIBzUJpZj
   kjLH9AZ0QL6wIa08PzIOu0a1XGHxakM5AjeYMJQNYBR4W1bj4M8Aw1Mrw
   foFlZhVEBdQQYn3006wyOALy3Je8ZWnk4I8Ys+tBD5U7uFYUX5EFUrhVB
   g==;
X-CSE-ConnectionGUID: pte+08LoRhSrUWWFYK770w==
X-CSE-MsgGUID: NhiuW4B5SCy8vfHTr+p4Dw==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="45430645"
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="45430645"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 20:29:35 -0800
X-CSE-ConnectionGUID: jxJHQIDxSbKXE1eOuv29ig==
X-CSE-MsgGUID: obSYN4PcQtmB+6bhKiZi0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,240,1728975600"; 
   d="scan'208";a="97661905"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2024 20:29:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNPD9-000EiK-3C;
	Tue, 17 Dec 2024 04:29:31 +0000
Date: Tue, 17 Dec 2024 12:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Weili Qian <qianweili@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1640/1640] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_DRBG_CTR when selected by
 CRYPTO_DEV_HISI_TRNG
Message-ID: <202412171218.lNxqN817-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   6a6a6975db65b9cd2f1ac3466f652ea1c8ee2d61
commit: e623afb45e58ded6b45cc4f0ac6c19b3736c96f9 [1640/1640] crypto: hisilicon/trng - support to obtain random numbers from soft algorithm
config: arm64-kismet-CONFIG_CRYPTO_DRBG_CTR-CONFIG_CRYPTO_DEV_HISI_TRNG-0-0 (https://download.01.org/0day-ci/archive/20241217/202412171218.lNxqN817-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241217/202412171218.lNxqN817-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412171218.lNxqN817-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_DRBG_CTR when selected by CRYPTO_DEV_HISI_TRNG
   WARNING: unmet direct dependencies detected for CRYPTO_DRBG_CTR
     Depends on [n]: CRYPTO [=y] && CRYPTO_DRBG_MENU [=n]
     Selected by [y]:
     - CRYPTO_DEV_HISI_TRNG [=y] && CRYPTO [=y] && CRYPTO_HW [=y] && ARM64 [=y] && ACPI [=y]
   
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
     Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
     Selected by [y]:
     - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]
   
   WARNING: unmet direct dependencies detected for HALTPOLL_CPUIDLE
     Depends on [n]: CPU_IDLE [=n] && ARCH_CPUIDLE_HALTPOLL [=y] && ARCH_HAS_OPTIMIZED_POLL [=y]
     Selected by [y]:
     - ARM64 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
