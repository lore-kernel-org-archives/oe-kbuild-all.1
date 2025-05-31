Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35562E545
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748711033; cv=none; b=WI0A9HP5pvl+DtJXl3J1dLk4L/J/0TZ3QMWKVvWgTJa2/MWvREKUNjy6QujXsfivwIrQlglbsDBVZfgyjOIlCjigev//a+N9U3+5XJeyKxosjwFwB0NDNzZPye5ZqcLH0uNcq7DR3CmGV/ZdhJhcTA2aEYs1aSRPtYcfWwv/Haw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748711033; c=relaxed/simple;
	bh=4rn1g04wd861nj3hhoErDqJYqKAlpUObFp+KN4WiWx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcicLdD889QV05Po4lLMsqzzY32/+XL62D7V8QLH/QMn2Jvj+mPHfRulKEbRXPVrhXZ9oHlmWXNAQPdYdDeRcf48DiXYUV1J3t9+SNveb/OD2nvd+l6mgw09e+zKnSEC1A5NFp5pXQeCnGIGVvpJvD2n6tj523ATolQMc4/9VEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7Z3oI2q; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7Z3oI2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748711032; x=1780247032;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4rn1g04wd861nj3hhoErDqJYqKAlpUObFp+KN4WiWx4=;
  b=h7Z3oI2q1CSQC9DLBnjvpTK0SCQcMHqsbsY6X2yvgb4BSNVdHTGizmC5
   bVrvBiYTdxk3uWMy1hp83CYJUuuTpmlOpSsQ97FJ7Zgy6/jbb16Mw6Z0P
   qfFIQumAkv9OrMo/2xMZhYgmPpZfWtqpZuAlMCW0Ia0Uu+JDXQQJVVygZ
   UP4Uf7OH9m4KAn+NQUTKdPZV9X9RjU3rrCZikexza4jmDgGZMV4LGOTv6
   ezp/efxPNG2QDx7wDlckiTnYwvXJPWYg6/fJZ8uRnCMKuop5+WjincRTN
   pVcTNlrfyQNxbPx1pZfgRjBaTzkbQCbVCosGSJOFq0ySbPvmlaA/IotYU
   A==;
X-CSE-ConnectionGUID: 6YBE9YEPSCm17f4THESaPw==
X-CSE-MsgGUID: MJdvg9DRR42QITqotPIo5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="62180380"
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="62180380"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 10:03:51 -0700
X-CSE-ConnectionGUID: dZdSmUBMQ4+4Wyy9rDpj8g==
X-CSE-MsgGUID: K85gpcH4QYqfEnXcUuSiCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,199,1744095600"; 
   d="scan'208";a="144060791"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa006.jf.intel.com with ESMTP; 31 May 2025 10:03:50 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLPcY-00012g-2Y;
	Sat, 31 May 2025 17:03:46 +0000
Date: Sun, 1 Jun 2025 01:03:44 +0800
From: kernel test robot <lkp@intel.com>
To: Nirmesh Kumar Singh <quic_nkumarsi@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Sahil Chandna <quic_chandna@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [linux-next:master 10072/13986]
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2
 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
Message-ID: <202506010127.Kbh43JmW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3a83b350b5be4b4f6bd895eecf9a92080200ee5d
commit: 6a563a9760af9d5476faf8b3fd419b0714ab0b4b [10072/13986] arm64: dts: qcom: Add industrial mezzanine support for qcs6490-rb3gen2
config: arm64-randconfig-2051-20250531 (https://download.01.org/0day-ci/archive/20250601/202506010127.Kbh43JmW-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250601/202506010127.Kbh43JmW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506010127.Kbh43JmW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
