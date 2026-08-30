Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095CD35C6AD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788098025; cv=none; b=sD8tr0SUf6zqTKlzx2jn8TI4HxcXvWUXt1YSe6H923pZUOsNj2uWEYHGH9rC5YM23NEPI2iCvtKVFHYnduKHmL6rxlArjVksRKMyRsZXAJ2j0wBagMzEESXCINGSWhw76uPzozEjTW1DIcRnEY1isxgFThG/5Y9xTKeBS4Clwj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788098025; c=relaxed/simple;
	bh=Z9+rpAvl/CKY1J7GpYAAi/Lgwc4otRg+QDamNznhYbo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b8YBP5WslD4rhdN4O6bdxvKXmGHmI2biHCDx7rThCMsgV+Lhtj53n0xehLdkwosMP00+qEtoNwxqunP7VqcemMNzcaHwMIyZDtTe6Atqa3IG4OvZ0+r58//8qota8jMSIInLAN9yI9tdSA5gXDFKSOZHfbfwNThmFjCedlHavbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MKgim+l7; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MKgim+l7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788098022; x=1819634022;
  h=date:from:to:cc:subject:message-id;
  bh=Z9+rpAvl/CKY1J7GpYAAi/Lgwc4otRg+QDamNznhYbo=;
  b=MKgim+l7P9T4DyVGTzfnvsjWfyWFAkj1Z56dBL/zcA+RyYIEPKjI0oYu
   Y9UiZrvo27pqs4oPCzWwzXiQjTwYAPGqycQ+1joyIAdBVAPoCac/caaD6
   ixDgHNF/eVIkaez4bfjuVBXiFKLEYef08y2dALzSxW3nR0iy4PHojBLyY
   bymd3DimIycB31y+41oi1hYIT3tQ6BBhZtAAE9/okHSA/VjnDaZyu9czO
   rDkjxNntjY0IQhndU/tJleenAPcGDKDIZHJlk5MZoiBtR3wffPhjz7BBl
   E3Imlhp+l7ceDqSQYIBZqvFyoB8NwopxkUMOc2ODRHZEAAa4ONGn8+YsM
   A==;
X-CSE-ConnectionGUID: JC7KXvvpSDyxNin+g6oZtA==
X-CSE-MsgGUID: VMUBlr3jSfeIW9aXLgTlcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="111300822"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="111300822"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 06:53:42 -0700
X-CSE-ConnectionGUID: gEslR6LSQNWT4pIQrdomQw==
X-CSE-MsgGUID: 5JGix+eyS6ye4a9081Y1XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="306816499"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Aug 2026 06:53:40 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0fyb-00000000Dvo-1nou;
	Sun, 30 Aug 2026 13:53:37 +0000
Date: Sun, 30 Aug 2026 21:53:19 +0800
From: kernel test robot <lkp@intel.com>
To: Boqun Feng <boqun@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Thomas Gleixner <tglx@kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
Subject: [tglx-devel:irqflags 2/20]
 kernel/irq/refcount_interrupt_test.c:7:10: fatal error: linux/interrupt_rc.h:
 No such file or directory
Message-ID: <202608302124.IEDiQ3Ae-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: 80deadb1a815addda89fa7d485109a13b4a851a7 [2/20] Revert: irq,spin_lock: Add counted interrupt disabling/enabling
config: x86_64-buildonly-randconfig-002-20260830 (https://download.01.org/0day-ci/archive/20260830/202608302124.IEDiQ3Ae-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608302124.IEDiQ3Ae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608302124.IEDiQ3Ae-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/refcount_interrupt_test.c:7:10: fatal error: linux/interrupt_rc.h: No such file or directory
       7 | #include <linux/interrupt_rc.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +7 kernel/irq/refcount_interrupt_test.c

07a88e2bcd5b5b Lyude Paul 2026-08-04 @7  #include <linux/interrupt_rc.h>
07a88e2bcd5b5b Lyude Paul 2026-08-04  8  

:::::: The code at line 7 was first introduced by commit
:::::: 07a88e2bcd5b5bd7881b2e12b6aad1897a7ee1de irq: Add KUnit test for refcounted interrupt enable/disable

:::::: TO: Lyude Paul <lyude@redhat.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
