Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793399832;
	b=RuBFRq+1ja0Qa+Em6cxuc7oj4KihSmYw+ozQxVgsNWKICtq7ZPXQAmG4wHdxS2nD9pc7
	 CCdxpXtMqN/CcxLrPSi5wIlj82Y7dyvYHVORv48Qp566+4bJcrhzBSO8j9kiQ+030ucE3
	 10y6ROgpNb/gIpCZLsg47KZLg92MN9JvP78qNlujgwOl27vddKzo5V0kXb+iAMtLNqW4C
	 60fzYArDQ0jloXNy04oXfGSmin+fUGpJR+cYWYE5ub8U473ZOJLV4gA7X5e8/mpQNaiFK
	 ZD726wwsQaRTwjMRhLdWrFhFxRusrwYFAl07vBXp+7ywVTNNnZlwOHFVvH82t8WPFjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793399832;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=q80dvqurYHeCn0ZzoP6c3sLeFNi1NBW6fjLDKoTsiGo=;
	b=x0+FhRRkNp69Jzkr0Gjggcx82gaeEfAY+SHRAPz32eBwsxsHpl3XN1GV+d1SpEmw3qe0
	 Q1qICErVie9mafXlr393aW5Y+OgHmZjgbHbJdqFfxL0BY/juUvoguR53Gq6bZ52DPEJUQ
	 PZjsCwgAkdqRJsT1JvHeFraYGurbmaTeFwtstize9jj2kw3rEFbJm4/jEFmMMRhsf21Cf
	 ZMdWME98D5vojH3hVK4fZp882Z61FipE16n9Q4JCDXFgFkJDoDC3Uyq2G/SaQG9a++oby
	 DKCfXfdNGEDnH85BPYKaM8amVk3mbCPICuGFeEVbfpj8VHcUziyE9UYWQfQooeIol1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dPuWeL5g;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9BA60A2609
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 22:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F9BA60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dPuWeL5g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793399831; x=1824935831;
  h=date:from:to:cc:subject:message-id;
  bh=i38UciTV/kaujdLgdeH2nRn11wPtsfxakO1ym2EMtSc=;
  b=dPuWeL5gaNNOCuvGqMwro2DEhwvvLqd9w6pVnofEFx0SruNjEfVoa+Ax
   pvEHq3+Su8tzUUQX7bx2N+E665G4Oa10g7gAuSm1GCyvKOuvYd57e4mCD
   7ZrI78dtK9Rha6bto4AS1QW0C9Fl7BIGFu7BRflg9J3cKsb0XC/i2Cf3X
   QtwVZZB10lMALPbWVD7OOWhYrvQs+3xNhoYcnx+/yR0cbM4rnm2YTDxNr
   9cOLYRYSA2h0dRlj3bsuw89wbNTRi/KQYffM71QZARQ3PBswePEjzUgv9
   COVWuUlGB6aAEgf7EEjPqLwW7BGaJPzw1wdudM3Nj+Ji0IAhj0+A4N1gg
   w==;
X-CSE-ConnectionGUID: 7IDDi77BS/eLNlC2mrZ0Pw==
X-CSE-MsgGUID: erSeKJO2Ss6Z6jC+0fkB+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2050401"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2050401"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 15:37:10 -0700
X-CSE-ConnectionGUID: RQz1bAPuRHWCnaxFusqAkQ==
X-CSE-MsgGUID: MlMY+6ExQK66wkU3t3QeIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5887394"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Oct 2026 15:37:10 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMvDf-00000000cIu-0V2m;
	Fri, 30 Oct 2026 22:37:07 +0000
Date: Sat, 31 Oct 2026 06:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:master 12/12]
 drivers/char/tpm/tpm_tis_i2c.c:243:12: error: 'TPM_I2C_BUFSIZE' undeclared;
 did you mean 'TPM_BUFSIZE'?
