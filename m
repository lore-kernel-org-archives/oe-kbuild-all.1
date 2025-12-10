Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193271D88A4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 01:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765328605; cv=none; b=tD9+GuQbatzqmfcF0A78XJgmpW4sv5xDeSC5rLhKnl+CKlIVbOzIzjVvZS14pcQnja89zzWmewPHT4pY2PDyUA7ifKucqAv7MiiKJXnBGkM1fRAuYi9eNwhT1aN2IC1va2MO6pbS/M95Ydwn+gccp/immzhSIKe/va5QcOATFwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765328605; c=relaxed/simple;
	bh=bN1Z+g8Vanpog3T4LNZA+ZVWiA/qbkUW0UJPrwtfiHY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GJpvf9T1m9vYLcWa50GYRiksARKBEVJG8/mi4JFpgmdGK9CvIjq6kFpT/4iX+XwTXI0i495FYS0l66hKr0qJmuVU6yQ72f6Lni/GjyIoZF/YFrIQzbWVS9sbcUmOs2sBf9m2DJGP63ZUEkD8Wa0dFSLyC6XOISOgBhKTLXdDw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4He+YGw; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4He+YGw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765328604; x=1796864604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bN1Z+g8Vanpog3T4LNZA+ZVWiA/qbkUW0UJPrwtfiHY=;
  b=i4He+YGwhPZC8+xqV7P3zfDM++ZxaE+lkzHC5BQhTYIbivnBHq2jv1Xp
   kLdENkFhk2UK8HxYQ3HWS4a0iH8/ZUfJrVROLy/KFmybh8BWfjC5vU9bI
   qD4gPKzk8CzvzOgUwP9DiMkJfLfwyvnjZGR+0Hw2eUiqF2acSOT6ngVES
   zq0fImSOqG62+NyGYrmwLmRIOby1TwJ+Qmk9tfbnjmyv1afhGSYZsrJen
   CWUtNguqa3mned761vgZqOKPfCP2jMEmaJvR1n4Ur/kvU1OfV8hro4Edz
   5CbvZwK7XxECjtAcv20+OeRpKKttA5SsIhiaf44B/vwQnQ9gx8rUt2ExD
   g==;
X-CSE-ConnectionGUID: pCg4XHByQIS7YIqo9OBvog==
X-CSE-MsgGUID: soXyj3TpQmaNvjR9taQU4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67021067"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="67021067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 17:03:23 -0800
X-CSE-ConnectionGUID: tTvNmpdjQn2oEnEX3xW8nw==
X-CSE-MsgGUID: SteHeSLxTKiG1q0CFhbyQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="196276883"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 09 Dec 2025 17:03:21 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT8bv-000000002Qb-12NP;
	Wed, 10 Dec 2025 01:03:19 +0000
Date: Wed, 10 Dec 2025 09:03:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:queue 8/9] drivers/char/tpm/tpm2-sessions.c:254:20:
 warning: unused variable 'auth'
Message-ID: <202512100851.yE8wh1vy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git queue
head:   e5f26c88209d7dc6c1fe602f9503298b7a43c0e5
commit: 19a7c7025554233df0019178fe6b7a2732e6c9cf [8/9] tpm2-sessions: Remove AUTH_MAX_NAMES
config: riscv-randconfig-001-20251210 (https://download.01.org/0day-ci/archive/20251210/202512100851.yE8wh1vy-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251210/202512100851.yE8wh1vy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512100851.yE8wh1vy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm2-sessions.c: In function 'tpm_buf_append_name':
>> drivers/char/tpm/tpm2-sessions.c:254:20: warning: unused variable 'auth' [-Wunused-variable]
     struct tpm2_auth *auth;
                       ^~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=m]
   Selected by [m]:
   - CAN [=m] && NET [=y]


vim +/auth +254 drivers/char/tpm/tpm2-sessions.c

