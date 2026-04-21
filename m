Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D9B33F8BC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 19:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776801401; cv=none; b=EhBT4KVjR2wTukiUcIrB8HF2iTaAaOr0ZTNx+8biAsPghNRaYttjoJFVS/ChUKDeqzqMUg1w1EktBNT44lXo3/Uf/5bicRP686I07SjQLhQRbVy7wxEqbhbiFOLBrJ8xHqLUbASgK+e9b4wJxSFkqiCddP8ItN0ERvMvyV8f4Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776801401; c=relaxed/simple;
	bh=3zcaZEhP7RlMInMNY9D/VOGl2wIKmzuvAKYumjpp3Mo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GsaGwfJtq1w32DmSLF5wi1kbmyInllE9bzjDzl7LmkVgPgG1ClBwokVFXuvIN/PUsKtKv3eGr5dB7AAowTAZqlIDaSN5cVnK44UkJtvx3JSosBmztJ5SWwzhUuNyhEhhnsL7RKon88/UVH/a4FOH0pv+cT+Qtb5sb8FJzCRKjGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M5tn90em; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M5tn90em"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776801400; x=1808337400;
  h=date:from:to:cc:subject:message-id;
  bh=3zcaZEhP7RlMInMNY9D/VOGl2wIKmzuvAKYumjpp3Mo=;
  b=M5tn90emuLUqXiDbRWeUyeY3ekIhH5frSfkTgvQd7tqb5n3ZAv9Kb5IS
   co6juiVjkTMyJoqggvGjHkLgfRCmTFUPJz5sr+BqvTTEoIrBuygNME7iT
   9dhkd2B6sZtctbqLW7QIjRanKCSQrWwgsgQTK5XOjx7q8dtvppS/0Hqlp
   GyHF6pjQGKaf1wKIOjgN2VApRg+y7e//3Btx3jzFj2vXtN7Q/TCq4HtRL
   POU489jF136p5kJLBbD0j/JBrqf2arWrVfLp31d5Qe1MAFcSMYQgNmv6B
   sDAobosRYyllciArVURSST/1lZK5Vt/sQm0QGp4ZG5PhLgNmjDxCyvtsx
   Q==;
X-CSE-ConnectionGUID: 71VB2DEeT6+a6QBDrOGqiA==
X-CSE-MsgGUID: s1RbiicNRdCqTCL8oGPtvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="95161843"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="95161843"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 12:56:39 -0700
X-CSE-ConnectionGUID: w0v6pqLERCy2bH0U7529ug==
X-CSE-MsgGUID: 6udXWOWcT/Gp/Cr1hWJmcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="227794204"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Apr 2026 12:56:36 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFHD0-000000003v6-1WAj;
	Tue, 21 Apr 2026 19:56:34 +0000
Date: Wed, 22 Apr 2026 03:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/urgent 1/1] include/linux/jiffies.h:470:36:
 sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc
 becomes ffff0bdc)
Message-ID: <202604220307.zk9Kn0Gi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   4096fd0e8eaea13ebe5206700b33f49635ae18e5
commit: b777b5e09eabeefc6ba80f4296366a4742701103 [1/1] time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
config: alpha-randconfig-r121-20260421 (https://download.01.org/0day-ci/archive/20260422/202604220307.zk9Kn0Gi-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220307.zk9Kn0Gi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220307.zk9Kn0Gi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/firewire/core-card.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)
--
   drivers/firewire/core-transaction.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, ...):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (7fffffffffff0bdc becomes ffff0bdc)

vim +470 include/linux/jiffies.h

   454	
   455	#if !(USEC_PER_SEC % HZ)
   456	/**
   457	 * jiffies_to_usecs - Convert jiffies to microseconds
   458	 * @j: jiffies value
   459	 *
   460	 * Return: microseconds value
   461	 */
   462	static inline unsigned int jiffies_to_usecs(const unsigned long j)
   463	{
   464		/*
   465		 * Hz usually doesn't go much further MSEC_PER_SEC.
   466		 * jiffies_to_usecs() and usecs_to_jiffies() depend on that.
   467		 */
   468		BUILD_BUG_ON(HZ > USEC_PER_SEC);
   469	
 > 470		return (USEC_PER_SEC / HZ) * j;
   471	}
   472	#else
   473	unsigned int jiffies_to_usecs(const unsigned long j);
   474	#endif
   475	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
