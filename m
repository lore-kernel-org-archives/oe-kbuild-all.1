Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794514145;
	b=SLi7IeTrQlGtkPYth/KjXHnrWmLW7SkEbb99PGg3ICStYnwAcTQVdmxdHWdb+esa4Ywo
	 lKMVuTc/EnNAKqam+Q3umuZ+r35Ckri6sIi+dbetgPTWtb2My6YlAhjZ0XYag7HP30dJJ
	 bbq3Spw0gGqedNGDWyC/JbU4jAmejqLFMCh4WPRZyi6hFoxLMckwpue7dAKSyrLXR+QJt
	 1Bh4cmvpz+ckKMgqgN5lMKjRAiLpmHkgJ3I7eaHJ3rGzIHAbSsbpOYZErdEyljDC9l1pZ
	 idp66JWZUWeSV9LWIjHu7dlhwHlhSPcXDyFfQwaFJmFsHFMF6CIu95wDnZYJNcy9Rdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794514145;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=fzYcrCEWzbg/nw6hfUYeDEkq6qG4Ntuh68mvtAXAPaI=;
	b=MocOMgKvF05bGfdHfnlUoi1YAI9hr9GnAlbntK+EW4MSIY8fybNeX0EZEeLAIUEYQI+v
	 wUwM6Dt/JKZCQ7nPaVGyWEC/W9ADKQPYf31q0236uszRLhvXX0zXgX5YPriqUX09Gs+h/
	 xE5gB/i5ezgKbM5AR2nUS4ZIZEPxReqHJFqa4C+OGM9VsOGrOxJSWUS+PxzUvT8GbaP+v
	 +hcyc30a+N8flNWa7QrJRR1g87MCEdL26Uj3CQejNFjQwfabgMgbXWb3WZzClZdS7UYTv
	 SObK19qm8MZ/U0SPHz5GrpWjMIuW/YSNeddvjmrHaZoOc+6cHDvmVU4BHgSDUxL9Odw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="TvRy/FWl";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAF2606A32A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Nov 2026 20:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEAF2606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TvRy/FWl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794514145; x=1826050145;
  h=date:from:to:cc:subject:message-id;
  bh=npgblSCZqACuedC1fnTVBRgrp4QAIiUlVkcArepK9Xg=;
  b=TvRy/FWlWybo5EowiO/5vUVIKNZ6XjlqCJ7Pa7J22Yos0A2AfacEnUvh
   q5nbbvXHWFDL96/CJrwGY+Be7U2rrQ96qRKb5nY7HrqgASC96cN4nRfHA
   bN+O/yYm8br55UY2oTL4c6mKaaQuUx7yCAqxCNWi++0veTwstcbY8LsC/
   ZpjChrfnuu++Vm2RupLMabfQrpDhr8dFkYtm/OXdAVOE24sTAKA7C3njq
   QeSuYskQwnlwJeQ2xbPeVWJ99DvBklbIrDeSD+UsfOPjlHcscxpomDGsn
   bDZO7hOy6qHiFBvhWIrA3ssvuczodW67OlMGYCpioTPRzcL8U59mbh519
   g==;
X-CSE-ConnectionGUID: 57LeMHNoRHiAPtAT0ju5Ag==
X-CSE-MsgGUID: Qmqktk8eQDag7GP5VGz/tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3353673"
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="3353673"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 12:09:04 -0800
X-CSE-ConnectionGUID: B8KJzRyxS0KZkYT6nSXciA==
X-CSE-MsgGUID: CucQ3x/YSYKFI1rMAmvzIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,210,1787036400"; 
   d="scan'208";a="10477799"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 12 Nov 2026 12:09:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRb6R-000000000wv-3Mxm;
	Thu, 12 Nov 2026 20:08:59 +0000
Date: Thu, 12 Nov 2026 21:08:52 +0100
From: kernel test robot <lkp@intel.com>
To: Thomas Huth <thuth@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arch@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
Subject: [arnd-asm-generic:master 15/16]
 /usr/aarch64-linux-gnu/include/linux/types.h:12: Error: unknown mnemonic
 `typedef' -- `typedef __signed__ __int128 __s128
 __attribute__((aligned(16)))'
Message-ID: <202611122000.BuPBRpZN-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
head:   851bce698c6c23e9fee42c0aa0e2c42c11940360
commit: 625b37748a148e51ca888eac172f3a0a8f908ae9 [15/16] treewide: Stop defining __ASSEMBLY__ for assembler files
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261112/202611122000.BuPBRpZN-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611122000.BuPBRpZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611122000.BuPBRpZN-lkp@intel.com/

