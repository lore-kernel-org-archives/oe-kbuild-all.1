Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795850659;
	b=yOOVN1QJE2qV8dJkPodIzDCWWdICfSLhP4fOkIk2Mn0MWQK7muk7xjumPtgC1B1Y5Ix/
	 BJHa1sXVKMVx9pHIphNyaedK/99XWx97Z72vj+8fI5qGl1LAi0Z2NBbfG/1DOInu6098C
	 Leo93oBwNYKq2cYBSk3gkxlUWW5C9Q+eh7NTv9f+91wqhR2Z6eX9AjP2NNmMVtZ+TlDOV
	 O+wDXdD3TbfF4Wh9Sk7uMjo3c8OYS3IZNAlX8MtLWVCIONcxxdW+INGte+syfmv9vmd7K
	 Atk7QFNJfpAfHaKLuhJOOpDnqojwjuKyZrKD5yWIGUT4GIb48ZuhKRpVAElcRcHTBkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795850659;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=cbaq6or59NNgMT9yhpl3zE/OgzZbZ3VkdSmtIgMqFOM=;
	b=sconCKqSO0EAaWNsbHsVHCOZ24cuf5dW3KDKknysDxv4pFjeB69mrDUyxrp89cT3+zr0
	 y4UZ5kwjALlSr2oLM+/Fgg8eMONAEIUoCkcDrmQLZW+bS/phZiRuWHJKasxKIFb3KUuCi
	 pYuB+H87ctth5TU3xwXJ9HVAPSjRYTbFqAhTfqJRgkPHTjlB5y01T1FJ0U71rnqfWVYr2
	 Di1nLpxTnEbyy4xOjkhW/svmrktzpLmPnx1Ct3fjjcZZqhcR0AlJbkagcSX792wUQXQlo
	 5aH3oFVILpDhMtS2k2BRMzyyBML2aYA6P6oJgvNsQzWqHbOjMohvWpU0CnN6B9qdCuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjnfL6SP;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BD4606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Nov 2026 07:24:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BD4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TjnfL6SP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795850658; x=1827386658;
  h=date:from:to:cc:subject:message-id;
  bh=6jMQVN/08DdoPHQdZU3Kw077DuogiKWlj1DRRdAcBC8=;
  b=TjnfL6SPoDqNuXAS3JZYvD2DvSO1bB3QA9mdVXDN5qcQ0gLyeeeQx0VX
   bD37qZBl9s+qmWUmrgFhiPiMIyg1hrjVQF44De/35B2hosvuG6qp9acq5
   bQUDhXTv8vX3nd2FsbYfrDQMUVoEf7sYnxSBBhGDmx1zR9C5QyuBGAB2X
   qUs+vXnD2MIh0aTZ4WYKhfvJwwA67vyDUnGrI5bswi7dGFUM2YlRsDP1K
   El0w+se0wlvU2J/r36eP/fvhgg64zYLYmnNRHAIQ0+FTO7qCR1JWrb3Hw
   LLb77ph9suaT9FycutBGruvfOy1xiFLc3WMhH3LAwtz/kcP4eeeMg/EXO
   w==;
X-CSE-ConnectionGUID: 5L3nTrYhT6iREKHHlBJFuw==
X-CSE-MsgGUID: 96jHDvl1SWqbvLfDVJR3pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4734966"
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="4734966"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 23:24:17 -0800
X-CSE-ConnectionGUID: y9KrxQBOSU6vsuBPMGAfkA==
X-CSE-MsgGUID: xVKtKGz4TJWxLx+RpYPlHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,238,1787036400"; 
   d="scan'208";a="12827279"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2026 23:24:16 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xXCn8-000000000XG-0Opo;
	Sat, 28 Nov 2026 07:24:14 +0000
Date: Sat, 28 Nov 2026 08:23:48 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes-gcm 52/60] lib/crypto/aes.c:1522:13:
 warning: 'aes_gcm_decrypt_arch' defined but not used
Message-ID: <20261128081511.5FCmncTg-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes-gcm
head:   582d64ea07ba0a2bebed6eee194d7328cbad617b
commit: c3ffe11001b2e3af97b557bbbcaf54b8c08e51fe [52/60] lib/crypto: aes-gcm: Add one-shot AES-GCM arch hooks
config: um-randconfig-2200-20261128 (https://download.01.org/0day-ci/archive/20261128/20261128081511.5FCmncTg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261128/20261128081511.5FCmncTg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261128081511.5FCmncTg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/crypto/aes.c:1522:13: warning: 'aes_gcm_decrypt_arch' defined but not used [-Wunused-function]
    1522 | static bool aes_gcm_decrypt_arch(u8 *dst, const u8 *src, size_t data_len,
         |             ^~~~~~~~~~~~~~~~~~~~
>> lib/crypto/aes.c:1513:13: warning: 'aes_gcm_encrypt_arch' defined but not used [-Wunused-function]
    1513 | static bool aes_gcm_encrypt_arch(u8 *dst, const u8 *src, size_t data_len,
         |             ^~~~~~~~~~~~~~~~~~~~


vim +/aes_gcm_decrypt_arch +1522 lib/crypto/aes.c

  1500	
  1501	/*
  1502	 * Hooks for optimized one-shot AES-GCM implementations, overridable by the
  1503	 * architecture.  They are called with ad_len <= AES_GCM_MAX_AD_LEN and
  1504	 * data_len <= AES_GCM_MAX_DATA_LEN.  Both in-place and out-of-place
  1505	 * en/decryption must be supported.  Returning false causes the incremental
  1506	 * implementation to be used instead.
  1507	 *
  1508	 * When aes_gcm_decrypt_arch() returns true, it sets *err to 0 if the
  1509	 * authentication tag is valid or -EBADMSG if it is invalid.  The caller clears
  1510	 * dst on error.
  1511	 */
  1512	#ifndef aes_gcm_encrypt_arch
> 1513	static bool aes_gcm_encrypt_arch(u8 *dst, const u8 *src, size_t data_len,
  1514					 u8 *authtag, const u8 *ad, size_t ad_len,
  1515					 const u8 nonce[12],
  1516					 const struct aes_gcm_key *key)
  1517	{
  1518		return false;
  1519	}
  1520	#endif
  1521	#ifndef aes_gcm_decrypt_arch
> 1522	static bool aes_gcm_decrypt_arch(u8 *dst, const u8 *src, size_t data_len,
  1523					 const u8 *authtag, const u8 *ad, size_t ad_len,
  1524					 const u8 nonce[12],
  1525					 const struct aes_gcm_key *key, int *err)
  1526	{
  1527		return false;
  1528	}
  1529	#endif
  1530	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
