Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5744479CF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Oct 2024 02:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727750152; cv=none; b=G4DgsnAsfm0AviwDCb+H6VBpojeIL4OGNuSIaBmaATOi0IpKfHqThXO9G2pHY5L69i+l9SfoPrAxpJvbK8+k3MJY4loFINqC8ke0+w66qYhwgxbB48/2/8204mqKc5k7aIF0gQuqNhEMKTbEdgbH6VJ3FJcITcm3P/lqOJjCDz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727750152; c=relaxed/simple;
	bh=wRDRYHJMkZwqPWJJrBAO/E5syNLl04slRs0dzv84h9I=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LF0m47nSorbzCrLbDEK2LawpRWDa88/BEyWvRSvJl8fBPiFPm0JBu3Gfg4fiCn02BUlhhtG9zrkmGnzBjSioYMuTrQcHILfSaqWwGNT8LltYgf3aSF06vWlE3gKlRJXgrohP01a8gVn/kAlTMX3/+G/qCkNGZp1M540PDNfu89M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J+3M/xoT; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+3M/xoT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727750150; x=1759286150;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wRDRYHJMkZwqPWJJrBAO/E5syNLl04slRs0dzv84h9I=;
  b=J+3M/xoTZL+Hs+pSIrn8D9BULKlyFaZQymfP7g1OTCAbwCDzjCmBANjF
   um58LeK4e5Fgc05mdLoGUaSqfwzF+YZWIN4+tqEyISJTev5WS63G/IYyD
   B1j0HybtPZpT7tjJbuMezzhcvIVC3s4VtF6ulw0vOoGu/9NpijlL2c9Gq
   SY9x266ICqhC3IpJX7MVZomH2dGytT0vYZzgjXhy8ZF8hglwIsIf2vNKh
   6VDXSEUXVO0TPj8S7A5GKMM4QTEoOnOyFBJlMqBIAUpCQ3uj10E+du04b
   th1ZSIe/qZQvR/DHWaItscHOBu3spzzJWPyKWw7BmE4AQa8k/i0AV/+9t
   Q==;
X-CSE-ConnectionGUID: Ezm0rmhNTSKcbm7spfCQWQ==
X-CSE-MsgGUID: 1iNEnInXQuepmjh//wPq9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="38220210"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="38220210"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 19:35:50 -0700
X-CSE-ConnectionGUID: uduvd9ziQbyP4JW2qME6RQ==
X-CSE-MsgGUID: IrGBfYFYTEqc8dM2nIw2Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="77892506"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 30 Sep 2024 19:35:48 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svSjq-000QAM-0m;
	Tue, 01 Oct 2024 02:35:46 +0000
Date: Tue, 1 Oct 2024 10:34:53 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>
Subject: [ti:ti-linux-6.6.y-wip 11/46] WARNING: modpost: "__udelay"
 [drivers/rtc/rtc-tps6594.ko] has no CRC!
