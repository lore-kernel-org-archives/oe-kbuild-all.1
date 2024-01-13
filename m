Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0736515E94
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jan 2024 23:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V+GctfwW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705189076; x=1736725076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3bSmqbbO5bJrA07NY8sy+Rx66Pvfp+J9m5UNxXbirXw=;
  b=V+GctfwWEpTEhWhO5reN/5vaaDDR5R5N+45AhhY9JW8HlcL8HqZlvC7K
   4hXGRaRHZIXOqD6pzwKVG9g/dCSpXcgwwyDBo9qIFqf9siGzVxZfbUY3n
   GTQxYGyJkxjf7AvIJDroiNspzJDESUTC2sA8ioH6HqKqtbQ2knPR+Oy4L
   /W8DCA1j/iZ4+nEfObUU3zUfk+6DxTjkC4V0SuHmW3VNctvYrSsyrgvVZ
   eX7sG+9WJ9TGiU8c1p4bwJwjKPi2FDXCv0z5H07Slo6Bd5vIxDJKIhqq5
   ImzuvjYMXhgtaefANA7R/0oxfM8T+S5OHZDndSsT9YrnBkhyqBPddN3eB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="12779684"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="12779684"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2024 15:37:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10952"; a="759489775"
X-IronPort-AV: E=Sophos;i="6.04,193,1695711600"; 
   d="scan'208";a="759489775"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Jan 2024 15:37:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rOnZX-000B0A-1Z;
	Sat, 13 Jan 2024 23:37:51 +0000
Date: Sun, 14 Jan 2024 07:37:24 +0800
From: kernel test robot <lkp@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sailus-next:pm 79/81] drivers/media/i2c/ov8858.c:1609:17: error:
 implicit declaration of function 'pm_runtime_put_mark_busy_autosusp'
Message-ID: <202401140757.P9LIKan3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sailus/linux-next.git pm
head:   5bb75cb2d48a92f1c8f460940912d6bd592cd819
commit: b00641637077b80332eb84e88f82e98728a3624d [79/81] media: ov8858: Use pm_runtime_get_if_active(), put usage_count correctly
config: i386-randconfig-011-20240114 (https://download.01.org/0day-ci/archive/20240114/202401140757.P9LIKan3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240114/202401140757.P9LIKan3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401140757.P9LIKan3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/i2c/ov8858.c: In function 'ov8858_set_ctrl':
>> drivers/media/i2c/ov8858.c:1609:17: error: implicit declaration of function 'pm_runtime_put_mark_busy_autosusp' [-Werror=implicit-function-declaration]
    1609 |                 pm_runtime_put_mark_busy_autosusp(&client->dev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/pm_runtime_put_mark_busy_autosusp +1609 drivers/media/i2c/ov8858.c

  1533	
  1534	static int ov8858_set_ctrl(struct v4l2_ctrl *ctrl)
  1535	{
  1536		struct ov8858 *ov8858 = container_of(ctrl->handler,
  1537						     struct ov8858, ctrl_handler);
  1538	
  1539		struct i2c_client *client = v4l2_get_subdevdata(&ov8858->subdev);
  1540		struct v4l2_mbus_framefmt *format;
  1541		struct v4l2_subdev_state *state;
  1542		u16 digi_gain;
  1543		s64 max_exp;
  1544		int ret, pm_status;
  1545	
  1546		/*
  1547		 * The control handler and the subdev state use the same mutex and the
  1548		 * mutex is guaranteed to be locked:
  1549		 * - by the core when s_ctrl is called int the VIDIOC_S_CTRL call path
  1550		 * - by the driver when s_ctrl is called in the s_stream(1) call path
  1551		 */
  1552		state = v4l2_subdev_get_locked_active_state(&ov8858->subdev);
  1553		format = v4l2_subdev_state_get_format(state, 0);
  1554	
  1555		/* Propagate change of current control to all related controls */
  1556		switch (ctrl->id) {
  1557		case V4L2_CID_VBLANK:
  1558			/* Update max exposure while meeting expected vblanking */
  1559			max_exp = format->height + ctrl->val - OV8858_EXPOSURE_MARGIN;
  1560			__v4l2_ctrl_modify_range(ov8858->exposure,
  1561						 ov8858->exposure->minimum, max_exp,
  1562						 ov8858->exposure->step,
  1563						 ov8858->exposure->default_value);
  1564			break;
  1565		}
  1566	
  1567		pm_status = pm_runtime_get_if_active(&client->dev);
  1568		if (!pm_status)
  1569			return 0;
  1570	
  1571		switch (ctrl->id) {
  1572		case V4L2_CID_EXPOSURE:
  1573			/* 4 least significant bits of exposure are fractional part */
  1574			ret = ov8858_write(ov8858, OV8858_REG_LONG_EXPO,
  1575					   ctrl->val << 4, NULL);
  1576			break;
  1577		case V4L2_CID_ANALOGUE_GAIN:
  1578			ret = ov8858_write(ov8858, OV8858_REG_LONG_GAIN,
  1579					   ctrl->val, NULL);
  1580			break;
  1581		case V4L2_CID_DIGITAL_GAIN:
  1582			/*
  1583			 * Digital gain is assembled as:
  1584			 * 0x350a[7:0] = dgain[13:6]
  1585			 * 0x350b[5:0] = dgain[5:0]
  1586			 * Reassemble the control value to write it in one go.
  1587			 */
  1588			digi_gain = (ctrl->val & OV8858_LONG_DIGIGAIN_L_MASK)
  1589				  | ((ctrl->val & OV8858_LONG_DIGIGAIN_H_MASK) <<
  1590				      OV8858_LONG_DIGIGAIN_H_SHIFT);
  1591			ret = ov8858_write(ov8858, OV8858_REG_LONG_DIGIGAIN,
  1592					   digi_gain, NULL);
  1593			break;
  1594		case V4L2_CID_VBLANK:
  1595			ret = ov8858_write(ov8858, OV8858_REG_VTS,
  1596					   ctrl->val + format->height, NULL);
  1597			break;
  1598		case V4L2_CID_TEST_PATTERN:
  1599			ret = ov8858_enable_test_pattern(ov8858, ctrl->val);
  1600			break;
  1601		default:
  1602			ret = -EINVAL;
  1603			dev_warn(&client->dev, "%s Unhandled id: 0x%x\n",
  1604				 __func__, ctrl->id);
  1605			break;
  1606		}
  1607	
  1608		if (pm_status > 0)
> 1609			pm_runtime_put_mark_busy_autosusp(&client->dev);
  1610	
  1611		return ret;
  1612	}
  1613	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
