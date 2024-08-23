Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3F68493
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 04:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724386520; cv=none; b=ra1u2PVzayLnx7KAyzXfCBnmea0S1kh9Zt4btgW5EwxvFpM/7G/keeGs/JzsKVyaGutBdE75jb/3VDAxYhQeAO3xenHFPo9c6mtepTTRJk/0ANuRqYjq4p6goHM+3t5s82x4NpNI4b26IIi4eWPjJwWhs6pddBQRjlrTocsIGMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724386520; c=relaxed/simple;
	bh=z14BCafyEoQRhXoildKxbGbyHO24Stp9RY7ngaTTx/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kH45b21AbAZMh+uRnli1CTn9UkhbMehZX5mEQg2Ivx1c9aida93VAec7+dW7Cdb44AniqJdDfNfGJSn1to/z9pegXTACWYQGzx200Hf3fnyCICuYcqtdUgIvw7RX5spXkYrlIe0OYLNWau45UKU+kVENlcHQylRZ/j+vtTY8oV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Os4iA84z; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Os4iA84z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724386519; x=1755922519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z14BCafyEoQRhXoildKxbGbyHO24Stp9RY7ngaTTx/Q=;
  b=Os4iA84zRzaUY2Gt8JAyH5fRwtAqUpUc1y1hYXbyyR0gWz14t9aGk2VS
   3MrwdrB2uk7yInEAbf6UiZgo9xfSjjyltGCGiTkIQ3+2IwtBC0S7YMl5D
   FUg2sRzAMcvMjfSdfiXjd0A/2a++0yT3ZfMErT4u07P8HBo4GsWvOeE6h
   mdwJCUgso32X+8Pdajqp/LJxO8Ipl8AZNkE0fwk7gVbb63nf42hSLy6sr
   hvkSI3xiFmN6vTWcqjJxCO9rtUvOiasazxg0SJj5vx2KeT/VYzdREmUm2
   Jo6LlMuIsOeYlyJwJ/awwyvawgE6qVNtppK9+Q7tW3Ad7MPe5sg6UAq0I
   A==;
X-CSE-ConnectionGUID: UeWB91M8SK6KFV0WzOMejA==
X-CSE-MsgGUID: 4jl6KnwlT/KhFRq7PGHOBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23010794"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="23010794"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:15:18 -0700
X-CSE-ConnectionGUID: uHFR80Z9QiSiJJKrhORg5A==
X-CSE-MsgGUID: LaRDbhoVTdWAit18TFeE/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="92456505"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Aug 2024 21:15:17 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shLhj-000DTs-0d;
	Fri, 23 Aug 2024 04:15:15 +0000
Date: Fri, 23 Aug 2024 12:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:net-encx24j600-regmap-locking 2/2]
 drivers/net/ethernet/microchip/encx24j600.c:178:30: error: 'struct
 encx24j600_context' has no member named 'mutex'
Message-ID: <202408231248.kPjVk1aw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git net-encx24j600-regmap-locking
head:   f0468e3490ad91b1ed822abd6e641017305c9024
commit: f0468e3490ad91b1ed822abd6e641017305c9024 [2/2] net: encx24j600: Use standard regmap locking
config: arm-randconfig-001-20240823 (https://download.01.org/0day-ci/archive/20240823/202408231248.kPjVk1aw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231248.kPjVk1aw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408231248.kPjVk1aw-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/net/ethernet/microchip/encx24j600.c: In function 'encx24j600_raw_read':
>> drivers/net/ethernet/microchip/encx24j600.c:178:30: error: 'struct encx24j600_context' has no member named 'mutex'
     178 |         mutex_lock(&priv->ctx.mutex);
         |                              ^
   drivers/net/ethernet/microchip/encx24j600.c:180:32: error: 'struct encx24j600_context' has no member named 'mutex'
     180 |         mutex_unlock(&priv->ctx.mutex);
         |                                ^
   drivers/net/ethernet/microchip/encx24j600.c: In function 'encx24j600_raw_write':
   drivers/net/ethernet/microchip/encx24j600.c:190:30: error: 'struct encx24j600_context' has no member named 'mutex'
     190 |         mutex_lock(&priv->ctx.mutex);
         |                              ^
   drivers/net/ethernet/microchip/encx24j600.c:192:32: error: 'struct encx24j600_context' has no member named 'mutex'
     192 |         mutex_unlock(&priv->ctx.mutex);
         |                                ^


vim +178 drivers/net/ethernet/microchip/encx24j600.c

d70e53262f5cfc Jon Ringle        2015-10-06  172  
d70e53262f5cfc Jon Ringle        2015-10-06  173  static int encx24j600_raw_read(struct encx24j600_priv *priv, u8 reg, u8 *data,
d70e53262f5cfc Jon Ringle        2015-10-06  174  			       size_t count)
d70e53262f5cfc Jon Ringle        2015-10-06  175  {
d70e53262f5cfc Jon Ringle        2015-10-06  176  	int ret;
b822ee6c5e5ba1 Jeroen De Wachter 2016-12-12  177  
d70e53262f5cfc Jon Ringle        2015-10-06 @178  	mutex_lock(&priv->ctx.mutex);
d70e53262f5cfc Jon Ringle        2015-10-06  179  	ret = regmap_encx24j600_spi_read(&priv->ctx, reg, data, count);
d70e53262f5cfc Jon Ringle        2015-10-06  180  	mutex_unlock(&priv->ctx.mutex);
d70e53262f5cfc Jon Ringle        2015-10-06  181  
d70e53262f5cfc Jon Ringle        2015-10-06  182  	return ret;
d70e53262f5cfc Jon Ringle        2015-10-06  183  }
d70e53262f5cfc Jon Ringle        2015-10-06  184  

:::::: The code at line 178 was first introduced by commit
:::::: d70e53262f5cfc0b88a211ef9cbd1ca5256f4a6b net: Microchip encx24j600 driver

:::::: TO: Jon Ringle <jringle@gridpoint.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
