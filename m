Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6323CA5E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 00:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755218114; cv=none; b=CA1LbYknR9YMxN9IdOm1SdmjDPps9J85iarYYuRHLMgu1zjnG9JVoQSwhrtSJ0ckiaR1KkHlg7AoWjpqQSavKvgDPicOKKlH5+4+pd5iT7gj4ymKB79Svdmm013i9+7aamfzMmu2ya9eyG3qV8/d+T41vz/5UMD0KFgUei9vhqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755218114; c=relaxed/simple;
	bh=artMFXdGVR8o/HQI6Q4fO8ENrHYYfNiZswpBEMgm3Sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SDQKhd8FziCzIgOAUige8OGsA2zqZ0js4BuPeFB98UkItJrm/GS0tSWUaaa96Ss8EZ68++AQot6P9HHhHD+SbyWgKH0/Acak3BzoZbzK67Dj8/78Jeo54S44GAnZprtyyRRxi6Kek3oijigwbCzdiwjaH50+y5YGVi32SwiTFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mSZnDTks; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mSZnDTks"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755218112; x=1786754112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=artMFXdGVR8o/HQI6Q4fO8ENrHYYfNiZswpBEMgm3Sc=;
  b=mSZnDTksw97WjBEr+XVEIlaYrI5zjDva9qyOAMRFKIO10t2JnyE6BEiu
   moKcXDExCNlsYzs4PtWsAGkjPUPoBTTmXOA6/YRl3Sm8hOQaSV/7I6x3l
   zH4YVuZDCqxT7OcqcZRTol/ugmx2Y/nxfTQ2UIJnFbajD2iBHbzb48Yh0
   bfK2YmPgz+dWaSKqAHjVvb/iemsMGHtdYFd4FXkPmIA/Dy0pCqVSU+JTX
   Rw4n1IIJ5xeULDCz/kOhybAoekB8fXL8v6AKBg5mpOOd115zm16zNNA8Y
   4jD3PImRiYmqcSsb34NCcw4KY/OHw57K17pKA5i9kjdb/xEBYyXONMGNf
   A==;
X-CSE-ConnectionGUID: Lx1UJ0rGTiCt/lnMI6MQVA==
X-CSE-MsgGUID: SxqJqeK8Q/mTBjP7MfAGpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68923171"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68923171"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 17:35:11 -0700
X-CSE-ConnectionGUID: 7169570VSHKljB+2CW+1BA==
X-CSE-MsgGUID: qkMw5imzSAGi1jih2UjA+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="190595179"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2025 17:35:10 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umiPU-000BP6-0p;
	Fri, 15 Aug 2025 00:35:08 +0000
Date: Fri, 15 Aug 2025 08:34:43 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 2205/2527]
 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdss@ae00000
 (qcom,sc8180x-mdss): $nodename:0: 'mdss@ae00000' does not match
 '^display-subsystem@[0-9a-f]+$'
Message-ID: <202508150833.qVOkjjn0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   931e46dcbc7e6035a90e9c4a27a84b660e083f0a
commit: 26d30515eaa31ca6702db07ef46544a365f303dc [2205/2527] dt-bindings: display/msm: describe MDSS on SC8180X
config: arm64-randconfig-051-20250814 (https://download.01.org/0day-ci/archive/20250815/202508150833.qVOkjjn0-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150833.qVOkjjn0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150833.qVOkjjn0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdss@ae00000 (qcom,sc8180x-mdss): $nodename:0: 'mdss@ae00000' does not match '^display-subsystem@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdss@ae00000 (qcom,sc8180x-mdss): dsi@ae94000:compatible: ['qcom,mdss-dsi-ctrl'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdss@ae00000 (qcom,sc8180x-mdss): dsi@ae96000:compatible: ['qcom,mdss-dsi-ctrl'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdss@ae00000 (qcom,sc8180x-mdss): Unevaluated properties are not allowed ('dsi-phy@ae94400', 'dsi-phy@ae96400', 'mdp@ae01000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: mdp@ae01000 (qcom,sc8180x-dpu): $nodename:0: 'mdp@ae01000' does not match '^display-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#
--
   arch/arm64/boot/dts/qcom/sc8180x.dtsi:2641.31-2686.5: Warning (simple_bus_reg): /soc@0/phy@88ee000: simple-bus unit address format error, expected "88ed000"
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: mdss@ae00000 (qcom,sc8180x-mdss): $nodename:0: 'mdss@ae00000' does not match '^display-subsystem@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: mdss@ae00000 (qcom,sc8180x-mdss): dsi@ae94000:compatible: ['qcom,mdss-dsi-ctrl'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: mdss@ae00000 (qcom,sc8180x-mdss): dsi@ae96000:compatible: ['qcom,mdss-dsi-ctrl'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
>> arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: mdss@ae00000 (qcom,sc8180x-mdss): Unevaluated properties are not allowed ('dsi-phy@ae94400', 'dsi-phy@ae96400', 'mdp@ae01000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-mdss.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: mdp@ae01000 (qcom,sc8180x-dpu): $nodename:0: 'mdp@ae01000' does not match '^display-controller@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sc8180x-dpu.yaml#
   arch/arm64/boot/dts/qcom/sc8180x-primus.dtb: panel (edp-panel): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-edp.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
