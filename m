Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7CB1AD9F9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 10:38:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733481537; cv=none; b=lD4e88/oCx2lCYAFziz/LH8+xMEagfINZNtpFze5Ux//TG1PwBQTDQnokCuVU3HG4zXeHIK0z5nEN5NWCAOE/5qz35cCpD2mvWm1dFbBtT8u4mkaPlX0rmGXF1qoN9cRiF069qZ2GfBtfpPygd9hO4JWpFUynQp/UYjN01otbdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733481537; c=relaxed/simple;
	bh=P6dITIR1JD46YaSgmTsBIadnaEckgE05H61Mw10nIN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfQGyZUOngVYVUN1OKe6SjLNz8lyrmL3RY/Eo9laoLhJs+fha8c696nygCoNzCtWTkoAsMcRvOJUudz6bAalVSsv5dIz1cSUFgEXpFRV7DL5uYmqkBmY18Cq3828IfN/WiDVVOM4j4aeiDQ19ukQ9OgS6jPTfZp/Pqrxb/Y6sIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2Z+y49g; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2Z+y49g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733481535; x=1765017535;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P6dITIR1JD46YaSgmTsBIadnaEckgE05H61Mw10nIN4=;
  b=K2Z+y49g7QdSYHCvPz3GCx+DUj3T9k5t3M8QVi9fZVsw+TCmBT9Tom44
   d8KdJy1v7hviknoXUCmCWTFfPkPPfFlFj/QYJxCsqpKQMfX6OGiYDsF5e
   gtNDb4xCO64m/OtbP5QM3IJyY+bFD1xOGT6LnWPODqEq3iGXL99oIxpsl
   jqdtJ9NgiQ+NaLkzUFS7KmXbRis681Yx/qWwqlaLlLzl6XllE7vnXUCiR
   wC5neGbqgRQOtzCcCKz+cYVvqZNsLZ9XA21/823aVlPvaeFLHxPrklFE+
   PgdLZ83u0Q5zdFIFqg3TFeMTa8JYJoV4azmHw+o8cKPi3P37a0kPm7ue1
   Q==;
X-CSE-ConnectionGUID: KfoybigzSNCPRQXshXkHaQ==
X-CSE-MsgGUID: cPzFJXtDTXWMo0T0m8Ghnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="34069820"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="34069820"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 02:38:54 -0800
X-CSE-ConnectionGUID: QvaF9vFMSKmwq2tL9qcK4Q==
X-CSE-MsgGUID: 9mzHoINSQf6/HINp0nGi7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="131793708"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 06 Dec 2024 02:38:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJVjW-0000wU-2I;
	Fri, 06 Dec 2024 10:38:50 +0000
Date: Fri, 6 Dec 2024 18:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/fprobe-on-fgraph 19/19]
 kernel/trace/bpf_trace.c:1053:22: error: call to undeclared function
 'ftrace_get_symaddr'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202412061859.I5bvmqEu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/fprobe-on-fgraph
head:   e6369db4372d722c47a45887eeb6a0f483c20ced
commit: e6369db4372d722c47a45887eeb6a0f483c20ced [19/19] bpf: Use ftrace_get_symaddr() in get_entry_ip()
config: x86_64-randconfig-161-20241206 (https://download.01.org/0day-ci/archive/20241206/202412061859.I5bvmqEu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061859.I5bvmqEu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061859.I5bvmqEu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/trace/bpf_trace.c:8:
   In file included from include/linux/bpf.h:21:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   kernel/trace/bpf_trace.c:356:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     356 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:402:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     402 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:457:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     457 |         .arg1_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:459:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     459 |         .arg3_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:501:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     501 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:503:35: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     503 |         .arg4_type      = ARG_PTR_TO_MEM | PTR_MAYBE_NULL | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
   kernel/trace/bpf_trace.c:518:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     518 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:542:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     542 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:706:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
     706 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1033:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1033 |         .arg3_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
>> kernel/trace/bpf_trace.c:1053:22: error: call to undeclared function 'ftrace_get_symaddr'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1053 |         unsigned long ret = ftrace_get_symaddr(fentry_ip);
         |                             ^
   kernel/trace/bpf_trace.c:1214:41: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1214 |         .arg3_type      = ARG_PTR_TO_FIXED_SIZE_MEM | MEM_UNINIT | MEM_WRITE | MEM_ALIGNED,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1231:41: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1231 |         .arg2_type      = ARG_PTR_TO_FIXED_SIZE_MEM | MEM_UNINIT | MEM_WRITE | MEM_ALIGNED,
         |                           ~~~~~~~~~~~~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1660:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1660 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1885:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1885 |         .arg4_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   kernel/trace/bpf_trace.c:1940:30: warning: bitwise operation between different enumeration types ('enum bpf_arg_type' and 'enum bpf_type_flag') [-Wenum-enum-conversion]
    1940 |         .arg2_type      = ARG_PTR_TO_MEM | MEM_RDONLY,
         |                           ~~~~~~~~~~~~~~ ^ ~~~~~~~~~~
   16 warnings and 1 error generated.


vim +/ftrace_get_symaddr +1053 kernel/trace/bpf_trace.c

  1050	
  1051	static unsigned long get_entry_ip(unsigned long fentry_ip)
  1052	{
> 1053		unsigned long ret = ftrace_get_symaddr(fentry_ip);
  1054	
  1055		return ret ? : fentry_ip;
  1056	}
  1057	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
