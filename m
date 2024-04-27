Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BE23B79F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714244873; cv=none; b=Yu1vkoVOYlu3DCKn5rEF0HwZrzjk/Wu0DaJ/yA/98PoWniK0mDMwgT0GObPu0m4/hl4vHH6HYBfpFGcSp88Ab+AmCz4t7TOmTz0dh3Y7CUjf6Ohca3GRjgRXKRx+ZsjUQv+/s5JtjfPHCFId4951+VfdUKodktWQn6BahV425Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714244873; c=relaxed/simple;
	bh=Z8xxGOIEVhjD1qQqFIX7fjCeFKvROWg52YH7j/FhahI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UH3eIinmmhob/Y2VrIhlh9KHd8j2UsYh3qr37nw9++SdGmLPY0cBsjd1ZoPMjLFLnZIbDZEnTmBmohCFPoRgTDIpOKgJzoPb9dBSHLrOLqtWjMLWOUFwe7q3vQlhaoOcavA4q8ztd3wNBlG/cuVfrejk9LHL51U9bBLO2MIQsQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kZPRcvOY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kZPRcvOY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714244871; x=1745780871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z8xxGOIEVhjD1qQqFIX7fjCeFKvROWg52YH7j/FhahI=;
  b=kZPRcvOYVaT2rK/83H9mGqPE3g0dDr33WmRRBZ05T/65iamwmKascxxw
   53XHSj8J9H9vGwoWbJ6wEID7RYoTsqLv1MA3gJVFjqBGa9P2XCxJHrL9p
   hrr6ki9xdRMO1uncEbYeG6/S3fq838MCqWpvTJoDIB9sJjBuZO8IKDgCn
   XD+/2H6M3EyiQkmMzQ4dZmVEHAYU8EytQQio/8J2k6FCODuRXgycRyqSb
   dxR7RSLNMdQIUpRPBOCnW2u4Z1uy59YmdQH5e0AMwjohNF+Jo7pemhuo1
   /MBCxHeG7W4Tz+PWq70tTEQq4z8+kAUsQzFpCxKGvvPmkqQ1J7A1jksEK
   g==;
X-CSE-ConnectionGUID: /pzYnvMpQ1avtexIUvL7lw==
X-CSE-MsgGUID: XvIv1uCLSpyeL9uxaET4Yg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="21105672"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="21105672"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 12:07:50 -0700
X-CSE-ConnectionGUID: XR1cC/KfTmmQEzUwvDER/Q==
X-CSE-MsgGUID: 4xlrunFCSymKsOSIDZuS+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25601508"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Apr 2024 12:07:50 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0nOl-0005Pm-0c;
	Sat, 27 Apr 2024 19:07:47 +0000
Date: Sun, 28 Apr 2024 03:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Min Li <min.li.xe@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS 984/991]
 drivers/misc/rsmu_cm.c:172:13: warning: variable 'err' set but not used
Message-ID: <202404280342.v6e0AsT4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS
head:   08ceadacc1da15a77045dee6654f9cd906906271
commit: 7d3c0f27dc86aab8e1ddd1683691633e72f28174 [984/991] misc: rsmu: add rsmu cdev driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404280342.v6e0AsT4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280342.v6e0AsT4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280342.v6e0AsT4-lkp@intel.com/

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
