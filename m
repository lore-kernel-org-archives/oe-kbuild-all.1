Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8083019A6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 May 2026 03:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779940091; cv=none; b=evsN9mPI3TtAcLpqKmTuoNJkSJ1tosxDi7hNT9yAN9PXjlgNToByRunKcuAnA16n2I5+Gk7EvdBfBfo3AZMHXSNFAjhGo9L3OneKrVfRswgv9s4VN5vJ7TlL2odzj00GINakUF/gnJoQ6QNclLLumVsNyn8DJNPRJzMzLnkdMpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779940091; c=relaxed/simple;
	bh=a6aIVCvIxsar6O/Fzz8Ro1JvmFl56Zl4LAXvGW8tjJ8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E0G65OgapkBhAPjDozgXPZTE+ip4yAE5JQVbVBmTnRo1AiDqyIvZJstIHUlDcFA7C5v52nu166r4dZWwJ1jrNWxCEyWIHyxh3HaYqlwSn1Eyv/FtrU6ZGKUba8BB9A3RwSrCbgHI+nqqwSxXW9tznUJxIsXXmtOezi4G860sHQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IRu6izU2; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IRu6izU2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779940089; x=1811476089;
  h=date:from:to:cc:subject:message-id;
  bh=a6aIVCvIxsar6O/Fzz8Ro1JvmFl56Zl4LAXvGW8tjJ8=;
  b=IRu6izU2ZplOGkCURPLtomEwmr43BgVsgYGNV/5gRNDYlKuM+mLrGbAw
   SYnnV0Ake+KAIDrXNb66PgW3O6kELoe9QwvDTnUEQKbP+jzYiNx8EkerQ
   9GRQ5tpFVoRnI9Ok8ys/tjyXHudXsEE7PlylpQ5lxf0m5TDSFQdJ/8XCV
   gN942D79ct/oPRgU/giNQL9/ZoFy7wj+DGrvOaWFd3/TOQ4ZxDP4q85Sa
   a7fUkM7fVwtgnSOIBm/+4olyZRhzVyzniZIMeKsjiyoymkRqXp/yrR5Wo
   eSLCOfOm6zJPatqNwQpK1yKnIrcN8lTw4Pd+689CydvmILDm5sDFeu/q/
   g==;
X-CSE-ConnectionGUID: rpvtLhD1QPGZghDXfA906A==
X-CSE-MsgGUID: 0hZboKg3Q3OYXASSE8FIEQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11799"; a="91352965"
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="91352965"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 20:48:08 -0700
X-CSE-ConnectionGUID: B6ldrL7jQZmEmw9FGC5gOQ==
X-CSE-MsgGUID: t1mYmtC5STSMBIOVblttGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,172,1774335600"; 
   d="scan'208";a="246710947"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 May 2026 20:48:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wSRj2-000000000H9-3TLh;
	Thu, 28 May 2026 03:48:04 +0000
Date: Thu, 28 May 2026 05:48:03 +0200
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:ffclock 10/10] ./include/linux/ktime.h:39:undefined
 reference to `ntp_get_status'
Message-ID: <202605280501.XQYRHERN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b
commit: 0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b [10/10] kernel/time: Add /dev/vmclock_host miscdev
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605280501.XQYRHERN-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605280501.XQYRHERN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605280501.XQYRHERN-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-gnu-ld: kernel/time/timekeeping.o: in function `tk_set_wall_to_mono':
>> ./include/linux/ktime.h:39:(.text+0x9da): undefined reference to `ntp_get_status'
>> riscv64-linux-gnu-ld: ./include/linux/ktime.h:39:(.text+0x9e6): undefined reference to `ntp_get_time_state'


vim +39 ./include/linux/ktime.h

97fc79f97b1111 Thomas Gleixner 2006-01-09  28  
97fc79f97b1111 Thomas Gleixner 2006-01-09  29  /**
97fc79f97b1111 Thomas Gleixner 2006-01-09  30   * ktime_set - Set a ktime_t variable from a seconds/nanoseconds value
97fc79f97b1111 Thomas Gleixner 2006-01-09  31   * @secs:	seconds to set
97fc79f97b1111 Thomas Gleixner 2006-01-09  32   * @nsecs:	nanoseconds to set
97fc79f97b1111 Thomas Gleixner 2006-01-09  33   *
36019265cf81cd Yacine Belkadi  2013-07-24  34   * Return: The ktime_t representation of the value.
97fc79f97b1111 Thomas Gleixner 2006-01-09  35   */
b17b20d70dcbe4 John Stultz     2014-07-16  36  static inline ktime_t ktime_set(const s64 secs, const unsigned long nsecs)
97fc79f97b1111 Thomas Gleixner 2006-01-09  37  {
96dd7421a06a5b Thomas Gleixner 2006-09-06  38  	if (unlikely(secs >= KTIME_SEC_MAX))
2456e855354415 Thomas Gleixner 2016-12-25 @39  		return KTIME_MAX;
b17b20d70dcbe4 John Stultz     2014-07-16  40  
2456e855354415 Thomas Gleixner 2016-12-25  41  	return secs * NSEC_PER_SEC + (s64)nsecs;
97fc79f97b1111 Thomas Gleixner 2006-01-09  42  }
97fc79f97b1111 Thomas Gleixner 2006-01-09  43  

:::::: The code at line 39 was first introduced by commit
:::::: 2456e855354415bfaeb7badaa14e11b3e02c8466 ktime: Get rid of the union

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
