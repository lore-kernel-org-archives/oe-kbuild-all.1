Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113561369B6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 03:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729135200; cv=none; b=QcLGKUZIQPFsBNn6Kax40N1W4eo1ewKpDHypPBoZ+wsLEUvJfQCNqa3D32PwzQCNiH0FKvSrS0dU+/imtr98BJudfolMplPLxPTR8GnoKzaM54Lnw4uh8uX0LRAn4Zuh0EjYnZlAdIpA4g4jDDTxfZZbRBidMiiYTNu3m2T5rJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729135200; c=relaxed/simple;
	bh=zQNEmbTB4x6faYxQ3RRyBjEwf/cRdQIKz0912sbSoek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cHVh9+379pDGe9O68cXwyuc1XO/PcCdg8UdsXPjIF4omMsyioPEgUZ6f2W1/Wg31KOWF9Xk37QerMSfihe7TbGV5ZkZwMpeyxpAPqouEmQedJZAE2/y/JcLoPuG/A/RT+501B6OKvBIMs9kG++2ScTppx4hStANJc1s3OgYgulY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F82KCBi7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F82KCBi7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729135197; x=1760671197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zQNEmbTB4x6faYxQ3RRyBjEwf/cRdQIKz0912sbSoek=;
  b=F82KCBi7j61iM8olZwrO0s02/FR++036V04tBs++RLHTP975yWOG2Egn
   L3W4fgy+KU3n/HdhCZwi5TN+mGr8/2QHbJ5vldkRWJ90RjyF44wsrebIG
   e8tuDpOeusk0VEiNT6XyNdZJM23FAqQD0pRVzZo01XPoC1HyfUNI3sqwN
   gDtUUxoyYZILEIOI6yuoHCFAiKMoFcj5WXYP0jTwBkzYiCWAdyqME3Ado
   nlGWMSo2b205APIwY7xnnuZ4YtY3EyQPqzVnu08QuaT8zIAgOIr1ysuTU
   4Vt8RYBGAb85mQFw9PCn3FMHXr46bEt+LuCc/kmV7qxU2blQPwkg1gilT
   w==;
X-CSE-ConnectionGUID: trBP9wvWReeHxtVLwPk1QQ==
X-CSE-MsgGUID: G3oQkzBgTguVOTluy50jeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28812366"
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="28812366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 20:19:56 -0700
X-CSE-ConnectionGUID: f1MwyyMgT72TJoeC0u8aQw==
X-CSE-MsgGUID: QGWpgESBS9uF9l+2F8ad0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="79230899"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 16 Oct 2024 20:19:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1H3I-000LgT-0k;
	Thu, 17 Oct 2024 03:19:52 +0000
Date: Thu, 17 Oct 2024 11:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 54/68] drivers/media/i2c/ov2312.c:343:12:
 sparse: sparse: incorrect type in assignment (different base types)
Message-ID: <202410171147.PPU0Ry7M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   1cefd766c03fced8e584ae481ca240774c53c99e
commit: ccdc1b98238fcb905bf6a4e93fab05a1b5b4bd24 [54/68] media: i2c: ov2312: add Omnivison OV2312 driver
config: riscv-randconfig-r122-20241016 (https://download.01.org/0day-ci/archive/20241017/202410171147.PPU0Ry7M-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bfe84f7085d82d06d61c632a7bad1e692fd159e4)
reproduce: (https://download.01.org/0day-ci/archive/20241017/202410171147.PPU0Ry7M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410171147.PPU0Ry7M-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/ov2312.c:343:12: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [usertype] id @@     got restricted __be16 [usertype] @@
   drivers/media/i2c/ov2312.c:343:12: sparse:     expected unsigned int [addressable] [usertype] id
   drivers/media/i2c/ov2312.c:343:12: sparse:     got restricted __be16 [usertype]
>> drivers/media/i2c/ov2312.c:397:58: sparse: sparse: cast to restricted __be16
>> drivers/media/i2c/ov2312.c:397:58: sparse: sparse: cast to restricted __be16
>> drivers/media/i2c/ov2312.c:397:58: sparse: sparse: cast to restricted __be16
>> drivers/media/i2c/ov2312.c:397:58: sparse: sparse: cast to restricted __be16
   drivers/media/i2c/ov2312.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

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
