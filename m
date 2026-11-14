Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670620;
	b=Qo+3KK5UYitF3o7y3OuTVmG7/0uWa+EdtBYvY3le8+zJqBHH+XNhUWhXv2AYmY8DXvyl
	 M3aZmuy6nTeAF11O7ZE+QCmExQknDIko8rqCHjl3GC/A36yW9bw5nub/1AVjIDyKrOunO
	 xtolWEL6FJKDrbBg//ClMqP992FSzzcMt7CKKT3MWlP8SuQx2M5hiov7w0JLwjrx0gpt4
	 wp4OA0a4wfR4NJ/76TAe4lb6dgjh4yNhEr0GO3Jllool86pF0/vv9sxY7tuzpjZMfgGoW
	 5Ogfa5+iGOZUuB491W2q3b4B8EqzdSReecVd+i44Nb++Dp+y3jffREld5DxyGO64RiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670620;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=8JqWHDpZYtMJZtVS/5jQcEkFL0wWcCW8b4Xb8R+ZCMM=;
	b=cEZvIKILNarxc2AwbgHEX1MvGNYRvzs+qz6JFIDrXsIjCFUEe2iVpaLetvMPw956qsEI
	 xzUhiy5hAf8bOoW/3sumCAjmkXxHn0BoWF+PMsUCwVy1WVnjW9OBc3pUyUgqf+csWuyWx
	 blBxpUEe1UGHT5WoQ8B0asdZOQOi4NSzRGs/QdiTVwlygBwEjxNaG+7/6AfJ4IlK8/VIJ
	 /uRSgjP/FKF/ziBbqb/0K2j8QYvCDfUcZnwLT7APXyrbIt/vYG/dGlnOK8Q3h9e6/8nPs
	 cv2BL48LVNebqZgO+Tec6xO4tFdNwSY+WkU/g8e/WNpsKvCXQELGT1+8tly5S64acnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lKiInMHX;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2127606A32E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Nov 2026 15:36:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2127606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lKiInMHX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794670620; x=1826206620;
  h=date:from:to:cc:subject:message-id;
  bh=rVBP7RJ+uGn64evQsNrxDuDRBpyLC0BqcE5X2qgpwYk=;
  b=lKiInMHXjnh1EUziQYb2fnBlizp9kxNFEPoyqojjZ72pDPc6WrC8A6dJ
   M9/E2nEdyAfwLeqbh9HKIBCzkXQdbJYpjjsykOnXLNrnQOyxVkBe0h3ry
   zs0P0MBtCpoEpikYGueoIUDSNWKJG3Qq2+RVXJ4N6K2rGdLDqlhr+AZc4
   I/dJo7V0kmajDhGWZyq8Zh9/Anp+/wl+wK9tqRvQV2avI1tFvMctS5WOL
   M2rumx28w4kJAf9MVP/OkK2f50/FgPa1dhzuUGtmIy4Lls1mK0XVeSa5K
   X48xfHOXZ9qrv9Xk/kVcDSATj4wdIrc/h6fLRu8L5zMJbYkz6ZQlVulv2
   A==;
X-CSE-ConnectionGUID: MR2l8bTsRduBXG8uY64fug==
X-CSE-MsgGUID: dmKztX6JR0GIruXUHNeYCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3448481"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3448481"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 07:37:00 -0800
X-CSE-ConnectionGUID: 0HBMz6tCS7itZ92XRFxJnw==
X-CSE-MsgGUID: ezno9Lt0SLqiYSlKpGxnMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9167075"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2026 07:36:58 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSFoF-000000001o7-0rU7;
	Sat, 14 Nov 2026 15:36:55 +0000
Date: Sat, 14 Nov 2026 16:36:12 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes-kunit 34/39]
 lib/crypto/tests/skcipher-test-template.h:121 skcipher_is_data_len_valid()
 warn: always true condition '(data_len >= 0) => (0-u32max >= 0)'
Message-ID: <202611141632.Ug6PX0ZG-lkp@intel.com>
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
config: arm-randconfig-2200-20261114 (https://download.01.org/0day-ci/archive/20261114/202611141632.Ug6PX0ZG-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611141632.Ug6PX0ZG-lkp@intel.com/

smatch warnings:
lib/crypto/tests/skcipher-test-template.h:121 skcipher_is_data_len_valid() warn: always true condition '(data_len >= 0) => (0-u32max >= 0)'
lib/crypto/tests/skcipher-test-template.h:401 skcipher_crypt_incrementally() warn: always true condition '(len - pos >= 2 * 0) => (0-u32max >= 0)'
lib/crypto/tests/skcipher-test-template.h:401 skcipher_crypt_incrementally() warn: always true condition '(len - pos >= 2 * 0) => (0-u32max >= 0)'

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
