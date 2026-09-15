Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB58429827
	for <oe-kbuild-all@lists.linux.dev>; Tue, 15 Sep 2026 16:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789489648; cv=none; b=b5AelQTI4jiKi/VncCqeZALA8eRuwrvOHLiiA7F6EduEukmHmEhrpOOGCQX+xeXc2R7oymdduA9jkBp+JBsSD78t28tHFG+TFcdjsozuFkjyCTauBgV400ih8eAr4yTX8gJvTylUcJcsnh43zSEuh28pXFDuz88VV8+S4ie1FXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789489648; c=relaxed/simple;
	bh=EE3dFmuWchc63LmfvbqItL+QoMHsGKz6RUCH1OufpLw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=STsQqZ018L7ShPxeRrRHFDI6rkwKlv4LhBvAf+VqdoRiScdijQZ+UMIakOSa+qVke90W8BUuU/ku6oa/ZSLg0j7s7XDHaWsW5BVn5ZjVvhwhkyporz4FBi+jFMn6Jvjwugr+PTWkmjMU8GQSSfl1YgzPX7psRUZDTCXW4Xsh3DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b4JNxjcW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b4JNxjcW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789489646; x=1821025646;
  h=date:from:to:cc:subject:message-id;
  bh=EE3dFmuWchc63LmfvbqItL+QoMHsGKz6RUCH1OufpLw=;
  b=b4JNxjcWq52oN/pRj17boUTl8pkDXJwVEZgT9rhUINY8AaNWM/RXRcQ9
   YEZuOQSD+NbAohkOSuPqV1baMBxgYYxPAtxnrgq28Uzh1adsgPkZqKl1p
   5yXfUwL1U53QYwIghxI7atj0EWVnZPBlZqDFMR3ar4lQuggYS9ka4ZgZT
   Cysloww0NXtT7cabt47UeI+35CNTNNZHZx7tDi/HCYnTfhTM9X3RCTjF0
   lG/DBpSuyIiGD7guK6ohEAIlrXTlw7MJC+68Q7uW4MdU02g6vYv3C/LBz
   cHx5B9uQbQDwjrfcZPEslKNBzF0rgubDbpUfHE1RPpbeamI7PJN+gxmCy
   Q==;
X-CSE-ConnectionGUID: dWxou5czTS2ZdezbGscL5A==
X-CSE-MsgGUID: pvRIL6nNQ7CCqKhXNx9SZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="93730636"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93730636"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 09:27:25 -0700
X-CSE-ConnectionGUID: qK9cnZN0TSyxCAWYdZQONA==
X-CSE-MsgGUID: AGsB2/OxQ5221t7JA8C15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="275009954"
Received: from igk-lkp-server01.igk.intel.com (HELO 71151d66d536) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 15 Sep 2026 09:27:24 -0700
Received: from kbuild by 71151d66d536 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x6W09-000000000ep-2jCc;
	Tue, 15 Sep 2026 16:27:21 +0000
Date: Tue, 15 Sep 2026 18:26:58 +0200
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Kishon <kishon@ti.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [phy:next 4/30] drivers/phy/mediatek/phy-mtk-dp.c:168:2-3:
 Unneeded semicolon
Message-ID: <202609151827.yVAIUqNq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/phy/linux-phy.git next
head:   8bc74189b12e3d094d45eb82946c1fa17569fc93
commit: 3b7c0d1a2314a44f71003c196afa4f33c51e5067 [4/30] phy: phy-mtk-dp: Migrate register offsets to SoC specific pdata
config: m68k-randconfig-r052-20260915 (https://download.01.org/0day-ci/archive/20260915/202609151827.yVAIUqNq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609151827.yVAIUqNq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/phy/mediatek/phy-mtk-dp.c:168:2-3: Unneeded semicolon

vim +168 drivers/phy/mediatek/phy-mtk-dp.c

   137	
   138	static int mtk_dp_phy_init(struct phy *phy)
   139	{
   140		struct mtk_dp_phy *dp_phy = phy_get_drvdata(phy);
   141		const struct mtk_dp_phy_pdata *pdata = dp_phy->pdata;
   142		const u32 reg = pdata->regs_dig_lane[DP_PHYD_LAN_DRIVING_PARAM_0];
   143		static const u32 driving_params[] = {
   144			DRIVING_PARAM_0_DEFAULT,
   145			DRIVING_PARAM_1_DEFAULT,
   146			DRIVING_PARAM_2_DEFAULT,
   147			DRIVING_PARAM_3_DEFAULT,
   148			DRIVING_PARAM_4_DEFAULT,
   149			DRIVING_PARAM_5_DEFAULT,
   150			DRIVING_PARAM_6_DEFAULT,
   151			DRIVING_PARAM_7_DEFAULT,
   152			DRIVING_PARAM_8_DEFAULT
   153		};
   154		int i, ret;
   155	
   156		/*
   157		 * Assume that all lanes need the same driving parameters: this
   158		 * will bulk write from DRIVING_PARAM_0 to DRIVING_PARAM_8 on
   159		 * all lanes (a grand total of [9 * num_lanes] 32-bit writes)
   160		 */
   161		for (i = 0; i < MTK_DP_PHY_MAX_LANES; i++) {
   162			ret = regmap_bulk_write(dp_phy->regmap,
   163						pdata->off_dig_lane[i] + reg,
   164						driving_params,
   165						ARRAY_SIZE(driving_params));
   166			if (ret)
   167				return ret;
 > 168		};
   169	
   170		return 0;
   171	}
   172	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
