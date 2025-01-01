Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8F04A31
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jan 2025 01:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735695080; cv=none; b=Ea8qUNVPxY80iBZQ8M27T2kExyNrmPsXGVkU32R6zNVJBHpVTETxcPAp8UdE2kJFcwKuO3X5Tt+TklckfEI02qUcltSB9KqCLcCbISyamIwdT4d1GedBeUE1kSuz+CFpAt05ch8ZFHjtau2jBBPd7jhKtCWomYf15zc5iQcdxQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735695080; c=relaxed/simple;
	bh=1nlZN6KAqu/AJA1O20qeQ5GQE+YEMJthEIjvqHeNfzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fodyUiQbRZoNmf4NLbcK+6IgU1qZcXayB6wkyyz6cv7mfU7VIgcyREhm59M8xNDiA6dHoB1l+MveXuTkXkwNzQW6fTSKOW9R1yhtTT7J0E63F1C094YmRfo5SDd/IPILflnLV0MxTbEvraTPpq7gEXJnQe17j+MNc3DGeJKgYGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYB+MC92; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYB+MC92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735695079; x=1767231079;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1nlZN6KAqu/AJA1O20qeQ5GQE+YEMJthEIjvqHeNfzc=;
  b=fYB+MC92sCUsJYM6rnWZOh4keLeFBKXy/q7M8ZX8MPAJmtpQqAmYrEOZ
   dEGnKLYhlDtpxq79N1gy1KPNqS7Z6IFiYswSJ7oOThOMQADd+/qWcp+Hq
   U1ueq51PN2gt/qIQTN74icSD2uj48oKBvqLtqGRIZcRZPso9E2VO15rzh
   PywCtGqlo40EHeSchLflWvhRIRQBdo20p+BEQxzSVc1n78rErOIAf5h3s
   mfpMFwfv8ZctsSY1ypCtoOir5jHdLxcs12oUgNreFspJXnbfsHCel1H97
   hBp45MSiqmcfXq7TLftsOf5QyICk9RQcHIfVd3RHEzsaThuIdabBJDMe4
   Q==;
X-CSE-ConnectionGUID: +z7cGJOsSaW64YwFErlW1A==
X-CSE-MsgGUID: 9A4S++D3QPO0AmM8b3rwgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11302"; a="35987066"
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="35987066"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2024 17:31:18 -0800
X-CSE-ConnectionGUID: ++KSNbElSzScuNhIfryF6g==
X-CSE-MsgGUID: 6u06Z2BYSn+na/PPqbMVRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,280,1728975600"; 
   d="scan'208";a="101343092"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 31 Dec 2024 17:31:17 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSnZq-0007Yk-3B;
	Wed, 01 Jan 2025 01:31:14 +0000
Date: Wed, 1 Jan 2025 09:31:04 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Schnelle <svens@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [jolsa-perf:tmp 5/5] kernel/trace/trace_irqsoff.c:287:26: error: too
 few arguments to function 'trace_function'
Message-ID: <202501010955.ydD2PbdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git tmp
head:   e2a63411ac4e1b7b36da9f4c2245570d92842d2e
commit: e2a63411ac4e1b7b36da9f4c2245570d92842d2e [5/5] ftrace: Add arguments to function tracer
config: arc-randconfig-002-20250101 (https://download.01.org/0day-ci/archive/20250101/202501010955.ydD2PbdV-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250101/202501010955.ydD2PbdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501010955.ydD2PbdV-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/trace/trace_irqsoff.c: In function 'check_critical_timing':
>> kernel/trace/trace_irqsoff.c:287:26: error: too few arguments to function 'trace_function'
     287 | #define __trace_function trace_function
         |                          ^~~~~~~~~~~~~~
   kernel/trace/trace_irqsoff.c:350:9: note: in expansion of macro '__trace_function'
     350 |         __trace_function(tr, CALLER_ADDR0, parent_ip, trace_ctx);
         |         ^~~~~~~~~~~~~~~~
   In file included from kernel/trace/trace_irqsoff.c:19:
   kernel/trace/trace.h:685:6: note: declared here
     685 | void trace_function(struct trace_array *tr,
         |      ^~~~~~~~~~~~~~
>> kernel/trace/trace_irqsoff.c:287:26: error: too few arguments to function 'trace_function'
     287 | #define __trace_function trace_function
         |                          ^~~~~~~~~~~~~~
   kernel/trace/trace_irqsoff.c:372:9: note: in expansion of macro '__trace_function'
     372 |         __trace_function(tr, CALLER_ADDR0, parent_ip, trace_ctx);
         |         ^~~~~~~~~~~~~~~~
   kernel/trace/trace.h:685:6: note: declared here
     685 | void trace_function(struct trace_array *tr,
         |      ^~~~~~~~~~~~~~
   kernel/trace/trace_irqsoff.c: In function 'start_critical_timing':
>> kernel/trace/trace_irqsoff.c:287:26: error: too few arguments to function 'trace_function'
     287 | #define __trace_function trace_function
         |                          ^~~~~~~~~~~~~~
   kernel/trace/trace_irqsoff.c:401:9: note: in expansion of macro '__trace_function'
     401 |         __trace_function(tr, ip, parent_ip, tracing_gen_ctx());
         |         ^~~~~~~~~~~~~~~~
   kernel/trace/trace.h:685:6: note: declared here
     685 | void trace_function(struct trace_array *tr,
         |      ^~~~~~~~~~~~~~
   kernel/trace/trace_irqsoff.c: In function 'stop_critical_timing':
>> kernel/trace/trace_irqsoff.c:287:26: error: too few arguments to function 'trace_function'
     287 | #define __trace_function trace_function
         |                          ^~~~~~~~~~~~~~
   kernel/trace/trace_irqsoff.c:435:9: note: in expansion of macro '__trace_function'
     435 |         __trace_function(tr, ip, parent_ip, trace_ctx);
         |         ^~~~~~~~~~~~~~~~
   kernel/trace/trace.h:685:6: note: declared here
     685 | void trace_function(struct trace_array *tr,
         |      ^~~~~~~~~~~~~~


vim +/trace_function +287 kernel/trace/trace_irqsoff.c

62b915f1060996 Jiri Olsa 2010-04-02  285  
62b915f1060996 Jiri Olsa 2010-04-02  286  #else
62b915f1060996 Jiri Olsa 2010-04-02 @287  #define __trace_function trace_function
62b915f1060996 Jiri Olsa 2010-04-02  288  

:::::: The code at line 287 was first introduced by commit
:::::: 62b915f1060996a8e1f69be50e3b8e9e43b710cb tracing: Add graph output support for irqsoff tracer

:::::: TO: Jiri Olsa <jolsa@redhat.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
