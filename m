Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3C73F8C7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 May 2024 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716315261; cv=none; b=LddaYZKq7TSrNUFdm8taCrC9dQhQldED7m6SyYqi8RVY/eU8Fnet3nDHqp9hM/nl4XuoT6uDt7kof6Yef1MUNYoANmghDnhzWDNROHxEgazsekh5yDyIkdQDf061eBq5hu7kabOPfZ1tLYpK3IlaRgdJhzNMPAO2VnD1l5X13II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716315261; c=relaxed/simple;
	bh=FWRoukQ6sQO7qFiY7yvlO9idQT7Fa94EO/0ad4nJHgc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fp59XWWAGV5Q5lqjmdmqWGKQsMo+QhYXaZH6O4NSvodIt3JykE1y90okHZ/iein1K1GoLXJzRnQn4vnQMMlCz8D8qLoHQ66yQ/X/FICBhF1VO93rjDROWV3EV3QP7bZdbr1vCke6uV55upy9r0zDoPbZTA/Z+Tmf9OC+S6BU7mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUfugKt6; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUfugKt6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716315260; x=1747851260;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FWRoukQ6sQO7qFiY7yvlO9idQT7Fa94EO/0ad4nJHgc=;
  b=nUfugKt6+v8IYdDjFd4akvcGz9C9FlwuAslH9xGtFw6qvDHiG8ZuJxYW
   534q8X9rbJGnQG9YCVsGJOpM+MCgYcrK6HaT86//7n8VC5p+64jenFxw+
   dWKbdAJeNTLr6Mp+uu8jilGFu4Xii7+BLkxBYHUMNA+J+bV/RvhaYW7sG
   jV7JxX2/eUtBnwHkhighRLoHVootQV+MAPfaZzEDFasljCZx2iMDfn8+d
   NCBwfA07dyoqrjLq3A2qa2q+lt4BmMDa1GPaziG0O+u6zcnolsTqGMKVt
   LGEKYTzLkeyi4pA4GklhRlmojwT/xehjFPW/GdpuzV+Bvx/QLffaJAbCW
   w==;
X-CSE-ConnectionGUID: xtyp5C9MRoWYgbKnBK2Gsw==
X-CSE-MsgGUID: O3fku2xYTGyKVIxDpnpMOw==
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="16318077"
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="16318077"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2024 11:14:20 -0700
X-CSE-ConnectionGUID: eumyxcaXSSGCSuTJPDM8ag==
X-CSE-MsgGUID: CfLPBgo/RReKzOlzL1rEEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,178,1712646000"; 
   d="scan'208";a="33444282"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 May 2024 11:14:18 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s9U07-0000bZ-05;
	Tue, 21 May 2024 18:14:15 +0000
Date: Wed, 22 May 2024 02:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2key-v2 7/8] drivers/char/tpm/tpm2_key.c:45:3:
 error: expected expression
Message-ID: <202405220248.EIYaDYr3-lkp@intel.com>
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
config: arm-randconfig-r064-20240521 (https://download.01.org/0day-ci/archive/20240522/202405220248.EIYaDYr3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240522/202405220248.EIYaDYr3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405220248.EIYaDYr3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/tpm/tpm2_key.c:45:3: error: expected expression
      45 |                 char buffer[50];
         |                 ^
>> drivers/char/tpm/tpm2_key.c:46:42: error: use of undeclared identifier 'buffer'
      46 |                 sprint_oid(value, vlen, buffer, sizeof(buffer));
         |                                                        ^
   drivers/char/tpm/tpm2_key.c:46:27: error: use of undeclared identifier 'buffer'
      46 |                 sprint_oid(value, vlen, buffer, sizeof(buffer));
         |                                         ^
   drivers/char/tpm/tpm2_key.c:48:5: error: use of undeclared identifier 'buffer'
      48 |                          buffer);
         |                          ^
   4 errors generated.


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
68803235ce8d4c2 Jarkko Sakkinen 2024-05-20 @46  		sprint_oid(value, vlen, buffer, sizeof(buffer));
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
