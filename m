Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCB18654
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jul 2024 05:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720762330; cv=none; b=btpowvoXrXmRN3HovRBmJgdnzwTYAxMUPWZ4yBbuzwUYBV6Juf1Ub7rpxTfDimWEN2GEh9mWG0zNAs79eI8DsS2kGbYb89gBZ2rch2F3nsMeHBSOyU2boFcXzMXGXYS61sEODBLzt103mkvKY8OP10LaBaT1DRmfKeCGzlDSZys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720762330; c=relaxed/simple;
	bh=o/GZtIpql5AkqtKAsUGUBoHUME9+u1yJNDfMsayr2Y0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GiXgGKevz2Tvycx6g+sXsznqCUxabzZd2oWXVX/Q5dWmoRx6z3LBUjSLJFnWb+EH5KZPvrkrblSnxCsU0WL+0FmYDz3R7yiIf4yk9jOwycqIDvB1CwzLq0dcCZWsYzCnnK/32XrkRvcppdPErVxDWHu3rd1olP2jsbPGDfs1lME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSDwtwcC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSDwtwcC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720762328; x=1752298328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o/GZtIpql5AkqtKAsUGUBoHUME9+u1yJNDfMsayr2Y0=;
  b=LSDwtwcClb5THkJ10WdZWe4P04XdYcUXmlGcd5isSqALVuQ0HEaRN42J
   XyZ/Xwzeiu8LQ1tMYSLZHvMmXRuieYR2W1JG0g9UHaA2azfhVvEkT/+3f
   +VvozhfqxDzzLDYTB0q8R2ZVsY7hcBemHE+ZuW/4up01s2aTqtaFJE7Qb
   NHzGupykguPW8MpxsnIdQSrgPwaQGvzABDxNW10tRB+SsikzCDXoN018s
   yOxc2z72cOUfqrxXOx3PiojhOYCJumGqThIHFfymaxajRnmEdNTaezToJ
   1fNrbkX+aeASdE9Jnks65v/EjyDL2hh9MD0ddDc3m63DvCNUXiJoZ6Cg8
   Q==;
X-CSE-ConnectionGUID: KvGsqVEbSjGf98vwIL1Olw==
X-CSE-MsgGUID: thV3dADYSy+qtdZHPLafvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="18053450"
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="18053450"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 22:32:07 -0700
X-CSE-ConnectionGUID: WJQRR6S1SjOGXW7QbOL3dw==
X-CSE-MsgGUID: 2dsNbNPdT3izgEUZ3Hwikw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,202,1716274800"; 
   d="scan'208";a="53992123"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Jul 2024 22:32:07 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS8t2-000aMm-0S;
	Fri, 12 Jul 2024 05:32:04 +0000
Date: Fri, 12 Jul 2024 13:31:35 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:page_counters.2 1/4] mm/page_counter.c:428:44: error:
 'MCT_MEM' undeclared
Message-ID: <202407121317.67vJzrWz-lkp@intel.com>
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
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240712/202407121317.67vJzrWz-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407121317.67vJzrWz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407121317.67vJzrWz-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_counter.c: In function 'page_counter_calculate_protection':
>> mm/page_counter.c:428:44: error: 'MCT_MEM' undeclared (first use in this function)
     428 |         usage = page_counter_read(counter, MCT_MEM);
         |                                            ^~~~~~~
   mm/page_counter.c:428:44: note: each undeclared identifier is reported only once for each function it appears in


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
