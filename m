Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3223A4F30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 04:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787630474; cv=none; b=f6Ugy+Iy26wzxxsz4/GNpb35/Xva0qiXQdSGNsRqWhFIKnqPYmwR8vP9O3fL+2ly+byAR7FFjA/2gnZJhTCxE2ycTelUfaZIxi7AURkKByipdg2dDGcwD4qq3cN5lBV5NdIZ2Cg1QmXuSkxW5jlOgiDhoq7OhTEcjUDB2qBbs8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787630474; c=relaxed/simple;
	bh=cdyQdSz0mXnmObifZHruNQcGE2qu5fM7RuRYUPQ16go=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mrEUluDAu0k4NEVHNPGXZJt4JbqPCDwL9y0yaGJ1I5GonBm2fwV3NGjI9gQeG42P0hbGbjdNYZ3Au98UvTPJJeXDdrx0jUrTSAM9VbCvtQVkpOHyCB9Rual3N79EfRfDhDsc9wLpkx5fn/pOyDPq6FNyI5rAovDoBB3mf9Lvy60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jnMXBTC6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jnMXBTC6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787630473; x=1819166473;
  h=date:from:to:cc:subject:message-id;
  bh=cdyQdSz0mXnmObifZHruNQcGE2qu5fM7RuRYUPQ16go=;
  b=jnMXBTC6j8Fkryy0jwDukbf5Ksytei61DHSa6mh7nY4caZM2VDw0AbP9
   iwNM2syfOKbE1l2jV0oO0b9nnvrxqXelw8j17D+FcK5r7+dPXksIGQT3Y
   /CvCA9x4xoMvO9NcmUr6FWY0Te0ukRdcIffgJi0mEyR8sufgBgrNuaCPP
   7P93oGvqJsDCNPwYLHm6108/+X6+AZrc40OyvPo/lXtD1eZ6wVbQ21xnO
   w5f7vK0D4uZcs3+kDhTD2272U0LL2tIztNpPRVoPISKdDSUAyDfsopez5
   Yy/7uea1UT9yJeBBjw7Kv8rH2RvVGzQvc0fX9WzadSdd1BCdGAs8NvSbx
   Q==;
X-CSE-ConnectionGUID: +2o8GKoDTNqWSmVhLNldJQ==
X-CSE-MsgGUID: ma+oaZYEQL+MYWuGOshA2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="105620854"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="105620854"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 21:01:12 -0700
X-CSE-ConnectionGUID: AIuLzQWjREy/PyvxEpftIw==
X-CSE-MsgGUID: drPQT4UPSxSDdK+TYAf1ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="266634214"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Aug 2026 21:01:10 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyiLT-000000004uV-47Uj;
	Tue, 25 Aug 2026 04:01:07 +0000
Date: Tue, 25 Aug 2026 12:01:03 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: sound/soc/codecs/rt766-sdca.c:89:undefined reference to
 `hid_input_report'
Message-ID: <202608251149.oUJkk2jH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0a0d1d55dad570724bf8c7ea83409639cfb4be9b
commit: b50ecf5873df1ce6ff34f3e3421ebb33750e61f6 ASoC: rt766: add RT766/RT767 SDCA driver
date:   3 weeks ago
config: x86_64-buildonly-randconfig-004-20260825 (https://download.01.org/0day-ci/archive/20260825/202608251149.oUJkk2jH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608251149.oUJkk2jH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b50ecf5873df ("ASoC: rt766: add RT766/RT767 SDCA driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608251149.oUJkk2jH-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `rt766_sdca_btn_detect':
>> sound/soc/codecs/rt766-sdca.c:89:(.text+0x1b497de): undefined reference to `hid_input_report'
   ld: vmlinux.o: in function `sdwhid_parse':
>> sound/soc/sdca/sdca_hid.c:37:(.text+0x1cdeba3): undefined reference to `hid_parse_report'
   ld: vmlinux.o: in function `sdca_add_hid_device':
