Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F761EA7ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Feb 2025 21:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740088444; cv=none; b=pWvWoYUPi4n0zxHpaimJRyPBRLuN8LK1sD0MIlPr4UWAMSn7wWBbvf8FRzAAtB0E+EghodzbTukQRXJnCQIAV6LrPW4VtE9iDum7n7JdtNzjjejh9vl7+y9U50RIBzCMnLebHTfm0Wyf9nso6k2G93tkwyE081T75SXmvKunWis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740088444; c=relaxed/simple;
	bh=6ntMahr5TI3M37VSWSkqocqC97ozNNI38cQbZY/I9VQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUw3yMd3lmD3gJBMc8UNmZHj7qVdbY5eVqORngGatOgGstW2D8CsZW8sKjUxtCJpt6yqp45hPNt3chRwIOYPV+fn/+9BaDWCcGKogNohpGzNGdlR1XTL/8cSoLxhzZX/aB3T/bJ7/4avKoPLx+/MnGJ9JtpFFNFuxAwMtFMVAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mYZeuwwd; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mYZeuwwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740088442; x=1771624442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6ntMahr5TI3M37VSWSkqocqC97ozNNI38cQbZY/I9VQ=;
  b=mYZeuwwd6oUxaKvYz9vwjfazmcWx+3+4xf4BT30r0eOJa89jjr+ZzLaw
   f4bVZ/T6KaphQ+dNWGrQp4EXwTOEK1Ot+UBvtlfhy4jBJTcNCgPJfcYTC
   SIhJgbMRH7EXVvJTJFXlqnRG4PNP0p854gxEymf/XUKkh+z9+l7iqrNkJ
   Zt4g6itKNzgtaqhm8xrx5j9UBH7gpZGBm/yTBv6eOHwUfZYlcxSFmmAPV
   nh6TS/I7s8MSUNoSMHV1h+CwMXIK2BWNsiLx1AYSiVX2HhtxtrSLz+/KD
   KST1LPbC27wxl1rYRTBtlBhm38ZuS1mmzlshnUBgE8/OWJmS64/rEfzL5
   Q==;
X-CSE-ConnectionGUID: doP0ilb+TIOo1ktBudtemw==
X-CSE-MsgGUID: VBeZl/GRQNC8EEdCbuWueg==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="58301418"
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="58301418"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 13:54:01 -0800
X-CSE-ConnectionGUID: 7VWTnd/8RaGgPtC01FI0YA==
X-CSE-MsgGUID: vAf/iBs7QT+uxPYfT67Gkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; 
   d="scan'208";a="115712592"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2025 13:54:00 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlEUY-0004nV-20;
	Thu, 20 Feb 2025 21:53:58 +0000
Date: Fri, 21 Feb 2025 05:53:31 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:futex/scope 4/4] kernel/futex/core.c:118: warning:
 expecting prototype for futex_hash(). Prototype was for __futex_hash()
 instead
Message-ID: <202502210525.dS8zor1j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git futex/scope
head:   39534100fe613f467451202beacb7f4f39c4e403
commit: 39534100fe613f467451202beacb7f4f39c4e403 [4/4] futex: Create futex_hash() get/put class
config: arc-randconfig-002-20250221 (https://download.01.org/0day-ci/archive/20250221/202502210525.dS8zor1j-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502210525.dS8zor1j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502210525.dS8zor1j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/futex/core.c:118: warning: expecting prototype for futex_hash(). Prototype was for __futex_hash() instead


vim +118 kernel/futex/core.c

ab51fbab39d864 kernel/futex.c      Davidlohr Bueso 2015-06-29  109  
e8b61b3f2c5d3e kernel/futex.c      Thomas Gleixner 2016-06-01  110  /**
eee5a7bc96becd kernel/futex/core.c Peter Zijlstra  2021-09-23  111   * futex_hash - Return the hash bucket in the global hash
e8b61b3f2c5d3e kernel/futex.c      Thomas Gleixner 2016-06-01  112   * @key:	Pointer to the futex key for which the hash is calculated
e8b61b3f2c5d3e kernel/futex.c      Thomas Gleixner 2016-06-01  113   *
e8b61b3f2c5d3e kernel/futex.c      Thomas Gleixner 2016-06-01  114   * We hash on the keys returned from get_futex_key (see below) and return the
e8b61b3f2c5d3e kernel/futex.c      Thomas Gleixner 2016-06-01  115   * corresponding hash bucket in the global hash.
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  116   */
39534100fe613f kernel/futex/core.c Peter Zijlstra  2025-02-20  117  struct futex_hash_bucket *__futex_hash(union futex_key *key)
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16 @118  {
8d67743653dce5 kernel/futex.c      Thomas Gleixner 2020-03-08  119  	u32 hash = jhash2((u32 *)key, offsetof(typeof(*key), both.offset) / 4,
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  120  			  key->both.offset);
8d67743653dce5 kernel/futex.c      Thomas Gleixner 2020-03-08  121  
a52b89ebb6d449 kernel/futex.c      Davidlohr Bueso 2014-01-12  122  	return &futex_queues[hash & (futex_hashsize - 1)];
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  123  }
^1da177e4c3f41 kernel/futex.c      Linus Torvalds  2005-04-16  124  

:::::: The code at line 118 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
