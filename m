Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D023720A5FE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 22:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730240557; cv=none; b=R6xfvQHthW3DeZ/MPX11v1BptumLyWP/zbfP/hUwx3oOpogSELPc5TsyF7KGb8HHRoaWaK6hHSOHCJrIuE8B4+2l3fcCfmBvDkuES16tsVtfZ7HU6jm/mpJJjA3XSHtnoJBeoww3mw8y/WTnWl746P23MkDM2+Z+SYX4RzbDB5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730240557; c=relaxed/simple;
	bh=Gg/2Sko08gd7Ud+U2RAaNNEn/2i16BaBn++YRTp5pWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p4xJOYlN/epH69n7oaeBmPbgpnXqW6LRSRTClsjJiNzSoKpncZ0uCbtDKdrWpxwObIsIyv7PbZJ8a5368ef2FUmGMXW+tMdP/wG0bs4OoSDBcio4STRuoVrcdlKXBUoY85T5MEy5ZXB59C2LWDUB9dSSnhD9rKCoQMKtxHinKJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JPQlpm5X; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JPQlpm5X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730240555; x=1761776555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gg/2Sko08gd7Ud+U2RAaNNEn/2i16BaBn++YRTp5pWc=;
  b=JPQlpm5XEgEZWTk4J01za//ILugYLrLCZuyQL+Cglq/reSO6roKA/Fhu
   Ob+9AvzQFj/mnv4+S13NJICTFvs06w7zLzPRDmn7bpu3080WwAWQQLnVM
   zQ98Io0o4T/eWXEb4rlAL2Q8N0NebiHHVrYieoZWDMQSX5T4z/9LlLKby
   3o9U3nRZA4HbZkH+D0YcWlhF2ta0gQ4p8faHFZp2zzFg+mcIRfKBX6zE/
   opXfOls0oSd9pdJkNp4GEU2Yc20qymColGGUwrmDa1HFaJHtS/1iWCJYa
   30jBWgwbkORrjo7ki/Am+CO/OE7YsjpNJyQUNGY4kEtt4JJZFUTZwYqXY
   Q==;
X-CSE-ConnectionGUID: DedZMDMZRaShEwo8CK5jtg==
X-CSE-MsgGUID: dciBNy3mSECyInvpLrHvIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="55317449"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="55317449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 15:22:34 -0700
X-CSE-ConnectionGUID: n8HAonwHQbO5Ysz1i82PJg==
X-CSE-MsgGUID: 6agOOz3PRraxPZWtRpyLsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82256676"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2024 15:22:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ube-000eDq-1q;
	Tue, 29 Oct 2024 22:22:30 +0000
Date: Wed, 30 Oct 2024 06:21:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:dd-shrink-4d 82/82] lib/dynamic_debug.c:94:14: error: use of
 undeclared identifier 'mt_dump_str'
Message-ID: <202410300632.iXERZBh8-lkp@intel.com>
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
commit: 98a15f4b1948cdaabac1f0fc008c79870c4d4672 [82/82] mt-dump-str
config: x86_64-buildonly-randconfig-001-20241030 (https://download.01.org/0day-ci/archive/20241030/202410300632.iXERZBh8-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300632.iXERZBh8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300632.iXERZBh8-lkp@intel.com/

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
   lib/dynamic_debug.c:94:2: error: call to undeclared function 'mt_dump'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      94 |         mt_dump(mt, mt_dump_str);
         |         ^
   lib/dynamic_debug.c:94:2: note: did you mean 'xa_dump'?
   include/linux/xarray.h:1180:6: note: 'xa_dump' declared here
    1180 | void xa_dump(const struct xarray *);
         |      ^
>> lib/dynamic_debug.c:94:14: error: use of undeclared identifier 'mt_dump_str'
      94 |         mt_dump(mt, mt_dump_str);
         |                     ^
   3 warnings and 2 errors generated.


vim +/mt_dump_str +94 lib/dynamic_debug.c

    90	
    91	static void ddebug_mt_scan(struct maple_tree *mt, const char *kind)
    92	{
    93		pr_info("mt-%s:\n", kind);
  > 94		mt_dump(mt, mt_dump_str);
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
