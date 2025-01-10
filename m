Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E924E223320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 23:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736552874; cv=none; b=DRXzP0vydQhM0rpdCwBrI/1A0Lg62eV3DigDOedUav5RqvJ2w9u24W35lpmvG1m/QVXUKGME2+WOKVLbrkEnVdDffUS0aZFAgUD3laL7tFnlnZq7Z2kXpwaKt8mA5shEX3MR+/W15Lo++eGZ2pP8sb/RAOl0gPgzSk7qOwsSHhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736552874; c=relaxed/simple;
	bh=zUxGPM+URMQTRm5xL4DE68Fmf4zsfkQik5+NCQ7HBLY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LKhau95Byv4ADoZtXLCKasaMmZ8NKR6QUfgT251LncPvHA7YGE4QpUbtondgLYu0VgVzRJ+g6qaPhiODTfWC1eCky5SSN7ZIuDpE3TwY10rPEQgEOn+ZC6pskts0IEFk76Nn08aGPRQ16yGwduUnns92AWetPU92Lw1E+jSAPwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQjIF8C7; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQjIF8C7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736552873; x=1768088873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zUxGPM+URMQTRm5xL4DE68Fmf4zsfkQik5+NCQ7HBLY=;
  b=hQjIF8C7RJIdgMbBrXeew3cSLv96Pwxt3Qk81yMAjurMeo6ULBFewk5M
   8XUH4KR4GP8zHTl1h5PoewGkFs/NWDoW1LHI3pjB66qEN87e7glqCxEFM
   MZxha6IZjH5Fkwzhdmr1aDKUEPLJyjQ8D9H7al0g2dHH/tnL06Eo7til1
   K5Ylk3r0OPw3YewP0+MZK1p5MM81/6mSyZ3Jo6HEkUX1RfLNRMHlHprsW
   HVbApY60Rs/lTpGQ8NjmyFelkVkwEkCVq5HNXtN1TcGgPdR/NOGPq1R4K
   hKm7cCCqIcuExgtmALBpvb0SYvlyeuyFvbi8aU67SqNeihP2cY8c8J3/Z
   A==;
X-CSE-ConnectionGUID: G3cgXXvYTtC5kVuIUH9UTQ==
X-CSE-MsgGUID: uQje+TeyRIy3phK33223AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36762569"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36762569"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 15:47:52 -0800
X-CSE-ConnectionGUID: Ffw3DjGGQWCcamUxUHTx6w==
X-CSE-MsgGUID: 90z+NIJYRcW+yXsbB5/5/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="103811186"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Jan 2025 15:47:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWOjE-000JuB-2Q;
	Fri, 10 Jan 2025 23:47:48 +0000
Date: Sat, 11 Jan 2025 07:47:03 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <min.li.xe@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:lkp_test 371/504] drivers/misc/rsmu_cm.c:172:13:
 warning: variable 'err' set but not used
Message-ID: <202501110703.AqVudeRO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   9ac6b4acf9144465ac1408d4d799635dec0223a0
commit: b77497260b398a80cfe434aec5106a46dcc21456 [371/504] misc: rsmu: add rsmu cdev driver
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20250111/202501110703.AqVudeRO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110703.AqVudeRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110703.AqVudeRO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/rsmu_cm.c: In function 'rsmu_cm_set_output_tdc_go':
>> drivers/misc/rsmu_cm.c:172:13: warning: variable 'err' set but not used [-Wunused-but-set-variable]
     172 |         int err;
         |             ^~~


vim +/err +172 drivers/misc/rsmu_cm.c

   165	
   166	static int rsmu_cm_set_output_tdc_go(struct rsmu_cdev *rsmu, u8 tdc, u8 enable)
   167	{
   168		/* This function enables or disables output tdc alignment. */
   169		u8 tdc_ctrl4_offset;
   170		u32 tdc_n;
   171		u8 reg;
 > 172		int err;
   173	
   174		tdc_ctrl4_offset = IDTCM_FW_REG(rsmu->fw_version, V520, OUTPUT_TDC_CTRL_4);
   175	
   176		switch (tdc) {
   177		case 0:
   178			tdc_n = OUTPUT_TDC_0;
   179			break;
   180		case 1:
   181			tdc_n = OUTPUT_TDC_1;
   182			break;
   183		case 2:
   184			tdc_n = OUTPUT_TDC_2;
   185			break;
   186		case 3:
   187			tdc_n = OUTPUT_TDC_3;
   188			break;
   189		default:
   190			return -EINVAL;
   191		}
   192	
   193		err = regmap_bulk_read(rsmu->regmap, tdc_n + tdc_ctrl4_offset,
   194				       &reg, sizeof(reg));
   195	
   196		if (enable)
   197			reg |= 0x01;
   198		else
   199			reg &= ~0x01;
   200	
   201		return regmap_bulk_write(rsmu->regmap, tdc_n + tdc_ctrl4_offset,
   202					 &reg, sizeof(reg));
   203	}
   204	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
