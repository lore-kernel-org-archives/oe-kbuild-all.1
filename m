Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8143130C354
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 16:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766247690; cv=none; b=RQRzJUGqgykC4Mbw/vwX5u47w38RZ4jNfvLM4O99XnkZJ9kHloSvlxV6Ytw0oxM8j3ULcBvCHZhGG/iAAGbn+TqNXJuY+Z2iXVmGAz7CJGlyUFwvJw3XiKbrymCpH1jhAxr/NnfoWHXa7Hlfkb/1piuEFNxzlTTcqyWSq50oD7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766247690; c=relaxed/simple;
	bh=wXXHO40UW/qPpsN4hn9sCp2Vg8+PjUbTb0kTmsx2Anc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LfDUMaslFH0vkBwpGaH81BjilYtb3kWYMMXn/KQsyi3hjaJzoBNxHzpax2txcUAlNnUKxz7ge3kFqQsdjPuDmJylZjUwfhmBmkbMMdKvB3slcQXVSNxTAd51+njJAnognkYihgPxBAVj/jl3vMbJKEeqIf77rnaTn24QNA/FB4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+IDSoWP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+IDSoWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766247688; x=1797783688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wXXHO40UW/qPpsN4hn9sCp2Vg8+PjUbTb0kTmsx2Anc=;
  b=P+IDSoWP9ipDbzkK5WZ/wW5DGTQ8CErxz1ieoLTfckZZ9f998AoVBCdH
   HpmrLtQMOtsfE++FY+6icwNOv7xhGWwyK+9kLHYSwJd4EI6EbLcKwHymZ
   TfMoolwSh3jzjO2o7o2xnRttjCsiUIg7isWDJreqLv+1MNB9PgLrCLzpl
   ah/OE91/MZfYfAMwbXhAn54vYyUbmQRvvTPn1Z/EvvxoyJuPS+6wqGc/l
   mBeFnfTcBj94nxCPbFI4GSQrOgzqWilmb/r4FDyBWXtAzMW/e7apl0q6J
   dds9Sm/UsDnZ9UGIQcshJ7BevOnYlZxqwMEKVx/06bvWvKFgN62vvkjkx
   g==;
X-CSE-ConnectionGUID: 8knQHYcETcmOpp7b2gFnMg==
X-CSE-MsgGUID: JMa+2ep3QpCwV3zXimlQfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="67929312"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="67929312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:21:26 -0800
X-CSE-ConnectionGUID: kvJirV+TRzCkcMdXOXfyiA==
X-CSE-MsgGUID: 8HhY1khzQ6e3fCcZhCVRTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199364125"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 20 Dec 2025 08:21:25 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzhq-000000004rt-2eHE;
	Sat, 20 Dec 2025 16:21:22 +0000
Date: Sun, 21 Dec 2025 00:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Serin Yeh <serin.yeh@intel.com>
Subject: [gdamjan:v6.19/thinkpad-x9-14 6/6]
 drivers/media/i2c/imx471.c:1053:1: warning: label 'error_power_off' defined
 but not used
Message-ID: <202512210013.0D8PCX65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gdamjan/linux v6.19/thinkpad-x9-14
head:   89f00ee2600546cc930a1fbad7d401bc134d54e4
commit: 89f00ee2600546cc930a1fbad7d401bc134d54e4 [6/6] Add IMX471 power management for correct behaviors
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20251221/202512210013.0D8PCX65-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210013.0D8PCX65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210013.0D8PCX65-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/imx471.c: In function 'imx471_probe':
>> drivers/media/i2c/imx471.c:1053:1: warning: label 'error_power_off' defined but not used [-Wunused-label]
    1053 | error_power_off:
         | ^~~~~~~~~~~~~~~


vim +/error_power_off +1053 drivers/media/i2c/imx471.c

   961	
   962	static int imx471_probe(struct i2c_client *client)
   963	{
   964		struct imx471 *imx471;
   965		bool full_power;
   966		int ret;
   967	
   968	
   969		/* Check HW config */
   970		ret = imx471_check_hwcfg(&client->dev);
   971		if (ret) {
   972			dev_err(&client->dev, "failed to check hwcfg: %d", ret);
   973			return ret;
   974		}
   975	
   976		imx471 = devm_kzalloc(&client->dev, sizeof(*imx471), GFP_KERNEL);
   977		if (!imx471)
   978			return -ENOMEM;
   979	
   980		mutex_init(&imx471->mutex);
   981	
   982		/* Initialize subdev */
   983		v4l2_i2c_subdev_init(&imx471->sd, client, &imx471_subdev_ops);
   984	
   985		ret = imx471_get_pm_resources(&client->dev);
   986		if (ret)
   987			return ret;
   988	
   989		full_power = acpi_dev_state_d0(&client->dev);
   990		if (full_power) {
   991			ret = imx471_power_on(&client->dev);
   992			if (ret) {
   993				dev_err(&client->dev, "failed to power on\n");
   994				return ret;
   995			}
   996	
   997			/* Check module identity */
   998			ret = imx471_identify_module(imx471);
   999			if (ret) {
  1000				dev_err(&client->dev, "failed to find sensor: %d", ret);
  1001				goto error_probe;
  1002			}
  1003		}
  1004	
  1005		/* Set default mode to max resolution */
  1006		imx471->cur_mode = &supported_modes[0];
  1007	
  1008		ret = imx471_init_controls(imx471);
  1009		if (ret) {
  1010			dev_err(&client->dev, "failed to init controls: %d", ret);
  1011			goto error_probe;
  1012		}
  1013	
  1014		/* Initialize subdev */
  1015		imx471->sd.internal_ops = &imx471_internal_ops;
  1016		imx471->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE |
  1017			V4L2_SUBDEV_FL_HAS_EVENTS;
  1018		imx471->sd.entity.ops = &imx471_subdev_entity_ops;
  1019		imx471->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
  1020	
  1021		/* Initialize source pad */
  1022		imx471->pad.flags = MEDIA_PAD_FL_SOURCE;
  1023		ret = media_entity_pads_init(&imx471->sd.entity, 1, &imx471->pad);
  1024		if (ret) {
  1025			dev_err(&client->dev, "failed to init entity pads: %d", ret);
  1026			goto error_handler_free;
  1027		}
  1028	
  1029		/* Set the device's state to active if it's in D0 state. */
  1030		if (full_power)
  1031			pm_runtime_set_active(&client->dev);
  1032		pm_runtime_enable(&client->dev);
  1033		pm_runtime_idle(&client->dev);
  1034	
  1035		ret = v4l2_async_register_subdev_sensor(&imx471->sd);
  1036		if (ret < 0)
  1037			goto error_media_entity_pm;
  1038	
  1039		dev_info(&client->dev, "imx471 probe successfully\n");
  1040		return 0;
  1041	
  1042	error_media_entity_pm:
  1043		pm_runtime_disable(&client->dev);
  1044		pm_runtime_set_suspended(&client->dev);
  1045		media_entity_cleanup(&imx471->sd.entity);
  1046	
  1047	error_handler_free:
  1048		v4l2_ctrl_handler_free(imx471->sd.ctrl_handler);
  1049	
  1050	error_probe:
  1051		mutex_destroy(&imx471->mutex);
  1052	
> 1053	error_power_off:
  1054		imx471_power_off(&client->dev);
  1055	
  1056		return ret;
  1057	}
  1058	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
