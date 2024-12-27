Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268C31F868A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 17:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735319951; cv=none; b=Mh+ob7VLdZlVZOy1bLYQOTqErDkeifglhZuQbK4csLUWfFPzAXWAChHWD0qEna6Vj4T+Xs1daEJq52OplL3Rotbi7xxy6YRups9Ct5Vp7TzR8Qd6wXRm+4mlPugYUNuQ+X689dl9FeU54Sti37VtmH5ytArozHq1OtOU26Prg2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735319951; c=relaxed/simple;
	bh=CBDE8txF1/wkDPS0b4W4U1BCRDMb2P69d3Q1by6OWms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LHR8FC5HZkCtZzptwBvIbDVRg7PWW2/X8te8K076SqOGQIaAI4xavjKqIAtRNSqABWc/M66g50TZT9oAyzQwjwmKniFjy5xCWpdVWZyxYZm+JGuYUT/sJOKCyHzCG85R0fmdbI3OQAakrrn+S8AJH86ieVHp/tspVgBUTgEv9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UalE1TQC; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UalE1TQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735319949; x=1766855949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CBDE8txF1/wkDPS0b4W4U1BCRDMb2P69d3Q1by6OWms=;
  b=UalE1TQCm06BqLMJVFpfTtHs2KyK3JeVVsj8t7t5ZO6KGycLeqPZjq3I
   jHN2Ssd9HwKhGFk+FhSbyIN3+Xg+on7Ftb2ihb/sSMyw7wkRpVyf4CNnC
   +Fh6x8xHZ03fUDR2mkeFtGUhjOoG38xoJyJlAqv/YiHFb4hBFkqrux2KT
   5LZhiICWhWo2FOAExTormai1uBbpcCNvbWVT2BbDN8MZmaJ+UW9Uce65x
   xpssGuZVouh3VhQt4WJwCqR9+tPpRXHKUamlpzp6PnG4FnsAxWbqvC3SS
   cGNjCSP42ax5AfA4I2Y73OX3lDNV0Y6yQI4fa2nbh9R06vpwgFXgRpVJE
   g==;
X-CSE-ConnectionGUID: 2Wx842aXReiTMhbvoi7jQg==
X-CSE-MsgGUID: AJ/vi49wQ36TfslGimu6AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35837319"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35837319"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 09:19:08 -0800
X-CSE-ConnectionGUID: 68fA1uL/TFCGbdhSo/s+vQ==
X-CSE-MsgGUID: IU2ZWnwjQCisMYMdtbwIew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101040328"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2024 09:19:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRDzN-0003NA-0P;
	Fri, 27 Dec 2024 17:19:05 +0000
Date: Sat, 28 Dec 2024 01:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, ranjan-dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:6.6/preempt-rt 3/3] drivers/media/i2c/lt6911uxc.c:715:13:
 warning: variable 'hblank' set but not used
Message-ID: <202412280340.vrXOIJVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: e986ee1ba98444c2b97240478a5b1dda508e0b35 [3/3] add ipu driver for kernel 6.6
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412280340.vrXOIJVI-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280340.vrXOIJVI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280340.vrXOIJVI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/lt6911uxc.c: In function 'lt6911uxc_init_controls':
>> drivers/media/i2c/lt6911uxc.c:715:13: warning: variable 'hblank' set but not used [-Wunused-but-set-variable]
     715 |         s64 hblank;
         |             ^~~~~~
   drivers/media/i2c/lt6911uxc.c: At top level:
   drivers/media/i2c/lt6911uxc.c:1078:27: warning: initialized field overwritten [-Woverride-init]
    1078 |         .s_stream       = lt6911uxc_set_stream,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxc.c:1078:27: note: (near initialization for 'lt6911uxc_video_ops.s_stream')
   drivers/media/i2c/lt6911uxc.c:1547:10: error: 'struct i2c_driver' has no member named 'probe_new'
    1547 |         .probe_new = lt6911uxc_probe,
         |          ^~~~~~~~~
   drivers/media/i2c/lt6911uxc.c:1547:22: error: initialization of 'const struct i2c_device_id *' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
    1547 |         .probe_new = lt6911uxc_probe,
         |                      ^~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxc.c:1547:22: note: (near initialization for 'lt6911uxc_i2c_driver.id_table')
   drivers/media/i2c/lt6911uxc.c:1549:21: warning: initialized field overwritten [-Woverride-init]
    1549 |         .id_table = lt6911uxc_id_table,
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxc.c:1549:21: note: (near initialization for 'lt6911uxc_i2c_driver.id_table')
>> drivers/media/i2c/lt6911uxc.c:1502:12: warning: 'lt6911uxc_resume' defined but not used [-Wunused-function]
    1502 | static int lt6911uxc_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/media/i2c/lt6911uxc.c:1483:12: warning: 'lt6911uxc_suspend' defined but not used [-Wunused-function]
    1483 | static int lt6911uxc_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~
