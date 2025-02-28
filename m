Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7034F155393
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 02:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740711167; cv=none; b=lcH8i/2OnJdm4VWVIF9ElgvIDuxSeamVEXzDjkvt1mdj+P8vKpewOYpq7cc4WmrbMCQ2qRKxpNNW969uG+5eZMy2VEmYVteLTonidrSV3HjFcnl0WiSKRBxpguZTz7kdCHmnvyYkiN8faNf12qnbqS0RKrg/w2e5RTbOU17R308=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740711167; c=relaxed/simple;
	bh=I53fqGcUIJ6gvB96GP3o7/mIt+L7sVPvDLYZzp8EEm4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POBAokYfcdK7ABKfRl9Z0sbhRr+m/wAp15mPj6Dgu9BOwOq5A58e2d3W5AU68JEpYbsV2qUyLw0MDnyKhALBsRwZ6Lg80NBe1W+K9uy4S4syS7dFCREog7LBW7+2kAUsG/DF9TdzfKRkYfCrTYQ00JoXktIq5t2OfhXz/eVefeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wzhbu5IY; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wzhbu5IY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740711166; x=1772247166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I53fqGcUIJ6gvB96GP3o7/mIt+L7sVPvDLYZzp8EEm4=;
  b=Wzhbu5IYzjbA/L/cGk+xEY5toj5u8mrcyfq7rj1yZJoOgXdWJknDyrFw
   /WWHQJygEBPtVsN3JHQ/SRjYt7WI/u8+J+Z13OqVKaILb2cXLkxd3OrWO
   ZFBz/ZCZ+iREZZI7TTFO7JxW1jSYk1heE32DKwZ4fGg9P1CEovtE7aQFR
   h661Ry/LUFI6L3idxRxfUgMXVhE5Q7ZO1XymI4TA68gIyTWJNii7SZrPB
   8w+qKrhMmJETIc2+YgfT49GkcMuh+Dp2aDVICBFe/m3p77hazqKfbRG/O
   /HQvje81CFY5suGBTXpou3uf0LUsUGHQUpHHCB/D22H4KnFFExtqFWobp
   w==;
X-CSE-ConnectionGUID: btFk04+CRuKo0croxwUBjQ==
X-CSE-MsgGUID: VJ0Gej6NT225YhfYULnXCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="52272784"
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="52272784"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 18:52:45 -0800
X-CSE-ConnectionGUID: 0PfeEvpIRXivWPyKTxbZsg==
X-CSE-MsgGUID: EzcsVsiSRpq1XACLvzwlIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,321,1732608000"; 
   d="scan'208";a="122153544"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 18:52:44 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnqTw-000ELC-0o;
	Fri, 28 Feb 2025 02:52:20 +0000
Date: Fri, 28 Feb 2025 10:52:02 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb:
 /soc@0/remoteproc@b300000: failed to match any schema with compatible:
 ['qcom,sm6375-cdsp-pas']
Message-ID: <202502281054.NpVTFuQ5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   55feac40a34bcfe859c424b95f79b24810fddec8
commit: 91ed86aa8c8a2626c8b64a4548d1dd6a2b41e0df [1/1] arm64: dts: qcom: sm6375: Fix CDSP memory base and length
config: arm64-randconfig-052-20250227 (https://download.01.org/0day-ci/archive/20250228/202502281054.NpVTFuQ5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502281054.NpVTFuQ5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502281054.NpVTFuQ5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,mpm.yaml#
   arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: phy@162b000: 'vdda-pll-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
   arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: phy@162b000: 'vdda18-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
   arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: phy@162b000: 'vdda33-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
   arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: /soc@0/geniqup@4cc0000/i2c@4c88000/touchscreen@48: failed to match any schema with compatible: ['samsung,s6sy761']
   arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: /soc@0/remoteproc@6000000: failed to match any schema with compatible: ['qcom,sm6375-mpss-pas']
   arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: /soc@0/remoteproc@a400000: failed to match any schema with compatible: ['qcom,sm6375-adsp-pas']
>> arch/arm64/boot/dts/qcom/sm6375-sony-xperia-murray-pdx225.dtb: /soc@0/remoteproc@b300000: failed to match any schema with compatible: ['qcom,sm6375-cdsp-pas']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