a61809a3323982 Jarkko Sakkinen 2024-07-03  224  
a61809a3323982 Jarkko Sakkinen 2024-07-03  225  /**
b45af16496dce5 Jarkko Sakkinen 2025-12-03  226   * tpm_buf_append_name() - Append a handle and store TPM name
b45af16496dce5 Jarkko Sakkinen 2025-12-03  227   * @chip:		TPM chip to use.
b45af16496dce5 Jarkko Sakkinen 2025-12-03  228   * @buf:		TPM buffer containing the TPM command in-transit.
b45af16496dce5 Jarkko Sakkinen 2025-12-03  229   * @handle:		TPM handle to be appended.
b45af16496dce5 Jarkko Sakkinen 2025-12-03  230   * @name:		TPM name of the handle
b45af16496dce5 Jarkko Sakkinen 2025-12-03  231   * @name_size:		Size of the TPM name.
a61809a3323982 Jarkko Sakkinen 2024-07-03  232   *
a61809a3323982 Jarkko Sakkinen 2024-07-03  233   * In order to compute session HMACs, we need to know the names of the
a61809a3323982 Jarkko Sakkinen 2024-07-03  234   * objects pointed to by the handles.  For most objects, this is simply
a61809a3323982 Jarkko Sakkinen 2024-07-03  235   * the actual 4 byte handle or an empty buf (in these cases @name
a61809a3323982 Jarkko Sakkinen 2024-07-03  236   * should be NULL) but for volatile objects, permanent objects and NV
a61809a3323982 Jarkko Sakkinen 2024-07-03  237   * areas, the name is defined as the hash (according to the name
a61809a3323982 Jarkko Sakkinen 2024-07-03  238   * algorithm which should be set to sha256) of the public area to
a61809a3323982 Jarkko Sakkinen 2024-07-03  239   * which the two byte algorithm id has been appended.  For these
a61809a3323982 Jarkko Sakkinen 2024-07-03  240   * objects, the @name pointer should point to this.  If a name is
a61809a3323982 Jarkko Sakkinen 2024-07-03  241   * required but @name is NULL, then TPM2_ReadPublic() will be called
a61809a3323982 Jarkko Sakkinen 2024-07-03  242   * on the handle to obtain the name.
a61809a3323982 Jarkko Sakkinen 2024-07-03  243   *
a61809a3323982 Jarkko Sakkinen 2024-07-03  244   * As with most tpm_buf operations, success is assumed because failure
a61809a3323982 Jarkko Sakkinen 2024-07-03  245   * will be caused by an incorrect programming model and indicated by a
a61809a3323982 Jarkko Sakkinen 2024-07-03  246   * kernel message.
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  247   *
b45af16496dce5 Jarkko Sakkinen 2025-12-03  248   * Returns zero on success.
b45af16496dce5 Jarkko Sakkinen 2025-12-03  249   * Returns -EIO when the authorization area state is malformed.
a61809a3323982 Jarkko Sakkinen 2024-07-03  250   */
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  251  int tpm_buf_append_name(struct tpm_chip *chip, struct tpm_buf *buf,
b45af16496dce5 Jarkko Sakkinen 2025-12-03  252  			u32 handle, u8 *name, u16 name_size)
a61809a3323982 Jarkko Sakkinen 2024-07-03  253  {
a61809a3323982 Jarkko Sakkinen 2024-07-03 @254  	struct tpm2_auth *auth;
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  255  	int ret;
19a7c702555423 Jarkko Sakkinen 2025-12-08  256  
19a7c702555423 Jarkko Sakkinen 2025-12-08  257  	if (tpm_buf_length(buf) != TPM_HEADER_SIZE) {
19a7c702555423 Jarkko Sakkinen 2025-12-08  258  		dev_err(&chip->dev, "too many handles\n");
19a7c702555423 Jarkko Sakkinen 2025-12-08  259  		ret = -EIO;
19a7c702555423 Jarkko Sakkinen 2025-12-08  260  		goto err;
19a7c702555423 Jarkko Sakkinen 2025-12-08  261  	}
a61809a3323982 Jarkko Sakkinen 2024-07-03  262  
a61809a3323982 Jarkko Sakkinen 2024-07-03  263  	if (!tpm2_chip_auth(chip)) {
c4d292e58b76c3 Jarkko Sakkinen 2025-10-01  264  		tpm_buf_append_handle(buf, handle);
6e9722e9a7bfe1 Jarkko Sakkinen 2025-11-30  265  		return 0;
a61809a3323982 Jarkko Sakkinen 2024-07-03  266  	}
a61809a3323982 Jarkko Sakkinen 2024-07-03  267  

:::::: The code at line 254 was first introduced by commit
:::::: a61809a33239821d70eba77bd0d6d13c29bbad0d tpm: Address !chip->auth in tpm_buf_append_name()

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko.sakkinen@iki.fi>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
