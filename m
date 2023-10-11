Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D089312E6E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 19:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9rtvJ2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697051978; x=1728587978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fvjn6ecENDliaFxqsZg40COvYMU/Gmx35muNk1GuC1c=;
  b=i9rtvJ2a98+VgtNXWFyratzaqeJ0Q6S4YD4oY0fc56+/NeiXE6X7chww
   qQOdSAyYg9WeJy7vyG4ZSQwggT7Ub67u0I43yAFrPcIM3ovGf3MMgSbWA
   N0LaEgx0Bmk3ZUOFENJ2JUQRiyqCtflhMFwmetgykRLYmooPOkAPrmNNm
   dfXJfddI+xkcFxoCt4z2fyo3telFzXRimE2SN2bg4Z5yEac10PnOsfXwF
   asnfMlpXDTHMT2rQG6Tmi5GX1yVniTrjvS7cn/94mACTnWSc4L6GFNxs8
   T0fvbQ9HeFsRPNmK8ZdJO0JmYh/nE7oH14vEXzCC+pCsNTA4hQPW6DZVW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="381990573"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="381990573"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="730608587"
X-IronPort-AV: E=Sophos;i="6.03,216,1694761200"; 
   d="scan'208";a="730608587"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 11 Oct 2023 12:19:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqejv-0002cV-0e;
	Wed, 11 Oct 2023 19:19:27 +0000
Date: Thu, 12 Oct 2023 03:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:arm64/insn/rework 32/38] arch/arm64/net/bpf_jit.h:255:9:
 error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
