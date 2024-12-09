Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8D15625A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717533; cv=none; b=qF5Y+N5C08GrUGWkew/KCuCZ2Qy61JQAMWZpCnWO4JbRiINy60JSv9tso+GUuCuWsSH8N8yzYgSSCftU43Y0oU5u3wDMYq79K68e97472C7qauZSK69In2KEhTs3u4CGDt3R9SZgdfUv6XsqY2tHyMrsJI95SKMdgMlTImV33xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717533; c=relaxed/simple;
	bh=QHvyhH+Iu7P8pr2GcMp094tjHw1m3swjUDbLVwecHI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qolCZHAyEl1P+FsZjqj3Ra7XmEQKvuhur/6mpbOAjjC81nlvivBj/TtEfZ6baErsGxauyzDc6xl3/r8ODfee8xAidjKDrBtWFsxVemzzLcU5hKzY9e7RTWxGOqeUE9hiy9dwwW0d7KtImRxBQ8P+U5X7GEuSXpdZDxDlykMDudw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfvCsSKP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfvCsSKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717532; x=1765253532;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QHvyhH+Iu7P8pr2GcMp094tjHw1m3swjUDbLVwecHI8=;
  b=XfvCsSKPfhzx4VYSY9u2gdoAOI1BDKmaMBglftmPMg/X+Y47Ov+sT0GQ
   iKctVc0MV4mQOLWGfGB17UyxL6g/Kdta/h/ugdzyGNnmFPyq1HgHW6DAo
   HU0zd8H4p2AiiIB/m+PmWTOvx9K9S4JHb0xMZ2yLfaAGjHmQaEQW9Dy1b
   iV2zWDORGuxEMXTpZbkK59GYl7Q+KPEnduGEZaem11a/U9ZESC+OJ3t4u
   7LEM4WtTIhx4k0Z0Y7njNcm3T33qg79GrOvdx6dJRsSxsHYPl3MFO38J+
   t0GVTP/KZ3HaFsiEoDcOlYuG5ic+LJGzzPGu8NtgepqA1GlA8+v64rSg8
   g==;
X-CSE-ConnectionGUID: hgNdRMC1SYyQlMqxPke/Vw==
X-CSE-MsgGUID: cF9dBn+2SH2RV0hK1EDWHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33891395"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33891395"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:12:10 -0800
X-CSE-ConnectionGUID: dr1p7lm5Ti+HXu6hICKh/A==
X-CSE-MsgGUID: kLaxNoziQx2O0aCTSb4hZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="99004595"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Dec 2024 20:12:08 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKV7t-0003oJ-2O;
	Mon, 09 Dec 2024 04:12:05 +0000
Date: Mon, 9 Dec 2024 12:11:04 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 992/2462]
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb:
 /soc@0/geniqup@bc0000/i2c@b8c000/typec-mux@8: failed to match any schema
 with compatible: ['parade,ps8830']
Message-ID: <202412071547.CLFs9GKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
commit: b16ee3d0cda492ded61f7224334e33eed986bd33 [992/2462] arm64: dts: qcom: x1e80100-romulus: Set up PS8830s
config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241207/202412071547.CLFs9GKS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412071547.CLFs9GKS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412071547.CLFs9GKS-lkp@intel.com/

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
