Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793408279;
	b=VROHjrepDKH9+XvexPvBqcYPJBUPmukaiJrsveWefcQx5epzTZ6YN6PdvUVWgxB8NiCz
	 dBh1+Ll5Eb6oFjmfR9WSW9YOhBhJSx30MFRwjVKBzB/m38wLhW30dR6rP01hQbPEWC835
	 FAuu1u12kknHpNhjLW0lgQT75hJrSUHsOeII7Eymo5Q1tB6XDPQ5LCflbOi+GJxm3anCk
	 TQsZz6MPvwiOBkZYs6IaBSZHoQ8j05oACR5gTkojSJuLxU+Fvf1qd+nowm9uOGQY+XOAL
	 Q7SvfGVSXTmA1wyorkOaptRDbiyGtw+QzwpxWKM7J7PocrNGdohSyRl6v9BLNFhR6Zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793408279;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=gWdTUNokPIMfd+SATKlnBkpR03+f6IbraqzUYbDOFAM=;
	b=eVrSEMYjBFpR0Tr81w9+G9CUUy2KKbaJUwIxSYvnU5g5Krk9RO+diWONOVj6XyJ0beEB
	 983j6fZB5IfyJLkP5SGbkADSAW57Ka5Q0VJdqJpatSWSmpGhERmy5nosOGryzYokzp+b7
	 FJKW+HfPxMLPkoBEB1cNkbWabYkUU6GpxFBBfb4DU4EIThPPAnEOUuj5BunV/k1tipyAu
	 QqRkJfrKR/lfzw16f964Iel2QC+mKP42Bum+ADvomZ6VPWV7R1/s62rzqsNd87ZIZFn9d
	 eMsQK4s0JDbtyS+DPbca6ph+oSmLe35qIkJANQckqy6qlVdCJP8g3VUz4oB9ee7P6Eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WcWeHiT6;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE4D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 00:57:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EE4D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WcWeHiT6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793408278; x=1824944278;
  h=date:from:to:cc:subject:message-id;
  bh=XAcKw6XPaJyM2uW3eW4hohEG4YNCYs0hQgdKJF5KFsA=;
  b=WcWeHiT65NdqfVO0L+TRuEybiyd1yzj9epeDxZY+x3px/NZhBEDJsIrm
   38BQI1IA+Xf08cgFcv+HqQK92Brieti5b1iovHdPshhb/gPyEYwQRoFYa
   H8rulXGurJRoWz3Ge4YzrD5yIdDF9LwzBtZZRm3FmOllY0H751lvKENwY
   rSEFJpTbEjPoetgpvsjseQ7cRyXpd1xX8gfF7C2lAiTtPHU4Kl6Q02zjB
   HVSrBUsQX9eF/3nMuM7TDtym2ua7iwQgbFGnCU9LzRpajZq+5VSO8S8A+
   1fsAGkEIRStA9yke46wWPOudsW6cTgkTqGWXN4FeH9CGx8NVxtLLFv6Gw
   g==;
X-CSE-ConnectionGUID: d3Xmw7wEQaq6CPhHFXnRqQ==
X-CSE-MsgGUID: WkOdsYjVSyGMlmXm079a+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2054339"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2054339"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 17:57:58 -0700
X-CSE-ConnectionGUID: 8quNZkT8T6+/URY7aSL+hw==
X-CSE-MsgGUID: uQRrCFenRameC4ScxHn18w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5912489"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Oct 2026 17:57:55 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMxPr-00000000cPc-49sb;
	Sat, 31 Oct 2026 00:57:51 +0000
Date: Sat, 31 Oct 2026 08:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 12/12]
 drivers/char/tpm/tpm_tis_i2c.c:243:12: error: use of undeclared identifier
 'TPM_I2C_BUFSIZE'
