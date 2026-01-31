Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1666C2253EE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769847981; cv=none; b=ldCKMH7wc7MLYKQiVQNf3Pf1SPLTjOnXukMWYQFK+MnXnXVUNwD7ittJBYfdhqF+Om7Bpw2uy85dyOVxu1y0/AYECh5UguF+GBvGdNb7SmqTzzj5Avxd7cKAJuQp4u09cGP3g9FLx3C6vqSGfx7pI7TiEd0L/ojAV9hlfNHe6aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769847981; c=relaxed/simple;
	bh=MWpg11IV4+3DKznH3FsSxvtFxO4W30YcDQZ4iY16MRE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bek/MT4+WhoDNpIm9elTE0qMIErWOH/Xgn6cGMCR/sjODLoksh9KM25HJdgrz7KOmHTaXj11FRvZZgu9onfMwVVvxvif8we5IFA48FkJFWNKItRLAij9Zs6I0+f72bmZ7vNWoybduLLqDt093PCmIRr+bTQ8uLsauWnRN0pIy7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OIQkblBM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OIQkblBM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769847977; x=1801383977;
  h=date:from:to:cc:subject:message-id;
  bh=MWpg11IV4+3DKznH3FsSxvtFxO4W30YcDQZ4iY16MRE=;
  b=OIQkblBMqyvOYPXi3hNCFnrMSbllAP0TjUA3OmS0ImjzM+n0xCMWET8Z
   SlBcJqTkx32jPYldK78XMY4GQPb1O6+DvzT4c/Mn94QgapEbB+QHWkcwQ
   Au0/imFZwpoxR0l67UvmcIcQn6U7KUtgFnUtJBxq0XgrH7DpCNrusFuzW
   NPqiWr9XqfbhSvQj6yKt8k/MAgrjk8pmGEMrXdPGugZiALZUKO4OaMEO0
   1pMKHRLUXtotwSsZtU10M21X6WsdtgLNni97UHzx7yYBCfp6H+7izYGG7
   cxdVTep/6JALCyC0BIDxkU8qdu+gmQ7e8B435xzOZve8wy2d5QpGxDCI0
   Q==;
X-CSE-ConnectionGUID: elyz4k7wTnC2IXtL43HpPg==
X-CSE-MsgGUID: aYpM+LhCQKmUBpP60wMjyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="70986582"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="70986582"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 00:26:16 -0800
X-CSE-ConnectionGUID: +m9E1MhtTJ2UMPd4HK+EUw==
X-CSE-MsgGUID: oVQiahtGTjeA1zE2MpGLMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="208167044"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 31 Jan 2026 00:26:14 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm6J1-000000002fZ-3xNa;
	Sat, 31 Jan 2026 08:26:11 +0000
Date: Sat, 31 Jan 2026 09:25:28 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_9 3/12]
 arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no
 member named 'cookie'
