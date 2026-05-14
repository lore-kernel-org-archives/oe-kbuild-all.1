Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D73D8903
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 12:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778761203; cv=none; b=Mi8awbJlrYs3Pi/VeqR6T1wOQ4FPIJCDZ66svLJQPn3/8a8hsDLwCnGr2fCMeCi17wva+Vb15dYOBumfP+BFiK8P8oc4T/gmIFYFkymFpYesXzXkUxx/T1oARb3mE47frQ7o4udjUhkXgpMdOS6g0UmAGtLqT21VbP+Zz7hRmEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778761203; c=relaxed/simple;
	bh=g5Jf14nV6v4GvURX2+QEOAohLY+3LefBvczu9tO45So=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JzbSlcSNiOQ1ZZLfPmirVUsjtF5XoVzE1sYOFFcTg01WY9YLkikA7vvcsVPXPvWiwMWVbEToO2hNoAT2yt5T7e6RM2D5gBpkcVzPq+1EIuyCWTARf/noQBI8qjm0fooDtzn8DvT2wOlmqKAdEhyycXNuz3HM+9zKNKSQE8X48QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cgg95zlD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cgg95zlD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778761200; x=1810297200;
  h=date:from:to:cc:subject:message-id;
  bh=g5Jf14nV6v4GvURX2+QEOAohLY+3LefBvczu9tO45So=;
  b=Cgg95zlDxYolb5gEzUZLItkTYcn2soekWuMjmxkgJHpnazpnDf6AQ+8S
   NmduXOAqJ1wrCrzTPjOpDRMg4E+VU7EoRkGezAzimWAOzK8SZZ2PcdWDe
   E0ST/skVyI68al3aPI99MMfo4UXJgmijQFtrUJPsgCXy86fFk4JhBNWlv
   HBSUMN+EsZu3cBsor/J2HQv5h1RBiUHGK3WUjfAgfGlae2n2ZTac4il+n
   kf12o4Un3zA84h4Muocg1zUT2gkIarUYwejNOSqBaBPJPIAxhKF4gTTV+
   8wsi1+T/AiGDCcJQOFjPJLlmlpfF+xvD7iTJbKlAJQG/9sYKgr+Yy+1FC
   w==;
X-CSE-ConnectionGUID: FBHL7E3TQAWyh/mwtabe4Q==
X-CSE-MsgGUID: MVdkKTbLRlW+wAMUWMQh6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91087123"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91087123"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 05:19:59 -0700
X-CSE-ConnectionGUID: Yxjgi9b6SSWltklFAoAB9w==
X-CSE-MsgGUID: vMh3PAckQ7GoAnA8XK/UWw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 14 May 2026 05:19:58 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNV2i-000000008oT-01Be;
	Thu, 14 May 2026 12:19:56 +0000
Date: Thu, 14 May 2026 14:19:37 +0200
From: kernel test robot <lkp@intel.com>
To: Roger Shimizu <rosh@debian.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: 
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pcie@0,0
 (pci1179,0623): i2c-parent: [[208, 119]] is too short
Message-ID: <202605141426.YXGlDues-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 1cde54c54b83b33b49b9fdf760a58a7e6689789c arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
date:   8 weeks ago
config: arm64-randconfig-2052-20260513 (https://download.01.org/0day-ci/archive/20260514/202605141426.YXGlDues-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141426.YXGlDues-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 1cde54c54b83 ("arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141426.YXGlDues-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5357.26-5432.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[208, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
   arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[368, 369]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
   arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[368, 369]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
