Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E982076DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 21:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730236834; cv=none; b=MwzZN4tzTQWVEz0Ix8AnjKigkQGXBTRRKW7sAOPrndPUsIU094QeGWnOR/vdKKo7VLN3Etnd2XwcLsaLaSR97vO3soeXePY/VX5PQZHbV5OCkztTF52a83g5QvcxSndjPPdQuKQVmxyXWQuXrWQVelkjB7SNYOcX4xXpYHlfzWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730236834; c=relaxed/simple;
	bh=xmq0G0NPZnmPLwm9hf7NzZqx3+QhW6WFXh/oqgG2jiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEIeNcTRcE+zkLmhlNMDBcessaKnfOcvt8sZTrsV0UxkqmQyKCu+2bpfAKFJ5hS/1ZlifHMAMqrquwg9e0g/QazPfb1f5ldE2QzhwKZqfftYB/QjYYPH08YqMN5ftSCzLP2AQDVVYCFPw54JHLt/PESFx/lYEizv7IVypMGfgpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ea8oyPqq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ea8oyPqq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730236832; x=1761772832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmq0G0NPZnmPLwm9hf7NzZqx3+QhW6WFXh/oqgG2jiE=;
  b=Ea8oyPqqG+ES3c5Y4pqr80TNDdRd8BVbF2GLSxHgerfUj6gEq3kkhfrn
   MyuiLUBbQkH8cj7/ogSCcyIFLKabfQg+rNClOjwwW3xnDjsXlwMIwkraT
   QrapcoAXDwxXHv62iZOWBKYN9pMDtTp2+FfhlKwZ+OVAIuEtQo3jkfqPA
   1b+jb9CDCyz4hYdweudDuO81IDy4Kfho2NEY59H4lVqWxWaBV90jXyjBP
   CifvGWmG5h1brwciSLFYyjjKb8hTZmgSK19yv4EFgqN/i52/+uupClsXx
   csSRC7X2tf8KHKvB0Lpn3BttXTIOXzMvc/EPOPz+HQbEVBcbz4//Q+2zc
   w==;
X-CSE-ConnectionGUID: FCTCLVVwSWOcxQ42eeUDXw==
X-CSE-MsgGUID: aeXP1N3iTL29+kEQpV4SCg==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="17547292"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="17547292"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 14:20:31 -0700
X-CSE-ConnectionGUID: bnUTD2pnTw+RYTtz5vKixg==
X-CSE-MsgGUID: WVHZsTaKQvOagpwnFJsmfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="86705172"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Oct 2024 14:20:30 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5tdb-000eAG-2o;
	Tue, 29 Oct 2024 21:20:27 +0000
Date: Wed, 30 Oct 2024 05:19:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4d 73/82] lib/dynamic_debug.c:94:2: error: call to
 undeclared function 'mt_dump'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202410300522.Gk7rkYKK-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-001-20241030 (https://download.01.org/0day-ci/archive/20241030/202410300522.Gk7rkYKK-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300522.Gk7rkYKK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300522.Gk7rkYKK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from lib/dynamic_debug.c:19:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2232:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> lib/dynamic_debug.c:94:2: error: call to undeclared function 'mt_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         mt_dump(mt, mt_dump_hex);
         |         ^
   lib/dynamic_debug.c:94:2: note: did you mean 'xa_dump'?
   include/linux/xarray.h:1180:6: note: 'xa_dump' declared here
    1180 | void xa_dump(const struct xarray *);
         |      ^
   lib/dynamic_debug.c:94:14: error: use of undeclared identifier 'mt_dump_hex'
      94 |         mt_dump(mt, mt_dump_hex);
         |                     ^
   lib/dynamic_debug.c:1434:29: error: assigning to 'struct _ddebug *' from incompatible type 'struct _ddebug_descs'
    1434 |         cur = funcp = filep = modp = di->descs;
         |                                    ^ ~~~~~~~~~
   lib/dynamic_debug.c:1435:22: error: no member named 'num_descs' in 'struct _ddebug_info'
    1435 |         for (i = 0; i < di->num_descs; i++, cur++) {
         |                         ~~  ^
   3 warnings and 4 errors generated.


vim +/mt_dump +94 lib/dynamic_debug.c

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
