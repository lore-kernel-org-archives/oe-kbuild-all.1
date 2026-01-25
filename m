Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FF8221F11
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 23:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769382437; cv=none; b=gNMP6EciLyoZXO8L0WhVkNnwbQ1o+xafBug0RmVLMOytlou2iS1suQHElcFInKtxAyBU78yD8Wx9DI0ZZx/qXEukFuT8q+ZXTwe8+EeLs1pwenGu6lrJoecE/su7helGcJQE2y2Z8lHelknlyRmGQqxvyczwqos05pQlY5gDJ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769382437; c=relaxed/simple;
	bh=7SOwzUZYvgdhbJnpGwP2M0VPi4AGFOJDpUDnaVThvds=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gNex1pbpuS6wgp2TaQBS4lWG/q17s/eHTLvVLHJ1PQjFbfzG6pmHO24g2bSXeSW+dpQC9ozeq1I7ei3PhQDvCInFfAAJyUvXVwtFnJTqo3fEJ95HnDomQj+Ukwz8iCFqo0yXnhVvfTK3emY03kin0uZy+f5MpTCIxQSkSTgPy+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNXjx3xu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNXjx3xu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769382436; x=1800918436;
  h=date:from:to:cc:subject:message-id;
  bh=7SOwzUZYvgdhbJnpGwP2M0VPi4AGFOJDpUDnaVThvds=;
  b=YNXjx3xu/T5yJpIuDgrU1H1bL1kcrCGRvgO4LfCXKV2vXJ60D4cIGZFo
   M64OLXwc6lq0lT9LW+Yb3Esq5/31ayOCqWK12VVyBsXgLnUyXBT3SSW/i
   2lhRvoiA7zXrVypoRlo8nEkYP9zQkRnPF0dBwcj3/ArdDQjhRr1Jb+nyC
   9Aqi2TMDrDniURCbma2vXbEXf29V4xTWzx8nAdQYD1AURdml1hNDIj7YQ
   Rld60Y/WVnhPxMZNWH4i2obXC+hK0DjdArzKP8KPoYfvlPlNI73P4UOQq
   LNTrVbh5bj2pZtlasI8xP95uEo3t9XU67wYLiLJEvZuchLXVMKO1VxI+0
   Q==;
X-CSE-ConnectionGUID: plXU8bf8Rcq/JVe7iJeKng==
X-CSE-MsgGUID: 6EGqNdqnRHqkeFxE1tSaZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="87980220"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="87980220"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 15:07:15 -0800
X-CSE-ConnectionGUID: TxbumR8jQbSEOtQY0mx3gg==
X-CSE-MsgGUID: jaOFXybASjiWxhwCfDBnJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="207349307"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 25 Jan 2026 15:07:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk9CJ-000000001NF-2cqc;
	Sun, 25 Jan 2026 23:07:11 +0000
Date: Mon, 26 Jan 2026 00:06:49 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 13/16]
 drivers/char/tpm/tpm2-sessions.c:261:27: warning: unused variable 'auth'
Message-ID: <202601260020.VNFbfHZN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   fbd9af022416579062d59e206c7f71890d27fc31
commit: a336f9a74a111db167597a0dcd2c33a9c0a0f3c2 [13/16] tpm2-sessions: Remove the support for more than one authorization
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260126/202601260020.VNFbfHZN-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260126/202601260020.VNFbfHZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601260020.VNFbfHZN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm2-sessions.c: In function 'tpm_buf_append_name':
>> drivers/char/tpm/tpm2-sessions.c:261:27: warning: unused variable 'auth' [-Wunused-variable]
     261 |         struct tpm2_auth *auth;
         |                           ^~~~


vim +/auth +261 drivers/char/tpm/tpm2-sessions.c

a61809a3323982 Jarkko Sakkinen 2024-07-03  231  
a61809a3323982 Jarkko Sakkinen 2024-07-03  232  /**
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  233   * tpm_buf_append_name() - Append a handle and store TPM name
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  234   * @chip:		TPM chip to use.
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  235   * @buf:		TPM buffer containing the TPM command in-transit.
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  236   * @handle:		TPM handle to be appended.
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  237   * @name:		TPM name of the handle
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  238   * @name_size:		Size of the TPM name.
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
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  255   * Returns zero on success.
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  256   * Returns -EIO when the authorization area state is malformed.
a61809a3323982 Jarkko Sakkinen 2024-07-03  257   */
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  258  int tpm_buf_append_name(struct tpm_chip *chip, struct tpm_buf *buf,
ff288cb862cd25 Jarkko Sakkinen 2025-12-03  259  			u32 handle, u8 *name, u16 name_size)
a61809a3323982 Jarkko Sakkinen 2024-07-03  260  {
a61809a3323982 Jarkko Sakkinen 2024-07-03 @261  	struct tpm2_auth *auth;
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  262  	int ret;
a336f9a74a111d Jarkko Sakkinen 2025-12-08  263  
a336f9a74a111d Jarkko Sakkinen 2025-12-08  264  	if (tpm_buf_length(buf) != TPM_HEADER_SIZE) {
a336f9a74a111d Jarkko Sakkinen 2025-12-08  265  		dev_err(&chip->dev, "too many handles\n");
a336f9a74a111d Jarkko Sakkinen 2025-12-08  266  		ret = -EIO;
a336f9a74a111d Jarkko Sakkinen 2025-12-08  267  		goto err;
a336f9a74a111d Jarkko Sakkinen 2025-12-08  268  	}
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
