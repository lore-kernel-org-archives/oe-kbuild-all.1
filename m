Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8397D13C9C4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 04:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776658054; cv=none; b=kdezcMCJ+zeqNQz14X1JhSDYnKIrsFT/VS3ta/KZbeW1ddRfutpIaT9qYztIPb1Myne9ITGf5vsTavnxJ7QwlkwpZ9NQbtluXOX8BZHc6Lnz7CZBcUhI1j/S4NaUUGrPaXjLi2wLArec856BtMT1saqgnubMd5h5TcOzyQuwZkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776658054; c=relaxed/simple;
	bh=40+ol1dKJASWEYzYaaEXFH//wAigA5nKbTtyd/hm96k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uu5zcKtRzxUDRljDzLBcCbMXLLeY3K1HCeA8EtIA32jQo+Iqz6RprnxkO3Nb7T5qHSMOTuKUFLLC4ejXciUsadJpjuCs5xymTQMWHlOc4osOhRqvupGY0HHW1tAMPJXJ3GBpW7IFFJJz7rFAXksv+bXhL11n4YbK+GGCGgVaNXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lwrc7nEm; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lwrc7nEm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776658052; x=1808194052;
  h=date:from:to:cc:subject:message-id;
  bh=40+ol1dKJASWEYzYaaEXFH//wAigA5nKbTtyd/hm96k=;
  b=Lwrc7nEma6Fn3Ink55+FMWhxcNXGEa+y5ZQKpkIYbWhFczUwmG7F0tek
   cHnkjoC1rZ4i2t4cVYeTEcUmBhCsP45VjXPPdxD7tl098FCZSel1/Uhcf
   Zx3IHuMHyyKH/L//WBYpetm24XqUn+kcSR4DcMZwH0QWXnGr3GpXtVOrA
   T9MLT4bNAHsDbWWp/WAXkvGLblKPHN7zLvvOuf07MsZTUXpzhY1W7R1Ng
   O6AQ/ra3PQ5i1mMZH4AWY8cXMCWBOK314xSnml4/RsqX1cdzHntPYVYqm
   BhJPLkJs1n4tivF+q1SPNjrT5ThUsgJmZBTqF0yH6URw8UGfUC57zHb66
   Q==;
X-CSE-ConnectionGUID: 1aaI+4+/TIWKZ8b3MdXZAA==
X-CSE-MsgGUID: mLQo3dhLQgC+GdtcuPB6aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="95129806"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="95129806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2026 21:07:31 -0700
X-CSE-ConnectionGUID: qDg7zUbgRZqXcgJBW28yQQ==
X-CSE-MsgGUID: yWmoX9RgTlmEVXMI6P1JKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; 
   d="scan'208";a="261989846"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 19 Apr 2026 21:07:30 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wEfuw-0000000029I-3Z1w;
	Mon, 20 Apr 2026 04:07:26 +0000
Date: Mon, 20 Apr 2026 12:06:37 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:timers/urgent 1/1] include/linux/jiffies.h:470:36:
 sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee
 becomes ffff85ee)
Message-ID: <202604201201.swsxm1zW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/urgent
head:   4096fd0e8eaea13ebe5206700b33f49635ae18e5
commit: b777b5e09eabeefc6ba80f4296366a4742701103 [1/1] time/jiffies: Inline jiffies_to_msecs() and jiffies_to_usecs()
config: alpha-randconfig-r131-20260419 (https://download.01.org/0day-ci/archive/20260420/202604201201.swsxm1zW-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260420/202604201201.swsxm1zW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604201201.swsxm1zW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_i2c.c: note: in included file (through include/linux/delay.h):
>> include/linux/jiffies.h:470:36: sparse: sparse: cast truncates bits from constant value (3fffffffffff85ee becomes ffff85ee)

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
