Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82467481D8
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Apr 2024 18:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712428910; cv=none; b=OLkDhtq11ig0GvHaYE1vxHvvTtWvo9KLGhEW/55gY0rUEko+CkK7qV6mpKVcESRsfT+kYDYFerMy/v/ZBIiLAaRXHP60NxYkAdacD7lF1cQkP9TisRQxW9WDtMGfJhC1Uj1976mx/+aZWatRFX3rnzQ4xxsYyiRNs1WpUoyOld4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712428910; c=relaxed/simple;
	bh=TMOn2dlolFyDgiEyIRzff+1nA0d16ibm2pGyyXxvgjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LSOm11MDPJkDniNynpEClQPzXuLQOTH+qFY7hCSwLPxsNsFqfvi1ChWRDZL199mO8yZeuy/u6vkICKOE1wHjkxfD2fDX3aQILSlx9S8vvRbVEaMLOhhXi0kcmZO1Z9NhVe7rM/IJuy0M7ye27JBRNLAAsDZHcBd+hmwocNh9kXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IfMOKhnj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IfMOKhnj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712428908; x=1743964908;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TMOn2dlolFyDgiEyIRzff+1nA0d16ibm2pGyyXxvgjQ=;
  b=IfMOKhnj2NQ5N3ErSYPp4dKM20HuDe0Dvs/wC3fjgKt3QbKLB8iXY5oN
   UkCevAqMLy3kXjfI88hGHF6A0QwzeKpIT47hxRM0bAeppm87upgd8tePe
   IfPd+EF/FTlmFOTrc5tOkIlhCheCIBlg8duAyU78KRZyu3BbZ1xsXuTlt
   oGlUi2+XOew2LqKW5+0C2EkSliol3h7/0bAukh5NoZh8QosCOBvoPu8Re
   WwAZvwYStcx9PQBDH2EwVxOpIaqm6aVf99QNRpcz5+30P5Y1vDa3smoET
   zpDS9zU3/OQCNxixiqEWJVN+aEtyPSrJpY4aKYfd3vl2z7vy3JOAOvxrd
   w==;
X-CSE-ConnectionGUID: dmx74oobRvmGWlEKbHsbsA==
X-CSE-MsgGUID: BIu4H5p4RXC6MW0D+RBmLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11036"; a="7973566"
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="7973566"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2024 11:41:47 -0700
X-CSE-ConnectionGUID: b2H/uLJeSJGK/TWU7qwLUA==
X-CSE-MsgGUID: l2qIdz39Q16Z9wUQQgYLaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,183,1708416000"; 
   d="scan'208";a="20013678"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2024 11:41:45 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtAz0-0003ld-1o;
	Sat, 06 Apr 2024 18:41:42 +0000
Date: Sun, 7 Apr 2024 02:41:09 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hverkuil-media-tree:vivid-cec 24/26]
 drivers/media/test-drivers/vivid/vivid-ctrls.c:1714:47: warning: ' Is
 Connected To' directive output may be truncated writing 16 bytes into a
 region of size between 7 and 22
