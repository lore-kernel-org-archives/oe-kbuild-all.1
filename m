Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0CB282E2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 04:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718081566; cv=none; b=hU3IjA/6HLPOWNjyDiawc2ry5qJ+Zf+YECrzqjCTnwGPrvOAFE65tNKi5yC8WTkudQFv7LO7XGNUJu1846p8kM2EuX0YSd+S4+/TEw2PSb94v5dJ8B/Udjoax9opaUqkeN2FMEwOe4LVXOZJLZJMskY3BDQq3JIlkKditaVwn7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718081566; c=relaxed/simple;
	bh=+abXTtz5u9UwU8JxApHKCe+Le90fbTzbhK0VlgBo1CY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CbXFESSVpPaiExqgOcmjRVcfpJtOwIR1Dc7pi+EZATctnP9bhBIe3hmvAuHtjnABEsX1Nx8kcN/DCUP9AK9mXbDXysEqbcLPbpKNoPdwHclKpxADxa8to784uAN4qwtqOcYzBFLnbP5gn/008LXBbLLo+lchZ7KA6eZl+Qk0VDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SDB9kC6k; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SDB9kC6k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718081564; x=1749617564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+abXTtz5u9UwU8JxApHKCe+Le90fbTzbhK0VlgBo1CY=;
  b=SDB9kC6kTrGSjeyCiVVhbpp5iQq06uo7TKjTrxUp+O6HyRUAEFIdHF1Y
   +fNFSPCD9BlBHZi3jR+CpJ16XZeYP4+OinmVyAmL22md8Qt5iXqus+0Ew
   W6SGB75ojQxanRrmbfat5HrfmYOAuIT9TCs9cGWD3UhzPMEDJ0eAifGsp
   F8aWgITXRkT76y/YSx2ObiRAldfN8eHHzZS04YNTuRV1rEtJmx5kyNkgl
   8NBIVC1phndXRTj49o7nIbZKbt3s/Ow7Kzt1kCgMfFThmyBTBxhBSUrlP
   1lLz9t4VtJi+SUwwSvK/NqegLljKruNcshDi05WU2T+y2yzMeDyCLmwsn
   A==;
X-CSE-ConnectionGUID: x0+i2pBtSOanBQf9WKnvZg==
X-CSE-MsgGUID: WpH0Rrn6SUWZAg/mbfT8Ww==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="14600892"
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="14600892"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 21:52:43 -0700
X-CSE-ConnectionGUID: 94GCHqJvQbmNvquT10fYDA==
X-CSE-MsgGUID: /KYnn+NRT2WhxBYL3GHd/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,229,1712646000"; 
   d="scan'208";a="39401384"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2024 21:52:42 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGtUt-00003G-1k;
	Tue, 11 Jun 2024 04:52:39 +0000
Date: Tue, 11 Jun 2024 12:51:51 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 34/184]
 arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning
 (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty
 reg/ranges property
Message-ID: <202406111230.oWDWBzTu-lkp@intel.com>
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
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240611/202406111230.oWDWBzTu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240611/202406111230.oWDWBzTu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406111230.oWDWBzTu-lkp@intel.com/

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
