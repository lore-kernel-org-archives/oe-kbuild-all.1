Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794017361;
	b=lIxbSuEd1q2G4sBXZtVnSa1bnYm3oY+wgjdtptBBwm18Dgxx2OcBs5Jm2SqDXKFkFe/n
	 TO9gekSqb7zHEsIWruthWgKl2cSdWsq9/O3ax0HUTGWoHftqz/ClYlyakmzwaHzvthDpe
	 8reJCZt4tLJZaMhlUtygIlMsnz/yKEMyXAu+PhTYIp3Exxsz+Cbr7mBp3I04PyDQPDbKy
	 Iz2cryM+ZSeI5Pas5tnr2rbi1N7D7FA7pLsEl0EL+n0hL3fdeohULjae30H10riR1o+gK
	 v8MUtiuiF2lZ7N2vKSwtu36edy/EMX0Rs4GAPlHrE/P1NBV8ucVT3pAb2iY/phLt3xQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794017361;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Xz3D+cDOGqyZrWygMA+m8+G8a8EMAncEKyX1NDNF978=;
	b=B028HzuAgFh+WoA3bPJjrlu2x1G2hSP3BHZ3WCjbQA00YASuXK3HN1MGgQw7axgvRRSv
	 vG9f63YoJJ5EociN8RKgX7kS33XnyVDEO1nXkjmgTTWPN9wXDvUNzw24R/o7Pu5Fu69wy
	 IFEzgNKgUb99MhATm6Zi78+SFEWm7D0MMkRAcS54Il7vnUTpsa0Jq2ya7cVcCzQoykk/8
	 2M0RHTkShiAW0drbPUP/DyVAg69c0iNHc04qAil/W/cArqX4HfXDqdARD4W4n0Mx8Etab
	 5mQlrGcPjPnQgY2gCrQmVbW+QL1g+UmNvg8ETiSoG6noTyqRp+oHmicvMmvNmvWSOFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD85606A326
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Nov 2026 02:09:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD85606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794017359; x=1825553359;
  h=date:from:to:cc:subject:message-id;
  bh=cFGmuYZRYWTBeBHhF3oZprM/3EiUHPtCmZkphLe7mIk=;
  b=jADpDldfj1ZhVM83ApEfj0AUConw+9JkwPJMhGWl6y025eilmK32Q/rG
   L4MlVVfhULMUwJgSSSTlH3CzwimzAmVhMiLk/om4DLIRaKUKSmytno8Vs
   EAzP42no/d2bs91vexbmLsW6o5g0AK3cnisgvtsgNPvpT8uHq/+wfK8q7
   fXAfQ4WLHyXhX/ETPhSNknCQkcsHUeVx33W2Zy6nyBJgyx/ApdRQKPfq9
   2StplSBDBtVrkiPFzPPy9BX9Ys4g+jOa/LX/8u1yCen6HVZIoAYHzW/pT
   nFKxJqbxhKwF+D/uxxXBpgKJhxBjit92vSKYud1/14iQXMb+qh04MML2y
   A==;
X-CSE-ConnectionGUID: /mqPryuRQVqU5kV7Z+aF0Q==
X-CSE-MsgGUID: tTzi8pTQSumGMNr7Sg1Ixw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2734985"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2734985"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 18:09:18 -0800
X-CSE-ConnectionGUID: GWCFEKLLR+S1S94L6MTwWA==
X-CSE-MsgGUID: 3iUzud6lQKqXQg8leTiayA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7405067"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 18:09:16 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPVrm-00000000AVX-1lFP;
	Sat, 07 Nov 2026 02:09:14 +0000
Date: Sat, 07 Nov 2026 03:08:22 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-12 1/1] error: mixing
 `-Zsanitizer` will cause an ABI mismatch in crate `build_error`
Message-ID: <202611070209.4nIUaUuV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-12
head:   4c5baa726f2eabc9d10bb4e49f59af88c8e94bd9
commit: 7a3b10805edc7e0a99a7a9d54e42797b4aac4f19 [1/1] FROMLIST: rust: kasan: add support for Software Tag-Based KASAN
config: arm64-randconfig-2002-20261107 (https://download.01.org/0day-ci/archive/20261107/202611070209.4nIUaUuV-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261107/202611070209.4nIUaUuV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611070209.4nIUaUuV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `build_error`
   --> rust/build_error.rs:3:1
   |
   3 | //! Build-time error.
   | ^
   |
   = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
   = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-hwaddress` in dependency `core`
   = help: set `-Zsanitizer=kernel-hwaddress` in this crate or unset `-Zsanitizer` in `core`
   = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error
--
>> error: mixing `-Zsanitizer` will cause an ABI mismatch in crate `build_error`
   --> rust/build_error.rs:3:1
   |
   3 | //! Build-time error.
   | ^
   |
   = help: the `-Zsanitizer` flag modifies the ABI so Rust crates compiled with different values of this flag cannot be used together safely
   = note: unset `-Zsanitizer` in this crate is incompatible with `-Zsanitizer=kernel-hwaddress` in dependency `compiler_builtins`
   = help: set `-Zsanitizer=kernel-hwaddress` in this crate or unset `-Zsanitizer` in `compiler_builtins`
   = help: if you are sure this will not cause problems, you may use `-Cunsafe-allow-abi-mismatch=sanitizer` to silence this error

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
