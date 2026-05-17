Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2DAE54B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 May 2026 05:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778994583; cv=none; b=VFt929c3sucJT61Fs+TrdkJe+QyuVSK8r9UA1df0N2qRe9svBGv7HfP5SgIK8kr9DEXHujc5y4RkacS2G7dG3br4psK9LNelzahIMmmGEiLzrAZfVAk1QdAzv9TjJCaGNOVTB1jx0S7N9QX7FPN0RbQgocW2JpTtJvmvrWPwA+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778994583; c=relaxed/simple;
	bh=V1oOW0U94WPJpCG/XEVGBjK/o/lQW4Amx/5IcJo31vk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NafL8oybUqkHmIiTpWSoW+EGFxU9YkdneK6KyUuw78a5dTxHRVHSP2gdin8RtJhnON1dYh04ELtEFFWAtWTHujNgf7Rx0e9VkjshPvZnWSMKbnygVEFHHb0tpu0t+Wkv7XZFf5b3jOZ4vCh0SO2A7GUvESKPHtdYF6C4pclC3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QrfEJgKd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QrfEJgKd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778994579; x=1810530579;
  h=date:from:to:cc:subject:message-id;
  bh=V1oOW0U94WPJpCG/XEVGBjK/o/lQW4Amx/5IcJo31vk=;
  b=QrfEJgKdJHjXpcs+qY+avo/JNgG83Cv0tRRiyhJb23C9PqA14Gr9KPZ4
   7C6LmWSLDl4XR2SIEJQV2Q3RgseYYgwqzzAlB35P5VnQy0nItKPS8OlCZ
   mKusLjPhwmNEdKGtCqM/Wa1TT6dyZABqO03BXNyBZUIwUEUq3oDidh8D5
   8NK+84whxg2GVLmwUUE5D3Xwwe/Q+/jU97IUmJotzbdNrpzvlk+sqqfXF
   dkduUksI7woX/WKujdGPtNvrjrS2HHLs64cF4P78nLNThHrmW2Lkvgqd8
   NYH9koKdZMryrc6/JjjdrUe5J/qwgppN0GVI6bGAklQaj1Rjcr7Yd78kX
   g==;
X-CSE-ConnectionGUID: iZQoMOkrTi+0RcswNhnP0Q==
X-CSE-MsgGUID: Y4r/XgCPRhG8SJmRkVnjxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11788"; a="90992203"
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="90992203"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 22:09:39 -0700
X-CSE-ConnectionGUID: 1morjjgjQv+kpSAkOw+YaQ==
X-CSE-MsgGUID: 8YcpAN0ERYujIdUiZyZmJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,239,1770624000"; 
   d="scan'208";a="244063461"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 May 2026 22:09:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOTkt-000000009TV-0fdg;
	Sun, 17 May 2026 05:09:35 +0000
Date: Sun, 17 May 2026 07:09:33 +0200
From: kernel test robot <lkp@intel.com>
To: KancyJoe <kancy2333@outlook.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dtb:
 displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are
 not allowed ('sound-name-prefix' was unexpected)
Message-ID: <202605170721.yN31OQcU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6916d5703ddf9a38f1f6c2cc793381a24ee914c6
commit: df260487f33c8583bb78a28ef98b3b6c49265860 arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console
date:   7 weeks ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260517/202605170721.yN31OQcU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605170721.yN31OQcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: df260487f33c ("arm64: dts: qcom: add basic devicetree for Ayaneo Pocket S2 gaming console")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605170721.yN31OQcU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts:1250.29-1253.4: Warning (unit_address_vs_reg): /reserved-memory/lost-reg-mem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts:1260.31-1264.4: Warning (unit_address_vs_reg): /reserved-memory/splash-region: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5692.27-5767.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5789.27-5845.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dtb: displayport-controller@af54000 (qcom,sm8650-dp): Unevaluated properties are not allowed ('sound-name-prefix' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
