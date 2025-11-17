Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D877D3093AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Nov 2025 20:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763412953; cv=none; b=bBDvcTg/aY4kNRosU5dnn/WuaWE1F8VYEXKoxVR8HkSbQDqwIPkXe3kwq1AXz4uZ9290oM0X9clZ9b0YIAWjBoBmbI8EKAVOVnXw8KZwwP4m8mSYYxeg6XKD2D5NZUOYPTCo8x8a2ijz1N0UWhfe28pHab+39jCl54++rf7B4T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763412953; c=relaxed/simple;
	bh=A1fgrstrIRQY7NJsz2A67EleNBalW9/LCYdOV3szxzs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IX/2yicoA2zBYUUg9Wd+3HGxMapfUAZmnYOMNfRKrLofsO1PE6HH9dwvR6LdgYHfZBWpWstHluzYG9nT0gLbAR2Yo9KwN00YgIsr+5X++Hrp3vniqzDG8B40N+WnE1I7b5dMNL9MylUhSMmvKORUeRQ9P9+1pM6GkJGfqcmcmzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZDWAsF8z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZDWAsF8z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763412952; x=1794948952;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A1fgrstrIRQY7NJsz2A67EleNBalW9/LCYdOV3szxzs=;
  b=ZDWAsF8zZhaSgZEjqy1t15Bmsn+bTBUHI3eG++a/NPyGkFYjED9C8gAG
   KsturXwqd3oOSsF/vKrZW4iAJvnCHQR5fIC/ItQgA/K6WyHNydtwm68Hh
   IFEfUyK+pAongtgzeHtVDDB9IEBWEybfueqZGRpy2YIX+RjuoRYSTDbif
   /Ytpf0xC/qSHG/MVwQ88+nfHxBctZ5S30d6Hu73VdTJ5Yj7ckB9rlMacZ
   IiQ8SccH/oJ2hzvMV5n7A9JsA1IwjmhjD7d0fa5nt6cqtSBhaX24G65Xr
   F25uS8qLAjuuYdiLclRBzsm4Ibr3hgmUkKm577leD4Ujc4O2dbgxDzG4o
   A==;
X-CSE-ConnectionGUID: W1ZFxZquTceUHilYJPXlqw==
X-CSE-MsgGUID: pCBYPXeqTtOYZxnc6VXwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="75744595"
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="75744595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 12:55:51 -0800
X-CSE-ConnectionGUID: FbUpOaZsRkmS5BOL4QbRZg==
X-CSE-MsgGUID: h3uajQhkTYKV6Me5qwfQGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,312,1754982000"; 
   d="scan'208";a="189825886"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Nov 2025 12:55:51 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vL6GK-00013s-0x;
	Mon, 17 Nov 2025 20:55:48 +0000
Date: Tue, 18 Nov 2025 04:55:06 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:keys-pqc 6/9]
 lib/crypto/tests/mldsa_kunit.c:84:undefined reference to `mldsa_87_verify'
Message-ID: <202511180425.HmUlC007-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   e298b80f8063fcbc335870ff3f1d59dae4d5116a
commit: 063e7379ca52344edf2253e59d40970d3f528803 [6/9] crypto: Add ML-DSA-87 pure rejection test vectors as a kunit test
config: sparc-randconfig-r072-20251118 (https://download.01.org/0day-ci/archive/20251118/202511180425.HmUlC007-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251118/202511180425.HmUlC007-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511180425.HmUlC007-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: lib/crypto/tests/mldsa_kunit.o: in function `dilithium_87_kunit_test':
>> lib/crypto/tests/mldsa_kunit.c:84:(.text+0x48): undefined reference to `mldsa_87_verify'
   sparc-linux-ld: lib/crypto/tests/mldsa_kunit.o: in function `dilithium_65_kunit_test':
   lib/crypto/tests/mldsa_kunit.c:68:(.text+0x134): undefined reference to `mldsa_65_verify'
   sparc-linux-ld: lib/crypto/tests/mldsa_kunit.o: in function `dilithium_44_kunit_test':
   lib/crypto/tests/mldsa_kunit.c:52:(.text+0x204): undefined reference to `mldsa_44_verify'


vim +84 lib/crypto/tests/mldsa_kunit.c

    76	
    77	static void dilithium_87_kunit_test(struct kunit *test)
    78	{
    79		const struct dilithium_testvector *tc = dilithium_87_testvectors;
    80		int count = ARRAY_SIZE(dilithium_87_testvectors);
    81		int ret;
    82	
    83		for (int index = 0; index < count; index++) {
  > 84			ret = mldsa_87_verify(tc->pk, tc->pk_len,
    85					      tc->msg, tc->msg_len,
    86					      tc->sig, tc->sig_len);
    87			KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Verify failed");
    88		}
    89	
    90		KUNIT_SUCCEED(test);
    91	}
    92	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
