Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21AF33009DD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 17:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762363578; cv=none; b=mfzzsIWqHuOSFuHHYRCSxSp+jw8wWmk2HC/et+nrful9cRM3YidnjlOug6sdN4OwR/zto+FCbr9SSm9vgF905r3FUZLzutxhALI6012al/U5MQL3amQ3xYaCvdduYyben4XhfZZDPhps9nGr8Q9wxLp+1X7e8lQHP/m7ZOKSHso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762363578; c=relaxed/simple;
	bh=y7RMzifjIwcN5ZYr/2hWVoA7cn8JiuSHsnYvn0pc3K8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uxMhSk5c4lPBnhqyTdCN43GoXmcLuQhVjaRuMf07H4n5JuhM+kqEYhKreoI0fe/xSiMWSfgRhZQnA5ahhftBbuTthe66GDIRQDr/T3d8a1om2sYHggKUayEgSiM1qkB5dlNeAIDSkm1G8eXL1xRxjrhcZxCOIvnB3a2fnz5aWUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CaORxR6C; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CaORxR6C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762363576; x=1793899576;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y7RMzifjIwcN5ZYr/2hWVoA7cn8JiuSHsnYvn0pc3K8=;
  b=CaORxR6C+S9oZ9hPRQjtWclmFaOX3zwJRBUmMp+1w86rtaNc6Sdy6phu
   Wrr5Dveh50sER7CAT3GoP1XwTk02FUtm67YaomzEPTVSAtVlzXiEUe2hR
   TO4ynEF/ve0D7duFH2D2fbB5OWvo2i/jr5PGJGbnGu8ABpcmvncBXAFWp
   imFU45lMBtc5MrljkpKeEbLPmaH8ebbyXSrKh3MOPWoUnmohmGs0IW4nn
   8K3qcVDgjf/nOJwjKgP0xZtSScZa1Zy8k2r+OMmcZH1R6WEeH0IBSAtWD
   UynVgx0+icmGB62vHFSwS3Fi3PSd4Z2zfNPMOK/mMPRmmp0vPuWb0SIzC
   g==;
X-CSE-ConnectionGUID: LFITZVjgTkihl74Dz44vkA==
X-CSE-MsgGUID: Ajgids3bS8mi1adyhY+J6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64368436"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64368436"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 09:26:15 -0800
X-CSE-ConnectionGUID: amY34+pNSwCHboNOgNOMyg==
X-CSE-MsgGUID: E2x4IaweSQCQP34u6CQhrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="186803091"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Nov 2025 09:26:14 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGhGq-000Svi-0z;
	Wed, 05 Nov 2025 17:26:08 +0000
Date: Thu, 6 Nov 2025 01:17:09 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jianquan Lin <linjianquan2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3075/3075] drivers/ub/ubus/reset.c:33:5: warning:
 no previous prototype for function 'ub_elr'
Message-ID: <202511060146.GOM8mybD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b2b8512ca97108929f3aca5405875d91577b8c80
commit: 0f0c155e2bb76b55e447e83da0226561c7f397b1 [3075/3075] ub:ubus: Support device level and port level reset
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251106/202511060146.GOM8mybD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060146.GOM8mybD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060146.GOM8mybD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/ubus/reset.c:33:5: warning: no previous prototype for function 'ub_elr' [-Wmissing-prototypes]
      33 | int ub_elr(struct ub_entity *dev)
         |     ^
   drivers/ub/ubus/reset.c:33:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      33 | int ub_elr(struct ub_entity *dev)
         | ^
         | static 
>> drivers/ub/ubus/reset.c:231:5: warning: no previous prototype for function 'ub_port_reset_check' [-Wmissing-prototypes]
     231 | int ub_port_reset_check(struct ub_entity *dev, int port_id)
         |     ^
   drivers/ub/ubus/reset.c:231:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     231 | int ub_port_reset_check(struct ub_entity *dev, int port_id)
         | ^
         | static 
