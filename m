Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5F85D741
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 10:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706956517; cv=none; b=fV9p0gjBLZNyIXYq2Snf2C0bMFb2/OQF995vHwtGRNUmmiGfoewkUrOyzzgdeRulXckAq7gom4qj73IUNRMhYPGCqQMFFLyuRl7fj1i47Fa0ZlJAbSdWq2SOaq/1sa9qmzoACZj8zdK9+MzGoVgzwkg+k3gZ+izKEz/2F3FnrnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706956517; c=relaxed/simple;
	bh=/FEInfTzHxYcfn0aPcuI+BywOn679rw0Ma5Wu6aEo7A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jgQuojMXcKB+JvUQDaEmvUT0qPEMy5IEcikdEXTyDBLSN9m3iIaRayOdKDQgqOa5nMFS2AtpKrO9vqCLjHSp1gHmrafy9gMlv3OcEe1lcBVx6VxtDaHned8PxF61XxcSKTu3pfobhVF+hhHxcflacCU7hfnVNymv/GFp8gsvRH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kYn4Juju; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kYn4Juju"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706956515; x=1738492515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/FEInfTzHxYcfn0aPcuI+BywOn679rw0Ma5Wu6aEo7A=;
  b=kYn4JujuubDoWqoqSW7lHhaEbpXZBdIT4KHHl+tTA+KquOMSvysmH0Du
   dzO47uaafBFZRQZ6JWHFLbZ8mNSsyP3NCAi6MIowM0rZcYS3UoVRk7svE
   GSWyhhs8vjrp3ER+H6l9mx3KpbCyy3eF6kZHz1El5V7WuAAiglBkF9yx8
   qpCA26NAjCp3NyRlf/Ji77z3PLK1xQfgr6UKPfxRmrxEssxHvH+krSfkc
   R8WLqNYLncfvE8HQA+8vavAH/D7uxJQAkrbSoygCWuqKcYjP88o9Urf4l
   mk69+wqePqYN+IpSeiDEwk3BQmqJhaZHmsrRlQoGehcPDVKQHe5zXhWQh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="11666764"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="11666764"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 02:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4899117"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Feb 2024 02:35:13 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWDMc-0004v0-0r;
	Sat, 03 Feb 2024 10:35:10 +0000
Date: Sat, 3 Feb 2024 18:34:45 +0800
From: kernel test robot <lkp@intel.com>
To: zouxiaoh <xiaohong.zou@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>,
	Dmitry Perchanov <dmitry.perchanov@intel.com>
Subject: [intel-lts:5.15/linux 44/67] drivers/media/i2c/d4xx.c:4580:2:
 warning: 'snprintf' will always be truncated; specified size is 20, but
 format string expands to at least 23
Message-ID: <202402031810.ph4BUF0b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/linux
head:   b2769cf869322589ab9147c774404f1f62b6561d
commit: db4067cbf480f22e8b0b0ef4467bb6e69e65250e [44/67] media: i2c: d4xx: Update to match RealSense latest code.
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240203/202402031810.ph4BUF0b-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project fdac7d0b6f74f919d319b31a0680c77f66732586)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031810.ph4BUF0b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031810.ph4BUF0b-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     464 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     477 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from drivers/media/i2c/d4xx.c:21:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     490 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from drivers/media/i2c/d4xx.c:21:
   In file included from include/linux/gpio.h:62:
   In file included from include/asm-generic/gpio.h:11:
   In file included from include/linux/gpio/driver.h:7:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:75:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     501 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     511 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     521 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     609 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     617 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     625 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     634 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     643 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     652 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   drivers/media/i2c/d4xx.c:2917:10: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2917 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2916:10: note: previous initialization is here
    2916 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2931:10: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2931 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2930:10: note: previous initialization is here
    2930 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2945:10: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
    2945 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:2944:10: note: previous initialization is here
    2944 |         .step = 1,
         |                 ^
   drivers/media/i2c/d4xx.c:3231:67: error: no member named 'subdev_info' in 'struct d4xx_pdata'
    3231 |         snprintf(sd->name, sizeof(sd->name), "D4XX %s %c", name, dpdata->subdev_info[0].suffix);
         |                                                                  ~~~~~~  ^
   drivers/media/i2c/d4xx.c:3222:21: warning: mixing declarations and code is a C99 extension [-Wdeclaration-after-statement]
    3222 |         struct d4xx_pdata *dpdata = c->dev.platform_data;
         |                            ^
   drivers/media/i2c/d4xx.c:3658:46: warning: variable 'stream_id' set but not used [-Wunused-but-set-variable]
    3658 |         u16 config_status_base, stream_status_base, stream_id;
         |                                                     ^
   drivers/media/i2c/d4xx.c:3799:46: warning: variable 'stream_id' set but not used [-Wunused-but-set-variable]
    3799 |         u16 config_status_base, stream_status_base, stream_id;
         |                                                     ^
   drivers/media/i2c/d4xx.c:4146:22: warning: unused variable 'sd' [-Wunused-variable]
    4146 |         struct v4l2_subdev *sd = &state->mux.sd.subdev;
         |                             ^~
