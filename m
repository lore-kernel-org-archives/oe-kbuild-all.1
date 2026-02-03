Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4AB3563DD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Feb 2026 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770125235; cv=none; b=BxSJO0CnY2YlAmYljZKf284nd6KL2dZJSkDTnahAZmAUVkRXCRaykVkZDnjptebZMID0Kv6/TIIn99Xgo4bgY6o4Ii/JNwtv0Axwwo39d+u+8YsidVyDgXUOaTcg6E4kSLjei2edMScXq5ivDwwd3A3ac1b1aKtm4stO/RKJI7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770125235; c=relaxed/simple;
	bh=c0hRfH3zuVOAhZwdo7flvApPVdi6LhD5vpmZvLpqVow=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z3O5tbkU8vJE7WqVANf5YOwZMCBx2GdPN0cuxnFFTW/UOOQ3MJsCBuIjvPw9DZGjg26CiTSE3zU7rYv2V7TAzvrT3ki7Ru+fKmG55QASb/w/ZYdRd16ygYVKVlETfpWfADZCRettahfnamp1HGaRRY+jTWtRId9CxEAkn+EAiQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KvRzkB73; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KvRzkB73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770125234; x=1801661234;
  h=date:from:to:cc:subject:message-id;
  bh=c0hRfH3zuVOAhZwdo7flvApPVdi6LhD5vpmZvLpqVow=;
  b=KvRzkB73J7puJkXET+KGAzvsEB7xmwBCCQK1WKGGYeMSi5g8T6XqB2Vg
   0mpkrWY4BjTPb78dmsUavdmW4zC/ok8xusDfIR32gIbin5Ie5ET0lfKT5
   RBQ6ZdnugnWZM8A770qSpWg9QWT5c77WJqV9qca5oXPBMUTlTVgabpQJu
   4N6CwN0R5DLCiRXo+SQOQnQK+u9RaWCdiljDNPxXZtNawjR+7xkXbE1wp
   9i2YvLnsdTpCKur9LhojQUzBCBhY/yR8KN5X4Xw9b8m6ukMQahfoFmIQw
   5KTxWzr56MgGHcdjODqjj/DllRswvYr5MpNx+uwit2Y4PvRUVjo5Z/MXI
   g==;
X-CSE-ConnectionGUID: juRWIhuaQFO7xD+kTgxy3g==
X-CSE-MsgGUID: 7fEzHf6PQdWttUb2/3TR+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="71456426"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="71456426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 05:27:14 -0800
X-CSE-ConnectionGUID: 6GUimdMzSBewFJbpgosSVQ==
X-CSE-MsgGUID: VhNUQpXTTYCVNgT6kFXZpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209561205"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 03 Feb 2026 05:27:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnGQv-00000000ggw-1qTO;
	Tue, 03 Feb 2026 13:27:09 +0000
Date: Tue, 03 Feb 2026 21:26:20 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Peter Zijlstra <peterz@infradead.org>
Subject: [tip:locking/core 27/43] ld.lld: error: undefined symbol:
 _raw_write_trylock
Message-ID: <202602032101.dbxRfsWO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   451c3a0356099483218535aed17fcf94ab5764a3
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/43] compiler-context-analysis: Remove __cond_lock() function-like helper
config: s390-randconfig-r051-20260203 (https://download.01.org/0day-ci/archive/20260203/202602032101.dbxRfsWO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032101.dbxRfsWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602032101.dbxRfsWO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: _raw_write_trylock
   >>> referenced by rwlock_api_smp.h:48 (include/linux/rwlock_api_smp.h:48)
   >>>               lib/test_context-analysis.o:(test_write_trylock_extra) in archive vmlinux.a
   >>> referenced by rwlock_api_smp.h:48 (include/linux/rwlock_api_smp.h:48)
   >>>               lib/test_context-analysis.o:(test_write_trylock_extra) in archive vmlinux.a

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for CAN_DEV
   Depends on [n]: NETDEVICES [=n] && CAN [=y]
   Selected by [y]:
   - CAN [=y] && NET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
