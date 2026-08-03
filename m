Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4F638F64E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Aug 2026 06:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737477; cv=none; b=bX6mZSDr8l305LoX7c11z17zl8zm/Ro28d/G/xMq11ya0WVnIlhelQOy8UyKZb9z56s/DPsAn33mQfr//HJPtx/e9/xaH667Qzw5ecei4V6jTcCPwsAsLlT9YQV9t/t8zyAh4hEnOw00q/ObMSlsd0H0aFv4vwuD6XH1Oy3dqoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737477; c=relaxed/simple;
	bh=DG4JtGljEXx+Xd+xKeZf+b+GDXwEvJQQBlxvJ9hsw/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UCiZCFXOfk3sEAO4YOTbpNF1WrVhk5qX9mmM5S27BjD1kqQ164MsJrYbg5Vaovg2EvvZIiar4xflBG/RbEarc51G84GxqHaYiOyXEanouKozeLczmGyxxhcG6KtI1WsqIFuvbiVFHLes37XXqNNMDNJk6NZsOx1OTDaKvFl8xFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acDm7Jxe; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acDm7Jxe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785737476; x=1817273476;
  h=date:from:to:cc:subject:message-id;
  bh=DG4JtGljEXx+Xd+xKeZf+b+GDXwEvJQQBlxvJ9hsw/Y=;
  b=acDm7JxeyQsu3LiN3BTb4bFpN9S4JuzTs+vgFPMzkKRhtbCOFFvvg8td
   AWlMKygGuflJhEgQavdvVp85byx1j9bgRq41RknuXcONVnKJFoewLbNfz
   4JwVMXQAWN6a2xOJxEYAHJO2VotWMoF1aGg/am+zdJ+deniw976HJKPZy
   04Z3BW0B3QIdmC11F+eeGtUAZzEYNv+Eq1L9SUcFmDLRs8h0QA9F7vSOh
   5w7jPUPtgDQDk6aBjtmlTBpN/ABbVY0ng4KMxRwIG1rBrC9aivW6TcDvU
   cPOjWJFg2TGFtBzaaZGi6CDKQGqzrh8DDKhyre+kCuh8x0ItUcBokrybP
   Q==;
X-CSE-ConnectionGUID: obcUhCaHQsmCtfLJxDtrrA==
X-CSE-MsgGUID: EFbCOEnNSbG/noQiPFYnOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="85239697"
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="85239697"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2026 23:11:15 -0700
X-CSE-ConnectionGUID: orihfKhQRB+T0LD+o+TrRQ==
X-CSE-MsgGUID: VIXswIxLQiS7WI1OMA55KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,201,1779174000"; 
   d="scan'208";a="256803928"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 02 Aug 2026 23:11:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqltH-000000006Ff-257c;
	Mon, 03 Aug 2026 06:11:11 +0000
Date: Mon, 03 Aug 2026 14:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mhiramat:topic/wprobe-v2 8/11]
 kernel/trace/trace_wprobe.c:230:16: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202608031425.kS00ixRr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mhiramat/linux.git topic/wprobe-v2
head:   a4397d5c0abf35acc79a3324139364deaf5883ec
commit: d83c23ec2a39f1ae346bbce351cb004be5c58c1e [8/11] tracing: wprobe: Add wprobe event trigger
config: x86_64-randconfig-123-20260803 (https://download.01.org/0day-ci/archive/20260803/202608031425.kS00ixRr-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260803/202608031425.kS00ixRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608031425.kS00ixRr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/trace_wprobe.c:230:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_event **pevent @@     got struct perf_event *[noderef] __percpu * @@
   kernel/trace/trace_wprobe.c:230:16: sparse:     expected struct perf_event **pevent
   kernel/trace/trace_wprobe.c:230:16: sparse:     got struct perf_event *[noderef] __percpu *
>> kernel/trace/trace_wprobe.c:234:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_event ** @@
   kernel/trace/trace_wprobe.c:234:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/trace/trace_wprobe.c:234:15: sparse:     got struct perf_event **

vim +230 kernel/trace/trace_wprobe.c

   225	
   226	static int trace_wprobe_update_local(struct trace_wprobe *tw, unsigned long addr)
   227	{
   228		struct perf_event **pevent, *bp;
   229	
 > 230		pevent = READ_ONCE(tw->bp_event);
   231		if (!pevent)
   232			return -EINVAL;
   233	
 > 234		bp = *this_cpu_ptr(pevent);
   235		if (!bp)
   236			return -EINVAL;
   237	
   238		return modify_local_hw_breakpoint_addr(bp, addr);
   239	}
   240	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
