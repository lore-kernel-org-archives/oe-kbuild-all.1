Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E851862A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 04:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730005153; cv=none; b=KxiYkbCK9swbJGU90s1higDpBKt5nfJGwOzJd1q2HXLr8lunyDhB76WSF4hLk/bQxk57VSZNyZt1zmrAS35bYNutPtuxfHt3Jf877uNkUKXDjxYrVBBPZmwlphswNTKT1AhLMFY+oO6OJg4d1ga75c3phgzH7Av2rFhjzLuy8Y4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730005153; c=relaxed/simple;
	bh=XWP0jyWjEsqASx5ZsLwTPKGgSGJK83Hipor/CbwZ8F4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZHldyVbZ0CMZbOJnxO12nF7yhcOBHBpqYyVf7EGzvpd6iyiLAjE+Yipv9F1jKsTsDSISO+zStmjPLooyFDenSDS098ETd0wJHEWh2lmWIVmVOSBtpdIsG1PlBQGjcpy6xY0mXoMbsoZzgGx28wt8V95asuyEaRlbaDjkC6USS3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lBykJLTx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lBykJLTx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730005150; x=1761541150;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XWP0jyWjEsqASx5ZsLwTPKGgSGJK83Hipor/CbwZ8F4=;
  b=lBykJLTxSaHGxEf7brPT+CvDeTz01+BtElmOgXWdqc/y/PjIdKBriBR8
   D8eWLU5m+RhswCpsGBiIUKnVKkVmYPnLJfeIanGhGAdqo/ys6+VTEy/qz
   Vs5a6IMzAnLK9/zP9g8Fa6HSHnne+laaXt5HPNSlVDTHYJqbNC9bGyxZw
   JmAqHTC0O1fgl+vnI0nvLs99hRSUzBJVDtdr15PLGRIFaIUkWlC0ArrIB
   d8VKN+jXWm1hKKrUO6MtgNMzyjiBs9q8uKKOj+KnheSN7v9sotp5VBEwA
   KkV7WIu2QbVuM1kC11lmmvtOFb8eurPat8stpvVnQnVZv+3xgCm1DFcT+
   g==;
X-CSE-ConnectionGUID: GQMoVeUtQNCTsfQ9ORafYQ==
X-CSE-MsgGUID: NawruG4qSjWJ8v8I6xLwjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11237"; a="47119814"
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="47119814"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2024 21:59:09 -0700
X-CSE-ConnectionGUID: th2GHZjPRSGT17pvyL6lGA==
X-CSE-MsgGUID: FUWjDIuxTrKn5n/fGp3qPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,236,1725346800"; 
   d="scan'208";a="85899911"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Oct 2024 21:59:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4vMo-000aNe-2J;
	Sun, 27 Oct 2024 04:59:06 +0000
Date: Sun, 27 Oct 2024 12:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:topic/fprobe-on-fgraph 17/17]
 kernel/trace/bpf_trace.c:1104:33: sparse: sparse: cast to restricted __le32
Message-ID: <202410271251.wsGw4DQT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace topic/fprobe-on-fgraph
head:   7afa86ee2599c8c5a4090e36c50039df2fbb0b45
commit: 7afa86ee2599c8c5a4090e36c50039df2fbb0b45 [17/17] bpf: Add get_entry_ip() for arm64
config: arm64-randconfig-r113-20241027 (https://download.01.org/0day-ci/archive/20241027/202410271251.wsGw4DQT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241027/202410271251.wsGw4DQT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410271251.wsGw4DQT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/bpf_trace.c:1104:33: sparse: sparse: cast to restricted __le32
>> kernel/trace/bpf_trace.c:1104:33: sparse: sparse: cast to restricted __le32
>> kernel/trace/bpf_trace.c:1104:33: sparse: sparse: cast to restricted __le32
>> kernel/trace/bpf_trace.c:1104:33: sparse: sparse: cast to restricted __le32
>> kernel/trace/bpf_trace.c:1104:33: sparse: sparse: cast to restricted __le32
>> kernel/trace/bpf_trace.c:1104:33: sparse: sparse: cast to restricted __le32
   kernel/trace/bpf_trace.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/slab.h):
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:237:46: sparse: sparse: self-comparison always evaluates to false
   kernel/trace/bpf_trace.c:2631:21: sparse: sparse: dereference of noderef expression
   kernel/trace/bpf_trace.c:2631:21: sparse: sparse: dereference of noderef expression
   kernel/trace/bpf_trace.c:2635:66: sparse: sparse: dereference of noderef expression

vim +1104 kernel/trace/bpf_trace.c

  1047	
  1048	static unsigned long get_entry_ip(unsigned long fentry_ip)
  1049	{
  1050		u32 insn;
  1051	
  1052		/*
  1053		 * When using patchable-function-entry without pre-function NOPS, ftrace
  1054		 * entry is the address of the first NOP after the function entry point.
  1055		 *
  1056		 * The compiler has either generated:
  1057		 *
  1058		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
  1059		 * func+04:		NOP		// To be patched to BL <caller>
  1060		 *
  1061		 * Or:
  1062		 *
  1063		 * func-04:		BTI	C
  1064		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
  1065		 * func+04:		NOP		// To be patched to BL <caller>
  1066		 *
  1067		 * The fentry_ip is the address of `BL <caller>` which is at `func + 4`
  1068		 * bytes in either case.
  1069		 */
  1070		if (!IS_ENABLED(CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS))
  1071			return fentry_ip - AARCH64_INSN_SIZE;
  1072	
  1073		/*
  1074		 * When using patchable-function-entry with pre-function NOPs, BTI is
  1075		 * a bit different.
  1076		 *
  1077		 * func+00:	func:	NOP		// To be patched to MOV X9, LR
  1078		 * func+04:		NOP		// To be patched to BL <caller>
  1079		 *
  1080		 * Or:
  1081		 *
  1082		 * func+00:	func:	BTI	C
  1083		 * func+04:		NOP		// To be patched to MOV X9, LR
  1084		 * func+08:		NOP		// To be patched to BL <caller>
  1085		 *
  1086		 * The fentry_ip is the address of `BL <caller>` which is at either
  1087		 * `func + 4` or `func + 8` depends on whether there is a BTI.
  1088		 */
  1089	
  1090		/* If there is no BTI, the func address should be one instruction before. */
  1091		if (!IS_ENABLED(CONFIG_ARM64_BTI_KERNEL))
  1092			return fentry_ip - AARCH64_INSN_SIZE;
  1093	
  1094		/* We want to be extra safe in case entry ip is on the page edge,
  1095		 * but otherwise we need to avoid get_kernel_nofault()'s overhead.
  1096		 */
  1097		if ((fentry_ip & ~PAGE_MASK) < AARCH64_INSN_SIZE * 2) {
  1098			if (get_kernel_nofault(insn, (u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2)))
  1099				return fentry_ip - AARCH64_INSN_SIZE;
  1100		} else {
  1101			insn = *(u32 *)(fentry_ip - AARCH64_INSN_SIZE * 2);
  1102		}
  1103	
> 1104		if (aarch64_insn_is_bti(le32_to_cpu((__le32)insn)))
  1105			return fentry_ip - AARCH64_INSN_SIZE * 2;
  1106	
  1107		return fentry_ip - AARCH64_INSN_SIZE;
  1108	}
  1109	#else
  1110	#define get_entry_ip(fentry_ip) fentry_ip
  1111	#endif
  1112	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