Message-ID: <202601310958.uEQmNA4G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_9
head:   4a1d38e3df06743886a06b547187aec8023ef27d
commit: 79e86aac9eaf3b5bdb4db339fb6082022ef69eb9 [3/12] bpf: Add struct bpf_tramp_node object
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260131/202601310958.uEQmNA4G-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601310958.uEQmNA4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601310958.uEQmNA4G-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/powerpc/net/bpf_jit_comp.c:23:
   arch/powerpc/net/bpf_jit_comp.c: In function 'invoke_bpf_prog':
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:80:28: note: in definition of macro 'PPC_LI64'
      80 |                 if ((long)(i) >= -2147483648 &&                               \
         |                            ^
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:81:40: note: in definition of macro 'PPC_LI64'
      81 |                                 (long)(i) < 2147483648)                       \
         |                                        ^
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:64:38: note: in definition of macro 'PPC_LI32'
      64 |                 if ((int)(uintptr_t)(i) >= -32768 &&                          \
         |                                      ^
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:65:50: note: in definition of macro 'PPC_LI32'
      65 |                                 (int)(uintptr_t)(i) < 32768)                  \
         |                                                  ^
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:66:25: note: in expansion of macro 'EMIT'
      66 |                         EMIT(PPC_RAW_LI(d, i));                               \
         |                         ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:501:85: note: in expansion of macro 'IMM_L'
     501 | #define PPC_RAW_ADDI(d, a, i)           (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:502:41: note: in expansion of macro 'PPC_RAW_ADDI'
     502 | #define PPC_RAW_LI(r, i)                PPC_RAW_ADDI(r, 0, i)
         |                                         ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:66:30: note: in expansion of macro 'PPC_RAW_LI'
      66 |                         EMIT(PPC_RAW_LI(d, i));                               \
         |                              ^~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:82:25: note: in expansion of macro 'PPC_LI32'
      82 |                         PPC_LI32(d, i);                                       \
         |                         ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:68:25: note: in expansion of macro 'EMIT'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                         ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:503:85: note: in expansion of macro 'IMM_L'
     503 | #define PPC_RAW_ADDIS(d, a, i)          (0x3c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:506:41: note: in expansion of macro 'PPC_RAW_ADDIS'
     506 | #define PPC_RAW_LIS(r, i)               PPC_RAW_ADDIS(r, 0, i)
         |                                         ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:30: note: in expansion of macro 'PPC_RAW_LIS'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                              ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:45: note: in expansion of macro 'IMM_H'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                                             ^~~~~
   arch/powerpc/net/bpf_jit.h:82:25: note: in expansion of macro 'PPC_LI32'
      82 |                         PPC_LI32(d, i);                                       \
         |                         ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
   In file included from ./arch/powerpc/include/asm/barrier.h:11,
                    from ./include/linux/list.h:11,
                    from ./include/linux/module.h:12,
                    from ./include/linux/moduleloader.h:6,
                    from arch/powerpc/net/bpf_jit_comp.c:10:
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   ./arch/powerpc/include/asm/ppc-opcode.h:113:45: note: in definition of macro 'IMM_L'
     113 | #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
         |                                             ^
   arch/powerpc/net/bpf_jit.h:82:25: note: in expansion of macro 'PPC_LI32'
      82 |                         PPC_LI32(d, i);                                       \
         |                         ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:70:33: note: in expansion of macro 'EMIT'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                 ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:552:85: note: in expansion of macro 'IMM_L'
     552 | #define PPC_RAW_ORI(d, a, i)            (0x60000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit.h:70:38: note: in expansion of macro 'PPC_RAW_ORI'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                      ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:70:56: note: in expansion of macro 'IMM_L'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                                        ^~~~~
   arch/powerpc/net/bpf_jit.h:82:25: note: in expansion of macro 'PPC_LI32'
      82 |                         PPC_LI32(d, i);                                       \
         |                         ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:84:43: note: in definition of macro 'PPC_LI64'
      84 |                         if (!((uintptr_t)(i) & 0xffff800000000000ULL))        \
         |                                           ^
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:85:33: note: in expansion of macro 'EMIT'
      85 |                                 EMIT(PPC_RAW_LI(d, ((uintptr_t)(i) >> 32) &   \
         |                                 ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:501:85: note: in expansion of macro 'IMM_L'
     501 | #define PPC_RAW_ADDI(d, a, i)           (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:502:41: note: in expansion of macro 'PPC_RAW_ADDI'
     502 | #define PPC_RAW_LI(r, i)                PPC_RAW_ADDI(r, 0, i)
         |                                         ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:85:38: note: in expansion of macro 'PPC_RAW_LI'
      85 |                                 EMIT(PPC_RAW_LI(d, ((uintptr_t)(i) >> 32) &   \
         |                                      ^~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:88:33: note: in expansion of macro 'EMIT'
      88 |                                 EMIT(PPC_RAW_LIS(d, ((uintptr_t)(i) >> 48))); \
         |                                 ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:503:85: note: in expansion of macro 'IMM_L'
     503 | #define PPC_RAW_ADDIS(d, a, i)          (0x3c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:506:41: note: in expansion of macro 'PPC_RAW_ADDIS'
     506 | #define PPC_RAW_LIS(r, i)               PPC_RAW_ADDIS(r, 0, i)
         |                                         ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:88:38: note: in expansion of macro 'PPC_RAW_LIS'
      88 |                                 EMIT(PPC_RAW_LIS(d, ((uintptr_t)(i) >> 48))); \
         |                                      ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:89:49: note: in definition of macro 'PPC_LI64'
      89 |                                 if ((uintptr_t)(i) & 0x0000ffff00000000ULL)   \
         |                                                 ^
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:90:41: note: in expansion of macro 'EMIT'
      90 |                                         EMIT(PPC_RAW_ORI(d, d,                \
         |                                         ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:552:85: note: in expansion of macro 'IMM_L'
     552 | #define PPC_RAW_ORI(d, a, i)            (0x60000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit.h:90:46: note: in expansion of macro 'PPC_RAW_ORI'
      90 |                                         EMIT(PPC_RAW_ORI(d, d,                \
         |                                              ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:94:41: note: in definition of macro 'PPC_LI64'
      94 |                         if ((uintptr_t)(i) & 0x00000000ffff0000ULL)           \
         |                                         ^
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:95:33: note: in expansion of macro 'EMIT'
      95 |                                 EMIT(PPC_RAW_ORIS(d, d,                       \
         |                                 ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:553:85: note: in expansion of macro 'IMM_L'
     553 | #define PPC_RAW_ORIS(d, a, i)           (0x64000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit.h:95:38: note: in expansion of macro 'PPC_RAW_ORIS'
      95 |                                 EMIT(PPC_RAW_ORIS(d, d,                       \
         |                                      ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:97:41: note: in definition of macro 'PPC_LI64'
      97 |                         if ((uintptr_t)(i) & 0x000000000000ffffULL)           \
         |                                         ^
>> arch/powerpc/net/bpf_jit_comp.c:495:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:98:33: note: in expansion of macro 'EMIT'
      98 |                                 EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
         |                                 ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:552:85: note: in expansion of macro 'IMM_L'
     552 | #define PPC_RAW_ORI(d, a, i)            (0x60000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit.h:98:38: note: in expansion of macro 'PPC_RAW_ORI'
      98 |                                 EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
         |                                      ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:495:17: note: in expansion of macro 'PPC_LI64'
     495 |                 PPC_LI64(_R3, l->cookie);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:499:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:64:38: note: in definition of macro 'PPC_LI32'
      64 |                 if ((int)(uintptr_t)(i) >= -32768 &&                          \
         |                                      ^
   arch/powerpc/net/bpf_jit_comp.c:499:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:65:50: note: in definition of macro 'PPC_LI32'
      65 |                                 (int)(uintptr_t)(i) < 32768)                  \
         |                                                  ^
   arch/powerpc/net/bpf_jit_comp.c:499:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:66:25: note: in expansion of macro 'EMIT'
      66 |                         EMIT(PPC_RAW_LI(d, i));                               \
         |                         ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:501:85: note: in expansion of macro 'IMM_L'
     501 | #define PPC_RAW_ADDI(d, a, i)           (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:502:41: note: in expansion of macro 'PPC_RAW_ADDI'
     502 | #define PPC_RAW_LI(r, i)                PPC_RAW_ADDI(r, 0, i)
         |                                         ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:66:30: note: in expansion of macro 'PPC_RAW_LI'
      66 |                         EMIT(PPC_RAW_LI(d, i));                               \
         |                              ^~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:499:17: note: in expansion of macro 'PPC_LI32'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:499:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:68:25: note: in expansion of macro 'EMIT'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                         ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:503:85: note: in expansion of macro 'IMM_L'
     503 | #define PPC_RAW_ADDIS(d, a, i)          (0x3c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:506:41: note: in expansion of macro 'PPC_RAW_ADDIS'
     506 | #define PPC_RAW_LIS(r, i)               PPC_RAW_ADDIS(r, 0, i)
         |                                         ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:30: note: in expansion of macro 'PPC_RAW_LIS'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                              ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:45: note: in expansion of macro 'IMM_H'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                                             ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:499:17: note: in expansion of macro 'PPC_LI32'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:499:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                                ^~
   ./arch/powerpc/include/asm/ppc-opcode.h:113:45: note: in definition of macro 'IMM_L'
     113 | #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
         |                                             ^
   arch/powerpc/net/bpf_jit_comp.c:499:17: note: in expansion of macro 'PPC_LI32'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:499:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:70:33: note: in expansion of macro 'EMIT'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                 ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:552:85: note: in expansion of macro 'IMM_L'
     552 | #define PPC_RAW_ORI(d, a, i)            (0x60000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit.h:70:38: note: in expansion of macro 'PPC_RAW_ORI'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                      ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:70:56: note: in expansion of macro 'IMM_L'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                                        ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:499:17: note: in expansion of macro 'PPC_LI32'
     499 |                 PPC_LI32(_R3, l->cookie >> 32);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:64:38: note: in definition of macro 'PPC_LI32'
      64 |                 if ((int)(uintptr_t)(i) >= -32768 &&                          \
         |                                      ^
   arch/powerpc/net/bpf_jit_comp.c:500:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:65:50: note: in definition of macro 'PPC_LI32'
      65 |                                 (int)(uintptr_t)(i) < 32768)                  \
         |                                                  ^
   arch/powerpc/net/bpf_jit_comp.c:500:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:66:25: note: in expansion of macro 'EMIT'
      66 |                         EMIT(PPC_RAW_LI(d, i));                               \
         |                         ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:501:85: note: in expansion of macro 'IMM_L'
     501 | #define PPC_RAW_ADDI(d, a, i)           (0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:502:41: note: in expansion of macro 'PPC_RAW_ADDI'
     502 | #define PPC_RAW_LI(r, i)                PPC_RAW_ADDI(r, 0, i)
         |                                         ^~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:66:30: note: in expansion of macro 'PPC_RAW_LI'
      66 |                         EMIT(PPC_RAW_LI(d, i));                               \
         |                              ^~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:17: note: in expansion of macro 'PPC_LI32'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:68:25: note: in expansion of macro 'EMIT'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                         ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:503:85: note: in expansion of macro 'IMM_L'
     503 | #define PPC_RAW_ADDIS(d, a, i)          (0x3c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
         |                                                                                     ^~~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:506:41: note: in expansion of macro 'PPC_RAW_ADDIS'
     506 | #define PPC_RAW_LIS(r, i)               PPC_RAW_ADDIS(r, 0, i)
         |                                         ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:30: note: in expansion of macro 'PPC_RAW_LIS'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                              ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:68:45: note: in expansion of macro 'IMM_H'
      68 |                         EMIT(PPC_RAW_LIS(d, IMM_H(i)));                       \
         |                                             ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:17: note: in expansion of macro 'PPC_LI32'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                                ^~
   ./arch/powerpc/include/asm/ppc-opcode.h:113:45: note: in definition of macro 'IMM_L'
     113 | #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
         |                                             ^
   arch/powerpc/net/bpf_jit_comp.c:500:17: note: in expansion of macro 'PPC_LI32'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:32: error: 'struct bpf_tramp_link' has no member named 'cookie'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                                ^~
   arch/powerpc/net/bpf_jit.h:29:34: note: in definition of macro 'PLANT_INSTR'
      29 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
         |                                  ^~~~~
   arch/powerpc/net/bpf_jit.h:70:33: note: in expansion of macro 'EMIT'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                 ^~~~
   ./arch/powerpc/include/asm/ppc-opcode.h:552:85: note: in expansion of macro 'IMM_L'
     552 | #define PPC_RAW_ORI(d, a, i)            (0x60000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
         |                                                                                     ^~~~~
   arch/powerpc/net/bpf_jit.h:70:38: note: in expansion of macro 'PPC_RAW_ORI'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                      ^~~~~~~~~~~
   arch/powerpc/net/bpf_jit.h:70:56: note: in expansion of macro 'IMM_L'
      70 |                                 EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));            \
         |                                                        ^~~~~
   arch/powerpc/net/bpf_jit_comp.c:500:17: note: in expansion of macro 'PPC_LI32'
     500 |                 PPC_LI32(_R4, l->cookie);
         |                 ^~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
>> arch/powerpc/net/bpf_jit_comp.c:567:38: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
     567 |                               struct bpf_tramp_links *tl, int regs_off, int retval_off,
         |                                      ^~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function 'invoke_bpf_mod_ret':
>> arch/powerpc/net/bpf_jit_comp.c:578:27: error: invalid use of undefined type 'struct bpf_tramp_links'
     578 |         for (i = 0; i < tl->nr_links; i++) {
         |                           ^~
   arch/powerpc/net/bpf_jit_comp.c:579:61: error: invalid use of undefined type 'struct bpf_tramp_links'
     579 |                 if (invoke_bpf_prog(image, ro_image, ctx, tl->links[i], regs_off, retval_off,
         |                                                             ^~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
   arch/powerpc/net/bpf_jit_comp.c:678:49: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                                 ^~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function '__arch_prepare_bpf_trampoline':
   arch/powerpc/net/bpf_jit_comp.c:683:51: error: invalid use of undefined type 'struct bpf_tramp_links'
     683 |         struct bpf_tramp_links *fmod_ret = &tlinks[BPF_TRAMP_MODIFY_RETURN];
         |                                                   ^
   arch/powerpc/net/bpf_jit_comp.c:684:49: error: invalid use of undefined type 'struct bpf_tramp_links'
     684 |         struct bpf_tramp_links *fentry = &tlinks[BPF_TRAMP_FENTRY];
         |                                                 ^
   arch/powerpc/net/bpf_jit_comp.c:685:48: error: invalid use of undefined type 'struct bpf_tramp_links'
     685 |         struct bpf_tramp_links *fexit = &tlinks[BPF_TRAMP_FEXIT];
         |                                                ^
   arch/powerpc/net/bpf_jit_comp.c:870:31: error: invalid use of undefined type 'struct bpf_tramp_links'
     870 |         for (i = 0; i < fentry->nr_links; i++)
         |                               ^~
   arch/powerpc/net/bpf_jit_comp.c:871:65: error: invalid use of undefined type 'struct bpf_tramp_links'
     871 |                 if (invoke_bpf_prog(image, ro_image, ctx, fentry->links[i], regs_off, retval_off,
         |                                                                 ^~
   arch/powerpc/net/bpf_jit_comp.c:875:21: error: invalid use of undefined type 'struct bpf_tramp_links'
     875 |         if (fmod_ret->nr_links) {
         |                     ^~
   In file included from ./include/linux/workqueue.h:9,
                    from ./include/linux/mm_types.h:19,
                    from ./include/linux/mmzone.h:22,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/umh.h:4,
                    from ./include/linux/kmod.h:9,
                    from ./include/linux/module.h:18:
   arch/powerpc/net/bpf_jit_comp.c:876:44: error: invalid use of undefined type 'struct bpf_tramp_links'
     876 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
         |                                            ^~
   ./include/linux/alloc_tag.h:251:16: note: in definition of macro 'alloc_hooks_tag'
     251 |         typeof(_do_alloc) _res;                                         \
         |                ^~~~~~~~~
   ./include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   ./include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_array'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:876:28: note: in expansion of macro 'kcalloc'
     876 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
         |                            ^~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:876:44: error: invalid use of undefined type 'struct bpf_tramp_links'
     876 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
         |                                            ^~
   ./include/linux/alloc_tag.h:255:24: note: in definition of macro 'alloc_hooks_tag'
     255 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   ./include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   ./include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_array'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:876:28: note: in expansion of macro 'kcalloc'
     876 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
         |                            ^~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:876:44: error: invalid use of undefined type 'struct bpf_tramp_links'
     876 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
         |                                            ^~
   ./include/linux/alloc_tag.h:258:24: note: in definition of macro 'alloc_hooks_tag'
     258 |                 _res = _do_alloc;                                       \
         |                        ^~~~~~~~~
   ./include/linux/slab.h:1005:49: note: in expansion of macro 'alloc_hooks'
    1005 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   ./include/linux/slab.h:1044:41: note: in expansion of macro 'kmalloc_array'
    1044 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:876:28: note: in expansion of macro 'kcalloc'
     876 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
         |                            ^~~~~~~
>> arch/powerpc/net/bpf_jit_comp.c:876:26: error: assignment to 'u32 *' {aka 'unsigned int *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     876 |                 branches = kcalloc(fmod_ret->nr_links, sizeof(u32), GFP_KERNEL);
         |                          ^
   arch/powerpc/net/bpf_jit_comp.c:880:62: error: passing argument 4 of 'invoke_bpf_mod_ret' from incompatible pointer type [-Wincompatible-pointer-types]
     880 |                 if (invoke_bpf_mod_ret(image, ro_image, ctx, fmod_ret, regs_off, retval_off,
         |                                                              ^~~~~~~~
         |                                                              |
         |                                                              struct bpf_tramp_links *
   arch/powerpc/net/bpf_jit_comp.c:567:55: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
     567 |                               struct bpf_tramp_links *tl, int regs_off, int retval_off,
         |                               ~~~~~~~~~~~~~~~~~~~~~~~~^~
   arch/powerpc/net/bpf_jit_comp.c:925:33: error: invalid use of undefined type 'struct bpf_tramp_links'
     925 |         for (i = 0; i < fmod_ret->nr_links && image; i++) {
         |                                 ^~
   arch/powerpc/net/bpf_jit_comp.c:935:30: error: invalid use of undefined type 'struct bpf_tramp_links'
     935 |         for (i = 0; i < fexit->nr_links; i++)
         |                              ^~
   arch/powerpc/net/bpf_jit_comp.c:936:64: error: invalid use of undefined type 'struct bpf_tramp_links'
     936 |                 if (invoke_bpf_prog(image, ro_image, ctx, fexit->links[i], regs_off, retval_off,
         |                                                                ^~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
   arch/powerpc/net/bpf_jit_comp.c:1002:37: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1002 |                              struct bpf_tramp_links *tlinks, void *func_addr)
         |                                     ^~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:1001:5: error: conflicting types for 'arch_bpf_trampoline_size'; have 'int(const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1001 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ./include/linux/security.h:35,
                    from ./include/net/scm.h:9,
                    from ./include/linux/netlink.h:9,
                    from ./include/uapi/linux/neighbour.h:6,
                    from ./include/linux/netdevice.h:44,
                    from arch/powerpc/net/bpf_jit_comp.c:13:
   ./include/linux/bpf.h:1270:5: note: previous declaration of 'arch_bpf_trampoline_size' with type 'int(const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {aka 'int(const struct btf_func_model *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1270 | int arch_bpf_trampoline_size(const struct btf_func_model *m, u32 flags,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function 'arch_bpf_trampoline_size':
   arch/powerpc/net/bpf_jit_comp.c:1007:78: error: passing argument 7 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Wincompatible-pointer-types]
    1007 |         ret = __arch_prepare_bpf_trampoline(&im, NULL, NULL, NULL, m, flags, tlinks, func_addr);
         |                                                                              ^~~~~~
         |                                                                              |
         |                                                                              struct bpf_tramp_links *
   arch/powerpc/net/bpf_jit_comp.c:678:66: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~
   arch/powerpc/net/bpf_jit_comp.c: At top level:
   arch/powerpc/net/bpf_jit_comp.c:1013:40: warning: 'struct bpf_tramp_links' declared inside parameter list will not be visible outside of this definition or declaration
    1013 |                                 struct bpf_tramp_links *tlinks,
         |                                        ^~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c:1011:5: error: conflicting types for 'arch_prepare_bpf_trampoline'; have 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_links *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_links *, void *)'}
    1011 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   ./include/linux/bpf.h:1263:5: note: previous declaration of 'arch_prepare_bpf_trampoline' with type 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, u32,  struct bpf_tramp_nodes *, void *)' {aka 'int(struct bpf_tramp_image *, void *, void *, const struct btf_func_model *, unsigned int,  struct bpf_tramp_nodes *, void *)'}
    1263 | int arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image_end,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/net/bpf_jit_comp.c: In function 'arch_prepare_bpf_trampoline':
   arch/powerpc/net/bpf_jit_comp.c:1029:52: error: passing argument 7 of '__arch_prepare_bpf_trampoline' from incompatible pointer type [-Wincompatible-pointer-types]
    1029 |                                             flags, tlinks, func_addr);
         |                                                    ^~~~~~
         |                                                    |
         |                                                    struct bpf_tramp_links *
   arch/powerpc/net/bpf_jit_comp.c:678:66: note: expected 'struct bpf_tramp_links *' but argument is of type 'struct bpf_tramp_links *'
     678 |                                          struct bpf_tramp_links *tlinks,
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~


vim +495 arch/powerpc/net/bpf_jit_comp.c

d243b62b7bd3d5 Naveen N Rao 2024-10-30  483  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  484  static int invoke_bpf_prog(u32 *image, u32 *ro_image, struct codegen_context *ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  485  			   struct bpf_tramp_link *l, int regs_off, int retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  486  			   int run_ctx_off, bool save_ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  487  {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  488  	struct bpf_prog *p = l->link.prog;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  489  	ppc_inst_t branch_insn;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  490  	u32 jmp_idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  491  	int ret = 0;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  492  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  493  	/* Save cookie */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  494  	if (IS_ENABLED(CONFIG_PPC64)) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30 @495  		PPC_LI64(_R3, l->cookie);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  496  		EMIT(PPC_RAW_STD(_R3, _R1, run_ctx_off + offsetof(struct bpf_tramp_run_ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  497  				 bpf_cookie)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  498  	} else {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  499  		PPC_LI32(_R3, l->cookie >> 32);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  500  		PPC_LI32(_R4, l->cookie);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  501  		EMIT(PPC_RAW_STW(_R3, _R1,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  502  				 run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  503  		EMIT(PPC_RAW_STW(_R4, _R1,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  504  				 run_ctx_off + offsetof(struct bpf_tramp_run_ctx, bpf_cookie) + 4));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  505  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  506  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  507  	/* __bpf_prog_enter(p, &bpf_tramp_run_ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  508  	PPC_LI_ADDR(_R3, p);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  509  	EMIT(PPC_RAW_MR(_R25, _R3));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  510  	EMIT(PPC_RAW_ADDI(_R4, _R1, run_ctx_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  511  	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  512  					 (unsigned long)bpf_trampoline_enter(p));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  513  	if (ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  514  		return ret;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  515  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  516  	/* Remember prog start time returned by __bpf_prog_enter */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  517  	EMIT(PPC_RAW_MR(_R26, _R3));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  518  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  519  	/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  520  	 * if (__bpf_prog_enter(p) == 0)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  521  	 *	goto skip_exec_of_prog;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  522  	 *
d243b62b7bd3d5 Naveen N Rao 2024-10-30  523  	 * Emit a nop to be later patched with conditional branch, once offset is known
d243b62b7bd3d5 Naveen N Rao 2024-10-30  524  	 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  525  	EMIT(PPC_RAW_CMPLI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  526  	jmp_idx = ctx->idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  527  	EMIT(PPC_RAW_NOP());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  528  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  529  	/* p->bpf_func(ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  530  	EMIT(PPC_RAW_ADDI(_R3, _R1, regs_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  531  	if (!p->jited)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  532  		PPC_LI_ADDR(_R4, (unsigned long)p->insnsi);
59ba025948be2a Hari Bathini 2025-04-22  533  	/* Account for max possible instructions during dummy pass for size calculation */
59ba025948be2a Hari Bathini 2025-04-22  534  	if (image && !create_branch(&branch_insn, (u32 *)&ro_image[ctx->idx],
59ba025948be2a Hari Bathini 2025-04-22  535  				    (unsigned long)p->bpf_func,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  536  				    BRANCH_SET_LINK)) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  537  		image[ctx->idx] = ppc_inst_val(branch_insn);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  538  		ctx->idx++;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  539  	} else {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  540  		EMIT(PPC_RAW_LL(_R12, _R25, offsetof(struct bpf_prog, bpf_func)));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  541  		EMIT(PPC_RAW_MTCTR(_R12));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  542  		EMIT(PPC_RAW_BCTRL());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  543  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  544  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  545  	if (save_ret)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  546  		EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  547  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  548  	/* Fix up branch */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  549  	if (image) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  550  		if (create_cond_branch(&branch_insn, &image[jmp_idx],
d243b62b7bd3d5 Naveen N Rao 2024-10-30  551  				       (unsigned long)&image[ctx->idx], COND_EQ << 16))
d243b62b7bd3d5 Naveen N Rao 2024-10-30  552  			return -EINVAL;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  553  		image[jmp_idx] = ppc_inst_val(branch_insn);
d243b62b7bd3d5 Naveen N Rao 2024-10-30  554  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  555  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  556  	/* __bpf_prog_exit(p, start_time, &bpf_tramp_run_ctx) */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  557  	EMIT(PPC_RAW_MR(_R3, _R25));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  558  	EMIT(PPC_RAW_MR(_R4, _R26));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  559  	EMIT(PPC_RAW_ADDI(_R5, _R1, run_ctx_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  560  	ret = bpf_jit_emit_func_call_rel(image, ro_image, ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  561  					 (unsigned long)bpf_trampoline_exit(p));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  562  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  563  	return ret;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  564  }
d243b62b7bd3d5 Naveen N Rao 2024-10-30  565  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  566  static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context *ctx,
d243b62b7bd3d5 Naveen N Rao 2024-10-30 @567  			      struct bpf_tramp_links *tl, int regs_off, int retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  568  			      int run_ctx_off, u32 *branches)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  569  {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  570  	int i;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  571  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  572  	/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  573  	 * The first fmod_ret program will receive a garbage return value.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  574  	 * Set this to 0 to avoid confusing the program.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  575  	 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  576  	EMIT(PPC_RAW_LI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  577  	EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30 @578  	for (i = 0; i < tl->nr_links; i++) {
d243b62b7bd3d5 Naveen N Rao 2024-10-30  579  		if (invoke_bpf_prog(image, ro_image, ctx, tl->links[i], regs_off, retval_off,
d243b62b7bd3d5 Naveen N Rao 2024-10-30  580  				    run_ctx_off, true))
d243b62b7bd3d5 Naveen N Rao 2024-10-30  581  			return -EINVAL;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  582  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  583  		/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  584  		 * mod_ret prog stored return value after prog ctx. Emit:
d243b62b7bd3d5 Naveen N Rao 2024-10-30  585  		 * if (*(u64 *)(ret_val) !=  0)
d243b62b7bd3d5 Naveen N Rao 2024-10-30  586  		 *	goto do_fexit;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  587  		 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  588  		EMIT(PPC_RAW_LL(_R3, _R1, retval_off));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  589  		EMIT(PPC_RAW_CMPLI(_R3, 0));
d243b62b7bd3d5 Naveen N Rao 2024-10-30  590  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  591  		/*
d243b62b7bd3d5 Naveen N Rao 2024-10-30  592  		 * Save the location of the branch and generate a nop, which is
d243b62b7bd3d5 Naveen N Rao 2024-10-30  593  		 * replaced with a conditional jump once do_fexit (i.e. the
d243b62b7bd3d5 Naveen N Rao 2024-10-30  594  		 * start of the fexit invocation) is finalized.
d243b62b7bd3d5 Naveen N Rao 2024-10-30  595  		 */
d243b62b7bd3d5 Naveen N Rao 2024-10-30  596  		branches[i] = ctx->idx;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  597  		EMIT(PPC_RAW_NOP());
d243b62b7bd3d5 Naveen N Rao 2024-10-30  598  	}
d243b62b7bd3d5 Naveen N Rao 2024-10-30  599  
d243b62b7bd3d5 Naveen N Rao 2024-10-30  600  	return 0;
d243b62b7bd3d5 Naveen N Rao 2024-10-30  601  }
d243b62b7bd3d5 Naveen N Rao 2024-10-30  602  

:::::: The code at line 495 was first introduced by commit
:::::: d243b62b7bd3d5314382d3b54e4992226245e936 powerpc64/bpf: Add support for bpf trampolines

:::::: TO: Naveen N Rao <naveen@kernel.org>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