--
   drivers/media/i2c/lt6911uxe.c: In function 'lt6911uxe_init_controls':
>> drivers/media/i2c/lt6911uxe.c:727:13: warning: variable 'hblank' set but not used [-Wunused-but-set-variable]
     727 |         s64 hblank;
         |             ^~~~~~
   drivers/media/i2c/lt6911uxe.c: At top level:
   drivers/media/i2c/lt6911uxe.c:1091:27: warning: initialized field overwritten [-Woverride-init]
    1091 |         .s_stream       = lt6911uxe_set_stream,
         |                           ^~~~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxe.c:1091:27: note: (near initialization for 'lt6911uxe_video_ops.s_stream')
   drivers/media/i2c/lt6911uxe.c: In function 'lt6911uxe_video_status_update':
>> drivers/media/i2c/lt6911uxe.c:1152:25: warning: variable 'format' set but not used [-Wunused-but-set-variable]
    1152 |         u32 width2 = 0, format = 0;
         |                         ^~~~~~
   drivers/media/i2c/lt6911uxe.c: At top level:
   drivers/media/i2c/lt6911uxe.c:1574:10: error: 'struct i2c_driver' has no member named 'probe_new'
    1574 |         .probe_new = lt6911uxe_probe,
         |          ^~~~~~~~~
   drivers/media/i2c/lt6911uxe.c:1574:22: error: initialization of 'const struct i2c_device_id *' from incompatible pointer type 'int (*)(struct i2c_client *)' [-Wincompatible-pointer-types]
    1574 |         .probe_new = lt6911uxe_probe,
         |                      ^~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxe.c:1574:22: note: (near initialization for 'lt6911uxe_i2c_driver.id_table')
   drivers/media/i2c/lt6911uxe.c:1576:21: warning: initialized field overwritten [-Woverride-init]
    1576 |         .id_table = lt6911uxe_id_table,
         |                     ^~~~~~~~~~~~~~~~~~
   drivers/media/i2c/lt6911uxe.c:1576:21: note: (near initialization for 'lt6911uxe_i2c_driver.id_table')
>> drivers/media/i2c/lt6911uxe.c:1529:12: warning: 'lt6911uxe_resume' defined but not used [-Wunused-function]
    1529 | static int lt6911uxe_resume(struct device *dev)
         |            ^~~~~~~~~~~~~~~~
>> drivers/media/i2c/lt6911uxe.c:1510:12: warning: 'lt6911uxe_suspend' defined but not used [-Wunused-function]
    1510 | static int lt6911uxe_suspend(struct device *dev)
         |            ^~~~~~~~~~~~~~~~~


