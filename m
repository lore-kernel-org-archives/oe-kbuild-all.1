Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22D4148FF0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716306360; cv=none; b=BgL4Bn3R30wwkL4DKI3Mbi3TBYePrLlvgbb83uoKqUx5WCsdPUP7wjk+sbAvYoosyga9Y8AmelWRcvoSyhKwGImHwIO5j9nypVfYDXz/UiV6SHUg9fL0Qfcgt4PeSItsVxNmcS+7LcCOhaMHK0j0Pst91iFMCMXV45TcwVYeIv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716306360; c=relaxed/simple;
	bh=liqJmg4awMksaus77cIboXZx+K9/D9n3lhWP/+3wFf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pANb6V/qRnl+pBd+RgwCTQtIsPJj8IqHu6DebmtVeD8ydtHGdKEjBfgKSGjwhu2PrbOVp9NwoQtlgM4FGIVp3iUOsPjZdTCypxJVEAJpKaaiR8iONH9z7Mma3pSNFC5RW2wU9n08VgJRP4nFMYa8sBfGATjSmFAazuxg1paBhJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iOJnHjFv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iOJnHjFv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716306359; x=1747842359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=liqJmg4awMksaus77cIboXZx+K9/D9n3lhWP/+3wFf8=;
  b=iOJnHjFvi0y2gaAkwdGhnxieLJG3GdsGvOjzydrMUx5L9Lv5mN1tOa+n
   QbzL7R9S+0fto8Otmju16+fJLYxHDFCrYWbRy9gDM3z2UWGSob2VNRVy1
   MBdZUjKZ+s8gVUSsgVvq1eM2JgbPj+VpLaX1myXmed+dDbYN3/N+prWaf
   qWL2zWs9cMl8jaG862mzzXn8Jn32vr13HSyDRo9oEJt3ZGUPwxAze1fqT
   bk4DqP4T0Ejuodc/i4He5exCiSexQw0h1TZUG3lTORNWo7eCwMpWuC+wu
   P6+XkEuLeQh7Qp2e7dkYmHv0YAE+IlCbYtL4xei1ueCDaFeM3kiPkyWzt
   Q==;
X-CSE-ConnectionGUID: +I2RZM+9SFaj34rLWWsNuA==
X-CSE-MsgGUID: vQkSUdEHQgS2W5cnVCDlLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="15459775"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="15459775"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 08:45:58 -0700
X-CSE-ConnectionGUID: Kfym+xaaTJqVmj9jwPUl8g==
X-CSE-MsgGUID: Uebwhe30ScivEpiFSTkPBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="63793458"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 May 2024 08:45:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9RgY-0000UN-1K;
	Tue, 21 May 2024 15:45:54 +0000
Date: Tue, 21 May 2024 23:44:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v2 7/8] drivers/char/tpm/tpm2_key.c:45:3:
 error: a label can only be part of a statement and a declaration is not a
 statement
Message-ID: <202405212342.oNdIWBCB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2key-v2
head:   58801dd5ac1fcc4f2397f7a86b36efa71e583033
commit: 40825509eee50f129e051f3415ad2a5459ac05eb [7/8] tpm: tpm2_key: Extend parser to TPM_LoadableKey
config: x86_64-buildonly-randconfig-003-20240521 (https://download.01.org/0day-ci/archive/20240521/202405212342.oNdIWBCB-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240521/202405212342.oNdIWBCB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405212342.oNdIWBCB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm2_key.c: In function 'tpm2_key_type':
>> drivers/char/tpm/tpm2_key.c:45:3: error: a label can only be part of a statement and a declaration is not a statement
      45 |   char buffer[50];
         |   ^~~~


vim +45 drivers/char/tpm/tpm2_key.c

68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  29  
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  30  int tpm2_key_type(void *context, size_t hdrlen,
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  31  		  unsigned char tag,
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  32  		  const void *value, size_t vlen)
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  33  {
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  34  	enum OID oid = look_up_OID(value, vlen);
40825509eee50f1 Jarkko Sakkinen 2024-05-20  35  	struct tpm2_key *key = context;
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  36  
40825509eee50f1 Jarkko Sakkinen 2024-05-20  37  	switch (oid) {
40825509eee50f1 Jarkko Sakkinen 2024-05-20  38  	case OID_TPMSealedData:
40825509eee50f1 Jarkko Sakkinen 2024-05-20  39  		pr_info("TPMSealedData\n");
40825509eee50f1 Jarkko Sakkinen 2024-05-20  40  		break;
40825509eee50f1 Jarkko Sakkinen 2024-05-20  41  	case OID_TPMLoadableKey:
40825509eee50f1 Jarkko Sakkinen 2024-05-20  42  		pr_info("TPMLodableKey\n");
40825509eee50f1 Jarkko Sakkinen 2024-05-20  43  		break;
40825509eee50f1 Jarkko Sakkinen 2024-05-20  44  	default:
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20 @45  		char buffer[50];
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  46  		sprint_oid(value, vlen, buffer, sizeof(buffer));
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  47  		pr_debug("OID is \"%s\" which is not TPMSealedData\n",
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  48  			 buffer);
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  49  		return -EINVAL;
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  50  	}
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  51  
40825509eee50f1 Jarkko Sakkinen 2024-05-20  52  	key->oid = oid;
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  53  	return 0;
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  54  }
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20  55  

:::::: The code at line 45 was first introduced by commit
:::::: 68803235ce8d4c2907d93ac0990194cbaec5336f KEYS: trusted: Move tpm2_key_decode() to the TPM driver

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