Message-ID: <202610310850.l6o9LNb6-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git master
head:   7e8d0278a462f604dd884db39b76d0ac3c1ad652
commit: 7e8d0278a462f604dd884db39b76d0ac3c1ad652 [12/12] tpm: tis_i2c: Add reset delays for ST33KTPM2XI2C
config: um-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310850.l6o9LNb6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c2ea4440d4b64c148de4fdfca1fc2c437a0701e4)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310850.l6o9LNb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310850.l6o9LNb6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/char/tpm/tpm_tis_i2c.c:13:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:27:
   In file included from include/linux/kernel_stat.h:8:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + port;
         |                                                   ~~~~~~~~~~ ^
>> drivers/char/tpm/tpm_tis_i2c.c:243:12: error: use of undeclared identifier 'TPM_I2C_BUFSIZE'
     243 |         if (len > TPM_I2C_BUFSIZE - 1)
         |                   ^~~~~~~~~~~~~~~
   drivers/char/tpm/tpm_tis_i2c.c:352:40: error: use of undeclared identifier 'TPM_I2C_BUFSIZE'
     352 |         phy->io_buf = devm_kzalloc(&dev->dev, TPM_I2C_BUFSIZE, GFP_KERNEL);
         |                                               ^~~~~~~~~~~~~~~
   1 warning and 2 errors generated.


vim +/TPM_I2C_BUFSIZE +243 drivers/char/tpm/tpm_tis_i2c.c

bbc23a07b0728c Alexander Steffen  2022-06-08  232  
bbc23a07b0728c Alexander Steffen  2022-06-08  233  static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
bbc23a07b0728c Alexander Steffen  2022-06-08  234  				   const u8 *value,
bbc23a07b0728c Alexander Steffen  2022-06-08  235  				   enum tpm_tis_io_mode io_mode)
bbc23a07b0728c Alexander Steffen  2022-06-08  236  {
bbc23a07b0728c Alexander Steffen  2022-06-08  237  	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
bbc23a07b0728c Alexander Steffen  2022-06-08  238  	struct i2c_msg msg = { .addr = phy->i2c_client->addr };
bbc23a07b0728c Alexander Steffen  2022-06-08  239  	u8 reg = tpm_tis_i2c_address_to_register(addr);
bbc23a07b0728c Alexander Steffen  2022-06-08  240  	int ret;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  241  	u16 wrote = 0;
bbc23a07b0728c Alexander Steffen  2022-06-08  242  
4d6830bf773cec Arun Menon         2026-10-29 @243  	if (len > TPM_I2C_BUFSIZE - 1)
bbc23a07b0728c Alexander Steffen  2022-06-08  244  		return -EIO;
bbc23a07b0728c Alexander Steffen  2022-06-08  245  
bbc23a07b0728c Alexander Steffen  2022-06-08  246  	phy->io_buf[0] = reg;
bbc23a07b0728c Alexander Steffen  2022-06-08  247  	msg.buf = phy->io_buf;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  248  	while (wrote < len) {
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  249  		/* write register and data in one go */
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  250  		msg.len = sizeof(reg) + len - wrote;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  251  		if (msg.len > I2C_SMBUS_BLOCK_MAX)
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  252  			msg.len = I2C_SMBUS_BLOCK_MAX;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  253  
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  254  		memcpy(phy->io_buf + sizeof(reg), value + wrote,
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  255  		       msg.len - sizeof(reg));
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  256  
bbc23a07b0728c Alexander Steffen  2022-06-08  257  		ret = tpm_tis_i2c_retry_transfer_until_ack(data, &msg);
bbc23a07b0728c Alexander Steffen  2022-06-08  258  		if (ret < 0)
bbc23a07b0728c Alexander Steffen  2022-06-08  259  			return ret;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  260  		wrote += msg.len - sizeof(reg);
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  261  	}
bbc23a07b0728c Alexander Steffen  2022-06-08  262  
bbc23a07b0728c Alexander Steffen  2022-06-08  263  	return 0;
bbc23a07b0728c Alexander Steffen  2022-06-08  264  }
bbc23a07b0728c Alexander Steffen  2022-06-08  265  

:::::: The code at line 243 was first introduced by commit
:::::: 4d6830bf773cec0a8d18d54fc5d1f58eb3846d6f tpm: tis_i2c: Use local 4KB buffer to limit memory usage

:::::: TO: Arun Menon <armenon@redhat.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
