Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B2B14BF8B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 21:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727473676; cv=none; b=bLyHz8zqzRHAyYgHAs2Q3LM95v3XxzYJoCNTslnX+FpP02a6MCAct+l6XspZEBaokiXjtoAkD6oy47bVhN3V+qCmJMaOS423y2JEoy9NdYPS/N7DTp9ykMNFggATdN4wacTGwTGmGaP14a8ElIG0f5ZEOKdd2Sd7qirf4NOSCXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727473676; c=relaxed/simple;
	bh=tO0+Uryzr7GZdBRQsB+z9ww/jJQBrLkUsyjQt0hv/Eo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JZPjOy9gh1UDJcl4cogZT34qY9/Dyvh0UdmuzeAIWD9StWg7hSxNAtPaf5+kYIOxisIZRSp0QjVEtwZSYwXrKf3t3VxlcJtI+oPmbnTxo90Tnlarxpok0cIIa7GjFF/93h3ufQc7D/pCWpwDSx5yVX/q6UrCYBJhB90+1zpOcL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hiT1PSH4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hiT1PSH4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727473675; x=1759009675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tO0+Uryzr7GZdBRQsB+z9ww/jJQBrLkUsyjQt0hv/Eo=;
  b=hiT1PSH4MoXdOYY5MesxLC/CIDGca75b3BSdOP0KY7zAZGgAT3ROLD39
   tsCGHjD4P8ne6LASoPqWSxg2GAW1fWEzLXJzpcTrr4NvZwtXo9Hvww593
   0HPT7bGNI2KaEJ1W9F9xNlehydBbz3X4fMJqpWmMqvh/2QLMrAfaFb52+
   TnouXJgt49DmBfon+6P3WBIbTwXrtB5f+VAMWy0OnI05ypg1BZw9gaQw4
   XJ7btnauB80D+gs7SdUEOd0HX5LxV/q7qsf+JvBE10/gBY5GGisqlI4xN
   1wHalIoFdFaNxWfXWl6lC+zLbQHZeC29S1QEIAKacc4sIRENrr1Pa9rwD
   g==;
X-CSE-ConnectionGUID: KBe1XO0zRUC8EBUw8/qwgA==
X-CSE-MsgGUID: 0IrySLQlS2O1LEQAWZHG8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26764048"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="26764048"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 14:47:48 -0700
X-CSE-ConnectionGUID: lyoaD1MzQdS+z4JGRkwsAA==
X-CSE-MsgGUID: IdN6g0ylSGe41xLf/NKeJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; 
   d="scan'208";a="72336041"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2024 14:47:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suIoP-000Mee-1a;
	Fri, 27 Sep 2024 21:47:41 +0000
Date: Sat, 28 Sep 2024 05:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3960/9999]
 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202409280542.gzdbk557-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   95b722b3ebb739e01ce712254a92789f843917e3
commit: 9c0fb84041f31639ecd580320f366031d0dc5ddc [3960/9999] arm64: dts: renesas: r8a774b1: Add PCIe EP nodes
config: arm64-randconfig-001-20240927 (https://download.01.org/0day-ci/archive/20240928/202409280542.gzdbk557-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280542.gzdbk557-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280542.gzdbk557-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
