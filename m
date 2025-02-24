Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586981DE3AD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 22:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740434993; cv=none; b=dUi8YyB0Sc98CzV7X2fo0O3wlbdrUtRYHb5GVGQuioSyGmxUz1GvhjWh5UIidNE0AuMhE+XegPSJ7AfuEN95iNkr9/G/t7Zm56/mWfF/4jSXGdVWVN6lb/wBVzHHC72UCKMw1YXLZQ7kbbayrE7cq+PVhoXODHx079gRbaMef6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740434993; c=relaxed/simple;
	bh=qf6uLmcWQFS1fiyy3bHSjqGFW8Timz2OTcjPPxvsobU=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RPvoTX9KL2XRObkaBZb/E17KteYd5b4MXVEUSOtEX0X2hCubWiO0+zZefm7sc7439U+YLRaLivY/VouHxx2qCHgDhtkF1oyssenSyrahZW/D5VkVLWpb7cLYyGpj4AdWLo9Z7FUAWF/pY8xjVWRgHxpt7vgdAaHBGHWZY5S8kAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n4r8T9uC; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n4r8T9uC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740434991; x=1771970991;
  h=date:from:cc:subject:message-id:mime-version;
  bh=qf6uLmcWQFS1fiyy3bHSjqGFW8Timz2OTcjPPxvsobU=;
  b=n4r8T9uCbstqzXTV3OsBcqUuh2Xw549GpuLEwah8bfETXXlNlrMhZ9uK
   jCOYUVn8ZgwnZGPYSVHDda0zLk2yyEBHQCR/utO6IRozt870uTzgyg4C9
   RVhD7jbyNdp7T4Cat4DQoFA4W9QjDdI+4XWv7gLXnq8Se+ufHhGt0UADu
   xJDbh39s+qQt+bE0cw6fA/nnO75pez7yHsDh8rnfzJblnI6fRiJ3mltYX
   CbXWd9DQPKGQVc4L3jp6l0nNggv5VzHPh1QFafRK1haPvuq3HeCkn1QTG
   4J+m7Ah95sSJDduV0uSisEpzxVr3np4apl4iNFXFZrrJQrBRolmW6f5Py
   g==;
X-CSE-ConnectionGUID: xDc3JQYdSZ+qjAkWe3KYTA==
X-CSE-MsgGUID: xRZVjQ9TRG+B4bR1jA/EgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44040642"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="44040642"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 14:09:50 -0800
X-CSE-ConnectionGUID: 025B8ThuSHids4VqAumQjw==
X-CSE-MsgGUID: IvvWN650RhGBQRbvskpltw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="116204904"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Feb 2025 14:09:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmge3-0009No-0L
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 22:09:47 +0000
Date: Tue, 25 Feb 2025 06:09:41 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1]
 drivers/net/ethernet/mellanox/mlxsw/core.c:754:23: warning: variable
 'mlxsw_driver' set but not used
Message-ID: <202502250646.FYpXhd7n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 8122e08b1d876b9af605db5ad351961c5ea276ed [1/1] Allow Mellanox switch devices to be configured if only I2C bus is set
config: sparc64-randconfig-001-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250646.FYpXhd7n-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250225/202502250646.FYpXhd7n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502250646.FYpXhd7n-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/net/ethernet/mellanox/mlxsw/core.c: In function 'mlxsw_core_driver_put':
>> drivers/net/ethernet/mellanox/mlxsw/core.c:754:23: warning: variable 'mlxsw_driver' set but not used [-Wunused-but-set-variable]
     struct mlxsw_driver *mlxsw_driver;
                          ^~~~~~~~~~~~


vim +/mlxsw_driver +754 drivers/net/ethernet/mellanox/mlxsw/core.c

93c1edb27f9e7e Jiri Pirko 2015-07-29  751  
93c1edb27f9e7e Jiri Pirko 2015-07-29  752  static void mlxsw_core_driver_put(const char *kind)
93c1edb27f9e7e Jiri Pirko 2015-07-29  753  {
93c1edb27f9e7e Jiri Pirko 2015-07-29 @754  	struct mlxsw_driver *mlxsw_driver;
93c1edb27f9e7e Jiri Pirko 2015-07-29  755  
93c1edb27f9e7e Jiri Pirko 2015-07-29  756  	spin_lock(&mlxsw_core_driver_list_lock);
93c1edb27f9e7e Jiri Pirko 2015-07-29  757  	mlxsw_driver = __driver_find(kind);
93c1edb27f9e7e Jiri Pirko 2015-07-29  758  	spin_unlock(&mlxsw_core_driver_list_lock);
93c1edb27f9e7e Jiri Pirko 2015-07-29  759  }
93c1edb27f9e7e Jiri Pirko 2015-07-29  760  

:::::: The code at line 754 was first introduced by commit
:::::: 93c1edb27f9e7ef7f276b91763c93242bbda71cb mlxsw: Introduce Mellanox switch driver core

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
