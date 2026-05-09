Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13B7352C5B
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 May 2026 17:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778346414; cv=none; b=UT9KoM/EA+kgPaHan7bk4xj3Ajbg3lPegVptKbwFSaLmFGgs5qu0ynickwMEjiRjK47S7SyCT5zXMvXimjfLkelKnbqb5vGiwXOFU8gfFOoAIRCf4NBqkI20hgZK0xkxve/0Ao4KPLa387viH6vDA0Ht8dtyZCObbaU9gEPOgIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778346414; c=relaxed/simple;
	bh=NL8eZtwZQiQDqj+yfA62odnBkjSsAHu9beZbaScnFR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CeWp1v8TzhxH9CcfQbB0v2yeuVvaF5H8AUPV0fdJYd389zYUrT/XgackCrmTnPj6oAhGn3TQ67JF4jpvOsi9a7EFyKXwS7yAklP6yiSMijxe5IjOatapO2iOPUlS8b1x+DzRpkeMMqt4lxXF5rZ6gHhEjbrOze19WTrsU3w5/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HmUn4NEz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HmUn4NEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778346411; x=1809882411;
  h=date:from:to:cc:subject:message-id;
  bh=NL8eZtwZQiQDqj+yfA62odnBkjSsAHu9beZbaScnFR0=;
  b=HmUn4NEzwUIMcIExvZ3M+Y17dUl3lvFA1z19NyVt7wfSiCmZXXirnIgJ
   8CKHc8PwurTliink/OOPyc3mpebaS36W1D1dH62ZYFkpZiD4/TC3QCHYk
   QgG9ozpVagkQRBvQTIObH96XJAWo/G8lHNmr1VIBfCo+NiZJB7qz/B7C5
   hhzTRqOmLJjP9Vmkv9CzGwvBPpAOseciulmr0xDrAyfD/qEt78/MwXaKv
   x7DZ7VO4kv8XcLw0UcxZ0WWwGCUd4qgwpP+n9XByEq91NxjiSOExRLdC/
   kS+VyLvT4e6fIHRs0K11/fFHG4HbI1sP8zCv29e1phH/mAIgEBtxXDmSn
   A==;
X-CSE-ConnectionGUID: LKm+M/1HS6+RdMZbOVU8EA==
X-CSE-MsgGUID: AlZMVlCLRkq3eSPKWjavYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89606061"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89606061"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 10:06:51 -0700
X-CSE-ConnectionGUID: EKVkYlqLTMGIliqfTRQT8w==
X-CSE-MsgGUID: 52OivzLhTr6LqtEI/33dIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="275171769"
Received: from lkp-server01.sh.intel.com (HELO 82327192134e) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 09 May 2026 10:06:50 -0700
Received: from kbuild by 82327192134e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLl8Z-000000001FB-1MZG;
	Sat, 09 May 2026 17:06:47 +0000
Date: Sun, 10 May 2026 01:06:17 +0800
From: kernel test robot <lkp@intel.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes
 is larger than 1024 bytes
Message-ID: <202605100125.l4JVHppO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Herbert,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ec89572766744e844df24c27d31c97b4c00f4e07
commit: 9d9b193ed73a65ec47cf1fd39925b09da8216461 crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)
date:   9 months ago
config: mips-eyeq5_defconfig (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/config)
compiler: mips64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100125.l4JVHppO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9d9b193ed73a ("crypto: hash - Increase HASH_MAX_DESCSIZE for hmac(sha3-224-s390)")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605100125.l4JVHppO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   crypto/ahash.c: In function 'crypto_hash_digest':
>> crypto/ahash.c:1073:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    1073 | }
         | ^


vim +1073 crypto/ahash.c

04bfa4c7d5119ca Herbert Xu 2025-04-12  1059  
04bfa4c7d5119ca Herbert Xu 2025-04-12  1060  int crypto_hash_digest(struct crypto_ahash *tfm, const u8 *data,
04bfa4c7d5119ca Herbert Xu 2025-04-12  1061  		       unsigned int len, u8 *out)
04bfa4c7d5119ca Herbert Xu 2025-04-12  1062  {
19da081a28c95fe Herbert Xu 2025-04-23  1063  	HASH_REQUEST_ON_STACK(req, crypto_ahash_fb(tfm));
04bfa4c7d5119ca Herbert Xu 2025-04-12  1064  	int err;
04bfa4c7d5119ca Herbert Xu 2025-04-12  1065  
04bfa4c7d5119ca Herbert Xu 2025-04-12  1066  	ahash_request_set_callback(req, 0, NULL, NULL);
04bfa4c7d5119ca Herbert Xu 2025-04-12  1067  	ahash_request_set_virt(req, data, out, len);
04bfa4c7d5119ca Herbert Xu 2025-04-12  1068  	err = crypto_ahash_digest(req);
04bfa4c7d5119ca Herbert Xu 2025-04-12  1069  
04bfa4c7d5119ca Herbert Xu 2025-04-12  1070  	ahash_request_zero(req);
04bfa4c7d5119ca Herbert Xu 2025-04-12  1071  
04bfa4c7d5119ca Herbert Xu 2025-04-12  1072  	return err;
04bfa4c7d5119ca Herbert Xu 2025-04-12 @1073  }
04bfa4c7d5119ca Herbert Xu 2025-04-12  1074  EXPORT_SYMBOL_GPL(crypto_hash_digest);
04bfa4c7d5119ca Herbert Xu 2025-04-12  1075  

:::::: The code at line 1073 was first introduced by commit
:::::: 04bfa4c7d5119ca38f8133bfdae7957a60c8b221 crypto: hash - Add HASH_REQUEST_ON_STACK

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
