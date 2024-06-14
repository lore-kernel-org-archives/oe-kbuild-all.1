Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432EA2836A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 02:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718331450; cv=none; b=OJza7aksidlE7+Tt/HllKTMgFgQORM/p6Pf3P6xmjhuMtTFYZyhkQOW1xdQckGo4um2smv+1hVwWrFEgOCP1dAp5XFvh2eR3sPlbArX51JZPtDbcmHV66g6hTOe3gU0A59UlqO3EIzC2kvGGgD57Y270S43EoT8tZ3DXMynrvkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718331450; c=relaxed/simple;
	bh=HH7H1T26THnZs7KvpH46MRNyBEr9++c9bejVbalbJEU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hN/JItyKuaM9NusAMGVptHNt6G+AB2HviBw7MeJNs1KHQW8gmwgjh5JeeHbpHTbXHl8LV3TRRVtOuDjE2WGYZpRv+0+XF+5woRVZ1v05DEJckzU1bTJspbYh8wSZs7F5YRFX9eTV487ts4VhyGt6rk5mSFCffl9pKYWeuaVDDSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWgF0X2T; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWgF0X2T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718331448; x=1749867448;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HH7H1T26THnZs7KvpH46MRNyBEr9++c9bejVbalbJEU=;
  b=UWgF0X2TK/PZCe9bb+FVjGOsZZlVjM3T/cWSS5hWHLi4siBJbFXa7PXU
   dYCSeTgrn6DQrde5GX+7Hm7YdC8vrrcFwG6eFE1+RGpL6fq65OcAYdT8R
   +1vZh1Q6qxtPaXEUTYePG7atpynw3+QLIkR01M6V7RgFq4PnTgnRI8jQi
   zfeXmlPLSfYQSX2p0AQA4ubROurXyL2TNi8vHBL+iOgopGYfhT0uBM2IA
   ZSa0rF2a6/EBHKhJvmRdvJMxiNQDM2OIdECTQYaE0oA2ClPcHlzoosS+V
   fNvSyT1DcvlF6Kg+i4NfmbmbuEaYEpAyjDq2TWD4MXA46Xxm7yjJjma2a
   A==;
X-CSE-ConnectionGUID: qOPsBo8tSUCXB/jwbl1Mmw==
X-CSE-MsgGUID: uOi8iqoBSTyLNLbSMg2etQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="12067384"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="12067384"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 19:17:27 -0700
X-CSE-ConnectionGUID: 3exbHXwoSi+sBahjkHu/ZA==
X-CSE-MsgGUID: 0q6GF8rTSx692zx9iDkC2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40462341"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jun 2024 19:17:27 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHwVI-0000gu-1u;
	Fri, 14 Jun 2024 02:17:24 +0000
Date: Fri, 14 Jun 2024 10:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 33/52] arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: clock-controller@1400000:
 Unevaluated properties are not allowed ('power-domains' was unexpected)
Message-ID: <202406141045.l83SA0w5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   1c608efa13a09b28407cf405e922e4a80c778dd1
commit: 7c7f4e0d4fe5b28001738dd333a16d75ef01393f [33/52] arm64: dts: qcom: qcm2290: Add VDD_CX to GCC
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406141045.l83SA0w5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141045.l83SA0w5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141045.l83SA0w5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1529.27-1602.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1487.11-1497.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-qcm2290.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
