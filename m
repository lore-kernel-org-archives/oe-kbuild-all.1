Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E9FF4E7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 09:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709370077; cv=none; b=tyzH1JMZJKwJrtqGdfo8mk4IxGRIrpM4D8ANi3wOXFTt3pU6oMzCLvyu+wm/jq9Ls5iU64+RZy5VWc6ovLBw3ngyeiuf69ybfgVda7xwkga4DedtUUYUAWgdoCGoj5UlpSd/748OhCFgDpWDM0t81+iZcK63m+Nb9+Do22n53ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709370077; c=relaxed/simple;
	bh=ftnU55mfyn2Q8iPjeZln8pOXq7c0lelEbbgwW57bkCg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fhGtL6CJd4lhI4u8z0g1SxIa0CPfQA0vxk4XL21wWZRn4002td80P8RjMA+ZD3q6E5jiYl2ed9esc+2b6LoveFeN2BBmr4Bt5DVpXFzLuo6Tz/8aGxFefP+A315910aNjcFScbApdAUkA0B0Uju1aN1WRgBS6hAvv4k+WjfdnVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alZgAETf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alZgAETf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709370075; x=1740906075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ftnU55mfyn2Q8iPjeZln8pOXq7c0lelEbbgwW57bkCg=;
  b=alZgAETfo5JtCIHQPEAq/wc+GyoAtnbyf/gJWdNbrwtC9NiCGCVG5M2j
   TnWaFoZJJq+ppwiQR5WEZ68twc/t7zyHf8+XaebQHIiTImGOtf/9SECdG
   cZKSEJo8XG+0vKnehYVzveZ16L1qEwlY0tjey3Z6wOzQ48t++mOFy1I/9
   yD8z/NA3GblJqefRiYQnQkKH83DZmI1568USRgBLVsuB6ATIcSAQh40RD
   e1oS9wG6DgRK6FdoLxmcdvyCJBa810/XZR51hWotsfUDLpxUndMc+mKlQ
   n2q6VPKpgXmzmfK8RjkLDVMI7sDMFlhkpy9jNKH244aTDNWof3hnuQ3qQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3778065"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="3778065"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 01:01:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="45968312"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 02 Mar 2024 01:01:12 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgLEz-000EUX-1o;
	Sat, 02 Mar 2024 09:01:09 +0000
Date: Sat, 2 Mar 2024 17:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Manish Mandlik <mmandlik@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Subject: WARNING: modpost: "strcpy" [drivers/bluetooth/hci_vhci.ko] has no
 CRC!
Message-ID: <202403021638.hopNnMWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5ad3cb0ed525b80c7f66c32b49a68c1f3510bec9
commit: ab4e4380d4e158486e595013a2635190e07e28ce Bluetooth: Add vhci devcoredump support
date:   10 months ago
config: alpha-buildonly-randconfig-r004-20220321 (https://download.01.org/0day-ci/archive/20240302/202403021638.hopNnMWF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240302/202403021638.hopNnMWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021638.hopNnMWF-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: "strcpy" [drivers/video/fbdev/sis/sisfb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/video/fbdev/s3fb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/video/fbdev/arkfb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/video/fbdev/mmp/fb/mmpfb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/regulator/virtual.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/block/pktcdvd.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/misc/ti-st/st_drv.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/misc/ics932s401.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/misc/lkdtm/lkdtm.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/misc/apds9802als.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/scsi_transport_fc.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/libfc/libfc.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/scsi/libfc/libfc.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/qla2xxx/qla2xxx.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/scsi/qla2xxx/qla2xxx.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/qla4xxx/qla4xxx.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/scsi/qla4xxx/qla4xxx.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/scsi/qla4xxx/qla4xxx.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/bfa/bfa.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/scsi/smartpqi/smartpqi.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/mpt3sas/mpt3sas.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/scsi/mpt3sas/mpt3sas.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/scsi/mpt3sas/mpt3sas.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/atp870u.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/bnx2i/bnx2i.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/scsi/qedi/qedi.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/nvme/host/nvme-fabrics.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/nvme/host/nvme-fc.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/net/phy/nxp-c45-tja11xx.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/aquantia/atlantic/atlantic.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/broadcom/bnx2.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/broadcom/bnx2x/bnx2x.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/broadcom/tg3.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/net/ethernet/broadcom/tg3.ko] has no CRC!
WARNING: modpost: "strncat" [drivers/net/ethernet/broadcom/tg3.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko] has no CRC!
WARNING: modpost: "strncat" [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/chelsio/cxgb4/cxgb4.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/cortina/gemini.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/net/ethernet/intel/e100.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/intel/e100.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/intel/e1000/e1000.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/net/ethernet/intel/e1000/e1000.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/intel/igb/igb.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/net/ethernet/intel/igb/igb.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/intel/ixgbe/ixgbe.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/intel/iavf/iavf.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/net/ethernet/intel/iavf/iavf.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/net/ethernet/intel/fm10k/fm10k.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "strncat" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/net/ethernet/qlogic/qede/qede.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/message/fusion/mptbase.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/message/fusion/mptbase.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/message/fusion/mptctl.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/cdrom/cdrom.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/auxdisplay/panel.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/input/touchscreen/sun4i-ts.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/i2c/busses/i2c-at91.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/i2c/busses/i2c-jz4780.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/i3c/i3c.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/i3c/i3c.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/media/rc/rc-core.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/w1/slaves/w1_therm.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/w1/slaves/w1_ds28e17.ko] has no CRC!
WARNING: modpost: "strcat" [drivers/w1/slaves/w1_ds28e17.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/power/supply/wm831x_backup.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/power/supply/charger-manager.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/power/supply/bq2415x_charger.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/power/supply/bq256xx_charger.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hwmon/f71882fg.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hwmon/amc6821.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hwmon/thmc50.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/hwmon/pmbus/pmbus_core.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/isdn/mISDN/mISDN_core.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/isdn/mISDN/mISDN_core.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/mmc/core/mmc_core.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/mmc/core/mmc_block.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/leds/led-class-multicolor.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/leds/leds-bd2802.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/leds/leds-lm3530.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/leds/leds-lp3952.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/leds/leds-lp5521.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/leds/leds-lp5523.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/leds/leds-wm831x-status.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hid/hid.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hid/hid-wiimote.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/rpmsg/rpmsg_ns.ko] has no CRC!
WARNING: modpost: "strncpy" [drivers/rpmsg/virtio_rpmsg_bus.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/devfreq/governor_userspace.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/memory/brcmstb_dpfe.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/perf/arm_smmuv3_pmu.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/perf/marvell_cn10k_tad_pmu.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hwtracing/intel_th/intel_th.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hwtracing/intel_th/intel_th_gth.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/hwtracing/stm/stm_console.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/fpga/dfl-fme.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/ata/libata.ko] has no CRC!
>> WARNING: modpost: "strcpy" [drivers/bluetooth/hci_vhci.ko] has no CRC!
WARNING: modpost: "strcpy" [drivers/soundwire/soundwire-bus.ko] has no CRC!
WARNING: modpost: "strcpy" [net/x25/x25.ko] has no CRC!
WARNING: modpost: "strcpy" [net/can/can-bcm.ko] has no CRC!
WARNING: modpost: "strcpy" [net/bluetooth/bluetooth.ko] has no CRC!
WARNING: modpost: "strcpy" [net/9p/9pnet_fd.ko] has no CRC!
WARNING: modpost: "strcpy" [net/caif/caif.ko] has no CRC!
WARNING: modpost: "strncpy" [net/caif/chnl_net.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
