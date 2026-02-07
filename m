Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF10352FAC
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 15:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770476991; cv=none; b=QmBzDx29VIHKhXCL4EbjOGQ9VrFLLFIOdB+kJ2vw08LpW16yLF0N6jDKFFESbcBJTc8y+z/oav1q2+ccfCkFvFbhJ78wTsjYu79ElgupNaA3ypbhAhwt3i5dj2pRd6pBEWRuqCcWTudiJ+QUEVlDZJKnDYaKUSEuiX0iw1vXTRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770476991; c=relaxed/simple;
	bh=sPUAusJoJWpdBiebT5K7J7G9aFVqVxc8GUQlR1P7C6o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=c3RKk6iNDMah3qbrqVaArvQk5DHXzm2Xm39XfvxDEDF1ZN4aTDdZQPDUKbIV6dKtc1LP+ZGcieNptBMkdpB69vYFNsv7L0bwc7CDlScENdHz9EqZNy4acie/4tojnM90X8qz8z0bbnR8JC7C0tjQAxUX9+CwT+w0HV5Asss+3a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M55mU7TL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M55mU7TL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770476990; x=1802012990;
  h=date:from:to:cc:subject:message-id;
  bh=sPUAusJoJWpdBiebT5K7J7G9aFVqVxc8GUQlR1P7C6o=;
  b=M55mU7TLN65KDqbizuGHT6p4lC5lhrxzT4Jk9Wgt+7//hd8FHhfZFbJW
   tL17Hl0DUX3/0GctgCJZlmGw9sz/hTKN+Z4Xe33HcnRAOZXT9kYeo8heW
   akAR3r29e3vqWfEipk0gNmu0ey+IbDF/2CYgMFV9LCXi/9LVdr7WYMw3c
   zSEtNI/X3Yl4W8eBddaiVAoGt8mP9F+LOKm3kdG4a2gh9yg8RzhJYqXgh
   Lery4nmcr16fToDJIZJdjYSFvpm+TCIuF9nWDOUL3+eF5xwB/mFXBgO+7
   qYWwNYxJm/WEfnrSpdu6ajiyTm1d59QyevGfMs8ZEnyah2JOeOcUgKPUn
   A==;
X-CSE-ConnectionGUID: j2hGuPIjR8mq40VM7og/dg==
X-CSE-MsgGUID: 7MCp6aEwQZirxZX33xo8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11694"; a="75509335"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="75509335"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 07:09:49 -0800
X-CSE-ConnectionGUID: plLV3r/hQ5mj1edBc3TE9g==
X-CSE-MsgGUID: b31KVKnbRAqNaQd1ev9uFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="215654733"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Feb 2026 07:09:47 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vojwO-00000000lhw-41Dw;
	Sat, 07 Feb 2026 15:09:44 +0000
Date: Sat, 07 Feb 2026 23:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:trace_sched_wakeup_backtrace 332/332]
 kernel/sched/core.c:4195: undefined reference to
 `__xchg_called_with_bad_pointer'
Message-ID: <202602072326.popNJTfc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/koverstreet/bcachefs trace_sched_wakeup_backtrace
head:   9e7cbd4ad9c7a7ba461dbba9185628c006e200cd
commit: 9e7cbd4ad9c7a7ba461dbba9185628c006e200cd [332/332] trace_sched_wakeup_backtrace
config: xtensa-randconfig-001-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072326.popNJTfc-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602072326.popNJTfc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602072326.popNJTfc-lkp@intel.com/

All errors (new ones prefixed by >>):

   xtensa-linux-ld: kernel/sched/core.o: in function `cpus_share_resources':
>> kernel/sched/core.c:4195: undefined reference to `__xchg_called_with_bad_pointer'
   xtensa-linux-ld: kernel/sched/core.o: in function `__arch_xchg':