Message-ID: <202410011039.oCYcCCcZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Esteban,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-6.6.y-wip
head:   7866eaeb3c1ddb52b976c3e4140cdfbba28a74f3
commit: 4a6710f4b353bd5392518d734586db0b58389a1f [11/46] rtc: tps6594: Add driver for TPS6594 RTC
config: sparc-randconfig-002-20240930 (https://download.01.org/0day-ci/archive/20241001/202410011039.oCYcCCcZ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410011039.oCYcCCcZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410011039.oCYcCCcZ-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

Is "__ashldi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__ashrdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__ashrdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "bzero_1page" [vmlinux] version generation failed, symbol will not be versioned.
Is "bzero_1page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__copy_1page" [vmlinux] version generation failed, symbol will not be versioned.
Is "__copy_1page" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__divdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__divdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_read_enter" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_read_enter" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_read_exit" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_read_exit" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_read_try" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_read_try" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "___rw_write_enter" [vmlinux] version generation failed, symbol will not be versioned.
Is "___rw_write_enter" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__lshrdi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__lshrdi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: EXPORT symbol "__muldi3" [vmlinux] version generation failed, symbol will not be versioned.
Is "__muldi3" prototyped in <asm/asm-prototypes.h>?
WARNING: modpost: "__udelay" [kernel/rcu/rcutorture.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/rcu/rcuscale.ko] has no CRC!
WARNING: modpost: "__udelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "__ndelay" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [kernel/rcu/refscale.ko] has no CRC!
WARNING: modpost: "empty_zero_page" [security/keys/encrypted-keys/encrypted-keys.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [lib/test_bitmap.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rapidio/switches/idt_gen2.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/rapidio/rio-scan.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/backlight/lms283gf05.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/backlight/vgg2432a4.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/core/fb_ddc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/cyber2000fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/i740fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/riva/rivafb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/aty/aty128fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/aty/radeonfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/savage/savagefb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/vt8623fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/cirrusfb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/gxt4500.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/carminefb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/video/fbdev/ssd1307fb.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/8250/8250_base.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/tty/serial/8250/8250_base.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/8250/8250_tegra.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/sunzilog.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/sunsab.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/tty/serial/rp2.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/misc/eeprom/eeprom_93cx6.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/misc/eeprom/eeprom_93xx46.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/misc/eeprom/eeprom_93xx46.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/si476x-core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mfd/atmel-hlcdc.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/chips/cfi_cmdset_0002.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/lpddr/qinfo_probe.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/lpddr/lpddr_cmds.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/mtd/nand/onenand/onenand.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/mtd/nand/onenand/onenand.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/mtd/tests/mtd_nandbiterrs.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-loopback-test.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/spi/spi-cadence.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/arcnet/com90xx.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/arcnet/com20020_cs.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/3com/3c59x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/alteon/acenic.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/amd/amd8111e.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/net/ethernet/broadcom/cnic.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/broadcom/cnic.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/broadcom/bnxt/bnxt_en.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/chelsio/cxgb3/cxgb3.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/net/ethernet/chelsio/cxgb3/cxgb3.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/engleder/tsnep.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/marvell/mvmdio.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/net/ethernet/mellanox/mlx5/core/mlx5_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/mellanox/mlxsw/mlxsw_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/micrel/ks8851_common.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/micrel/ks8851_par.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/neterion/s2io.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/nvidia/forcedeth.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/smsc/epic100.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/xilinx/ll_temac.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/xircom/xirc2ps_cs.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/altera/altera_tse.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ethernet/jme.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/hippi/rrunner.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/net/ppp/ppp_synctty.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/wireless/marvell/libertas/libertas.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ieee802154/at86rf230.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/net/ieee802154/mrf24j40.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/net/wireguard/wireguard.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/auxdisplay/hd44780.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/auxdisplay/lcd2s.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/joystick/adi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/ilitek_ts_i2c.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/mms114.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/touchscreen/tps6507x-ts.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/input/misc/adxl34x.ko] has no CRC!
>> WARNING: modpost: "__udelay" [drivers/rtc/rtc-tps6594.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/algos/i2c-algo-pca.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/i2c/busses/i2c-pca-platform.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i2c/busses/i2c-pca-platform.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i3c/master/i3c-master-cdns.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i3c/master/dw-i3c-master.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/i3c/master/svc-i3c-master.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/pmbus/max15301.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/hwmon/ad7418.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/hfcpci.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/hfcmulti.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/avmfritz.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/isdn/hardware/mISDN/avmfritz.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/speedfax.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/isdn/hardware/mISDN/speedfax.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/mISDNinfineon.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/isdn/hardware/mISDN/mISDNinfineon.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/isdn/hardware/mISDN/w6692.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/w6692.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/isdn/hardware/mISDN/netjet.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/netjet.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/mISDNipac.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/isdn/hardware/mISDN/mISDNisar.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/isdn/mISDN/mISDN_core.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/flash/leds-aat1290.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-bcm6358.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-bd2802.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-is31fl319x.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/leds/leds-lt3593.ko] has no CRC!
WARNING: modpost: "empty_zero_page" [drivers/infiniband/core/ib_uverbs.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/hw/mscc/ntb_hw_switchtec.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/ntb/ntb_transport.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/atm/nicstar.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/atm/iphase.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/atm/suni.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/atm/fore_200e.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/atm/idt77252.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/atm/atmtcp.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [drivers/atm/lanai.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/atm/lanai.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/pcmcia/pcmcia_core.ko] has no CRC!
WARNING: modpost: "__ndelay" [drivers/w1/masters/ds2482.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/masters/sgi_w1.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/w1/wire.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/comedi/comedi.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/comedi/drivers/ni_daq_700.ko] has no CRC!
WARNING: modpost: "__udelay" [drivers/comedi/drivers/ni_mio_cs.ko] has no CRC!
WARNING: modpost: "__ashldi3" [drivers/thunderbolt/thunderbolt.ko] has no CRC!
WARNING: modpost: "__lshrdi3" [drivers/thunderbolt/thunderbolt.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [net/ieee802154/ieee802154_socket.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [net/atm/atm.ko] has no CRC!
WARNING: modpost: "___rw_read_exit" [net/sctp/sctp.ko] has no CRC!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
