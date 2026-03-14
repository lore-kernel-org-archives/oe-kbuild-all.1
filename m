Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430BF37757F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 13:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495746; cv=none; b=VGBOaA+DqFVNBGw8J3+vQAeEkZxxV84EEVl+J5BcyNL4bFEtoznAFvF8OZ2+jDCxTR3T0EdM9r7PPzES8uve1eTL1RoCmjzOK9nmAvxVQOnmKTLEjrZ7isKsuFdGU0uaZIY2TeNG1sfUTDkR3RTCslfRdCSGU/+QzRr1VAaqi8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495746; c=relaxed/simple;
	bh=/ax4D5WbZ4j7Z936bLwtsAF0Kl0Mv/5I2tvSvRsWFfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=On1mBJhcuZniiez7SOXsxWCTvOLCdX5gCoW1oBpcIDXdVhIWRO07wjKbSpiJTqVdp/06g0kx0++D46v8Hn1COLi4QufcaV8hO5sKkosSC6MlGIY/NuFKI+sAzAKxFXq1jY0YFgcHyL2qp/av9TTRMC6Impyfnr6X4ryn+FqbimI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=chqQxN9+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="chqQxN9+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773495744; x=1805031744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/ax4D5WbZ4j7Z936bLwtsAF0Kl0Mv/5I2tvSvRsWFfQ=;
  b=chqQxN9+FESeW/g6UXyZi7Rfsm8Acz4zgoNaK5VZryH2sRu+M7wX+b2s
   7b7fJVypaQ4grOZX9qVKNDV9ddqjoAiyLji+aGQYMkEOW1G7R/DhZIhhn
   xvOnK2n+Ct8s6u+mMo55tJIF2QZwWdmLUWupEr5nM2raXoyMS+YvU3QR3
   B5J7kTdJPgYfUM9B2ERX3JeFzzszqnrulnG3BIJ+0Fe5Szoua0jFcSiF0
   6LaazC7xXmEllXW0wBnrn1ust+AkpwNCwOb5tEK0Zh6dehVa/O+hmh4kL
   5Wp8d9Kbof4Vn1iHC8LyEBf9ERWfUxa+zbmmUC8pOJCHvzgsNZV0GaDfe
   Q==;
X-CSE-ConnectionGUID: C67fmvYxTr2+Su91kAVrdA==
X-CSE-MsgGUID: +y8+duisT0uitL4bfJjIWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11729"; a="74769607"
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="74769607"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2026 06:42:23 -0700
X-CSE-ConnectionGUID: IiUSE4stQqqMrcpgTIESrw==
X-CSE-MsgGUID: 5j4Buq+4S8iHle6yjVa7DQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,119,1770624000"; 
   d="scan'208";a="226107563"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 14 Mar 2026 06:42:22 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w1PFz-000000003nV-1H9S;
	Sat, 14 Mar 2026 13:42:19 +0000
Date: Sat, 14 Mar 2026 14:42:02 +0100
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Barnab=C3=A1s?= =?utf-8?Q?_Cz=C3=A9m=C3=A1n"?= <barnabas.czeman@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [linux-next:master 2908/6488]
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000
 (qcom,geni-se-qup): #address-cells: 2 was expected
Message-ID: <202603141433.MDqfoVHn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b84a0ebe421ca56995ff78b66307667b62b3a900
commit: 7bb7c90e0ac18565a45c02072356bf3dffb81bcb [2908/6488] arm64: dts: qcom: Add Redmi Note 8T
config: arm64-randconfig-2051-20260313 (https://download.01.org/0day-ci/archive/20260314/202603141433.MDqfoVHn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260314/202603141433.MDqfoVHn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603141433.MDqfoVHn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm6125.dtsi:1322.27-1389.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
>> arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
