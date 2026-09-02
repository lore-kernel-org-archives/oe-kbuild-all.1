Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D2D2F7EFE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 03:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788318003; cv=none; b=BNId3BoTlBX6OVAXFCQLTi7Vgft3mUQQBbRBXkSraS4D7l9xSDkysMCNSy0TKDoXwM3ZIhVY+BPEnjcj8TY67/Fid7sSFYQ1tey0BatSCWKeh19aZ+nJ8hMAm0fEJEVRcCwBO+hptd/f6VgqH1Xd3+4uu0UTftzIxOcjNOEZasc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788318003; c=relaxed/simple;
	bh=8mg22KytnJ/r8ze7gU/NgFYCuFm+t4FWsSCNSVFr9Og=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ONjKk2/5EdX1CfeDOyoI23jPz8XqwmCIHsYd4tTHcJay85yO5Zzmqz7FFKWnd11ah/0gMT9ttmErXZTasGF12z5H6PfNbSfj7tatNS+9fehdRbhTYIf3Kc5NfHIVC3hhYmQKM857Mpb5KGk444jeIRgG31R620yD+ZqzzbbVhWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RM2YyIOW; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RM2YyIOW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788318001; x=1819854001;
  h=date:from:to:cc:subject:message-id;
  bh=8mg22KytnJ/r8ze7gU/NgFYCuFm+t4FWsSCNSVFr9Og=;
  b=RM2YyIOWR2hcnIPI1OQDo0uQekLOrcxnFBuIGB76dG8qDcxFY0PlP4AU
   Fc6MwWyKW1fMoABgA4vd1nHQdu+tLzeVz3rVLwi23DLkLnaLL+iFo8CQ8
   BN+hEPje7LFkfepAXxxQcwCESW0B0I6eAFd5D+cuI7BgcVbqeLsa1zKY3
   iHYS5s0WRmXhhB3R2A686Rpw1tpKEQKwjzE5jyl3tKkZ85CWlzLNXip2j
   BQ1j6HpWOuHmKweKLyorOI5p1U0hnmgjsNB//cr+1q51bEa7edoL4C+Fg
   gKNWd/NDtdy7K9jETfdNX+BoobTprhT7OPdRh0dOpMyZlLNmS+zzwQUrB
   A==;
X-CSE-ConnectionGUID: NcseOIK9S4+41ZQVUY5Ohg==
X-CSE-MsgGUID: 9QbY+cx+SxWD1Jo49SzCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="99927802"
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="99927802"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2026 20:00:01 -0700
X-CSE-ConnectionGUID: HTeccIM4SSy5pqFoHBNUug==
X-CSE-MsgGUID: SnGIBoelSg6PjfyBIY9Zdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,257,1779174000"; 
   d="scan'208";a="292793463"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Sep 2026 19:59:58 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1bCd-000000001oI-0vkI;
	Wed, 02 Sep 2026 02:59:55 +0000
Date: Wed, 02 Sep 2026 10:59:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 2/22] ERROR: modpost: vmlinux: local
 symbol '_local_interrupt_save_state' was exported
Message-ID: <202609021035.UTmJ4N22-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   ec3ae38eecb47043e2e2d2138e35ee22dedfced4
commit: 3dc15f73b3ff963bbe91086b1cea6bac03723ad4 [2/22] movestuff
config: x86_64-randconfig-104-20260902 (https://download.01.org/0day-ci/archive/20260902/202609021035.UTmJ4N22-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260902/202609021035.UTmJ4N22-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609021035.UTmJ4N22-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
>> ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: vmlinux: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: vmlinux: local symbol '_raw_spin_unlock_irq_enable' was exported
ERROR: modpost: mm/kasan/kasan_test.ko: local symbol '_local_interrupt_save_state' was exported
ERROR: modpost: mm/kasan/kasan_test.ko: local symbol '_local_interrupt_enable' was exported
ERROR: modpost: mm/kasan/kasan_test.ko: local symbol '_raw_spin_lock_irq_disable' was exported
ERROR: modpost: mm/kasan/kasan_test.ko: local symbol '_raw_spin_unlock_irq_enable' was exported
ERROR: modpost: mm/kasan/kasan_test.ko: symbol 'do_raw_spin_unlock' undefined!
ERROR: modpost: mm/kasan/kasan_test.ko: symbol 'do_raw_spin_trylock' undefined!
ERROR: modpost: mm/kasan/kasan_test.ko: symbol 'do_raw_spin_lock' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
