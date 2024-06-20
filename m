Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63E417FF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 00:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718844244; cv=none; b=X5syK/KsovcMQE/CwVmp4L5+LsYi1P6MdkkOe+UxCWa22ZMJfAwgT1Y5WhpQ2YtXD9Gz+lZknOIkzvknSj8CS5gyYi+KA/4cV3Ne5vKo+uqkodJhkQ+wGkw+IkInOZEk8o9qo6r+bcLAQPA6o4TR1vvSnr0bAFucyykJ6VMT1XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718844244; c=relaxed/simple;
	bh=qrLbpvzY000HRAWtu7+m7gsDus/n+IST2gO4hu7CYkw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lg4C39vFXrvtAykynLUBmbSKeTE1WtYgl92LJhcIkH2mIvjK86P8VtcVpjkONZFV9YP6LJDiiU0fHzJtM6R/BSgb0UrbXB/hMRa1gzrEHHS/ZyfzSCp0EWCB0qSqezTv6gtOJv8894Q4ekJxBjYZQYrAKiHXtE6hPnIfxoBqnVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbTACxla; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbTACxla"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718844243; x=1750380243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qrLbpvzY000HRAWtu7+m7gsDus/n+IST2gO4hu7CYkw=;
  b=kbTACxlaCJGPzEuPTxP1ZOmndPYaEyZ1NLGMkgJE8mduPjwbsHA1ZKhH
   K2xdFw7G7Jxkx6jPVKpK2DNujHYsHL+EJdtdQSxmhtU2iTpVnkbkiV/lh
   YPWoS7rVfCL7VCxvZpoFYflcm+EqEGQxCMXuyxNVtIdR9sY9Y52e7gkE1
   qVUz38pHBOOlxkHpjDRbhLPmJ3Boc09yunG+frz8mO9nsbk1y2Kz/RUhF
   R0a4rtffCh/lr2edDVj27oUY6Pqw65XoW8ACU0EtdZVlBQYwAaXduY6r+
   Gictth87GeFpicbi9I4lnaU1HpbS3OnbtWnpZAT/YSc7OGBorbxq1a6RW
   w==;
X-CSE-ConnectionGUID: SpnVJWD7SRmqToWrLdMICA==
X-CSE-MsgGUID: Mbt+2JMbSl6wC4Yt2cTI0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15932705"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="15932705"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 17:44:03 -0700
X-CSE-ConnectionGUID: S272bWVaSwSFHZ4dtG8ddQ==
X-CSE-MsgGUID: aZCQoeUrQxKAf4R4F4us7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; 
   d="scan'208";a="46523708"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jun 2024 17:44:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sK5uB-00078s-0M;
	Thu, 20 Jun 2024 00:43:59 +0000
Date: Thu, 20 Jun 2024 08:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 79/184]
 arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning
 (alias_paths): /aliases: aliases property name must include only lowercase
 and '-'
Message-ID: <202406200837.ZKORTbsy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 2eab058cc088bf2105f267eb24452c17c96066c7 [79/184] arm64: dts: apple: Add T602x GPU node
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240620/202406200837.ZKORTbsy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406200837.ZKORTbsy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406200837.ZKORTbsy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6021.dtsi:36.28-38.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:40.34-42.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:44.22-46.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:403.14-426.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:428.14-437.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:323.29-328.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t6021.dtsi:36.28-38.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:40.34-42.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t6021.dtsi:44.22-46.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:293.14-309.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:311.14-320.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:323.29-328.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +12 arch/arm64/boot/dts/apple/t602x-common.dtsi

  > 12		aliases {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
