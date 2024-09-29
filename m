Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054101F95A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727642055; cv=none; b=o86UJEe6L7358kSYSz0mX2xh47nvXsDstg+j8AjDMevH+mm6JbPr200VJwefJv3NmV02wGPrTHLVR3jY39GIoVVH5Xde32MjGPTaVY+d1UAE7sm3vvy08HjiOxzQ3dzBEsBtw2iszaT6cQQ0w4XtdxwL5/Ae6Dw5qWlGtFnUhHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727642055; c=relaxed/simple;
	bh=fFEMHwiQCU8QJ+jpRysoT5SqRww678hAxu1+YTEfIJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEZTu9LjBL3XPMwientTqPP5Ct01h7IMpDIqCN31efWMzhYCafMTA6sNBrkbhx7UsBo/OqOEE5cT7RAg0bqKnzJl9viRj9jvqVwE8Krk9Xk2wV/jdcSKfwEjR3pS5ChJce84kLRUbs5Z6FPmZcYhKXWO22nslRNl9V5zuUQgeA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XTP7u7xu; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XTP7u7xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727642053; x=1759178053;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fFEMHwiQCU8QJ+jpRysoT5SqRww678hAxu1+YTEfIJA=;
  b=XTP7u7xu9BBuRZaGLHPQhV7bADsa0/l49vyuTJ3PEt7BhAlA+Y6upg2D
   n7QovOibt3q3Nr+VSDiHqTuxMheZRw5fDPbhpgHHyBVichby/qMEmWh5R
   9tD7iA+CJ8HgkFRzVYWF7x4BjCXTwPnFQvqgNuH6ReEpGib0LMZ97A3wM
   twFOcM7dE+CMTw26RWBvtVY744Vtg0gRa28eZ2t7baSvWJJexOm0iWlSA
   Rx63Vp4ahviV+bEWrkr3cfq8l/aP2Oi0N7T0KhG+KfGVys5xw6XP9Hk8b
   nodw4k9scnG9zvugkIhj4T5/dGjxb+Cqb2drv2iWzxk6hBJ9yh9IjLlSd
   Q==;
X-CSE-ConnectionGUID: IOBmtqf6TZOxFlkE3WVDDg==
X-CSE-MsgGUID: SF407AsiTheGXcWSou4RVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="38080329"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="38080329"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 13:34:12 -0700
X-CSE-ConnectionGUID: TXTrVDB8QM+CuPd+K9yQ2g==
X-CSE-MsgGUID: dqIJUbcqQ0GBTYuIxGrAOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73064749"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 29 Sep 2024 13:34:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv0cL-000OgH-15;
	Sun, 29 Sep 2024 20:34:09 +0000
Date: Mon, 30 Sep 2024 04:33:35 +0800
From: kernel test robot <lkp@intel.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] media: i2c: Add AR0233 camera sensor driver
Message-ID: <202409300404.0UCHO6C6-lkp@intel.com>
References: <20240927133654.2389990-1-eagle.alexander923@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927133654.2389990-1-eagle.alexander923@gmail.com>

Hi Alexander,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on media-tree/master]
[also build test WARNING on linuxtv-media-stage/master sailus-media-tree/master linus/master v6.11 next-20240927]
[cannot apply to sailus-media-tree/streams]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Shiyan/media-i2c-Add-AR0233-camera-sensor-driver/20240927-213931
base:   git://linuxtv.org/media_tree.git master
patch link:    https://lore.kernel.org/r/20240927133654.2389990-1-eagle.alexander923%40gmail.com
patch subject: [RFC PATCH] media: i2c: Add AR0233 camera sensor driver
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20240930/202409300404.0UCHO6C6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300404.0UCHO6C6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300404.0UCHO6C6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ar0233.c: In function 'ar0233_s_ctrl':
>> drivers/media/i2c/ar0233.c:429:42: warning: variable 'info' set but not used [-Wunused-but-set-variable]
     429 |         const struct ar0233_format_info *info;
         |                                          ^~~~