>> arch/xtensa/include/asm/cmpxchg.h:218: undefined reference to `__xchg_called_with_bad_pointer'
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:197:(.xiptext+0x156): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.c:198:(.xiptext+0x15c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:200:(.xiptext+0x178): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:204:(.xiptext+0x195): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0x1a3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0x1b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:208:(.xiptext+0x1c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:211:(.xiptext+0x1d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `kmalloc_noprof':
   include/linux/slab.h:909:(.xiptext+0x1ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __kmalloc_noprof
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x1fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x210): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:212:(.xiptext+0x21e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x227): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:215:(.xiptext+0x233): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_probe.c:219:(.xiptext+0x243): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x25a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x269): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x277): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x27f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x285): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:222:(.xiptext+0x28b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x2ac): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:224:(.xiptext+0x2b7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:223:(.xiptext+0x2cb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:227:(.xiptext+0x2da): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `__fswab16':
   include/uapi/linux/swab.h:51:(.xiptext+0x2ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x30a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x327): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x344): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x362): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   include/uapi/linux/swab.h:51:(.xiptext+0x37f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x4)
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:241:(.xiptext+0x398): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:240:(.xiptext+0x3ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x3ff): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x41a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x42c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:250:(.xiptext+0x43a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x450): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:263:(.xiptext+0x467): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:264:(.xiptext+0x47c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:265:(.xiptext+0x493): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:266:(.xiptext+0x4aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_probe.c:267:(.xiptext+0x4b4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d4)
   drivers/mtd/chips/cfi_probe.c:268:(.xiptext+0x4c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1d4)
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x4d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x4e3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x4f4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:271:(.xiptext+0x502): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x50a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:272:(.xiptext+0x51b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:273:(.xiptext+0x52a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x98)
   drivers/mtd/chips/cfi_probe.c:276:(.xiptext+0x538): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:277:(.xiptext+0x555): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_early_fixup':
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x561): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x570): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x57c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x582): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x591): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x59c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5ab): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5c8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:84:(.xiptext+0x5d7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:86:(.xiptext+0x5df): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:83:(.xiptext+0x5ef): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_chip_setup':
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x5fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:281:(.xiptext+0x61b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:285:(.xiptext+0x623): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:98:(.xiptext+0x73a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x742): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x752): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x764): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:101:(.xiptext+0x772): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x77a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x787): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x795): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x7a6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x7b8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:107:(.xiptext+0x7c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x7ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x7de): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.o: in function `arch_local_save_flags':
   arch/xtensa/include/asm/irqflags.h:22:(.xiptext+0x7e9): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x7fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x810): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x81f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x827): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x82d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x833): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:115:(.xiptext+0x84c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x86d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
--
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:2269:(.text+0x3c52): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2275:(.text+0x3ca2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x6c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x4782): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2627:(.text+0x5032): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0xf28)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x513f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1b0c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words':
   drivers/mtd/chips/cfi_cmdset_0002.c:1858:(.text+0x5567): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1b0c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1882:(.text+0x5662): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1b0c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1925:(.text+0x5902): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x1b0c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffers':
   drivers/mtd/chips/cfi_cmdset_0002.c:2137:(.text+0x5c98): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x23f4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:833:(.xiptext+0x72): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:834:(.xiptext+0x78): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0x83): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x14)
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0x93): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0xa8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0xc3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:838:(.xiptext+0xe0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x110): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x124): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:848:(.xiptext+0x132): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x140): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x153): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:854:(.xiptext+0x166): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x171): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x185): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x18e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:856:(.xiptext+0x19a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1a5): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1b6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1c7): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:859:(.xiptext+0x1d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   drivers/mtd/chips/cfi_cmdset_0002.c:864:(.xiptext+0x20e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:865:(.xiptext+0x214): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x227): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x238): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:868:(.xiptext+0x244): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:871:(.xiptext+0x24c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:1995:(.xiptext+0x27e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x284): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x29b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x2af): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x2c4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1031:(.xiptext+0x2fe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1032:(.xiptext+0x304): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x317): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x31f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x330): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1034:(.xiptext+0x33f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x347): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x356): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1038:(.xiptext+0x369): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x378): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1058:(.xiptext+0x4b2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1059:(.xiptext+0x4bb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x4d0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1066:(.xiptext+0x4dd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4ec): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x4f8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x504): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x512): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x51d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x537): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x555): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1067:(.xiptext+0x560): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x580): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x597): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1084:(.xiptext+0x5a8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x5ca): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x5dd): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1094:(.xiptext+0x5ee): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1097:(.xiptext+0x5fa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x60a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x616): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x643): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1105:(.xiptext+0x65c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x66a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `_cond_resched':
   include/linux/sched.h:2099:(.xiptext+0x670): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x679): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x691): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1118:(.xiptext+0x69e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6c0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6ce): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x6d8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x6e6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x700): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
>> drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x70c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ktime_get
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x71d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0x72a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x747): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x74f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x755): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x762): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x76e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1117:(.xiptext+0x774): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `arch_local_save_flags':
   arch/xtensa/include/asm/irqflags.h:22:(.xiptext+0x786): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x79b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x7ae): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x7ba): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x7c6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x7cc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1081:(.xiptext+0x7d2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x7f0): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1c2c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x80d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x81e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1135:(.xiptext+0x82c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1141:(.xiptext+0x834): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1143:(.xiptext+0x83d): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x857): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x868): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x876): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1144:(.xiptext+0x87e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1145:(.xiptext+0x888): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1940:(.xiptext+0x95e): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1949:(.xiptext+0x966): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `usecs_to_jiffies':
   include/linux/jiffies.h:587:(.xiptext+0x96f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x97f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x98a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x99c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1953:(.xiptext+0x9aa): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x9b3): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1955:(.xiptext+0x9c2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x9e4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x9f2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __trace_set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x9fc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0xa0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0xa24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0xa30): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: ktime_get
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0xa41): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `current_thread_info':
   arch/xtensa/include/asm/thread_info.h:97:(.xiptext+0xa4f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0xa6b): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0xa76): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0xa7c): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1961:(.xiptext+0xa87): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1963:(.xiptext+0xa9a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xaa4): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xab8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xacb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0xadf): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1971:(.xiptext+0xae8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0xb05): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0xb17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1724)
   drivers/mtd/chips/cfi_cmdset_0002.c:1979:(.xiptext+0xb27): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0xb43): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0xb54): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1989:(.xiptext+0xb60): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start':
   drivers/mtd/chips/cfi_cmdset_0002.c:1718:(.xiptext+0xbb6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0xbc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0xbcc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_lock_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1723:(.xiptext+0xbdb): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x1ee0)
   drivers/mtd/chips/cfi_cmdset_0002.c:1724:(.xiptext+0xbea): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1724:(.xiptext+0xbfc): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1724:(.xiptext+0xc0a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0xc12): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0xc1a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unlock
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xc24): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xc32): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xc44): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1729:(.xiptext+0xc50): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0xc58): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0xc6a): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xa94)
   drivers/mtd/chips/cfi_cmdset_0002.c:1730:(.xiptext+0xc70): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1738:(.xiptext+0xcc2): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xcc8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xcd6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xce8): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1739:(.xiptext+0xcf6): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1740:(.xiptext+0xcfe): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1740:(.xiptext+0xd0f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0xb54)
   drivers/mtd/chips/cfi_cmdset_0002.c:1742:(.xiptext+0xd17): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xd26): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xd38): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xd47): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
   drivers/mtd/chips/cfi_cmdset_0002.c:1743:(.xiptext+0xd4f): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: __sanitizer_cov_trace_pc