Message-ID: <202404070239.R0dxfYgk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/hverkuil/media_tree.git vivid-cec
head:   643200db13214d729302f1c5b185c0c82595ad67
commit: e529848aba267b5910da63514c6a6992c9ae4171 [24/26] vivid: always use instance number in input/output names
config: arm-multi_v7_defconfig (https://download.01.org/0day-ci/archive/20240407/202404070239.R0dxfYgk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240407/202404070239.R0dxfYgk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404070239.R0dxfYgk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/test-drivers/vivid/vivid-ctrls.c: In function 'vivid_create_controls':
>> drivers/media/test-drivers/vivid/vivid-ctrls.c:1714:47: warning: ' Is Connected To' directive output may be truncated writing 16 bytes into a region of size between 7 and 22 [-Wformat-truncation=]
    1714 |                                  "HDMI %03u-%u Is Connected To", dev->inst, i);
         |                                               ^~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:1712:25: note: 'snprintf' output between 27 and 42 bytes into a destination of size 32
    1712 |                         snprintf(dev->ctrl_hdmi_to_output_names[i],
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1713 |                                  sizeof(dev->ctrl_hdmi_to_output_names[i]),
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1714 |                                  "HDMI %03u-%u Is Connected To", dev->inst, i);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:1733:50: warning: ' Is Connected To' directive output may be truncated writing 16 bytes into a region of size between 4 and 19 [-Wformat-truncation=]
    1733 |                                  "S-Video %03u-%u Is Connected To", dev->inst, i);
         |                                                  ^~~~~~~~~~~~~~~~
   drivers/media/test-drivers/vivid/vivid-ctrls.c:1731:25: note: 'snprintf' output between 30 and 45 bytes into a destination of size 32
    1731 |                         snprintf(dev->ctrl_svid_to_output_names[i],
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1732 |                                  sizeof(dev->ctrl_svid_to_output_names[i]),
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    1733 |                                  "S-Video %03u-%u Is Connected To", dev->inst, i);
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1714 drivers/media/test-drivers/vivid/vivid-ctrls.c

  1569	
  1570	int vivid_create_controls(struct vivid_dev *dev, bool show_ccs_cap,
  1571			bool show_ccs_out, bool no_error_inj,
  1572			bool has_sdtv, bool has_hdmi)
  1573	{
  1574		struct v4l2_ctrl_handler *hdl_user_gen = &dev->ctrl_hdl_user_gen;
  1575		struct v4l2_ctrl_handler *hdl_user_vid = &dev->ctrl_hdl_user_vid;
  1576		struct v4l2_ctrl_handler *hdl_user_aud = &dev->ctrl_hdl_user_aud;
  1577		struct v4l2_ctrl_handler *hdl_streaming = &dev->ctrl_hdl_streaming;
  1578		struct v4l2_ctrl_handler *hdl_sdtv_cap = &dev->ctrl_hdl_sdtv_cap;
  1579		struct v4l2_ctrl_handler *hdl_loop_cap = &dev->ctrl_hdl_loop_cap;
  1580		struct v4l2_ctrl_handler *hdl_fb = &dev->ctrl_hdl_fb;
  1581		struct v4l2_ctrl_handler *hdl_vid_cap = &dev->ctrl_hdl_vid_cap;
  1582		struct v4l2_ctrl_handler *hdl_vid_out = &dev->ctrl_hdl_vid_out;
  1583		struct v4l2_ctrl_handler *hdl_vbi_cap = &dev->ctrl_hdl_vbi_cap;
  1584		struct v4l2_ctrl_handler *hdl_vbi_out = &dev->ctrl_hdl_vbi_out;
  1585		struct v4l2_ctrl_handler *hdl_radio_rx = &dev->ctrl_hdl_radio_rx;
  1586		struct v4l2_ctrl_handler *hdl_radio_tx = &dev->ctrl_hdl_radio_tx;
  1587		struct v4l2_ctrl_handler *hdl_sdr_cap = &dev->ctrl_hdl_sdr_cap;
  1588		struct v4l2_ctrl_handler *hdl_meta_cap = &dev->ctrl_hdl_meta_cap;
  1589		struct v4l2_ctrl_handler *hdl_meta_out = &dev->ctrl_hdl_meta_out;
  1590		struct v4l2_ctrl_handler *hdl_tch_cap = &dev->ctrl_hdl_touch_cap;
  1591	
  1592		struct v4l2_ctrl_config vivid_ctrl_dv_timings = {
  1593			.ops = &vivid_vid_cap_ctrl_ops,
  1594			.id = VIVID_CID_DV_TIMINGS,
  1595			.name = "DV Timings",
  1596			.type = V4L2_CTRL_TYPE_MENU,
  1597		};
  1598		int i;
  1599	
  1600		v4l2_ctrl_handler_init(hdl_user_gen, 10);
  1601		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_class, NULL);
  1602		v4l2_ctrl_handler_init(hdl_user_vid, 9);
  1603		v4l2_ctrl_new_custom(hdl_user_vid, &vivid_ctrl_class, NULL);
  1604		v4l2_ctrl_handler_init(hdl_user_aud, 2);
  1605		v4l2_ctrl_new_custom(hdl_user_aud, &vivid_ctrl_class, NULL);
  1606		v4l2_ctrl_handler_init(hdl_streaming, 8);
  1607		v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_class, NULL);
  1608		v4l2_ctrl_handler_init(hdl_sdtv_cap, 2);
  1609		v4l2_ctrl_new_custom(hdl_sdtv_cap, &vivid_ctrl_class, NULL);
  1610		v4l2_ctrl_handler_init(hdl_loop_cap, 1);
  1611		v4l2_ctrl_new_custom(hdl_loop_cap, &vivid_ctrl_class, NULL);
  1612		v4l2_ctrl_handler_init(hdl_fb, 1);
  1613		v4l2_ctrl_new_custom(hdl_fb, &vivid_ctrl_class, NULL);
  1614		v4l2_ctrl_handler_init(hdl_vid_cap, 55);
  1615		v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_class, NULL);
  1616		v4l2_ctrl_handler_init(hdl_vid_out, 26);
  1617		if (!no_error_inj || dev->has_fb || dev->num_hdmi_outputs)
  1618			v4l2_ctrl_new_custom(hdl_vid_out, &vivid_ctrl_class, NULL);
  1619		v4l2_ctrl_handler_init(hdl_vbi_cap, 21);
  1620		v4l2_ctrl_new_custom(hdl_vbi_cap, &vivid_ctrl_class, NULL);
  1621		v4l2_ctrl_handler_init(hdl_vbi_out, 19);
  1622		if (!no_error_inj)
  1623			v4l2_ctrl_new_custom(hdl_vbi_out, &vivid_ctrl_class, NULL);
  1624		v4l2_ctrl_handler_init(hdl_radio_rx, 17);
  1625		v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_class, NULL);
  1626		v4l2_ctrl_handler_init(hdl_radio_tx, 17);
  1627		v4l2_ctrl_new_custom(hdl_radio_tx, &vivid_ctrl_class, NULL);
  1628		v4l2_ctrl_handler_init(hdl_sdr_cap, 19);
  1629		v4l2_ctrl_new_custom(hdl_sdr_cap, &vivid_ctrl_class, NULL);
  1630		v4l2_ctrl_handler_init(hdl_meta_cap, 2);
  1631		v4l2_ctrl_new_custom(hdl_meta_cap, &vivid_ctrl_class, NULL);
  1632		v4l2_ctrl_handler_init(hdl_meta_out, 2);
  1633		v4l2_ctrl_new_custom(hdl_meta_out, &vivid_ctrl_class, NULL);
  1634		v4l2_ctrl_handler_init(hdl_tch_cap, 2);
  1635		v4l2_ctrl_new_custom(hdl_tch_cap, &vivid_ctrl_class, NULL);
  1636	
  1637		/* User Controls */
  1638		dev->volume = v4l2_ctrl_new_std(hdl_user_aud, NULL,
  1639			V4L2_CID_AUDIO_VOLUME, 0, 255, 1, 200);
  1640		dev->mute = v4l2_ctrl_new_std(hdl_user_aud, NULL,
  1641			V4L2_CID_AUDIO_MUTE, 0, 1, 1, 0);
  1642		if (dev->has_vid_cap) {
  1643			dev->brightness = v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1644				V4L2_CID_BRIGHTNESS, 0, 255, 1, 128);
  1645			for (i = 0; i < MAX_INPUTS; i++)
  1646				dev->input_brightness[i] = 128;
  1647			dev->contrast = v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1648				V4L2_CID_CONTRAST, 0, 255, 1, 128);
  1649			dev->saturation = v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1650				V4L2_CID_SATURATION, 0, 255, 1, 128);
  1651			dev->hue = v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1652				V4L2_CID_HUE, -128, 128, 1, 0);
  1653			v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1654				V4L2_CID_HFLIP, 0, 1, 1, 0);
  1655			v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1656				V4L2_CID_VFLIP, 0, 1, 1, 0);
  1657			dev->autogain = v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1658				V4L2_CID_AUTOGAIN, 0, 1, 1, 1);
  1659			dev->gain = v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1660				V4L2_CID_GAIN, 0, 255, 1, 100);
  1661			dev->alpha = v4l2_ctrl_new_std(hdl_user_vid, &vivid_user_vid_ctrl_ops,
  1662				V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 0);
  1663		}
  1664		dev->button = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_button, NULL);
  1665		dev->int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int32, NULL);
  1666		dev->int64 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int64, NULL);
  1667		dev->boolean = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_boolean, NULL);
  1668		dev->menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_menu, NULL);
  1669		dev->string = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_string, NULL);
  1670		dev->bitmask = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_bitmask, NULL);
  1671		dev->int_menu = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_int_menu, NULL);
  1672		dev->ro_int32 = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_ro_int32, NULL);
  1673		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_area, NULL);
  1674		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_array, NULL);
  1675		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u32_dyn_array, NULL);
  1676		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u16_matrix, NULL);
  1677		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_4d_array, NULL);
  1678		dev->pixel_array = v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_u8_pixel_array, NULL);
  1679		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_s32_array, NULL);
  1680		v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_s64_array, NULL);
  1681	
  1682		if (dev->has_vid_cap) {
  1683			/* Image Processing Controls */
  1684			struct v4l2_ctrl_config vivid_ctrl_test_pattern = {
  1685				.ops = &vivid_vid_cap_ctrl_ops,
  1686				.id = VIVID_CID_TEST_PATTERN,
  1687				.name = "Test Pattern",
  1688				.type = V4L2_CTRL_TYPE_MENU,
  1689				.max = TPG_PAT_NOISE,
  1690				.qmenu = tpg_pattern_strings,
  1691			};
  1692	
  1693			dev->test_pattern = v4l2_ctrl_new_custom(hdl_vid_cap,
  1694					&vivid_ctrl_test_pattern, NULL);
  1695			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_perc_fill, NULL);
  1696			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_hor_movement, NULL);
  1697			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_vert_movement, NULL);
  1698			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_osd_mode, NULL);
  1699			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_show_border, NULL);
  1700			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_show_square, NULL);
  1701			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_hflip, NULL);
  1702			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_vflip, NULL);
  1703			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_sav, NULL);
  1704			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_eav, NULL);
  1705			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_insert_hdmi_video_guard_band, NULL);
  1706			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_reduced_fps, NULL);
  1707	
  1708			WARN_ON(dev->num_hdmi_inputs > MAX_HDMI_INPUTS);
  1709			WARN_ON(dev->num_svid_inputs > MAX_SVID_INPUTS);
  1710	
  1711			for (int i = 0; i < dev->num_hdmi_inputs; i++) {
  1712				snprintf(dev->ctrl_hdmi_to_output_names[i],
  1713					 sizeof(dev->ctrl_hdmi_to_output_names[i]),
> 1714					 "HDMI %03u-%u Is Connected To", dev->inst, i);
  1715			}
  1716	
  1717			for (int i = 0; i < dev->num_hdmi_inputs; i++) {
  1718				struct v4l2_ctrl_config ctrl_config = {
  1719					.ops = &vivid_vid_cap_ctrl_ops,
  1720					.id = VIVID_CID_HDMI_IS_CONNECTED_TO_OUTPUT(i),
  1721					.name = dev->ctrl_hdmi_to_output_names[i],
  1722					.type = V4L2_CTRL_TYPE_MENU,
  1723					.max = 1,
  1724					.qmenu = (const char * const *)vivid_ctrl_hdmi_to_output_strings,
  1725				};
  1726				dev->ctrl_hdmi_to_output[i] = v4l2_ctrl_new_custom(hdl_vid_cap,
  1727										   &ctrl_config, NULL);
  1728			}
  1729	
  1730			for (int i = 0; i < dev->num_svid_inputs; i++) {
  1731				snprintf(dev->ctrl_svid_to_output_names[i],
  1732					 sizeof(dev->ctrl_svid_to_output_names[i]),
  1733					 "S-Video %03u-%u Is Connected To", dev->inst, i);
  1734			}
  1735	
  1736			for (int i = 0; i < dev->num_svid_inputs; i++) {
  1737				struct v4l2_ctrl_config ctrl_config = {
  1738					.ops = &vivid_vid_cap_ctrl_ops,
  1739					.id = VIVID_CID_SVID_IS_CONNECTED_TO_OUTPUT(i),
  1740					.name = dev->ctrl_svid_to_output_names[i],
  1741					.type = V4L2_CTRL_TYPE_MENU,
  1742					.max = 1,
  1743					.qmenu = (const char * const *)vivid_ctrl_svid_to_output_strings,
  1744				};
  1745				dev->ctrl_svid_to_output[i] = v4l2_ctrl_new_custom(hdl_vid_cap,
  1746										   &ctrl_config, NULL);
  1747			}
  1748	
  1749			if (show_ccs_cap) {
  1750				dev->ctrl_has_crop_cap = v4l2_ctrl_new_custom(hdl_vid_cap,
  1751					&vivid_ctrl_has_crop_cap, NULL);
  1752				dev->ctrl_has_compose_cap = v4l2_ctrl_new_custom(hdl_vid_cap,
  1753					&vivid_ctrl_has_compose_cap, NULL);
  1754				dev->ctrl_has_scaler_cap = v4l2_ctrl_new_custom(hdl_vid_cap,
  1755					&vivid_ctrl_has_scaler_cap, NULL);
  1756			}
  1757	
  1758			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_tstamp_src, NULL);
  1759			dev->colorspace = v4l2_ctrl_new_custom(hdl_vid_cap,
  1760				&vivid_ctrl_colorspace, NULL);
  1761			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_xfer_func, NULL);
  1762			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_ycbcr_enc, NULL);
  1763			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_hsv_enc, NULL);
  1764			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_quantization, NULL);
  1765			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_alpha_mode, NULL);
  1766		}
  1767	
  1768		if (dev->has_vid_out && show_ccs_out) {
  1769			dev->ctrl_has_crop_out = v4l2_ctrl_new_custom(hdl_vid_out,
  1770				&vivid_ctrl_has_crop_out, NULL);
  1771			dev->ctrl_has_compose_out = v4l2_ctrl_new_custom(hdl_vid_out,
  1772				&vivid_ctrl_has_compose_out, NULL);
  1773			dev->ctrl_has_scaler_out = v4l2_ctrl_new_custom(hdl_vid_out,
  1774				&vivid_ctrl_has_scaler_out, NULL);
  1775		}
  1776	
  1777		/*
  1778		 * Testing this driver with v4l2-compliance will trigger the error
  1779		 * injection controls, and after that nothing will work as expected.
  1780		 * So we have a module option to drop these error injecting controls
  1781		 * allowing us to run v4l2_compliance again.
  1782		 */
  1783		if (!no_error_inj) {
  1784			v4l2_ctrl_new_custom(hdl_user_gen, &vivid_ctrl_disconnect, NULL);
  1785			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_dqbuf_error, NULL);
  1786			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_perc_dropped, NULL);
  1787			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_queue_setup_error, NULL);
  1788			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_buf_prepare_error, NULL);
  1789			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_start_streaming_error, NULL);
  1790			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_queue_error, NULL);
  1791	#ifdef CONFIG_MEDIA_CONTROLLER
  1792			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_req_validate_error, NULL);
  1793	#endif
  1794			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_seq_wrap, NULL);
  1795			v4l2_ctrl_new_custom(hdl_streaming, &vivid_ctrl_time_wrap, NULL);
  1796		}
  1797	
  1798		if (has_sdtv && (dev->has_vid_cap || dev->has_vbi_cap)) {
  1799			if (dev->has_vid_cap)
  1800				v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_std_aspect_ratio, NULL);
  1801			dev->ctrl_std_signal_mode = v4l2_ctrl_new_custom(hdl_sdtv_cap,
  1802				&vivid_ctrl_std_signal_mode, NULL);
  1803			dev->ctrl_standard = v4l2_ctrl_new_custom(hdl_sdtv_cap,
  1804				&vivid_ctrl_standard, NULL);
  1805			if (dev->ctrl_std_signal_mode)
  1806				v4l2_ctrl_cluster(2, &dev->ctrl_std_signal_mode);
  1807			if (dev->has_raw_vbi_cap)
  1808				v4l2_ctrl_new_custom(hdl_vbi_cap, &vivid_ctrl_vbi_cap_interlaced, NULL);
  1809		}
  1810	
  1811		if (dev->num_hdmi_inputs) {
  1812			s64 hdmi_input_mask = GENMASK(dev->num_hdmi_inputs - 1, 0);
  1813	
  1814			dev->ctrl_dv_timings_signal_mode = v4l2_ctrl_new_custom(hdl_vid_cap,
  1815						&vivid_ctrl_dv_timings_signal_mode, NULL);
  1816	
  1817			vivid_ctrl_dv_timings.max = dev->query_dv_timings_size - 1;
  1818			vivid_ctrl_dv_timings.qmenu =
  1819				(const char * const *)dev->query_dv_timings_qmenu;
  1820			dev->ctrl_dv_timings = v4l2_ctrl_new_custom(hdl_vid_cap,
  1821				&vivid_ctrl_dv_timings, NULL);
  1822			if (dev->ctrl_dv_timings_signal_mode)
  1823				v4l2_ctrl_cluster(2, &dev->ctrl_dv_timings_signal_mode);
  1824	
  1825			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_dv_timings_aspect_ratio, NULL);
  1826			v4l2_ctrl_new_custom(hdl_vid_cap, &vivid_ctrl_max_edid_blocks, NULL);
  1827			dev->real_rgb_range_cap = v4l2_ctrl_new_custom(hdl_vid_cap,
  1828				&vivid_ctrl_limited_rgb_range, NULL);
  1829			dev->rgb_range_cap = v4l2_ctrl_new_std_menu(hdl_vid_cap,
  1830				&vivid_vid_cap_ctrl_ops,
  1831				V4L2_CID_DV_RX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
  1832				0, V4L2_DV_RGB_RANGE_AUTO);
  1833			dev->ctrl_rx_power_present = v4l2_ctrl_new_std(hdl_vid_cap,
  1834				NULL, V4L2_CID_DV_RX_POWER_PRESENT, 0, hdmi_input_mask,
  1835				0, hdmi_input_mask);
  1836	
  1837		}
  1838		if (dev->num_hdmi_outputs) {
  1839			s64 hdmi_output_mask = GENMASK(dev->num_hdmi_outputs - 1, 0);
  1840	
  1841			/*
  1842			 * We aren't doing anything with this at the moment, but
  1843			 * HDMI outputs typically have this controls.
  1844			 */
  1845			dev->ctrl_tx_rgb_range = v4l2_ctrl_new_std_menu(hdl_vid_out, NULL,
  1846				V4L2_CID_DV_TX_RGB_RANGE, V4L2_DV_RGB_RANGE_FULL,
  1847				0, V4L2_DV_RGB_RANGE_AUTO);
  1848			dev->ctrl_tx_mode = v4l2_ctrl_new_std_menu(hdl_vid_out, NULL,
  1849				V4L2_CID_DV_TX_MODE, V4L2_DV_TX_MODE_HDMI,
  1850				0, V4L2_DV_TX_MODE_HDMI);
  1851			dev->ctrl_tx_hotplug = v4l2_ctrl_new_std(hdl_vid_out,
  1852				NULL, V4L2_CID_DV_TX_HOTPLUG, 0, hdmi_output_mask,
  1853				0, hdmi_output_mask);
  1854			dev->ctrl_tx_rxsense = v4l2_ctrl_new_std(hdl_vid_out,
  1855				NULL, V4L2_CID_DV_TX_RXSENSE, 0, hdmi_output_mask,
  1856				0, hdmi_output_mask);
  1857			dev->ctrl_tx_edid_present = v4l2_ctrl_new_std(hdl_vid_out,
  1858				NULL, V4L2_CID_DV_TX_EDID_PRESENT, 0, hdmi_output_mask,
  1859				0, hdmi_output_mask);
  1860		}
  1861	
  1862		if (dev->has_fb)
  1863			v4l2_ctrl_new_custom(hdl_fb, &vivid_ctrl_clear_fb, NULL);
  1864	
  1865		if (dev->has_radio_rx) {
  1866			v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_hw_seek_mode, NULL);
  1867			v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_hw_seek_prog_lim, NULL);
  1868			v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_rx_rds_blockio, NULL);
  1869			v4l2_ctrl_new_custom(hdl_radio_rx, &vivid_ctrl_radio_rx_rds_rbds, NULL);
  1870			v4l2_ctrl_new_std(hdl_radio_rx, &vivid_radio_rx_ctrl_ops,
  1871				V4L2_CID_RDS_RECEPTION, 0, 1, 1, 1);
  1872			dev->radio_rx_rds_pty = v4l2_ctrl_new_std(hdl_radio_rx,
  1873				&vivid_radio_rx_ctrl_ops,
  1874				V4L2_CID_RDS_RX_PTY, 0, 31, 1, 0);
  1875			dev->radio_rx_rds_psname = v4l2_ctrl_new_std(hdl_radio_rx,
  1876				&vivid_radio_rx_ctrl_ops,
  1877				V4L2_CID_RDS_RX_PS_NAME, 0, 8, 8, 0);
  1878			dev->radio_rx_rds_radiotext = v4l2_ctrl_new_std(hdl_radio_rx,
  1879				&vivid_radio_rx_ctrl_ops,
  1880				V4L2_CID_RDS_RX_RADIO_TEXT, 0, 64, 64, 0);
  1881			dev->radio_rx_rds_ta = v4l2_ctrl_new_std(hdl_radio_rx,
  1882				&vivid_radio_rx_ctrl_ops,
  1883				V4L2_CID_RDS_RX_TRAFFIC_ANNOUNCEMENT, 0, 1, 1, 0);
  1884			dev->radio_rx_rds_tp = v4l2_ctrl_new_std(hdl_radio_rx,
  1885				&vivid_radio_rx_ctrl_ops,
  1886				V4L2_CID_RDS_RX_TRAFFIC_PROGRAM, 0, 1, 1, 0);
  1887			dev->radio_rx_rds_ms = v4l2_ctrl_new_std(hdl_radio_rx,
  1888				&vivid_radio_rx_ctrl_ops,
  1889				V4L2_CID_RDS_RX_MUSIC_SPEECH, 0, 1, 1, 1);
  1890		}
  1891		if (dev->has_radio_tx) {
  1892			v4l2_ctrl_new_custom(hdl_radio_tx,
  1893				&vivid_ctrl_radio_tx_rds_blockio, NULL);
  1894			dev->radio_tx_rds_pi = v4l2_ctrl_new_std(hdl_radio_tx,
  1895				&vivid_radio_tx_ctrl_ops,
  1896				V4L2_CID_RDS_TX_PI, 0, 0xffff, 1, 0x8088);
  1897			dev->radio_tx_rds_pty = v4l2_ctrl_new_std(hdl_radio_tx,
  1898				&vivid_radio_tx_ctrl_ops,
  1899				V4L2_CID_RDS_TX_PTY, 0, 31, 1, 3);
  1900			dev->radio_tx_rds_psname = v4l2_ctrl_new_std(hdl_radio_tx,
  1901				&vivid_radio_tx_ctrl_ops,
  1902				V4L2_CID_RDS_TX_PS_NAME, 0, 8, 8, 0);
  1903			if (dev->radio_tx_rds_psname)
  1904				v4l2_ctrl_s_ctrl_string(dev->radio_tx_rds_psname, "VIVID-TX");
  1905			dev->radio_tx_rds_radiotext = v4l2_ctrl_new_std(hdl_radio_tx,
  1906				&vivid_radio_tx_ctrl_ops,
  1907				V4L2_CID_RDS_TX_RADIO_TEXT, 0, 64 * 2, 64, 0);
  1908			if (dev->radio_tx_rds_radiotext)
  1909				v4l2_ctrl_s_ctrl_string(dev->radio_tx_rds_radiotext,
  1910				       "This is a VIVID default Radio Text template text, change at will");
  1911			dev->radio_tx_rds_mono_stereo = v4l2_ctrl_new_std(hdl_radio_tx,
  1912				&vivid_radio_tx_ctrl_ops,
  1913				V4L2_CID_RDS_TX_MONO_STEREO, 0, 1, 1, 1);
  1914			dev->radio_tx_rds_art_head = v4l2_ctrl_new_std(hdl_radio_tx,
  1915				&vivid_radio_tx_ctrl_ops,
  1916				V4L2_CID_RDS_TX_ARTIFICIAL_HEAD, 0, 1, 1, 0);
  1917			dev->radio_tx_rds_compressed = v4l2_ctrl_new_std(hdl_radio_tx,
  1918				&vivid_radio_tx_ctrl_ops,
  1919				V4L2_CID_RDS_TX_COMPRESSED, 0, 1, 1, 0);
  1920			dev->radio_tx_rds_dyn_pty = v4l2_ctrl_new_std(hdl_radio_tx,
  1921				&vivid_radio_tx_ctrl_ops,
  1922				V4L2_CID_RDS_TX_DYNAMIC_PTY, 0, 1, 1, 0);
  1923			dev->radio_tx_rds_ta = v4l2_ctrl_new_std(hdl_radio_tx,
  1924				&vivid_radio_tx_ctrl_ops,
  1925				V4L2_CID_RDS_TX_TRAFFIC_ANNOUNCEMENT, 0, 1, 1, 0);
  1926			dev->radio_tx_rds_tp = v4l2_ctrl_new_std(hdl_radio_tx,
  1927				&vivid_radio_tx_ctrl_ops,
  1928				V4L2_CID_RDS_TX_TRAFFIC_PROGRAM, 0, 1, 1, 1);
  1929			dev->radio_tx_rds_ms = v4l2_ctrl_new_std(hdl_radio_tx,
  1930				&vivid_radio_tx_ctrl_ops,
  1931				V4L2_CID_RDS_TX_MUSIC_SPEECH, 0, 1, 1, 1);
  1932		}
  1933		if (dev->has_sdr_cap) {
  1934			v4l2_ctrl_new_custom(hdl_sdr_cap,
  1935				&vivid_ctrl_sdr_cap_fm_deviation, NULL);
  1936		}
  1937		if (dev->has_meta_cap) {
  1938			v4l2_ctrl_new_custom(hdl_meta_cap,
  1939					     &vivid_ctrl_meta_has_pts, NULL);
  1940			v4l2_ctrl_new_custom(hdl_meta_cap,
  1941					     &vivid_ctrl_meta_has_src_clk, NULL);
  1942		}
  1943	
  1944		if (hdl_user_gen->error)
  1945			return hdl_user_gen->error;
  1946		if (hdl_user_vid->error)
  1947			return hdl_user_vid->error;
  1948		if (hdl_user_aud->error)
  1949			return hdl_user_aud->error;
  1950		if (hdl_streaming->error)
  1951			return hdl_streaming->error;
  1952		if (hdl_sdr_cap->error)
  1953			return hdl_sdr_cap->error;
  1954		if (hdl_loop_cap->error)
  1955			return hdl_loop_cap->error;
  1956	
  1957		if (dev->autogain)
  1958			v4l2_ctrl_auto_cluster(2, &dev->autogain, 0, true);
  1959	
  1960		if (dev->has_vid_cap) {
  1961			v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_gen, NULL, false);
  1962			v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_vid, NULL, false);
  1963			v4l2_ctrl_add_handler(hdl_vid_cap, hdl_user_aud, NULL, false);
  1964			v4l2_ctrl_add_handler(hdl_vid_cap, hdl_streaming, NULL, false);
  1965			v4l2_ctrl_add_handler(hdl_vid_cap, hdl_sdtv_cap, NULL, false);
  1966			v4l2_ctrl_add_handler(hdl_vid_cap, hdl_loop_cap, NULL, false);
  1967			v4l2_ctrl_add_handler(hdl_vid_cap, hdl_fb, NULL, false);
  1968			if (hdl_vid_cap->error)
  1969				return hdl_vid_cap->error;
  1970			dev->vid_cap_dev.ctrl_handler = hdl_vid_cap;
  1971		}
  1972		if (dev->has_vid_out) {
  1973			v4l2_ctrl_add_handler(hdl_vid_out, hdl_user_gen, NULL, false);
  1974			v4l2_ctrl_add_handler(hdl_vid_out, hdl_user_aud, NULL, false);
  1975			v4l2_ctrl_add_handler(hdl_vid_out, hdl_streaming, NULL, false);
  1976			v4l2_ctrl_add_handler(hdl_vid_out, hdl_fb, NULL, false);
  1977			if (hdl_vid_out->error)
  1978				return hdl_vid_out->error;
  1979			dev->vid_out_dev.ctrl_handler = hdl_vid_out;
  1980		}
  1981		if (dev->has_vbi_cap) {
  1982			v4l2_ctrl_add_handler(hdl_vbi_cap, hdl_user_gen, NULL, false);
  1983			v4l2_ctrl_add_handler(hdl_vbi_cap, hdl_streaming, NULL, false);
  1984			v4l2_ctrl_add_handler(hdl_vbi_cap, hdl_sdtv_cap, NULL, false);
  1985			v4l2_ctrl_add_handler(hdl_vbi_cap, hdl_loop_cap, NULL, false);
  1986			if (hdl_vbi_cap->error)
  1987				return hdl_vbi_cap->error;
  1988			dev->vbi_cap_dev.ctrl_handler = hdl_vbi_cap;
  1989		}
  1990		if (dev->has_vbi_out) {
  1991			v4l2_ctrl_add_handler(hdl_vbi_out, hdl_user_gen, NULL, false);
  1992			v4l2_ctrl_add_handler(hdl_vbi_out, hdl_streaming, NULL, false);
  1993			if (hdl_vbi_out->error)
  1994				return hdl_vbi_out->error;
  1995			dev->vbi_out_dev.ctrl_handler = hdl_vbi_out;
  1996		}
  1997		if (dev->has_radio_rx) {
  1998			v4l2_ctrl_add_handler(hdl_radio_rx, hdl_user_gen, NULL, false);
  1999			v4l2_ctrl_add_handler(hdl_radio_rx, hdl_user_aud, NULL, false);
  2000			if (hdl_radio_rx->error)
  2001				return hdl_radio_rx->error;
  2002			dev->radio_rx_dev.ctrl_handler = hdl_radio_rx;
  2003		}
  2004		if (dev->has_radio_tx) {
  2005			v4l2_ctrl_add_handler(hdl_radio_tx, hdl_user_gen, NULL, false);
  2006			v4l2_ctrl_add_handler(hdl_radio_tx, hdl_user_aud, NULL, false);
  2007			if (hdl_radio_tx->error)
  2008				return hdl_radio_tx->error;
  2009			dev->radio_tx_dev.ctrl_handler = hdl_radio_tx;
  2010		}
  2011		if (dev->has_sdr_cap) {
  2012			v4l2_ctrl_add_handler(hdl_sdr_cap, hdl_user_gen, NULL, false);
  2013			v4l2_ctrl_add_handler(hdl_sdr_cap, hdl_streaming, NULL, false);
  2014			if (hdl_sdr_cap->error)
  2015				return hdl_sdr_cap->error;
  2016			dev->sdr_cap_dev.ctrl_handler = hdl_sdr_cap;
  2017		}
  2018		if (dev->has_meta_cap) {
  2019			v4l2_ctrl_add_handler(hdl_meta_cap, hdl_user_gen, NULL, false);
  2020			v4l2_ctrl_add_handler(hdl_meta_cap, hdl_streaming, NULL, false);
  2021			if (hdl_meta_cap->error)
  2022				return hdl_meta_cap->error;
  2023			dev->meta_cap_dev.ctrl_handler = hdl_meta_cap;
  2024		}
  2025		if (dev->has_meta_out) {
  2026			v4l2_ctrl_add_handler(hdl_meta_out, hdl_user_gen, NULL, false);
  2027			v4l2_ctrl_add_handler(hdl_meta_out, hdl_streaming, NULL, false);
  2028			if (hdl_meta_out->error)
  2029				return hdl_meta_out->error;
  2030			dev->meta_out_dev.ctrl_handler = hdl_meta_out;
  2031		}
  2032		if (dev->has_touch_cap) {
  2033			v4l2_ctrl_add_handler(hdl_tch_cap, hdl_user_gen, NULL, false);
  2034			v4l2_ctrl_add_handler(hdl_tch_cap, hdl_streaming, NULL, false);
  2035			if (hdl_tch_cap->error)
  2036				return hdl_tch_cap->error;
  2037			dev->touch_cap_dev.ctrl_handler = hdl_tch_cap;
  2038		}
  2039		return 0;
  2040	}
  2041	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
