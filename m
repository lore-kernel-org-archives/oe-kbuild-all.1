Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBBC7F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 02:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694745914; x=1726281914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w4mzJbpef5jg92MoFhQRjizdMYPdJ8ri75ihi0Ppom8=;
  b=ErGYW9F5VfnWfl6dGExu1Y+5Hg0/a6SOuZz8DnGvKa1Ws50XxmEDLaJN
   kCEzT3WNRzYsajswG+kN87GgIVRTbVAQXHcTJYEARwDBl/nQi2NBrOXL4
   AvrR0KDOY7M5Hidoimf7/eg6S1aZf9zMGBBw1fDgGyaTJiI4+GG7L5GwP
   bA0i+ROKFrOg4uj9AFvnabnhinNOHmMuNuMfDuZdknMHywmp6OcRVRPbq
   cSR6I1uuZVGMZsK0ZNN+GKkrXnTA+vsAFHj72uHUQZMZnVm7VcKJ1/lqC
   gnlB00d+CsAa++DkDodA5HbhfDhCCvuZZTBA1FI6sFjV/JxdbgEEiEVyz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="378053409"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="378053409"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 19:45:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="991675488"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="991675488"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 14 Sep 2023 19:45:11 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgypR-0002KV-0q;
	Fri, 15 Sep 2023 02:45:09 +0000
Date: Fri, 15 Sep 2023 10:44:15 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:iov-kunit 5/9] ERROR: modpost: vmlinux: local symbol
 'arch_pick_mmap_layout' was exported
Message-ID: <202309151035.vGGt7WXc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git iov-kunit
head:   75675904b940d8090d74bde195d8ba4a2e3aee80
commit: 282ae3bc8ef2f1742153b9462ff31c20c09ebc6a [5/9] iov_iter: Create a function to prepare userspace VM for UBUF/IOVEC tests
config: arm-randconfig-002-20230915 (https://download.01.org/0day-ci/archive/20230915/202309151035.vGGt7WXc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230915/202309151035.vGGt7WXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309151035.vGGt7WXc-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in vmlinux.o
>> ERROR: modpost: vmlinux: local symbol 'arch_pick_mmap_layout' was exported
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/locktorture.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/rcu/refscale.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/time/time_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp737.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp775.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp857.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp863.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp864.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp866.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_cp869.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_ascii.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_iso8859-15.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/nls_koi8-r.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-celtic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-croatian.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-gaelic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/nls/mac-turkish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in fs/autofs/autofs4.o
WARNING: modpost: missing MODULE_DESCRIPTION() in security/keys/encrypted-keys/encrypted-keys.o
WARNING: modpost: missing MODULE_DESCRIPTION() in crypto/curve25519-generic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/crypto/libdes.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_ubsan.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpio/gpio-pcf857x.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/video/backlight/platform_lcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/versatile/clk-vexpress-osc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma_mgmt.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/dma/qcom/hdma.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/8250/8250_base.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/serial/serial_mctrl_gpio.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/tty/ttynull.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ttyprintk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/lp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/char/ppdev.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sil-sii8620.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/bridge/sii9234.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/gpu/drm/drm_panel_orientation_quirks.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/base/regmap/regmap-spmi.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/charlcd.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/auxdisplay/hd44780_common.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/host/xhci-pci-renesas.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/usb_debug.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/serial/mxuport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/ezusb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/misc/isight_firmware.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/libcomposite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_acm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_ss_lb.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/u_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_serial.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_hid.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/function/usb_f_printer.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/usb/gadget/legacy/g_dbgp.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/input/tests/input_test.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/i2c/uda1342.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/tuners/tda9887.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/common/uvc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-async.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/media/v4l2-core/v4l2-fwnode.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_simple.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/pwrseq_emmc.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/mmc/core/sdio_uart.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/crypto/atmel-sha204a.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-belkin.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-cypress.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-emsff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ezkey.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-google-stadiaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ite.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kensington.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-keytouch.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-kye.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-lcpower.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-magicmouse.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-redragon.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-sunplus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-gaff.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-zydacron.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-viewsonic.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/perf/arm-ccn.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwtracing/intel_th/intel_th_msu_sink.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/nvmem/nvmem_u-boot-env.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/parport/parport.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/greybus.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/greybus/gb-es2.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