Message-ID: <202610310538.MBJWSwIt-lkp@intel.com>
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
config: arc-randconfig-1000-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310538.MBJWSwIt-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310538.MBJWSwIt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310538.MBJWSwIt-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm_tis_i2c.c: In function 'tpm_tis_i2c_write_bytes':
>> drivers/char/tpm/tpm_tis_i2c.c:243:12: error: 'TPM_I2C_BUFSIZE' undeclared (first use in this function); did you mean 'TPM_BUFSIZE'?
     243 |  if (len > TPM_I2C_BUFSIZE - 1)
         |            ^~~~~~~~~~~~~~~
         |            TPM_BUFSIZE
   drivers/char/tpm/tpm_tis_i2c.c:243:12: note: each undeclared identifier is reported only once for each function it appears in
   drivers/char/tpm/tpm_tis_i2c.c: In function 'tpm_tis_i2c_probe':
   drivers/char/tpm/tpm_tis_i2c.c:352:40: error: 'TPM_I2C_BUFSIZE' undeclared (first use in this function); did you mean 'TPM_BUFSIZE'?
     352 |  phy->io_buf = devm_kzalloc(&dev->dev, TPM_I2C_BUFSIZE, GFP_KERNEL);
         |                                        ^~~~~~~~~~~~~~~
         |                                        TPM_BUFSIZE


vim +243 drivers/char/tpm/tpm_tis_i2c.c

bbc23a07b0728c8 Alexander Steffen  2022-06-08  232  
bbc23a07b0728c8 Alexander Steffen  2022-06-08  233  static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
bbc23a07b0728c8 Alexander Steffen  2022-06-08  234  				   const u8 *value,
bbc23a07b0728c8 Alexander Steffen  2022-06-08  235  				   enum tpm_tis_io_mode io_mode)
bbc23a07b0728c8 Alexander Steffen  2022-06-08  236  {
bbc23a07b0728c8 Alexander Steffen  2022-06-08  237  	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
bbc23a07b0728c8 Alexander Steffen  2022-06-08  238  	struct i2c_msg msg = { .addr = phy->i2c_client->addr };
bbc23a07b0728c8 Alexander Steffen  2022-06-08  239  	u8 reg = tpm_tis_i2c_address_to_register(addr);
bbc23a07b0728c8 Alexander Steffen  2022-06-08  240  	int ret;
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  241  	u16 wrote = 0;
bbc23a07b0728c8 Alexander Steffen  2022-06-08  242  
4d6830bf773cec0 Arun Menon         2026-10-29 @243  	if (len > TPM_I2C_BUFSIZE - 1)
bbc23a07b0728c8 Alexander Steffen  2022-06-08  244  		return -EIO;
bbc23a07b0728c8 Alexander Steffen  2022-06-08  245  
bbc23a07b0728c8 Alexander Steffen  2022-06-08  246  	phy->io_buf[0] = reg;
bbc23a07b0728c8 Alexander Steffen  2022-06-08  247  	msg.buf = phy->io_buf;
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  248  	while (wrote < len) {
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  249  		/* write register and data in one go */
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  250  		msg.len = sizeof(reg) + len - wrote;
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  251  		if (msg.len > I2C_SMBUS_BLOCK_MAX)
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  252  			msg.len = I2C_SMBUS_BLOCK_MAX;
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  253  
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  254  		memcpy(phy->io_buf + sizeof(reg), value + wrote,
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  255  		       msg.len - sizeof(reg));
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  256  
bbc23a07b0728c8 Alexander Steffen  2022-06-08  257  		ret = tpm_tis_i2c_retry_transfer_until_ack(data, &msg);
bbc23a07b0728c8 Alexander Steffen  2022-06-08  258  		if (ret < 0)
bbc23a07b0728c8 Alexander Steffen  2022-06-08  259  			return ret;
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  260  		wrote += msg.len - sizeof(reg);
83e7e5d89f04d1c Alexander Sverdlin 2023-05-24  261  	}
bbc23a07b0728c8 Alexander Steffen  2022-06-08  262  
bbc23a07b0728c8 Alexander Steffen  2022-06-08  263  	return 0;
bbc23a07b0728c8 Alexander Steffen  2022-06-08  264  }
bbc23a07b0728c8 Alexander Steffen  2022-06-08  265  

:::::: The code at line 243 was first introduced by commit
:::::: 4d6830bf773cec0a8d18d54fc5d1f58eb3846d6f tpm: tis_i2c: Use local 4KB buffer to limit memory usage

:::::: TO: Arun Menon <armenon@redhat.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
