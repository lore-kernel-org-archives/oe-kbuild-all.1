Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642350;
	b=AvA0ajHiwDNXItOPfydZDSpQ1TXZt68QeZoCgvpLTL6uDBAiOvPWFERNNWoD7HA5Fd+0
	 2UxFJwqmZadyBgB2q79SWVDiUoPD2GHfgFsaQvuOU7LyvgJr9KJohAeszFjXz71eVWG6B
	 Z0JHZI1BLLX2Btm21joIoO+MPsV+sOteYW23q93yRjxAZA2qjticiKlhvZK6lw0nmArEZ
	 ilhI6SHMfItfNr7hdU3XJFzWfeDliVRpwnZaTQsGJPGaCx16ssFY9Wj13dkKb4n2h+E2x
	 S/oHkn+h5GByVNUDNVoaMaN1+NuGw/upI1X9dWmYW7u8ivZ5z8e9kVuNh7LwPF3Vhag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642350;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=14S7U/g3pcUA1Ng4udfODi17dgEhbceOraD2RQaLtIM=;
	b=VPQAht2uu0Em4tXB2sZELuqYG5NejautMHweRonX+F3ycjIoe7GhXWWezLx+RMnAupXi
	 Qcrm35u6mS5/zhTk305OxdTiPJp88qni/I0LbBQQZ6ibYhdoGMwkG4++troAeFXZI3ptZ
	 qhTjtENN/WsRnpggTxSQwjGifbqFuQd86McM6oExsKZ19OXQ9/dp5sbwMvQPbTZ35o8N4
	 fjaRe+zM7QSNZDBQTQ8IPoSMo7Vpn/DVW0YgWu6h4prqKzzI6CA09Fo+GiFQHmP/FTTUn
	 Iqc/c04Ssmm0kJtaLdsU3u74hnjwFwijHpeg/1RN6t3C5kgEyJlIZ2kRC4e7227JRNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="VMAafTW/";
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65D8606A326
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 21:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E65D8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VMAafTW/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795642350; x=1827178350;
  h=date:from:to:cc:subject:message-id;
  bh=4C7Ort3YlNkGFwmIaIv+DzTWoFU+e/m+0M1vIY93TlI=;
  b=VMAafTW/AS59SUhIKB9Yg9ZMgtxTxBK0O1KnPMEiePxZZ8g3el6Vs54s
   vJzSmbeKcrobO4ygfQEDeAZJNEWRAiSTdU0gMC57LvnDZ+jxKu9CowCEU
   yUsXSPcbiy2kbtfG78No4mlrVIyeKen+f+QEOM0d1npbXJuUig35wDPFx
   76LNgXRI/QT8MFyUG9MwVgH9vBXzkKZz3rSi/skSDqncn/PMJ+m5hwCkA
   I/UNY1BVgsPKG7DAarVX/wcp8NjBjPfknxoJtUrDGAF4++toQP3oNO/oJ
   3NBJCNAUFvSmsJurNKhUQZm0/MUKvaSwpYSWa+KiAv4p+HoBtz5FtSO8N
   Q==;
X-CSE-ConnectionGUID: 0Q7UF7T/S6W43b2llL2GPw==
X-CSE-MsgGUID: nZJ4lv3GRKuaz8chbsxhPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4445419"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4445419"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 13:32:29 -0800
X-CSE-ConnectionGUID: jaK9kCo+T2C4l+GxwVGH8Q==
X-CSE-MsgGUID: nOds/T2KRFSJsewy6jJEFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12291427"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 25 Nov 2026 13:32:27 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWKbI-0000000006T-1koo;
	Wed, 25 Nov 2026 21:32:24 +0000
Date: Wed, 25 Nov 2026 22:31:29 +0100
From: kernel test robot <lkp@intel.com>
To: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 96/115]
 include/linux/hw_breakpoint.h:137:20: error: redefinition of
 'flush_ptrace_hw_breakpoint'
Message-ID: <20261125222550.Ipn5MVl8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   d77c0270e18de0b01434fec8027d8a61ae1f7c00
commit: d384a04e2e3d3b3e3caec0c874fedbc8a4690d65 [96/115] riscv: add ptrace requests for hardware breakpoints
config: riscv-randconfig-r2102-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125222550.Ipn5MVl8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125222550.Ipn5MVl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125222550.Ipn5MVl8-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/ptrace.c:31:
>> include/linux/hw_breakpoint.h:137:20: error: redefinition of 'flush_ptrace_hw_breakpoint'
     137 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)  { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/processor.h:18,
                    from include/linux/sched.h:13,
                    from kernel/ptrace.c:13:
   arch/riscv/include/asm/hw_breakpoint.h:58:20: note: previous definition of 'flush_ptrace_hw_breakpoint' with type 'void(struct task_struct *)'
      58 | static inline void flush_ptrace_hw_breakpoint(struct task_struct *task) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/flush_ptrace_hw_breakpoint +137 include/linux/hw_breakpoint.h

24f1e32c60c45c include/linux/hw_breakpoint.h       Frederic Weisbecker 2009-09-09  136  
24f1e32c60c45c include/linux/hw_breakpoint.h       Frederic Weisbecker 2009-09-09 @137  static inline void flush_ptrace_hw_breakpoint(struct task_struct *tsk)	{ }
b332828c39326b include/asm-generic/hw_breakpoint.h K.Prasad            2009-06-01  138  

:::::: The code at line 137 was first introduced by commit
:::::: 24f1e32c60c45c89a997c73395b69c8af6f0a84e hw-breakpoints: Rewrite the hw-breakpoints layer on top of perf events

:::::: TO: Frederic Weisbecker <fweisbec@gmail.com>
:::::: CC: Frederic Weisbecker <fweisbec@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
