Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3F110957
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Jun 2025 02:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749522536; cv=none; b=inQ8zomPbMve/AGzJKlCwqPhEFOYw4+3GrMAQ4e/Rp37Cn7VeJiI1B3E6TqHTP1bPQ+3mIt4f2d7WkzgkxwuEjgQZUUphkUutETp7L4uFhvFGtkALaRThVcYrVeC23+DzQ1aivb48fVlYgSucxcePCyQxI/pSuhJrN0jwWkBukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749522536; c=relaxed/simple;
	bh=hMF+XUjkbroWoQpiop7zmRVCjpQTeDMROQO2cCjfqY0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmCkWfWv8Sfi2l3bzNtTnRbDinHqiPLY8T34Rm3xPLYiBN2AhbqI0x+pYOf80onaqhFJL9Rtrufo7Kq7tGs/OzJlj4wYWGukcpfPE9/kX8dKLoq0cxiqfKyEpvHj5fCgX2q1fXRfgDj5tEW/9G9imX00KaoiyROGAe6YjY+vxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VjgexT0N; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VjgexT0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749522533; x=1781058533;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMF+XUjkbroWoQpiop7zmRVCjpQTeDMROQO2cCjfqY0=;
  b=VjgexT0NfgxFMhM2ADt69bGKNCs4GGhp9danCxw/FxslWUXdWBxmFZ+g
   1EZTovLetTG59zIVPBDaqge0LIEEN40WEJmf2SHUq2fnAPHjAiHTUDQtn
   eL9IwP63K1E7k4jYI8mAHMkdBXjkJUrYMNGh5w2Uk1J8arvJKkDNXPQzz
   gW3tL5Da2dkK0YTQFSmPc7J7O9Ymwu3vI8FTZmxsbRuh/+CTmam8J8/kL
   7UkPe0E4iypg+S26IAw3pxeq0YBxgdq/RfBDJjBlqEUpC5Br/X7yTxnWW
   3CcC2RGKhxrSN4EaU60rsgu1YcmUJHSUQnPidYq1NQaHwGSbQT0ICgivM
   g==;
X-CSE-ConnectionGUID: /it498o1TBWqa6GYmhS6nw==
X-CSE-MsgGUID: CW6+sqkQQq+zskZSuAhwKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="63022022"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; 
   d="scan'208";a="63022022"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 19:28:52 -0700
X-CSE-ConnectionGUID: AZdhsLbVTz69RIayUOk9gw==
X-CSE-MsgGUID: kJt4cKwxTzWUYJ0Av/MW+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="169869537"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2025 19:28:51 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOojJ-0007en-1x;
	Tue, 10 Jun 2025 02:28:49 +0000
Date: Tue, 10 Jun 2025 10:28:14 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [trace:sorttable/core 1/3] kernel/tracepoint.c:688:13: sparse:
 sparse: incompatible types in comparison expression (different base types):
Message-ID: <202506101014.5JeZRP5g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace sorttable/core
head:   6ff69a9fcc809b9fe23a55e798f1d8fa96cd618c
commit: 4c4671156167615772fe0019b7aa80002d8c15b6 [1/3] tracepoints: Add verifier that makes sure all defined tracepoints are used
config: i386-randconfig-061-20250610 (https://download.01.org/0day-ci/archive/20250610/202506101014.5JeZRP5g-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506101014.5JeZRP5g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506101014.5JeZRP5g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/tracepoint.c:688:13: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/tracepoint.c:688:13: sparse:    struct tracepoint_func [noderef] __rcu *
   kernel/tracepoint.c:688:13: sparse:    void *
   kernel/tracepoint.c:704:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func [noderef] __rcu *funcs @@     got void * @@
   kernel/tracepoint.c:704:27: sparse:     expected struct tracepoint_func [noderef] __rcu *funcs
   kernel/tracepoint.c:704:27: sparse:     got void *

vim +688 kernel/tracepoint.c

   685	
   686	static void check_tracepoint(struct tracepoint *tp, void *priv)
   687	{
 > 688		if (WARN_ONCE(tp->funcs != VERIFIED_TRACEPOINT, "Unused tracepoints found"))
   689			pr_warn("Tracepoint %s unused\n", tp->name);
   690	
   691		tp->funcs = NULL;
   692	}
   693	#endif
   694	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
