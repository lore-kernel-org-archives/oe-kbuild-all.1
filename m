Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B97012E7E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Jun 2025 04:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750998038; cv=none; b=bEFUE5B0uMjzz1gG36AYgQF8yhMnsFWtiaNSzJxqkqCEYdjQRLPfdhz9Vkou5z3ez5ibOtw3qTICfyvlaDa4BrPQmzF/+SfzzUWWx1ejb+HYIyF1OTE7MylvIEVa9jN0vrRvgyuYWrmkC9XO9uPYjmjTdF3ukBDwkAXPg/RM0ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750998038; c=relaxed/simple;
	bh=3STL2RFFmCJgnYA2+T7J1TTJO6VR5f5KtgMJ9E5O5eU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GC+pCwkgeMS7vNS00JuwekC2MD5SkeZSywfERuHrM/i8Gzgk0u3j3i2O0J/RR3f5L0hkY3zqTQGFM+LB/CFfdsMrjaZ9JSV+ZS7XfKRZtcylV7B+ZWbt9dmO7NBmiHq8EJ3TpLVAipn0STmBXAIZkh+0EB/WnJKeTrUvYaNFS10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kqzcx2NH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kqzcx2NH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750998036; x=1782534036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3STL2RFFmCJgnYA2+T7J1TTJO6VR5f5KtgMJ9E5O5eU=;
  b=kqzcx2NHtnbqLp9LZQdct+3aFDyAowFSYIIFyGTYKzmbTAdCRS79ZvE5
   6OI4Wo3zjH/vaHALw/Uh7T4jMzPtpWPGksxZRgspbmxTqtjPKSRXM0RmE
   X9LCarCykzsvxtKyL1y4og/Myy3EvOBaj1uUNfxm2MLNEK1+XGvZn6I2H
   ujwXGWYmGsHS5Dc/HAq76Ktt8swYQRTXFFRAh9VmRRFSa+Q+W+CH9Glr7
   J3Cn/6W3LQeBFxWjmQzunSTTB/x8Qo5WUiwz4TwF/0JhyQt9iQtTLs+eC
   xWHk5Ofbs6VcFzz9rhlEB9ntyQ6T4bqdW2U1rJH46dBpyQdrEBcmhzcTW
   w==;
X-CSE-ConnectionGUID: ktwyNladQq6TC/lKqI92JQ==
X-CSE-MsgGUID: CDDjYohMT3uqyKRQZmrg1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="53032381"
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="53032381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 21:20:35 -0700
X-CSE-ConnectionGUID: UiiWUZeQTPivsJESUbB8ZQ==
X-CSE-MsgGUID: dIHxJsgvQVuC0lwF7ZQkBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,269,1744095600"; 
   d="scan'208";a="156993919"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 26 Jun 2025 21:20:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uV0Zj-000Vmo-35;
	Fri, 27 Jun 2025 04:20:31 +0000
Date: Fri, 27 Jun 2025 12:20:05 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.16-rc1 16/83]
 drivers/platform/arm64/ec/huawei-gaokun-ec.c: warning: EXPORT_SYMBOL() is
 used, but #include <linux/export.h> is missing
