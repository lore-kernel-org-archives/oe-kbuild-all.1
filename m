Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09139188006
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 20:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750279118; cv=none; b=Hp/I4ESDXqcaIxcS6D28dyhMgDWTcBTrB3fTP71u7Ockh5TtpF0I6S3ZvGiHdLhKVaolcSLgmMTcP7BQWqX6xtEFKqlzscTbyb6MfOQheHd0e5TIwsEPypHMVtKW6x9lU0pDe0cvMtFi+5J7DL10av9tqo9KePsjxO1JqJa/W4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750279118; c=relaxed/simple;
	bh=rYryCrQBPWPrJqOrSHuSXpZazy1Zt1QVc2qVW5QBb8U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eljVDDnRvVcitbzfDUxu7j2YkZOd3eBDj0HHvWSfyNmizuQBf8wiGDb0GajaSuw4V4sn1oHlnnoIMG3fcoAGIPjlmMKG3Otq2dpzS8a+h6Cad0hoOUuG84df02vJbmObT25KyMLibNUFHOGqsSZXJVCwbyEqSpq+cdSKNUEQ/mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IYJzpyAG; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYJzpyAG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750279116; x=1781815116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rYryCrQBPWPrJqOrSHuSXpZazy1Zt1QVc2qVW5QBb8U=;
  b=IYJzpyAGkePd/cEksopDlD2jbDTJyDQw7iVyA0cYCaFrEmgSK4Vl+UtO
   pZPpN1yIuvUZMKuMI8UaSAsgD8Bu8ExO/kE3GCfSLNk6E0qS7lbgIodKh
   jiqOnmNSzj6qLtAEOLkppqrAANgrjRbnhUg+Wd5scUrjA3WxE/UKBlS+m
   mG6O6ESF4/Qz4/+g8WcEPSjwg126y6H4hxYwnf/FeaEvj8qiRR8Meocbf
   uVaiA9NyfYU/AxhUpJPQ1UgA+8cpx/WuU96m7afVQ3kvhQh6905ldLSwF
   N7Y1uVnieAJn0KBba35fr9Cz6r1FPWtp91fVcNXKvgxP2qvM8kCBhrpuA
   A==;
X-CSE-ConnectionGUID: nh1rvWkpTgSvnFeMikM5cA==
X-CSE-MsgGUID: ME3tFJFaQqane86Mm1wLyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="52387192"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="52387192"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 13:38:36 -0700
X-CSE-ConnectionGUID: sg6dxJutTEukJ/h/PkzH8A==
X-CSE-MsgGUID: GM7t7wikQaqy3GMivCm50Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="187440537"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jun 2025 13:38:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRzYF-000K9y-1I;
	Wed, 18 Jun 2025 20:38:31 +0000
Date: Thu, 19 Jun 2025 04:37:39 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 3083/3311]
 arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb:
 /soc@0/i2c@7af6000/audio-amplifier@34: failed to match any schema with
 compatible: ['awinic,aw8898']
Message-ID: <202506190424.C9rentWK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6e5ab6fee68df8c40b338baeae6e269fa25a7e25
commit: 87ab84799a90bb73f3f42ae636b213ac4564e237 [3083/3311] arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898 amplifier
config: arm64-randconfig-051-20250618 (https://download.01.org/0day-ci/archive/20250619/202506190424.C9rentWK-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250619/202506190424.C9rentWK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506190424.C9rentWK-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8953.dtsi:980.27-1030.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi632.dtsi:189.19-201.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8953.dtsi:1410.11-1420.7: Warning (graph_child_address): /soc@0/usb@70f8800/usb@7000000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
   	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#
>> arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb: /soc@0/i2c@7af6000/audio-amplifier@34: failed to match any schema with compatible: ['awinic,aw8898']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