>> drivers/media/i2c/d4xx.c:4580:2: warning: 'snprintf' will always be truncated; specified size is 20, but format string expands to at least 23 [-Wformat-truncation]
    4580 |         snprintf(msg, sizeof(msg), "DFU info: \tver: (0x%x)\n", fw_ver);
         |         ^
   drivers/media/i2c/d4xx.c:4682:22: warning: unused variable 'parent' [-Wunused-variable]
    4682 |         struct i2c_adapter *parent = i2c_parent_is_i2c_adapter(
         |                             ^~~~~~
   drivers/media/i2c/d4xx.c:5055:14: error: no member named 'subdev_num' in 'struct d4xx_pdata'
    5055 |         if (dpdata->subdev_num >= 1) {
         |             ~~~~~~  ^
   drivers/media/i2c/d4xx.c:5056:26: error: no member named 'subdev_info' in 'struct d4xx_pdata'
    5056 |                 sensor_alias = dpdata->subdev_info[0].board_info.addr;
         |                                ~~~~~~  ^
   drivers/media/i2c/d4xx.c:5057:23: error: no member named 'subdev_info' in 'struct d4xx_pdata'
    5057 |                 ser_alias = dpdata->subdev_info[0].ser_alias;
         |                             ~~~~~~  ^
   21 warnings and 4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_PMC_CORE
   Depends on [n]: X86 && X86_PLATFORM_DEVICES [=n] && PCI [=y] && ACPI
   Selected by [m]:
   - DWMAC_INTEL_PLAT [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_PLATFORM [=m] && OF [=y] && COMMON_CLK [=y] && STMMAC_ETH [=m]


vim +/snprintf +4580 drivers/media/i2c/d4xx.c

  4565	
  4566	/* When a process reads from our device, this gets called. */
  4567	static ssize_t ds5_dfu_device_read(struct file *flip,
  4568			char __user *buffer, size_t len, loff_t *offset)
  4569	{
  4570		struct ds5 *state = flip->private_data;
  4571		u16 fw_ver;
  4572		char msg[20];
  4573		int ret = 0;
  4574	
  4575		if (mutex_lock_interruptible(&state->lock))
  4576			return -ERESTARTSYS;
  4577		ret = ds5_read(state, DS5_FW_VERSION, &fw_ver);
  4578		if (ret < 0)
  4579			goto e_dfu_read_failed;
> 4580		snprintf(msg, sizeof(msg), "DFU info: \tver: (0x%x)\n", fw_ver);
  4581		if (copy_to_user(buffer, msg, strlen(msg)))
  4582			ret = -EFAULT;
  4583		else {
  4584			state->dfu_dev.msg_write_once = ~state->dfu_dev.msg_write_once;
  4585			ret = strlen(msg) & state->dfu_dev.msg_write_once;
  4586		}
  4587	
  4588	e_dfu_read_failed:
  4589		mutex_unlock(&state->lock);
  4590		return ret;
  4591	};
  4592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