>> sound/soc/sdca/sdca_hid.c:95:(.text+0x1cdec14): undefined reference to `hid_allocate_device'
>> ld: sound/soc/sdca/sdca_hid.c:114:(.text+0x1cded5d): undefined reference to `hid_add_device'
>> ld: sound/soc/sdca/sdca_hid.c:117:(.text+0x1cded8d): undefined reference to `hid_destroy_device'
   ld: vmlinux.o: in function `sdca_hid_process_report':
>> sound/soc/sdca/sdca_hid.c:160:(.text+0x1cdef92): undefined reference to `hid_input_report'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_SOC_SDCA_HID
   Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && SND_SOC_SDCA [=y] && (HID [=n]=y [=y] || HID [=n]=SND_SOC_SDCA [=y])
   Selected by [y]:
   - SND_SOC_RT766_SDCA_SDW [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && SOUNDWIRE [=y] && SND_SOC_SDCA [=y]


vim +89 sound/soc/codecs/rt766-sdca.c

    32	
    33	static int rt766_sdca_btn_detect(struct sdca_interrupt *interrupt)
    34	{
    35		struct rt766_sdca_priv *rt766 = interrupt->priv;
    36		struct sdca_entity *ent_hid = interrupt->entity;
    37		unsigned char *buf = NULL;
    38		unsigned int offset, owner, length;
    39		unsigned int det_mode, idx, val;
    40		int ret;
    41	
    42		ret = regmap_read(rt766->regmap,
    43			RT766_SDCA_CTL(UAJ, GE49, SDCA_CTL_GE_DETECTED_MODE),
    44			&det_mode);
    45		if (ret < 0)
    46			goto io_error;
    47	
    48		/* get current UMP message owner */
    49		ret = regmap_read(rt766->regmap,
    50			RT766_SDCA_CTL(HID, HID101, SDCA_CTL_HIDE_HIDTX_CURRENTOWNER),
    51			&owner);
    52		if (ret < 0)
    53			goto io_error;
    54	
    55		/* if owner is device then there is no button event from device */
    56		if (owner == 1)
    57			return 0;
    58	
    59		if (det_mode) {
    60			/* read UMP message length */
    61			ret = regmap_read(rt766->regmap,
    62				RT766_SDCA_CTL(HID, HID101, SDCA_CTL_HIDE_HIDTX_MESSAGELENGTH),
    63				&length);
    64			if (ret < 0)
    65				goto _end_btn_det_;
    66	
    67			/* read UMP message offset */
    68			ret = regmap_read(rt766->regmap,
    69				RT766_SDCA_CTL(HID, HID101, SDCA_CTL_HIDE_HIDTX_MESSAGEOFFSET),
    70				&offset);
    71			if (ret < 0)
    72				goto _end_btn_det_;
    73	
    74			buf = devm_kzalloc(&rt766->slave->dev, length, GFP_KERNEL);
    75			if (!buf) {
    76				dev_err(&rt766->slave->dev, "%s: alloc buf failed\n", __func__);
    77				goto _end_btn_det_;
    78			}
    79	
    80			for (idx = 0; idx < length; idx++) {
    81				ret = regmap_read(rt766->regmap,
    82					RT766_BUF_ADDR_HID1 + offset + idx, &val);
    83				if (ret < 0)
    84					goto _end_btn_det_;
    85				buf[idx] = val & 0xff;
    86			}
    87	
    88			if (ent_hid)
  > 89				hid_input_report(ent_hid->hide.hid, HID_INPUT_REPORT,
    90					buf, length, 1);
    91		}
    92	
    93	_end_btn_det_:
    94		if (buf)
    95			devm_kfree(&rt766->slave->dev, buf);
    96	
    97		/* Host is owner, so set back to device */
    98		if (owner == 0) {
    99			regmap_write(rt766->regmap,
   100				RT766_SDCA_CTL(HID, HID101, SDCA_CTL_HIDE_HIDTX_CURRENTOWNER), 0x01);
   101		}
   102	
   103		return 0;
   104	
   105	io_error:
   106		pr_err_ratelimited("IO error in %s, ret %d\n", __func__, ret);
   107		return ret;
   108	}
   109	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
