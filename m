Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83C4C635
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 May 2024 09:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714554091; cv=none; b=Kg7asmKUTyOSTvpAICaqx7Lk0MymZPVpiwvYzVp9RUTlcza2uepQqXhuxq3U1b1hMY7ZE8CIvqxQfmHAlDzcG75L6GEv+M5JBqN8izqcTSZjMEOjINLOvLuJms4rZp2d6zcHS5w34ugpkl3sGrT0aVv9oo3pjzya7zgTGPTke7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714554091; c=relaxed/simple;
	bh=+JDtfT/3ptmBeCm4OWzxRxTwgO5amx/518wdmpmuZ2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V7CGIIbYuLy+qv3cqP2xIEvj5qWnqt+GiMKKKpa5kHLG+jnc4B+DYz2fewx8cEKZZw5kbEICJMcMJ09XO5guXE+ZT8L53GhesBX1eFcjUrxJMPNB4mXPBAyO0c3eox2wALwWRZCH3ipBmTj+IW1P7y5h3m9yhEIs3LpzLgMsiYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Owh2ncWD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Owh2ncWD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714554089; x=1746090089;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+JDtfT/3ptmBeCm4OWzxRxTwgO5amx/518wdmpmuZ2E=;
  b=Owh2ncWDIFjTUVpMQhIr736vVKBv8CFrcw/7WBa4DXjJmXgCCX07dxgR
   8N45s/q38pxIaSImAzHYXb/321+pWdrseBcbInUzxgP+wFPIEZOXC1ZI5
   mgxBCj4NCiuswl23zHkd2W9jchGXegXUhVrwDXVqRDQC5qiSYTGap6wlG
   5CyLd9Rf1zXsx0ww01poIrF8DoAA2c5g/1IrQ2JBIzafrY6vFhrImjU1K
   aczk/uaDnAYJVC/nRc1YQlqpj7gxZKKL8dWo0WB/xcSd7DnV/HeTCZirQ
   kbklv+0J71HAuUB1V5s34EK6WJpfb11k6VB4/rXTOQYPaSMzWb2eKZuCS
   A==;
X-CSE-ConnectionGUID: 5W/6ILLzQuS+ZEOjrzZfVg==
X-CSE-MsgGUID: Va8Z/MsdS82/QgALC15WYQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="35667653"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="35667653"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2024 02:01:28 -0700
X-CSE-ConnectionGUID: eFv2VQ9FRFG4WhcqT137hw==
X-CSE-MsgGUID: DqAVWmr0Rou6Vj/0Be/qsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; 
   d="scan'208";a="49933673"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 May 2024 02:01:27 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s25q9-0009J8-04;
	Wed, 01 May 2024 09:01:25 +0000
Date: Wed, 1 May 2024 17:00:45 +0800
From: kernel test robot <lkp@intel.com>
To: Vadim Fedorenko <vadfed@meta.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Martin KaFai Lau <martin.lau@kernel.org>
Subject: [linux-next:master 7456/9709] ERROR: modpost:
 "bpf_crypto_register_type" [crypto/bpf_crypto_skcipher.ko] undefined!
Message-ID: <202405011634.4JK40epY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d04466706db5e241ee026f17b5f920e50dee26b5
commit: fda4f71282b21a8cf230b656781efb0a41371fd4 [7456/9709] bpf: crypto: add skcipher to bpf crypto
config: powerpc64-randconfig-r012-20220205 (https://download.01.org/0day-ci/archive/20240501/202405011634.4JK40epY-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240501/202405011634.4JK40epY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405011634.4JK40epY-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in lib/slub_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/memcpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/is_signed_type_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/overflow_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/stackinit_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/fortify_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strcat_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/strscpy_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/siphash_kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/phy/broadcom/phy-bcm-ns-usb2.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-mc33880.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediatek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-visconti.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-altera.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/controller/pcie-mt7621.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pci/pci-pf-stub.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ttyprintk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-kunit.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-raw-ram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-slimbus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-w1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-sccb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mfd/qcom-pm8008.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cxl/cxl_mem.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-altera-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spi/spi-fsl-lib.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/firewire/firewire-uapi-test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-twl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-ali1563.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/i2c/busses/i2c-pxa.o
WARNING: modpost: drivers/media/i2c/et8ek8/et8ek8: section mismatch in reference: et8ek8_i2c_driver+0x10 (section: .data) -> et8ek8_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/au8522_decoder.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/dvb-frontends/mb86a16.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/rc/rc-core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/platform/ti/vpe/ti-vpdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/power/reset/piix4-poweroff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/corsair-cpro.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: drivers/mmc/host/davinci_mmc: section mismatch in reference: davinci_mmcsd_driver+0x10 (section: .data) -> davinci_mmcsd_remove (section: .exit.text)
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/host/renesas_sdhi_core.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-a4tech.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-apple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-aureal.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cherry.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-dr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-elecom.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-vivaldi-common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gyration.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lenovo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-maltron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-mf.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-microsoft.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-monterey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ortek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-pl.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-petalynx.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-primax.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-saitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-semitek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-tivo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-xinmo.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/of/of_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_brcm_nvram.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/hisi-spmi-controller.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/spmi/spmi-pmic-arb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/pcmcia_rsrc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pcmcia/yenta_socket.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/adc/ingenic-adc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/iio/buffer/kfifo_buf.o
>> ERROR: modpost: "bpf_crypto_register_type" [crypto/bpf_crypto_skcipher.ko] undefined!
>> ERROR: modpost: "bpf_crypto_unregister_type" [crypto/bpf_crypto_skcipher.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
