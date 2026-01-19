Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0A27A13A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jan 2026 02:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768791065; cv=none; b=hMytaDZDKY3zRjz0HpzdFZQZqG8TP93R2BwsPNmiPFvXfC4eYod4QfCzc2/oPilwBCHjLIX7TOxfFlzfq4DtdJAyP6V4T5vYvxcmH72HClUwC34BGOMq7vmfS97IHhNERi3IYtxF6fNenL+ico2NN8Nx2IqUhfFgTwDDxhlu8a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768791065; c=relaxed/simple;
	bh=fbWvM8O0rInAchJ6Ku0TGmMrJoPkiAQKg1scvc5a6Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eSDUqT0o+vm32yqk49gO3T/UDCOXCfre/e69fWByiEC2elfALZ8CktyGhjY5Dxi8PNzwi+3b4o+fFyphDS+G0Lxz0hBcOTP8G0OyYh9wcmH3JHdycvZ6p+Nnr4wUl5dwv9vLtVm+E/7orI0ruZy2UXs1t5BWeru4o9MEbr+fNnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhP8joxo; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhP8joxo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768791064; x=1800327064;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fbWvM8O0rInAchJ6Ku0TGmMrJoPkiAQKg1scvc5a6Xs=;
  b=UhP8joxo4VFaQ1Nsa1PIJGCboiz+lNJ0MmxODgQg11oFRbJhMXTRXQyL
   LiNuo8/CYsuitowy0WAuIrViQTQFmD2h9WHE5H7bZV3I7jwE9QPF6kPZv
   uL8vwoyTx2azHOP/9p4JNZDxHFq0dNdflkNZZnNDgWS7IU4m6zd80qtie
   zHfIWNixSjhS58c53UyWMZrrVTulBDSORUWtd6Qbz9asClF5mQeGx7HOr
   cBRif576GzA4R8tvr5LeanEMwyY2bEKNSF+iTMCB5JL1B6J05ruJCbTOC
   fIGllJqfzV6u2kAhjX1cEpcIOovssBcrLy3kHYFXAw+brdDMt7DJkte6v
   A==;
X-CSE-ConnectionGUID: WWSw0yxsR263j8Puwe/7yg==
X-CSE-MsgGUID: 6vAjsi5xSWOhpzYtewtz2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70048616"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70048616"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 18:51:03 -0800
X-CSE-ConnectionGUID: sqWX7wBKQZuNqXWc+z2XCA==
X-CSE-MsgGUID: 14xkbdduQ++lpjsdTaUn6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="237029682"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2026 18:51:02 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhfM3-00000000NNj-3gfi;
	Mon, 19 Jan 2026 02:50:59 +0000
Date: Mon, 19 Jan 2026 10:50:51 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 7/9] iio: Expand IIO event interface for
 real-world unit handling
Message-ID: <202601191043.HpK6tTda-lkp@intel.com>
References: <6d9baa8d553d03a41fbd97bca0377a7a4779a93e.1768759292.git.marcelo.schmitt1@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d9baa8d553d03a41fbd97bca0377a7a4779a93e.1768759292.git.marcelo.schmitt1@gmail.com>

Hi Marcelo,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on c30e80d68a7afb334fde7147ee0106f25dd58d3a]

