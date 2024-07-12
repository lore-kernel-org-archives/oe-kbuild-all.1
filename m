Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F83113D502
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 06:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720765712; cv=none; b=Exwihwv1ZnxYBIiQeV63jIvh8tMacpBm8cemWeIGkjGRBIT0nYIx5ksEUoNTrSRFkGm63vdcGewsjJHSnBF60mpzUq268onfEhGom0eEUeS2nOm5e3acPkJv2cnW5aZ6gZ25kEfssBQjuRIFyUqvz7yUTRI3xzKokTorgoB8PpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720765712; c=relaxed/simple;
	bh=MUcOyJsudZLGTgBP988DnazpviWuzG5Kw1tAmSwmzFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TZiU49dpjx4IqSFfX3tTiIHduE+kG/z+KyireMqRZUQKkGSQ2dF9gTk9cpN1bET8DuMKe0ZaKSNBZakacbeGiv775YZ4XBDIBnq2YKjMTBzGNu0r3Qo+nzb4dvPqrJsmOCF8H4nR3uZNiBPZznGAxz4RxxNukj4ezw+ts+TP5FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOVtEo30; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOVtEo30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720765710; x=1752301710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MUcOyJsudZLGTgBP988DnazpviWuzG5Kw1tAmSwmzFQ=;
  b=TOVtEo30zrzXyJjeFxeOgfkScILJVzNRdkio1xStj9GO5NMPhpt1oN+I
   M77BN4zHHy5Iin5WPK2Vzar3r5T+XVa4gM4CsHdqxbaDlqxuQeJbgXBCf
   tkhhPGMbmxH6ytTDuXh7AXqTIuU0waL1OctlztcpaJDe6W06YZNEUHQ2h
   GXBNJKfovB+lm9KbygCe5+KjTO0at+Wc0DDYrcJ6cV+MrpIXETsFbGhGO
   T509BtVxmI8f0Gdle9oa+USHFg57l8yMr54JOg9o55KkV6azuD0FSy10U
   f4u6l+gIIYjisjIla27WzBnr+Fd8a5ql4zbXDFRtwE3rbQAydo/2/9RoR
   Q==;
X-CSE-ConnectionGUID: e9zI+DWKSSSdLzREEz+bdw==
X-CSE-MsgGUID: /aYLZuOoS2CyX+78OP2uoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18034976"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="18034976"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 23:28:11 -0700
X-CSE-ConnectionGUID: a3yuIcjKQ0uhiU+21xTQqQ==
X-CSE-MsgGUID: jad8xzTORN+0DKMkc/Tk6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="48721613"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 11 Jul 2024 23:28:10 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS9lI-000aQs-1K;
	Fri, 12 Jul 2024 06:28:08 +0000
Date: Fri, 12 Jul 2024 14:27:23 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 1/4] mm/page_counter.c:428:37: error: use
 of undeclared identifier 'MCT_MEM'
Message-ID: <202407121412.92eOyzLq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git page_counters.2
head:   571d579e86f7cf22a1eb87727e098ba67eced2f3
commit: f007ecfdec69e8f8241e261cff63049b14281c02 [1/4] mm: memcg: merge multiple page_counters into a single structure
config: i386-buildonly-randconfig-006-20240712 (https://download.01.org/0day-ci/archive/20240712/202407121412.92eOyzLq-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121412.92eOyzLq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121412.92eOyzLq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_counter.c:428:37: error: use of undeclared identifier 'MCT_MEM'
     428 |         usage = page_counter_read(counter, MCT_MEM);
         |                                            ^
   mm/page_counter.c:433:17: error: use of undeclared identifier 'MCT_MEM'
     433 |                 counter->emin[MCT_MEM] = READ_ONCE(counter->min[MCT_MEM]);
         |                               ^
   mm/page_counter.c:433:51: error: use of undeclared identifier 'MCT_MEM'
     433 |                 counter->emin[MCT_MEM] = READ_ONCE(counter->min[MCT_MEM]);
         |                                                                 ^
   mm/page_counter.c:433:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:433:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:433:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:433:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:433:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:433:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:434:17: error: use of undeclared identifier 'MCT_MEM'
     434 |                 counter->elow[MCT_MEM] = READ_ONCE(counter->low[MCT_MEM]);
         |                               ^
   mm/page_counter.c:434:51: error: use of undeclared identifier 'MCT_MEM'
     434 |                 counter->elow[MCT_MEM] = READ_ONCE(counter->low[MCT_MEM]);
         |                                                                 ^
   mm/page_counter.c:434:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:434:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:434:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:434:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:434:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:434:51: error: use of undeclared identifier 'MCT_MEM'
   mm/page_counter.c:438:43: error: use of undeclared identifier 'MCT_MEM'
     438 |         parent_usage = page_counter_read(parent, MCT_MEM);
         |                                                  ^
   mm/page_counter.c:440:27: error: use of undeclared identifier 'MCT_MEM'
     440 |         WRITE_ONCE(counter->emin[MCT_MEM],
         |                                  ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.


vim +/MCT_MEM +428 mm/page_counter.c

   398	
   399	
   400	/**
   401	 * page_counter_calculate_protection - check if memory consumption is in the normal range
   402	 * @root: the top ancestor of the sub-tree being checked
   403	 * @memcg: the memory cgroup to check
   404	 * @recursive_protection: Whether to use memory_recursiveprot behavior.
   405	 *
   406	 * Calculates elow/emin thresholds for given page_counter.
   407	 *
   408	 * WARNING: This function is not stateless! It can only be used as part
   409	 *          of a top-down tree iteration, not for isolated queries.
   410	 */
   411	void page_counter_calculate_protection(struct page_counter *root,
   412					       struct page_counter *counter,
   413					       bool recursive_protection)
   414	{
   415		unsigned long usage, parent_usage;
   416		struct page_counter *parent = counter->parent;
   417	
   418		/*
   419		 * Effective values of the reclaim targets are ignored so they
   420		 * can be stale. Have a look at mem_cgroup_protection for more
   421		 * details.
   422		 * TODO: calculation should be more robust so that we do not need
   423		 * that special casing.
   424		 */
   425		if (root == counter)
   426			return;
   427	
 > 428		usage = page_counter_read(counter, MCT_MEM);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
