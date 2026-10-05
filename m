Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D688414DFA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791201333; cv=none; b=cx/Kue8tEXFsTA0fdeltXt7s/KuoGMz36pb3cgzsyhrzsP2zC/v/a5/4f2ahZ+sk1IZYS0U45B719RfRKA3fAxc8ytKyrGYseJL6m01bRZ/jVupREytyzd9NosOKLPjEFFyAyt8rVxnzwPg+oOnZW/eHUK6licB9px/Vs4ir9RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791201333; c=relaxed/simple;
	bh=EbNCbqAq8uS1+rX+LiwbpEFggy4fTFA9zsVza4ixMXQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XgZO1u1flTzdZnj8A8ZgAxRXomt/aY8CuK8UI0KLw+8xq8mq3IkgWd/cjeBZHdWTu3aLG7DTWMCTPJeE/plWGYix9wSSG6Se1WnFN1h6C4+0IiM5n4+Ki/rbVK4IlDDU3A15HUiiIXIFDMSx+yiJlTyyVLJhUZVKgp3RBTsOyQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nfBPrVyx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nfBPrVyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791201331; x=1822737331;
  h=date:from:to:cc:subject:message-id;
  bh=EbNCbqAq8uS1+rX+LiwbpEFggy4fTFA9zsVza4ixMXQ=;
  b=nfBPrVyxZT+sJHjLefzymjp6OJdl1Y+tSp2XZS+/tspOLp2dVpqw2M1t
   iEAZSopuutXZYWRbCAUj2R7fG6JqipICpDoNSaY5W2VJoCmDsCz5OMpEU
   /EkyRSE0/Iw5lz5mcMarb5Ovd+ooR3GpmPsRoEv40A32zpqngeRSae5sM
   oL6+V5RsojNnDQxZKCGrmDK2M2qEyEm8wxF1j9kUBxXWiRV+r+DhxdAUa
   /nMyw/sDfr2VT3LsshQgwufO8Rp3B9ZmZNzbeSdTC1WEx9Uis2fsqMZH+
   PTQl5M4I4HyxEx0P2pnqXGVU3Ma/JY6GZUpcheeURUU/Du7OTkL/SA6Tq
   w==;
X-CSE-ConnectionGUID: fR4ACYPCTFyA/X6DH/lr+Q==
X-CSE-MsgGUID: eDz3JI7YS9WlKZIlyINu5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90818221"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90818221"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 04:55:31 -0700
X-CSE-ConnectionGUID: zyMNn3qDT2Oozb6LHXwInw==
X-CSE-MsgGUID: uRPAD+zSShmBwWAd0tzMlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="281577078"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Oct 2026 04:55:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDhHy-000000000G3-36wW;
	Mon, 05 Oct 2026 11:55:26 +0000
