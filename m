Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F69781F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jun 2024 04:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719118304; cv=none; b=MoZEk7Nwjo+rcJ7nKrvTPR6urI8+2dCzO0wtnbmUj+rfIRxeXCC910nc7XB05ftBFAtqa7/uR98LVNM0Ebcw+niy9wjznUbxmNm4HxFJgsDL1J/Qiul9w1Osz2M1QcKp4UCN/UL2344rXAttKGfgRcACPCWoSsXMduUjbhk7Gx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719118304; c=relaxed/simple;
	bh=K6hGMEw9gRD3KGjFp3AsPZJFpUSyjeH3ec40warBKFc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kycRwPGO3xsIEZ32ARry1ewqZJfRaHFLmS77jIYWYK2iojfMf93l9RI4AvqK6vmHUlyMi1lRa/1rlOgEv7pWBaWB2x5qYtdsVi5bkv2YCv8zaufd2HkeJKhPPnIB31w/TNtjsJKoUGXBYVWcvQk1+X0uMWt31GX/7AaLYQ0Zw6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NYMOhLcx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NYMOhLcx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719118302; x=1750654302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K6hGMEw9gRD3KGjFp3AsPZJFpUSyjeH3ec40warBKFc=;
  b=NYMOhLcxl6/S5xUgJrmBC8Q53O/dnswEI+x64cjG/OYxZY1fbqDXHt0A
   /axXa2nJ8iE0+pzSeLc6IS+OVJY4AtXuqiTZIOca5uae6zhlPyFucjd1X
   bKOpz9qQBZJhBrzl9lLqLm5YCsHtu/nHuTarWITPvXEzBvanc54/7eXT8
   Y2ay63k1SJ4bzuUmPJbO/E/4uukktAgLmzq6odUSdklnOdKOmvgUssWub
   C2cpx8oq9t3Jx5FbycOUp2Sxnt0sfPEPV7y6q1qB7O2af1RmbvBF943C8
   2j455VKEoPTp1z9eE+64gpFyMN7L+USEXtZjW90xBMMnmkAi/8KOypa74
   g==;
X-CSE-ConnectionGUID: JydQAH4oSQ+FvLpJlSz0MQ==
X-CSE-MsgGUID: YvuEe++8RAaakTA4Itzacg==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="16231413"
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="16231413"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 21:51:42 -0700
X-CSE-ConnectionGUID: 7MYTxipcT/qZV1y3U0nA+g==
X-CSE-MsgGUID: a0RH4JK2ToqmbnpIK0Q3HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,259,1712646000"; 
   d="scan'208";a="47906659"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jun 2024 21:51:41 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLFCU-000AGS-0V;
	Sun, 23 Jun 2024 04:51:38 +0000
Date: Sun, 23 Jun 2024 12:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [srini-nvmem:for-next 9/12] drivers/nvmem/core.c:400:56: error:
 assignment of member 'name' in read-only object
