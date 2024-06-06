Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE8D19D8B9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 03:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717645833; cv=none; b=bYoelIU/Npa/iWWV2ciVNaomZzI6J+LZRsB4iVbVnrDLtQIWFP9TFZmif9oMSyPo1rMHaKM8Z/DZyT5CVFYMc5+0wm7NYhgIJSv5Qol/3uGO8v/STdQSH28Chp0CSEJzirEKmaNGBVU1mYb598AZ/CVzUk3SLjStkjG/V8wdwpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717645833; c=relaxed/simple;
	bh=KAwXJ0dJmD/Tdt12TnkPtuBnQ1/WttBzpznw7teYFDk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UElfjHjMtJQoyZy2/BEBtw5dT0g3pvw9d0thoF7g/IlhARhFZgdw7cxqQhGRIzZ4LQWF3wlyuEeNxL+GBr+ttxmyMBbtlsSqY3aSL1MJ4w8C4jUqtw4PNtYyu7rpdj5HSehr/vuENC+WLXTsC5JymLC2dZfdN8MzxDMq9MrV0qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EEkAH984; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EEkAH984"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717645832; x=1749181832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KAwXJ0dJmD/Tdt12TnkPtuBnQ1/WttBzpznw7teYFDk=;
  b=EEkAH984+LmN7OagUnM+Ly0utIo8XjZSFCS2r1oaXH2psRf4QSn2i7xi
   /g+U8VAdphg4najwuBTiQRoxXEjXRMgj0L2ENMgTM1XfKb6R6TUc+24av
   Y5A5LUJKzSaP+2k+nySFg+iZksRoFE+1Iih2TA1lXtZ85nWHLPu6nFEhb
   vt32tEbHlCRDyMkbqBPce/KEf0D8xmgyzA6J2eFpWZyRIvyflWo5DjWpR
   84rPmkWFaG9o+2czdvrBvx+kTw6sh9Dw7rxe3J6SnMFNpSmvk2nXGA1jp
   22rn6qPHh1CQGlTSnBxqva2m8xqSCYU7MwU5Z+dn9c0GHWUUS7GeUZejW
   w==;
X-CSE-ConnectionGUID: I2U7DThmQC+tM1DuLwEt4A==
X-CSE-MsgGUID: FHuyoJOfRzmdGDqmmUKAZg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="14248766"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="14248766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 20:50:31 -0700
X-CSE-ConnectionGUID: 2A/db5JzTP6ZoGjmRdOJ1w==
X-CSE-MsgGUID: I9Wh2m+HTKyYhW3tJ+DDMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; 
   d="scan'208";a="37829854"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 05 Jun 2024 20:50:30 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sF48x-0002d6-2d;
	Thu, 06 Jun 2024 03:50:27 +0000
Date: Thu, 6 Jun 2024 11:49:58 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v8 5/7] crypto/tpm2_key.c:94: warning:
 expecting prototype for tpm_key_parse(). Prototype was for tpm2_key_parse()
 instead
Message-ID: <202406061116.WbEBy71I-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v8
head:   fd7b0d97192f7fceebfa349654f77be312e257c0
commit: 3597726a9ebb828cf4475797e587fdf35de2d765 [5/7] crypto: tpm2_key: Implement a robust parser
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20240606/202406061116.WbEBy71I-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406061116.WbEBy71I-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406061116.WbEBy71I-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/tpm2_key.c:94: warning: expecting prototype for tpm_key_parse(). Prototype was for tpm2_key_parse() instead


vim +94 crypto/tpm2_key.c

    71	
    72	/**
    73	 * tpm_key_parse() - Parse a TPM2 key from ASN.1 blob
    74	 * @src:	ASN.1 source buffer.
    75	 * @size:	Size of the source buffer.
    76	 * @key:	Pre-allocated &tpm2_key to be populated.
    77	 *
    78	 * Load TPM2B_PRIVATE and TPM2B_PUBLIC from an ASN.1 file, and concatenate the
    79	 * blobs together as a single blob, as this is expected format for the TPM2
    80	 * commands.
    81	 *
    82	 * Validation:
    83	 * - TPM2B_PRIVATE is capped by %TPM2_KEY_BYTES_MAX.
    84	 * - TPM2B_PRIVATE must match the retrieved buffer size.
    85	 * - TPM2B_PUBLIC is capped by %TPM2_KEY_BYTES_MAX.
    86	 * - TPM2B_PUBLIC must match the retrieved buffer size.
    87	 * - TPM2B_PUBLIC must have enough space to fit *tpm2_public_t.
    88	 *
    89	 * Return:
    90	 * * 0:		Success.
    91	 * * -EBADMSG:	Parsing failed.
    92	 */
    93	int tpm2_key_parse(const void *src, const unsigned int size, struct tpm2_key *key)
  > 94	{

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
