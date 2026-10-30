Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333002;
	b=HLphf8dNlfqu4H7ENjrIV6igH6WOln5X5TmXLIfy5egw7EtLz16qR/U4elxQRShBaoli
	 nwKZ8IFMYEdQ0D/hCqt/pHVbPggZ0GBTKYSmbqS3VLrFlAJTgDGLVueAZ35EOOSUJzYhl
	 yBosKE3Hil0YXSOIRAulIM4wLNplVWYZfMr+IxL5UAioPSywrv7Zlqmfts+wbzNTXBzAv
	 kCqTv5mbuZ+RHvyJb1f6Zzlt3SPkOtLEVI9ntQcoCFnUszbCUkTHp8s/uFxJUNCOAD6Sz
	 uIFs2TCHrhozhddfkZ7DqXscQOqcO1DmbUAva25lY03Yq6b/gRv9dbTrD7AYeVPm5Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333002;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=JnzUX3bNbsRfmPYLi0kQELBenJGjRyWmVNmRX3jcceA=;
	b=30FOD3wZmNtpG244e2OrCOxYPERptpcgBTGYx4YG1trIWCE6NmB5+3SGIXlrh4Rjq/bz
	 59YjLp5n/SXCTjGQj3hub3FsM4TVowGYIAfQmQ8ay2qguSn2SnytCz8frFENRZZq/SvzP
	 4WDHcNdWtubkbrUedQLho0xn4ybDJftF03FAtk7HBCRfH5yiB4o66Le6lfU3AvoYyOBMv
	 CmQ6KJLqX2/NupWuihweLpZitEDPSMLOnE58wYVoMgezIYxOBKmSI/HchtdEciz44X2dB
	 yF7GaOip9yq4H995943tOsdeWY6KlWarfNWLKOKxCKktGeevfUzNaJuugI5qAnlBVww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UsDzt5f9;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E34606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 04:03:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0E34606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UsDzt5f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793333001; x=1824869001;
  h=date:from:to:cc:subject:message-id;
  bh=5NgnNPc757X2Vtr1WgWvSp8pZRJJrrMYex3+co3WOok=;
  b=UsDzt5f9wuj1Mp+CBxUOiWBkdYCcTZg9A4NsyLb6lw/Itdi/NFrssH8O
   65Bv8k31neEzhGYwqv+yFy+RuiEZQnhhAKL9KnyooJ2qIygJe+KV7OibW
   7PbJy242ZgmFGPVRi2bNeBdq5GRa2AfMfLwPuRLeLCCgRj2EizGZdkn/1
   pHRgVZPI+OWWaW1vYpbJpML1IIoEX+WMDVIwU0UYs2gAEUDoFk5qoz0az
   oRXAHvJ4a4blXaV+8ALXccBDn9xzVdf+iCD6HbQK1c7ALINgjDK9CcYvD
   K8ZZaOlaGRbdTTfmWIx/Nlp07j9NVVPWXjawTvM01Zwivy9XM9W1yFYpj
   w==;
X-CSE-ConnectionGUID: Sj4Wo6lNTPCGCDj9yzdXJw==
X-CSE-MsgGUID: TQkXC1FmT8CbaX7wm/3r4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1968532"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="1968532"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 21:03:20 -0700
X-CSE-ConnectionGUID: LCVWZ3XkTiyS4l5l8Krigg==
X-CSE-MsgGUID: 2vSgIo06SL2l48Zdjem2ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; 
   d="scan'208";a="5222239"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 29 Oct 2026 21:03:18 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMdpj-000000005Tv-2fAF;
	Fri, 30 Oct 2026 04:03:15 +0000
Date: Fri, 30 Oct 2026 05:02:35 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 12/12]
 drivers/char/tpm/tpm_tis_i2c.c:243:12: error: use of undeclared identifier
 'TPM_I2C_BUFSIZE'
Message-ID: <202610300451.H7bYZx2r-lkp@intel.com>
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
config: arm64-randconfig-r2202-20261030 (https://download.01.org/0day-ci/archive/20261030/202610300451.H7bYZx2r-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610300451.H7bYZx2r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610300451.H7bYZx2r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/tpm/tpm_tis_i2c.c:243:12: error: use of undeclared identifier 'TPM_I2C_BUFSIZE'
     243 |         if (len > TPM_I2C_BUFSIZE - 1)
         |                   ^
   drivers/char/tpm/tpm_tis_i2c.c:352:40: error: use of undeclared identifier 'TPM_I2C_BUFSIZE'
     352 |         phy->io_buf = devm_kzalloc(&dev->dev, TPM_I2C_BUFSIZE, GFP_KERNEL);
         |                                               ^
   2 errors generated.


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
