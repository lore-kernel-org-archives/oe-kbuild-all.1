Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BDE15A86D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 00:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769388850; cv=none; b=NJsVOI+FwEojUdTSMTS5cZHJ6l5iSJNAzEisxdhDvb+VnFexL9ZDB1kjIvysJA5EhHDULgk4IX1w94PVugDMRsxlX+r5dHSFUShlwTSFVoYwhhzsDjXApiais5l7vtYsfwFJP8s2mHNW4A3y9mRt9q1llin1LS4Xdl5C1dE39/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769388850; c=relaxed/simple;
	bh=iubTsXJI3SyN8oX1umPMNXyn1THege2kKaSAEk2NUPU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=drstp/8sDYkZ5rR0+AcG8PJjJF4d2UsPzNSW217OJhVZjfkMtRoOb3O7moeeGHJ2JqcWMN6PepjZX4IP2k+pKSinzzZkJIRlREVYt3VXSIx7LmoWfx5EUZckzOXjru933+wii9Wed6LZbHquRA0jL7+lALsPnlUXLC9JSB6u20A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=npfF5MHm; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="npfF5MHm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769388848; x=1800924848;
  h=date:from:to:cc:subject:message-id;
  bh=iubTsXJI3SyN8oX1umPMNXyn1THege2kKaSAEk2NUPU=;
  b=npfF5MHm//UdR3l2QIkBw620nSmup7O1rR1Qcd9fE3CI8xupLIDrlkRT
   AyfmsUa2gUS0pq+eB38jbKr9HrT6C/rzSp4qhTugbkV0Iej55CrDigdXF
   pCN1n4xTgLiefsB77+S/Z0TiuxxaiyOSZ8r8Xh+brTlLjTbkhm5VdCNl8
   qynokrDmnfUFjq9Bx2wDixDk4hHieMFZnqdsEcvN1on3YOSa+UzNxbtye
   xmz3FezNHs36dhA6as1Hxz7RNyRZ2vDDwTBksgEa4yWWkxL5yq4UNVZsH
   J4L3oOeGMTS0EFayVZ4ee0JEf7UqfVyx+5KpEzzUteBYvaK7+hwkNN03a
   w==;
X-CSE-ConnectionGUID: EkXErWUYQwywuGxp5UzI0w==
X-CSE-MsgGUID: fPbBzFN6Rdqq30Hc36+gxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="58143778"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="58143778"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 16:54:08 -0800
X-CSE-ConnectionGUID: qGWIJyyXTIuQ5HVznjS4Ag==
X-CSE-MsgGUID: phR6O1OqRoy0z/k5bP4ZaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="230511961"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Jan 2026 16:54:06 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkArk-00000000Wm0-1App;
	Mon, 26 Jan 2026 00:54:04 +0000
Date: Mon, 26 Jan 2026 08:53:36 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 12/15]
 drivers/char/tpm/tpm2-sessions.c:261:27: warning: unused variable 'auth'
