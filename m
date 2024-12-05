Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6CD18C33C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 06:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733379851; cv=none; b=bvx5crDhd5s5aR92CPHMjoDMm2o8Omgca2yFsORjivlZA7dWNlRxC1ZFk3obbxUCwZKUBWNmGJ3CGxBMDp7tCp4HAONYk48XM0Xo204eg1G4kBdu7xQubzk0w2osVbyJax0vbN7nDLmouKSyDEtALcrnwlfLYj0jV3rMxy2ry+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733379851; c=relaxed/simple;
	bh=VUS9s3VNsX/vFPtTk6jAGcDvSqWGowHiEyuOHCJ54Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rdMUh+7yOqWyePm1po9ZogF7qTMw/Z65CEqRK92js4Gap0yBnP/PSsmsmgQsB+DGGPrQP6UguWte+4hKmjLiAAsj0swl3UcwyfGYeCUnIrpCZGCr3FGRmgRTQd7kgyJIR57raGX14VgeIVWdLLr+onlIl3bdJo4QlCbiUAY3csE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZLK/Exp/; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZLK/Exp/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733379850; x=1764915850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VUS9s3VNsX/vFPtTk6jAGcDvSqWGowHiEyuOHCJ54Qg=;
  b=ZLK/Exp/XBm4G2c1TfXy2/gPrwpHqFA+8WsjaZaaqjGDRKLrZ1eQTvh0
   QvKo0+vm21K3ayUitZv4NMjfTk2xPm9WIEy1Xpciw6LSsyNEYM6aNn2Hs
   RWuAl8d/N064rzaN2WqGVwJAxwinC9EoXzw+nYlvunrk87kHgXeTBihyR
   wxjdXqUURG8cVPEZHWE0E8BW7w8GYw87ek8wZpdLUQXA38gsNAvMirfoI
   Djz2TUE92CaTxI4n9oRhpgU2KLJbepP5JFiwKAmDU00q6rtjkI7xI1kD3
   UJLB7vzv3f7LvaIVwMDB+UQ+WSzUoHGoXHxqFTtrKjwVDRRjrR59YnLV3
   w==;
X-CSE-ConnectionGUID: aUdCQRjOTq+ZhcG79dIntQ==
X-CSE-MsgGUID: Plmr2Ej8TOaJ1xKx02jflQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="21256173"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="21256173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 22:24:10 -0800
X-CSE-ConnectionGUID: JTmEkR3LQcuu52Gdz25yQA==
X-CSE-MsgGUID: tySUhDOBQK2sbXbkboyW+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="117246412"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2024 22:24:08 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ5HE-0003sl-2c;
	Thu, 05 Dec 2024 06:23:54 +0000
Date: Thu, 5 Dec 2024 14:23:07 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 1023/1849]
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb:
 /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema
 with compatible: ['parade,ps8830']
Message-ID: <202412051437.zpPkzqUM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
commit: b16ee3d0cda492ded61f7224334e33eed986bd33 [1023/1849] arm64: dts: qcom: x1e80100-romulus: Set up PS8830s
config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241205/202412051437.zpPkzqUM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051437.zpPkzqUM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051437.zpPkzqUM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4357.11-4367.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/x1e80100.dtsi:4357.11-4367.7: Warning (graph_child_address): /soc@0/usb@a2f8800/usb@a200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
>> arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: /soc@0/geniqup@bc0000/i2c@b9c000/typec-mux@8: failed to match any schema with compatible: ['parade,ps8830']
   arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
