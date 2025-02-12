Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CABA2116F0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374272; cv=none; b=WAmzBMAZc+tKptZ7F93bhUyx6/QTi40Sn4+zxfsiAWY/NmTWwErQ8Frh4A9bmAXojrbL/MIgzbtDfg6fLm61syOfVc9fnsaIeh3G4Olc/uyFJyaS7e3J14uNcChCwy9rx/nyRQif4a7Rz9/VcPSyQkd9GTysuci0pT2/6WA2cO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374272; c=relaxed/simple;
	bh=cc/TsyM5vRj7FhvojiV6L1cxGxqs6u9HMfYyUQeYcTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fcOTp9tXrJnmTr8NTk71D9n/W+rnWMlQTs6mk2qT379tb9wTcpLADBNIPYCSR92YR+5FKeBtUIn0cwWMy8dI/ddHbnprSdTBlVmvoVpY8eN9uXw3BNY+trIsd6Fyo2u1kuKFYDAEkGBeovhUVWsE84+SxTCPGxRHRKXRBcJQLxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZOBR1LR; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZOBR1LR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739374270; x=1770910270;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cc/TsyM5vRj7FhvojiV6L1cxGxqs6u9HMfYyUQeYcTI=;
  b=cZOBR1LRSdxZaBbYrCXik0EnBCe875WJHHhddBDJ5AlWOWqfZ1L3nfo8
   YwRHeJ7eD7kOt8Mu6Jk7EUxEsM8jKn8FVPDWIlsOSDB8lYG8uM/9cwiXY
   DzVhTzfVge9f6GRXWyeY6jCJpXTFS+hQesxMdi+2eMGw0drk68gO0L7h2
   NrW6lM8JBCYZO+L/fwYfHdvlmtZy7rJIIdPfGot0VULVBOhZajPiPa2kL
   HyBUSt+53dbO75W6p4SF/GVwxLsXfSv8dOayLvbGIFkC+nAOPk+WtXqUO
   DddJ5tL5ZQvTioOiM+PP0SrhQbIthcc4fgJfcm2tlkfl+2bkTLRWTc10a
   w==;
X-CSE-ConnectionGUID: +LM4oOYMSvWNlpci2Cp0MQ==
X-CSE-MsgGUID: aGzvdvc4QvCLXE21KAZdgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="50683846"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="50683846"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 07:31:09 -0800
X-CSE-ConnectionGUID: nox5biB7RTeMW1/3APxfJQ==
X-CSE-MsgGUID: rpgsaurfQlmWYCMm3XATeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143784530"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Feb 2025 07:31:08 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiEhd-0015mH-2G;
	Wed, 12 Feb 2025 15:31:05 +0000
Date: Wed, 12 Feb 2025 23:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 253/253]
 arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:237.8-247.4: Warning
 (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202502122344.U0muyJy0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   6f38969928fbddeb3efd394fc759c19cf4bc7605
commit: e00142f76c9ee33a9331f004523e823e1b928847 [253/253] CHROMIUM: arm64: dts: mediatek: mt8196: rauru: Add support for dp mst feature
config: arm64-randconfig-001-20250212 (https://download.01.org/0day-ci/archive/20250212/202502122344.U0muyJy0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250212/202502122344.U0muyJy0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502122344.U0muyJy0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4761.8-4766.5: Warning (simple_bus_reg): /soc/mvpu: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4768.16-4776.5: Warning (simple_bus_reg): /soc/sound: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4778.14-4786.5: Warning (simple_bus_reg): /soc/vdisp-ctrl: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4788.12-4796.5: Warning (simple_bus_reg): /soc/vmm: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:4798.32-5202.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1151.37-1176.5: Warning (avoid_unnecessary_addr_size): /soc/interrupt-controller@c400000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1276.25-1306.5: Warning (unique_unit_address_if_enabled): /soc/nsmpu@1046f000: duplicate unit-address (also used in node /soc/nkp@1046f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:1308.24-1335.5: Warning (unique_unit_address_if_enabled): /soc/ssmpu@1056f000: duplicate unit-address (also used in node /soc/skp@1056f000)
   arch/arm64/boot/dts/mediatek/mt8196.dtsi:2698.28-2703.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a110000: duplicate unit-address (also used in node /soc/mt8196-afe-pcm@1a110000)
>> arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:237.8-247.4: Warning (graph_child_address): /soc/dp-intf@32430000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi:253.8-263.4: Warning (graph_child_address): /soc/dp-intf@32440000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +237 arch/arm64/boot/dts/mediatek/mt8196-rauru.dtsi

   233	
   234	&dp_intf0 {
   235		status = "okay";
   236	
 > 237		ports {
   238			#address-cells = <1>;
   239			#size-cells = <0>;
   240	
   241			port@0 {
   242				reg = <0>;
   243				disp1_dp_intf0_out: endpoint {
   244					remote-endpoint = <&dptx_in0>;
   245				};
   246			};
   247		};
   248	};
   249	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
