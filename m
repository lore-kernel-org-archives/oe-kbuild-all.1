Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794096354;
	b=LC902gQm1je02lndoP5h7DNbX5j4ogsyWe0dg+dQSJxQpDxPkXf1ONUO6oM263E+z3on
	 LQT8J9Svn4tFMz9CWv+Z0wRLhp3Ifgxb1GkV8SFqbcEkyHESG7Nqad55GFuL6s428ro11
	 g3nDF5RWY5tPji4LiIltTXFNM7NGVXLLKTvEfcT4MP7nkcLjDIUph+7yXjEhHwyfnoAaN
	 1wOyt/9U9wXOwe9HaeOC/njxU+5+Xzi59YXswpE+wm4epdWWgvUrlNUXdO3RzC3ReDLEE
	 EzEEdqB4DeLiDrjLAOi83Nrq+9q7VWI2BPdbjTujCxZ+VPXbtYNrvIZVuUFmcnZx99Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794096354;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DPDV+m2CfEyQgaXMuT+i3DTdLyLN/ePZ/QA8aqr/REY=;
	b=UxicQ1LEXrjxR7l2x6xoPbCiKBZdU19Teb0K7VLWOFHcIlXLQuvA5jmqduVF76TDdzpE
	 4VtfI9zo3zixlLSnDYHN3gTt43Cn3IyhwnOLN8578GOP4627DSPorDSF/g8My9R56cQeE
	 9HADblpjvUCZXwqOEwcUfYkghNksu9ywKZCQUsTN0AduoiJjwGTBY7X7fVOauoKNHIF1z
	 fLFkfMqgEBxXZdb36n5QpdlrWiXhJLLGrah6ePorL8s+XYwT1/I/bk+30YlleIG/V3FqN
	 WNh89t8D9GvIym4yHbq/M3yWmbIItpUzpZQRn2lxTHOAl18IVgwcBC9oeGG3t0VQUYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HQ84Nate;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE951606A326
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 00:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE951606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=HQ84Nate
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794096352; x=1825632352;
  h=date:from:to:cc:subject:message-id;
  bh=UcQGdwAAV3nwaVfelgHoIIrpsYapDD9s0YBBEbW2BYo=;
  b=HQ84Nates7xz4Xxagvroeh0HVZri+jgV5W5l482ZOyNMLF3NNVsYKyCk
   fN7rV2oaxeghiqRwjYIn20s2I4EOdt91v6PUOpgPZZ0wqD2vZqDOlAsBA
   dKKeki4eC+fyw6IgKOk4SCaOhHyLGJ7nQk6ALcnFdLfP62xI8opFXB2JK
   5khv2vSP1Ttj2Ry8mzaqnWAfZoGBPhH5Mslj+tbIQ0TfdE7Oz1/8axs/n
   7/HjgyZw682uoqFFVUomFf5tHAHRzbC4AyML5/mhTPUK6Z2YwHYGzUc3B
   rOzOwSgj5CoBPhB2i97rhN/r4/esxtL5lGidCn72z6ZsKyBkdoJqE0xZX
   w==;
X-CSE-ConnectionGUID: k3SG+T0aSwOdB5z75OGNVQ==
X-CSE-MsgGUID: 221EqefnRQq/emi4jE/Rcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2911481"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2911481"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 16:05:51 -0800
X-CSE-ConnectionGUID: EGWAhpHbTt6i0hdmWBriOg==
X-CSE-MsgGUID: t/tQXIbtQTGb6hLIg/bbZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9343028"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 07 Nov 2026 16:05:50 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPqPq-00000000AtX-3Xcu;
	Sun, 08 Nov 2026 00:05:46 +0000
Date: Sun, 08 Nov 2026 01:05:18 +0100
From: kernel test robot <lkp@intel.com>
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v6 77/80]
 arch/loongarch/kernel/ptrace.c:1073:3: error: call to undeclared function
 '__csrwr_d'; ISO C99 and later do not support implicit function declarations
Message-ID: <202611080124.D9haYNsA-lkp@intel.com>
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
head:   f98be19c4d4f657fa0ed2a17aa8ef5ece29fe8dc
commit: f30a55d9ffb2d57252016d70c8fcd8672764c2b7 [77/80] gtrace: Add perf driver for tracing using perf tool
config: loongarch-randconfig-r2300-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080124.D9haYNsA-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080124.D9haYNsA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080124.D9haYNsA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/kernel/ptrace.c:1073:3: error: call to undeclared function '__csrwr_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1073 |                 csr_write64(attr.bp_addr, LOONGARCH_CSR_IB0ADDR);
         |                 ^
   arch/loongarch/include/asm/loongarch.h:191:31: note: expanded from macro 'csr_write64'
     191 | #define csr_write64(val, reg) __csrwr_d(val, reg)
         |                               ^
   1 error generated.
