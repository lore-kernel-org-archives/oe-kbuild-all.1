Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F6AF25B305
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 20:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190426; cv=none; b=ryBVhUBjNYHWaVnmMpKgRg1CsRMzOfcbrwEE8hTKipXAeQXdYJJwAQzZM6/oQQK4DQ1i8i3e5hkDEnj+a3tPEr4hf1la9nSEjzdgcuvhZPMH6N5mke0Ll8wqk90/L+cVjKSiPBTBMQ/YlLt/PtaJa8+bbM+BT5cGnNXC1VMIJxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190426; c=relaxed/simple;
	bh=zPXZ9V2aaf5/stXIYVFbUO3k1i7RcoX+VPh2jU/eb+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RLyeguszZOqv19B5hcHeVOgn6SySrXc/yi9h216efLi3GPK7P00Pmctjvc9EOO+swSQQKdygwBJKWPO20XkV/gMH4Gxic0RGZrYMmRzsSlQhvOQHlO8MaYCykXTwFU3BdNqWbT654IM/H6eviPXrAnxdh8jXm/MkO6dQtce4yss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WpucRxpr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WpucRxpr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750190424; x=1781726424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zPXZ9V2aaf5/stXIYVFbUO3k1i7RcoX+VPh2jU/eb+k=;
  b=WpucRxprS0wjaAzXlxoIfsLIW+PtgekJ0k0UR06fiX5Ch1oV580PAXQc
   vnxKpbk4Fo03in8/PMJ2LuMpwlUPqQgGhIlfBBvrU4ir6HonUnqTXgvno
   kF1wKetcoo0zEq/VoiTfMuLkDolMy6HwIt1FimPYeniCBx9AIqV6MfT9L
   1+OZr+y7E3H+okB5t6NzkqS1ajO9CBr5CM+7FQVpJ9zQxDyOctGUG2T5D
   pn0p0bBHW1Kqnzc2wRBTvz5I3g4uwBtLN+hyVwVtE/P5MkfKsGEcbNvTR
   CUg/4PvO4Mq6A52eKI3fy4L6bOfrowRA0pEo8bHn8qyp+OaoZNmCkKKSF
   A==;
X-CSE-ConnectionGUID: 92RDH+K/STOxUNQ9OzSrIg==
X-CSE-MsgGUID: 8r15OxeXSy+VCRET2dJI/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52365682"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="52365682"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 13:00:23 -0700
X-CSE-ConnectionGUID: Qj506Z8GSVijLdOIt8zYGQ==
X-CSE-MsgGUID: BKufN1MYST23XiHgLIUlMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="148799432"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 17 Jun 2025 13:00:22 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRcTk-000I33-0n;
	Tue, 17 Jun 2025 20:00:20 +0000
Date: Wed, 18 Jun 2025 04:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:kthread/core 19/28] kernel/cgroup/cpuset.c:
 warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is
 present
