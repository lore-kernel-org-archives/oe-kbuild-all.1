Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D1329ACC6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jun 2026 02:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782267313; cv=none; b=JHdSnz3bwzLA5yescrKQoSk4OXTtW8GTCtuQulxfU8Yr56/hvzmgu22B2Fr61TT2BU1r0ZODbDlgxCiOJQpSFj+rWVUtUWXLNpgKO7q5X0FNC1FVsqCVkvUZlzFFAx8phv/9v6VVody3WKlbceuMmt1sXxghi0vsrCffx9cumdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782267313; c=relaxed/simple;
	bh=nIOHiv7R/Ej0NPY4DBIL60TFcFt6IO2/67c9boxiK2Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sGSfHZZ6aVY2q841ik0ZkJG0WWhpBhAlqh+9iFO1VhqY1cUpQl4PrJ0tHKDggqAg6H0iju0h/wtjD5yjEzSLOGT67kg8mb9vLHLaOL+rlRiOwoIgQlNTGh49HZpdtDP/FTSE6AVJ58VATmjaWnzS9Hd7dWbGi88CD6gYovcE370=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LS/L4wNk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LS/L4wNk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782267312; x=1813803312;
  h=date:from:to:cc:subject:message-id;
  bh=nIOHiv7R/Ej0NPY4DBIL60TFcFt6IO2/67c9boxiK2Y=;
  b=LS/L4wNksfdIwDY+mbQSetextON5H+mvKr4xJjKvP57pDrFsD6W+eNG2
   wb48ip8Tfq6JrmeTNCeNvGys7HYLvmpDdd8y4sBxIG589vz3M/qNB1tKm
   0QGUtXAi2rAbz3jjcD5g3I30K6d8rcUHyEPHwYhyv3n5Ymy0mTrEitBWr
   1BRUnR/JM3GSO6qyQc1ac/uX5Of0T0gimteIJExcEOTdTaGeYieXQQ4Dk
   YjC5mGpWPT7agazNqeheQpw2yN/Xdf3eOThD7yePrFnULofeMulgfRBPB
   mnDodd7vdmJz5KNg41XGAHJLhKaPJ2XwW9icHVXwyDjasF3ZfQ1QYaC8O
   g==;
X-CSE-ConnectionGUID: BBhBRFIRSPafNVq4kTLBOg==
X-CSE-MsgGUID: JHk9HvSnRKq+YOVYZJRLpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="82126956"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="82126956"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 19:15:11 -0700
X-CSE-ConnectionGUID: h+ag6gclS8GX5RbjovsZeg==
X-CSE-MsgGUID: psk0ALP4QPWzMSBtzp35Mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="254779758"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jun 2026 19:15:08 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcD8s-000000006K1-0825;
	Wed, 24 Jun 2026 02:15:06 +0000
Date: Wed, 24 Jun 2026 04:14:15 +0200
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Subject: [arm64:for-next/core 12/12]
 usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you
 mean '__u32'?
Message-ID: <202606240441.7eZ1TIRM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
head:   9d6306113f921dc00793df46f31ed46583c720df
commit: 9d6306113f921dc00793df46f31ed46583c720df [12/12] arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260624/202606240441.7eZ1TIRM-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260624/202606240441.7eZ1TIRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606240441.7eZ1TIRM-lkp@intel.com/

Note: the arm64/for-next/core HEAD 9d6306113f921dc00793df46f31ed46583c720df builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from testcases/fake_sigreturn_bad_magic.c:10:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from ./test_signals.h:14,
                    from ./test_signals_utils.h:14,
                    from testcases/fake_sigreturn_bad_magic.c:13:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from test_signals.h:7,
                    from test_signals.c:16:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from test_signals.h:14:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from test_signals_utils.c:6:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from test_signals.h:14,
                    from test_signals_utils.c:18:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from testcases/testcases.h:12,
                    from testcases/testcases.c:7:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from sve_helpers.c:10:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from /usr/aarch64-linux-gnu/include/sys/wait.h:36,
                    from pac.c:8:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from /usr/aarch64-linux-gnu/include/sys/wait.h:36,
                    from fp-ptrace.c:22:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from fp-ptrace.c:28:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from mte_common_util.h:7,
                    from check_buffer_fill.c:11:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from mte_common_util.c:6:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from system.h:20,
                    from test.c:7:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from test.c:14:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
--
   In file included from system.h:20,
                    from signal.c:7:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from tools/testing/selftests/cgroup/lib/cgroup_util.c:9:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from include/test_util.h:12,
                    from include/kvm_util.h:8,
                    from demand_paging_test.c:17:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   In file included from usr/include/asm/kvm.h:37,
                    from usr/include/linux/kvm.h:16,
                    from include/kvm_util.h:14:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   In file included from usr/include/asm/kvm.h:37,
                    from usr/include/linux/kvm.h:16,
                    from lib/arm64/gic_v3_its.c:7:
>> usr/include/asm/ptrace.h:96:9: error: unknown type name '__u128'; did you mean '__u32'?
      96 |         __u128          vregs[32];
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:261:9: error: unknown type name '__u128'; did you mean '__u32'?
     261 |         __u128  apiakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:262:9: error: unknown type name '__u128'; did you mean '__u32'?
     262 |         __u128  apibkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:263:9: error: unknown type name '__u128'; did you mean '__u32'?
     263 |         __u128  apdakey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:264:9: error: unknown type name '__u128'; did you mean '__u32'?
     264 |         __u128  apdbkey;
         |         ^~~~~~
         |         __u32
   usr/include/asm/ptrace.h:268:9: error: unknown type name '__u128'; did you mean '__u32'?
     268 |         __u128  apgakey;
         |         ^~~~~~
         |         __u32
   In file included from /usr/aarch64-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/aarch64-linux-gnu/include/signal.h:301,
                    from include/test_util.h:12,
                    from include/kvm_util.h:8,
                    from lib/arm64/gic_v3_its.c:12:
>> usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
      81 |         __u128 vregs[32];
         |         ^~~~~~
         |         __u32
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
..

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
