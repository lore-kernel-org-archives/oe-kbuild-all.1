Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FA5482FF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 May 2024 15:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716133906; cv=none; b=HR0wrqgyTF7+PVY9Nv5JWp8i/1Woc+sCU1FIeonSe7EinuceEwHKOgbGoq7IotrppoZrxgIaM1ESdElE4z4n7z6Svq+U8IyXejPjEHUlpRWx4dFQSFFqt43Bhqyt+OCtqYj+8qhEifNMy/MsIxnSTgDkYKURPb0LMZRIT0eO7gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716133906; c=relaxed/simple;
	bh=OJU2+0KEqJjT0mcTN+TS90DfjVkN/yGF70Dzhu1d1C8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pYrEitp48M813G+7R3M5AIIqV0s6aPXWDENbsLxExDrxfo0fzfw9CkUcKK+MV8MdM7cyYjIrCzQtZoGlOLMx6WKXwrKjhrx1PTg4r6Ra5iyODFbhBC7/ehjfMWusU6z8M1hi8ygmwKl0lOWChlNYD4L/Us821TJFIdU1QCPeV1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfP34qlk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfP34qlk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716133905; x=1747669905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJU2+0KEqJjT0mcTN+TS90DfjVkN/yGF70Dzhu1d1C8=;
  b=XfP34qlkFhNzcqiXqUwFBevFmNB+7XyDe54AuNbsJlaUPr3JLNImGa6H
   LW+qKiAQBPzujRUoDSMjVOqdC0y0ErWnqK1DqEKxqKOLLRCtiQiziKcce
   9vaqpihBEIv4r7t+mfo00CQnaV5QGFQFLmEFIQPkytlNJK3gN/WRnTgtn
   KOcHT88yLMFkNUYoJAz8MvUHcBHWFvLyeXPUB3Kuo8XGVHtkGLGX8e8Vt
   1qj/yRAvY5vpR9KRluM8OnjilOhjyVphxGCzgw3/dXnk4j8aarbCT9Yk/
   12zClHj0bxKN9DQHteeoBLIW8PjdXcAYwm/tMwWoPqzgnFo0nYA3l8/Cc
   Q==;
X-CSE-ConnectionGUID: WhHzCy8WSBW3P4ayD2FyJg==
X-CSE-MsgGUID: QuipPPp5THO+YmPQa5X6Ow==
X-IronPort-AV: E=McAfee;i="6600,9927,11077"; a="12132280"
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="12132280"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2024 08:51:44 -0700
X-CSE-ConnectionGUID: dIzKmR9VSfWBwC66lPznrw==
X-CSE-MsgGUID: SISdgU3NR/ymvGgJTiqhzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,173,1712646000"; 
   d="scan'208";a="32442893"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 19 May 2024 08:51:43 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8ip2-0003oM-1i;
	Sun, 19 May 2024 15:51:40 +0000
Date: Sun, 19 May 2024 23:51:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:tpm2_key-2 6/7] drivers/char/tpm/tpm2_key.c:50:3:
 error: a label can only be part of a statement and a declaration is not a
 statement
Message-ID: <202405192336.XW5ecaka-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2_key-2
head:   fd3739a598738d788459238040fdb80b4213239a
commit: 59fab73fe3f5c4b13ebee9ea98a64fbaf523a5fc [6/7] tpm: tpm2_key: Extend parser to TPM_LoadableKey
config: i386-randconfig-005-20240519 (https://download.01.org/0day-ci/archive/20240519/202405192336.XW5ecaka-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240519/202405192336.XW5ecaka-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405192336.XW5ecaka-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm2_key.c: In function 'tpm2_key_type':
>> drivers/char/tpm/tpm2_key.c:50:3: error: a label can only be part of a statement and a declaration is not a statement
      char buffer[50];
      ^~~~


vim +50 drivers/char/tpm/tpm2_key.c

8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  34  
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  35  int tpm2_key_type(void *context, size_t hdrlen,
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  36  		  unsigned char tag,
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  37  		  const void *value, size_t vlen)
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  38  {
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  39  	enum OID oid = look_up_OID(value, vlen);
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  40  	struct tpm2_key *key = context;
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  41  
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  42  	switch (oid) {
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  43  	case OID_TPMSealedData:
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  44  		pr_info("TPMSealedData\n");
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  45  		break;
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  46  	case OID_TPMLoadableKey:
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  47  		pr_info("TPMSealedData\n");
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  48  		break;
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  49  	default:
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19 @50  		char buffer[50];
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  51  		sprint_oid(value, vlen, buffer, sizeof(buffer));
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  52  		pr_debug("Unknown OID \"%s\"\n", buffer);
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  53  		return -EINVAL;
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  54  	}
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  55  
59fab73fe3f5c4b Jarkko Sakkinen 2024-05-19  56  	key->oid = oid;
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  57  	return 0;
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  58  }
8c36e89d6c31b43 Jarkko Sakkinen 2024-05-19  59  

:::::: The code at line 50 was first introduced by commit
:::::: 8c36e89d6c31b433e1f3e06541eed1f687eaac81 KEYS: trusted: Migrate tpm2_key_{encode,decode}() to TPM driver

:::::: TO: Jarkko Sakkinen <jarkko@kernel.org>
:::::: CC: Jarkko Sakkinen <jarkko@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
