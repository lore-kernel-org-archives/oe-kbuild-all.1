Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65097388397
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774320139; cv=none; b=VroPStJRZux3lBHm7Y1mxUiocOlC9sLZLTBC7/MtPkrD8fdxPGcEZzMkHMMF7dVGuGk+rdAmxxPIk+1F4kcAVejIvxty0VZ5ULFyUwp9xmS0EacXgLWFAcO28C5434nk/1nVpYDFuUiIvaG9eIrLPevgS0uYzm5NqKIqCWHryRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774320139; c=relaxed/simple;
	bh=RXmxnFdTyFcK5s/7b7uhj7EV0cSYXHeS78Z5weXKOgU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uRciIUWMXq7z5dLKrPF/+ZNAmxCDayPdsMop2J2JbBv9xhS4NzOLKDya8YB5q82Ls1tAfkWzYi49Uj3HHn/iRChYmBUeXs4VlWZUGNlncU8x4WSIsUjwOiInDh25LKJWctoISbfStVAnZVqKX3gIOE0ewyzZEJeGdhbFCOkDKS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NkFihuhQ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NkFihuhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774320136; x=1805856136;
  h=date:from:to:cc:subject:message-id;
  bh=RXmxnFdTyFcK5s/7b7uhj7EV0cSYXHeS78Z5weXKOgU=;
  b=NkFihuhQSGypv/eI6VbcBBEoXyp3A+YrdSgKvT080GLw+VtUaPTePyTg
   CRCmtmP/Lem9q2TfAUBY6WxPUOq78er/bYbgkYPvm4jr0LnoOHbNB+l7O
   w3P5w8Td0Q0vrjIRUheeRfgw5M53ZTgTfWlkLRilmRrNDd+nfyewtP8wD
   GPP9a7KIRZZleIwgWOcpoDGTbmorE5Mq5sy7g9qyXcCcX1Tn1RDoFiJ3c
   RNJZmVXHqyIrPiwTzr7TCP7hqosv2Ch1inBod+Gol1A06sHowE/u00cyD
   xY9AGAU6y0Xn0jQa6xiIkO+zVuNGvbOwyI2Rl3Xv0PYH2pXjauOAyFvgz
   Q==;
X-CSE-ConnectionGUID: gJU14uknRsafX/0xwRTLVA==
X-CSE-MsgGUID: 8RGDhrYFQEuo07E+7rjO7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="78928879"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="78928879"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:42:15 -0700
X-CSE-ConnectionGUID: i0w54C4yR4WdHKj/XgpOsQ==
X-CSE-MsgGUID: qnUDP3B0SQSvyy4YFhhlWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219796556"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 23 Mar 2026 19:42:14 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4rie-000000006nD-0lEE;
	Tue, 24 Mar 2026 02:42:12 +0000
Date: Tue, 24 Mar 2026 03:41:55 +0100
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/strncpy 11/11]
 tools/lib/bpf/skel_internal.h:246:9: error: implicit declaration of function
 'strncpy'
Message-ID: <202603240325.rd8gRV6s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/strncpy
head:   4ac5d200ca777222b85a543bdeb40098b2685d0b
commit: da9b6bdc716b766da262998c114c86ebb1b96d43 [11/11] string: Remove strncpy() from the kernel
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260324/202603240325.rd8gRV6s-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603240325.rd8gRV6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603240325.rd8gRV6s-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/bpf/preload/iterators/iterators.lskel-little-endian.h:6,
                    from kernel/bpf/preload/bpf_preload_kern.c:7:
   tools/lib/bpf/skel_internal.h: In function 'skel_map_create':
>> tools/lib/bpf/skel_internal.h:246:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
     246 |         strncpy(attr.map_name, map_name, sizeof(attr.map_name));
         |         ^~~~~~~
   tools/lib/bpf/skel_internal.h:12:1: note: include '<string.h>' or provide a declaration of 'strncpy'
      11 | #include <linux/bpf.h>
     +++ |+#include <string.h>
      12 | #else
>> tools/lib/bpf/skel_internal.h:246:9: warning: incompatible implicit declaration of built-in function 'strncpy' [-Wbuiltin-declaration-mismatch]
     246 |         strncpy(attr.map_name, map_name, sizeof(attr.map_name));
         |         ^~~~~~~
   tools/lib/bpf/skel_internal.h:246:9: note: include '<string.h>' or provide a declaration of 'strncpy'


vim +/strncpy +246 tools/lib/bpf/skel_internal.h

e981f41fd029d3 Alexei Starovoitov 2022-01-31  228  
e981f41fd029d3 Alexei Starovoitov 2022-01-31  229  static inline int skel_map_create(enum bpf_map_type map_type,
e981f41fd029d3 Alexei Starovoitov 2022-01-31  230  				  const char *map_name,
e981f41fd029d3 Alexei Starovoitov 2022-01-31  231  				  __u32 key_size,
e981f41fd029d3 Alexei Starovoitov 2022-01-31  232  				  __u32 value_size,
fb2b0e290147ba KP Singh           2025-09-21  233  				  __u32 max_entries,
fb2b0e290147ba KP Singh           2025-09-21  234  				  const void *excl_prog_hash,
fb2b0e290147ba KP Singh           2025-09-21  235  				  __u32 excl_prog_hash_sz)
e981f41fd029d3 Alexei Starovoitov 2022-01-31  236  {
fb2b0e290147ba KP Singh           2025-09-21  237  	const size_t attr_sz = offsetofend(union bpf_attr, excl_prog_hash_size);
e981f41fd029d3 Alexei Starovoitov 2022-01-31  238  	union bpf_attr attr;
e981f41fd029d3 Alexei Starovoitov 2022-01-31  239  
e981f41fd029d3 Alexei Starovoitov 2022-01-31  240  	memset(&attr, 0, attr_sz);
e981f41fd029d3 Alexei Starovoitov 2022-01-31  241  
e981f41fd029d3 Alexei Starovoitov 2022-01-31  242  	attr.map_type = map_type;
fb2b0e290147ba KP Singh           2025-09-21  243  	attr.excl_prog_hash = (unsigned long) excl_prog_hash;
fb2b0e290147ba KP Singh           2025-09-21  244  	attr.excl_prog_hash_size = excl_prog_hash_sz;
fb2b0e290147ba KP Singh           2025-09-21  245  
e981f41fd029d3 Alexei Starovoitov 2022-01-31 @246  	strncpy(attr.map_name, map_name, sizeof(attr.map_name));
e981f41fd029d3 Alexei Starovoitov 2022-01-31  247  	attr.key_size = key_size;
e981f41fd029d3 Alexei Starovoitov 2022-01-31  248  	attr.value_size = value_size;
e981f41fd029d3 Alexei Starovoitov 2022-01-31  249  	attr.max_entries = max_entries;
e981f41fd029d3 Alexei Starovoitov 2022-01-31  250  
e981f41fd029d3 Alexei Starovoitov 2022-01-31  251  	return skel_sys_bpf(BPF_MAP_CREATE, &attr, attr_sz);
e981f41fd029d3 Alexei Starovoitov 2022-01-31  252  }
e981f41fd029d3 Alexei Starovoitov 2022-01-31  253  

:::::: The code at line 246 was first introduced by commit
:::::: e981f41fd029d37b3e1c8aad2d72d3fe57a104d6 libbpf: Open code low level bpf commands.

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
