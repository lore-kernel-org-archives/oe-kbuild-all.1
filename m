Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FAF1E485
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 14:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749651780; cv=none; b=IfDt7dAWAZ6fHvJZVlkzRUy/XNqSDs3hyCXtboNygvnopLWdDOkDFSnv93RSGGWf2eo1wgHm3wz3ucy/bhSOL4YPwkINe8a1w1MRqTC+pGHxcxn2GnuZ72JxJ8pyI87scsc/Uomxnw/ki78ca4+I7912v29rB+8nM3ia+OAa2QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749651780; c=relaxed/simple;
	bh=qk6/XzVqOQxsy9wmhqFJsdIL2tjbaSTg124ualFP4bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vemlri7Gncp33L5vr0rZ7fofHkwbUSuTrT9JShBmvEkmqUKkywnU9HTyMZO8G+Yg/DRqAWk8ApNbSmOJ6jbnk4QkBJFlxUDKNIPk6XBQirvTzxbBcOug8O6LTtpROo8gdv33QP3QnDUu+nLgBCiYraYiugpaUG5JTlRUjiWHMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FHh2dFzl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FHh2dFzl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749651778; x=1781187778;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qk6/XzVqOQxsy9wmhqFJsdIL2tjbaSTg124ualFP4bE=;
  b=FHh2dFzlaiGIi/DLOivgd/lGA0CxuYSek6skTWZQl34CFUpRndNrZBWI
   WTNlb1qOpj07/FzEpb7/FX+d21FnBzkdTHZHKVBVXYOH8zffx+CEho+fv
   xTK2csSe6m4m/53d8JIenmYJUWnuPS1RQFc7/wCAqX4pVjz2LfBz/jXcQ
   nsGYrm9n+TgSZeA1U3HoHx/f9PunQ6vpzCm1ZoscegxXN36pel0PjdWL3
   PP92H1x7JnQjY8kz7VWsNy+etlB+BOJi+UYF5+Y/BBhhCysfX9LeV/HpW
   8l7Bo/U6G89U5wtha5jzUL8E2dOoEqFmioBeccw311bwDYSq8KEE7oAKB
   w==;
X-CSE-ConnectionGUID: OS+KPwNURICOwN7GW4ozhQ==
X-CSE-MsgGUID: FqwFX1J2R9W+P5V0KJHM1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="63144491"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="63144491"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 07:22:57 -0700
X-CSE-ConnectionGUID: 2teHN6vKQjOfX0hxyYmixQ==
X-CSE-MsgGUID: OD58vxzEQOyiwfBUXW/y1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147117141"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 Jun 2025 07:22:56 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPMLt-000AYo-0V;
	Wed, 11 Jun 2025 14:22:53 +0000
Date: Wed, 11 Jun 2025 22:22:40 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v7 05/10] mfd: Add Apple Silicon System Management
 Controller
Message-ID: <202506112227.ZUGgktoF-lkp@intel.com>
References: <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-smc-6-15-v7-5-556cafd771d3@kernel.org>

