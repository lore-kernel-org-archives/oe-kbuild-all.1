Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D5B15357A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714742317; cv=none; b=JfP4VcAk6jd0bRDeSyETSO8U9EgGFNQMgELbRfpQoDK4mX/FFIuxUB50KZUW4Aeb6sgg9dtVyPu4HZ54gjLgeWUH/A9EoSkbr222w6uhTxnjw73v2PV2VkOn74HWIuLDElvKAtkLI8uY7+sJ3hJe5k8igpQZj5fi6ASrJ3haxZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714742317; c=relaxed/simple;
	bh=uD+ogd+PpMh4ljsbi+3B3rauxthKlOCym5gU8PJOgIE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iin2WAA6Jraufzex2ECqkvuVFZditglIgGk/1wsVbqymRlYAwDGfjiMuuKU+PuPOG/deo8Dv5SH+g+FFl8qHJVn/3E1lieMfKP9aiWvlzo1/MXyT7owVMY7AhVUkwsSg7BqE6+nTkJLDh1gm7GGgl+RTky3VWg5/33H2d0bqFvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KpVpuHGZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KpVpuHGZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714742315; x=1746278315;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uD+ogd+PpMh4ljsbi+3B3rauxthKlOCym5gU8PJOgIE=;
  b=KpVpuHGZsuuhRCpWMDBuIgNNkd7F12IDXZMeVVtSVBaMsiQTeXOZzp/Y
   dUSo8DpBRUL2M38NbNK0Va6lAt/iznzGC789G4RvXOg8arF6GVf9KUaCi
   QBlcDw5ozo302hBxqRBlsNiqDJ60BwG/634mXVKins4k1PXqbN/zK44YC
   FEffQAGV97iWGnhmR9mq3YCJaF8PvILK6qxp/4TQLqeLrao+QPxqjnR6J
   c7Yg/oMW4a0bxKK+tUcAdooD9Z7wBpqPsHU6zwdpbA/1GxUno7ufB6Gjo
   KIFvDWeIxZFD2deRDYcYs6F8EnxXch5zRGaBkTSOF8y1EqwC0qw7hqKqH
   g==;
X-CSE-ConnectionGUID: GB+uogkNT7eoWUfglN77hw==
X-CSE-MsgGUID: aJg3+BwPT1em5j8Bn1l6ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="13497911"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="13497911"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:18:34 -0700
X-CSE-ConnectionGUID: AZTjp8J+QPihOfyfn2qzhg==
X-CSE-MsgGUID: hNKYgwBfReSOFFOPNTR21Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="31956784"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 May 2024 06:18:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2so3-000Bia-1i;
	Fri, 03 May 2024 13:18:31 +0000
Date: Fri, 3 May 2024 21:18:09 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 740/1143] drivers/i3c/device.c:84:5:
 warning: no previous prototype for function 'i3c_device_getstatus_ccc'
Message-ID: <202405032101.IqKhejZo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: 25b964218f873fa25639e22bde2ac5e02f317b05 [740/1143] i3c: master: Implement CCC GETSTATUS function
config: arm-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032101.IqKhejZo-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032101.IqKhejZo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032101.IqKhejZo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/device.c:15:
   In file included from drivers/i3c/internals.h:11:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/i3c/device.c:15:
   In file included from drivers/i3c/internals.h:11:
   In file included from include/linux/i3c/master.h:15:
   In file included from include/linux/i3c/ccc.h:12:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^
>> drivers/i3c/device.c:84:5: warning: no previous prototype for function 'i3c_device_getstatus_ccc' [-Wmissing-prototypes]
      84 | int i3c_device_getstatus_ccc(struct i3c_device *dev, struct i3c_device_info *info)
         |     ^
   drivers/i3c/device.c:84:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      84 | int i3c_device_getstatus_ccc(struct i3c_device *dev, struct i3c_device_info *info)
         | ^
         | static 
   2 warnings and 1 error generated.


vim +/i3c_device_getstatus_ccc +84 drivers/i3c/device.c

    72	
    73	/**
    74	 * i3c_device_getstatus_ccc() - receive device status
    75	 *
    76	 * @dev: I3C device to get the status for
    77	 * @info: I3C device info to fill the status in
    78	 *
    79	 * Receive I3C device status from I3C master device via corresponding CCC
    80	 * command
    81	 *
    82	 * Return: 0 in case of success, a negative error code otherwise.
    83	 */
  > 84	int i3c_device_getstatus_ccc(struct i3c_device *dev, struct i3c_device_info *info)
    85	{
    86		int ret = -EINVAL;
    87	
    88		i3c_bus_normaluse_lock(dev->bus);
    89		if (dev->desc)
    90			ret = i3c_dev_getstatus_locked(dev->desc, info);
    91		i3c_bus_normaluse_unlock(dev->bus);
    92	
    93		return ret;
    94	}
    95	EXPORT_SYMBOL_GPL(i3c_device_getstatus_ccc);
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
