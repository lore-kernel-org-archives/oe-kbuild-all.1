Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ADF3264FD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778774708; cv=none; b=qFbIwgfEvmu2ZWoJS7pm8NPe/omKslZ70pXWqOkDcbT+V0Pw/84Liiio7+mqoMoqpzNnpZBcbHyFa43Wz6VqSUXq2DdxXZr/itn5HuS4i6/LvlyJjNHzOzrNNAH1i2Sq7iEIC3YOGZNIdTlMBaKxYHQYYbxBBVXqQfEVOO4teC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778774708; c=relaxed/simple;
	bh=gQ+x5vmmXUHkYnJ0CtkOlX1FRjeNH/f6odCkGHDi+0Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BV1yP37u+6RgPt9KJrnlsAjNlMpaIgTN7XtVoKtDAolRRRTW1bd0nKhJRtKSVyDlZvWEXStZGODOvoN9XoEvrMIWBawJby2PljbqhoDgcaFoaNaV7gjc1ILp4IinD+aavz8c2slvkoj2/YjgRqdLX36I9uKhhyL4UbuPJZf5hl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfGLLb1c; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfGLLb1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778774707; x=1810310707;
  h=date:from:to:cc:subject:message-id;
  bh=gQ+x5vmmXUHkYnJ0CtkOlX1FRjeNH/f6odCkGHDi+0Q=;
  b=NfGLLb1cacXmVPE41G2MxoQLfKTQ2cCQV2kf/TZ8ap1D3uGiZiDeNMHl
   20RyI+ayMCLo4lWzEhN+MdfRzAG+et1wzrp2zJ/vtti38wK9ZnlWOfT5u
   WEr20sRScmXVp32mvDa7wlTYlZ2b5xentRVQUw8w9Mc35wPtTAqkVbvYz
   ancNQIHpSL4hPg2RD7zB0xRNQSMfLhCU6SQJqZIzbRxf5en8XUM4ROOGC
   vpgqS9c3Sj/uzCVusLY5xZOXWrcf/IaQv/ylEaofgJlQQnA+lLh7emhJ+
   +fM2TVyDq8XbaWS2XneWmm/qdS0kUBIzK7HXE5gcphXBYeRGwCGnoGctm
   A==;
X-CSE-ConnectionGUID: EwskQV79QNytnnSayAOdTg==
X-CSE-MsgGUID: Ox9DdzuwTCeBn+/WF79bKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79758710"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79758710"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 09:05:06 -0700
X-CSE-ConnectionGUID: n/o7GughQ0aKpKmtoT/45g==
X-CSE-MsgGUID: 8hSL6zn0TmSdjfVILBZVSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="234137335"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 14 May 2026 09:04:59 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNYYT-000000008ph-0Nm2;
	Thu, 14 May 2026 16:04:57 +0000
Date: Thu, 14 May 2026 18:04:29 +0200
From: kernel test robot <lkp@intel.com>
To: Umang Chheda <umang.chheda@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb:
 pcie@0,0 (pci1179,0623): i2c-parent: [[498, 119]] is too short
Message-ID: <202605141709.3cBcjDET-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 5a67924d2fc5787d894bdbd8a87ad6794487060d arm64: dts: qcom: monaco-evk: Add IFP Mezzanine
date:   7 weeks ago
config: arm64-randconfig-2052-20260513 (https://download.01.org/0day-ci/archive/20260514/202605141709.3cBcjDET-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141709.3cBcjDET-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5a67924d2fc5 ("arm64: dts: qcom: monaco-evk: Add IFP Mezzanine")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141709.3cBcjDET-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: /soc@0/geniqup@9c0000/i2c@980000/bridge@4f: failed to match any schema with compatible: ['lontium,lt8713sx']
   arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: interconnect@16c0000 (qcom,qcs8300-aggre1-noc): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,qcs8300-rpmh.yaml
   arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: interconnect@1700000 (qcom,qcs8300-aggre2-noc): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,qcs8300-rpmh.yaml
>> arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: pcie@0,0 (pci1179,0623): i2c-parent: [[498, 119]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/toshiba,tc9563.yaml
   arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: pinctrl@3440000 (qcom,qcs8300-lpass-lpi-pinctrl): compatible:0: 'qcom,sm8450-lpass-lpi-pinctrl' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
   arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: pinctrl@3440000 (qcom,qcs8300-lpass-lpi-pinctrl): compatible: ['qcom,qcs8300-lpass-lpi-pinctrl', 'qcom,sm8450-lpass-lpi-pinctrl'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
   arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: /soc@0/pinctrl@3440000: failed to match any schema with compatible: ['qcom,qcs8300-lpass-lpi-pinctrl', 'qcom,sm8450-lpass-lpi-pinctrl']
   arch/arm64/boot/dts/qcom/monaco-evk-ifp-mezzanine.dtb: interconnect@9100000 (qcom,qcs8300-gem-noc): Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,qcs8300-rpmh.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
