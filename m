Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1E27B324
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 05:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757136487; cv=none; b=IczGCzdsOOYlYvWWJMWGVuBzA/g8x5Ta0Y98KhXg6ZsHnNQw2oCpGx9nDONcSV8PTnli8HDJAl/++lQbRpFfOFU3C4A446bAGxDp87vuaIHfq9+5/KM68cKQMRqBjXJOFvahiUp+C03DtKbaw0x3m2wKqznnZstjnHvVHTtX9lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757136487; c=relaxed/simple;
	bh=1J6iaoqoPZzoarv+/G6lFiL5tZ3/TegJLsmeQbPXKFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rTbV5NbWeY/+GiisCFZATGjqHSijhXnelQ65O69BqPOsnkpYRvTfbkXFzMMoIMRL+v574AwNg+Ea98YG6Pgsp4jHPCT/hDtv5tR6QuMCcP+LEry7E52R5N0zRGsewxlvzFS6V2H1yXs48czAE696GKjGS7LsgBZD9WieLy/aXNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQZIm/tW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQZIm/tW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757136486; x=1788672486;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1J6iaoqoPZzoarv+/G6lFiL5tZ3/TegJLsmeQbPXKFk=;
  b=ZQZIm/tWhje6EX7nmtAXuP4kmNa+5Q4YenJCIFJoQpYc+1On5WWISUgq
   jP0kSw20Jfq9fXxB1Lz0whOc3UXjoxrqCSOU+AymmGgoG8NOSkx9BQVPw
   qSoLB+0VRV7oh+kOocwrnwDlM4pqVmOm7GPGoGNR5C5108OfeGTmodbGe
   5SxUwapya5n/dI9i0yV/0o5SHMSSRFndOIv2/freFGb41Zimdsh6JsGGZ
   znan8TM08II0/y9f5PPgl5xpyY/ia0IUTsC9gyIy2wPH6kMVLPWeYU0SN
   ICjmi++xPqQyqaQ7M+wgTcKGuwV5lj+mEMAsxBr4crN53T/aF8pS62Zw2
   A==;
X-CSE-ConnectionGUID: CmEFWVJ0TA2owvTFlhgTyA==
X-CSE-MsgGUID: ZaigQYfyR9qOMJye38Wtsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70859570"
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="70859570"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 22:28:05 -0700
X-CSE-ConnectionGUID: U/jsmg5oSZWciR88Cw6hiA==
X-CSE-MsgGUID: iXgAOen8QkCpTjjJ9BdWDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,243,1751266800"; 
   d="scan'208";a="195984907"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 05 Sep 2025 22:28:04 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uulSz-00048F-2o;
	Sat, 06 Sep 2025 05:28:01 +0000
Date: Sat, 6 Sep 2025 07:27:42 +0200
From: kernel test robot <lkp@intel.com>
To: Burak Emir <bqe@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Yury Norov <yury.norov@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: [linux-next:master 6481/6776] error[E0425]: cannot find function
 `owned_bitmap_out_of_bounds` in this scope
Message-ID: <202509060722.jHRZpdXO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5d4872e528796df9d7425f2bd9b3893eb3a42c
commit: 77adf2cc8d5d8229e3dd6094e325680ff5975230 [6481/6776] rust: add bitmap API.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250906/202509060722.jHRZpdXO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060722.jHRZpdXO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509060722.jHRZpdXO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error[E0425]: cannot find function `owned_bitmap_out_of_bounds` in this scope
   --> rust/kernel/bitmap.rs:469:1
   |
   469 | #[kunit_tests(rust_kernel_bitmap)]
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ not found in this scope
   |
   = note: this error originates in the attribute macro `kunit_tests` (in Nightly builds, run with -Z macro-backtrace for more info)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