url:    https://github.com/intel-lab-lkp/linux/commits/Marcelo-Schmitt/iio-ABI-Drop-unused-in_energy_input/20260119-022321
base:   c30e80d68a7afb334fde7147ee0106f25dd58d3a
patch link:    https://lore.kernel.org/r/6d9baa8d553d03a41fbd97bca0377a7a4779a93e.1768759292.git.marcelo.schmitt1%40gmail.com
patch subject: [RFC PATCH v1 7/9] iio: Expand IIO event interface for real-world unit handling
config: i386-buildonly-randconfig-003-20260119 (https://download.01.org/0day-ci/archive/20260119/202601191043.HpK6tTda-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601191043.HpK6tTda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601191043.HpK6tTda-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/temperature/tmp007.c:422:29: error: initialization of 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  enum iio_event_unit,  int *, int *)' from incompatible pointer type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  int *, int *)' [-Wincompatible-pointer-types]
     422 |         .read_event_value = tmp007_read_thresh,
         |                             ^~~~~~~~~~~~~~~~~~
   drivers/iio/temperature/tmp007.c:422:29: note: (near initialization for 'tmp007_info.read_event_value')
>> drivers/iio/temperature/tmp007.c:423:30: error: initialization of 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  enum iio_event_unit,  int,  int)' from incompatible pointer type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  int,  int)' [-Wincompatible-pointer-types]
     423 |         .write_event_value = tmp007_write_thresh,
         |                              ^~~~~~~~~~~~~~~~~~~
   drivers/iio/temperature/tmp007.c:423:30: note: (near initialization for 'tmp007_info.write_event_value')
--
>> drivers/iio/accel/bmc150-accel-core.c:1160:35: error: initialization of 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  enum iio_event_unit,  int *, int *)' from incompatible pointer type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  int *, int *)' [-Wincompatible-pointer-types]
    1160 |         .read_event_value       = bmc150_accel_read_event,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bmc150-accel-core.c:1160:35: note: (near initialization for 'bmc150_accel_info.read_event_value')
   drivers/iio/accel/bmc150-accel-core.c:1161:35: error: initialization of 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  enum iio_event_unit,  int,  int)' from incompatible pointer type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  int,  int)' [-Wincompatible-pointer-types]
    1161 |         .write_event_value      = bmc150_accel_write_event,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bmc150-accel-core.c:1161:35: note: (near initialization for 'bmc150_accel_info.write_event_value')
   drivers/iio/accel/bmc150-accel-core.c:1170:35: error: initialization of 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  enum iio_event_unit,  int *, int *)' from incompatible pointer type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  int *, int *)' [-Wincompatible-pointer-types]
    1170 |         .read_event_value       = bmc150_accel_read_event,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bmc150-accel-core.c:1170:35: note: (near initialization for 'bmc150_accel_info_fifo.read_event_value')
   drivers/iio/accel/bmc150-accel-core.c:1171:35: error: initialization of 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  enum iio_event_unit,  int,  int)' from incompatible pointer type 'int (*)(struct iio_dev *, const struct iio_chan_spec *, enum iio_event_type,  enum iio_event_direction,  enum iio_event_info,  int,  int)' [-Wincompatible-pointer-types]
    1171 |         .write_event_value      = bmc150_accel_write_event,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/accel/bmc150-accel-core.c:1171:35: note: (near initialization for 'bmc150_accel_info_fifo.write_event_value')

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]


vim +422 drivers/iio/temperature/tmp007.c

948b707df8d249 Manivannan Sadhasivam 2017-01-09  416  
948b707df8d249 Manivannan Sadhasivam 2017-01-09  417  static const struct iio_info tmp007_info = {
948b707df8d249 Manivannan Sadhasivam 2017-01-09  418  	.read_raw = tmp007_read_raw,
948b707df8d249 Manivannan Sadhasivam 2017-01-09  419  	.write_raw = tmp007_write_raw,
7c5bc7e87cc43a Manivannan Sadhasivam 2017-01-23  420  	.read_event_config = tmp007_read_event_config,
7c5bc7e87cc43a Manivannan Sadhasivam 2017-01-23  421  	.write_event_config = tmp007_write_event_config,
7c5bc7e87cc43a Manivannan Sadhasivam 2017-01-23 @422  	.read_event_value = tmp007_read_thresh,
7c5bc7e87cc43a Manivannan Sadhasivam 2017-01-23 @423  	.write_event_value = tmp007_write_thresh,
948b707df8d249 Manivannan Sadhasivam 2017-01-09  424  	.attrs = &tmp007_attribute_group,
948b707df8d249 Manivannan Sadhasivam 2017-01-09  425  };
948b707df8d249 Manivannan Sadhasivam 2017-01-09  426  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
