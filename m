Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC817382F16
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 14:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776178191; cv=none; b=soNLvIu1qxRidBDAZFf72o7FLQkjBkirV0c1EVeVe4qP6SLLPZ48K6ZNnvFXh9t8BVpHlEyTuBGsYknX4iANQFWEzJDIG6TCEL+WjVdCpnY13hg7mCWoDYpPy+OXZpOeNrSYJkQU1ERGVjQM8bIuPb784qZuKEjKK6l2ik7s+LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776178191; c=relaxed/simple;
	bh=b+PN/i9Njn0yFy+2fQq8CNBNjkPrZqp5eubb2ut3I4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OF6Gvx5as2uS+VrD0+OKx9gNfuCxM9239jNWG8viz5UyrEUwcSGaxIgKoMU4B4dJc0w7/9z04veJQPBhFt9UAVqHOU9H9gPgBJvS6673ZeksDt0INMooX72uI082ZqZXOLnCuGJxMV9lkFKKLQ9XsKKOFt+RxmqgU+Oy3BOYmlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOXke85P; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOXke85P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776178188; x=1807714188;
  h=date:from:to:cc:subject:message-id;
  bh=b+PN/i9Njn0yFy+2fQq8CNBNjkPrZqp5eubb2ut3I4g=;
  b=WOXke85PKm8kpIQeBn0tHX8dyQmOUmrGVvO9Bfj+Sb3Byx2f53Fv3ZcJ
   sCiE+R9QpC0HIrgqvHA8naMhVIFftYzFvLuXF79gsqic4QE85lakg7yu/
   7coT1D7q1ho1VYEsQMGV7FLFzU0JYOAibE8ysHKjmSHhF4X0nX4CZgN3A
   wzKm9cdnTEWjg6PfuPqwhX+DZTDUSFtrLGe6SkH9tKtJlYQ0oVxnNMPcI
   oMcMscmHgcL/dxOtwp/gex8hbkGKVPv56Qg4edNrdpX8/rg5m2bupY5i3
   zgnJplMjq8ANTZraLW0vc0stGbfKIYatdzXKBRaBjmzFUowsgR9xvFWf1
   Q==;
X-CSE-ConnectionGUID: DMJ3XNbGQ7+WLDH+D/zRwA==
X-CSE-MsgGUID: aGNJd9EDR+WCjue+0aoPkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11759"; a="77246287"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="77246287"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 07:49:47 -0700
X-CSE-ConnectionGUID: kuU03hojQiSA4ysNof27+A==
X-CSE-MsgGUID: okifIdlYRleD2ac/DMnUrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253333398"
Received: from lkp-server01.sh.intel.com (HELO 7b0b59b3a0d4) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Apr 2026 07:49:45 -0700
Received: from kbuild by 7b0b59b3a0d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCf5C-000000001Xd-3rTS;
	Tue, 14 Apr 2026 14:49:42 +0000
Date: Tue, 14 Apr 2026 22:49:02 +0800
From: kernel test robot <lkp@intel.com>
To: Nishanth Sampath Kumar <nissampa@cisco.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:regmap-7.1 12/12]
 drivers/base/regmap/regmap-i2c.c:340:42: sparse: sparse: incorrect type in
 argument 3 (different base types)
Message-ID: <202604142246.UpE1jTE2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regmap-7.1
head:   bad4bd28abf4d7cb2adcb39cc0de789729d2cd69
commit: bad4bd28abf4d7cb2adcb39cc0de789729d2cd69 [12/12] regmap-i2c: add SMBus byte/word reg16 bus for adapters lacking I2C_FUNC_I2C
config: arc-randconfig-r132-20260414 (https://download.01.org/0day-ci/archive/20260414/202604142246.UpE1jTE2-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604142246.UpE1jTE2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604142246.UpE1jTE2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/base/regmap/regmap-i2c.c:340:42: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned short [usertype] value @@     got restricted __le16 [usertype] @@
   drivers/base/regmap/regmap-i2c.c:340:42: sparse:     expected unsigned short [usertype] value
   drivers/base/regmap/regmap-i2c.c:340:42: sparse:     got restricted __le16 [usertype]

vim +340 drivers/base/regmap/regmap-i2c.c

   305	
   306	/*
   307	 * SMBus byte/word reg16 support for adapters that have SMBUS_BYTE_DATA
   308	 * and SMBUS_WORD_DATA but lack I2C_FUNC_I2C and I2C_FUNC_SMBUS_I2C_BLOCK,
   309	 * such as the AMD PIIX4.
   310	 *
   311	 * READ:  set 16-bit EEPROM address via write_byte_data(addr_lo, addr_hi),
   312	 *        then sequentially read bytes via read_byte() (EEPROM auto-
   313	 *        increments the address pointer).  Same as the I2C-block reg16
   314	 *        read path above.
   315	 *
   316	 * WRITE: encode the low address byte and data into a word transaction:
   317	 *        write_word_data(addr_hi, (data_byte << 8) | addr_lo).
   318	 *        Only single-byte writes are supported (one value per transaction).
   319	 */
   320	static int regmap_smbus_word_write_reg16(void *context, const void *data,
   321						 size_t count)
   322	{
   323		struct device *dev = context;
   324		struct i2c_client *i2c = to_i2c_client(dev);
   325		u8 addr_hi, addr_lo, val;
   326	
   327		/*
   328		 * data layout: [addr_hi, addr_lo, val0, val1, ...].
   329		 * Only single-byte value writes are supported; multi-byte would
   330		 * require raw I2C (or repeated word writes with incrementing address).
   331		 */
   332		if (count != 3)
   333			return -EINVAL;
   334	
   335		addr_hi = ((u8 *)data)[0];
   336		addr_lo = ((u8 *)data)[1];
   337		val = ((u8 *)data)[2];
   338	
   339		return i2c_smbus_write_word_data(i2c, addr_hi,
 > 340						 cpu_to_le16(((u16)val << 8) | addr_lo));
   341	}
   342	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
