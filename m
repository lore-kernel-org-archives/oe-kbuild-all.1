Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D144AED1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Jun 2024 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718217132; cv=none; b=Nyde+01nHpg6f5KfgiUL7oJdKrW+WmNL1huavC9wLpEq/9EsV1FGQ4l9pxVOjxzxhyGjgKku3iutmkQwoxotehpz4j83OctEiZ9PK3Z5mhwTCLmFkC3u4KseVZu6HEHhpXeEMKsK9evOZACmqPUtJ3r+Teshm9HZK3QJ8MoUPOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718217132; c=relaxed/simple;
	bh=i3Z11r8aF4i8JieUN6q/DcXCbHCFtEg8VgiJKgxZegI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MHTAJU/vHbS3HUYPXG4WpakPacEhWw8MsTQRsS8vuU4FmqOq+N2cr7DsTwItBhv6nlJl6foivSDFd+XaO/wY90rtKwNebSRT521YUtwbXIhQ/CrGDUHYve59pidxe0HV3PdS8ZJWT5qaU5ahmC+XTDmWlnMx8Rc53rn5UMilKD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IqEHAFPj; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IqEHAFPj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718217130; x=1749753130;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i3Z11r8aF4i8JieUN6q/DcXCbHCFtEg8VgiJKgxZegI=;
  b=IqEHAFPjTRKXh94eNj1TQ+KAOuBe25OgP05CxJ/luG5gb/7JZEF2qiaY
   5o8STebK8qXfNhBr5q99BsRTbYLg9jAPPbe1OlPQHS5MHrv3XoLc256+3
   bQD53wKEfJULjgMR0F0wTmwftURRdgf+WwxB5u/r8kMfag3uAZgT77fCK
   dwzwX5j9KzXa7GP6pDNqi3+XTOVug4F5HzlRPMkpAvDT0K5jyvZHHRfJS
   cyxI4VBILF0NKU9tJBBZhaXK/Pcvn3P3ve0hTDPVuYiMgD46e9+wrX5EB
   GHdzRxLv+YAbDKNlwNjbWMvNDJP4yCoUNfoGYPQ1XK+u35p31rkzbZaSa
   g==;
X-CSE-ConnectionGUID: Uo/eZ6yYQRiGSbEX925NBQ==
X-CSE-MsgGUID: a4ykI2sHSLC99pAq5rHK6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14834417"
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="14834417"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:32:09 -0700
X-CSE-ConnectionGUID: 8gr4MbSdT6udXbaeG7R1Jw==
X-CSE-MsgGUID: Pnw4tfJsR5GDuDBlD/+X0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,234,1712646000"; 
   d="scan'208";a="45000469"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jun 2024 11:32:09 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHSlS-0001p0-1j;
	Wed, 12 Jun 2024 18:32:06 +0000
Date: Thu, 13 Jun 2024 02:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 34/184]
 arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning
 (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty
 reg/ranges property
Message-ID: <202406130245.Ay3vXtLM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   f5ebb40d8ef5b574bedcdf949aadfdce5a590d7d
commit: a9c1572548f5a0f1751dd003c44f586b1137e442 [34/184] arch: arm64: apple: t600x: Add display controller related device tree nodes
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240613/202406130245.Ay3vXtLM-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240613/202406130245.Ay3vXtLM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406130245.Ay3vXtLM-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:227.14-243.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:245.14-254.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:137.42-140.7: Warning (unique_unit_address_if_enabled): /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:13.10-20.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:69.10-78.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@38/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:95.10-104.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:121.10-130.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3b/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:147.10-156.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3c/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:41.10-50.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@39/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t6002-j375d.dts:68.10-77.6: Warning (graph_child_address): /soc@200000000/i2c@39b040000/usb-pd@3a/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +230 arch/arm64/boot/dts/apple/t600x-die0.dtsi

 > 230		display: display-subsystem {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
