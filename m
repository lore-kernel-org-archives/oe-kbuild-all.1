Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6B16139
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 May 2024 07:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714808186; cv=none; b=mB3tyADRtra+M/wh8zBICzIdrnOtAT2u1+UsibOghES7sOjsL468sQ9KLqHygC96P1FpZRIV/QLMpZnIQOGFu/fFq9WcerB/bU3lzD/gaM2HILUxXesgP4XHFGg2CQcSbmiLwStWdyI4VQjWicJhxIWq8Ip282L5CHUE10Be7v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714808186; c=relaxed/simple;
	bh=Pahcqqh5K8PgLnRB2R2XbPpiv1dmsQ5zRwBZvwLezPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qNAshRSYVjFIbQzWev4mFRqjjNtNq/b/Xq3Jv5EJ6+f9tIgoyu7INR3dkstlDwvYyZ/xzaIAqgSjnLBHaGW0ArqWC5mdTezFO4w6cexVsVKnsZr2hpOVgqD6BGt1I+UY8U1pMlImap17al+9fEwJ/qL8P+JC1nDhEtYFvjnSHKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cG7YMZQz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cG7YMZQz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714808184; x=1746344184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pahcqqh5K8PgLnRB2R2XbPpiv1dmsQ5zRwBZvwLezPo=;
  b=cG7YMZQzP5AivfybJKPxszwBQuMNfAPejfzgOfj4kQRWiHgMhCxACfKc
   s7BzcXqZNKkZPGTKIl4D047iTMFLvGnwATgnjxs/bhkpUK61Jjnymx46z
   GxLh7zStJu7kl3Q5uQqIHKSDjthwwbAzOidA0L72WcOE38kHFK4Q5o9oE
   fNdiQQNJ+eCMBwtGEyrVo/l2EgTAGZukTcmdxlG95eJs/MwBtMucvtv4r
   8/A7PTPoNaD9wi4hKrqp+dnPBstmaNhdZGtiAiXrpRbdI4UvJuofIaD4j
   QGzV5G9A7fPRjQ/ZQdq4WENDOSb8V+f/9Wov0YEQi+CU6WNiHVi4nBDSs
   Q==;
X-CSE-ConnectionGUID: 00gcJF4YTjCPxVJhkm/4gg==
X-CSE-MsgGUID: ytHojtPxQFCkEH1ftOFo3g==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10468631"
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="10468631"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 00:36:21 -0700
X-CSE-ConnectionGUID: nXnznSMwTQSiMSEOxpwOQQ==
X-CSE-MsgGUID: xsMDI+HnSOOWMFVGuFmHIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,253,1708416000"; 
   d="scan'208";a="28248616"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 May 2024 00:36:21 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s39wQ-000CXy-0u;
	Sat, 04 May 2024 07:36:18 +0000
Date: Sat, 4 May 2024 15:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 740/1143] drivers/i3c/master.c:3110:8:
 error: no member named 'status' in 'struct i3c_device_info'
Message-ID: <202405041514.U4uZPKLr-lkp@intel.com>
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
config: arm-randconfig-001-20240503 (https://download.01.org/0day-ci/archive/20240504/202405041514.U4uZPKLr-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240504/202405041514.U4uZPKLr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405041514.U4uZPKLr-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   drivers/i3c/master.c:2869:1: error: version control conflict marker in file
    2869 | <<<<<<< HEAD
         | ^
>> drivers/i3c/master.c:3110:8: error: no member named 'status' in 'struct i3c_device_info'
    3110 |         info->status = getsts->status;
         |         ~~~~  ^
   1 warning and 3 errors generated.


vim +3110 drivers/i3c/master.c

  3091	
  3092	int i3c_dev_getstatus_locked(struct i3c_dev_desc *dev,
  3093				     struct i3c_device_info *info)
  3094	{
  3095		struct i3c_master_controller *master = i3c_dev_get_master(dev);
  3096		struct i3c_ccc_getstatus *getsts;
  3097		struct i3c_ccc_cmd_dest dest;
  3098		struct i3c_ccc_cmd cmd;
  3099		int ret;
  3100	
  3101		getsts = i3c_ccc_cmd_dest_init(&dest, info->dyn_addr, sizeof(*getsts));
  3102		if (!getsts)
  3103			return -ENOMEM;
  3104	
  3105		i3c_ccc_cmd_init(&cmd, true, I3C_CCC_GETSTATUS, &dest, 1);
  3106		ret = i3c_master_send_ccc_cmd_locked(master, &cmd);
  3107		if (ret)
  3108			goto out;
  3109	
> 3110		info->status = getsts->status;
  3111	
  3112	out:
  3113		i3c_ccc_cmd_dest_cleanup(&dest);
  3114	
  3115		return ret;
  3116	}
  3117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
