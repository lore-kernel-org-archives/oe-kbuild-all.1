Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245932066E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 10:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740220814; cv=none; b=DyRksMi+7EJtf3nd/ku3kQPx8efjgLFHJbnov5z/U6ZbPzu58df7ZEeXLv4Jcu44E40vJsnPGqrQacrKD9yqaNxw1pF5YANkXsTiqzBlTWGUOBp4fpyssgLTsdWoqCXvKm5wBrK19ezjj3IXRBMugx/0+8+XYeHqTvZyOZ2JYlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740220814; c=relaxed/simple;
	bh=StVPx/hr5VXk66iq/WEpcIZc+SptqolvhGOkT2wuQB4=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JfIxYKPGr7VRaIE+XeGajUQtTckK5pnD64p+WC4YQHC7iRSqwjM2Iq/uPW1jmAbIgyd8TBqPV6t2C3Kv/gwLqLfT+Z3S818sR6n2Y2kUr8RZCSssSMaDqbZckcVW22XoxT6FkvlYPhkvFyymmSjEak7LVp/jYoMme4qU6g+P+xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsVTx27A; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsVTx27A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740220812; x=1771756812;
  h=date:from:cc:subject:message-id:mime-version;
  bh=StVPx/hr5VXk66iq/WEpcIZc+SptqolvhGOkT2wuQB4=;
  b=WsVTx27AgR0NTAX2OAdab5X2O4oFcVjH37ydQrx6HumD6727OapnCU+i
   iLx5Lwzc1F6vCh2wthFKX4h7fj2nWiZMy/c5fqwGQaUJ3N480K5GqnXLc
   rS9GGwqo38yx0X+uemLT2JIQWQLRD3/i7oHa/NjYmd2ZVN8js5dt9Ts6n
   jbIjVv2O1hnKwN0Fbw7CbavSTvQOqhmbS+dScZKvncEnCC3CyaFB6qrWu
   8FAEkFLAmOMScGcLyL9e7iR/xtZgElmOO3DGcQEkCTsQE9rWjtkjxVTVY
   VO2dQgOrSG6p/W3WmlgnXXepRKIan+3zPtrsZjGkMngK31YpqOoaucJj7
   A==;
X-CSE-ConnectionGUID: Dq8EKKGdRKyLaqGULlAI3Q==
X-CSE-MsgGUID: XexXNYLsTbCRQ8J8sbo4Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="58584429"
X-IronPort-AV: E=Sophos;i="6.13,307,1732608000"; 
   d="scan'208";a="58584429"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 02:40:12 -0800
X-CSE-ConnectionGUID: wCbTbPSfTNmM/WWCtssLIQ==
X-CSE-MsgGUID: beguvZ7JQ5aU7fpxfH5H6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="120843258"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 22 Feb 2025 02:40:11 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlmvY-0006UN-1u
	for oe-kbuild-all@lists.linux.dev;
	Sat, 22 Feb 2025 10:40:08 +0000
Date: Sat, 22 Feb 2025 18:39:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.12/dovetail-xenomai 5/5]
 arch/arm/kernel/ptrace.c:208:9: error: implicit declaration of function
 'mark_trap_entry'
Message-ID: <202502221838.8Jq7qsKB-lkp@intel.com>
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
commit: 321bdf89d2b75198908d7ee8c1895f22cdcc4665 [5/5] ARM: dovetail: route traps
config: arm-randconfig-002-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221838.8Jq7qsKB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221838.8Jq7qsKB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502221838.8Jq7qsKB-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm/kernel/ptrace.c: In function 'break_trap':
>> arch/arm/kernel/ptrace.c:208:9: error: implicit declaration of function 'mark_trap_entry' [-Wimplicit-function-declaration]
     208 |         mark_trap_entry(ARM_TRAP_BREAK, regs);
         |         ^~~~~~~~~~~~~~~
>> arch/arm/kernel/ptrace.c:208:25: error: 'ARM_TRAP_BREAK' undeclared (first use in this function)
     208 |         mark_trap_entry(ARM_TRAP_BREAK, regs);
         |                         ^~~~~~~~~~~~~~
   arch/arm/kernel/ptrace.c:208:25: note: each undeclared identifier is reported only once for each function it appears in
>> arch/arm/kernel/ptrace.c:210:9: error: implicit declaration of function 'mark_trap_exit'; did you mean 'early_trap_init'? [-Wimplicit-function-declaration]
     210 |         mark_trap_exit(ARM_TRAP_BREAK, regs);
         |         ^~~~~~~~~~~~~~
         |         early_trap_init
--
>> arch/arm/mm/fault.c:168:15: warning: no previous prototype for 'fault_entry' [-Wmissing-prototypes]
     168 | unsigned long fault_entry(int exception, struct pt_regs *regs)
         |               ^~~~~~~~~~~


vim +/mark_trap_entry +208 arch/arm/kernel/ptrace.c

   205	
   206	static int break_trap(struct pt_regs *regs, unsigned int instr)
   207	{
 > 208		mark_trap_entry(ARM_TRAP_BREAK, regs);
   209		ptrace_break(regs);
 > 210		mark_trap_exit(ARM_TRAP_BREAK, regs);
   211		return 0;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
