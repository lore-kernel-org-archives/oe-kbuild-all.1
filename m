Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B4A1822E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 13:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719151199; cv=none; b=j4+OMpqTheG1lvjep3JyjwkOaQFatWXUTvCt4ZldJUPjmKiT5uMFmwIUJp01P4PUf2SPcoT0e6uPIiHzhGK+hvTSDIgGjGEfaPP0EeU9nLctc80hkXZNxUKEvLu8lAhhRbmwLIVtM3hPqLtGL+934O0ROSJUhitEqWv3yaocHg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719151199; c=relaxed/simple;
	bh=Kf4/Ea77sE4nNZWbCdcFyjgCnYkUk5HxxzHZYr/efnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZhdIWmcuY8sJb6LvESbvtvZ6rFUahFSb8tGWf8RWImqqzFa2BWk0u7JimydVoX8mDSEQh1ys6G02Nfps/yb91NJtHkjPBGYHfvBKw6ebu08xmBTjPQTOahSkXVVCnoecIHlOWMTDhsj4bVbAlWO8RBgxrN3jie3GB2uL01N0spw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jxLyg+Yu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jxLyg+Yu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719151197; x=1750687197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Kf4/Ea77sE4nNZWbCdcFyjgCnYkUk5HxxzHZYr/efnI=;
  b=jxLyg+YuS/L/FeoCZ8jY6wF5R+x5qrhIQFaSTNmMgE+apyiImhi/g9Md
   MBp1NQN3NWtDoeq8PvCc0RR59z1eWiNFlnwg4cPUZVcPq/Ggwh/4wsn6N
   5tAbOMzLiLeBafP+CloOJeqSD3bWRx6oNXGSyFCZDRhFjM+EG3VMQalNx
   hesF5cQMsJql1+kzAbONTs5BnVTTkfR1w7NQRDh5RDY/CBQb6ywuMfPGR
   /6SGVD3Xr8UcF+6VGhU+/uQ/1g1jwBh0YewiD9sg1tkbvqRK7OGVt4Oea
   V7ekncSj373BPNj8HxgbPZc1DhKgsb4ZuTPyhm6EsyYpRhnfqQFn79ifq
   Q==;
X-CSE-ConnectionGUID: xIinKqb5QqGTRaXVtIxOqg==
X-CSE-MsgGUID: dN+MbMWpRe6LrknGiceGCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="41530477"
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="41530477"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2024 06:59:57 -0700
X-CSE-ConnectionGUID: Qewqd5sHTwiHYp7wKQt75A==
X-CSE-MsgGUID: 51/qOhIrTJGsqMCukIgOdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,260,1712646000"; 
   d="scan'208";a="74264230"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jun 2024 06:59:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLNl4-000AXE-0X;
	Sun, 23 Jun 2024 13:59:54 +0000
Date: Sun, 23 Jun 2024 21:58:57 +0800
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <groeck@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 438/6555]
 drivers/gpu/arm/midgard/mali_kbase_core_linux.c:4181:6-11: No need to set
 .owner here. The core will do it.
Message-ID: <202406232138.hGK1ZVy9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: b303c6455c178a647340cd5e75fddbdf57cc697a [438/6555] CHROMIUM: MALI: Bifrost r13p0 EAC release
config: arm-randconfig-r064-20240623 (https://download.01.org/0day-ci/archive/20240623/202406232138.hGK1ZVy9-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406232138.hGK1ZVy9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/arm/midgard/mali_kbase_core_linux.c:4181:6-11: No need to set .owner here. The core will do it.
>> drivers/gpu/arm/midgard/mali_kbase_core_linux.c:4181:6-11: No need to set .owner here. The core will do it.

vim +4181 drivers/gpu/arm/midgard/mali_kbase_core_linux.c

  4175	
  4176	static struct platform_driver kbase_platform_driver = {
  4177		.probe = kbase_platform_device_probe,
  4178		.remove = kbase_platform_device_remove,
  4179		.driver = {
  4180			   .name = kbase_drv_name,
> 4181			   .owner = THIS_MODULE,
  4182			   .pm = &kbase_pm_ops,
  4183			   .of_match_table = of_match_ptr(kbase_dt_ids),
  4184		},
  4185	};
  4186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
