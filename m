Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2246157A5C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 13:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735739214; cv=none; b=XZcGSyrbQ0jOPe6+SzWbEiRVtmRW43bJF49PU+05kGNqHEB/PhajswqtTpg/NiyPKdzjsREQV0b3PTCRh8BlAUfYd1y5mluyK6bX3kaHidQGzTf1xdCeV8TLMh85DEYbDrmElhb17QcQY9mrIpiEIqPD478Ge4pgBHfWQO/c/AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735739214; c=relaxed/simple;
	bh=Mr1+HP/CCMGQ+ucnxNTtBBsKm1LgMtZCOorgNR5SgUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ks/1611Qu+IHz8DEegl/9v9VJfGX80JMoLKVVqgXGlnAn9xVOWKSxW2TG8jIL8LUtGxxtmyf2zTn0oaSfYDpUgpF7578SLkQSxclcHXT5mWBWedjt3bIUqwDss81/ivGEHsBQGwJxYUyEfCmGmETEn+UQUEFwgOCpL69ePNHmNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kz0uPQ5w; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kz0uPQ5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735739212; x=1767275212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mr1+HP/CCMGQ+ucnxNTtBBsKm1LgMtZCOorgNR5SgUk=;
  b=kz0uPQ5wcOq0+wOA1xsc2iVmsyO1cTEQ8qbwdF8tQiCMsnmLh/WzvFPh
   /7S761jQaOKFuy5H6pM96eX2Rt6EuSU3oZ0WpP83uDCRLojN8/desN57S
   YS/NJk8h8Fv/6WGe/RfTnCRZM2FR2iNMJm/P5i/kusOmvErn/vsdrMgTc
   E2VQRh9PibZ9qXeM7PtPNd7uMmdn4NC87z0zS1MTFkDceZ6PMgOHxnHCA
   o7WTZGETYw/DGRich9d2pHTO9E7aGPIevgvjZfvMA5ldMmQ2spC6mgPmV
   35Y7+VEJ0BttI0NHL0taKhc1kOs+EezQY5J1puoMexPH0nEOrWCKsdsZE
   Q==;
X-CSE-ConnectionGUID: 7Xdm9UpDQwqx0s7igmtE4Q==
X-CSE-MsgGUID: A1/lz/RgTgu5R/aqRcpIaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="61366267"
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="61366267"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jan 2025 05:46:52 -0800
X-CSE-ConnectionGUID: 4Kn/5lw3RYSZoBHY5b8LsA==
X-CSE-MsgGUID: +DLcsmVDQgaejsoKxD/6Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,282,1728975600"; 
   d="scan'208";a="106239294"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jan 2025 05:46:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSz3g-0007rb-2t;
	Wed, 01 Jan 2025 13:46:48 +0000
Date: Wed, 1 Jan 2025 21:46:15 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.13-mt7988upstream 35/52]
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: xs-phy@11e10000:
 usb-phy@11e13000: 'mediatek,syscon-type' does not match any of the regexes:
 'pinctrl-[0-9]+'
Message-ID: <202501012144.392tiPij-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.13-mt7988upstream
head:   389c42a09c0f89ac7792bb5dcb77dc09173265dd
commit: 0c41c82e7dc3f83e5430aed0539a145a12e65e3f [35/52] arm64: dts: mediatek: mt7988: Add xsphy for ssusb0/pcie2
config: arm64-randconfig-051-20250101 (https://download.01.org/0day-ci/archive/20250101/202501012144.392tiPij-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501012144.392tiPij-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501012144.392tiPij-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:533.24-554.5: Warning (unit_address_vs_reg): /soc/t-phy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:566.19-588.5: Warning (unit_address_vs_reg): /soc/xs-phy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:533.24-554.5: Warning (simple_bus_reg): /soc/t-phy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:566.19-588.5: Warning (simple_bus_reg): /soc/xs-phy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
   arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: /soc/topmisc@11d10000: failed to match any schema with compatible: ['mediatek,mt7988-topmisc', 'syscon', 'mediatek,mt7988-power-controller']
>> arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtb: xs-phy@11e10000: usb-phy@11e13000: 'mediatek,syscon-type' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/phy/mediatek,xsphy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
