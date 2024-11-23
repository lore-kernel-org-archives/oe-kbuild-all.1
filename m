Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D075F39FF3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Nov 2024 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732374849; cv=none; b=M19whAOXTDjMT3zvSia05QsfkPP9+yApQbekS1CPZmwerP0d9Lq+hoF5rH2C+vUctjD5yC2GwHSPd4RhRXRkTIgy6V8QA2rAfe4yAg7FKcBZsXsjRKpMzIxsxFJffrH4TXcxivjbwFde09Id5/T82NtSZ10G9CmaJwdwjOrzUYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732374849; c=relaxed/simple;
	bh=da/bkPHoI8MXzRupw4rfdWa23xfhz6cbW6Dv2pppldA=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=BAdSFsiIN6E7lP6amSP7VsQu03c+Rb/1fSdG/+OxvqI4vgMP8J+2j1itBkOv48aCL1Pq6F+sr/cvBReNoKWnfEl/E9EaDUI/O2urvTyQFluFNT+C0fFdYZop4o15LcOZ6NSh15YVp86n95yc3aWR8ySYme8heR9c34W2vk3dTCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=Xp3/1gx2; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="Xp3/1gx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6dj2wTOWOcHOHbVXs+EPoIfefdxblMN8oAz4JaVacsw=;
  b=Xp3/1gx20OboVaLR2iaRxWikiU5iawvzOl/iItuUQ51qlgY/H8miupLS
   nqjeWXW4ZHhHqEqarryrRPFvaHkFJI0Frq4ihc7QJsuED7gzbGQ+2NIKv
   VVv82v10RSKmb1fM/aEFSkqdyuwgXs24LfLW5a2yQ+fiQGoiTRD4Tnb7g
   Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,179,1728943200"; 
   d="scan'208";a="195454772"
Received: from unknown (HELO hadrien) ([137.54.125.254])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2024 16:12:54 +0100
Date: Sat, 23 Nov 2024 10:12:53 -0500 (EST)
From: Julia Lawall <julia.lawall@inria.fr>
To: cros-kernel-buildreports@googlegroups.com
cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-f9d942cf7d57 80/1491]
 drivers/thermal/mediatek/soc_temp_lvts_mt8192.c:1020:5-11: WARNING: Unsigned
 expression compared with zero: offset < 0 (fwd)
Message-ID: <c3847f1-76c3-78b7-ffa0-ab8945c3e15@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Offset is unsigned so it cannot be less than 0.

julia

---------- Forwarded message ----------
Date: Fri, 22 Nov 2024 10:38:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:chromeos-6.6-f9d942cf7d57 80/1491]
    drivers/thermal/mediatek/soc_temp_lvts_mt8192.c:1020:5-11: WARNING: Unsigned
     expression compared with zero: offset < 0

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-f9d942cf7d57
head:   ef2c757e09b49fa8c905e77b7c1e55ccf2be08ee
commit: 41b0c432199119cb8102650729dd777ce54816a6 [80/1491] CHROMIUM: mt8195: backport legacy SOC_LVTS_TEMP as the out-of-tree driver
:::::: branch date: 8 weeks ago
:::::: commit date: 8 weeks ago
config: arm-randconfig-r061-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221018.m2HghjsA-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411221018.m2HghjsA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/thermal/mediatek/soc_temp_lvts_mt8192.c:1020:5-11: WARNING: Unsigned expression compared with zero: offset < 0

vim +1020 drivers/thermal/mediatek/soc_temp_lvts_mt8192.c

