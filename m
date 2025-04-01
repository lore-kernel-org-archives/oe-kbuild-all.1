Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC091E5702
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 07:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743491653; cv=none; b=eOAsgwtdXMScTpntoDx/gD5tBk4Q3BuMgzekZ/NIKMrYcyhy6bHUsVhY0rNe4bAZ+YCgbudFEl4t5L5iWOe717/3Y2rOI/UJcBQU3TW5gOS6Bi8Xuh+bOlR49C/sY91/TZH0RSLIQ7U4DlYX0GR7Er+3m+Qf8ycfJFrtoBLYxwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743491653; c=relaxed/simple;
	bh=AAf425N8KsUmddjLc2zOGmGqGnniXXVbBNQ+ErWpFuI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmf9mfWh0gnQdPp+dJfX/tqb7/AV29RMmPJpk0SQVLCJWEcemdrj2Dvw06bY2bzxk9iikpTZe11gK5MPbqgwcTBkiS1VXDWNTrdTt4lwrifCD3e7uKGWJ4zjnKHoEgIKCbD3Y9WEaeorxOJ+TwN7mieZ34ISQvBUzBXXpI9MCJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MFg3vRc4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFg3vRc4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743491652; x=1775027652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AAf425N8KsUmddjLc2zOGmGqGnniXXVbBNQ+ErWpFuI=;
  b=MFg3vRc40cXQtdREEGPMWfEqFBispjPDBGzVfrukX05x1mOitwEJqWbr
   Y1H0jZ/SFGxY4ZLsGMMsqHQn9IF8JkX7evv/Xp+HSp45e1Gub0qLxT1Sf
   5gIj87E/4aa5fpOaMCeKG6VhMg8sSbKjijaS35NcBN2oi5WUzqkxDm/gG
   ZN6s3WMIEC6f1qmlUFmZg0DH4PJJ9ffATBqTalQ7JCvI6lTnAnoIGQc1L
   ZjycjKaY8uQEjywgpzhdBMmoEVMIw6zp5HNRUuMtiGuSfjTQ4iuirkRKi
   wj1GVhcUhhYxSRxyw7dbLlA9wks5c0jjhP9LtN/dGQ8z1y+gSpt5395aU
   g==;
X-CSE-ConnectionGUID: zkPIE4LpScyXnfmycAy8wQ==
X-CSE-MsgGUID: DOfrfkgMRbiJXgnP+CDqEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="62194762"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="62194762"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:14:09 -0700
X-CSE-ConnectionGUID: QsXycjGSRF2ApIHPHVIkgg==
X-CSE-MsgGUID: IVdaTdZrQW+SrgApdc4h3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="130438010"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Apr 2025 00:14:08 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzVoz-0009hS-2E;
	Tue, 01 Apr 2025 07:14:05 +0000
Date: Tue, 1 Apr 2025 15:13:08 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: include/trace/events/initcall.h:48:(.text+0x98): relocation
 truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined
 in .text section in
 ../lib/gcc/arc-linux/12.4.0/hs38/libgcc.a(_millicodethunk_st.o)
Message-ID: <202504011540.dQnvkIZE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08733088b566b58283f0f12fb73f5db6a9a9de30
commit: 1802656ef8906cc949f58b64cb6d8d400326e163 io_uring: add GCOV_PROFILE_URING Kconfig option
date:   7 months ago
config: arc-randconfig-001-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011540.dQnvkIZE-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250401/202504011540.dQnvkIZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011540.dQnvkIZE-lkp@intel.com/

All errors (new ones prefixed by >>):

   init/main.o: in function `__traceiter_initcall_finish':
>> include/trace/events/initcall.h:48:(.text+0x98): relocation truncated to fit: R_ARC_S25W_PCREL against symbol `__st_r13_to_r15' defined in .text section in ../lib/gcc/arc-linux/12.4.0/hs38/libgcc.a(_millicodethunk_st.o)


vim +48 include/trace/events/initcall.h

4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  47) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23 @48) TRACE_EVENT(initcall_finish,
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  49) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  50) 	TP_PROTO(initcall_t func, int ret),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  51) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  52) 	TP_ARGS(func, ret),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  53) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  54) 	TP_STRUCT__entry(
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  55  		/*
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  56  		 * Use field_struct to avoid is_signed_type()
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  57  		 * comparison of a function pointer
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  58  		 */
0566e40ce7c493 Rishabh Bhatnagar       2018-04-25  59  		__field_struct(initcall_t,	func)
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  60) 		__field(int,			ret)
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  61) 	),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  62) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  63) 	TP_fast_assign(
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  64) 		__entry->func = func;
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  65) 		__entry->ret = ret;
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  66) 	),
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  67) 
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  68) 	TP_printk("func=%pS ret=%d", __entry->func, __entry->ret)
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  69) );
4ee7c60de83ac0 Steven Rostedt (VMware  2018-03-23  70) 

:::::: The code at line 48 was first introduced by commit
:::::: 4ee7c60de83ac01fa4c33c55937357601631e8ad init, tracing: Add initcall trace events

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
