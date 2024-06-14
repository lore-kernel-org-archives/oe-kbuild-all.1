Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14BD719D8A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 03:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718335355; cv=none; b=q0wIknYBw97n7z4cBdWFIRZ9g8LdqZ95Mah6kHErQ9QhMtYDFRchwqNANDL7Yhba+oj7UUKL6vOSR0Yicr/NtBHxXV4/l7qbwgJUggppSG+cOIU634NGpCGLVDHOTKIW7oYa8BJCuBxyp+XEis3A9u1DO8ZQyfybbDwRFC2SS3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718335355; c=relaxed/simple;
	bh=t09F/OVkxDf8D/S7yzTq2m9l6Tf8TAwus4haD+2glRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+/XBLCxMNzDufomDr8+zyBJKFiMMgMN/yOfkVcSlVTG8ZN1A+pqhD7srYe24n9D7GP+4o4KmKcPRDn/oPwu2i/hCMw8FFUB8S/2VHHctmVMgxMyxzcVEHtEclnqlrnUR7hgI/y5ZtLdks9+wtxA3G/afOswU0t0xXykCQgF38w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KBP17ZlF; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KBP17ZlF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718335353; x=1749871353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t09F/OVkxDf8D/S7yzTq2m9l6Tf8TAwus4haD+2glRk=;
  b=KBP17ZlFoD+G9UGoam6UIg66UPiu06EmkE7nJkqnpbAGQl56YGNKl98c
   GbAw2AKCqJg1H8GqilqgrjvOMuZHyGkvKQa6oBPF0GjCMeWxQpffVHXv9
   XrCftZKEvqKwP/w2svORKXOv9WF/+wjhfqZ5/ZRwf0lEUsNWQREVJeZgm
   ezBdOOi5NJFTBlVhTzFciJy+pj5l1zP/Rf6yinmgyfk8OYMUqEyJOMm9k
   waW5niKvoInH5e3Qu/u13VK3OW70ZBXav6A1pvkOx+yHIWYtmlRQHfqkh
   G8SwW60svNyH3TGxxS/aDvRG5D0EBS9rc33LQfO1/z0R/RE/4HOsFhz71
   A==;
X-CSE-ConnectionGUID: tD2sd4qfTjOAoHszTxe9sg==
X-CSE-MsgGUID: ZtAHQFjkTomy4v0FqBdbOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="15339273"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="15339273"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 20:22:32 -0700
X-CSE-ConnectionGUID: C9B+AjowTciEa/Jr/qmBlw==
X-CSE-MsgGUID: wHEwVoCvR9CAsFQbqEsRNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="44745021"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jun 2024 20:22:31 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHxWH-0000lM-0T;
	Fri, 14 Jun 2024 03:22:29 +0000
Date: Fri, 14 Jun 2024 11:22:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 3959/9999]
 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406141125.0kYGqZqT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: b99c0f465b6398b36ed3bef6fac8ad2078cd3bfc [3959/9999] arm64: dts: renesas: r8a774a1: Add PCIe EP nodes
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240614/202406141125.0kYGqZqT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141125.0kYGqZqT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141125.0kYGqZqT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
