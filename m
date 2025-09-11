Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B8345734
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Sep 2025 15:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757604388; cv=none; b=G2FKS/8wS9Zh3lijcx+WE73DKfOq2303FXtjR8rrM0Nth5K11/SnVcCmuOUDXe/l+ZmRw7xAID6MrqLhJuo/W6Z3FqdRojusMSP+ZIeg3l4h4C6VuqtwVF61kYsHRbsRwJdFaTsCRAMoMvUNTrw5Dd5ylKsFV40ff722JNUI39k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757604388; c=relaxed/simple;
	bh=1ZK869gO8xR8J0MM0aFjOUoCupNlUy7yzw1Y2JVW1xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N24B1tfawfbN4ROAnw9ilv9i7xpe8WQ/5LooW8VBhyYukIRAVE6nGe0lJHsbG557giA2qhpQFAzLHFiAqtZIjPPRpcAs82Miu9IYbJO0CO6rnqIay11OSeNlo9HDCKHvG98LiYD5xfDPVxxkZEqX1Ioi1J8yA0Ny3Abw2FnBxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=muY/hKgM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="muY/hKgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757604387; x=1789140387;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ZK869gO8xR8J0MM0aFjOUoCupNlUy7yzw1Y2JVW1xc=;
  b=muY/hKgMbcoO2LwEOXqi8c7DTrkrvqyj5kWLIfyrYior9wuOk0ipgDJJ
   eIY/FxWURttJQ02ExCLNVYQZA17ZpFi6bYDE7guOKYf24IsSsrpOB1fCk
   EPn86XOl+4oPNN6Qjq7YhkjgwRMHb0jS3Fz12aM26BYbpieof4Ovtf1hO
   0y5hoInk2nalsMtqWCYKPRrhhrjiEW+zDQuI/2ff9s455ZJYpu1PAsril
   pzjOGy3TE6Ty3D466jrMmjH51bbYNkSRmZmnAXo6XmtsLeR30fObYPOys
   Jqu6xjEMhAVOty0miNbIIFCod/0DtRjDqXpXj2mMURbSy9/gA++5owtZU
   A==;
X-CSE-ConnectionGUID: 4qvbbz6cTq2raU7VaknQPw==
X-CSE-MsgGUID: kmCcQaCyQ9+Tn28X2up5Cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="77397097"
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="77397097"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 08:26:26 -0700
X-CSE-ConnectionGUID: Ae+QAc+4Rk+S1tSCWEIB2Q==
X-CSE-MsgGUID: 3aWQoC3VTe2XawS29hRT3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,257,1751266800"; 
   d="scan'208";a="178033125"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2025 08:26:15 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwjBI-0000PI-1R;
	Thu, 11 Sep 2025 15:26:01 +0000
Date: Thu, 11 Sep 2025 23:25:27 +0800
From: kernel test robot <lkp@intel.com>
To: Serin Yeh <serin.yeh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Subject: [gdamjan:v6.17/imx471 4/4] drivers/media/i2c/imx471.c:1054:1:
 warning: unused label 'error_power_off'
Message-ID: <202509112334.8bmIXs4W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gdamjan/linux v6.17/imx471
head:   1c5105529bf80bb7752dc726e67aa8512f4a5a27
commit: 1c5105529bf80bb7752dc726e67aa8512f4a5a27 [4/4] Add IMX471 power management for correct behaviors
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20250911/202509112334.8bmIXs4W-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509112334.8bmIXs4W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509112334.8bmIXs4W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:28:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      28 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:371:9: note: previous definition is here
     371 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/media/i2c/imx471.c:1054:1: warning: unused label 'error_power_off' [-Wunused-label]
    1054 | error_power_off:
         | ^~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/error_power_off +1054 drivers/media/i2c/imx471.c

   962	
   963	static int imx471_probe(struct i2c_client *client)
   964	{
   965		struct imx471 *imx471;
   966		bool full_power;
   967		int ret;
   968	
   969	
   970		/* Check HW config */
   971		ret = imx471_check_hwcfg(&client->dev);
   972		if (ret) {
   973			dev_err(&client->dev, "failed to check hwcfg: %d", ret);
   974			return ret;
   975		}
   976	
   977		imx471 = devm_kzalloc(&client->dev, sizeof(*imx471), GFP_KERNEL);
   978		if (!imx471)
   979			return -ENOMEM;
   980	
   981		mutex_init(&imx471->mutex);
   982	
   983		/* Initialize subdev */
   984		v4l2_i2c_subdev_init(&imx471->sd, client, &imx471_subdev_ops);
   985	
   986		ret = imx471_get_pm_resources(&client->dev);
   987		if (ret)
   988			return ret;
   989	
   990		full_power = acpi_dev_state_d0(&client->dev);
   991		if (full_power) {
   992			ret = imx471_power_on(&client->dev);
   993			if (ret) {
   994				dev_err(&client->dev, "failed to power on\n");
   995				return ret;
   996			}
   997	
   998			/* Check module identity */
   999			ret = imx471_identify_module(imx471);
  1000			if (ret) {
  1001				dev_err(&client->dev, "failed to find sensor: %d", ret);
  1002				goto error_probe;
  1003			}
  1004		}
  1005	
  1006		/* Set default mode to max resolution */
  1007		imx471->cur_mode = &supported_modes[0];
  1008	
  1009		ret = imx471_init_controls(imx471);
  1010		if (ret) {
  1011			dev_err(&client->dev, "failed to init controls: %d", ret);
  1012			goto error_probe;
  1013		}
  1014	
  1015		/* Initialize subdev */
  1016		imx471->sd.internal_ops = &imx471_internal_ops;
  1017		imx471->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
  1018			V4L2_SUBDEV_FL_HAS_EVENTS;
  1019		imx471->sd.entity.ops = &imx471_subdev_entity_ops;
  1020		imx471->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1021	
  1022		/* Initialize source pad */
  1023		imx471->pad.flags = MEDIA_PAD_FL_SOURCE;
  1024		ret = media_entity_pads_init(&imx471->sd.entity, 1, &imx471->pad);
  1025		if (ret) {
  1026			dev_err(&client->dev, "failed to init entity pads: %d", ret);
  1027			goto error_handler_free;
  1028		}
  1029	
  1030		/* Set the device's state to active if it's in D0 state. */
  1031		if (full_power)
  1032			pm_runtime_set_active(&client->dev);
  1033		pm_runtime_enable(&client->dev);
  1034		pm_runtime_idle(&client->dev);
  1035	
  1036		ret = v4l2_async_register_subdev_sensor(&imx471->sd);
  1037		if (ret < 0)
  1038			goto error_media_entity_pm;
  1039	
  1040		dev_info(&client->dev, "imx471 probe successfully\n");
  1041		return 0;
  1042	
  1043	error_media_entity_pm:
  1044		pm_runtime_disable(&client->dev);
  1045		pm_runtime_set_suspended(&client->dev);
  1046		media_entity_cleanup(&imx471->sd.entity);
  1047	
  1048	error_handler_free:
  1049		v4l2_ctrl_handler_free(imx471->sd.ctrl_handler);
  1050	
  1051	error_probe:
  1052		mutex_destroy(&imx471->mutex);
  1053	
> 1054	error_power_off:
  1055		imx471_power_off(&client->dev);
  1056	
  1057		return ret;
  1058	}
  1059	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