>> drivers/ub/ubus/reset.c:277:5: warning: no previous prototype for function 'ub_port_reset' [-Wmissing-prototypes]
     277 | int ub_port_reset(struct ub_entity *dev, int port_id)
         |     ^
   drivers/ub/ubus/reset.c:277:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     277 | int ub_port_reset(struct ub_entity *dev, int port_id)
         | ^
         | static 
>> drivers/ub/ubus/reset.c:323:5: warning: no previous prototype for function 'ub_port_reset_function' [-Wmissing-prototypes]
     323 | int ub_port_reset_function(struct ub_port *port)
         |     ^
   drivers/ub/ubus/reset.c:323:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     323 | int ub_port_reset_function(struct ub_port *port)
         | ^
         | static 
   4 warnings generated.


vim +/ub_elr +33 drivers/ub/ubus/reset.c

    28	
    29	/**
    30	 * ub_elr - Initiate an UB entity level reset
    31	 * @dev: UB entity to reset
    32	 */
  > 33	int ub_elr(struct ub_entity *dev)
    34	{
    35		u8 command;
    36		u8 val = 0;
    37		int ret;
    38	
    39		/* enable ELR */
    40		command = 0x01;
    41		ret = ub_cfg_write_byte(dev, UB_ELR, command);
    42		if (ret) {
    43			ub_err(dev, "dev elr failed, write byte error, ret=%d", ret);
    44			return ret;
    45		}
    46	
    47		/*
    48		 * ub entity must complete an ELR within 100ms,
    49		 * but may silently discard requests while the ELR is in
    50		 * progress. Wait 100ms before trying to access the device.
    51		 */
    52		msleep(100);
    53	
    54		ret = ub_cfg_read_byte(dev, UB_ELR_DONE, &val);
    55		if (ret || !val) {
    56			ub_err(dev, "dev elr failed, ret=%d, ELR_DONE=%u\n", ret, val);
    57			return -EINVAL;
    58		}
    59	
    60		ub_info(dev, "dev elr success\n");
    61	
    62		return 0;
    63	}
    64	
    65	/**
    66	 * ub_device_reset - Initiate a UB entity reset
    67	 * @ent: UB entity.
    68	 */
    69	int ub_device_reset(struct ub_entity *ent)
    70	{
    71		u16 command;
    72		int ret;
    73	
    74		if (!ent) {
    75			pr_err("device which will be reset is NULL\n");
    76			return -EINVAL;
    77		}
    78	
    79		if (is_ibus_controller(ent)) {
    80			ub_warn(ent, "ub bus controller do not support reset.\n");
    81			return -EINVAL;
    82		}
    83	
    84		/* device reset only support Entity0 */
    85		if (ent->entity_idx) {
    86			ub_err(ent, "device is not entity0, entity_idx=%u\n", ent->entity_idx);
    87			return -EINVAL;
    88		}
    89	
    90		device_lock(&ent->dev);
    91	
    92		/* enable device reset */
    93		command = 0x01;
    94		ret = ub_send_cfg(ent, (u8)sizeof(u16), UB_ENTITY_RST, (u32 *)&command);
    95		if (ret) {
    96			ub_err(ent, "device reset failed, ret=%d\n", ret);
    97			device_unlock(&ent->dev);
    98			return -EIO;
    99		}
   100	
   101		device_unlock(&ent->dev);
   102		ub_info(ent, "device reset success\n");
   103	
   104		return 0;
   105	}
   106	EXPORT_SYMBOL_GPL(ub_device_reset);
   107	
   108	static void ub_save_token_state(struct ub_entity *dev)
   109	{
   110		int ret;
   111		int i;
   112	
   113		for (i = DEV_TOKEN_ID; i <= DEV_TOKEN_ID; i++) {
   114			ret = ub_cfg_read_dword(dev, saved_cfg_offset[i],
   115						&dev->saved_config_space[i]);
   116			if (ret) {
   117				ub_err(dev, "ub cfg read dword failed, save cfg offset: %#x.\n",
   118					saved_cfg_offset[i]);
   119				continue;
   120			}
   121			ub_info(dev, "saving config space at address %#x (reading %#x)\n",
   122				saved_cfg_offset[i], dev->saved_config_space[i]);
   123		}
   124	}
   125	
   126	static int ub_save_state(struct ub_entity *dev)
   127	{
   128		const struct ub_error_handlers *err_handler =
   129				dev->driver ? dev->driver->err_handler : NULL;
   130	
   131		if (err_handler && err_handler->ub_reset_prepare)
   132			err_handler->ub_reset_prepare(dev);
   133	
   134		ub_save_token_state(dev);
   135	
   136		dev->state_saved = true;
   137	
   138		return 0;
   139	}
   140	
   141	static void ub_restore_config_dword(struct ub_entity *dev, u32 pos, u32 saved_val)
   142	{
   143		int retry = 10;
   144		u32 val;
   145		int ret;
   146	
   147		ret = ub_cfg_read_dword(dev, pos, &val);
   148		if (ret || val == saved_val)
   149			return;
   150		while (retry-- > 0) {
   151			ub_info(dev, "restoring config space at address %#x (was %#x, writing %#x)\n",
   152				pos, val, saved_val);
   153			ub_cfg_write_dword(dev, pos, saved_val);
   154	
   155			if (ub_cfg_read_dword(dev, pos, &val))
   156				continue;
   157	
   158			if (val == saved_val)
   159				return;
   160	
   161	#define RESTORE_RETRY_SLEEP_MS 1
   162			msleep(RESTORE_RETRY_SLEEP_MS);
   163		}
   164	}
   165	
   166	static void ub_restore_state(struct ub_entity *dev)
   167	{
   168		const struct ub_error_handlers *err_handler =
   169				dev->driver ? dev->driver->err_handler : NULL;
   170		int i;
   171	
   172		if (!dev->state_saved)
   173			return;
   174	
   175		for (i = DEV_TOKEN_ID; i <= DEV_TOKEN_ID; i++) {
   176			ub_restore_config_dword(dev, saved_cfg_offset[i],
   177						dev->saved_config_space[i]);
   178		}
   179	
   180		dev->state_saved = false;
   181	
   182		if (err_handler && err_handler->ub_reset_done)
   183			err_handler->ub_reset_done(dev);
   184	}
   185	
   186	static int ub_reset_check(struct ub_entity *dev)
   187	{
   188		if (is_ibus_controller(dev)) {
   189			ub_err(dev, "UB Bus Controller does not support ELR!\n");
   190			return -EINVAL;
   191		}
   192	
   193		if (!dev->reset_fn)
   194			return -ENOTTY;
   195	
   196		return 0;
   197	}
   198	
   199	int ub_reset_entity(struct ub_entity *dev)
   200	{
   201		int ret, rc;
   202	
   203		if (!dev) {
   204			pr_err("device is NULL\n");
   205			return -EINVAL;
   206		}
   207	
   208		rc = ub_reset_check(dev);
   209		if (rc)
   210			return rc;
   211	
   212		if (!device_trylock(&dev->dev))
   213			return -EBUSY;
   214	
   215		ret = ub_save_state(dev);
   216		if (ret) {
   217			device_unlock(&dev->dev);
   218			return ret;
   219		}
   220	
   221		rc = ub_elr(dev);
   222	
   223		ub_restore_state(dev);
   224	
   225		device_unlock(&dev->dev);
   226	
   227		return rc;
   228	}
   229	EXPORT_SYMBOL_GPL(ub_reset_entity);
   230	
 > 231	int ub_port_reset_check(struct ub_entity *dev, int port_id)
   232	{
   233		struct ub_port *port = NULL;
   234	
   235		if (!dev)
   236			return -EINVAL;
   237	
   238		if (is_idev(dev)) {
   239			ub_err(dev, "IDEV does not support port reset!\n");
   240			return -EINVAL;
   241		}
   242	
   243		if (port_id >= dev->port_nums) {
   244			ub_err(dev, "Can't reset port because port(%d) is over port_nums(%u)!\n",
   245				port_id, dev->port_nums);
   246			return -EINVAL;
   247		}
   248	
   249		port = dev->ports + port_id;
   250	
   251		if (port->type == VIRTUAL) {
   252			ub_err(dev, "vport reset is not supported now!\n");
   253			return -EINVAL;
   254		}
   255	
   256		return 0;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