Message-ID: <202601260825.EMdrikNe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fbd9af022416579062d59e206c7f71890d27fc31
commit: 67a0e52127ec9057ddcb47bca6cd267f2a3d20a7 [12/15] tpm2-sessions: Remove the support for more than one authorization
config: sparc-randconfig-002-20260126 (https://download.01.org/0day-ci/archive/20260126/202601260825.EMdrikNe-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260825.EMdrikNe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260825.EMdrikNe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm2-sessions.c: In function 'tpm_buf_append_name':
>> drivers/char/tpm/tpm2-sessions.c:261:27: warning: unused variable 'auth' [-Wunused-variable]
     261 |         struct tpm2_auth *auth;
         |                           ^~~~


vim +/auth +261 drivers/char/tpm/tpm2-sessions.c

a61809a3323982 Jarkko Sakkinen 2024-07-03  231  
a61809a3323982 Jarkko Sakkinen 2024-07-03  232  /**
7895041508233a Jarkko Sakkinen 2025-12-03  233   * tpm_buf_append_name() - Append a handle and store TPM name
7895041508233a Jarkko Sakkinen 2025-12-03  234   * @chip:		TPM chip to use.
7895041508233a Jarkko Sakkinen 2025-12-03  235   * @buf:		TPM buffer containing the TPM command in-transit.
7895041508233a Jarkko Sakkinen 2025-12-03  236   * @handle:		TPM handle to be appended.
7895041508233a Jarkko Sakkinen 2025-12-03  237   * @name:		TPM name of the handle
7895041508233a Jarkko Sakkinen 2025-12-03  238   * @name_size:		Size of the TPM name.
a61809a3323982 Jarkko Sakkinen 2024-07-03  239   *
a61809a3323982 Jarkko Sakkinen 2024-07-03  240   * In order to compute session HMACs, we need to know the names of the
a61809a3323982 Jarkko Sakkinen 2024-07-03  241   * objects pointed to by the handles.  For most objects, this is simply
a61809a3323982 Jarkko Sakkinen 2024-07-03  242   * the actual 4 byte handle or an empty buf (in these cases @name
a61809a3323982 Jarkko Sakkinen 2024-07-03  243   * should be NULL) but for volatile objects, permanent objects and NV
a61809a3323982 Jarkko Sakkinen 2024-07-03  244   * areas, the name is defined as the hash (according to the name
a61809a3323982 Jarkko Sakkinen 2024-07-03  245   * algorithm which should be set to sha256) of the public area to
a61809a3323982 Jarkko Sakkinen 2024-07-03  246   * which the two byte algorithm id has been appended.  For these
a61809a3323982 Jarkko Sakkinen 2024-07-03  247   * objects, the @name pointer should point to this.  If a name is
a61809a3323982 Jarkko Sakkinen 2024-07-03  248   * required but @name is NULL, then TPM2_ReadPublic() will be called
a61809a3323982 Jarkko Sakkinen 2024-07-03  249   * on the handle to obtain the name.
a61809a3323982 Jarkko Sakkinen 2024-07-03  250   *
a61809a3323982 Jarkko Sakkinen 2024-07-03  251   * As with most tpm_buf operations, success is assumed because failure
a61809a3323982 Jarkko Sakkinen 2024-07-03  252   * will be caused by an incorrect programming model and indicated by a
a61809a3323982 Jarkko Sakkinen 2024-07-03  253   * kernel message.
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  254   *
7895041508233a Jarkko Sakkinen 2025-12-03  255   * Returns zero on success.
7895041508233a Jarkko Sakkinen 2025-12-03  256   * Returns -EIO when the authorization area state is malformed.
a61809a3323982 Jarkko Sakkinen 2024-07-03  257   */
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  258  int tpm_buf_append_name(struct tpm_chip *chip, struct tpm_buf *buf,
7895041508233a Jarkko Sakkinen 2025-12-03  259  			u32 handle, u8 *name, u16 name_size)
a61809a3323982 Jarkko Sakkinen 2024-07-03  260  {
a61809a3323982 Jarkko Sakkinen 2024-07-03 @261  	struct tpm2_auth *auth;
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  262  	int ret;
67a0e52127ec90 Jarkko Sakkinen 2025-12-08  263  
67a0e52127ec90 Jarkko Sakkinen 2025-12-08  264  	if (tpm_buf_length(buf) != TPM_HEADER_SIZE) {
67a0e52127ec90 Jarkko Sakkinen 2025-12-08  265  		dev_err(&chip->dev, "too many handles\n");
67a0e52127ec90 Jarkko Sakkinen 2025-12-08  266  		ret = -EIO;
67a0e52127ec90 Jarkko Sakkinen 2025-12-08  267  		goto err;
67a0e52127ec90 Jarkko Sakkinen 2025-12-08  268  	}
a61809a3323982 Jarkko Sakkinen 2024-07-03  269  
a61809a3323982 Jarkko Sakkinen 2024-07-03  270  	if (!tpm2_chip_auth(chip)) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  271  		tpm_buf_append_handle(chip, buf, handle);
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  272  		return 0;
a61809a3323982 Jarkko Sakkinen 2024-07-03  273  	}
a61809a3323982 Jarkko Sakkinen 2024-07-03  274  

:::::: The code at line 261 was first introduced by commit
:::::: a61809a33239821d70eba77bd0d6d13c29bbad0d tpm: Address !chip->auth in tpm_buf_append_name()

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
