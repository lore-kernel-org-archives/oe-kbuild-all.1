Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE1B3ACA43
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 23:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783639452; cv=none; b=oUAItK+mQhDr5EI6JVrhpTthy5+GXtuke1Rq+wJuqPuc4/U4t5nTT7EZAYT9tI3Ze8YiJWTwOy6s0DSLPrsMrQUgXQ2bYUcTFAEOXDwXPqfU5KbMqdswFONSbx+NYfOxfKEFDQbFgM8+lNmJUJoB3DVHQ0ONnPKQTmuUpjKYeYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783639452; c=relaxed/simple;
	bh=T8saxFH0nRJvCeju+6qsinlRpUF6uZvV0ZOYCsZGWG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qjq9X6ah9MNgSODPh8PwbwcKexXJazyahpbgL21LVmv/bsAfssHn6rDT7psIgJz33AyRdJP5HP6X9a/OdkPkOyl8iMCNa2FXWWO1IsGrKD/Peq/Lg+JmbUEdEGDvTzBLC4O/HHwnpe9Hk1BDRrJ2rS9uo3Z1u0+8E/841wkxU6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKZ7JqQA; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKZ7JqQA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783639450; x=1815175450;
  h=date:from:to:cc:subject:message-id;
  bh=T8saxFH0nRJvCeju+6qsinlRpUF6uZvV0ZOYCsZGWG8=;
  b=oKZ7JqQAVf2U1tLwut/6rq6j2F2vO1TGrFvZYzkVKs2uH8s4+z63txO5
   BD3jIwCNz0diq+yuPLmWXBTWGR3supqARwDca5RIpq/hlzINRWQf7RyzP
   Sk+F3zHwFmzf6g+Kqn2dMf9ksKJL8ZpVzd0J6tiSkebxuIIpJCOyRqr4j
   rZyWysTpu+Wnny6+GKB/8aopaLIgW/eYgA0CduAdBgHaPAN06FvLJU3a8
   ovKUcitIhtPt/jJB5GPCrsC1syw1GnkZad/9+xf3wnsuK69eBSCUcPgQ5
   jb8oF9/tXZ/CkMMgZEQRZJKRgWf+8PG155PUvAYyGgS3siIBEivISo6sA
   w==;
X-CSE-ConnectionGUID: 6HsnwYkzQBi27vgU3lw9dw==
X-CSE-MsgGUID: oW/ioHkiTBiYjHpJcfSDuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84439662"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84439662"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 16:24:09 -0700
X-CSE-ConnectionGUID: 1UemE5WPQD2B31mJ/UwNnA==
X-CSE-MsgGUID: wLRNfp/LT3ieKFTLGg+xcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254828881"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2026 16:24:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1why69-00000000IEt-2D9m;
	Thu, 09 Jul 2026 23:24:05 +0000
Date: Fri, 10 Jul 2026 07:24:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-07 1/1] WARNING: modpost:
 drivers/rtc/rtc-imxdi: section mismatch in reference: dryice_rtc_driver+0x4
 (section: .data) -> dryice_rtc_remove (section: .exit.text)
