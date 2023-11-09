Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCD813AD4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LhDvgumI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699523822; x=1731059822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/OFL/MY51Syjt6gbfdkxXJMO0gSH1Lz2pWz3UP4tbo=;
  b=LhDvgumIt0AC1uJGAHIahG0wcHWCcprjB4SccUMf0yN8iyIWlIV3OvH3
   /c9UZhAiZ6NG1VJ/9ifjubuUuMXqc0Bxqszk7jbLRelcmd/gqdeZ7ecAW
   EKufd7SZuGPyQa/xV9AcSs9st1cDa2NHW3y8tPcA+xREVK+vmkBOSFBnX
   VThy+OEfFfrfKWUhTSerJIldPlHKPhc7kyFsAevRieZVIdhuahaU8zASL
   I3LOdboWftVM2snjsyM+jNV/10MVV8E5GcTt/Xz1ywxVSdd/Nrom7JI7d
   JmXHKUMq5H79LtXMBBeyjcio9Xl3hnfK/BJohss9MRKBAF+4MJyY+rnGd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="2983125"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="2983125"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 01:57:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="854032248"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="854032248"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2023 01:56:59 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r11mT-0008dI-15;
	Thu, 09 Nov 2023 09:56:57 +0000
Date: Thu, 9 Nov 2023 17:56:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y 71/107] drivers/media/i2c/ov2312.c:343:12:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202311091711.SwLjVm96-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   eda9974e8513cdd2c5cc20c3c6b851f9977acd4d
commit: 639983d43644aa713e6801bceb972ae5d526fd22 [71/107] media: i2c: ov2312: add Omnivison OV2312 driver
config: x86_64-randconfig-r111-20231103 (https://download.01.org/0day-ci/archive/20231109/202311091711.SwLjVm96-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231109/202311091711.SwLjVm96-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311091711.SwLjVm96-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ov2312.c:343:12: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] id @@     got restricted __be16 [usertype] @@
   drivers/media/i2c/ov2312.c:343:12: sparse:     expected unsigned int [addressable] [usertype] id
   drivers/media/i2c/ov2312.c:343:12: sparse:     got restricted __be16 [usertype]
>> drivers/media/i2c/ov2312.c:397:58: sparse: sparse: cast to restricted __be16

vim +343 drivers/media/i2c/ov2312.c

   333	
   334	static int ov2312_detect(struct ov2312 *ov2312)
   335	{
   336		int ret;
   337		u32 id;
   338	
   339		ret = ov2312_read(ov2312, OV2312_SC_CHIP_ID_HI, &id, 2);
   340		if (ret < 0)
   341			return ret;
   342	
 > 343		id = cpu_to_be16(id);
   344	
   345		if (id != OV2312_CHIP_ID) {
   346			dev_err(ov2312->dev,
   347				"%s: unknown chip ID 0x%04x\n", __func__, id);
   348			return -ENODEV;
   349		}
   350	
   351		dev_dbg(ov2312->dev, "%s: detected chip ID 0x%04x\n", __func__, id);
   352		return 0;
   353	}
   354	
   355	static int ov2312_set_AB_mode(struct ov2312 *ov2312)
   356	{
   357		int i, ret;
   358		u32 exposure = ov2312->exposure->val;
   359		u32 again = ov2312->again->val;
   360		u32 dgain = ov2312->dgain->val;
   361		struct reg_sequence ov2312_groupB[] = {
   362			{0x3208, 0x00},/* Group B (RGB Dominant VC1) */
   363			{OV2312_AEC_PK_EXPO_HI, (exposure >> 8) & 0xff},
   364			{OV2312_AEC_PK_EXPO_LO, exposure & 0xff},
   365			{OV2312_AEC_PK_AGAIN_HI, (again >> 4) & 0xff},
   366			{OV2312_AEC_PK_AGAIN_LO, (again & 0x0f) << 4},
   367			{OV2312_AEC_PK_DGAIN_HI, (dgain >> 8) & 0xff},
   368			{OV2312_AEC_PK_DGAIN_LO, dgain & 0xff},
   369			{0x3920, 0x00},
   370			{0x4813, 0x00},/* VC=0. This register takes effect from next frame */
   371			{0x3208, 0x10},
   372			{0x320D, 0x00},/* Auto mode switch between group0 and group1 ;setting to switch */
   373			{0x320D, 0x31},
   374			{0x3208, 0xA0},
   375		};
   376	
   377		for (i = 0; i < ARRAY_SIZE(ov2312_groupB); i++) {
   378			ret = regmap_write(ov2312->regmap, ov2312_groupB[i].reg, ov2312_groupB[i].def);
   379			if (ret < 0) {
   380				dev_err(ov2312->dev,
   381					"%s: failed to write reg[%d] 0x%04x = 0x%02x (%d)!\n",
   382					__func__, i, ov2312_groupB[i].reg, ov2312_groupB[i].def, ret);
   383				return ret;
   384			}
   385		}
   386	
   387		msleep(33);
   388		return 0;
   389	}
   390	
   391	static int ov2312_set_orientation(struct ov2312 *ov2312)
   392	{
   393		bool v_flip = ov2312->v_flip->val;
   394		bool h_flip = ov2312->h_flip->val;
   395		u32 reg = (v_flip ? 0x4400 : 0) | (h_flip ? 0x0004 : 0);
   396	
 > 397		return ov2312_write(ov2312, OV2312_TIMING_VFLIP, be16_to_cpu(reg), 2);
   398	}
   399	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
