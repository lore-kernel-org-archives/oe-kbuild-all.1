Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE97784A2B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 02:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730169523; cv=none; b=EqVT+0u2GJltrvcUZZ2dK33A/CpR1yKlTK4Fe6fKL6d94fbFv8An1iXrW6/w6Z0rqbByGlLQDQ4ZqVGnRHqjbdMLVuwO7ZyUqbHrvwIJ682Zm9EQ2BFKwlTL2iZyzrPr7U6oHW8RSTYIHGBTqsn6JgOfWT02wek9Yh8UcijpDBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730169523; c=relaxed/simple;
	bh=2LBbHhYPy6N7tLWSQGHJ63iMEJxdR6NbRLagxIu+waI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G4slc+tKDSwbhbXpCod/5f5+8FQIejbVrGJfTXAr5iZG5H+n3zwZC8ouB1RhR/+F+WCfIewlwN8Vw3VWEApjDBq4aBIll9TwaW0gMazB9Gnn076LAxbjc8N/Uo3rAwPQziAgEAy8QpvDDa8Tux32M8G/3N3ltoMY5ktwa1RuNg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h7ErkqsJ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h7ErkqsJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730169521; x=1761705521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2LBbHhYPy6N7tLWSQGHJ63iMEJxdR6NbRLagxIu+waI=;
  b=h7ErkqsJu5ZK6r6jvO+QDRZ5zZ+99vuSLo9LMBZRk292y9rwOZyGl6KF
   bp+Bj9k6ErlFnxD2sZpyVLr7cZhBkoayZEdmfQF509ZyRpz8JwKhqr05b
   ZqFqIkc3AvljV7gv67HR6K1AVPWATJsPAeF1HOZrVWwlDv0L1jzyHotDm
   7pQZXOHCLJfv6uDqYTpEDuMU+VpGnNYB1YJGFFfsLoCecdAdqPTCfOL/a
   r/F27TT1MUGt9tiomHowYMOJ7jxkpCgeaEv5aUsZ+R227WW750ToxfxRn
   YBtTg489iKuFkV61YXTzU1H3s+15RHu4vableraF0M8whd1ZvmRAv+aik
   g==;
X-CSE-ConnectionGUID: ahaXtLOLRfCvlNgbVMOnGw==
X-CSE-MsgGUID: AR4miZP/SmKx6ZtpAgCyLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40885779"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40885779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 19:38:40 -0700
X-CSE-ConnectionGUID: mMndJ5/+QfibjahtHsTUfA==
X-CSE-MsgGUID: jHlwZLM4T0+U1aUYpLm/7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="81872847"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Oct 2024 19:38:38 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5c7w-000dAS-0l;
	Tue, 29 Oct 2024 02:38:36 +0000
Date: Tue, 29 Oct 2024 10:38:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4d 73/82] lib/dynamic_debug.c:94:9: error: implicit
 declaration of function 'mt_dump'; did you mean 'xa_dump'?
Message-ID: <202410291006.bBVwT6nu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git dd-shrink-4d
head:   98a15f4b1948cdaabac1f0fc008c79870c4d4672
commit: c3746eba32683abe010272527c9ef1aede38c68b [73/82] dyndbg: save _ddebug_site mod,file,func fields into maple-trees
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241029/202410291006.bBVwT6nu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291006.bBVwT6nu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291006.bBVwT6nu-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/dynamic_debug.c: In function 'ddebug_mt_scan':
>> lib/dynamic_debug.c:94:9: error: implicit declaration of function 'mt_dump'; did you mean 'xa_dump'? [-Werror=implicit-function-declaration]
      94 |         mt_dump(mt, mt_dump_hex);
         |         ^~~~~~~
         |         xa_dump
   lib/dynamic_debug.c:94:21: error: 'mt_dump_hex' undeclared (first use in this function)
      94 |         mt_dump(mt, mt_dump_hex);
         |                     ^~~~~~~~~~~
   lib/dynamic_debug.c:94:21: note: each undeclared identifier is reported only once for each function it appears in
   lib/dynamic_debug.c: In function 'ddebug_condense_sites':
   lib/dynamic_debug.c:1434:38: error: incompatible types when assigning to type 'struct _ddebug *' from type 'struct _ddebug_descs'
    1434 |         cur = funcp = filep = modp = di->descs;
         |                                      ^~
   lib/dynamic_debug.c:1435:27: error: 'struct _ddebug_info' has no member named 'num_descs'
    1435 |         for (i = 0; i < di->num_descs; i++, cur++) {
         |                           ^~
   cc1: some warnings being treated as errors


vim +94 lib/dynamic_debug.c

    90	
    91	static void ddebug_mt_scan(struct maple_tree *mt, const char *kind)
    92	{
    93		pr_info("mt-%s:\n", kind);
  > 94		mt_dump(mt, mt_dump_hex);
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