Message-ID: <202506180311.OZn2ljYs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git kthread/core
head:   d158401fbb86b0fef8530ffb275b6ab87804ef34
commit: 1ddd21321c7367fa4573b677c605eb05f18ad235 [19/28] cpuset: Remove cpuset_cpu_is_isolated()
config: i386-buildonly-randconfig-002-20250618 (https://download.01.org/0day-ci/archive/20250618/202506180311.OZn2ljYs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180311.OZn2ljYs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506180311.OZn2ljYs-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iio/potentiometer/ds1803.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/iio/potentiometer/mcp4131.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/infiniband/hw/hfi1/debugfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/infiniband/hw/mlx5/mr.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/infiniband/hw/mthca/mthca_provider.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/infiniband/hw/qib/qib_debugfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/infiniband/hw/qib/qib_diag.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/infiniband/hw/qib/qib_file_ops.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/infiniband/ulp/ipoib/ipoib_fs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/iommu/ipmmu-vmsa.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/irqchip/exynos-combiner.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/irqchip/irq-aspeed-vic.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/irqchip/irq-davinci-cp-intc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/irqchip/irq-vic.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/irqchip/spear-shirq.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/isdn/capi/kcapi_proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/isdn/mISDN/socket.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/leds/leds-cobalt-raq.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/md/dm-snap-persistent.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/md/dm-snap-transient.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/media/platform/allegro-dvt/nal-rbsp.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/media/usb/hdpvr/hdpvr-i2c.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mfd/max77686.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mfd/twl4030-irq.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mmc/core/debugfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mmc/host/sdhci-acpi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mtd/maps/physmap-gemini.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mtd/maps/physmap-ixp4xx.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mtd/maps/physmap-versatile.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mtd/nand/onenand/onenand_bbt.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mtd/nand/raw/nand_timings.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/mtd/ubi/vmt.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/bonding/bond_procfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/dsa/dsa_loop.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/dsa/microchip/ksz8.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/ethernet/samsung/sxgbe/sxgbe_core.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/ethernet/samsung/sxgbe/sxgbe_desc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/ethernet/samsung/sxgbe/sxgbe_dma.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/ethernet/samsung/sxgbe/sxgbe_mtl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/wireless/ath/ath5k/debug.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/wireless/ath/ath9k/debug.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/wireless/ath/ath9k/dfs_debug.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/wireless/intel/iwlwifi/dvm/eeprom.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/net/wireless/marvell/libertas/debugfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/nvmem/rcar-efuse.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/parisc/ccio-dma.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pci/controller/pci-tegra.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pci/pci-sysfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/perf/arm_pmu.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pinctrl/pinctrl-falcon.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pinctrl/sunxi/pinctrl-sunxi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/platform/mips/rs780e-acpi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/power/supply/ab8500_bmdata.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/ptp/ptp_ines.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pwm/pwm-brcmstb.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pwm/pwm-dwc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/pwm/pwm-samsung.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/regulator/dummy.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/regulator/max77693-regulator.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/s390/char/sclp_cmd.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/s390/char/sclp_sd.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/s390/char/vmcp.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/s390/cio/qdio_debug.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/scsi/bfa/bfad_debugfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/scsi/bfa/bfad_im.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/scsi/csiostor/csio_init.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/scsi/csiostor/csio_scsi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/scsi/lpfc/lpfc_scsi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/sh/intc/core.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/sh/intc/irqdomain.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/soc/mediatek/mtk-infracfg.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/ssb/driver_gpio.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/target/iscsi/iscsi_target_configfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/target/iscsi/iscsi_target_stat.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/target/target_core_alua.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/target/target_core_fabric_lib.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/thermal/ti-soc-thermal/ti-bandgap.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/tty/hvc/hvc_opal.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/tty/mips_ejtag_fdc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/tty/vt/vc_screen.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/usb/early/xhci-dbc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/usb/misc/onboard_usb_dev.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/usb/mon/mon_bin.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/usb/mon/mon_stat.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/usb/mon/mon_text.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/video/fbdev/mb862xx/mb862xx-i2c.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/video/fbdev/omap2/omapfb/dss/dpi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/video/fbdev/omap2/omapfb/dss/sdi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/video/fbdev/omap2/omapfb/omapfb-ioctl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/video/fbdev/via/via-gpio.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/xen/biomerge.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/xen/swiotlb-xen.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   drivers/zorro/proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   fs/bcachefs/printbuf.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   fs/ext4/readpage.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   fs/gfs2/ops_fstype.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   fs/jfs/jfs_logmgr.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   fs/netfs/main.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   fs/netfs/read_pgpriv2.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
>> kernel/cgroup/cpuset.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/cgroup/legacy_freezer.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/dma/direct.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/dma/swiotlb.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/latencytop.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/locking/lockdep_proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/nsproxy.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/time/namespace.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/utsname.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   kernel/utsname_sysctl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   lib/irq_regs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   lib/raid6/recov_s390xc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   lib/syscall.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   lib/test_debug_virtual.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   lib/zlib_dfltcc/dfltcc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   mm/kmsan/core.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/appletalk/atalk_proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/atm/pvc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/atm/svc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ax25/ax25_route.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/bluetooth/bnep/sock.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/bluetooth/cmtp/capi.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/bluetooth/cmtp/sock.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/bluetooth/hidp/sock.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/bluetooth/rfcomm/sock.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/bridge/br_multicast_eht.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/compat.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/core/net-traces.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ieee802154/6lowpan/reassembly.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ieee802154/nl-mac.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv4/fib_notifier.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv4/ipconfig.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv4/proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv6/fib6_notifier.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv6/proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv6/reassembly.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv6/sysctl_net_ipv6.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/ipv6/udplite.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/llc/llc_proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/mac80211/aes_cmac.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/mac80211/parse.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/mac80211/rc80211_minstrel_ht_debugfs.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/netfilter/nf_conntrack_acct.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/netrom/nr_route.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/phonet/datagram.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/rose/rose_route.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/rxrpc/output.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/sched/sch_mq.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/sctp/proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/sunrpc/xprtrdma/svc_rdma_transport.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/wireless/ap.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/wireless/mesh.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/wireless/wext-compat.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/wireless/wext-sme.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/x25/x25_proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   net/xfrm/xfrm_proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   security/integrity/ima/ima_mok.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   security/integrity/platform_certs/platform_keyring.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   security/lockdown/lockdown.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   security/selinux/hooks.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   security/selinux/netlink.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/core/ctljack.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/core/seq/oss/seq_oss_init.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/core/seq/seq_info.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/drivers/opl3/opl3_oss.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/drivers/opl4/opl4_proc.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/isa/sb/emu8000_callback.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/pci/au88x0/au88x0_game.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/pci/cs46xx/cs46xx_lib.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/pci/emu10k1/emu10k1_callback.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/soc/amd/ps/ps-common.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/soc/atmel/sam9x5_wm8731.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/soc/sof/intel/icl.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   sound/synth/emux/emux_oss.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present
   virt/kvm/irqchip.c: warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
