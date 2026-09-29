Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA7A1F12F8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 01:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790644159; cv=none; b=BV3KNZuFxciSedusZa+KDLnQvxPS3TKIBD/gmeV0fJyRiruvmw7A9dvzJvpGeamySURbccGZWDkjdzFSGyS2Np//S9Yj/CerEq5M56cusKleQffpigzeiNacg6q25EsOSYFJ3fCKlBZZAqJ8lNyQ/PXosP8dctMD62LEYY9GmM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790644159; c=relaxed/simple;
	bh=1PZVMRdGaTsTnT/oySiTIE5kTk12x35u78LCqQfzmSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fP3eTjMIx4arvD3nYk21r/bJVVZKxuHdVuZrcgqBCnrvuwM7KP4tOKEds1qByGw0YlXLW1YqS6tF16CrxBGGzt1eA0jTb8LvC6BJe/YgbILf/7pmWajw0+lBD8+RJ6xMVzwYymyZCkq/aIuWGPfISpE8x2jEVeTRe3AfF2ekXSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T6KUX9kQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T6KUX9kQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790644157; x=1822180157;
  h=date:from:to:cc:subject:message-id;
  bh=1PZVMRdGaTsTnT/oySiTIE5kTk12x35u78LCqQfzmSM=;
  b=T6KUX9kQ/LJOt1XbjA5ZRck+CoT5C64caBQ2F5AeV/s6xGUuvZuKkcJf
   HiV8X3MPJvSQYT/rtPo9bSEH65XrHvHA1ARI+EuIF/HxBf9mQgeP7BDOB
   U/dWFDZNiy338WdyrqHswFFaHiuIqguUnyZa0xOQbNRSaHat3ygVzxe0F
   tyaqMaCQHukv9oc9p3wn41PNZlxcid49nACFMBDzK1y2FrjLVXpdkgJNW
   5OyZI8MNiOsnU7cSsXZop5x7m/J/Qq54beHruRb5cIXNBSaF5K8/XWOs3
   0KdXEdNuh34ZOwudZSQstnvQAFvEc/Mxqnm/1JQF/qfxXs10WJsInPdh/
   Q==;
X-CSE-ConnectionGUID: HBc/tPlqRreyCwld3woZoA==
X-CSE-MsgGUID: +oXdVmHPQpSzKQzaE8A6Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90254508"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="90254508"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 18:09:17 -0700
X-CSE-ConnectionGUID: xA/3/dn+QTuOxR/Gc1l0AQ==
X-CSE-MsgGUID: 87mlzZo+SPy75YlWv3tMZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="278425650"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 28 Sep 2026 18:09:15 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBMLJ-000000001EZ-0B2m;
	Tue, 29 Sep 2026 01:09:13 +0000
Date: Tue, 29 Sep 2026 03:09:06 +0200
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 9569/11456]
 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb:
 clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required
 property
Message-ID: <202609290349.4ad3d90o-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6375e61c01e93e35ee7acd336a689ac1fae4b509
commit: 55388f587b3301dffdb30074d00f069d80d29341 [9569/11456] dt-bindings: clock: qcom: gcc-sdm845: Require CX power domain
config: arm64-randconfig-2404-20260927 (https://download.01.org/0day-ci/archive/20260929/202609290349.4ad3d90o-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260929/202609290349.4ad3d90o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609290349.4ad3d90o-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml
--
   arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi:45.37-52.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9c000000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm660.dtsi:219.9-228.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm670.dtsi:2011.27-2066.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: clock-controller@100000 (qcom,gcc-sdm670): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sdm845.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
