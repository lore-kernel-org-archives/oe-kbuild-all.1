Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024A03B5306
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 20:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787345715; cv=none; b=IZ+Aj8sKGfD7/g03TZnLZNRTRQOCFo/y2mtNiCktglmFxz+Iy5qF3QKK5mvMcAPH8m0Kw9UsmTOj7wzii6gAkKQkchVksV1T9RMbNiDabdoeAr515jCTtN8HNR5rREUNlSFl+ErgLSjmp+FSkg7J0tvnxjG5spsVzX+W5VtMLlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787345715; c=relaxed/simple;
	bh=4Z3VNM7wHD7qkdbheZZRKuP4qi9wChlzOxQepvHRcbE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PLUVSF+aOV5NvJYClzPdbY6NnWD62ItB8ILUr3/pndaIpDwVOJFbJQsBBSqddC+IgeEjRyl8iT5e0Z4+78QoTZQ1EQJUh9la5qWc/+Vms95ZvvnEgzteTQC3aFbYvuKorcxKRQHPmkHEKsOYYLIa+K9aQUjxlYI+2d2StPypD7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cldRo2Kl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cldRo2Kl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787345712; x=1818881712;
  h=date:from:to:cc:subject:message-id;
  bh=4Z3VNM7wHD7qkdbheZZRKuP4qi9wChlzOxQepvHRcbE=;
  b=cldRo2KlmF82mQuDFfLUXfby5km4VlYAeJHjBEm4r5qn0+w3MuAwhz0G
   FtNI3sKwRt6rfueg3A9ExXLCZSSCmFiNvvYs7Tk7QiEGTOp6vbiU5S82d
   m60bDOFpF52WcVTFaO6/h9K7pdruonaBiRoK5nlN7DUIx8RAb4Wc4Jgo1
   0bv4XOVf9QUDmlWqjOVeyiuSR1iZX++fx0SrQYJ8JVni1Mwfoi4I/F5dE
   SfZMdbxiZfzHYpmVKsgAPathGGso0yRTZJ6vbCw5PH9AhUatSxbk1oQl3
   Fc8sg2RIx2mKE+yCzsGL5LIPf9ASPFm460n4n6ukYQE3HqwPefEXGNkUr
   w==;
X-CSE-ConnectionGUID: FpG3oiQ9QViy8COUa/rQeg==
X-CSE-MsgGUID: zYk9cNjFQe69rkDw+UKnmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87916478"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="87916478"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 13:55:10 -0700
X-CSE-ConnectionGUID: Ai7iSiHyS82TYH7CNvlAkw==
X-CSE-MsgGUID: BD8YxWc7Sqy/l4um9Mnqqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="263796601"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2026 13:55:08 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxWGX-00000000qSn-3leA;
	Fri, 21 Aug 2026 20:55:05 +0000
Date: Sat, 22 Aug 2026 04:54:13 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes
 is larger than 1024 bytes
Message-ID: <202608220456.HAcVMI5V-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Herbert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   818bebeb63dd6bf5f4e07e145f6cdbace520a34c
commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
date:   1 year, 1 month ago
config: mips-eyeq5_defconfig (https://download.01.org/0day-ci/archive/20260822/202608220456.HAcVMI5V-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220456.HAcVMI5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9d9b193ed73a ("crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220456.HAcVMI5V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/ahash.c: In function 'crypto_hash_digest':
>> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1073 | }
         | ^


vim +1073 crypto/ahash.c

04bfa4c7d5119c Herbert Xu 2025-04-12  1059  
04bfa4c7d5119c Herbert Xu 2025-04-12  1060  int crypto_hash_digest(struct crypto_ahash *tfm, const u8 *data,
04bfa4c7d5119c Herbert Xu 2025-04-12  1061  		       unsigned int len, u8 *out)
04bfa4c7d5119c Herbert Xu 2025-04-12  1062  {
19da081a28c95f Herbert Xu 2025-04-23  1063  	HASH_REQUEST_ON_STACK(req, crypto_ahash_fb(tfm));
04bfa4c7d5119c Herbert Xu 2025-04-12  1064  	int err;
04bfa4c7d5119c Herbert Xu 2025-04-12  1065  
04bfa4c7d5119c Herbert Xu 2025-04-12  1066  	ahash_request_set_callback(req, 0, NULL, NULL);
04bfa4c7d5119c Herbert Xu 2025-04-12  1067  	ahash_request_set_virt(req, data, out, len);
04bfa4c7d5119c Herbert Xu 2025-04-12  1068  	err = crypto_ahash_digest(req);
04bfa4c7d5119c Herbert Xu 2025-04-12  1069  
04bfa4c7d5119c Herbert Xu 2025-04-12  1070  	ahash_request_zero(req);
04bfa4c7d5119c Herbert Xu 2025-04-12  1071  
04bfa4c7d5119c Herbert Xu 2025-04-12  1072  	return err;
04bfa4c7d5119c Herbert Xu 2025-04-12 @1073  }
04bfa4c7d5119c Herbert Xu 2025-04-12  1074  EXPORT_SYMBOL_GPL(crypto_hash_digest);
04bfa4c7d5119c Herbert Xu 2025-04-12  1075  

:::::: The code at line 1073 was first introduced by commit
:::::: 04bfa4c7d5119ca38f8133bfdae7957a60c8b221 crypto: hash - Add HASH_REQUEST_ON_STACK

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
