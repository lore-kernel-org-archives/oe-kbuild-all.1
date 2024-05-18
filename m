Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4A63C062
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 12:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716035173; cv=none; b=kCvKhsDJSMOG2gpFnFQVgJuAUCxHodQ/UVHJGWzadVG/Skj694n6lmT2i5cgt4247TJ157g3vTv5xDb9HKYhDW5+KliLvSM36Rj3M0u2xGHfykX00gp6QWjK8XLDxvIQrSqxk+SCdfbcqB/lCkdoI/LY/yTfhGb9we43YozI92U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716035173; c=relaxed/simple;
	bh=o3njPfW3JXXv186UiIPbwmibWKh88WWOlmDTMjyZybM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a5KkSZDfQxzs17MZYTJm2Io18wbYOCkyAfmWCY3TsSa0uJIX16eUOIGzXBzsHFJxwsX4+1ByvW52dM8e3j2E7D5NwCem3vuRQVwp/4E1lSmibgUPqPN1CdM4r3qE8+UvXTVYmvyJllsorSVgFIZgbGe19Uwka1oeTApZv+Z2Oq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NrDGU//n; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NrDGU//n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716035172; x=1747571172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o3njPfW3JXXv186UiIPbwmibWKh88WWOlmDTMjyZybM=;
  b=NrDGU//nA1Fgd+G+zgFrNl0nszyn15Nx/KYW7VCP4vzBxZCCug9oEbSH
   XnBzdsekAxteO8isBPeE1NiGg32IwnV7pvd3y6OfWr9GgygXCRh+ZN8WF
   Aq9hVZuIXyoZMsah2aDsVZqnygAZKv4ifoLuG9Dc5qmXDBSAsYmnunqLe
   tsqm2WmX9jSsAgaw7WwIh7dpCFr2t5sOYOXI8XZ1kRUrfauweL+KTkK6q
   jQ0xDrxB6+CpRONzz0rh3nQeL4wTQFuSc/WFeAv8WqnN8RSnFS/mTAoKr
   5wxsapDn6UrDcEs0UZ3bT2T4bWbmWniTRCuN0yuxIixoTVEyjN0WbUDdg
   Q==;
X-CSE-ConnectionGUID: 8Bj8ugLAQKCkYT+yvv1M8A==
X-CSE-MsgGUID: zl+LM3dFSkORbEs0NqFhAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="16004952"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="16004952"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 05:26:12 -0700
X-CSE-ConnectionGUID: OzaDyYvoTtKT324BLCQ03A==
X-CSE-MsgGUID: /mpx8TjPR/+a14FRFsc75A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="55282629"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2024 05:26:10 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8J8Z-0002Bs-2W;
	Sat, 18 May 2024 12:26:07 +0000
Date: Sat, 18 May 2024 20:25:24 +0800
From: kernel test robot <lkp@intel.com>
To: James Prestwood <prestwoj@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Subject: [jarkko-tpmdd:tpm2_key 19/19] drivers/char/tpm/tpm2_key.c:405:
 warning: expecting prototype for tpm2_sign(). Prototype was for
 tpm2_key_rsa_sign() instead
Message-ID: <202405182002.YcHyyh5v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key
head:   6b77892230a67633f43bdf91655b3c3077e4502b
commit: 6b77892230a67633f43bdf91655b3c3077e4502b [19/19] keys: asymmetric: ASYMMETRIC_TPM2_KEY_SUBTYPE
config: i386-randconfig-141-20240518 (https://download.01.org/0day-ci/archive/20240518/202405182002.YcHyyh5v-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405182002.YcHyyh5v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405182002.YcHyyh5v-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/tpm/tpm2_key.c:159: warning: expecting prototype for tpm_key_decode(). Prototype was for tpm2_key_decode() instead
>> drivers/char/tpm/tpm2_key.c:405: warning: expecting prototype for tpm2_sign(). Prototype was for tpm2_key_rsa_sign() instead


vim +405 drivers/char/tpm/tpm2_key.c

35fb2b76dd725a James Prestwood 2024-05-18  388  
35fb2b76dd725a James Prestwood 2024-05-18  389  /**
35fb2b76dd725a James Prestwood 2024-05-18  390   * tpm2_sign() - RSA sign with TPM ASN.1 key
35fb2b76dd725a James Prestwood 2024-05-18  391   * @chip:		TPM chip to use
35fb2b76dd725a James Prestwood 2024-05-18  392   * @key:		TPM2 asymmetric key.
35fb2b76dd725a James Prestwood 2024-05-18  393   * @params:		public key parameters
35fb2b76dd725a James Prestwood 2024-05-18  394   * @in:			input hash
35fb2b76dd725a James Prestwood 2024-05-18  395   * @out:		output digest
35fb2b76dd725a James Prestwood 2024-05-18  396   *
35fb2b76dd725a James Prestwood 2024-05-18  397   * Sign operation is an encryption using the TPM's private key. With RSA the
35fb2b76dd725a James Prestwood 2024-05-18  398   * only difference between encryption and decryption is where the padding goes.
35fb2b76dd725a James Prestwood 2024-05-18  399   * Since own padding can be used, TPM2_RSA_Decrypt can be repurposed to do
35fb2b76dd725a James Prestwood 2024-05-18  400   * encryption.
35fb2b76dd725a James Prestwood 2024-05-18  401   */
35fb2b76dd725a James Prestwood 2024-05-18  402  int tpm2_key_rsa_sign(struct tpm_chip *chip, struct tpm2_key *key,
35fb2b76dd725a James Prestwood 2024-05-18  403  		      struct kernel_pkey_params *params,
35fb2b76dd725a James Prestwood 2024-05-18  404  		      const void *in, void *out)
35fb2b76dd725a James Prestwood 2024-05-18 @405  {

:::::: The code at line 405 was first introduced by commit
:::::: 35fb2b76dd725ab0cbac1a09384bd5c5710679ee tpm: tpm2_key_rsa_decrypt)

:::::: TO: James Prestwood <prestwoj@gmail.com>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