vim +/hblank +715 drivers/media/i2c/lt6911uxc.c

   710	
   711	static int lt6911uxc_init_controls(struct lt6911uxc_state *lt6911uxc)
   712	{
   713		struct i2c_client *client = v4l2_get_subdevdata(&lt6911uxc->sd);
   714		struct v4l2_ctrl_handler *ctrl_hdlr;
 > 715		s64 hblank;
   716		int ret;
   717	
   718		ctrl_hdlr = &lt6911uxc->ctrl_handler;
   719		ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
   720		if (ret)
   721			return ret;
   722	
   723		ctrl_hdlr->lock = &lt6911uxc->mutex;
   724		lt6911uxc->link_freq =
   725			v4l2_ctrl_new_int_menu(ctrl_hdlr,
   726				&lt6911uxc_ctrl_ops,
   727				V4L2_CID_LINK_FREQ,
   728				sizeof(lt6911uxc->cur_mode->pixel_clk),
   729				0, &lt6911uxc->cur_mode->pixel_clk);
   730		if (ctrl_hdlr->error) {
   731			dev_dbg(&client->dev, "Set link_freq ctrl_hdlr, err=%d.\n",
   732				ctrl_hdlr->error);
   733			return ctrl_hdlr->error;
   734		}
   735		if (lt6911uxc->link_freq)
   736			lt6911uxc->link_freq->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   737	
   738		lt6911uxc->vblank = v4l2_ctrl_new_std(ctrl_hdlr,
   739					&lt6911uxc_ctrl_ops,
   740					V4L2_CID_VBLANK, 0, 1, 1, 1);
   741		if (ctrl_hdlr->error) {
   742			dev_dbg(&client->dev, "Set vblank ctrl_hdlr, err=%d.\n",
   743				ctrl_hdlr->error);
   744			return ctrl_hdlr->error;
   745		}
   746	
   747		lt6911uxc->analogue_gain = v4l2_ctrl_new_std(ctrl_hdlr,
   748				&lt6911uxc_ctrl_ops,
   749				V4L2_CID_ANALOGUE_GAIN, 0, 1, 1, 1);
   750		if (ctrl_hdlr->error) {
   751			dev_dbg(&client->dev, "Set analogue_gain ctrl_hdlr, err=%d.\n",
   752				ctrl_hdlr->error);
   753			return ctrl_hdlr->error;
   754		}
   755	
   756		lt6911uxc->digital_gain = v4l2_ctrl_new_std(ctrl_hdlr,
   757				&lt6911uxc_ctrl_ops,
   758				V4L2_CID_DIGITAL_GAIN,	0, 1, 1, 1);
   759		if (ctrl_hdlr->error) {
   760			dev_dbg(&client->dev, "Set digital_gain ctrl_hdlr, err=%d.\n",
   761				ctrl_hdlr->error);
   762			return ctrl_hdlr->error;
   763		}
   764	
   765		lt6911uxc->exposure = v4l2_ctrl_new_std(ctrl_hdlr,
   766					&lt6911uxc_ctrl_ops,
   767					V4L2_CID_EXPOSURE, 0, 1, 1, 1);
   768		if (ctrl_hdlr->error) {
   769			dev_dbg(&client->dev, "Set exposure ctrl_hdlr, err=%d.\n",
   770				ctrl_hdlr->error);
   771			return ctrl_hdlr->error;
   772		}
   773		lt6911uxc_csi_port.def = lt6911uxc->platform_data->port;
   774		lt6911uxc->csi_port =
   775			v4l2_ctrl_new_custom(ctrl_hdlr, &lt6911uxc_csi_port, NULL);
   776		if (ctrl_hdlr->error) {
   777			dev_dbg(&client->dev, "Set csi_port ctrl_hdlr, err=%d.\n",
   778				ctrl_hdlr->error);
   779			return ctrl_hdlr->error;
   780		}
   781	
   782		lt6911uxc_i2c_bus.def = i2c_adapter_id(client->adapter);
   783		lt6911uxc->i2c_bus =
   784			v4l2_ctrl_new_custom(ctrl_hdlr, &lt6911uxc_i2c_bus, NULL);
   785		if (ctrl_hdlr->error) {
   786			dev_dbg(&client->dev, "Set i2c_bus ctrl_hdlr, err=%d.\n",
   787				ctrl_hdlr->error);
   788			return ctrl_hdlr->error;
   789		}
   790	
   791		lt6911uxc_i2c_id.def = client->addr;
   792		lt6911uxc->i2c_id = v4l2_ctrl_new_custom(ctrl_hdlr,
   793					&lt6911uxc_i2c_id, NULL);
   794		if (ctrl_hdlr->error) {
   795			dev_dbg(&client->dev, "Set i2c_id ctrl_hdlr, err=%d.\n",
   796				ctrl_hdlr->error);
   797			return ctrl_hdlr->error;
   798		}
   799	
   800		lt6911uxc_i2c_slave_address.def =
   801			lt6911uxc->platform_data->i2c_slave_address;
   802		lt6911uxc->i2c_slave_address = v4l2_ctrl_new_custom(ctrl_hdlr,
   803						&lt6911uxc_i2c_slave_address, NULL);
   804		if (ctrl_hdlr->error) {
   805			dev_dbg(&client->dev, "Set i2c_slave_address ctrl_hdlr, err=%d.\n",
   806				ctrl_hdlr->error);
   807			return ctrl_hdlr->error;
   808		}
   809	
   810		lt6911uxc_fps.def = lt6911uxc->cur_mode->fps;
   811		lt6911uxc->fps = v4l2_ctrl_new_custom(ctrl_hdlr, &lt6911uxc_fps, NULL);
   812		if (ctrl_hdlr->error) {
   813			dev_dbg(&client->dev, "Set fps ctrl_hdlr, err=%d.\n",
   814				ctrl_hdlr->error);
   815			return ctrl_hdlr->error;
   816		}
   817	
   818		if (lt6911uxc->cur_mode->fps)
   819			lt6911uxc_frame_interval.def = 1000 / lt6911uxc->cur_mode->fps;
   820		else
   821			lt6911uxc_frame_interval.def = 33;
   822	
   823		lt6911uxc->frame_interval = v4l2_ctrl_new_custom(ctrl_hdlr,
   824						&lt6911uxc_frame_interval, NULL);
   825		if (ctrl_hdlr->error) {
   826			dev_dbg(&client->dev, "Set frame_interval ctrl_hdlr, err=%d.\n",
   827				ctrl_hdlr->error);
   828			return ctrl_hdlr->error;
   829		}
   830	
   831		lt6911uxc->pixel_rate = v4l2_ctrl_new_std(ctrl_hdlr,
   832					&lt6911uxc_ctrl_ops,
   833					V4L2_CID_PIXEL_RATE,
   834					get_pixel_rate(lt6911uxc),
   835					get_pixel_rate(lt6911uxc), 1,
   836					get_pixel_rate(lt6911uxc));
   837		if (ctrl_hdlr->error) {
   838			dev_dbg(&client->dev, "Set pixel_rate ctrl_hdlr, err=%d.\n",
   839				ctrl_hdlr->error);
   840			return ctrl_hdlr->error;
   841		}
   842		if (lt6911uxc->pixel_rate)
   843			lt6911uxc->pixel_rate->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   844	
   845		hblank = 1;
   846		lt6911uxc->hblank = v4l2_ctrl_new_std(ctrl_hdlr,
   847					&lt6911uxc_ctrl_ops,
   848					V4L2_CID_HBLANK, 0, 1, 1, 1);
   849		if (ctrl_hdlr->error) {
   850			dev_dbg(&client->dev, "Set hblank ctrl_hdlr, err=%d.\n",
   851				ctrl_hdlr->error);
   852			return ctrl_hdlr->error;
   853		}
   854		if (lt6911uxc->hblank)
   855			lt6911uxc->hblank->flags |= V4L2_CTRL_FLAG_READ_ONLY;
   856	
   857		/* custom v4l2 audio controls */
   858		lt6911uxc->audio_sampling_rate_ctrl = v4l2_ctrl_new_custom(
   859			ctrl_hdlr, &lt6911uxc_ctrl_audio_sampling_rate, NULL);
   860		if (ctrl_hdlr->error) {
   861			dev_dbg(&client->dev, "Set audio sampling rate ctrl, err=%d.\n",
   862				 ctrl_hdlr->error);
   863			return ctrl_hdlr->error;
   864		}
   865		lt6911uxc->audio_present_ctrl = v4l2_ctrl_new_custom(ctrl_hdlr,
   866			&lt6911uxc_ctrl_audio_present, NULL);
   867		if (ctrl_hdlr->error) {
   868			dev_dbg(&client->dev, "Set audio present ctrl, error = %d.\n",
   869				ctrl_hdlr->error);
   870			return ctrl_hdlr->error;
   871		}
   872	
   873		lt6911uxc->sd.ctrl_handler = ctrl_hdlr;
   874		return 0;
   875	}
   876	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
