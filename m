Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B7238644B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Apr 2026 15:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775488287; cv=none; b=LjQn+GI7nW8i6T1vejlqWk1dlbUC8O1TbabDSqhC2/z6OaPgCtB5do3Va4w9Vi9ggyaD4drbttzWHaywBfrAlFH6nBE6d7U0j+4dWREJ6yp3D6g5TYimmDBv5P9V5EEPqtd0sHCBektt/S7JP4Tc0M3VJ+nf1TUzLEqROJwMDFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775488287; c=relaxed/simple;
	bh=WB8OVze2lISqR/jODkVzIIxseu6goxOE35h/8WXReKs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ixTHkjG3fDKysPWtxAnrfljJejDfMlziq5JYMcDmhWUhfHPwS+UtOTIq4idcrnErGWnHMmLsgN99fuy3RBnF+uqfBhQnDZDQM3YFfcfTbDuTSLSXGeCM5fUt2mUaWJ3QaUR8g5d24Kb7jozNEcdlsGBqbCj72c5vuNCVTVcpLAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gRhtzH9S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gRhtzH9S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775488286; x=1807024286;
  h=date:from:to:cc:subject:message-id;
  bh=WB8OVze2lISqR/jODkVzIIxseu6goxOE35h/8WXReKs=;
  b=gRhtzH9Sm1KRFKfXLd3/+09SMY6Rq8ZfOs358oD30N36DL8upsjLC/IP
   ro9crdTiM34pD+aB8lvv+QuWQonGlyC81hYU6XvxEb8HJr8OnSXuYkbgY
   xwgDz+WnUzOWJB8dKFgifmE8lECHJx6XZ0ZTfZEDvph89r++ZeomVSnEk
   mma6+jcQ5e8KRQoiifpwSnwOSN+fllGk25piBbkGUcPke7+E4GmeLLJEb
   9OSjpefIhd9scKHtKIdKcOWF5M3pQtIsji3IDlcBFpaATVIh3mbJdhLLz
   Gag68oE7Mte9yFCII7q7BQ7xd0syXYNcU9cTpYNhHvGzyIED6WUvnUVxM
   g==;
X-CSE-ConnectionGUID: KIcXcSmiTJqhFLmbbF2lNw==
X-CSE-MsgGUID: E22aSSu7ROWNtRg5C4CUuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11750"; a="76334262"
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="76334262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 08:11:25 -0700
X-CSE-ConnectionGUID: vSGcscjfQYK3IHoeNvltVw==
X-CSE-MsgGUID: L8FuHWonRTaIQkmNQLha1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,163,1770624000"; 
   d="scan'208";a="265866309"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 06 Apr 2026 08:11:23 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9lbk-00000000A3V-2pAu;
	Mon, 06 Apr 2026 15:11:20 +0000
Date: Mon, 06 Apr 2026 17:10:24 +0200
From: kernel test robot <lkp@intel.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Amir Dahan <system64fumo@tuta.io>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 10635/12133]
 arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb:
 /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any
 schema with compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410']
Message-ID: <202604061720.7UASAwWN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
commit: c6c66aa3ef33dc3076c6dac64003b29bd9515b58 [10635/12133] arm64: dts: qcom: sdm845-lg-judyln: Add display panel
config: arm64-randconfig-2051-20260406 (https://download.01.org/0day-ci/archive/20260406/202604061720.7UASAwWN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev13+g7ce498b67
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260406/202604061720.7UASAwWN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604061720.7UASAwWN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: ipa@1e40000 (qcom,sdm845-ipa): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ipa.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410']
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410']
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: sram@14680000 (qcom,sdm845-imem): 'modem-tables@3d000' does not match any of the regexes: '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
