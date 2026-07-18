Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F44339708
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411503; cv=none; b=lUb3yDQEZKDIr1Im3S0yfHKAR24N3shlEg2+Na6xnl2H03OMF9jO7KLcbkIULCDiIb+mUaWhFR12uSr0NGYnsZ0xUe2+LwfXha/3BWSaboWBvOzkgsIYvXz34z4ksyhw5/DQo7ipAAjGEM9y8LKAp2f3ViRBO0kfGyhjyYQLzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411503; c=relaxed/simple;
	bh=hmwqpAybHdTbA/NemUJ97Nzdr7dWLF02FFqsOb+A+to=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m1Wo/1g4Pmx+39Ek2Bn8LmCTqGl2ux0r3FEimNE2vykcce0XuN3wLIOX5pwFZYebaLS4a9w7SgQBtILkyjLmFoXKSocXsctfK6bj0Iqe4QU9OmnjxktHs7DewTytyUfQ3t1Kt0AuqWkH6Vz1/qdsWZgNvBh7oo4Lh93urXQIwpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cKBhW+Iw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cKBhW+Iw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784411499; x=1815947499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hmwqpAybHdTbA/NemUJ97Nzdr7dWLF02FFqsOb+A+to=;
  b=cKBhW+Iwa2dbevtPknThiM5JvZU0LwXmX4/ms16iQgkSB6yD73T9Hp7I
   /q74MO4znR6JzmKKxMj+9QVZI7J2ml6s0880/tdMBqBA/CcgKXSKPLob4
   hXRx93qykVDk5tHj+Ob7nhJ/c1rOeUFdSBFx/VIIuqHAj/g1LRZQmKaZf
   3dBpJHO4oYPkV6729HlA3Z03/xEZ76Yxs0oqEZOnt8Cdp0W4dgULfw2M0
   AwQSSxSL+V1s6l17mYxyZyyPOMGHlL0u40kHNEl92kqBFM4Xy/Ou1CEim
   BokZuoaZclSx+evyABsg8tXbs6oR8R1VtGeQFIN0BYoRhAJTDv5FsLTk/
   Q==;
X-CSE-ConnectionGUID: zowmDrvNTkCVS/nttEvWIg==
X-CSE-MsgGUID: HPf0XRvxQ6Gx6AYpXI7d7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="88714518"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="88714518"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 14:51:39 -0700
X-CSE-ConnectionGUID: mUVWNvsKSt2xqgf7VoU/FQ==
X-CSE-MsgGUID: 62kDTiKiSg2yECtqpZytaQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jul 2026 14:51:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlCwX-00000000V8r-2egK;
	Sat, 18 Jul 2026 21:51:33 +0000
Date: Sun, 19 Jul 2026 05:51:04 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 Johannes Berg <johannes@sipsolutions.net>,
 David Gow <davidgow@google.com>
Subject: drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse:
 incorrect type in argument 1 (different base types)
