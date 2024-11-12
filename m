Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D018BBA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Nov 2024 20:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731444971; cv=none; b=aipyuO6Ystv55WX8fK3IWAEPOgLpJbcOJLm+EVhaN839Td5RaGrvhlpuQbzm6rszRMiLBNWMdRB9LYcya/KuxCqWxyShfj2190hPEkzdxi7sSLETJmFhE5bZV8XuYddyhJPjym0RAl1oIMEnxqPt22hJMmp3b3NSr5n1jyIeUAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731444971; c=relaxed/simple;
	bh=z2Q7zzbKEIp/IOgQ2+ELAyFITGcoQEHugDYsXAzm/5g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r3UzT4ZdmGDHqR4StxV7sjbZOkZmEcN/jU5kwJXySvKX5+ie7l35ET4kaz9gCtaHkJ0qeJxuvi+iecVuk+1GxZqycnFMU33XneMd9+YlIELA459C6io1vwsec7HkCp6oPh3p6kT5Jxn44gtGjhLWFiErc8gkWdZ/x5/auoP+wxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoJGxXTK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoJGxXTK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731444970; x=1762980970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z2Q7zzbKEIp/IOgQ2+ELAyFITGcoQEHugDYsXAzm/5g=;
  b=VoJGxXTKp7yE9SADtDjcvPOy1aYuxGUjPeREHdRf1F+sjGdKjPs1i15N
   KkkrFRnm4S+R3N+SidnOFBg5qGMaaHFvEfqLa/fG9Ev08vVak8cEDeG1t
   G6XOOKO1I+IZuWId3BA3yqMJuOnyE85bj5ZozadwU9IVzR5Px2k6WP3Wr
   FTrjUv+I8qbsTqJafYb95rnTSOBzdGuCAit/FLllsOvy5AktMUe2FSpSY
   Se8wWpuogObWSlWPRoX9T8RqcrvpmAO1ntxD8ZF3uzXkM4Fpuzr6d/tnd
   WLg+JkpMdV5avH+Sm2ObI1ADtppbN3x5y61UUTX2/reyF+EgoN67WHEY5
   Q==;
X-CSE-ConnectionGUID: zlf4WFFORnurcDSnioNt7g==
X-CSE-MsgGUID: PY4u16dtRjGFD4XZJBn3QQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="34172486"
X-IronPort-AV: E=Sophos;i="6.12,149,1728975600"; 
   d="scan'208";a="34172486"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2024 12:56:09 -0800
X-CSE-ConnectionGUID: DAIDwn1wTq+bXEWEOxqZVA==
X-CSE-MsgGUID: fvDWhar6Q9GLc2Ft/EHrUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92576388"
Received: from lkp-server01.sh.intel.com (HELO bcfed0da017c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 12 Nov 2024 12:56:08 -0800
Received: from kbuild by bcfed0da017c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAxvh-0001iv-1S;
	Tue, 12 Nov 2024 20:56:05 +0000
Date: Wed, 13 Nov 2024 04:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 6797/30000]
 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:671.28-673.7: Warning
 (unit_address_vs_reg): /soc/i2c@ffd72000/adv7533@39/ports/port@0/endpoint@0:
 node has a unit name, but no reg property
Message-ID: <202411130449.rgY1GNB8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   104cc535f91241da2629d8e2d5abcf57a97b0afd
commit: 623715b470c6c51e54344a274ca90df19556b56a [6797/30000] ANDROID: dts: hi3660: Fix duplicate adv7533 nodes
config: arm64-randconfig-001-20241112 (https://download.01.org/0day-ci/archive/20241113/202411130449.rgY1GNB8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411130449.rgY1GNB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411130449.rgY1GNB8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:671.28-673.7: Warning (unit_address_vs_reg): /soc/i2c@ffd72000/adv7533@39/ports/port@0/endpoint@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1136.30-1140.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@0: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:1142.27-1146.8: Warning (unit_address_vs_reg): /soc/thermal-zones/cls0/trips/trip-point@1: node has a unit name, but no reg property
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:52.34-57.5: Warning (unit_address_vs_reg): /reserved-memory/fastboot-cma-mem: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:59.20-62.5: Warning (unit_address_vs_reg): /reserved-memory/uefi-reboot-mode: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:64.8-67.5: Warning (unit_address_vs_reg): /reserved-memory/bl31: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:78.13-83.5: Warning (unit_address_vs_reg): /reserved-memory/linux,cma: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts:253.19-262.4: Warning (unit_address_vs_reg): /hi3660_i2s: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:345.31-349.5: Warning (simple_bus_reg): /soc/crg_rst_controller: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:376.10-381.5: Warning (simple_bus_reg): /soc/reboot: missing or empty reg/ranges property
   arch/arm64/boot/dts/hisilicon/hi3660.dtsi:390.20-394.5: Warning (simple_bus_reg): /soc/reset: missing or empty reg/ranges property

vim +671 arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts

   607	
   608	&i2c1 {
   609		status = "okay";
   610	
   611		rt1711h: rt1711h@4e {
   612			compatible = "richtek,rt1711h";
   613			reg = <0x4e>;
   614			status = "ok";
   615			interrupt-parent = <&gpio27>;
   616			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
   617			pinctrl-names = "default";
   618			pinctrl-0 = <&usb_cfg_func>;
   619	
   620			usb_con: connector {
   621				compatible = "usb-c-connector";
   622				label = "USB-C";
   623				data-role = "dual";
   624				power-role = "dual";
   625				try-power-role = "sink";
   626				source-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)>;
   627				sink-pdos = <PDO_FIXED(5000, 500, PDO_FIXED_USB_COMM)
   628					PDO_VAR(5000, 5000, 1000)>;
   629				op-sink-microwatt = <10000000>;
   630	
   631				ports {
   632					#address-cells = <1>;
   633					#size-cells = <0>;
   634					port@1 {
   635						reg = <1>;
   636						usb_con_ss: endpoint {
   637							remote-endpoint = <&dwc3_ss>;
   638						};
   639					};
   640				};
   641			};
   642			port {
   643				#address-cells = <1>;
   644				#size-cells = <0>;
   645	
   646				rt1711h_ep: endpoint@0 {
   647					reg = <0>;
   648					remote-endpoint = <&hikey_usb_ep1>;
   649				};
   650			};
   651		};
   652	
   653		adv7533: adv7533@39 {
   654			status = "ok";
   655			compatible = "adi,adv7533";
   656			reg = <0x39>;
   657			v1p2-supply = <&ldo3>;
   658			vdd-supply = <&ldo3>;
   659			interrupt-parent = <&gpio1>;
   660			interrupts = <1 2>;
   661			pd-gpio = <&gpio5 1 0>;
   662			sel-gpio = <&gpio2 4 0>;
   663			adi,dsi-lanes = <4>;
   664			adi,disable-timing-generator;
   665			#sound-dai-cells = <0>;
   666			ports {
   667				#address-cells = <1>;
   668				#size-cells = <0>;
   669				port@0 {
   670					reg = <0>;
 > 671					adv7533_in: endpoint@0 {
   672						remote-endpoint = <&dsi_out0>;
   673					};
   674				};
   675				port@1 {
   676					reg = <1>;
   677				};
   678			};
   679		};
   680	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
