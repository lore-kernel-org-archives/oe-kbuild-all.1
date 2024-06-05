Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D014A200CD
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jun 2024 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717579589; cv=none; b=HDXZZD84ebjQqF9Cz3Vas67A8hnn3S8kmwbSYMVwyfPiqM4QEGyvC/mNEcd6e9DE2wv30jV2/Pwwoj+f4JsWaOE+pxwfmUamoDrsZisBDq5d2JutLqt4C8MUaS7mie6OUQBPZwSPnLh+d9NW9uAq1i5lZCACCE3GGhTipHOvnNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717579589; c=relaxed/simple;
	bh=TYIDPET/aV9Dzud8MzNY57V4YuY208SnEVHdJHKclJk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CUUaTZ/xheQvRol/m10zegvWqWLMHbf6DeXVpigjS1Y+Daqo7NQg3hpnkjYtohZJVNdqFlj5ISnSqXuiK4m35f6UdKP4IxpvpCChGrlJ+tZN2/du3w9pKg6pgDBUYv8ckYHWAsevXFnVgV+SUT4mLr44qrTr1rxnFOhAB45cSSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khOfx3Na; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khOfx3Na"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717579588; x=1749115588;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TYIDPET/aV9Dzud8MzNY57V4YuY208SnEVHdJHKclJk=;
  b=khOfx3Na97Yz1gRtUGM08jhgViUfnK0jWGRKU0NYqP8sm2FZ88E0FMaH
   CZojFMQPCqeRpRpqMgB3QRw56ZVlhjm93cvtIUIYQZ4rUaPiCmjiwaxkD
   nFSplLP+BDYnJoMtIduZ3yOc8r+rJuRndvIS3r1uu7+bZwiihZikAQ5jj
   eOXSNRiNnjXJACKRlM9LMtRMFwWlFQXp+mg8/VdMYdbD2qu8m+CIN5uq+
   WCYrw0OHWd1rOSQCjLuujqCx+jJKNIPs4igVdELkF5OOMyXvOkt0fDoUW
   Tn7Vp/xkIUYnfzWkFv95zboG0QmMEX2MtZRlmpXoHQjf5gPaDRPUMw4gr
   Q==;
X-CSE-ConnectionGUID: FrwsQVsYToacgI0YycolLQ==
X-CSE-MsgGUID: BaFDyEsxQ5mhTMgs5slSlA==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="36697109"
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="36697109"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 02:26:28 -0700
X-CSE-ConnectionGUID: McDYAtaaS0aumF48Q7p50A==
X-CSE-MsgGUID: L+4ZSQ/TTTOMBX5tGYqlNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,216,1712646000"; 
   d="scan'208";a="37967231"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2024 02:26:26 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sEmuV-0001I1-2A;
	Wed, 05 Jun 2024 09:26:23 +0000
Date: Wed, 5 Jun 2024 17:25:46 +0800
From: kernel test robot <lkp@intel.com>
To: "Steven Rostedt (Google)" <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>
Subject: [linux-next:master 3324/3594] kernel/trace/fgraph.c:517:1: sparse:
 sparse: symbol 'fgraph_do_direct' was not declared. Should it be static?
Message-ID: <202406051711.dS1sQZ9n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   234cb065ad82915ff8d06ce01e01c3e640b674d2
commit: cc60ee813b50334b32343861057dc9e981e9c7f0 [3324/3594] function_graph: Use static_call and branch to optimize entry function
config: i386-randconfig-r131-20240605 (https://download.01.org/0day-ci/archive/20240605/202406051711.dS1sQZ9n-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240605/202406051711.dS1sQZ9n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406051711.dS1sQZ9n-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/trace/fgraph.c:517:1: sparse: sparse: symbol 'fgraph_do_direct' was not declared. Should it be static?

vim +/fgraph_do_direct +517 kernel/trace/fgraph.c

   514	
   515	static struct fgraph_ops *fgraph_direct_gops = &fgraph_stub;
   516	DEFINE_STATIC_CALL(fgraph_func, ftrace_graph_entry_stub);
 > 517	DEFINE_STATIC_KEY_TRUE(fgraph_do_direct);
   518	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
