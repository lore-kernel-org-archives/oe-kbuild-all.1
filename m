Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0972D1757D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723377426; cv=none; b=lr9GX396/1qFfRfAqqPIACVPZML60sv2FhyRu1WJND7z7Q8CT+9p+YbOP7KW2Rb7preHTuOpII+mVf8UzFMkOep87n64A5UZ7WRdw9p/d7AIFMWTv1rFL2rESFiHysK3QOmyKxoB/oYwozBFRMoPOIVXEbykJG6lPSEhfmPu3xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723377426; c=relaxed/simple;
	bh=LS9W657H5AWKzLCtR7HzT6mHV6x+mhDy8JQV7rXRbNE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nRRGBkcoiHXNids4knZjMQmDeusu+PS4E9sg/DxaBfG0JvgTZr5Sh/rIOWQmBO99aR6x3Z6EUk/sBUmiS/ME+xfZzM6RtjFyK4fwqw9klvyr7miZI8rSS3J18eA9vKtLis/PpKuAiBXIrBR7PvvwyTc0hb5Z1OBOQsMIR0NZRO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvzZY863; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvzZY863"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723377425; x=1754913425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LS9W657H5AWKzLCtR7HzT6mHV6x+mhDy8JQV7rXRbNE=;
  b=VvzZY863uR4dGI2FaiHNMAMWVB8zF8I1o44KhbYUT213xs0GFNXwG1gW
   e/x5t+BbOonx6XY6JKaMTCZdXqonPjOL2IrTvewk2EbV4TJVzgZ6FoqvM
   NN3zRFux90x7sQVPt1HuP18jP7P/I3sw4yyM+2npDYfqmHT6YopZ20/4U
   qeztl18wGHd5D8WHuSLwBOwXMR0evMG00iaoZDQXCqJvof215CU053kAj
   FataeDIPvFnuYRmdfEzbah8vyT1OrAvpL6uOUbxTwtDOK1ZlpAZFSk7yr
   8Q6fYBlFE2rhJTKYNxf5VPQ8b3f+DXf+ROqPb6PZohLze8cO6eDupy2KP
   Q==;
X-CSE-ConnectionGUID: VpZ9JUyfRDiArrs2+You3A==
X-CSE-MsgGUID: goZDZ71fTFiKvQ0XIS2AMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21469434"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21469434"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 04:57:04 -0700
X-CSE-ConnectionGUID: Plk7yvDCS0OMhc+3c6L1Qw==
X-CSE-MsgGUID: fcuWmN6WRGS+lJDkBqgGGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="62140600"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 11 Aug 2024 04:57:03 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd7C1-000Anx-0D;
	Sun, 11 Aug 2024 11:57:01 +0000
Date: Sun, 11 Aug 2024 19:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Steev Klimaszewski <steev@kali.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [steev:lenovo-x13s-linux-6.10.y 92/104]
 drivers/thermal/imx_thermal.c:376:19: error: incompatible function pointer
 types initializing 'int (*)(struct thermal_zone_device *, const struct
 thermal_trip *, int)' with an expression of type 'int (struct
 thermal_zone_device *, int, int)'
Message-ID: <202408111918.L2zB4M6C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/steev/linux lenovo-x13s-linux-6.10.y
head:   bc327c57c8cf8f309b5edbb8959cc81d8b29daba
commit: 3ce435c79c12d2f413fc10231b8943af12135c69 [92/104] thermal: trip: Pass trip pointer to .set_trip_temp() thermal zone callback
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240811/202408111918.L2zB4M6C-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111918.L2zB4M6C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111918.L2zB4M6C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/thermal/imx_thermal.c:376:19: error: incompatible function pointer types initializing 'int (*)(struct thermal_zone_device *, const struct thermal_trip *, int)' with an expression of type 'int (struct thermal_zone_device *, int, int)' [-Wincompatible-function-pointer-types]
     376 |         .set_trip_temp = imx_set_trip_temp,
         |                          ^~~~~~~~~~~~~~~~~
   1 error generated.


vim +376 drivers/thermal/imx_thermal.c

ca3de46b508090 Shawn Guo             2013-06-24  370  
cbb07bb35de6eb Eduardo Valentin      2014-01-06  371  static struct thermal_zone_device_ops imx_tz_ops = {
ca3de46b508090 Shawn Guo             2013-06-24  372  	.bind = imx_bind,
ca3de46b508090 Shawn Guo             2013-06-24  373  	.unbind = imx_unbind,
ca3de46b508090 Shawn Guo             2013-06-24  374  	.get_temp = imx_get_temp,
f5e50bf4d3ef0a Andrzej Pietrasiewicz 2020-06-29  375  	.change_mode = imx_change_mode,
017e51420cc440 Philipp Zabel         2013-08-01 @376  	.set_trip_temp = imx_set_trip_temp,
ca3de46b508090 Shawn Guo             2013-06-24  377  };
ca3de46b508090 Shawn Guo             2013-06-24  378  

:::::: The code at line 376 was first introduced by commit
:::::: 017e51420cc44098308b00dffd9d4e514ddf40f3 thermal: imx: dynamic passive and SoC specific critical trip points

:::::: TO: Philipp Zabel <p.zabel@pengutronix.de>
:::::: CC: Zhang Rui <rui.zhang@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