Message-ID: <202506271225.bl5K5YzE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc1
head:   8872f14d9fa3dabda25ac1679ab2bf2a7520a07c
commit: f1e005c354c3d65269bba73d59d4f5cd7ef12752 [16/83] platform: arm64: Move ec devices to an ec subdirectory
config: m68k-allnoconfig (https://download.01.org/0day-ci/archive/20250627/202506271225.bl5K5YzE-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250627/202506271225.bl5K5YzE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506271225.bl5K5YzE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/parisc/eisa.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/gsc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/iosapic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parisc/sba_iommu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/ieee1284.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/ieee1284_ops.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/parport_pc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/parport/share.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/access.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence-ep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/cadence/pcie-cadence.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware-ep.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-designware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/dwc/pcie-qcom-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pci-host-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pci-hyperv-intf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-iproc-msi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-iproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/pcie-rockchip.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/controller/plda/pcie-plda-host.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/doe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/ecam.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-ep-cfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epc-mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/endpoint/pci-epf-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/host-bridge.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/acpi_pcihp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/acpiphp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/cpci_hotplug_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/pci_hotplug_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/pnv_php.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/rpaphp_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/hotplug/rpaphp_slot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/msi/irqdomain.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/of.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/p2pdma.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-acpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-bridge-emul.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/aer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/aspm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/portdrv.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/pcie/ptm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/probe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/remove.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/search.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/setup-bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/slot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/switch/switchtec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/tph.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pci/vgaarb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/cistpl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/cs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/ds.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/max1600.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pcmcia_cis.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pcmcia_resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/pxa2xx_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_iodyn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_mgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/rsrc_nonstatic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/sa11xx_base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pcmcia/soc_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/peci/cpu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/peci/device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/arm_cspmu/arm_cspmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/hisilicon/hisi_uncore_pmu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/perf/riscv_pmu_sbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/allwinner/phy-sun4i-usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra124.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra186.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb-tegra210.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/tegra/xusb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/ti/phy-omap-control.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/phy/ti/phy-omap-usb2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/devicetree.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/freescale/pinctrl-imx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/freescale/pinctrl-scu.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/intel/pinctrl-intel.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/mtk-eint.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/mediatek/pinctrl-paris.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/meson/pinctrl-meson8-pmx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pinconf-generic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pinmux.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/pxa/pinctrl-pxa2xx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/qcom/pinctrl-lpass-lpi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/qcom/pinctrl-msm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/realtek/pinctrl-rtd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/sprd/pinctrl-sprd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pinctrl/tegra/pinctrl-tegra-xusb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/platform/arm64/ec/huawei-gaokun-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/platform/arm64/ec/lenovo-yoga-c630.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_lpc_mec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_proto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_ec_sensorhub_ring.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/cros_usbpd_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/chrome/wilco_ec/mailbox.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-omnia-mcu-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/cznic/turris-signing-key.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/olpc/olpc-ec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/controller.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/aggregator/ssh_packet_layer.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/surface/surface_acpi_notify.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hsmp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/hsmp/hwmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/amd/wbrf.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/asus-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dcdbas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-rbtn.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-smbios-base.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-descriptor.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/dell/dell-wmi-privacy.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/firmware_attributes_class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/ideapad-laptop.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/int3472/discrete.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmc/ssram_telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/pmt/telemetry.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/punit_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_if_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/speed_select_if/isst_tpmi_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/telemetry/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/uncore-frequency/uncore-frequency-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel/vsec_tpmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_ips.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/intel_scu_ipc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/mxm-wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/siemens/simatic-ipc-batt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/platform/x86/wmi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/actions/owl-sps-helper.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pmdomain/rockchip/pm-domains.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/card.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/isapnp/compat.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/isapnp/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/pnpbios/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/resource.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pnp/support.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/reset/reboot-mode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/bq27xxx_battery.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/power_supply_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/power_supply_sysfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/power/supply/samsung-sdi-battery.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/dtpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/idle_inject.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/intel_rapl_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/powercap/powercap_sys.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/generators/pps_gen.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/kapi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pps/pps.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-lpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-sys-manager.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3-vuart.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3av.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3av_cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ps3/ps3stor_lib.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_clock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_mock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_pch.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_qoriq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ptp/ptp_vclock.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pwm/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/pwm/pwm-lpss.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio-access.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/rapidio/rio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/amd/atl/umc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/debugfs.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/ras/ras.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/devres.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/irq_helpers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/mc13xxx-regulator-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/of_regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/rohm-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/wm8350-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/regulator/wm8400-regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/mtk_scp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/mtk_scp_ipi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/pru_rproc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_pil_info.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_q6v5.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/qcom_sysmon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/remoteproc/remoteproc_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