41b0c432199119 Wojciech Macek 2024-05-13   969
41b0c432199119 Wojciech Macek 2024-05-13   970  static int device_read_count_rc_n_v4(struct lvts_data *lvts_data)
41b0c432199119 Wojciech Macek 2024-05-13   971  {
41b0c432199119 Wojciech Macek 2024-05-13   972  	/* Resistor-Capacitor Calibration */
41b0c432199119 Wojciech Macek 2024-05-13   973  	/* count_RC_N: count RC now */
41b0c432199119 Wojciech Macek 2024-05-13   974  	struct device *dev = lvts_data->dev;
41b0c432199119 Wojciech Macek 2024-05-13   975  	struct tc_settings *tc = lvts_data->tc;
41b0c432199119 Wojciech Macek 2024-05-13   976  	struct sensor_cal_data *cal_data = &lvts_data->cal_data;
41b0c432199119 Wojciech Macek 2024-05-13   977  	unsigned int offset, size, s_index, data;
41b0c432199119 Wojciech Macek 2024-05-13   978  	void __iomem *base;
41b0c432199119 Wojciech Macek 2024-05-13   979  	int ret, i, j;
41b0c432199119 Wojciech Macek 2024-05-13   980  	char buffer[512];
41b0c432199119 Wojciech Macek 2024-05-13   981
41b0c432199119 Wojciech Macek 2024-05-13   982  	cal_data->count_rc_now = devm_kcalloc(dev, lvts_data->num_sensor,
41b0c432199119 Wojciech Macek 2024-05-13   983  					      sizeof(*cal_data->count_rc_now), GFP_KERNEL);
41b0c432199119 Wojciech Macek 2024-05-13   984  	if (!cal_data->count_rc_now)
41b0c432199119 Wojciech Macek 2024-05-13   985  		return -ENOMEM;
41b0c432199119 Wojciech Macek 2024-05-13   986
41b0c432199119 Wojciech Macek 2024-05-13   987  	for (i = 0; i < lvts_data->num_tc; i++) {
41b0c432199119 Wojciech Macek 2024-05-13   988  		base = GET_BASE_ADDR(i);
41b0c432199119 Wojciech Macek 2024-05-13   989  		for (j = 0; j < tc[i].num_sensor; j++) {
41b0c432199119 Wojciech Macek 2024-05-13   990  			s_index = tc[i].sensor_map[j];
41b0c432199119 Wojciech Macek 2024-05-13   991
41b0c432199119 Wojciech Macek 2024-05-13   992  			lvts_write_device(lvts_data, SELECT_SENSOR_RCK_V4(j), i);
41b0c432199119 Wojciech Macek 2024-05-13   993  			lvts_write_device(lvts_data, SET_DEVICE_SINGLE_MODE_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13   994  			usleep_range(10, 20);
41b0c432199119 Wojciech Macek 2024-05-13   995
41b0c432199119 Wojciech Macek 2024-05-13   996  			lvts_write_device(lvts_data, KICK_OFF_RCK_COUNTING_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13   997  			usleep_range(30, 40);
41b0c432199119 Wojciech Macek 2024-05-13   998
41b0c432199119 Wojciech Macek 2024-05-13   999  			ret = readl_poll_timeout(LVTS_CONFIG_0 + base, data,
41b0c432199119 Wojciech Macek 2024-05-13  1000  						 !(data & DEVICE_SENSING_STATUS), 2, 200);
41b0c432199119 Wojciech Macek 2024-05-13  1001  			if (ret)
41b0c432199119 Wojciech Macek 2024-05-13  1002  				dev_err(dev,
41b0c432199119 Wojciech Macek 2024-05-13  1003  					"Error: LVTS %d DEVICE_SENSING_STATUS didn't ready\n", i);
41b0c432199119 Wojciech Macek 2024-05-13  1004
41b0c432199119 Wojciech Macek 2024-05-13  1005  			data = lvts_read_device(lvts_data, 0x00, i);
41b0c432199119 Wojciech Macek 2024-05-13  1006
41b0c432199119 Wojciech Macek 2024-05-13  1007  			cal_data->count_rc_now[s_index] = (data & GENMASK(23, 0));
41b0c432199119 Wojciech Macek 2024-05-13  1008  		}
41b0c432199119 Wojciech Macek 2024-05-13  1009
41b0c432199119 Wojciech Macek 2024-05-13  1010  		/* Recover Setting for Normal Access on
41b0c432199119 Wojciech Macek 2024-05-13  1011  		 * temperature fetch
41b0c432199119 Wojciech Macek 2024-05-13  1012  		 */
41b0c432199119 Wojciech Macek 2024-05-13  1013  		lvts_write_device(lvts_data, SET_SENSOR_NO_RCK_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13  1014  		lvts_write_device(lvts_data, SET_DEVICE_LOW_POWER_SINGLE_MODE_V4, i);
41b0c432199119 Wojciech Macek 2024-05-13  1015  	}
41b0c432199119 Wojciech Macek 2024-05-13  1016
41b0c432199119 Wojciech Macek 2024-05-13  1017  	size = sizeof(buffer);
41b0c432199119 Wojciech Macek 2024-05-13  1018  	offset = snprintf(buffer, size, "[COUNT_RC_NOW] ");
41b0c432199119 Wojciech Macek 2024-05-13  1019
41b0c432199119 Wojciech Macek 2024-05-13 @1020  	if (offset < 0)
41b0c432199119 Wojciech Macek 2024-05-13  1021  		return -EINVAL;
41b0c432199119 Wojciech Macek 2024-05-13  1022
41b0c432199119 Wojciech Macek 2024-05-13  1023  	if (offset >= size)
41b0c432199119 Wojciech Macek 2024-05-13  1024  		return -ENOMEM;
41b0c432199119 Wojciech Macek 2024-05-13  1025
41b0c432199119 Wojciech Macek 2024-05-13  1026  	for (i = 0; i < lvts_data->num_sensor; i++)
41b0c432199119 Wojciech Macek 2024-05-13  1027  		offset += snprintf(buffer + offset, size - offset, "%d:%d ",
41b0c432199119 Wojciech Macek 2024-05-13  1028  				   i, cal_data->count_rc_now[i]);
41b0c432199119 Wojciech Macek 2024-05-13  1029
41b0c432199119 Wojciech Macek 2024-05-13  1030  	if (offset < 0)
41b0c432199119 Wojciech Macek 2024-05-13  1031  		return -EINVAL;
41b0c432199119 Wojciech Macek 2024-05-13  1032
41b0c432199119 Wojciech Macek 2024-05-13  1033  	if (offset >= size)
41b0c432199119 Wojciech Macek 2024-05-13  1034  		return -ENOMEM;
41b0c432199119 Wojciech Macek 2024-05-13  1035
41b0c432199119 Wojciech Macek 2024-05-13  1036  	buffer[offset] = '\0';
41b0c432199119 Wojciech Macek 2024-05-13  1037  	dev_info(dev, "%s\n", buffer);
41b0c432199119 Wojciech Macek 2024-05-13  1038
41b0c432199119 Wojciech Macek 2024-05-13  1039  	return 0;
41b0c432199119 Wojciech Macek 2024-05-13  1040  }
41b0c432199119 Wojciech Macek 2024-05-13  1041

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