Message-ID: <202607190503.J3EjpoyD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   94515f3a7d4256a5062176b7d6ed0471938cd51a
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML without triggering WARN()
date:   10 months ago
config: um-randconfig-r133-20260718 (https://download.01.org/0day-ci/archive/20260719/202607190503.J3EjpoyD-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190503.J3EjpoyD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190503.J3EjpoyD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __be64 [addressable] [usertype] buf @@
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse:     expected unsigned long long [usertype] val
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse:     got restricted __be64 [addressable] [usertype] buf
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:731:23: sparse: sparse: cast from restricted __be64
   drivers/i2c/busses/i2c-octeon-core.c:732:42: sparse: sparse: cast from restricted __be64

vim +731 drivers/i2c/busses/i2c-octeon-core.c

63ef02da5ddb72 Aryan Srivastava 2025-03-25  688  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  689  /**
63ef02da5ddb72 Aryan Srivastava 2025-03-25  690   * octeon_i2c_hlc_block_comp_write - high-level-controller composite block write
63ef02da5ddb72 Aryan Srivastava 2025-03-25  691   * @i2c: The struct octeon_i2c
63ef02da5ddb72 Aryan Srivastava 2025-03-25  692   * @msgs: msg[0] contains address, msg[1] contains data to be written
63ef02da5ddb72 Aryan Srivastava 2025-03-25  693   *
63ef02da5ddb72 Aryan Srivastava 2025-03-25  694   * i2c core command is constructed and write data is written into the FIFO buffer.
63ef02da5ddb72 Aryan Srivastava 2025-03-25  695   * The execution of the command will result in HW write, using the data in FIFO.
63ef02da5ddb72 Aryan Srivastava 2025-03-25  696   * Used in the case where the i2c xfer is for greater than 8 bytes of write data.
63ef02da5ddb72 Aryan Srivastava 2025-03-25  697   *
63ef02da5ddb72 Aryan Srivastava 2025-03-25  698   * Returns: 0 on success, otherwise a negative errno.
63ef02da5ddb72 Aryan Srivastava 2025-03-25  699   */
63ef02da5ddb72 Aryan Srivastava 2025-03-25  700  static int octeon_i2c_hlc_block_comp_write(struct octeon_i2c *i2c, struct i2c_msg *msgs)
63ef02da5ddb72 Aryan Srivastava 2025-03-25  701  {
63ef02da5ddb72 Aryan Srivastava 2025-03-25  702  	bool set_ext;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  703  	int ret;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  704  	u16 len, i;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  705  	u64 cmd, ext = 0;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  706  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  707  	octeon_i2c_hlc_enable(i2c);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  708  	octeon_i2c_block_enable(i2c);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  709  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  710  	/* Write (size - 1) into block control register */
63ef02da5ddb72 Aryan Srivastava 2025-03-25  711  	len = msgs[1].len - 1;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  712  	octeon_i2c_writeq_flush((u64)len, i2c->twsi_base + OCTEON_REG_BLOCK_CTL(i2c));
63ef02da5ddb72 Aryan Srivastava 2025-03-25  713  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  714  	/* Prepare core command */
63ef02da5ddb72 Aryan Srivastava 2025-03-25  715  	cmd = SW_TWSI_V | SW_TWSI_SOVR | SW_TWSI_OP_7_IA;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  716  	cmd |= (u64)(msgs[0].addr & 0x7full) << SW_TWSI_ADDR_SHIFT;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  717  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  718  	/* Set parameters for extended message (if required) */
63ef02da5ddb72 Aryan Srivastava 2025-03-25  719  	set_ext = octeon_i2c_hlc_ext(i2c, msgs[0], &cmd, &ext);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  720  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  721  	/* Write msg into FIFO buffer */
63ef02da5ddb72 Aryan Srivastava 2025-03-25  722  	octeon_i2c_writeq_flush(TWSX_BLOCK_STS_RESET_PTR,
63ef02da5ddb72 Aryan Srivastava 2025-03-25  723  				i2c->twsi_base + OCTEON_REG_BLOCK_STS(i2c));
63ef02da5ddb72 Aryan Srivastava 2025-03-25  724  	for (i = 0; i <= len; i += 8) {
63ef02da5ddb72 Aryan Srivastava 2025-03-25  725  		__be64 buf = 0;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  726  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  727  		/* Copy 8 bytes or remaining bytes from message buffer */
63ef02da5ddb72 Aryan Srivastava 2025-03-25  728  		memcpy(&buf, &msgs[1].buf[i], min(8, msgs[1].len - i));
63ef02da5ddb72 Aryan Srivastava 2025-03-25  729  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  730  		/* Byte-swap message data and write into FIFO */
63ef02da5ddb72 Aryan Srivastava 2025-03-25 @731  		buf = cpu_to_be64(buf);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  732  		octeon_i2c_writeq_flush((u64)buf, i2c->twsi_base + OCTEON_REG_BLOCK_FIFO(i2c));
63ef02da5ddb72 Aryan Srivastava 2025-03-25  733  	}
63ef02da5ddb72 Aryan Srivastava 2025-03-25  734  	if (set_ext)
63ef02da5ddb72 Aryan Srivastava 2025-03-25  735  		octeon_i2c_writeq_flush(ext, i2c->twsi_base + OCTEON_REG_SW_TWSI_EXT(i2c));
63ef02da5ddb72 Aryan Srivastava 2025-03-25  736  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  737  	/* Send command to core (send data in FIFO) */
63ef02da5ddb72 Aryan Srivastava 2025-03-25  738  	ret = octeon_i2c_hlc_cmd_send(i2c, cmd);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  739  	if (ret)
63ef02da5ddb72 Aryan Srivastava 2025-03-25  740  		goto err;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  741  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  742  	cmd = __raw_readq(i2c->twsi_base + OCTEON_REG_SW_TWSI(i2c));
63ef02da5ddb72 Aryan Srivastava 2025-03-25  743  	if ((cmd & SW_TWSI_R) == 0) {
63ef02da5ddb72 Aryan Srivastava 2025-03-25  744  		octeon_i2c_block_disable(i2c);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  745  		return octeon_i2c_check_status(i2c, false);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  746  	}
63ef02da5ddb72 Aryan Srivastava 2025-03-25  747  
63ef02da5ddb72 Aryan Srivastava 2025-03-25  748  err:
63ef02da5ddb72 Aryan Srivastava 2025-03-25  749  	octeon_i2c_block_disable(i2c);
63ef02da5ddb72 Aryan Srivastava 2025-03-25  750  	return ret;
63ef02da5ddb72 Aryan Srivastava 2025-03-25  751  }
63ef02da5ddb72 Aryan Srivastava 2025-03-25  752  

:::::: The code at line 731 was first introduced by commit
:::::: 63ef02da5ddb725555cd41f125ec0bd8e893da3a i2c: octeon: add block-mode i2c operations

:::::: TO: Aryan Srivastava <aryan.srivastava@alliedtelesis.co.nz>
:::::: CC: Andi Shyti <andi@smida.it>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
