Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352300;
	b=fg7l/Vez/EFm1evVsxWBS3KUicsLgKbIwPS84I7c0jls2SUn0MldfMmltBnJSO5fwCdn
	 yldi/QgvN+gCaj8PDJnWiccODMThI4ENjN3mAbqrsovPhvc/CFCv89v0SXxGd8xhfYPcD
	 2EAmV2i0DDmHZY7RHpSFbLnOh1P5YgcmCwfMAg5iqvcn87VaO09zsoZ7UUe7E6v/ms8DP
	 /hDAc4Tkmbc8ddVcvqk1TXjcXNILhd3DhdwS89U4/5eciM0+i9XhNa+6sih6OKcNpxWFC
	 7QPypgiBK3yhVa/qYd4Sg564cUmAIhT3Ba4apHAzzUdGRXtB6J9fWmrQUsDANxjUazw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352300;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=A/tIlDm0B8u1n4K7rgC90W01rNDlsQhpX7yccoT6f6M=;
	b=L0PkcUzNZrCuAECmAoOwv74UV4lbqTeCPLjvUXesQGRr8JgA9xA8GBMVcpaxrBQbG4un
	 +ly1Dvs1kTd0K3aBSb97odnYu6KMxOQE4wNwTCHvpFHVZ8OoBVNJt8SHcJRdrOlBP2v+G
	 7v6Vt6TnZLz6Wk+oomPfMKSX3lM0nC3AFB2ErKRB/XDOR8j9KxoFXbpv+9YjiaJmWelPq
	 seK7/BmclAcXOHwCtnLx5bnHSrLYL1UTKwVvemKfJmMTf/21Z/PLAZpz4g2K9a6HCG7jH
	 KZHmFu8s2MY5uODx/GxrP5x9/wK45wFNwtoO7swl64ZIOqK/2CRk/p/cuaQVLd5vIlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MWOP8EMy;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A38606A33D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 12:58:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49A38606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MWOP8EMy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795352300; x=1826888300;
  h=date:from:to:cc:subject:message-id;
  bh=eKxK2biAhVBPHK2/SdYr5JIplDKVddbieBhqpELiIs4=;
  b=MWOP8EMyZg2YoQgYrJCaRaLDjKnjR6ew4QKPwjvlvJY7hfYrbLHJdwxa
   2WCkik3T9GpFFYsUDNau8yhu0d+Sd/7jw0q5k5zEZLWJ7hzUjMOdPi7RC
   6SC+kbQdJjXCGbmN+or/yXiJHqBi9vQp3UiIh+OyPX9PlZ3CElrBL5p+3
   YfRsZ0MQzh6j5cutq5HTH+5Mav0Dd2yllY+l1IIt2oZG9y7vsUwvZ7Cve
   ft5AhIRS1PxtFR5jLLbJJnN1DpDIfcAA4OX7bZzKHcwrTmwoIo7dtVbeK
   MGVgDil4dmaLhBp0x5YZJiuvCYuIHghBIktngNhA/aK5XgInfV+oGXgAT
   w==;
X-CSE-ConnectionGUID: SXQpVxZ9QKqKewfjMwE/QA==
X-CSE-MsgGUID: bnm94ycIRYCCmpEVq5u32w==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4017891"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="4017891"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 04:58:20 -0800
X-CSE-ConnectionGUID: 2eO319uxQ7qdawfIS4ukPQ==
X-CSE-MsgGUID: 7egICxaYQXSX8pxYHS3Ljg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; 
   d="scan'208";a="10866137"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2026 04:58:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV795-000000004Ys-08LC;
	Sun, 22 Nov 2026 12:58:15 +0000
Date: Sun, 22 Nov 2026 13:57:21 +0100
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v4a 2/17] error: linking module flags 'Code
 Model': IDs have conflicting values: 'i32 2' from rust/helpers/helpers.bc,
 and 'i32 1' from llvm-link
Message-ID: <20261122135309.gX0UmS7C-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v4a
head:   936b93ce46aad771c9e7666fb9b9648156c2af4f
commit: da8b728fbf569baba8df914d3f2e5d47cfca1127 [2/17] x86: Use PIE codegen for the 64-bit KASLR kernel
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261122/20261122135309.gX0UmS7C-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122135309.gX0UmS7C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122135309.gX0UmS7C-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: linking module flags 'Code Model': IDs have conflicting values: 'i32 2' from rust/helpers/helpers.bc, and 'i32 1' from llvm-link
   make[3]: *** [rust/Makefile:799: rust/kernel.o] Error 1
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1423: prepare] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
