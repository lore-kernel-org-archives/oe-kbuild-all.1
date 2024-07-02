Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFB03D978
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719942194; cv=none; b=EhdHZn65M4Kj9Y4na/bXpgC6QR/hf6PnFbKHR4uvXkZ73wnwemeu16fEyFBBtTPpTTdAypk0eooBJo0TkAytllf4XyGklx2VB46th/+cEjwyytD80bLr7UpRJcKC76UPnYt6Nt5ovwu0FXAQuVXhoF9oyDixJtsgGElFCLGwJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719942194; c=relaxed/simple;
	bh=BGcYftshMxh1pf6ka7U4pnPXgeFvebQrponR4pghL/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t1ojKmtVlmXEkecxatMV4rG8+k1pwbZ4ERWkSiIk6ymaw8FrCxHn8LixXhvsDkBX/9e3Hrk/nF6LwqulNoD0WDtt18BLpBnqHpV/FxVJx+mkv0+3fMx/2BuI+FAG2dvcYPOHbsrYOXJa9jfODhwPms3olm9awpk/HVPH+HV6RmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AOSTymTW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AOSTymTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719942193; x=1751478193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGcYftshMxh1pf6ka7U4pnPXgeFvebQrponR4pghL/0=;
  b=AOSTymTW9aI7omrU/n5OlltldGQ8NSy7qMkno7Dyjd6zUBYiuItdZCOk
   YVtw+ZvEVy+pHtERixGpK9WsxPiSAZgxj4gyZ4uCo6VFQNUYBe9oRc/y0
   iNV74l3b5Z9sGu2OU5YXCRw26hHdBd7OzMM96ryQcPRXip7w0BAbQLbdu
   YbngZsSEbAC5Q8XiLpnvopRInMym8BSwJvnw6vW3DawZ9JI6Or+dEYisp
   p9CCK3LIUu43gR+oWVGztZtDKYPXdbwXAoQgWPDrcINT7JkGvGWxe620c
   u9I+39RtZA6sgh5SCPqCQb4BXJ7LcVDk9Uf0h9K0f67oXrk2L8FnLYcEE
   A==;
X-CSE-ConnectionGUID: sGT0zlw2R1K1F6VshljkHA==
X-CSE-MsgGUID: rWyjG2K7Si6wzVhfwFuKNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="16793899"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="16793899"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 10:43:12 -0700
X-CSE-ConnectionGUID: oWZbBLCZQJWQvCoccGz0FA==
X-CSE-MsgGUID: IxNzoRHbTeKMPc2bZCXmSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="50828720"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Jul 2024 10:43:11 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOhX3-000OTc-0M;
	Tue, 02 Jul 2024 17:43:09 +0000
Date: Wed, 3 Jul 2024 01:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 130/264]
 arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: clock-controller@1800000:
 '#power-domain-cells' is a required property
Message-ID: <202407030117.cHq3vVja-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   818c2676e5816dad5a77df5a1c0d99d0e160d0b1
commit: 2ad7dd5479c04026f8421f12baf7a2b482cf0bff [130/264] arm64: dts: qcom: ipq5332: drop #power-domain-cells property of GCC
config: arm64-randconfig-051-20240627 (https://download.01.org/0day-ci/archive/20240703/202407030117.cHq3vVja-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030117.cHq3vVja-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030117.cHq3vVja-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq5332-rdp441.dtb: usb@8af8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq5332-rdp442.dtb: usb@8af8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq5332-rdp468.dtb: usb@8af8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
>> arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: clock-controller@1800000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
>> arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: clock-controller@1800000: Unevaluated properties are not allowed ('#clock-cells', '#reset-cells', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,ipq5332-gcc.yaml#
   arch/arm64/boot/dts/qcom/ipq5332-rdp474.dtb: usb@8af8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
