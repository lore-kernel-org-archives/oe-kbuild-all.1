Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09EE2C0299
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Dec 2025 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766135051; cv=none; b=HXxH5maSBUVWTfUuzTupUeYg9sIrLDkfqCsaDbbSuiIhPDW9PTzss4k/9mPRm8HHZckkHxJPTMCEs6wuxYD/rfRxLKquvuOW1/dzK7rxvXjGi9KUaFTfuR2dazV6gM4VACRwDgTPxMSrrrWZJGGV52XsJwse74elNF+ahKWVJoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766135051; c=relaxed/simple;
	bh=ugzyOu8lfLI/J+PF4MbBwwDgIeTnUmJ31Zv5JLb8n/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MJeXqevpsimGTa0ANf0sWfkEpVB0DnwNB3Mexfae9ZJcp6rxuSVPNziXT3Miz7PvvP9w9kF7WIa1pgO2z3UX7uOLuKL+fREvm7C9ZMDQTBEW5fIfPHcPmRBJ9z3WzWw3L1buJr7ih33cAreb68bPmWUxFbMsk6Z7m0dTMB38jOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZwCI1Cx; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZwCI1Cx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766135050; x=1797671050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ugzyOu8lfLI/J+PF4MbBwwDgIeTnUmJ31Zv5JLb8n/0=;
  b=MZwCI1CxNwRGvx2XRNmpj6tS62fYsE2gOv1FjqXBQVsklqpkPlvqWasp
   dUluhCDZPPyZeKLEbtBQCqiFbPfABW49nF0Yi1Y22TAyv916KdiZAUAxW
   IlX/vU3CgVOx3WpE144HtJGpLHwjJtZ5qs69bm6DxdLK5Z2Nfsvv2/5KO
   +ZsqN+qkt5LIEG+aWa0Dx6c7G9VFfZG1tE5tLUzWMjo1WqsAKIO6vG7qg
   hA+Lx0RUFxKLFe2UryvUffHYAk/6vF2WwvU4oFM9LcfoAKGMEs2TFeN22
   lpkNTgJIcbY/HfTSW7U2gDZ1+VeJ/yi6f+d66lDzP5rC5pCweGG2MtAFk
   g==;
X-CSE-ConnectionGUID: C9EPx/vjSNOU63VkDNo7fQ==
X-CSE-MsgGUID: rYhFS1dPT3u0VCAp+LahXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="68070624"
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="68070624"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 01:04:08 -0800
X-CSE-ConnectionGUID: A2KjGSg/QX6X/yzRcMATkA==
X-CSE-MsgGUID: Mk4YaeZQTTCCEi9kSBb8GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,159,1763452800"; 
   d="scan'208";a="197964515"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 19 Dec 2025 01:04:05 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWWP5-000000003Il-1RDE;
	Fri, 19 Dec 2025 09:04:03 +0000
