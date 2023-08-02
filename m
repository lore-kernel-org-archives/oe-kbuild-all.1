Received: from mgamail.intel.com (unknown [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A638E7F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 00:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690935888; x=1722471888;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KB5yXlZbIHLRQx6wmnTV87Bl/V/xoga6+vkyoklnLgM=;
  b=Pt7hBEX5OPpV92yA7ajaOeNxUUGhl9IciH1u6pcRjBua6GWmHHfxq4Jv
   u/hidR2QF6djW6n4cr2101+H1xBFYMiyZbayTE5+lqfs7ofTNR9OcIIB/
   3SLWMoe9WvaD8ZL9nt/uyvQju0lXiszdgd9C2Fhpu4dkIcXguYFJI7Z2U
   CFq2GBTuJ90fdbnMJD52GlCldVjHrK4zB5sO89MpNCtLCuZXji0/hL66b
   DmjtlFr5Z9jaVn14lWk79riQcrb0yzbbTntAxoZvE4jaO49dFRb68Unnr
   woMxGuWgr//JWt9nuwjLqPMEVHtO+Bujz3r9xYEufNNlqvw9YFn79duhp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="354370940"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="354370940"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 17:24:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="852675752"
X-IronPort-AV: E=Sophos;i="6.01,248,1684825200"; 
   d="scan'208";a="852675752"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Aug 2023 17:24:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQzfS-0000hv-1J;
	Wed, 02 Aug 2023 00:24:46 +0000
Date: Wed, 2 Aug 2023 08:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hansg:media-ov2680 28/29] ERROR: modpost: "__udivdi3"
 [drivers/media/i2c/ov2680.ko] undefined!
Message-ID: <202308020834.LIc810Di-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git media-ov2680
head:   a7a34b42e2edeb443a669f2b0787619468eabffe
commit: 8cc2256ca094536e3d3e1b9f484ebb61faeb4824 [28/29] media: ov2680: Add link-freq and pixel-rate controls
config: i386-randconfig-i001-20230731 (https://download.01.org/0day-ci/archive/20230802/202308020834.LIc810Di-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308020834.LIc810Di-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308020834.LIc810Di-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-gw-pld.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pci-host-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pci-host-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/acpi/custom_method.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/dmatest.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/efficeon-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/nvidia-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/via-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/bochs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/cirrus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-sccb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/misc/open-dice.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/mdio_devres.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/phylink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/sfp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/bcm87xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/mdio/acpi_mdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/mdio/fwnode_mdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/mdio/of_mdio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/mdio/mdio-bitbang.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/arcnet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/arc-rawmode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/capmode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com90xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com90io.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/arc-rimi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com20020.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com20020-isa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/arcnet/com20020-pci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/netdevsim/netdevsim.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/common/usb-otg-fsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/class/usbtmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/matrix-keymap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/simatic-ipc-wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/watchdog/menz69_wdt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/isdn/mISDN/l1oip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/isdn/hardware/mISDN/speedfax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/isdn/hardware/mISDN/w6692.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/isdn/hardware/mISDN/mISDNisar.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/mmc_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/flash/leds-rt4505.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/leds/simple/simatic-ipc-leds.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-vbtn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/intel/intel-rst.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/amilo-rfkill.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/ibm_rtl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/classmate-laptop.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/platform/x86/simatic-ipc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_cif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_aec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_netx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_pruss.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/uio/uio_mf624.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-aspeed.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-scom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/core/selftests.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/p8022.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/psnap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/fddi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/stp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/netlink/netlink_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/ip_vti.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/ipv4/esp4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ar9331.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_brcm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_dsa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_gswip.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_hellcreek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_ksz.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_lan9303.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_mtk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_none.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_qca.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl4_a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rtl8_4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_rzn1_a5psw.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_sja1105.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/dsa/tag_xrs700x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/bridge/bridge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/6lowpan/6lowpan.o
>> ERROR: modpost: "__udivdi3" [drivers/media/i2c/ov2680.ko] undefined!
>> ERROR: modpost: "__divdi3" [drivers/media/i2c/ov2680.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
