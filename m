Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591715444D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714751383; cv=none; b=OaL4BJ7zYJDf6xzWnSPDgrvdNPVUP58at4+6xiGxRhVKgZLqgigfWpNyv1dKHGFTczFHWzhjYgmVxl6k2/XDLUUe99JzO5CKuPuWP/w2iSt7DddqIOiYAa1R6uFmfHXaL3PMtLJkaya/SA0QRQC8F+Q0UnP4kuTCGm67WvhZGKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714751383; c=relaxed/simple;
	bh=gErCsVDIsLqoFoAE2tYLTFdG1Zh9zCKzdfymTLaXlkE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ugv7TMVlIgdqu11EhH6C3IquxkvXacaI6q+JcZc2SEqjnKxYewkra9Hm0Tx/ZNoF8gd9PJL/X2zWYGBLMqGHSoY8p+6vLOCwz+kItSO0uWYJBTMQZAgJTjQoe+Vz9Km4pu1RHoqxwtgA7MG1p4n8zDQkg+U9yp+3qAntOa4dYOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n0EYFcFT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n0EYFcFT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714751381; x=1746287381;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gErCsVDIsLqoFoAE2tYLTFdG1Zh9zCKzdfymTLaXlkE=;
  b=n0EYFcFT4oH4x4fxzaagD6dyJjdrIAveyW20CUovRYdrA0UruOsQJ4Oh
   MSG16rHapG1UlmUneEq8/W8eOb08UDxsBfXswEgxVNADsaBmCZaVH2QUQ
   SyAhlBCcnFR1X8SL2DsoJVF5H7VGITtKiVg/hroRv0xLSy52A3A5PGsaD
   LccYG5qNeIS0VEFR0UuiO6Mkj+FZplPzgSVMtPY95rxDF6AJVYHnieCc4
   U+6EAzMpZy52/ymlRgN689XE5WCHsaIp1m6NMGZYfseaIof+oXe4SCaIi
   VgtqYH3cBIwxCLUvgSBecs1NCoXAXl/z67l3F+1eBQ+sjUFZmjIHXSh9J
   w==;
X-CSE-ConnectionGUID: RgPuODZHQG+dQRf+cmtCkg==
X-CSE-MsgGUID: 3n75xF4cQhi9cz4u1MPuXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10439723"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10439723"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 08:49:39 -0700
X-CSE-ConnectionGUID: nStcl38ZQ4imAsgu8VuhJw==
X-CSE-MsgGUID: rHrUutvQR+SXXE4bP9arlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="27505255"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 May 2024 08:49:38 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2vAG-000BpC-0L;
	Fri, 03 May 2024 15:49:36 +0000
Date: Fri, 3 May 2024 23:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 1055/1143] drivers/i3c/master.c:1208:5:
 warning: no previous prototype for function 'i3c_master_setmrl_locked'
Message-ID: <202405032342.kVGOhOaf-lkp@intel.com>
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
commit: b39298e779903a0e6ec26f7b682a7054d15734f2 [1055/1143] i3c master: send SETMRL's 3rd byte according to BCR[2]
config: arm-randconfig-002-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032342.kVGOhOaf-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032342.kVGOhOaf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032342.kVGOhOaf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/i3c/master.c:20:
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
   In file included from drivers/i3c/master.c:20:
   In file included from drivers/i3c/internals.h:11:
   In file included from include/linux/i3c/master.h:15:
   In file included from include/linux/i3c/ccc.h:12:
   include/linux/i3c/device.h:320:1: error: version control conflict marker in file
     320 | <<<<<<< HEAD
         | ^
   drivers/i3c/master.c:659:3: error: use of undeclared identifier 'dev_attr_bus_context'
     659 |         &dev_attr_bus_context.attr,
         |          ^
>> drivers/i3c/master.c:1208:5: warning: no previous prototype for function 'i3c_master_setmrl_locked' [-Wmissing-prototypes]
    1208 | int i3c_master_setmrl_locked(struct i3c_master_controller *master,
         |     ^
   drivers/i3c/master.c:1208:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1208 | int i3c_master_setmrl_locked(struct i3c_master_controller *master,
         | ^
         | static 
>> drivers/i3c/master.c:1239:5: warning: no previous prototype for function 'i3c_master_setmwl_locked' [-Wmissing-prototypes]
    1239 | int i3c_master_setmwl_locked(struct i3c_master_controller *master,
         |     ^
   drivers/i3c/master.c:1239:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1239 | int i3c_master_setmwl_locked(struct i3c_master_controller *master,
         | ^
         | static 
   drivers/i3c/master.c:2941:1: error: version control conflict marker in file
    2941 | <<<<<<< HEAD
         | ^
   drivers/i3c/master.c:3182:8: error: no member named 'status' in 'struct i3c_device_info'
    3182 |         info->status = getsts->status;
         |         ~~~~  ^
   3 warnings and 4 errors generated.


vim +/i3c_master_setmrl_locked +1208 drivers/i3c/master.c

  1207	
> 1208	int i3c_master_setmrl_locked(struct i3c_master_controller *master,
  1209				     struct i3c_device_info *info, u16 read_len, u8 ibi_len)
  1210	{
  1211		struct i3c_ccc_cmd_dest dest;
  1212		struct i3c_ccc_cmd cmd;
  1213		struct i3c_ccc_mrl *mrl;
  1214		int ret;
  1215	
  1216		mrl = i3c_ccc_cmd_dest_init(&dest, info->dyn_addr, sizeof(*mrl));
  1217		if (!mrl)
  1218			return -ENOMEM;
  1219	
  1220		/*
  1221		 * When the device does not have IBI payload SETMRL only sends 2
  1222		 * bytes of data.
  1223		 */
  1224		if (!(info->bcr & I3C_BCR_IBI_PAYLOAD))
  1225			dest.payload.len -= 1;
  1226	
  1227		mrl->read_len = cpu_to_be16(read_len);
  1228		mrl->ibi_len = ibi_len;
  1229		info->max_read_len = read_len;
  1230		info->max_ibi_len = mrl->ibi_len;
  1231		i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETMRL(false), &dest, 1);
  1232	
  1233		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
  1234		i3c_ccc_cmd_dest_cleanup(&dest);
  1235	
  1236		return ret;
  1237	}
  1238	
> 1239	int i3c_master_setmwl_locked(struct i3c_master_controller *master,
  1240				     struct i3c_device_info *info, u16 write_len)
  1241	{
  1242		struct i3c_ccc_cmd_dest dest;
  1243		struct i3c_ccc_cmd cmd;
  1244		struct i3c_ccc_mwl *mwl;
  1245		int ret;
  1246	
  1247		mwl = i3c_ccc_cmd_dest_init(&dest, info->dyn_addr, sizeof(*mwl));
  1248		if (!mwl)
  1249			return -ENOMEM;
  1250	
  1251		mwl->len = cpu_to_be16(write_len);
  1252		info->max_write_len = write_len;
  1253		i3c_ccc_cmd_init(&cmd, false, I3C_CCC_SETMWL(false), &dest, 1);
  1254	
  1255		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
  1256		i3c_ccc_cmd_dest_cleanup(&dest);
  1257	
  1258		return ret;
  1259	}
  1260	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