Message-ID: <202310120231.YtoOkLjQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/insn/rework
head:   37bd99f160dd83ccdfd3f50c685259ae62a81e68
commit: 678b3dc2a2b23346635ee5ddd7613df79a932f87 [32/38] WIP: arm64: insn: rework logical (shifted register)
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231012/202310120231.YtoOkLjQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231012/202310120231.YtoOkLjQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120231.YtoOkLjQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/net/bpf_jit_comp.c:25:
   arch/arm64/net/bpf_jit_comp.c: In function 'emit_lse_atomic':
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:266:9: note: in expansion of macro 'A64_LOGIC_SREG'
     266 |         A64_LOGIC_SREG(sf, Rd, A64_ZR, Rm, ORN)
         |         ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:471:22: note: in expansion of macro 'A64_MVN'
     471 |                 emit(A64_MVN(isdw, tmp2, src), ctx);
         |                      ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:266:9: note: in expansion of macro 'A64_LOGIC_SREG'
     266 |         A64_LOGIC_SREG(sf, Rd, A64_ZR, Rm, ORN)
         |         ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:471:22: note: in expansion of macro 'A64_MVN'
     471 |                 emit(A64_MVN(isdw, tmp2, src), ctx);
         |                      ^~~~~~~
   In file included from arch/arm64/include/asm/debug-monitors.h:12,
                    from arch/arm64/include/asm/uprobes.h:9,
                    from include/linux/uprobes.h:49,
                    from include/linux/mm_types.h:16,
                    from include/linux/bpf.h:16,
                    from arch/arm64/net/bpf_jit_comp.c:11:
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:266:9: note: in expansion of macro 'A64_LOGIC_SREG'
     266 |         A64_LOGIC_SREG(sf, Rd, A64_ZR, Rm, ORN)
         |         ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:485:22: note: in expansion of macro 'A64_MVN'
     485 |                 emit(A64_MVN(isdw, tmp2, src), ctx);
         |                      ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:266:9: note: in expansion of macro 'A64_LOGIC_SREG'
     266 |         A64_LOGIC_SREG(sf, Rd, A64_ZR, Rm, ORN)
         |         ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:485:22: note: in expansion of macro 'A64_MVN'
     485 |                 emit(A64_MVN(isdw, tmp2, src), ctx);
         |                      ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'emit_ll_sc_atomic':
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:546:30: note: in expansion of macro 'A64_AND'
     546 |                         emit(A64_AND(isdw, tmp2, tmp2, src), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:546:30: note: in expansion of macro 'A64_AND'
     546 |                         emit(A64_AND(isdw, tmp2, tmp2, src), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:548:30: note: in expansion of macro 'A64_ORR'
     548 |                         emit(A64_ORR(isdw, tmp2, tmp2, src), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:548:30: note: in expansion of macro 'A64_ORR'
     548 |                         emit(A64_ORR(isdw, tmp2, tmp2, src), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:550:30: note: in expansion of macro 'A64_EOR'
     550 |                         emit(A64_EOR(isdw, tmp2, tmp2, src), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:550:30: note: in expansion of macro 'A64_EOR'
     550 |                         emit(A64_EOR(isdw, tmp2, tmp2, src), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:567:30: note: in expansion of macro 'A64_AND'
     567 |                         emit(A64_AND(isdw, tmp2, src, ax), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:567:30: note: in expansion of macro 'A64_AND'
     567 |                         emit(A64_AND(isdw, tmp2, src, ax), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:569:30: note: in expansion of macro 'A64_ORR'
     569 |                         emit(A64_ORR(isdw, tmp2, src, ax), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:569:30: note: in expansion of macro 'A64_ORR'
     569 |                         emit(A64_ORR(isdw, tmp2, src, ax), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:571:30: note: in expansion of macro 'A64_EOR'
     571 |                         emit(A64_EOR(isdw, tmp2, src, ax), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:571:30: note: in expansion of macro 'A64_EOR'
     571 |                         emit(A64_EOR(isdw, tmp2, src, ax), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:592:22: note: in expansion of macro 'A64_EOR'
     592 |                 emit(A64_EOR(isdw, tmp3, r0, tmp2), ctx);
         |                      ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:592:22: note: in expansion of macro 'A64_EOR'
     592 |                 emit(A64_EOR(isdw, tmp3, r0, tmp2), ctx);
         |                      ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c: In function 'build_insn':
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:815:22: note: in expansion of macro 'A64_AND'
     815 |                 emit(A64_AND(is64, dst, dst, src), ctx);
         |                      ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:815:22: note: in expansion of macro 'A64_AND'
     815 |                 emit(A64_AND(is64, dst, dst, src), ctx);
         |                      ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:819:22: note: in expansion of macro 'A64_ORR'
     819 |                 emit(A64_ORR(is64, dst, dst, src), ctx);
         |                      ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:819:22: note: in expansion of macro 'A64_ORR'
     819 |                 emit(A64_ORR(is64, dst, dst, src), ctx);
         |                      ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:823:22: note: in expansion of macro 'A64_EOR'
     823 |                 emit(A64_EOR(is64, dst, dst, src), ctx);
         |                      ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:823:22: note: in expansion of macro 'A64_EOR'
     823 |                 emit(A64_EOR(is64, dst, dst, src), ctx);
         |                      ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:937:30: note: in expansion of macro 'A64_AND'
     937 |                         emit(A64_AND(is64, dst, dst, tmp), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:258:34: note: in expansion of macro 'A64_LOGIC_SREG'
     258 | #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:937:30: note: in expansion of macro 'A64_AND'
     937 |                         emit(A64_AND(is64, dst, dst, tmp), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:947:30: note: in expansion of macro 'A64_ORR'
     947 |                         emit(A64_ORR(is64, dst, dst, tmp), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:259:34: note: in expansion of macro 'A64_LOGIC_SREG'
     259 | #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:947:30: note: in expansion of macro 'A64_ORR'
     947 |                         emit(A64_ORR(is64, dst, dst, tmp), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:957:30: note: in expansion of macro 'A64_EOR'
     957 |                         emit(A64_EOR(is64, dst, dst, tmp), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:260:34: note: in expansion of macro 'A64_LOGIC_SREG'
     260 | #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:957:30: note: in expansion of macro 'A64_EOR'
     957 |                         emit(A64_EOR(is64, dst, dst, tmp), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:261:34: note: in expansion of macro 'A64_LOGIC_SREG'
     261 | #define A64_ANDS(sf, Rd, Rn, Rm) A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND_SETFLAGS)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:263:29: note: in expansion of macro 'A64_ANDS'
     263 | #define A64_TST(sf, Rn, Rm) A64_ANDS(sf, A64_ZR, Rn, Rm)
         |                             ^~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:1069:22: note: in expansion of macro 'A64_TST'
    1069 |                 emit(A64_TST(is64, dst, src), ctx);
         |                      ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:261:34: note: in expansion of macro 'A64_LOGIC_SREG'
     261 | #define A64_ANDS(sf, Rd, Rn, Rm) A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND_SETFLAGS)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:263:29: note: in expansion of macro 'A64_ANDS'
     263 | #define A64_TST(sf, Rn, Rm) A64_ANDS(sf, A64_ZR, Rn, Rm)
         |                             ^~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:1069:22: note: in expansion of macro 'A64_TST'
    1069 |                 emit(A64_TST(is64, dst, src), ctx);
         |                      ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:256:34: warning: implicit conversion from 'enum aarch64_insn_logic_type' to 'enum aarch64_insn_variant' [-Wenum-conversion]
     256 |                 A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
         |                                  ^~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:261:34: note: in expansion of macro 'A64_LOGIC_SREG'
     261 | #define A64_ANDS(sf, Rd, Rn, Rm) A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND_SETFLAGS)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:263:29: note: in expansion of macro 'A64_ANDS'
     263 | #define A64_TST(sf, Rn, Rm) A64_ANDS(sf, A64_ZR, Rn, Rm)
         |                             ^~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:1108:30: note: in expansion of macro 'A64_TST'
    1108 |                         emit(A64_TST(is64, dst, tmp), ctx);
         |                              ^~~~~~~
>> arch/arm64/net/bpf_jit.h:255:9: error: too few arguments to function 'aarch64_insn_gen_logical_shifted_reg'
     255 |         aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:261:34: note: in expansion of macro 'A64_LOGIC_SREG'
     261 | #define A64_ANDS(sf, Rd, Rn, Rm) A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND_SETFLAGS)
         |                                  ^~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit.h:263:29: note: in expansion of macro 'A64_ANDS'
     263 | #define A64_TST(sf, Rn, Rm) A64_ANDS(sf, A64_ZR, Rn, Rm)
         |                             ^~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:1108:30: note: in expansion of macro 'A64_TST'
    1108 |                         emit(A64_TST(is64, dst, tmp), ctx);
         |                              ^~~~~~~
   arch/arm64/include/asm/insn.h:847:5: note: declared here
     847 | u32 aarch64_insn_gen_logical_shifted_reg(enum aarch64_insn_register dst,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/aarch64_insn_gen_logical_shifted_reg +255 arch/arm64/net/bpf_jit.h

e54bcde3d69d40 Zi Shen Lim 2014-08-26  252  
e54bcde3d69d40 Zi Shen Lim 2014-08-26  253  /* Logical (shifted register) */
e54bcde3d69d40 Zi Shen Lim 2014-08-26  254  #define A64_LOGIC_SREG(sf, Rd, Rn, Rm, type) \
e54bcde3d69d40 Zi Shen Lim 2014-08-26 @255  	aarch64_insn_gen_logical_shifted_reg(Rd, Rn, Rm, 0, \
e54bcde3d69d40 Zi Shen Lim 2014-08-26  256  		A64_VARIANT(sf), AARCH64_INSN_LOGIC_##type)
e54bcde3d69d40 Zi Shen Lim 2014-08-26  257  /* Rd = Rn OP Rm */
e54bcde3d69d40 Zi Shen Lim 2014-08-26  258  #define A64_AND(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND)
e54bcde3d69d40 Zi Shen Lim 2014-08-26  259  #define A64_ORR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, ORR)
e54bcde3d69d40 Zi Shen Lim 2014-08-26  260  #define A64_EOR(sf, Rd, Rn, Rm)  A64_LOGIC_SREG(sf, Rd, Rn, Rm, EOR)
e54bcde3d69d40 Zi Shen Lim 2014-08-26  261  #define A64_ANDS(sf, Rd, Rn, Rm) A64_LOGIC_SREG(sf, Rd, Rn, Rm, AND_SETFLAGS)
e54bcde3d69d40 Zi Shen Lim 2014-08-26  262  /* Rn & Rm; set condition flags */
e54bcde3d69d40 Zi Shen Lim 2014-08-26  263  #define A64_TST(sf, Rn, Rm) A64_ANDS(sf, A64_ZR, Rn, Rm)
1902472b4fa97d Hou Tao     2022-02-17  264  /* Rd = ~Rm (alias of ORN with A64_ZR as Rn) */
1902472b4fa97d Hou Tao     2022-02-17  265  #define A64_MVN(sf, Rd, Rm)  \
1902472b4fa97d Hou Tao     2022-02-17  266  	A64_LOGIC_SREG(sf, Rd, A64_ZR, Rm, ORN)
e54bcde3d69d40 Zi Shen Lim 2014-08-26  267  

:::::: The code at line 255 was first introduced by commit
:::::: e54bcde3d69d40023ae77727213d14f920eb264a arm64: eBPF JIT compiler

:::::: TO: Zi Shen Lim <zlim.lnx@gmail.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