Date: Mon, 05 Oct 2026 19:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [avpatel:riscv_mpxy_imp_v1 2/5] cpu.c:(.text+0x3c0):
 multiple definition of `sbi_mpxy_read_attrs';
 arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined
 here
Message-ID: <202610051939.JJpxuVby-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_mpxy_imp_v1
head:   48be05a1fcc231a756503546729aefd39ba8ca76
commit: 6439174960c8ce56a3b4ce6eb5fabde7bdaae27a [2/5] RISC-V: Move common MPXY helper routines to arch/riscv
config: riscv-nommu_k210_sdcard_defconfig (https://download.01.org/0day-ci/archive/20261005/202610051939.JJpxuVby-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051939.JJpxuVby-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051939.JJpxuVby-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_read_attrs':
>> cpu.c:(.text+0x3c0): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_write_attrs':
>> cpu.c:(.text+0x3c4): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_send_message_with_resp':
>> cpu.c:(.text+0x3c8): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_send_message_without_resp':
>> cpu.c:(.text+0x3cc): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu.o: in function `sbi_mpxy_get_notifications':
>> cpu.c:(.text+0x3d0): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_read_attrs':
   cpufeature.c:(.text+0x338): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_write_attrs':
   cpufeature.c:(.text+0x33c): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_send_message_with_resp':
   cpufeature.c:(.text+0x340): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_send_message_without_resp':
   cpufeature.c:(.text+0x344): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpufeature.o: in function `sbi_mpxy_get_notifications':
   cpufeature.c:(.text+0x348): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_read_attrs':
   irq.c:(.text+0x18): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_write_attrs':
   irq.c:(.text+0x1c): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_send_message_with_resp':
   irq.c:(.text+0x20): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_send_message_without_resp':
   irq.c:(.text+0x24): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/irq.o: in function `sbi_mpxy_get_notifications':
   irq.c:(.text+0x28): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_read_attrs':
   setup.c:(.text+0x0): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_write_attrs':
   setup.c:(.text+0x4): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_send_message_with_resp':
   setup.c:(.text+0x8): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_send_message_without_resp':
   setup.c:(.text+0xc): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/setup.o: in function `sbi_mpxy_get_notifications':
   setup.c:(.text+0x10): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_read_attrs':
   sys_hwprobe.c:(.text+0xdea): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_write_attrs':
   sys_hwprobe.c:(.text+0xdee): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_send_message_with_resp':
   sys_hwprobe.c:(.text+0xdf2): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_send_message_without_resp':
   sys_hwprobe.c:(.text+0xdf6): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/sys_hwprobe.o: in function `sbi_mpxy_get_notifications':
   sys_hwprobe.c:(.text+0xdfa): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_read_attrs':
   time.c:(.text+0x0): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_write_attrs':
   time.c:(.text+0x4): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_send_message_with_resp':
   time.c:(.text+0x8): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_send_message_without_resp':
   time.c:(.text+0xc): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/time.o: in function `sbi_mpxy_get_notifications':
   time.c:(.text+0x10): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_read_attrs':
   traps_misaligned.c:(.text+0x59c): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_write_attrs':
   traps_misaligned.c:(.text+0x5a0): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_send_message_with_resp':
   traps_misaligned.c:(.text+0x5a4): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_send_message_without_resp':
   traps_misaligned.c:(.text+0x5a8): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/traps_misaligned.o: in function `sbi_mpxy_get_notifications':
   traps_misaligned.c:(.text+0x5ac): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/kernel_mode_vector.o: in function `sbi_mpxy_read_attrs':
   kernel_mode_vector.c:(.text+0x2f0): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/kernel_mode_vector.o: in function `sbi_mpxy_write_attrs':
   kernel_mode_vector.c:(.text+0x2f4): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/kernel_mode_vector.o: in function `sbi_mpxy_send_message_with_resp':
   kernel_mode_vector.c:(.text+0x2f8): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/kernel_mode_vector.o: in function `sbi_mpxy_send_message_without_resp':
   kernel_mode_vector.c:(.text+0x2fc): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/kernel_mode_vector.o: in function `sbi_mpxy_get_notifications':
   kernel_mode_vector.c:(.text+0x300): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_read_attrs':
   cpu_ops.c:(.text+0x0): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_write_attrs':
   cpu_ops.c:(.text+0x4): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_send_message_with_resp':
   cpu_ops.c:(.text+0x8): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_send_message_without_resp':
   cpu_ops.c:(.text+0xc): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops.o: in function `sbi_mpxy_get_notifications':
   cpu_ops.c:(.text+0x10): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_read_attrs':
   cpu_ops_spinwait.c:(.text+0x3e): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_write_attrs':
   cpu_ops_spinwait.c:(.text+0x42): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_send_message_with_resp':
   cpu_ops_spinwait.c:(.text+0x46): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_send_message_without_resp':
   cpu_ops_spinwait.c:(.text+0x4a): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/cpu_ops_spinwait.o: in function `sbi_mpxy_get_notifications':
   cpu_ops_spinwait.c:(.text+0x4e): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_read_attrs':
   suspend.c:(.text+0x0): multiple definition of `sbi_mpxy_read_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x24): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_write_attrs':
   suspend.c:(.text+0x4): multiple definition of `sbi_mpxy_write_attrs'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x28): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_send_message_with_resp':
   suspend.c:(.text+0x8): multiple definition of `sbi_mpxy_send_message_with_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x2c): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_send_message_without_resp':
   suspend.c:(.text+0xc): multiple definition of `sbi_mpxy_send_message_without_resp'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x30): first defined here
   riscv64-linux-ld: arch/riscv/kernel/suspend.o: in function `sbi_mpxy_get_notifications':
   suspend.c:(.text+0x10): multiple definition of `sbi_mpxy_get_notifications'; arch/riscv/kernel/alternative.o:alternative.c:(.text+0x34): first defined here

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
