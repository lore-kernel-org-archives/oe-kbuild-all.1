Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA8B2063EF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740220814; cv=none; b=Ovqet/qVwVE1VfZQKThPK3oqqsU5mmrxfs7y+WfXbEUlAcL7hcj5cUObFl2PdJpRLUWVVq8JY+YcKynAAWxdVSVx2i+XDD7ZgWNi4SR+i5ox6k6M37vgSO4FWWT9xnYIvs2GjS6vip5OxKR3/KC+MK7HmMoJKQaNrwLXVRcQzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740220814; c=relaxed/simple;
	bh=g59C/ve4vi0qfA68hGXasRqE3B1uzAfyX1l/gNiD0ro=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uME4KZGh21dNJKWM7w6JUmJ00UsE5AbpVO25MsvVu4qebnftB2nAEbQof7zyCtoQQZXKH/XgpLY37zJlozYH2xFv+IWqdumm9FTXYqV/3EVHeGKewPy0iXHgHxfqrRUmqxSCTgVe7xjkTiIrmgkeNnW1lImo7nFdZn29BZdmktw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G57HYB//; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G57HYB//"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740220812; x=1771756812;
  h=date:from:cc:subject:message-id:mime-version;
  bh=g59C/ve4vi0qfA68hGXasRqE3B1uzAfyX1l/gNiD0ro=;
  b=G57HYB//pN4JHYgQUMY1iiFiZc0yq+fTS/DhLcsVeVk9X5HerAwy2toR
   Vb5wLWIrANNNBZjICHt7UcTIdk6oNcLSFn8ap0JtG4l7wsB3xVIevkHat
   5nb/l2RzRoCRr6emgS/iblY5LBLYuOhvPs5XmFUdBjCf4RBqNKO0MoDWW
   HHcAmz3zhP/rqgnJDQYn35ai8hDzSmyb4jG2oy7D0RJIGFHaqBkrJ52VP
   LFOdnB3WX2oXLtV2RlJ8sfy1ujte64ReaUOR6IpljIo+AgnvHcEwL3pIT
   GtWAre7wxsYa+jZN08uDo6hq0h3Sijt9zMjWrjHBFotT/GIfufLCoeB3/
   Q==;
X-CSE-ConnectionGUID: XY56b1nWT4Cbtmvs4fFaRA==
X-CSE-MsgGUID: YavsoFYRQD2wPAgLbJNjtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="40953908"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="40953908"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 02:40:11 -0800
X-CSE-ConnectionGUID: qegFo0aTRr6HMe8F5avEyQ==
X-CSE-MsgGUID: UFTHLN94QhWveXfqE1od5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115431118"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2025 02:40:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlmvY-0006UR-1y
	for oe-kbuild-all@lists.linux.dev;
	Sat, 22 Feb 2025 10:40:08 +0000
Date: Sat, 22 Feb 2025 18:39:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/dovetail-xenomai 5/5]
 arch/x86/kernel/apic/apic.c:2157: warning: Function parameter or struct
 member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ_PIPELINED'
Message-ID: <202502221853.XJ36Cmwm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.12/dovetail-xenomai
head:   96c9aceb59d0ff2f4ac73415eeee24969ba6fa8f
commit: 0261c1973ea02eb7a596dda743b1c1a212662aa2 [5/5] x86: irq_pipeline: add IRQ pipeline core
config: i386-buildonly-randconfig-004-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221853.XJ36Cmwm-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221853.XJ36Cmwm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221853.XJ36Cmwm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/apic/apic.c:2157: warning: Function parameter or struct member 'spurious_interrupt' not described in 'DEFINE_IDTENTRY_IRQ_PIPELINED'
>> arch/x86/kernel/apic/apic.c:2157: warning: expecting prototype for spurious_interrupt(). Prototype was for DEFINE_IDTENTRY_IRQ_PIPELINED() instead


vim +2157 arch/x86/kernel/apic/apic.c

c4d58cbd158dc9 arch/x86/kernel/apic_64.c   Thomas Gleixner 2007-10-12  2146  
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2147  /**
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2148   * spurious_interrupt - Catch all for interrupts raised on unused vectors
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2149   * @regs:	Pointer to pt_regs on stack
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2150   * @vector:	The vector number
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2151   *
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2152   * This is invoked from ASM entry code to catch all interrupts which
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2153   * trigger on an entry which is routed to the common_spurious idtentry
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2154   * point.
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2155   */
0261c1973ea02e arch/x86/kernel/apic/apic.c Philippe Gerum  2019-04-24  2156  DEFINE_IDTENTRY_IRQ_PIPELINED(spurious_interrupt)
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10 @2157  {
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2158  	handle_spurious_interrupt(vector);
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2159  }
3c5e0267ec3e6e arch/x86/kernel/apic/apic.c Thomas Gleixner 2021-02-10  2160  

:::::: The code at line 2157 was first introduced by commit
:::::: 3c5e0267ec3e6ed7d3f1793273cbf0beb4f86a74 x86/apic: Split out spurious handling code

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
