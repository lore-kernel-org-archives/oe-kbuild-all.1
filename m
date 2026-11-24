Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795543036;
	b=ZTv2gs8Me1kobK/4w7dnlnMV+tJxu1yhAKrJjbnUpcVAX27UOQR1yIwCnyE+FThKA+7x
	 xwmUF01VrglUaefSF+NDCKX11DdN99YhIvgcVxt2Xga6dtQpJQkzoFSwYX3jnUlkzL+gc
	 4rMXp32GXOoawP1We+aDBDLz3mo63R8U8878zJ9+K3Y1kOS80BVoWu57EEXPDO+U2p9VP
	 9N1v+vPLRH63H05n4AeR3ngmf1YMa9ReaC/Nqdnaz2oUrzE9vFgzV5DLwJAznE6CnE2w8
	 Um9ZMhqsq26Xo5CJT7k4PpIgUvdd/7LDCow30QGdvK182ie+RJ5ODHd3Dwt5yRCYNJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795543036;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ky87/VzxeJD3u5b7HXmhhGXbXeQgQ90cTEy5fmEumK8=;
	b=WMINHmVNYnOdXBPhfie/iUFWoc0WpXLBoQS91AYBQw7aK1YKBg7p9sHWBDrMqSayKB/K
	 6FUK445S3mhUK2PLqL3/Jxr2xwASyZ/gHhMliZ9ujOu5aWUITtt0YA+o/5WZIKoLet14I
	 Zt77FnZRCNh4YHcxghHrdbWKiPBMSqh3sEovjPlsiuADRWCOiEpP/ZIz+Ewene8veuTXq
	 cvGkaKRPGl7s5bv4veRwxTcG3bGjN3mwCe5yKoEC8h59Ak1HM6FNVBZMZTsKt0dWNNb6V
	 +w2OAxLw4S2xr7IV6ahW+SbR10e9HuVpzfNTY7fko+qqH6sGfos/bxSQqRRI6bTuk3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cn5fJwrI;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BEA2606A327
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 17:57:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BEA2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cn5fJwrI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795543034; x=1827079034;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fI/PW8KDoRbbs33Sd+n/w18PwQb+8meBD/AQ8hT5A9E=;
  b=cn5fJwrIpSsILDQTnHFmFi2K65jaNmO2t/i3mKwJ5aD50YVv8o0Myxtg
   ypZq4/Qt+DpfGfIT6QJ2KziqfJkn6mFeStuQk3/XVe1GAseSGxJecO5Lv
   mnefoIuOmMjMN4+0VPgUoC3d7n0Yv4ZtQNxgXe38SnEgFKFPzGfg9ybgy
   Ia2YkiFu5Wi4FMrXQlUUzJRIMbA6zKJf83UqasQXUNfjdB65zZ1MTnijD
   4u52gstIDmgECT7jU8NPWY68gi8n5QscHxRAIJkzlCgd/GirH4WqDIAe6
   /Ya1ptNNT0it9OVtIJMaJtd50l55c/P81z3FKKpZNoR7SHF6B6v88NtdU
   w==;
X-CSE-ConnectionGUID: YzCGR0UwRbC35+4lTfEB7Q==
X-CSE-MsgGUID: cuDmP/EMQKS8kW/d0DEiqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4310965"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4310965"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 09:57:13 -0800
X-CSE-ConnectionGUID: ifIlFqeLQZGrt2iro3b+5w==
X-CSE-MsgGUID: kduAZoqcThKNa2ZYkqumNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11619158"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 09:57:12 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVulR-00000001Pu6-0VpX;
	Tue, 24 Nov 2026 17:57:09 +0000
Date: Wed, 25 Nov 2026 01:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: Re: [PATCH v1 1/1] iio: core: Split debugfs routines
Message-ID: <20261125014709.jzc52smr-lkp@intel.com>
References: <20261124094502.557175-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124094502.557175-1-andriy.shevchenko@linux.intel.com>

Hi Andy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v7.4-rc4 next-20261123]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/iio-core-Split-debugfs-routines/20261124-104410
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20261124094502.557175-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] iio: core: Split debugfs routines
config: arm-s5pv210_defconfig (https://download.01.org/0day-ci/archive/20261125/20261125014709.jzc52smr-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125014709.jzc52smr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125014709.jzc52smr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/iio/industrialio-event.c:22:
>> drivers/iio/iio_core.h:30:13: warning: 'iio_device_unregister_debugfs' defined but not used [-Wunused-function]
      30 | static void iio_device_unregister_debugfs(struct iio_dev *indio_dev) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iio/iio_core.h:29:13: warning: 'iio_device_register_debugfs' defined but not used [-Wunused-function]
      29 | static void iio_device_register_debugfs(struct iio_dev *indio_dev) {}
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iio_device_unregister_debugfs +30 drivers/iio/iio_core.h

    28	
  > 29	static void iio_device_register_debugfs(struct iio_dev *indio_dev) {}
  > 30	static void iio_device_unregister_debugfs(struct iio_dev *indio_dev) {}
    31	#endif /* CONFIG_DEBUG_FS */
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
