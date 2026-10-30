Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334266;
	b=pFrETOXBt2GX3dGuaQs6Gjk5A5wcVrtHk25BdRS3/dXPas86UCvhShGl+UfqQx/Ua5J2
	 Ieei5zt52w+/5dBoiLZmwcl2C+AlH7Xb+MdQzyAd3RM2s2tM4ZL8hA4eP1W2bWY63A0Mj
	 gOmVvnSTZyBaEiChpODKpx66mM2wg3LBmhZ0Ha9A1N8qksHzcApYftxOmE42/4IKfarVw
	 z6uhzKW2v/yZmOC7Ef3K0MvOV1cG8XhmhG8eZTAkbflDfO4UDvOkhrgvBuYRBmF69MFn2
	 JBdAfoDFZjyuwyPc1Oi395ks1AYDo2UB5oQVJMYtbjTuyQor5ykgw31n4FgBhYtqmSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334266;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=eSJE1FPG1oFtk0Wmf+AUSk7LYFhLJSaR5AfJZ6wYqI0=;
	b=BUGeAsyvNnroPQXX4cY3BD3/JuQIEqS53l0AQCj9Y/JniHXHsVT4LZckFwShAJtL0NdK
	 0vzipfJVktPMtll62Dwu50zBmwX6d3kp385aZHiuAQxdCr3mvfQQ9+RAbFzAzCZyVNQI/
	 0FwH5EOTW5SOvk6ie0q4emqpkBQtaBN1kW4vII8C2aXYuXqYaevif1/yvWpY3MhWdwk1m
	 CQOXMBdubWOYYpkBDq8q4UxNKLdqDzrx8FiHd/B/2UFOav0q3RFcFxMjIUugv2B8aY3SZ
	 Snn99uq4+sEJQ5mj/tUNr30NiNjkBLUhDzUa2p+CfdkkAzvgDTJKmduGxJwjBXBqCew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZUASLvI1;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FD8606A32F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 04:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78FD8606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZUASLvI1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793334262; x=1824870262;
  h=date:from:to:cc:subject:message-id;
  bh=nBzBDEq+xluAZh6HGohagO69W4m2qYOizqSZM0u16Yc=;
  b=ZUASLvI1HrMhdtVbBX5I0GtjTaZSoOceGCNwtVf/xpq+VS2DIAa4eike
   YKcBbcUjT+N8WwDb3JcNJtdr7ZIwxn+Ld18DZ9rqBeBel686srdMlDbD9
   ZMcBPn6+g7LVJv1wktuDiYpT/DqSzrl3mpNxMF46Z3fvkA0mROAKGT8av
   ZEMtrQicCWG9TyZoWrp1W/FAfkr1VnG7M7Yp+SSm919/lDVLAf17zuuGA
   N92eyBe8dhJpRoFV7GvWgpNCywXSpdjprMBZWcnOFaa9i2wnVscfNqpFN
   +D0vOjV5FO5U4oz78XnT3BBa6DSyEq6Y1wk4wVuOJHOwoS4QUBmThPdO0
   A==;
X-CSE-ConnectionGUID: vmfQQsuUSx68BeNj14cd+Q==
X-CSE-MsgGUID: tcwAcp3lQHGw3S1KllfzWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1977959"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1977959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 21:24:21 -0700
X-CSE-ConnectionGUID: dGti3nDPRZCWYvtQ+Kd/9Q==
X-CSE-MsgGUID: Hk50G2tKRZisnFz0rZr23A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5294983"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 29 Oct 2026 21:24:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMeA5-000000005UF-3tC4;
	Fri, 30 Oct 2026 04:24:17 +0000
Date: Fri, 30 Oct 2026 05:23:25 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 12/12]
 drivers/char/tpm/tpm_tis_i2c.c:243:12: error: 'TPM_I2C_BUFSIZE' undeclared;
 did you mean 'TPM_BUFSIZE'?
Message-ID: <202610300513.xUpyH8Gn-lkp@intel.com>
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
config: arc-randconfig-2000-20261030 (https://download.01.org/0day-ci/archive/20261030/202610300513.xUpyH8Gn-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300513.xUpyH8Gn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300513.xUpyH8Gn-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm_tis_i2c.c: In function 'tpm_tis_i2c_write_bytes':
>> drivers/char/tpm/tpm_tis_i2c.c:243:12: error: 'TPM_I2C_BUFSIZE' undeclared (first use in this function); did you mean 'TPM_BUFSIZE'?
     if (len > TPM_I2C_BUFSIZE - 1)
               ^~~~~~~~~~~~~~~
               TPM_BUFSIZE
   drivers/char/tpm/tpm_tis_i2c.c:243:12: note: each undeclared identifier is reported only once for each function it appears in
   drivers/char/tpm/tpm_tis_i2c.c: In function 'tpm_tis_i2c_probe':
   drivers/char/tpm/tpm_tis_i2c.c:352:40: error: 'TPM_I2C_BUFSIZE' undeclared (first use in this function); did you mean 'TPM_BUFSIZE'?
     phy->io_buf = devm_kzalloc(&dev->dev, TPM_I2C_BUFSIZE, GFP_KERNEL);
                                           ^~~~~~~~~~~~~~~
                                           TPM_BUFSIZE


vim +243 drivers/char/tpm/tpm_tis_i2c.c

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
