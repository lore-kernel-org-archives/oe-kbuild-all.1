Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25BFF145323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 04:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718339750; cv=none; b=RxFSs+WB0STU6RskabBTQVPq6hSVLuuWlxYr549BkuTGUVFMT6hwyAy9Yn3jd+hjhHyK0uPeCG0Z1lHZb7j1IFQpm6mciAmmFFCEwwiNVS0d6/CzJnx318U39UO5ilQ8CF1CuW9+mvMLaZ5uf0uNFx2vd+o5wGXdx4eNerdO6M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718339750; c=relaxed/simple;
	bh=2pP22+z0kx7pAXNys4UOwTPfZFBO0UEvT0njC/3s6Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCF2irxnAIAj/0l2Sv97O/pEEuv3b0RMnlq3/mXomwyh+iEMQuw/Ygs71B5DBBYF9C52wmW8mRZcRcI18gYGT8PVkoManPplarS/fw31KybFMa5Mignq8kksNJEyMnWvLJR4hSZ2Apv2c0IXAvnY6RBVuLmnsB/WTXTxG74zNCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UWdsIRlf; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UWdsIRlf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718339749; x=1749875749;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pP22+z0kx7pAXNys4UOwTPfZFBO0UEvT0njC/3s6Uw=;
  b=UWdsIRlf6w9jUnpmxTCzRtMBQ9xuvh1VxLP3Fuc2jPimzhT2bmRzBVbt
   2/wG7l9/AgAADVCMH73LEoia+KHnvzBsYj1I7WemndVVj4w5vUPBEcrDR
   luOAehIBtbzBWyxZAOnBR3/t1SeQshMYH9rlm9+WQYoExM7RR0WW9RgFk
   YcCgBp5Swat5DW+fJTnYVWnFR1PerIV4/B8wQfxqG1KbvmeUd/VcSEsRw
   3OQVR7xr6qbqylE2Zv9HxefoubodTBv262NDwHm2d84Wiu8o3eFkpsW2u
   JvwU+UfP4C4aFpxEI572sQwmZaJyFXH0V60wBCWub9SxjkA0/ZvwE//di
   Q==;
X-CSE-ConnectionGUID: C0grWls7TaSUUPOl0oUoAg==
X-CSE-MsgGUID: y2U+phJnSYit3qZiMuuiTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25884703"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="25884703"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 21:35:38 -0700
X-CSE-ConnectionGUID: o2F9NK/rSgWSLY93Hw/V3w==
X-CSE-MsgGUID: s4xVv4vKRlmNPk7fl6gmjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40872762"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2024 21:35:35 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHyey-0000p2-1J;
	Fri, 14 Jun 2024 04:35:32 +0000
Date: Fri, 14 Jun 2024 12:34:58 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 34/52] arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: clock-controller@1400000:
 Unevaluated properties are not allowed ('power-domains' was unexpected)
Message-ID: <202406141248.nqHcs5GG-lkp@intel.com>
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
commit: cdf071c419834de3ded122e2b4ef7b2a7dfbc7b4 [34/52] arm64: dts: qcom: sm6115: Add VDD_CX to GCC
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406141248.nqHcs5GG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141248.nqHcs5GG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141248.nqHcs5GG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1920.27-1990.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1878.11-1888.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1920.27-1990.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1878.11-1888.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1920.27-1990.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1878.11-1888.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1878.11-1888.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: clock-controller@1400000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm6115.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