vim +/info +429 drivers/media/i2c/ar0233.c

   423	
   424	static int ar0233_s_ctrl(struct v4l2_ctrl *ctrl)
   425	{
   426		struct ar0233 *sensor = container_of(ctrl->handler, struct ar0233, ctrls);
   427		const struct v4l2_subdev_state *state;
   428		const struct v4l2_mbus_framefmt *format;
 > 429		const struct ar0233_format_info *info;
   430		const struct v4l2_rect *crop;
   431		int ret = 0;
   432		u16 reg;
   433	
   434		/*
   435		 * Return immediately for controls that don't need to be applied to the
   436		 * device.
   437		 */
   438		if (ctrl->flags & (V4L2_CTRL_FLAG_READ_ONLY | V4L2_CTRL_FLAG_GRABBED))
   439			return 0;
   440	
   441		state = v4l2_subdev_get_locked_active_state(&sensor->sd);
   442		format = v4l2_subdev_state_get_format(state, 0);
   443		info = ar0233_format_info(sensor, format->code, true);
   444		crop = v4l2_subdev_state_get_crop(state, 0);
   445	
   446		switch (ctrl->id) {
   447		case V4L2_CID_VBLANK:
   448			ret = ar0233_update_exposure(sensor, crop);
   449			break;
   450		default:
   451			break;
   452		}
   453	
   454		if (ret)
   455			return ret;
   456	
   457		if (!pm_runtime_get_if_in_use(sensor->dev))
   458			return 0;
   459	
   460		switch (ctrl->id) {
   461		case V4L2_CID_ANALOGUE_GAIN:
   462			reg = ctrl->val << 12;
   463			reg |= ctrl->val << 8;
   464			reg |= ctrl->val << 4;
   465			reg |= ctrl->val << 0;
   466			cci_write(sensor->cci, AR0233_ANALOG_GAIN, reg, &ret);
   467			break;
   468		case V4L2_CID_DIGITAL_GAIN:
   469			cci_write(sensor->cci, AR0233_GLOBAL_GAIN, ctrl->val, &ret);
   470			break;
   471		case V4L2_CID_EXPOSURE:
   472			cci_write(sensor->cci, AR0233_COARSE_INTEGRATION_TIME,
   473				  ctrl->val, &ret);
   474			break;
   475		case V4L2_CID_HBLANK:
   476			cci_write(sensor->cci, AR0233_LINE_LENGTH_PCK,
   477				  crop->width + ctrl->val, &ret);
   478			break;
   479		case V4L2_CID_VBLANK:
   480			cci_write(sensor->cci, AR0233_FRAME_LENGTH_LINES,
   481				  crop->height + ctrl->val, &ret);
   482			break;
   483		case V4L2_CID_TEST_PATTERN:
   484			cci_write(sensor->cci, AR0233_TEST_PATTERN_MODE,
   485				  ar0233_test_pattern_values[ctrl->val], &ret);
   486			break;
   487		case V4L2_CID_TEST_PATTERN_RED:
   488		case V4L2_CID_TEST_PATTERN_GREENR:
   489		case V4L2_CID_TEST_PATTERN_BLUE:
   490		case V4L2_CID_TEST_PATTERN_GREENB:
   491			cci_write(sensor->cci, AR0233_GROUPED_PARAMETER_HOLD,
   492				  AR0233_RESET_REGISTER_GROUPED_PARAMETER_HOLD, &ret);
   493	
   494			cci_write(sensor->cci, AR0233_TEST_DATA_RED,
   495				  sensor->test_data[0]->val, &ret);
   496			cci_write(sensor->cci, AR0233_TEST_DATA_GREENR,
   497				  sensor->test_data[1]->val, &ret);
   498			cci_write(sensor->cci, AR0233_TEST_DATA_BLUE,
   499				  sensor->test_data[2]->val, &ret);
   500			cci_write(sensor->cci, AR0233_TEST_DATA_GREENB,
   501				  sensor->test_data[3]->val, &ret);
   502	
   503			cci_write(sensor->cci, AR0233_GROUPED_PARAMETER_HOLD,
   504				  0, &ret);
   505			break;
   506		case V4L2_CID_HFLIP:
   507		case V4L2_CID_VFLIP:
   508			reg = sensor->hflip->val ? AR0233_ORIENTATION_HORIZ_MIRROR : 0;
   509			reg |= sensor->vflip->val ? AR0233_ORIENTATION_VERT_FLIP : 0;
   510	
   511			cci_write(sensor->cci, AR0233_IMAGE_ORIENTATION, reg, &ret);
   512			break;
   513		default:
   514			ret = -EINVAL;
   515			break;
   516		}
   517	
   518		pm_runtime_put(sensor->dev);
   519	
   520		return ret;
   521	}
   522	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