Message-ID: <202406231222.bqaa33QO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/srini/nvmem.git for-next
head:   050e51c214c5bbe5ffd9e7f5927ccdcd2da18fe3
commit: 178a9aea2c5db8328757fdea66922bda0236e95c [9/12] nvmem: core: mark bin_attr_nvmem_eeprom_compat as const
config: i386-buildonly-randconfig-004-20240623 (https://download.01.org/0day-ci/archive/20240623/202406231222.bqaa33QO-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240623/202406231222.bqaa33QO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406231222.bqaa33QO-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvmem/core.c: In function 'nvmem_sysfs_setup_compat':
>> drivers/nvmem/core.c:400:56: error: assignment of member 'name' in read-only object
     400 |                 bin_attr_nvmem_eeprom_compat.attr.name = "fram";
         |                                                        ^


vim +/name +400 drivers/nvmem/core.c

84400305271937 Srinivas Kandagatla 2020-03-25  382  
84400305271937 Srinivas Kandagatla 2020-03-25  383  /*
84400305271937 Srinivas Kandagatla 2020-03-25  384   * nvmem_setup_compat() - Create an additional binary entry in
84400305271937 Srinivas Kandagatla 2020-03-25  385   * drivers sys directory, to be backwards compatible with the older
84400305271937 Srinivas Kandagatla 2020-03-25  386   * drivers/misc/eeprom drivers.
84400305271937 Srinivas Kandagatla 2020-03-25  387   */
84400305271937 Srinivas Kandagatla 2020-03-25  388  static int nvmem_sysfs_setup_compat(struct nvmem_device *nvmem,
84400305271937 Srinivas Kandagatla 2020-03-25  389  				    const struct nvmem_config *config)
84400305271937 Srinivas Kandagatla 2020-03-25  390  {
84400305271937 Srinivas Kandagatla 2020-03-25  391  	int rval;
84400305271937 Srinivas Kandagatla 2020-03-25  392  
84400305271937 Srinivas Kandagatla 2020-03-25  393  	if (!config->compat)
84400305271937 Srinivas Kandagatla 2020-03-25  394  		return 0;
84400305271937 Srinivas Kandagatla 2020-03-25  395  
84400305271937 Srinivas Kandagatla 2020-03-25  396  	if (!config->base_dev)
84400305271937 Srinivas Kandagatla 2020-03-25  397  		return -EINVAL;
84400305271937 Srinivas Kandagatla 2020-03-25  398  
fd307a4ad332ef Jiri Prchal         2021-06-11  399  	if (config->type == NVMEM_TYPE_FRAM)
fd307a4ad332ef Jiri Prchal         2021-06-11 @400  		bin_attr_nvmem_eeprom_compat.attr.name = "fram";
fd307a4ad332ef Jiri Prchal         2021-06-11  401  
2a4542e55f1b59 Srinivas Kandagatla 2020-04-17  402  	nvmem->eeprom = bin_attr_nvmem_eeprom_compat;
2a4542e55f1b59 Srinivas Kandagatla 2020-04-17  403  	nvmem->eeprom.attr.mode = nvmem_bin_attr_get_umode(nvmem);
84400305271937 Srinivas Kandagatla 2020-03-25  404  	nvmem->eeprom.size = nvmem->size;
84400305271937 Srinivas Kandagatla 2020-03-25  405  #ifdef CONFIG_DEBUG_LOCK_ALLOC
84400305271937 Srinivas Kandagatla 2020-03-25  406  	nvmem->eeprom.attr.key = &eeprom_lock_key;
84400305271937 Srinivas Kandagatla 2020-03-25  407  #endif
84400305271937 Srinivas Kandagatla 2020-03-25  408  	nvmem->eeprom.private = &nvmem->dev;
84400305271937 Srinivas Kandagatla 2020-03-25  409  	nvmem->base_dev = config->base_dev;
84400305271937 Srinivas Kandagatla 2020-03-25  410  
84400305271937 Srinivas Kandagatla 2020-03-25  411  	rval = device_create_bin_file(nvmem->base_dev, &nvmem->eeprom);
84400305271937 Srinivas Kandagatla 2020-03-25  412  	if (rval) {
84400305271937 Srinivas Kandagatla 2020-03-25  413  		dev_err(&nvmem->dev,
84400305271937 Srinivas Kandagatla 2020-03-25  414  			"Failed to create eeprom binary file %d\n", rval);
84400305271937 Srinivas Kandagatla 2020-03-25  415  		return rval;
84400305271937 Srinivas Kandagatla 2020-03-25  416  	}
84400305271937 Srinivas Kandagatla 2020-03-25  417  
84400305271937 Srinivas Kandagatla 2020-03-25  418  	nvmem->flags |= FLAG_COMPAT;
84400305271937 Srinivas Kandagatla 2020-03-25  419  
84400305271937 Srinivas Kandagatla 2020-03-25  420  	return 0;
84400305271937 Srinivas Kandagatla 2020-03-25  421  }
84400305271937 Srinivas Kandagatla 2020-03-25  422  

:::::: The code at line 400 was first introduced by commit
:::::: fd307a4ad332ef50be5569c92490219e7cd84ce5 nvmem: prepare basics for FRAM support

:::::: TO: Jiri Prchal <jiri.prchal@aksignal.cz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