Message-ID: <202607100725.LCXwsPNC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Uwe,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-07
head:   d3bef8209a47d6064d1b9568f3c7a50d06fd283f
commit: f177cd0c15fcc7bdbb68d8d1a3166dead95314c8 [1/1] modpost: Don't let "driver"s reference .exit.*
config: arm-randconfig-002 (https://download.01.org/0day-ci/archive/20260710/202607100725.LCXwsPNC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260710/202607100725.LCXwsPNC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f177cd0c15fc ("modpost: Don't let "driver"s reference .exit.*")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607100725.LCXwsPNC-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_spi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-mc33880.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: drivers/video/fbdev/atmel_lcdfb: section mismatch in reference: atmel_lcdfb_driver+0x4 (section: .data) -> atmel_lcdfb_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/goldfishfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/fbdev/vfb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-ipe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6779-aud.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6797-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt6797-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt2712-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7622-eth.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7622-hif.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt7622-aud.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-audio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8183-ipu_conn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8186-vdec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-apmixedsys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-topckgen.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-peri_ao.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-infra_ao.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-adsp_audio26m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-img.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vdo0.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vdo1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vpp0.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8188-vpp1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-cam.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-imp_iic_wrap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-mm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-msdc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-scp_adsp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8192-venc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-apu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/mediatek/clk-mt8365-mfg.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/suniv-f1c100s-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-h6-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun50i-h616-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun4i-a10-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-a83t-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-de2-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun8i-r-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-de-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/sunxi-ng/sun9i-a80-usb-ccu.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pmdomain/amlogic/meson-ee-pwrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/virtio/virtio_dma_buf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/reset/hisilicon/hi6220_reset.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/n_gsm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-abt-y030xx067a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/panel/panel-newvision-nv3052c.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/lontium-lt9611.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/tiny/gm12u320.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/gud/gud.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/udl/udl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-qup.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/core/usbcore.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/navman.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/qcaux.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/symbolserial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/yurex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/chipidea/ci_hdrc_msm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ss_lb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_obex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_ether.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ncm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ecm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_phonet.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_eem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_fs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_printer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
>> WARNING: modpost: drivers/rtc/rtc-imxdi: section mismatch in reference: dryice_rtc_driver+0x4 (section: .data) -> dryice_rtc_remove (section: .exit.text)
WARNING: modpost: drivers/rtc/rtc-mv: section mismatch in reference: mv_rtc_driver+0x4 (section: .data) -> mv_rtc_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-adstech-dvb-t-pci.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-alink-dtu-m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-anysee.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-apac-viewcomp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-astrometa-t2hybrid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-asus-pc39.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-asus-ps3-100.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-ati-tv-wonder-hd-600.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-ati-x10.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avermedia-a16d.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avermedia-cardbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avermedia-dvbt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avermedia-m135a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avermedia-m733a-rm-k6.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avermedia.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avermedia-rm-ks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-avertv-303.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-azurewave-ad-tu700.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-beelink-gs1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-beelink-mxiii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-behold-columbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-behold.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-budget-ci-old.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-cinergy-1400.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-cinergy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-ct-90405.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-d680-dmb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dib0700-nec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dib0700-rc5.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-digitalnow-tinytwin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-digittrade.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dm1105-nec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dntv-live-dvb-t.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dntv-live-dvbt-pro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dreambox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dtt200u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dvbsky.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dvico-mce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-dvico-portable.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-em-terratec.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-encore-enltv2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-encore-enltv-fm53.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-encore-enltv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-evga-indtube.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-eztv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-flydvb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-flyvideo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-fusionhdtv-mce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-gadmei-rm008z.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-geekbox.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-genius-tvgo-a11mce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-gotview7135.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-hauppauge.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-hisi-poplar.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-hisi-tv-demo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-imon-mce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-imon-pad.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-imon-rsc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-iodata-bctv7e.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-it913x-v1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-it913x-v2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-kaiomy.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-khadas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-khamsin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-kworld-315u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-kworld-pc150u.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-kworld-plus-tv-analog.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-leadtek-y04g0051.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-lme2510.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-manli.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-mecool-kiii-pro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-mecool-kii-pro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-medion-x10.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-minix-neo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-msi-digivox-iii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-msi-digivox-ii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-msi-tvanywhere.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-msi-tvanywhere-plus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-nebula.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-nec-terratec-cinergy-xs.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-norwood.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-npgtech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-odroid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pctv-sedna.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pine64.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pinnacle-color.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pinnacle-grey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pinnacle-pctv-hd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview-002t.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview-mk12.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview-new.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pixelview.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-powercolor-real-angel.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-proteus-2309.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-purpletv.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-pv951.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-rc6-mce.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/keymaps/rc-real-audio-220-32-keys.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
