Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC6EA12AAFD
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jul 2024 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720286227; cv=none; b=nwOy1q/xVBFCe9/8U9aFKbHW8Iwbi/Vgjyux/BEJ1VWnQawK8KyaOFSXzTIMwOjfReSGxPxmsGGtsu9XHCceGw94BV4NBPJ2x68JVZMElxMdY8/rJ7lH2gGK2tubDr65ujTi3LB8FMXRhefd6D1ceSiLxFDq6t6ixgf+jk4J7R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720286227; c=relaxed/simple;
	bh=Dg9HdeE2dMFtsaZYgdErdA+Fz37A5M3ROM7RrNXAFbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WbFMCWAPdb7EZKpAP2pZMVF97AMh3NNZJKGMpGYN4n4RJy2d8Exn22VikFN0dg+gJvnwoTKbG8aYh4AAHF+KM2wUav57oWDAsj21IPrNMcbgnpFzWDp1TzCYQNbjFlBizDetmU2+1FiNfIBfOOab8Sl0f44rGfJkwGSaF8D664I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ePFqieLj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ePFqieLj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720286226; x=1751822226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Dg9HdeE2dMFtsaZYgdErdA+Fz37A5M3ROM7RrNXAFbo=;
  b=ePFqieLj5DZ1QC5EW7cUKkXxHs0YVdAlJPjYuhjS5xkH+MgCuqA0JbP7
   0ml6G59z0rC9te0KsxrS6gw5q/yA9okM8hmzxckvahtOVXYiK0zRcI5fz
   8Kz/DL6rxsUS5436pxClHxAgHuvegHUsSJHc8ILM6znYjMrU7c+WSw3+S
   bdGGutPw6j9bpdLYqdf23WpaNZ67RtlK+5/2zhRwalwTVI8U1yfLo8SPW
   oqMSmkJtBqy3mPi9YDb8utda5RJRwI97AkzyN38T83zaqSnsE7nT8uJcj
   ofMS0Ymt7vP/giyxLOdQtogj9g9Cm5kvZRShwNdDi0ECmtLPqGJDpRf2F
   g==;
X-CSE-ConnectionGUID: Pqv/09y8RReFKx7aIUHiwQ==
X-CSE-MsgGUID: zhkeNFizQpm2YR5q7nvaSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11125"; a="35074634"
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="35074634"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2024 10:17:05 -0700
X-CSE-ConnectionGUID: sHyW2IbATFeKDg4CZgm90Q==
X-CSE-MsgGUID: XpTgDT9VQDeyONnXk5cWcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,187,1716274800"; 
   d="scan'208";a="47002514"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jul 2024 10:17:03 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sQ91x-000U53-0t;
	Sat, 06 Jul 2024 17:17:01 +0000
Date: Sun, 7 Jul 2024 01:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 7769/10451]
 arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000:
 'required-opps' is a required property
Message-ID: <202407070147.C9c3oTqS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b58e108042b0ed28a71cd7edf5175999955b233
commit: 0bdb730e63f6628b0f8deb3f11991b1d10f9bca5 [7769/10451] arm64: dts: qcom: sm8650: Add video and camera clock controllers
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240707/202407070147.C9c3oTqS-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240707/202407070147.C9c3oTqS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407070147.C9c3oTqS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3459.27-3534.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3556.27-3612.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:841.9-852.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /wcn7850-pmu: failed to match any schema with compatible: ['qcom,wcn7850-pmu']
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3556.27-3612.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@aaf0000: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3556.27-3612.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@aaf0000: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000: 'required-opps' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: /wcn7850-pmu: failed to match any schema with compatible: ['qcom,wcn7850-pmu']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
