Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA950391E60
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Aug 2026 07:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786348668; cv=none; b=F9yCl09Pq+7XeYe69rEU09zsX5wrItW0x4LR445M2WZAmZ13yMq050zn5GL/Uabn/56lX3kQt5gX7tMS5NNzKKiodCVbBk+elTVn6zbQ7mPTMwnGbNTbW0agqRmXXQpTTkX5OCXLALATc2OdGR97Y/lQn5vOVPFHGUBJV7YDT/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786348668; c=relaxed/simple;
	bh=eTk8TlJGlUY1DIeimGOJfd/36Owbg0CRuT60R9SvAA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=o3PigbQG7LHoSBWVsXnHqECpd1ekowsv4dV4GbW2QEU/A004sdLGtK7xpz3taO7OV8vBxqljwM4ryoSL4k/vakyKspJBNH1oke4RTCySpZgtFfn7xTOxaUhqf6hSjpHdmBNZY0UJkcoNUiF65fSMnQRvEc7dxwD68v+y4jif0Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j9sZzSTS; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j9sZzSTS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786348667; x=1817884667;
  h=date:from:to:cc:subject:message-id;
  bh=eTk8TlJGlUY1DIeimGOJfd/36Owbg0CRuT60R9SvAA4=;
  b=j9sZzSTSm1fW52rq6AiNIYI3TwwNYtA3qeDUAIX+eLbDvINGbrIpYk8k
   a4b4wSP+a9jT+pf79yv7ZaAYsb2/kzpL+pIBKObJPp6IS1e085dCAqBao
   JmDwyTG6vA205jp9Dn/ZPj2dLJZ0Re1YaSVQrS7nf2J/BsE+FhoAkxzXm
   gRhwKCLA8a2wPPePN25ZXtsutliWynzoYBYEGwra82fXRK8WwkUYb/CR5
   fNs03ZwunOJGhVT/qw2/+3Kk6dCqbD0c5dzwUlHn5roVCIynLxDK/xo2E
   H7ugzyqWr36lKca+DyPQqNglxMpp99ZrOnewqQVn/S0e3499JGiHcqAnW
   g==;
X-CSE-ConnectionGUID: /bBvu/mcQFu7swuBIXJeQg==
X-CSE-MsgGUID: cYDhw5BHSLuJOZC+EzdayA==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="97453522"
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="97453522"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 00:57:44 -0700
X-CSE-ConnectionGUID: gxvDMJbnSQi8VE6jQCEfVw==
X-CSE-MsgGUID: zznlZI2GS6SwFHYVFImtOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,215,1779174000"; 
   d="scan'208";a="292891015"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Aug 2026 00:57:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtKtA-00000000N0i-2PVl;
	Mon, 10 Aug 2026 07:57:40 +0000
Date: Mon, 10 Aug 2026 15:56:47 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@kernel.org>
Subject: include/linux/jiffies.h:449:36: sparse: sparse: cast
 truncates bits from constant value (7fffffffffffffff becomes ffffffff)
Message-ID: <202608101544.nyBeQ2qT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: b777b5e09eabeefc6ba80f4296366a4742701103 time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
date:   6 months ago
config: x86_64-randconfig-r132-20260810 (https://download.01.org/0day-ci/archive/20260810/202608101544.nyBeQ2qT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608101544.nyBeQ2qT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b777b5e09eab ("time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608101544.nyBeQ2qT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/i915/gt/intel_engine_cs.c: note: in included file (through include/linux/ktime.h, include/linux/timer.h, include/linux/uprobes.h, include/linux/mm_types.h, ...):
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
