Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F34803EBF37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 09:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770889708; cv=none; b=H3q1Hpx0EGSfMzJya0o8JN0/xri5Y/L4Q/eLc8lHvXMGMrFQsxK/BReWpQGVkhY7Dl7AxyC74XU5dDCOUAc8Zz5qJSBuHdK87Vyqrsw3Ai7H/YP+u72R/hdeW1Pdm7gLFFL13Z8W7Y9+gTCVlG7YBDfBNzMFG5ZfRUdJq4DXero=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770889708; c=relaxed/simple;
	bh=tbTQ8/H5j3F0ODKgeqLLaWvN0BE0qEDNXyDAqsMJAWU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Tr78BSp9yhGn9ljfZZag8nnTRjt5S6w5mAhU5LUsXLNEk06HQuglE4R+pmOB+lZJWR8n5K++ScXOh9JJWUUDq1viFbXOz23e/+8xMiwnHlegSBHphT8BT4ZNF5m9Kg7sni6+juFyogc7UkTUKGySxS8rcQieIYskIkmeBQO3o40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqh27/lX; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqh27/lX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770889705; x=1802425705;
  h=date:from:to:cc:subject:message-id;
  bh=tbTQ8/H5j3F0ODKgeqLLaWvN0BE0qEDNXyDAqsMJAWU=;
  b=jqh27/lXH91+xNvFahK8UZPi1T9x/mbcI5VpvPSnnb81jNMhLtQS+9aY
   UTnVC4YIuPn6roLJKkV7+JMyiPui8SeFt51DNXgObnSYpXaA1SAzw539/
   3dlFCVTOULsUnfrKunXmCyc3IQd83hJDHbtqK1yBm5U/BigUpZHOUC5kv
   axXFLmH9bfbQE/6mtz4Ei0vhvLHAkYjXqJwRQq/ZyAVKLCVy2MynrPci6
   htDg1Yq8kaOiJaZ8zfp7NHQxjvPtQZLbYxu/NzhmSqGKBAUfcojtR+wEC
   pkrNh20+QvOt5EnqSL2nC79TSrzRl5sQjt2OfDp3eppzFTxqgJaQRu1S5
   w==;
X-CSE-ConnectionGUID: pTduMRFPRlOH9yILXD7ozA==
X-CSE-MsgGUID: ExXFCTdPSxaKKaaR2QNd9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="83427318"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="83427318"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2026 01:48:24 -0800
X-CSE-ConnectionGUID: LmoclPuKRGeyPxyaI3KAzQ==
X-CSE-MsgGUID: fSTyxiycSCSaTvCNCzryIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="211822088"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Feb 2026 01:48:22 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqTJ6-00000000r0y-1FXd;
	Thu, 12 Feb 2026 09:48:20 +0000
Date: Thu, 12 Feb 2026 17:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/urgent 1/1] include/linux/jiffies.h:449:36:
 sparse: sparse: cast truncates bits from constant value (7fffffffffffffff
 becomes ffffffff)
Message-ID: <202602121719.JsvIzXwu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   b777b5e09eabeefc6ba80f4296366a4742701103
commit: b777b5e09eabeefc6ba80f4296366a4742701103 [1/1] time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
config: x86_64-randconfig-123-20260212 (https://download.01.org/0day-ci/archive/20260212/202602121719.JsvIzXwu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602121719.JsvIzXwu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602121719.JsvIzXwu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/gt/intel_engine_cs.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, ...):
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)
>> include/linux/jiffies.h:449:36: sparse: sparse: cast truncates bits from constant value (7fffffffffffffff becomes ffffffff)

vim +449 include/linux/jiffies.h

   433	
   434	/*
   435	 * Convert various time units to each other:
   436	 */
   437	
   438	#if HZ <= MSEC_PER_SEC && !(MSEC_PER_SEC % HZ)
   439	/**
   440	 * jiffies_to_msecs - Convert jiffies to milliseconds
   441	 * @j: jiffies value
   442	 *
   443	 * This inline version takes care of HZ in {100,250,1000}.
   444	 *
   445	 * Return: milliseconds value
   446	 */
   447	static inline unsigned int jiffies_to_msecs(const unsigned long j)
   448	{
 > 449		return (MSEC_PER_SEC / HZ) * j;
   450	}
   451	#else
   452	unsigned int jiffies_to_msecs(const unsigned long j);
   453	#endif
   454	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
