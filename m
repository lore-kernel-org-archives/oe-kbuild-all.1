Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B0AAB640
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 12:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765282959; cv=none; b=I6s8UfHja+cN/eu/09cUj9qtfV7q2bQEbakg5R3asig8b/cr0zCBLJdaVh4fuVSBQ3vtdtNiO/wfzGLWqkfJUJitEMx3m0sZZtsLM3WQAgiVXFm9hRXJsm1d8xljr4JRJoLph6yUaQ6u4MF/YzoaGE6Zq3qGLEw1ep1SR/wto1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765282959; c=relaxed/simple;
	bh=ZASJFkjBPo0Pwe6C6STGlpZQYjV6nIdE5cxFT+lrjpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pm2KnQB6P4YGkt8TsKnhYxdeW684L39wRvMRjssPUKtR7nklJDC9zkJWdeNyubpjyYe9/RUZsqpFdSYAMD+2PUjU3LRkqiEg/3QvfjbChDf7Xg9BGWuMHx+UZsSiXRA4P3FqrLHnsLR8qruLqpmAYZkW+27aVRRVTfCH8mUL2zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g45/VJvm; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g45/VJvm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765282958; x=1796818958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZASJFkjBPo0Pwe6C6STGlpZQYjV6nIdE5cxFT+lrjpA=;
  b=g45/VJvmJFNQoqR3wlGdI/JlDSS0C4mk3aJaguyN5HS0URahZZhYMnVJ
   GdXLeFMNa1x4jkjwknTAB0jbZc34nCS2zITltgiffrEA6JJtZ8NJg2zBJ
   bZdVNANIxb1qtzShMbiEIihHL059kR0K4wqBaie0cMRSTY5Tg/oRZrBLn
   V4H+aSq92WndbBPs3zrmgQinG7o27NFiPgfMPsmPLoqR0zS5bECelo7f4
   3Q3gP2rNyzxai5jn8qwcyaxNKHX/+WuzV35hwpPC1XHQPDkFTSTRiGy2X
   wRiBbujI4KkbXUQYC8Tlm9g4+mTHiAmWP80q1rJh7H1QjWdJ4HzBM38Q3
   g==;
X-CSE-ConnectionGUID: 2o3SdTG5TviX3A1ah+1K0g==
X-CSE-MsgGUID: DceD0OweQVa/FalTl7DxTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67273507"
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="67273507"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 04:19:53 -0800
X-CSE-ConnectionGUID: 1jGD9UxyS5yCe2jI8sAPNA==
X-CSE-MsgGUID: UxF0S+fvTVe4cqLbz2PDOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,261,1758610800"; 
   d="scan'208";a="201323138"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Dec 2025 04:19:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSwgn-000000001lR-1eD1;
	Tue, 09 Dec 2025 12:19:33 +0000
Date: Tue, 9 Dec 2025 20:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-nh-lib 10/20] lib/crypto/tests/nh_kunit.c:43:1:
 sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains
 embedded NUL byte"
Message-ID: <202512092004.2DF9dMkW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-nh-lib
head:   79bcfe8d44c5d06347eaa2b798a737d644573da2
commit: b98dc0c0c9c02baa8b7790f278dfacd4d3c6634f [10/20] lib/crypto: tests: Add KUnit tests for NH
config: sparc64-randconfig-r121-20251209 (https://download.01.org/0day-ci/archive/20251209/202512092004.2DF9dMkW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 6ec8c4351cfc1d0627d1633b02ea787bd29c77d8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512092004.2DF9dMkW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092004.2DF9dMkW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crypto/tests/nh_kunit.c:42:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/nh_kunit.c:42:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/tests/nh_kunit.c:43:1: sparse: sparse: bad integer constant expression
>> lib/crypto/tests/nh_kunit.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/crypto/tests/nh_kunit.c:43:1: sparse: sparse: bad integer constant expression
   lib/crypto/tests/nh_kunit.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +43 lib/crypto/tests/nh_kunit.c

    41	
    42	MODULE_DESCRIPTION("KUnit tests for NH");
  > 43	MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
