Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E4B19ABD8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Mar 2026 04:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773981752; cv=none; b=eespbOVNsmUHN2TARkuJO1rZm4n9dBzQsEh9JC43yFpYeTkcMbuEHRnVQwknMyTy2o9DT7pAQtAJuoZmaXwbDVDY+Jizps3LN55Nz4Q0J5OTXK4UuhdRxViBqPFHrEXe71xo8ILnVoHYS1NPPSNYxmftz5cNEjEdrc1CmKgiK1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773981752; c=relaxed/simple;
	bh=ef6LrvVltpjNItI0/q1WHCFv04lE7y5ngHzwMTKm7NI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=al0EUQumx4qhrnpJ7uO95moaXB4q3ONPbozsoD+SaXfukzSXGg77IPgGsFUvVNRQj31q7iaeIaevEfLJJF2anTRCyEhNCCcjK1t6Aknebktep2+dvMfk/Y+XSaI+bHp8gTzG4q4FfVWiLD9p0JqsyFfsDGRgOCiW5JuGyW62X0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V4t/EdBE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V4t/EdBE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773981749; x=1805517749;
  h=date:from:to:cc:subject:message-id;
  bh=ef6LrvVltpjNItI0/q1WHCFv04lE7y5ngHzwMTKm7NI=;
  b=V4t/EdBExKJ4dLruL1w4wUQhW36btp4OOe9peUX/1jRDSRXtMAyi5smb
   cDsCuI4b5303tjhnEC4j7m9QEf8/pWD1eT9gLQU+FgPAku+6MB5sGIShk
   EPgdCX4xvnzTJ3Kfd/tVzeqt1oLumd6vKfA1FqxEyrkRkDLyAmu2jzop7
   FZ7+ykLSSJjhNmWfjWQMF2sgHK49T0fn3Ttdsw85RGAYZXL/E7ajeUqi+
   Do6DKMyIizZapGJpRCiVSerYwPf3sKxGcgbqE3XDtyMFBJMESTyx6S1A0
   hHvGaQc2ebwYs0kC5OHaVQTBsyESBwtXRvtwfGzWsT74AbvsyUmUtP94h
   g==;
X-CSE-ConnectionGUID: 5kgVxVQ4QOazjcqSMFdrIw==
X-CSE-MsgGUID: mtI4ui9YS72zQe8q/SgtrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74767026"
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="74767026"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 21:42:29 -0700
X-CSE-ConnectionGUID: BfhjACldQY+P5qVSTVYSyA==
X-CSE-MsgGUID: 0HW6kkxZSjePU0pzBNRGcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,130,1770624000"; 
   d="scan'208";a="225115622"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 19 Mar 2026 21:42:27 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Rgn-000000004y3-1MeH;
	Fri, 20 Mar 2026 04:42:25 +0000
Date: Fri, 20 Mar 2026 05:41:50 +0100
From: kernel test robot <lkp@intel.com>
To: Roger Shimizu <rosh@debian.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 6933/7683]
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[368, 369]] is too short
Message-ID: <202603200535.6UZ5hO6U-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b5d083a3ed1e2798396d5e491432e887da8d4a06
commit: 1cde54c54b83b33b49b9fdf760a58a7e6689789c [6933/7683] arm64: dts: qcom: qcs6490: Add Thundercomm AI Mini PC G1 IoT
config: arm64-randconfig-2051-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200535.6UZ5hO6U-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200535.6UZ5hO6U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200535.6UZ5hO6U-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/kodiak.dtsi:5357.26-5432.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[368, 369]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml
>> arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[368, 369]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