Hi Sven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Sven-Peter/dt-bindings-gpio-Add-Apple-Mac-SMC-GPIO-block/20250611-094837
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250610-smc-6-15-v7-5-556cafd771d3%40kernel.org
patch subject: [PATCH v7 05/10] mfd: Add Apple Silicon System Management Controller
config: arc-randconfig-002-20250611 (https://download.01.org/0day-ci/archive/20250611/202506112227.ZUGgktoF-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250611/202506112227.ZUGgktoF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506112227.ZUGgktoF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/tuners/tda18218.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda18271-fe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda827x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda8290.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tda9887.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5761.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tea5767.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tuner-simple.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/tuner-types.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc2028.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc4000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/tuners/xc5000.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-avcore.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/cx231xx/cx231xx-vbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/dvb_usb_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/dvb_usb_urb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/mxl111sf-demod.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb-v2/mxl111sf-tuner.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/af9005-remote.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dibusb-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dibusb-mc-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-firmware.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-remote.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/dvb-usb/dvb-usb-urb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-camera.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-cards.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/em28xx/em28xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/go7007/go7007-driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/go7007/snd-go7007.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/gspca/autogain_functions.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/gspca/gspca.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/usb/ttusb-dec/ttusbdecfe.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-async.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-cci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-compat-ioctl32.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-dev.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-device.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-dv-timings.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-flash-led-class.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-fwnode.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-h264.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-ioctl.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-jpeg.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-mc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-mem2mem.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/media/v4l2-core/v4l2-vp9.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/fsl_ifc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/jz4780-nemc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/omap-gpmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/renesas-rpc-if.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/ti-aemif.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memory/ti-emif-pm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/memstick/core/memstick.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/message/fusion/mptbase.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/message/fusion/mptscsih.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm80x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm860x-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/88pm860x-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/adp5520.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/altera-sysmgr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/arizona-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/arizona-irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/atc260x-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/atmel-smc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/axp20x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cgbc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs40l50-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs42l43.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs47l15-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs47l24-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs47l35-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs47l85-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs47l90-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/cs47l92-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/da903x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/da9052-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/da9052-irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/da9055-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/da9150-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/dln2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/ezx-pcap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/gateworks-gsc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/intel-lpss.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/intel-m10-bmc-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/intel_pmc_bxt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/ipaq-micro.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/iqs62x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/kempld-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/lm3533-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/lm3533-ctrlbank.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/lochnagar-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/lp3943.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/lp8788.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
>> drivers/mfd/macsmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/madera-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/max14577.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/max77759.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/max8925-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/max8997.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/max8998.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/mc13xxx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/mcp-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/menelaus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/mfd-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/motorola-cpcap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/omap-usb-tll.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/palmas.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/qcom-spmi-pmic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/qcom_rpm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/rc5t583.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/retu-mfd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/rk8xx-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/rsmu_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/rz-mtu3.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/si476x-cmd.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/si476x-i2c.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/si476x-prop.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/sm501.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/sprd-sc27xx-spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/ssbi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/stm32-timers.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/stmfx.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/syscon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/tc3589x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/ti_am335x_tscadc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/tps65010.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/tps65217.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/tps65218.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/tps6586x.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/tps65912-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/tps6594-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/twl-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/twl4030-audio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/twl6040.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/ucb1x00-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm5102-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm5110-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm831x-auxadc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm8350-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm8400-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm8994-irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm8994-regmap.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm8997-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mfd/wm8998-tables.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/ad525x_dpot.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/altera-stapl/altera.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/atmel-ssc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/c2port/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/cardreader/alcor_pci.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/cardreader/rtsx_pcr.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/cardreader/rtsx_usb.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/cb710/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/cb710/debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/cb710/sgbuf2.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/cs5535-mfgpt.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/eeprom/eeprom_93cx6.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/enclosure.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/lis3lv02d/lis3lv02d.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/mei/bus.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/mei/client.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/mei/hw-me.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/mei/main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/mei/vsc-fw-loader.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/mei/vsc-tp.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/ocxl/afu_irq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/ocxl/config.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/ocxl/context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/ocxl/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/ocxl/link.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/ocxl/mmio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/pvpanic/pvpanic.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/rpmb-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/sgi-xp/xp_main.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/sram-exec.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/tifm_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/uacce/uacce.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/vmw_vmci/vmci_context.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/vmw_vmci/vmci_datagram.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/vmw_vmci/vmci_doorbell.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/vmw_vmci/vmci_driver.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/vmw_vmci/vmci_event.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/vmw_vmci/vmci_guest.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/misc/vmw_vmci/vmci_queue_pair.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/core/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/core/crypto.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/core/pwrseq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/core/regulator.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/core/slot-gpio.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/host/cqhci-core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/host/dw_mmc-pltfm.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/host/dw_mmc.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/host/mmc_hsq.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/host/of_mmc_spi.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
   drivers/mmc/host/renesas_sdhi_core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
