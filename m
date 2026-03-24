Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46B44285068
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 05:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774329966; cv=none; b=fE1J6JL5sx/aVuM1/CiPmGpoPWNyhUTH1x0cuRVsGoGWk0DWTWY1zihRFn41PKl8fVqS5vstSDxZjQVqUIRuT7nxK2+SGx/tvN4vz9M7GY4zTSdQmukXTz6tDYnb+mK0CaryOph8C3MmgpBOrszu8DCv+TcOTyPuvg7CD7GCVws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774329966; c=relaxed/simple;
	bh=VO2iJzQnPIrdBMEYHe7xQtDyqwfnwnGBWiv/pksrzrk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mkFcFOp5zQRUa3oR/yvq4f9gk3znn4OecSYND01ZwF8kWevqHB1B3aUvd9q0+triu72nluRZnTSmC2ptTAYca3jbtqV3A94ZNjbIPSUSLgXvHYXluTA4p6VJvtkEJ2YKUZgCHcTrsb5mjykeAvkDdHlGX2058uFZ4CYmmddSnvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BHlsycat; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BHlsycat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774329964; x=1805865964;
  h=date:from:to:cc:subject:message-id;
  bh=VO2iJzQnPIrdBMEYHe7xQtDyqwfnwnGBWiv/pksrzrk=;
  b=BHlsycatIWu0gididiT/RZZBeoZ4eUlUJ3HQQ1MEo0Q3ZqmNpIImew9Y
   9wxVoNU/nf0It7cIFeVyviAYn5QYj99nL2Ftc9d3rB1bBJgKdpIDfQzes
   7iNH4iqL1smAmDo/6/jMlj2VVKJsaFUXYhD4UvnoF7di7JbJEGgzI9n8D
   5HPhwzE09U/FQUNWbzCmi70eY0/g5P8FctkA084P4RsmUyGUXCrMtQns0
   odZoWPZ+i8Ok/WkGWWppqAocinpIGHMvxOKZ2GutsT93QnJnowJbGel2Y
   VPN/SLVX4N9VnJmcOfnmJigfCl0v5+9LobNItXbrn6O054huF09fBVT9p
   w==;
X-CSE-ConnectionGUID: k6StaN09ROmp5qMY9ZUPdg==
X-CSE-MsgGUID: D3Rq3qTXRxqQPeSGkyv/xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75532059"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75532059"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 22:26:03 -0700
X-CSE-ConnectionGUID: 9mfPPrjyQA6adbq4/eU8RQ==
X-CSE-MsgGUID: Dei+5bsTRVufTNFAQx9kzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228995624"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Mar 2026 22:26:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4uHA-000000003tl-0oIG;
	Tue, 24 Mar 2026 05:26:00 +0000
Date: Tue, 24 Mar 2026 13:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kees:dev/v7.0-rc2/strncpy 11/11]
 tools/lib/bpf/skel_internal.h:246:9: warning: incompatible implicit
 declaration of built-in function 'strncpy'
Message-ID: <202603241330.vmNnBWvZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v7.0-rc2/strncpy
head:   4ac5d200ca777222b85a543bdeb40098b2685d0b
commit: da9b6bdc716b766da262998c114c86ebb1b96d43 [11/11] string: Remove strncpy() from the kernel
config: x86_64-randconfig-071-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241330.vmNnBWvZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241330.vmNnBWvZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241330.vmNnBWvZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/bpf/preload/iterators/iterators.lskel-little-endian.h:6,
                    from kernel/bpf/preload/bpf_preload_kern.c:7:
   tools/lib/bpf/skel_internal.h: In function 'skel_map_create':
   tools/lib/bpf/skel_internal.h:246:9: error: implicit declaration of function 'strncpy' [-Wimplicit-function-declaration]
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

e981f41fd029d37 Alexei Starovoitov 2022-01-31  228  
e981f41fd029d37 Alexei Starovoitov 2022-01-31  229  static inline int skel_map_create(enum bpf_map_type map_type,
e981f41fd029d37 Alexei Starovoitov 2022-01-31  230  				  const char *map_name,
e981f41fd029d37 Alexei Starovoitov 2022-01-31  231  				  __u32 key_size,
e981f41fd029d37 Alexei Starovoitov 2022-01-31  232  				  __u32 value_size,
fb2b0e290147ba0 KP Singh           2025-09-21  233  				  __u32 max_entries,
fb2b0e290147ba0 KP Singh           2025-09-21  234  				  const void *excl_prog_hash,
fb2b0e290147ba0 KP Singh           2025-09-21  235  				  __u32 excl_prog_hash_sz)
e981f41fd029d37 Alexei Starovoitov 2022-01-31  236  {
fb2b0e290147ba0 KP Singh           2025-09-21  237  	const size_t attr_sz = offsetofend(union bpf_attr, excl_prog_hash_size);
e981f41fd029d37 Alexei Starovoitov 2022-01-31  238  	union bpf_attr attr;
e981f41fd029d37 Alexei Starovoitov 2022-01-31  239  
e981f41fd029d37 Alexei Starovoitov 2022-01-31  240  	memset(&attr, 0, attr_sz);
e981f41fd029d37 Alexei Starovoitov 2022-01-31  241  
e981f41fd029d37 Alexei Starovoitov 2022-01-31  242  	attr.map_type = map_type;
fb2b0e290147ba0 KP Singh           2025-09-21  243  	attr.excl_prog_hash = (unsigned long) excl_prog_hash;
fb2b0e290147ba0 KP Singh           2025-09-21  244  	attr.excl_prog_hash_size = excl_prog_hash_sz;
fb2b0e290147ba0 KP Singh           2025-09-21  245  
e981f41fd029d37 Alexei Starovoitov 2022-01-31 @246  	strncpy(attr.map_name, map_name, sizeof(attr.map_name));
e981f41fd029d37 Alexei Starovoitov 2022-01-31  247  	attr.key_size = key_size;
e981f41fd029d37 Alexei Starovoitov 2022-01-31  248  	attr.value_size = value_size;
e981f41fd029d37 Alexei Starovoitov 2022-01-31  249  	attr.max_entries = max_entries;
e981f41fd029d37 Alexei Starovoitov 2022-01-31  250  
e981f41fd029d37 Alexei Starovoitov 2022-01-31  251  	return skel_sys_bpf(BPF_MAP_CREATE, &attr, attr_sz);
e981f41fd029d37 Alexei Starovoitov 2022-01-31  252  }
e981f41fd029d37 Alexei Starovoitov 2022-01-31  253  

:::::: The code at line 246 was first introduced by commit
:::::: e981f41fd029d37b3e1c8aad2d72d3fe57a104d6 libbpf: Open code low level bpf commands.

:::::: TO: Alexei Starovoitov <ast@kernel.org>
:::::: CC: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