Note: the arnd-asm-generic/master HEAD 851bce698c6c23e9fee42c0aa0e2c42c11940360 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h: Assembler messages:
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:20: Error: unknown mnemonic `typedef' -- `typedef __signed__ char __s8'
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:21: Error: unknown mnemonic `typedef' -- `typedef unsigned char __u8'
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:23: Error: unknown mnemonic `typedef' -- `typedef __signed__ short __s16'
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:24: Error: unknown mnemonic `typedef' -- `typedef unsigned short __u16'
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:26: Error: unknown mnemonic `typedef' -- `typedef __signed__ int __s32'
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:27: Error: unknown mnemonic `typedef' -- `typedef unsigned int __u32'
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:30: Error: unknown mnemonic `__extension__' -- `__extension__ typedef __signed__ long long __s64'
>> /usr/aarch64-linux-gnu/include/asm-generic/int-ll64.h:31: Error: unknown mnemonic `__extension__' -- `__extension__ typedef unsigned long long __u64'
>> /usr/aarch64-linux-gnu/include/linux/posix_types.h:25: Error: unknown mnemonic `typedef' -- `typedef struct{'
>> /usr/aarch64-linux-gnu/include/linux/posix_types.h:26: Error: unknown mnemonic `unsigned' -- `unsigned long fds_bits[1024/(8*sizeof(long))]'
>> /usr/aarch64-linux-gnu/include/linux/posix_types.h:27: Error: junk at end of line, first unrecognized character is `}'
>> /usr/aarch64-linux-gnu/include/linux/posix_types.h:30: Error: unknown mnemonic `typedef' -- `typedef void(*__kernel_sighandler_t)(int)'
>> /usr/aarch64-linux-gnu/include/linux/posix_types.h:33: Error: unknown mnemonic `typedef' -- `typedef int __kernel_key_t'
>> /usr/aarch64-linux-gnu/include/linux/posix_types.h:34: Error: unknown mnemonic `typedef' -- `typedef int __kernel_mqd_t'
>> /usr/aarch64-linux-gnu/include/asm/posix_types.h:5: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_old_uid_t'
>> /usr/aarch64-linux-gnu/include/asm/posix_types.h:6: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_old_gid_t'
>> /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:15: Error: unknown mnemonic `typedef' -- `typedef long __kernel_long_t'
>> /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:16: Error: unknown mnemonic `typedef' -- `typedef unsigned long __kernel_ulong_t'
>> /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:20: Error: unknown mnemonic `typedef' -- `typedef __kernel_ulong_t __kernel_ino_t'
>> /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:24: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_mode_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:28: Error: unknown mnemonic `typedef' -- `typedef int __kernel_pid_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:32: Error: unknown mnemonic `typedef' -- `typedef int __kernel_ipc_pid_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:36: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_uid_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:37: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_gid_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:41: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_suseconds_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:45: Error: unknown mnemonic `typedef' -- `typedef int __kernel_daddr_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:49: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_uid32_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:50: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_gid32_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:59: Error: unknown mnemonic `typedef' -- `typedef unsigned int __kernel_old_dev_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:72: Error: unknown mnemonic `typedef' -- `typedef __kernel_ulong_t __kernel_size_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:73: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_ssize_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:74: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_ptrdiff_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:79: Error: unknown mnemonic `typedef' -- `typedef struct{'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:80: Error: unknown mnemonic `int' -- `int val[2]'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:81: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:87: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_off_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:88: Error: unknown mnemonic `typedef' -- `typedef long long __kernel_loff_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:89: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_old_time_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:90: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_time_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:91: Error: unknown mnemonic `typedef' -- `typedef long long __kernel_time64_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:92: Error: unknown mnemonic `typedef' -- `typedef __kernel_long_t __kernel_clock_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:93: Error: unknown mnemonic `typedef' -- `typedef int __kernel_timer_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:94: Error: unknown mnemonic `typedef' -- `typedef int __kernel_clockid_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:95: Error: unknown mnemonic `typedef' -- `typedef char*__kernel_caddr_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:96: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_uid16_t'
   /usr/aarch64-linux-gnu/include/asm-generic/posix_types.h:97: Error: unknown mnemonic `typedef' -- `typedef unsigned short __kernel_gid16_t'
   /usr/aarch64-linux-gnu/include/linux/types.h:12: Error: unknown mnemonic `typedef' -- `typedef __signed__ __int128 __s128 __attribute__((aligned(16)))'
   /usr/aarch64-linux-gnu/include/linux/types.h:13: Error: unknown mnemonic `typedef' -- `typedef unsigned __int128 __u128 __attribute__((aligned(16)))'
   /usr/aarch64-linux-gnu/include/linux/types.h:31: Error: unknown mnemonic `typedef' -- `typedef __u16 __le16'
   /usr/aarch64-linux-gnu/include/linux/types.h:32: Error: unknown mnemonic `typedef' -- `typedef __u16 __be16'
   /usr/aarch64-linux-gnu/include/linux/types.h:33: Error: unknown mnemonic `typedef' -- `typedef __u32 __le32'
   /usr/aarch64-linux-gnu/include/linux/types.h:34: Error: unknown mnemonic `typedef' -- `typedef __u32 __be32'
   /usr/aarch64-linux-gnu/include/linux/types.h:35: Error: unknown mnemonic `typedef' -- `typedef __u64 __le64'
   /usr/aarch64-linux-gnu/include/linux/types.h:36: Error: unknown mnemonic `typedef' -- `typedef __u64 __be64'
   /usr/aarch64-linux-gnu/include/linux/types.h:38: Error: unknown mnemonic `typedef' -- `typedef __u16 __sum16'
   /usr/aarch64-linux-gnu/include/linux/types.h:39: Error: unknown mnemonic `typedef' -- `typedef __u32 __wsum'
   /usr/aarch64-linux-gnu/include/linux/types.h:55: Error: unknown mnemonic `typedef' -- `typedef unsigned __poll_t'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:88: Error: unknown mnemonic `struct' -- `struct user_pt_regs{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:89: Error: unknown mnemonic `__u64' -- `__u64 regs[31]'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:90: Error: unknown mnemonic `__u64' -- `__u64 sp'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:91: Error: unknown mnemonic `__u64' -- `__u64 pc'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:92: Error: unknown mnemonic `__u64' -- `__u64 pstate'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:93: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:95: Error: unknown mnemonic `struct' -- `struct user_fpsimd_state{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:96: Error: unknown mnemonic `__uint128_t' -- `__uint128_t vregs[32]'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:97: Error: unknown mnemonic `__u32' -- `__u32 fpsr'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:98: Error: unknown mnemonic `__u32' -- `__u32 fpcr'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:99: Error: unknown mnemonic `__u32' -- `__u32 __reserved[2]'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:100: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:102: Error: unknown mnemonic `struct' -- `struct user_hwdebug_state{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:103: Error: unknown mnemonic `__u32' -- `__u32 dbg_info'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:104: Error: unknown mnemonic `__u32' -- `__u32 pad'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:105: Error: unknown mnemonic `struct' -- `struct {'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:106: Error: unknown mnemonic `__u64' -- `__u64 addr'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:107: Error: unknown mnemonic `__u32' -- `__u32 ctrl'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:108: Error: unknown mnemonic `__u32' -- `__u32 pad'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:109: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:110: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:114: Error: unknown mnemonic `struct' -- `struct user_sve_header{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:115: Error: unknown mnemonic `__u32' -- `__u32 size'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:116: Error: unknown mnemonic `__u32' -- `__u32 max_size'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:117: Error: unknown mnemonic `__u16' -- `__u16 vl'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:118: Error: unknown mnemonic `__u16' -- `__u16 max_vl'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:119: Error: unknown mnemonic `__u16' -- `__u16 flags'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:120: Error: unknown mnemonic `__u16' -- `__u16 __reserved'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:121: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:253: Error: unknown mnemonic `struct' -- `struct user_pac_mask{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:254: Error: unknown mnemonic `__u64' -- `__u64 data_mask'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:255: Error: unknown mnemonic `__u64' -- `__u64 insn_mask'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:256: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:260: Error: unknown mnemonic `struct' -- `struct user_pac_address_keys{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:261: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apiakey'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:262: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apibkey'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:263: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apdakey'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:264: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apdbkey'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:265: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:267: Error: unknown mnemonic `struct' -- `struct user_pac_generic_keys{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:268: Error: unknown mnemonic `__uint128_t' -- `__uint128_t apgakey'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:269: Error: junk at end of line, first unrecognized character is `}'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:273: Error: unknown mnemonic `struct' -- `struct user_za_header{'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:274: Error: unknown mnemonic `__u32' -- `__u32 size'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:275: Error: unknown mnemonic `__u32' -- `__u32 max_size'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:276: Error: unknown mnemonic `__u16' -- `__u16 vl'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:277: Error: unknown mnemonic `__u16' -- `__u16 max_vl'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:278: Error: unknown mnemonic `__u16' -- `__u16 flags'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:279: Error: unknown mnemonic `__u16' -- `__u16 __reserved'
   /usr/aarch64-linux-gnu/include/asm/ptrace.h:280: Error: junk at end of line, first unrecognized character is `}'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