..


vim +4195 kernel/sched/core.c

9e7cbd4ad9c7a7 kernel/sched/core.c Kent Overstreet  2024-04-12  4073  
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4074  /*
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4075   * Notes on Program-Order guarantees on SMP systems.
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4076   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4077   *  MIGRATION
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4078   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4079   * The basic program-order guarantee on SMP systems is that when a task [t]
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar      2017-02-01  4080   * migrates, all its activity on its old CPU [c0] happens-before any subsequent
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar      2017-02-01  4081   * execution on its new CPU [c1].
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4082   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4083   * For migration (of runnable tasks) this is provided by the following means:
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4084   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4085   *  A) UNLOCK of the rq(c0)->lock scheduling out task t
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4086   *  B) migration for t is required to synchronize *both* rq(c0)->lock and
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4087   *     rq(c1)->lock (if not at the same time, then in that order).
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4088   *  C) LOCK of the rq(c1)->lock scheduling in task
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4089   *
7696f9910a9a40 kernel/sched/core.c Andrea Parri     2018-07-16  4090   * Release/acquire chaining guarantees that B happens after A and C after B.
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar      2017-02-01  4091   * Note: the CPU doing B need not be c0 or c1
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4092   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4093   * Example:
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4094   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4095   *   CPU0            CPU1            CPU2
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4096   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4097   *   LOCK rq(0)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4098   *   sched-out X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4099   *   sched-in Y
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4100   *   UNLOCK rq(0)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4101   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4102   *                                   LOCK rq(0)->lock // orders against CPU0
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4103   *                                   dequeue X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4104   *                                   UNLOCK rq(0)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4105   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4106   *                                   LOCK rq(1)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4107   *                                   enqueue X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4108   *                                   UNLOCK rq(1)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4109   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4110   *                   LOCK rq(1)->lock // orders against CPU2
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4111   *                   sched-out Z
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4112   *                   sched-in X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4113   *                   UNLOCK rq(1)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4114   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4115   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4116   *  BLOCKING -- aka. SLEEP + WAKEUP
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4117   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4118   * For blocking we (obviously) need to provide the same guarantee as for
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4119   * migration. However the means are completely different as there is no lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4120   * chain to provide order. Instead we do:
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4121   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4122   *   1) smp_store_release(X->on_cpu, 0)   -- finish_task()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4123   *   2) smp_cond_load_acquire(!X->on_cpu) -- try_to_wake_up()
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4124   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4125   * Example:
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4126   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4127   *   CPU0 (schedule)  CPU1 (try_to_wake_up) CPU2 (schedule)
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4128   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4129   *   LOCK rq(0)->lock LOCK X->pi_lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4130   *   dequeue X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4131   *   sched-out X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4132   *   smp_store_release(X->on_cpu, 0);
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4133   *
1f03e8d2919270 kernel/sched/core.c Peter Zijlstra   2016-04-04  4134   *                    smp_cond_load_acquire(&X->on_cpu, !VAL);
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4135   *                    X->state = WAKING
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4136   *                    set_task_cpu(X,2)
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4137   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4138   *                    LOCK rq(2)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4139   *                    enqueue X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4140   *                    X->state = RUNNING
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4141   *                    UNLOCK rq(2)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4142   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4143   *                                          LOCK rq(2)->lock // orders against CPU1
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4144   *                                          sched-out Z
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4145   *                                          sched-in X
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4146   *                                          UNLOCK rq(2)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4147   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4148   *                    UNLOCK X->pi_lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4149   *   UNLOCK rq(0)->lock
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4150   *
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4151   *
7696f9910a9a40 kernel/sched/core.c Andrea Parri     2018-07-16  4152   * However, for wakeups there is a second guarantee we must provide, namely we
7696f9910a9a40 kernel/sched/core.c Andrea Parri     2018-07-16  4153   * must ensure that CONDITION=1 done by the caller can not be reordered with
7696f9910a9a40 kernel/sched/core.c Andrea Parri     2018-07-16  4154   * accesses to the task state; see try_to_wake_up() and set_current_state().
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4155   */
8643cda549ca49 kernel/sched/core.c Peter Zijlstra   2015-11-17  4156  
9ed3811a6c0d6b kernel/sched.c      Tejun Heo        2009-12-03  4157  /**
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4158   * try_to_wake_up - wake up a thread
9ed3811a6c0d6b kernel/sched.c      Tejun Heo        2009-12-03  4159   * @p: the thread to be awakened
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4160   * @state: the mask of task states that can be woken
9ed3811a6c0d6b kernel/sched.c      Tejun Heo        2009-12-03  4161   * @wake_flags: wake modifier flags (WF_*)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4162   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4163   * Conceptually does:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4164   *
a225023828038a kernel/sched/core.c Peter Zijlstra   2016-10-19  4165   *   If (@state & @p->state) @p->state = TASK_RUNNING.
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4166   *
a225023828038a kernel/sched/core.c Peter Zijlstra   2016-10-19  4167   * If the task was not queued/runnable, also place it back on a runqueue.
a225023828038a kernel/sched/core.c Peter Zijlstra   2016-10-19  4168   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4169   * This function is atomic against schedule() which would dequeue the task.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4170   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4171   * It issues a full memory barrier before accessing @p->state, see the comment
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4172   * with set_current_state().
a225023828038a kernel/sched/core.c Peter Zijlstra   2016-10-19  4173   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4174   * Uses p->pi_lock to serialize against concurrent wake-ups.
a225023828038a kernel/sched/core.c Peter Zijlstra   2016-10-19  4175   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4176   * Relies on p->pi_lock stabilizing:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4177   *  - p->sched_class
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4178   *  - p->cpus_ptr
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4179   *  - p->sched_task_group
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4180   * in order to do migration, see its use of select_task_rq()/set_task_cpu().
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4181   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4182   * Tries really hard to only take one task_rq(p)->lock for performance.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4183   * Takes rq->lock in:
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4184   *  - ttwu_runnable()    -- old rq, unavoidable, see comment there;
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4185   *  - ttwu_queue()       -- new rq, for enqueue of the task;
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4186   *  - psi_ttwu_dequeue() -- much sadness :-( accounting will kill us.
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4187   *
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4188   * As a consequence we race really badly with just about everything. See the
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4189   * many memory barriers and their comments for details.
7696f9910a9a40 kernel/sched/core.c Andrea Parri     2018-07-16  4190   *
a225023828038a kernel/sched/core.c Peter Zijlstra   2016-10-19  4191   * Return: %true if @p->state changes (an actual wakeup was done),
a225023828038a kernel/sched/core.c Peter Zijlstra   2016-10-19  4192   *	   %false otherwise.
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4193   */
ab83f455f04df5 kernel/sched/core.c Peter Oskolkov   2023-03-07  4194  int try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16 @4195  {
857d315f1201cf kernel/sched/core.c Peter Zijlstra   2023-08-01  4196  	guard(preempt)();
c05fbafba1c548 kernel/sched.c      Peter Zijlstra   2011-04-05  4197  	int cpu, success = 0;
2398f2c6d34b43 kernel/sched.c      Peter Zijlstra   2008-06-27  4198  
b62933eee41e29 kernel/sched/core.c Tejun Heo        2024-09-27  4199  	wake_flags |= WF_TTWU;
b62933eee41e29 kernel/sched/core.c Tejun Heo        2024-09-27  4200  
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4201  	if (p == current) {
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4202  		/*
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4203  		 * We're waking current, this means 'p->on_rq' and 'task_cpu(p)
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4204  		 * == smp_processor_id()'. Together this means we can special
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4205  		 * case the whole 'p->on_rq && ttwu_runnable()' case below
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4206  		 * without taking any locks.
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4207  		 *
abc158c82ae555 kernel/sched/core.c Peter Zijlstra   2024-05-23  4208  		 * Specifically, given current runs ttwu() we must be before
abc158c82ae555 kernel/sched/core.c Peter Zijlstra   2024-05-23  4209  		 * schedule()'s block_task(), as such this must not observe
abc158c82ae555 kernel/sched/core.c Peter Zijlstra   2024-05-23  4210  		 * sched_delayed.
abc158c82ae555 kernel/sched/core.c Peter Zijlstra   2024-05-23  4211  		 *
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4212  		 * In particular:
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4213  		 *  - we rely on Program-Order guarantees for all the ordering,
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4214  		 *  - we're serialized against set_special_state() by virtue of
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4215  		 *    it disabling IRQs (this allows not taking ->pi_lock).
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4216  		 */
f7d2728cc032a2 kernel/sched/core.c Ingo Molnar      2025-03-17  4217  		WARN_ON_ONCE(p->se.sched_delayed);
43295d73adc8d3 kernel/sched/core.c Thomas Gleixner  2021-08-15  4218  		if (!ttwu_state_match(p, state, &success))
e3d85487fba422 kernel/sched/core.c Peter Zijlstra   2019-07-10  4219  			goto out;
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4220  
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4221  		trace_sched_waking(p);
160fb0d83f206b kernel/sched/core.c Chengming Zhou   2022-12-23  4222  		ttwu_do_wakeup(p);
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4223  		goto out;
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4224  	}
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4225  
9e7cbd4ad9c7a7 kernel/sched/core.c Kent Overstreet  2024-04-12  4226  	u64 sleep_start;
9e7cbd4ad9c7a7 kernel/sched/core.c Kent Overstreet  2024-04-12  4227  	if (p->sleep_timestamp &&
9e7cbd4ad9c7a7 kernel/sched/core.c Kent Overstreet  2024-04-12  4228  	    trace_sched_wakeup_backtrace_enabled() &&
9e7cbd4ad9c7a7 kernel/sched/core.c Kent Overstreet  2024-04-12  4229  	    (sleep_start = xchg(&p->sleep_timestamp, 0)))
9e7cbd4ad9c7a7 kernel/sched/core.c Kent Overstreet  2024-04-12  4230  		do_trace_sched_wakeup_backtrace(p, sleep_start);
9e7cbd4ad9c7a7 kernel/sched/core.c Kent Overstreet  2024-04-12  4231  
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov    2013-08-12  4232  	/*
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov    2013-08-12  4233  	 * If we are going to wake up a thread waiting for CONDITION we
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov    2013-08-12  4234  	 * need to ensure that CONDITION=1 done by the caller can not be
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4235  	 * reordered with p->state check below. This pairs with smp_store_mb()
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4236  	 * in set_current_state() that the waiting thread does.
e0acd0a68ec7db kernel/sched/core.c Oleg Nesterov    2013-08-12  4237  	 */
857d315f1201cf kernel/sched/core.c Peter Zijlstra   2023-08-01  4238  	scoped_guard (raw_spinlock_irqsave, &p->pi_lock) {
d89e588ca40816 kernel/sched/core.c Peter Zijlstra   2016-09-05  4239  		smp_mb__after_spinlock();
43295d73adc8d3 kernel/sched/core.c Thomas Gleixner  2021-08-15  4240  		if (!ttwu_state_match(p, state, &success))
857d315f1201cf kernel/sched/core.c Peter Zijlstra   2023-08-01  4241  			break;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4242  
fbd705a0c61845 kernel/sched/core.c Peter Zijlstra   2015-06-09  4243  		trace_sched_waking(p);
fbd705a0c61845 kernel/sched/core.c Peter Zijlstra   2015-06-09  4244  
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4245  		/*
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4246  		 * Ensure we load p->on_rq _after_ p->state, otherwise it would
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4247  		 * be possible to, falsely, observe p->on_rq == 0 and get stuck
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4248  		 * in smp_cond_load_acquire() below.
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4249  		 *
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4250  		 * sched_ttwu_pending()			try_to_wake_up()
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4251  		 *   STORE p->on_rq = 1			  LOAD p->state
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4252  		 *   UNLOCK rq->lock
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4253  		 *
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4254  		 * __schedule() (switch to task 'p')
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4255  		 *   LOCK rq->lock			  smp_rmb();
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4256  		 *   smp_mb__after_spinlock();
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4257  		 *   UNLOCK rq->lock
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4258  		 *
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4259  		 * [task p]
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4260  		 *   STORE p->state = UNINTERRUPTIBLE	  LOAD p->on_rq
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4261  		 *
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4262  		 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4263  		 * __schedule().  See the comment for smp_mb__after_spinlock().
2beaf3280e57bb kernel/sched/core.c Paul E. McKenney 2020-03-11  4264  		 *
ea41bb514fe286 kernel/sched/core.c Ingo Molnar      2023-10-04  4265  		 * A similar smp_rmb() lives in __task_needs_rq_lock().
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4266  		 */
135e8c9250dd5c kernel/sched/core.c Balbir Singh     2016-09-05  4267  		smp_rmb();
58877d347b58c9 kernel/sched/core.c Peter Zijlstra   2020-07-02  4268  		if (READ_ONCE(p->on_rq) && ttwu_runnable(p, wake_flags))
857d315f1201cf kernel/sched/core.c Peter Zijlstra   2023-08-01  4269  			break;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4270  
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4271  		/*
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4272  		 * Ensure we load p->on_cpu _after_ p->on_rq, otherwise it would be
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4273  		 * possible to, falsely, observe p->on_cpu == 0.
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4274  		 *
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4275  		 * One must be running (->on_cpu == 1) in order to remove oneself
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4276  		 * from the runqueue.
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4277  		 *
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4278  		 * __schedule() (switch to task 'p')	try_to_wake_up()
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4279  		 *   STORE p->on_cpu = 1		  LOAD p->on_rq
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4280  		 *   UNLOCK rq->lock
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4281  		 *
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4282  		 * __schedule() (put 'p' to sleep)
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4283  		 *   LOCK rq->lock			  smp_rmb();
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4284  		 *   smp_mb__after_spinlock();
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4285  		 *   STORE p->on_rq = 0			  LOAD p->on_cpu
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4286  		 *
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4287  		 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
3d85b270378363 kernel/sched/core.c Andrea Parri     2018-07-16  4288  		 * __schedule().  See the comment for smp_mb__after_spinlock().
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4289  		 *
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4290  		 * Form a control-dep-acquire with p->on_rq == 0 above, to ensure
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4291  		 * schedule()'s deactivate_task() has 'happened' and p will no longer
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4292  		 * care about it's own p->state. See the comment in __schedule().
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4293  		 */
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4294  		smp_acquire__after_ctrl_dep();
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4295  
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4296  		/*
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4297  		 * We're doing the wakeup (@success == 1), they did a dequeue (p->on_rq
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4298  		 * == 0), which means we need to do an enqueue, change p->state to
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4299  		 * TASK_WAKING such that we can unlock p->pi_lock before doing the
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4300  		 * enqueue, such as ttwu_queue_wakelist().
dbfb089d360b1c kernel/sched/core.c Peter Zijlstra   2020-07-03  4301  		 */
2f064a59a11ff9 kernel/sched/core.c Peter Zijlstra   2021-06-11  4302  		WRITE_ONCE(p->__state, TASK_WAKING);
ecf7d01c229d11 kernel/sched/core.c Peter Zijlstra   2015-10-07  4303  
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4304  		/*
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4305  		 * If the owning (remote) CPU is still in the middle of schedule() with
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4306  		 * this task as prev, considering queueing p on the remote CPUs wake_list
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4307  		 * which potentially sends an IPI instead of spinning on p->on_cpu to
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4308  		 * let the waker make forward progress. This is safe because IRQs are
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4309  		 * disabled and the IPI will deliver after on_cpu is cleared.
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4310  		 *
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4311  		 * Ensure we load task_cpu(p) after p->on_cpu:
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4312  		 *
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4313  		 * set_task_cpu(p, cpu);
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4314  		 *   STORE p->cpu = @cpu
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4315  		 * __schedule() (switch to task 'p')
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4316  		 *   LOCK rq->lock
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4317  		 *   smp_mb__after_spin_lock()		smp_cond_load_acquire(&p->on_cpu)
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4318  		 *   STORE p->on_cpu = 1		LOAD p->cpu
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4319  		 *
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4320  		 * to ensure we observe the correct CPU on which the task is currently
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4321  		 * scheduling.
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4322  		 */
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4323  		if (smp_load_acquire(&p->on_cpu) &&
f3dd3f674555bd kernel/sched/core.c Tianchen Ding    2022-06-09  4324  		    ttwu_queue_wakelist(p, task_cpu(p), wake_flags))
857d315f1201cf kernel/sched/core.c Peter Zijlstra   2023-08-01  4325  			break;
c6e7bd7afaeb3a kernel/sched/core.c Peter Zijlstra   2020-05-24  4326  
e9c8431185d6c4 kernel/sched.c      Peter Zijlstra   2009-09-15  4327  		/*
d1ccc66df8bfe3 kernel/sched/core.c Ingo Molnar      2017-02-01  4328  		 * If the owning (remote) CPU is still in the middle of schedule() with
b19a888c1e9bdf kernel/sched/core.c Tal Zussman      2020-11-12  4329  		 * this task as prev, wait until it's done referencing the task.
b75a22531588e7 kernel/sched/core.c Peter Zijlstra   2015-10-06  4330  		 *
31cb1bc0dc9488 kernel/sched/core.c Rodrigo Siqueira 2017-12-15  4331  		 * Pairs with the smp_store_release() in finish_task().
b75a22531588e7 kernel/sched/core.c Peter Zijlstra   2015-10-06  4332  		 *
b75a22531588e7 kernel/sched/core.c Peter Zijlstra   2015-10-06  4333  		 * This ensures that tasks getting woken will be fully ordered against
b75a22531588e7 kernel/sched/core.c Peter Zijlstra   2015-10-06  4334  		 * their previous state and preserve Program Order.
0970d2992dfd7d kernel/sched.c      Peter Zijlstra   2010-02-15  4335  		 */
1f03e8d2919270 kernel/sched/core.c Peter Zijlstra   2016-04-04  4336  		smp_cond_load_acquire(&p->on_cpu, !VAL);
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4337  
b62933eee41e29 kernel/sched/core.c Tejun Heo        2024-09-27  4338  		cpu = select_task_rq(p, p->wake_cpu, &wake_flags);
f339b9dc1f0359 kernel/sched.c      Peter Zijlstra   2011-05-31  4339  		if (task_cpu(p) != cpu) {
ec618b84f6e152 kernel/sched/core.c Peter Zijlstra   2020-09-24  4340  			if (p->in_iowait) {
ec618b84f6e152 kernel/sched/core.c Peter Zijlstra   2020-09-24  4341  				delayacct_blkio_end(p);
ec618b84f6e152 kernel/sched/core.c Peter Zijlstra   2020-09-24  4342  				atomic_dec(&task_rq(p)->nr_iowait);
ec618b84f6e152 kernel/sched/core.c Peter Zijlstra   2020-09-24  4343  			}
ec618b84f6e152 kernel/sched/core.c Peter Zijlstra   2020-09-24  4344  
f339b9dc1f0359 kernel/sched.c      Peter Zijlstra   2011-05-31  4345  			wake_flags |= WF_MIGRATED;
eb414681d5a07d kernel/sched/core.c Johannes Weiner  2018-10-26  4346  			psi_ttwu_dequeue(p);
e4a52bcb9a1814 kernel/sched.c      Peter Zijlstra   2011-04-05  4347  			set_task_cpu(p, cpu);
f339b9dc1f0359 kernel/sched.c      Peter Zijlstra   2011-05-31  4348  		}
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4349  
b5179ac70de85e kernel/sched/core.c Peter Zijlstra   2016-05-11  4350  		ttwu_queue(p, cpu, wake_flags);
857d315f1201cf kernel/sched/core.c Peter Zijlstra   2023-08-01  4351  	}
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4352  out:
aacedf26fb7601 kernel/sched/core.c Peter Zijlstra   2019-06-07  4353  	if (success)
b6e13e85829f03 kernel/sched/core.c Peter Zijlstra   2020-06-22  4354  		ttwu_stat(p, task_cpu(p), wake_flags);
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4355  
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4356  	return success;
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4357  }
^1da177e4c3f41 kernel/sched.c      Linus Torvalds   2005-04-16  4358  

:::::: The code at line 4195 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