Date: Fri, 19 Dec 2025 17:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Shuming Fan <shumingf@realtek.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 2070/2671]
 sound/soc/codecs/rt1320-sdw.c:1096:undefined reference to `__udivmoddi4'
Message-ID: <202512191744.khCpeoDu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: da1682d5e8b53a51072552844c551b1b784e52c2 [2070/2671] ASoC: rt1320: support calibration and temperature/r0 loading
config: i386-randconfig-011-20251219 (https://download.01.org/0day-ci/archive/20251219/202512191744.khCpeoDu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251219/202512191744.khCpeoDu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512191744.khCpeoDu-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: sound/soc/codecs/rt1320-sdw.o: in function `rt1320_calc_r0':
>> sound/soc/codecs/rt1320-sdw.c:1096:(.text+0xac4): undefined reference to `__udivmoddi4'
>> ld: sound/soc/codecs/rt1320-sdw.c:1095:(.text+0xaf4): undefined reference to `__udivmoddi4'
   ld: sound/soc/codecs/rt1320-sdw.o: in function `rt1320_invrs_load':
>> sound/soc/codecs/rt1320-sdw.c:1070:(.text+0x299a): undefined reference to `__udivdi3'
>> ld: sound/soc/codecs/rt1320-sdw.c:1071:(.text+0x29ba): undefined reference to `__udivdi3'


vim +1096 sound/soc/codecs/rt1320-sdw.c

  1046	
  1047	static int rt1320_invrs_load(struct rt1320_sdw_priv *rt1320)
  1048	{
  1049		struct device *dev = &rt1320->sdw_slave->dev;
  1050		unsigned long long l_rsratio, r_rsratio;
  1051		unsigned int pr_1058, pr_1059, pr_105a;
  1052		unsigned long long l_invrs, r_invrs;
  1053		unsigned long long factor = (1 << 28);
  1054		unsigned int l_rsgain, r_rsgain;
  1055		struct rt1320_datafixpoint r0_data[2];
  1056		int ret;
  1057	
  1058		/* read L/Rch Rs Gain - it uses for compensating the R0 value */
  1059		rt1320_pr_read(rt1320, 0x1058, &pr_1058);
  1060		rt1320_pr_read(rt1320, 0x1059, &pr_1059);
  1061		rt1320_pr_read(rt1320, 0x105a, &pr_105a);
  1062		l_rsgain = ((pr_1059 & 0x7f) << 2) | ((pr_105a & 0xc0) >> 6);
  1063		r_rsgain = ((pr_1058 & 0xff) << 1) | ((pr_1059 & 0x80) >> 7);
  1064		dev_dbg(dev, "%s, LR rsgain=0x%x, 0x%x\n", __func__, l_rsgain, r_rsgain);
  1065	
  1066		l_rsratio = rt1320_rsgain_to_rsratio(rt1320, l_rsgain);
  1067		r_rsratio = rt1320_rsgain_to_rsratio(rt1320, r_rsgain);
  1068		dev_dbg(dev, "%s, LR rsratio=%lld, %lld\n", __func__, l_rsratio, r_rsratio);
  1069	
> 1070		l_invrs = (l_rsratio * factor) / 1000000000U;
> 1071		r_invrs = (r_rsratio * factor) / 1000000000U;
  1072	
  1073		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 6, &r0_data[0], sizeof(struct rt1320_datafixpoint));
  1074		rt1320_fw_param_protocol(rt1320, RT1320_GET_PARAM, 7, &r0_data[1], sizeof(struct rt1320_datafixpoint));
  1075	
  1076		r0_data[0].invrs = l_invrs;
  1077		r0_data[1].invrs = r_invrs;
  1078		dev_dbg(dev, "%s, write DSP LR invrs=0x%x, 0x%x\n", __func__, r0_data[0].invrs, r0_data[1].invrs);
  1079	
  1080		rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 6, &r0_data[0], sizeof(struct rt1320_datafixpoint));
  1081		rt1320_fw_param_protocol(rt1320, RT1320_SET_PARAM, 7, &r0_data[1], sizeof(struct rt1320_datafixpoint));
  1082		ret = rt1320_check_fw_ready(rt1320);
  1083		if (ret < 0)
  1084			dev_err(dev, "%s: Failed to set FW param 6,7!\n", __func__);
  1085	
  1086		return ret;
  1087	}
  1088	
  1089	static void rt1320_calc_r0(struct rt1320_sdw_priv *rt1320)
  1090	{
  1091		struct device *dev = &rt1320->sdw_slave->dev;
  1092		unsigned long long l_calir0, r_calir0;
  1093		const unsigned int factor = (1 << 27);
  1094	
> 1095		l_calir0 = (rt1320->r0_l_reg * 1000) / factor;
> 1096		r_calir0 = (rt1320->r0_r_reg * 1000) / factor;
  1097	
  1098		dev_dbg(dev, "%s, l_calir0=%lld.%03lld ohm, r_calir0=%lld.%03lld ohm\n", __func__,
  1099			l_calir0 / 1000, l_calir0 % 1000,
  1100			r_calir0 / 1000, r_calir0 % 1000);
  1101	}
  1102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
