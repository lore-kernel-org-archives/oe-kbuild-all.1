Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F4B3A1A4C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 22:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772144404; cv=none; b=o3hPuIP5ovNnw4P4DIHxPIagYq8W0tjoCniHe8B8uiw7adOZ1AO3QjLZ7ZflxC8JoA/E6wRDWA6QK2CzwFsllXAxfI3joVoZmZIZlqaKUV+tc2KJRwOEkhJy0WwFP8BcfnMa5tjScdV5qvrbbjtKKSIRx/AGKrlnWmGoQlDyYhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772144404; c=relaxed/simple;
	bh=r2oPRljlZjgUFlcgUHRvxdGy+Pzj488RiES072LmKyE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TmgjoQFzmMRmxZptgMXWoLikz/Jc+lMYcdFQd7QG+8TQQRckZHWVwUVj5BM0vFXAmLsEEy0ACiRxaVs95BJCeOB8NB6aaU6SjYsv/CL8HvRQKlZj3+FsVt/gSHAjW4ekA/5XmKtTl2cUfk9Wwe5H5iuvMkOQiHRCwjr9UTSIKpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZpHulM78; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZpHulM78"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772144401; x=1803680401;
  h=date:from:to:cc:subject:message-id;
  bh=r2oPRljlZjgUFlcgUHRvxdGy+Pzj488RiES072LmKyE=;
  b=ZpHulM78H3YEfjXIuhUbr9DLQjFz7+o/DUJ9UHg3cZpbq0lp7InVT4/c
   Yf99VNflHhVTzeWG+oTnM4o0OKckwiXot8sDSwhxfDvC1X6WhhlRY3eB6
   LkaZOhw0Jxnoa8mb4cggYE4+h/oa2Ic8O2f564H1EHfgfRWgdzScFrYj1
   PBDsYdbEu3WZIlUf1OHVFWlRbRfWdwXNxXqXRB4z4yuddq2XQgZFGtj+U
   SyjBcmNb1P3XzS6tMfgTr/2YtmPET8ZIn6EREmdXboV8njZ277UamxaPZ
   lezrj6Rx408RQRJnqC5stOC+o1UWDvlPTEBi2LqEDa0vi3W5QKsR/RrDy
   w==;
X-CSE-ConnectionGUID: lXQms1u+R6qihnYJMmHNiA==
X-CSE-MsgGUID: 7cGPPu69QmOjnoVOB5c8VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73265918"
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="73265918"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 14:20:00 -0800
X-CSE-ConnectionGUID: gR/rGEJNRV+/nvO84W/AAQ==
X-CSE-MsgGUID: ZBU8KXUXRAu5CZQNtNrzGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,313,1763452800"; 
   d="scan'208";a="214196550"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 26 Feb 2026 14:19:58 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvji7-000000009wB-3Zqw;
	Thu, 26 Feb 2026 22:19:55 +0000
