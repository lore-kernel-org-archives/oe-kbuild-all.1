Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662456;
	b=sFrB8yS9nFwpdAenvmBLRL2Kd/JlvWq58zo+q6GoOv1yFGccCQRYG+SiHBRqUrDcQp0k
	 GMJo73CkPME7Fbm6goO0AQOVKMFn+RVJJ3ccstpl+da50BBFv1nnWQmniWNNKw+egVZFg
	 vZR3UXRIBtXdoooWUSZQIeJc92Iyqn4otd0aXgoOXDJ3HmtD70GUMzbwTXXLwAE1jyt3W
	 M9tCBkuWqUWfmkimmapteRUDAGvga9I3HZjBu1p7v8tbHwgJyY3E4nPGJxujR8oG1i407
	 UrHaG1h8zzTUKvcggTFE6GFP0Rt2dXU78LEsSgFC5eWSt6SMnwsra5XHjgXA64sQi5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662456;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=SKrGM/f0CNbMh6I2+ccSzhiirySyiyABiGX3064dddo=;
	b=0DbQDuo2OpzOEJZopCegWGl6Y0CbN/jjbMaVAnAJdLUetxqOtz7Bu6k8uxTRG9Mk/fgq
	 zzVq9ClASwmIDBaiXFbFXK8OjhPIbHUnACyeGGWyIFsti/1cViMy7KyHynxde1VJCUN73
	 Red/AqMY8WC6SNyg+az5oAeZfJasWEagNnbwZsHnLtGmstGqvQevz+x/dHsdSEayWiTQo
	 HIavnOW8Gr3xnDN9iotJBqWZ2+1EvJUNkh/NWZZs8Qh35yR+1RLSag7kZuzMHW+DmjH+A
	 I2vHlSJ3mtTY8dMClPhMDDegAMHEXca54MR2J8gltf0EY5tf1oS0+Ri36o+IMgd06fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iS886KWF;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14FE606A323
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 13:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14FE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iS886KWF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794662456; x=1826198456;
  h=date:from:to:cc:subject:message-id;
  bh=lZ1/6t4ui36C1FEqYvxchYU0cyCdhT8edsWwYBJ8fPA=;
  b=iS886KWFj0XBisgZxErAiQFE7vP3hrvi/ubqkj8q4GuZCmh9cgGrMiTF
   UlsJANmfUidKdqCiFo0jUB4rLLb2NoCaM5I6bpAH28lP3XaiK0tq1K+JA
   4hmMD9zrmP2mmLW+iZn3rwSAWQTt0QSaT0inuGnEF2rd5TjaJF7z2Dnu1
   8wyngDgzX6a2zPFQmoJS69Jiaxwd0MZ7lA6/TsUR/0ZvTOaALH1maFdyE
   Tas58duNb8XGYJFVQuli1Z0zXqhKDyg+pxTEuhJKuhkwlvRuW3WHL67MB
   Zex0cHcdBxtHKWgKnAjKxf869NS7eoj26eLdr/G+RrqXy7yOux542pVQc
   w==;
X-CSE-ConnectionGUID: lB8jyjzPRoGMOehhktlPdA==
X-CSE-MsgGUID: BJADvI4WQeSLqWLsGjFYJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3332668"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3332668"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 05:20:56 -0800
X-CSE-ConnectionGUID: IFXdFZXUT6Ci8wW3JZrsWw==
X-CSE-MsgGUID: 9qRGmlOFTjmm7zgGdjOoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="10868157"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 14 Nov 2026 05:20:54 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSDgZ-000000001bv-31o5;
	Sat, 14 Nov 2026 13:20:51 +0000
Date: Sat, 14 Nov 2026 14:20:44 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes-kunit 34/39]
 lib/crypto/tests/skcipher-test-template.h:121 skcipher_is_data_len_valid()
 warn: always true condition '(data_len >= 0) => (0-u64max >= 0)'
Message-ID: <202611141418.PyrWxUFQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes-kunit
head:   8b11b8571c3449ea78d09edcf244ea4ecbd7edc0
commit: 4ef260f71574dd5b7e19797ea983f4971fb9cf86 [34/39] lib/crypto: tests: Add KUnit test suite for AES-ECB
config: powerpc64-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141418.PyrWxUFQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141418.PyrWxUFQ-lkp@intel.com/

smatch warnings:
lib/crypto/tests/skcipher-test-template.h:121 skcipher_is_data_len_valid() warn: always true condition '(data_len >= 0) => (0-u64max >= 0)'
lib/crypto/tests/skcipher-test-template.h:401 skcipher_crypt_incrementally() warn: always true condition '(len - pos >= 2 * 0) => (0-u64max >= 0)'
lib/crypto/tests/skcipher-test-template.h:401 skcipher_crypt_incrementally() warn: always true condition '(len - pos >= 2 * 0) => (0-u64max >= 0)'

vim +121 lib/crypto/tests/skcipher-test-template.h

9128ac982a3045 Eric Biggers 2026-11-13  117  
9128ac982a3045 Eric Biggers 2026-11-13  118  /* Return true if data_len is a valid data length. */
9128ac982a3045 Eric Biggers 2026-11-13  119  static bool skcipher_is_data_len_valid(size_t data_len)
9128ac982a3045 Eric Biggers 2026-11-13  120  {
9128ac982a3045 Eric Biggers 2026-11-13 @121  	return data_len >= SKCIPHER_MIN_DATA_LEN &&
9128ac982a3045 Eric Biggers 2026-11-13  122  	       data_len % SKCIPHER_DATA_LEN_ALIGN == 0;
9128ac982a3045 Eric Biggers 2026-11-13  123  }
9128ac982a3045 Eric Biggers 2026-11-13  124  

:::::: The code at line 121 was first introduced by commit
:::::: 9128ac982a304590b728e4b77c1e5d118417021b lib/crypto: tests: Add skcipher-test-template.h and gen-skcipher-testvecs.py

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
