Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438E91F4C9C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 23:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744672595; cv=none; b=HWVQ9FBD6Rdiiz+hyQGyiCCi1h5HSRCQNcPmQ6IIXHyK9ErRWHsqPPdx9R5RTQgPvZgdvPsS0WA1ZDP2wzYf5iiJoyp+YG4BYqvZl3kCFeHPTrRWg2xwyqotHtimn71EkaCm5KV1ceRvR/BlhAcGGNZPLgW/PzpEuMcoojl88wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744672595; c=relaxed/simple;
	bh=UC3zPa2xTIg66lxQ19Q2OUf5COUUnYELwl8vqu9AQJY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NYyoH0Nj30SzrEU2xu6qLQgzHkRzm/JMqJx43DXaqZiHUDTXYBbQB0yA+s2JWc2iWhw8Cj8R/o+ilBI7lFyyulzsSk7Dpf9+E+YlMLduxJgX/tQihnjUAOuHWyyfrfNYKpbdsbcaIKHT5kae4jgGLQSjcDTdMQoYMRQHg8HY3Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCVII/p6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCVII/p6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744672593; x=1776208593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UC3zPa2xTIg66lxQ19Q2OUf5COUUnYELwl8vqu9AQJY=;
  b=HCVII/p6o1hpnJ1VN+wcq2GI7ST2TxAzKSJW/DgBWCEOhE5bEUSlbqMC
   5mte0FJJYxEu9HXGlRztouRLj6mzkrivqgJpm74h506qRdqGkIBzUOETm
   nqKa+x1lhp2EknuqlKHL7mhSAjP4wYnjvA+i48VR2cUQz5ixFzNpFA6jM
   cf1Ce4qWkOJ9qE25Wq6TCOia6JlzKk3gJM8OWHQSIegvxKR0SbJZ/zfcw
   5krssEB1dGbWvRUxnL7nvtKdTyR+I4zmCoCpnamJdJSNvcQnqrWYJkBhU
   W7SvKqkgEQmIvmBMVcajPvaA9Uy89v96CDk+sYkN9f5RXvKsRtTBFPRQl
   A==;
X-CSE-ConnectionGUID: HtvpXb/oToCUIzJunt5jsQ==
X-CSE-MsgGUID: 3RAiYs8oS/WUcTnoqdujAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="49991819"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="49991819"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2025 16:16:19 -0700
X-CSE-ConnectionGUID: Z2nKmpoeS5iwrqbV2yEXdQ==
X-CSE-MsgGUID: WneT0/RHQc2I8p8MDq0n0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="129795078"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Apr 2025 16:16:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u4T2F-000EoS-0L;
	Mon, 14 Apr 2025 23:16:15 +0000
Date: Tue, 15 Apr 2025 07:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:stream 9/13] kernel/bpf/core.c:3158:undefined reference
 to `bpf_prog_find_from_stack'
Message-ID: <202504150751.jxC8kZ8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux stream
head:   a1aa685f70a017d3492be37e89d45d5633fc0203
commit: 1831d6e322ca5ae2738417b28733210440be19c6 [9/13] bpf: Report may_goto timeout to BPF stderr
config: sparc-randconfig-002-20250415 (https://download.01.org/0day-ci/archive/20250415/202504150751.jxC8kZ8Y-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250415/202504150751.jxC8kZ8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504150751.jxC8kZ8Y-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: kernel/bpf/core.o: in function `bpf_prog_report_may_goto_violation':
>> kernel/bpf/core.c:3158:(.text+0x38cc): undefined reference to `bpf_prog_find_from_stack'
>> sparc-linux-ld: kernel/bpf/core.c:3163:(.text+0x3904): undefined reference to `bpf_prog_stderr_printk'
>> sparc-linux-ld: kernel/bpf/core.c:3164:(.text+0x390c): undefined reference to `bpf_prog_stderr_dump_stack'


vim +3158 kernel/bpf/core.c

  3153	
  3154	static noinline void bpf_prog_report_may_goto_violation(void)
  3155	{
  3156		struct bpf_prog *prog;
  3157	
> 3158		prog = bpf_prog_find_from_stack();
  3159		if (!prog)
  3160			return;
  3161		if (atomic_long_fetch_add(1, &prog->aux->error_count) >= BPF_PROG_ERROR_COUNT_MAX)
  3162			return;
> 3163		bpf_prog_stderr_printk(prog, "ERROR: Timeout detected for may_goto instruction\n");
> 3164		bpf_prog_stderr_dump_stack(prog);
  3165	}
  3166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