Date: Fri, 27 Feb 2026 06:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2203/2633] arm-linux-gnueabi-ld: warning:
 orphan section `.modinfo' from `fs/squashfs/super.o' being placed in section
 `.modinfo'
Message-ID: <202602270631.Rv6on3Hk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d6661873f6b54c75195780a40d66bad3d482d8f
commit: 678fe9aa0d18781f895fd0752bf401ad5240b842 [2203/2633] kbuild: Split .modinfo out from ELF_DETAILS
config: arm-wpcm450_defconfig (https://download.01.org/0day-ci/archive/20260227/202602270631.Rv6on3Hk-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260227/202602270631.Rv6on3Hk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602270631.Rv6on3Hk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/workqueue.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/printk/printk.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/irq/spurious.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/update.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/srcutree.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/tree.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/module/main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/configs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `mm/slab_common.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/binfmt_script.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/configfs/mount.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/squashfs/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_vfat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_msdos.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/exportfs/expfs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_base.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp437.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp850.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-1.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-2.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_utf8.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/ubifs/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/debugfs/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/api.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/algapi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aead.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/skcipher.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ahash.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/shash.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/akcipher.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sig.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/kpp.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsa.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsa-pkcs1pad.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsassa-pkcs1.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/acompress.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/scompress.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/algboss.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/testmgr.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/cmac.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sha256.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ecb.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ctr.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/gcm.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ccm.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aes.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/deflate.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/lzo.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/lzo-rle.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rng.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ghash-generic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/zstd.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/asymmetric_keys/public_key.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/asymmetric_keys/x509_public_key.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/asymmetric_keys/pkcs7_parser.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/bsg.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/mq-deadline.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `block/kyber-iosched.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/math/rational.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crc/crc16.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crc/crc32-main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/utils.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/aes.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/gf128mul.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/blake2s.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/sha1.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/sha256.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/crypto/mpi/mpiutil.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/bitrev.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/linear_ranges.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/xxhash.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/zlib_inflate/inflate_syms.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/zlib_deflate/deflate_syms.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/lzo/lzo1x_compress_safe.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/lzo/lzo1x_decompress_safe.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/lz4/lz4_decompress.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/zstd/zstd_compress_module.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/zstd/zstd_decompress_module.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/zstd/zstd_common_module.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/xz/xz_dec_syms.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/glob.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/dim/dim.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/asn1_decoder.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `lib/oid_registry.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/bus/simple-pm-bus.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/pinctrl/pinctrl-single.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/pinctrl/nuvoton/pinctrl-wpcm450.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/gpio/gpio-mmio.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/pwm/core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/led-class.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/leds-gpio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/trigger/ledtrig-timer.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/trigger/ledtrig-heartbeat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/leds/trigger/ledtrig-default-on.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/video/fbdev/core/fbmem.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/char/ipmi/kcs_bmc.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/char/ipmi/kcs_bmc_serio.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/char/ipmi/kcs_bmc_cdev_ipmi.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/char/ipmi/kcs_bmc_npcm7xx.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/soc/nuvoton/wpcm450-soc.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/regulator/fixed.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/n_null.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/pty.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/sysrq.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/vt/keyboard.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/vt/vt.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_base_bus.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_ctrl.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_port.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_platform.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_port.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_fsl.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/8250/8250_of.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/tty/serial/serial_mctrl_gpio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/char/random.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/char/hw_random/core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/base/firmware_loader/main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/base/regmap/regmap-i2c.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/base/regmap/regmap-mmio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/block/loop.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/misc/eeprom/at24.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/hosts.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi_scan.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi_devinfo.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/scsi/scsi_common.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdcore.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdconcat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdchar.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/parsers/cmdlinepart.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/parsers/ofpart_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtd_blkdevs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/mtdblock.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/chips/chipreg.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/spi-nor/core.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/ubi/build.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/mtd/ubi/block.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/spi/spi-wpcm-fiu.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/spi/spi-npcm-pspi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/mdio_bus.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/phylink.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/phy_device.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/mdio_devres.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/fixed_phy.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/phy/realtek/realtek_main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/mdio/fwnode_mdio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/net/mdio/of_mdio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/common/common.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/common/ulpi.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/chipidea/core.o' being placed in section `.modinfo'
>> arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/chipidea/ci_hdrc_usb2.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/chipidea/ci_hdrc_msm.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/chipidea/ci_hdrc_npcm.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/chipidea/usbmisc_imx.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/chipidea/ci_hdrc_imx.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/chipidea/ci_hdrc_tegra.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/composite.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/udc/core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/f_acm.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/u_serial.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/f_serial.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/u_ether.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/f_eem.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/f_mass_storage.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/storage_common.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/f_fs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/gadget/function/f_hid.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/usb/roles/class.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/serio/serio.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/serio/serport.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/serio/libps2.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/input.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/touchscreen.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/touch-overlay.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/ff-memless.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/vivaldi-fmap.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/input-leds.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/evdev.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/keyboard/atkbd.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/input/keyboard/gpio_keys.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/i2c/i2c-core-base.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/i2c/i2c-dev.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/i2c/i2c-mux.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/i2c/busses/i2c-npcm7xx.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/pps/pps.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/ptp/ptp_clock.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/power/supply/power_supply_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/hwmon/hwmon.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/hwmon/npcm750-pwm-fan.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/watchdog/watchdog_core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/watchdog/watchdog_dev.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/watchdog/npcm_wdt.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/cpuidle/cpuidle.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/extcon/extcon.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/nvmem/core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/peci/core.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `drivers/peci/cpu.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/core/selftests.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/ipv4/ip_tunnel.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/ipv4/tunnel4.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/ipv4/inet_diag.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/ipv4/tcp_diag.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/ipv4/tcp_cubic.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/unix/diag.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/ipv6/af_inet6.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/ipv6/sit.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/packet/af_packet.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/packet/diag.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/dsa/dsa.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/dsa/tag_dsa.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `net/dsa/tag_trailer.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `.vmlinux.export.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/workqueue.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/printk/printk.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/irq/spurious.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/update.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/srcutree.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/rcu/tree.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/module/main.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `kernel/configs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `mm/slab_common.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/binfmt_script.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/configfs/mount.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/squashfs/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_vfat.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/fat/namei_msdos.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/exportfs/expfs.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_base.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp437.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_cp850.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-1.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_iso8859-2.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/nls/nls_utf8.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/ubifs/super.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `fs/debugfs/inode.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/api.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/algapi.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/aead.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/skcipher.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/ahash.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/shash.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/akcipher.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/sig.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/kpp.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsa.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsa-pkcs1pad.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/rsassa-pkcs1.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/acompress.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/scompress.o' being placed in section `.modinfo'
   arm-linux-gnueabi-ld: warning: orphan section `.modinfo' from `crypto/algboss.o' being placed in section `.modinfo'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