--
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      83 |         GEN_READ_WB_REG_CASES(CSR_CFG_ADDR, ADDR, t, val);
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:47:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      47 |         READ_WB_REG_CASE(OFF, 0, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:48:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      48 |         READ_WB_REG_CASE(OFF, 1, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:49:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      49 |         READ_WB_REG_CASE(OFF, 2, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:50:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      50 |         READ_WB_REG_CASE(OFF, 3, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:51:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      51 |         READ_WB_REG_CASE(OFF, 4, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:52:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      52 |         READ_WB_REG_CASE(OFF, 5, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:53:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      53 |         READ_WB_REG_CASE(OFF, 6, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:54:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      54 |         READ_WB_REG_CASE(OFF, 7, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:55:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      55 |         READ_WB_REG_CASE(OFF, 8, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:56:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      56 |         READ_WB_REG_CASE(OFF, 9, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:57:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      57 |         READ_WB_REG_CASE(OFF, 10, REG, T, VAL);         \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:58:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      58 |         READ_WB_REG_CASE(OFF, 11, REG, T, VAL);         \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:59:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      59 |         READ_WB_REG_CASE(OFF, 12, REG, T, VAL);         \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/hw_breakpoint.c:83:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:60:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      60 |         READ_WB_REG_CASE(OFF, 13, REG, T, VAL);
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
   arch/loongarch/kernel/hw_breakpoint.c:84:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      84 |         GEN_READ_WB_REG_CASES(CSR_CFG_MASK, MASK, t, val);
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:47:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      47 |         READ_WB_REG_CASE(OFF, 0, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
   arch/loongarch/kernel/hw_breakpoint.c:84:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:48:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      48 |         READ_WB_REG_CASE(OFF, 1, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
   arch/loongarch/kernel/hw_breakpoint.c:84:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:49:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      49 |         READ_WB_REG_CASE(OFF, 2, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
   arch/loongarch/kernel/hw_breakpoint.c:84:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:50:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      50 |         READ_WB_REG_CASE(OFF, 3, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
   arch/loongarch/kernel/hw_breakpoint.c:84:2: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
   arch/loongarch/kernel/hw_breakpoint.c:51:2: note: expanded from macro 'GEN_READ_WB_REG_CASES'
      51 |         READ_WB_REG_CASE(OFF, 4, REG, T, VAL);          \
         |         ^
   arch/loongarch/kernel/hw_breakpoint.c:38:3: note: expanded from macro 'READ_WB_REG_CASE'
      38 |                 LOONGARCH_CSR_WATCH_READ(N, REG, T, VAL);       \
         |                 ^
   arch/loongarch/include/asm/hw_breakpoint.h:60:9: note: expanded from macro 'LOONGARCH_CSR_WATCH_READ'
      60 |                 VAL = csr_read64(LOONGARCH_CSR_##IB##N##REG);   \
         |                       ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> arch/loongarch/kernel/perf_event.c:167:9: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     167 |                 val = read_csr_perfcntr0();
         |                       ^
   arch/loongarch/include/asm/loongarch.h:1383:31: note: expanded from macro 'read_csr_perfcntr0'
    1383 | #define read_csr_perfcntr0()            csr_read64(LOONGARCH_CSR_PERFCNTR0)
         |                                         ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
>> arch/loongarch/kernel/perf_event.c:190:3: error: call to undeclared function '__csrwr_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     190 |                 write_csr_perfcntr0(val);
         |                 ^
   arch/loongarch/include/asm/loongarch.h:1391:34: note: expanded from macro 'write_csr_perfcntr0'
    1391 | #define write_csr_perfcntr0(val)        csr_write64(val, LOONGARCH_CSR_PERFCNTR0)
         |                                         ^
   arch/loongarch/include/asm/loongarch.h:191:31: note: expanded from macro 'csr_write64'
     191 | #define csr_write64(val, reg) __csrwr_d(val, reg)
         |                               ^
   arch/loongarch/kernel/perf_event.c:213:9: error: call to undeclared function '__csrrd_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     213 |                 val = read_csr_perfctrl0();
         |                       ^
   arch/loongarch/include/asm/loongarch.h:1382:31: note: expanded from macro 'read_csr_perfctrl0'
    1382 | #define read_csr_perfctrl0()            csr_read64(LOONGARCH_CSR_PERFCTRL0)
         |                                         ^
   arch/loongarch/include/asm/loongarch.h:189:25: note: expanded from macro 'csr_read64'
     189 | #define csr_read64(reg) __csrrd_d(reg)
         |                         ^
   arch/loongarch/kernel/perf_event.c:236:3: error: call to undeclared function '__csrwr_d'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     236 |                 write_csr_perfctrl0(val);
         |                 ^
   arch/loongarch/include/asm/loongarch.h:1390:34: note: expanded from macro 'write_csr_perfctrl0'
    1390 | #define write_csr_perfctrl0(val)        csr_write64(val, LOONGARCH_CSR_PERFCTRL0)
         |                                         ^
   arch/loongarch/include/asm/loongarch.h:191:31: note: expanded from macro 'csr_write64'
     191 | #define csr_write64(val, reg) __csrwr_d(val, reg)
         |                               ^
   4 errors generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PERF_EVENTS
   Depends on [n]: HAVE_PERF_EVENTS [=n]
   Selected by [y]:
   - GTRACE [=y] && OF [=y]


vim +/__csrwr_d +1073 arch/loongarch/kernel/ptrace.c

424421a7f34c122 Qing Zhang 2023-02-25  1039  
424421a7f34c122 Qing Zhang 2023-02-25  1040  static int set_single_step(struct task_struct *tsk, unsigned long addr)
424421a7f34c122 Qing Zhang 2023-02-25  1041  {
424421a7f34c122 Qing Zhang 2023-02-25  1042  	struct perf_event *bp;
424421a7f34c122 Qing Zhang 2023-02-25  1043  	struct perf_event_attr attr;
424421a7f34c122 Qing Zhang 2023-02-25  1044  	struct arch_hw_breakpoint *info;
424421a7f34c122 Qing Zhang 2023-02-25  1045  	struct thread_struct *thread = &tsk->thread;
424421a7f34c122 Qing Zhang 2023-02-25  1046  
424421a7f34c122 Qing Zhang 2023-02-25  1047  	bp = thread->hbp_break[0];
424421a7f34c122 Qing Zhang 2023-02-25  1048  	if (!bp) {
424421a7f34c122 Qing Zhang 2023-02-25  1049  		ptrace_breakpoint_init(&attr);
424421a7f34c122 Qing Zhang 2023-02-25  1050  
424421a7f34c122 Qing Zhang 2023-02-25  1051  		attr.bp_addr = addr;
424421a7f34c122 Qing Zhang 2023-02-25  1052  		attr.bp_len = HW_BREAKPOINT_LEN_8;
424421a7f34c122 Qing Zhang 2023-02-25  1053  		attr.bp_type = HW_BREAKPOINT_X;
424421a7f34c122 Qing Zhang 2023-02-25  1054  
424421a7f34c122 Qing Zhang 2023-02-25  1055  		bp = register_user_hw_breakpoint(&attr, ptrace_triggered,
424421a7f34c122 Qing Zhang 2023-02-25  1056  						 NULL, tsk);
424421a7f34c122 Qing Zhang 2023-02-25  1057  		if (IS_ERR(bp))
424421a7f34c122 Qing Zhang 2023-02-25  1058  			return PTR_ERR(bp);
424421a7f34c122 Qing Zhang 2023-02-25  1059  
424421a7f34c122 Qing Zhang 2023-02-25  1060  		thread->hbp_break[0] = bp;
424421a7f34c122 Qing Zhang 2023-02-25  1061  	} else {
424421a7f34c122 Qing Zhang 2023-02-25  1062  		int err;
424421a7f34c122 Qing Zhang 2023-02-25  1063  
424421a7f34c122 Qing Zhang 2023-02-25  1064  		attr = bp->attr;
424421a7f34c122 Qing Zhang 2023-02-25  1065  		attr.bp_addr = addr;
424421a7f34c122 Qing Zhang 2023-02-25  1066  
424421a7f34c122 Qing Zhang 2023-02-25  1067  		/* Reenable breakpoint */
424421a7f34c122 Qing Zhang 2023-02-25  1068  		attr.disabled = false;
424421a7f34c122 Qing Zhang 2023-02-25  1069  		err = modify_user_hw_breakpoint(bp, &attr);
424421a7f34c122 Qing Zhang 2023-02-25  1070  		if (unlikely(err))
424421a7f34c122 Qing Zhang 2023-02-25  1071  			return err;
424421a7f34c122 Qing Zhang 2023-02-25  1072  
424421a7f34c122 Qing Zhang 2023-02-25 @1073  		csr_write64(attr.bp_addr, LOONGARCH_CSR_IB0ADDR);
424421a7f34c122 Qing Zhang 2023-02-25  1074  	}
424421a7f34c122 Qing Zhang 2023-02-25  1075  	info = counter_arch_bp(bp);
424421a7f34c122 Qing Zhang 2023-02-25  1076  	info->mask = TASK_SIZE - 1;
424421a7f34c122 Qing Zhang 2023-02-25  1077  
424421a7f34c122 Qing Zhang 2023-02-25  1078  	return 0;
424421a7f34c122 Qing Zhang 2023-02-25  1079  }
424421a7f34c122 Qing Zhang 2023-02-25  1080  

:::::: The code at line 1073 was first introduced by commit
:::::: 424421a7f34c1222d20a6c279f13b9caa71ecc83 LoongArch: ptrace: Add hardware single step support

:::::: TO: Qing Zhang <zhangqing@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
