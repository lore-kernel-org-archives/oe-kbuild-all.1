Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADF717C8D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 11:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811067; cv=none; b=TT3BqMq7add/htjn8qhs62DQ1xNSOLwLX/82ggLntWMqcSRW89nJleBnPCHTpHWbd930GlfDKxIT/RscoNPIozpbuMqNyOj8w4VAlDJIPEf2yTpr4+bKWlZZk6RwXb9X4YrixbGX6uwob5nr72/yewOH9CBzFnzuQGz/GT0Bhx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811067; c=relaxed/simple;
	bh=m1z/SlRv5pUeKl3EkCKGZVMjve9gHmdswPHVVMo/Erk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1ez+HCR/75GvdkILd9YDl5P1rDB2rTwcIuYy3TEruVWJhzc8bjWp1uMFL7bEJNJ0DWTOiUc7RV4S2JAKpVEwX8fh46buYGXxwlAkEURPGjlUtn7OHFxIUl2uT+wAeZm4egBoa9MZ2nLeuYGYHtxPJ7GJjAgbaW8IS3RoW/cSi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IQX7VH5e; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IQX7VH5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716811066; x=1748347066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m1z/SlRv5pUeKl3EkCKGZVMjve9gHmdswPHVVMo/Erk=;
  b=IQX7VH5epaJHXoK1hxuhkk93rq4oBUnFGl3+29xpuVl1Ld8ERmh8npk7
   6bw0d+ZEIr8Shm8S4IyOkrHuIKZyH1ZZuPoqn+e6jTfD8L3Wl1mXxiLid
   FmcRX+V6a1e6fJ/ipoxwhYl9tNvunQHHr8zJZuv1od/zZjF3BNxWyS49f
   pQpQHI6nSXwRkyB7m9+MxObBFQSf34N5XEKLVuSsFzVyZrbss+ZDJstuU
   +e5N1cRk87k+TX9d9U+1i01vdcUemYkFHgEGQqhJdaaWsJ8lzzyzuTymo
   HXrsLz59qM0pLuiHitVaNHjZ6qrarDB/q5YrsQyHn1Qm2PwPf4a+ZTvck
   w==;
X-CSE-ConnectionGUID: uzenwy2xRp6++F8R+r/axg==
X-CSE-MsgGUID: pTvdqFJ1RaeJY5AbOn0Qkg==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="12949127"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="12949127"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 04:57:45 -0700
X-CSE-ConnectionGUID: ZNjkBYVXQIe7OepNN5jicw==
X-CSE-MsgGUID: K3xaqvGBRMq8AQqru0tVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; 
   d="scan'208";a="34826597"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 27 May 2024 04:57:43 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBYyx-000AA1-1X;
	Mon, 27 May 2024 11:57:41 +0000
Date: Mon, 27 May 2024 19:57:14 +0800
From: kernel test robot <lkp@intel.com>
To: Vasileios Amoiridis <vassilisamir@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: [jic23-iio:testing 23/46]
 drivers/iio/pressure/bmp280-core.c:2577:42: warning:
 'bmp280_buffer_setup_ops' defined but not used
Message-ID: <202405271938.XOJ36fxt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   409b6d632f5078f3ae1018b6e43c32f2e12f6736
commit: f611fad414ded443a566fb4e0bb1b201a3f57ee3 [23/46] iio: pressure: bmp280: Add triggered buffer support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240527/202405271938.XOJ36fxt-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240527/202405271938.XOJ36fxt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405271938.XOJ36fxt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iio/pressure/bmp280-core.c:2577:42: warning: 'bmp280_buffer_setup_ops' defined but not used [-Wunused-const-variable=]
    2577 | static const struct iio_buffer_setup_ops bmp280_buffer_setup_ops = {
         |                                          ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bmp280_buffer_setup_ops +2577 drivers/iio/pressure/bmp280-core.c

  2576	
> 2577	static const struct iio_buffer_setup_ops bmp280_buffer_setup_ops = {
  2578		.preenable = bmp280_buffer_preenable,
  2579		.postdisable = bmp280_buffer_postdisable,
  2580	};
  2581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
