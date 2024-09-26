Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5C1139B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 01:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727312453; cv=none; b=FWkaHrJW/ByNcXqOrMgLKOjLa4gO1B+r8drb4XaBNK2gnfYZ35OzIjIydCZ+anEWKPZvE3Sg0dSSNHp/z0BeqpvjHhu7hGjftlNj43+OpIw5HOa251Zror7F0cXGSK9SkQwZ3L8GaIemqq8DdgDP+NKUU3PfxZEPN6GnOcE78L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727312453; c=relaxed/simple;
	bh=9g2O+MVcUoRz2EiuW6BjDPk+9extf4pjb6r+5X/os0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D9jsK3MgyGSmQ5JMjiO0cpcxvqIzpkGO3Kydkhcl1U71p8NB56IW6uZNtDWcbXTrXmbTn1h3A5Zxc9EJ2wyaRi5OGa/Kyrm34cafxjvRCYjSPNboaKp3Z+NX4YHJw3MugISbv2BMRy+ovFkT1dciTOjszSQ9RFPOPHBrBfRTacM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ia+/k6x5; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ia+/k6x5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727312452; x=1758848452;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9g2O+MVcUoRz2EiuW6BjDPk+9extf4pjb6r+5X/os0g=;
  b=Ia+/k6x5+fz7eyVTrYjhfky7rrkHWrrREyflGuftVqruinyXJhiiZJJd
   TQq1KKeQgLh+YqWLV7nPsR3eabk1dL510Cm2ZKj92XH8atO1BV7KWS7HW
   UsK9YoM0GM/8WggJqgZjDSqqFzCM8/BM+WaEsSOrn1eokPESFu+7XQyU3
   cGSYOSGJ5f+o3IGY3tlH0Xi5O2dDOoIiMqpUpw5z/BYi1A547BSk5tOyu
   5KhqqXS4TqtocldECjn5OhRDp+z7A/hwQQ4P/p+0CTeAb/Sc6mRY0SWIo
   rrhbm7v5OdbktvX7jsSE3Gd4AIkI8C6QIgJY7BcFIkgKZhf3xJBiX7Shj
   g==;
X-CSE-ConnectionGUID: 7PT4pmQIRtu0uPgR6WGo3g==
X-CSE-MsgGUID: diP84xHMQsGZTPNgzTITog==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="26485393"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="26485393"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 18:00:52 -0700
X-CSE-ConnectionGUID: AQokd6hwQ+O8mqWGn6Vojw==
X-CSE-MsgGUID: ixZfnpiKQEC/sSGWN97rIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="72264234"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Sep 2024 18:00:46 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stcs7-000K5z-2k;
	Thu, 26 Sep 2024 01:00:43 +0000
Date: Thu, 26 Sep 2024 09:00:37 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 10462/11005] ERROR: modpost: "tcp_hashinfo"
 [net/toa/toa.ko] undefined!
Message-ID: <202409261114.gqhoDv9E-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a0fc99df5429b7eacab84a2a88f1f482f61c717b
commit: 91d9b56ad074b5640505e5b0993c4ecfe04a0c17 [10462/11005] net: csig toa patch toa patch from csig luckyqiu@tencent.com
config: x86_64-buildonly-randconfig-002-20240925 (https://download.01.org/0day-ci/archive/20240926/202409261114.gqhoDv9E-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409261114.gqhoDv9E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261114.gqhoDv9E-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/events/intel/intel-uncore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/crypto/crc32-pclmul.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/rcutorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/trace/preemptirq_delay_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in mm/hwpoison-inject.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/trusted-keys/trusted.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/algif_skcipher.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/ecc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libchacha.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libarc4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libpoly1305.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/find_bit_benchmark.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ida.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_module.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_user_copy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_static_key_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_printf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_free_pages.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/atomic64_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/asn1_encoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediatek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/pci-stub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410: section mismatch in reference: tfp410_driver+0x8 (section: .data) -> tfp410_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi: section mismatch in reference: hdmi_connector_driver+0x8 (section: .data) -> hdmic_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv: section mismatch in reference: tvc_connector_driver+0x8 (section: .data) -> tvc_remove (section: .exit.text)
WARNING: modpost: drivers/video/fbdev/omap2/omapfb/displays/panel-dpi: section mismatch in reference: panel_dpi_driver+0x8 (section: .data) -> panel_dpi_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/goldfishfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/owl-uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/amd64-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/intel-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/intel-gtt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/agp/via-agp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/arizona.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/pcf50633-gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/device_dax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dax/kmem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/phylink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/phy/bcm87xx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/pcs/pcs-lynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ethernet/8390/8390.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/ppp/ppp_deflate.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/appletalk/ipddp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/net/fddi/skfp/skfp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/videobuf2/videobuf2-dvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-empress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/pci/saa7134/saa7134-dvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/power/reset/piix4-poweroff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-hub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/fsi/fsi-master-ast-cf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-arb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/vfio-mdev/mdpy-fb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/configfs/configfs_sample.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kobject-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in samples/kobject/kset-example.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/802/fddi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_hfsc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_tbf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_qfq.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/sched/sch_cbs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/caif/chnl_net.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/packet/af_packet_diag.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/hsr/hsr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in net/toa/toa.o
ERROR: modpost: "inet_getname" [net/toa/toa.ko] undefined!
ERROR: modpost: "tcp_v4_syn_recv_sock" [net/toa/toa.ko] undefined!
>> ERROR: modpost: "tcp_hashinfo" [net/toa/toa.ko] undefined!
>> ERROR: modpost: "__inet_lookup_established" [net/toa/toa.ko] undefined!
>> ERROR: modpost: "inet_twsk_put" [net/toa/toa.ko] undefined!
>> ERROR: modpost: "__inet_lookup_listener" [net/toa/toa.ko] undefined!
ERROR: modpost: "inet_stream_ops" [net/toa/toa.ko] undefined!
ERROR: modpost: "ipv4_specific" [net/toa/toa.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
