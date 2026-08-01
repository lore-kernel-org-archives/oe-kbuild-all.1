Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021762F6931
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 00:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785543079; cv=none; b=g2PqPzbnlaNQG6J3TyTHzNTYr1QlVcUUVpM31J62vf8NBlVz7/R4PEKjp9f8mYCfsFwUni6qc5dL6TjlTFIL0S8ANivF447uEAtYS+QAuZFpgJg6pQhXXshGP0bMHtGnf00Lt66O5Z316je7vbwbsqOuFoCbNXqeosKU0IKXw8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785543079; c=relaxed/simple;
	bh=GaVlaU01il2Y77Meofy7t3/Sw5BKy3hwzcNeEQvZ46Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u0uCkPmC8B5T59uDJECo2N94fwcD05afDi0zvtUKwq96MIKnC+A5oWprUc1aWuVDAf5PRrxGrfAHnZyr4M14kj3fkuupJAOGSbWO83QRkFG7lFoepqTYMelhqeayrD0LiEUi8UKVFw730rnSLs95adiiB2R06LtNL0y1RUMpQ0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KDwhOF2K; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KDwhOF2K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785543075; x=1817079075;
  h=date:from:to:cc:subject:message-id;
  bh=GaVlaU01il2Y77Meofy7t3/Sw5BKy3hwzcNeEQvZ46Q=;
  b=KDwhOF2KtYWHVPC8SVpGc4sib2IgoBoZbjm9RwKYxJPlFn7uC/q4zfkU
   //9sgdbk0yeupJMubLtXzOLteg6vA9IqpoyzZm6rSDfAztl7XkPdX+TiE
   bjmK79bCe/2nFYeGbT/+ZaiK63ZwsyKHXbJw8fYnsWJ+D0bfprPHsCXxR
   Nsa3SfxKB6qqNG2MKB4T3DBCUW56aQEBIjKA0YrX25dP23xTFbTd3M1m2
   iuGejwX/yeINmSwcrx1u5MMzABjhtDmX1m2UHM/zL7EleckSyEtleaHyX
   bSGPZKcoM3n+tQzPtxU5ljCgk/31HYRGBDNST3UPX0Z2pO9v1nOYYOsOU
   Q==;
X-CSE-ConnectionGUID: TdkwBWgaQH2mqfAR+NriRA==
X-CSE-MsgGUID: Ec0Oi8VLSZewVRqu91qfnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="103579023"
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="103579023"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 17:11:14 -0700
X-CSE-ConnectionGUID: Gc1BNnQCQfeafq4Pj6E6Dg==
X-CSE-MsgGUID: Qv/NasqUSpS1jjmS7bQl5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,197,1779174000"; 
   d="scan'208";a="260122756"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 31 Jul 2026 17:11:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpxJm-000000002S3-3zp1;
	Sat, 01 Aug 2026 00:11:10 +0000
Date: Sat, 01 Aug 2026 08:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/trace/ring_buffer.c:412:29-47: WARNING: casting value
 returned by memory allocation function to (struct buffer_page *) is useless.
Message-ID: <202608010824.vc7vATf0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: b1e7a590a0133606d3efd41aee38cdeac630b52f ring-buffer: Add helper functions for allocations
date:   8 months ago
config: openrisc-randconfig-r062-20260801 (https://download.01.org/0day-ci/archive/20260801/202608010824.vc7vATf0-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b1e7a590a013 ("ring-buffer: Add helper functions for allocations")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608010824.vc7vATf0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/ring_buffer.c:412:29-47: WARNING: casting value returned by memory allocation function to (struct buffer_page *) is useless.
>> kernel/trace/ring_buffer.c:408:31-57: WARNING: casting value returned by memory allocation function to (struct ring_buffer_per_cpu *) is useless.

vim +412 kernel/trace/ring_buffer.c

   403	
   404	/*
   405	 * For best performance, allocate cpu buffer data cache line sized
   406	 * and per CPU.
   407	 */
 > 408	#define alloc_cpu_buffer(cpu) (struct ring_buffer_per_cpu *)		\
   409		kzalloc_node(ALIGN(sizeof(struct ring_buffer_per_cpu),		\
   410				   cache_line_size()), GFP_KERNEL, cpu_to_node(cpu));
   411	
 > 412	#define alloc_cpu_page(cpu) (struct buffer_page *)			\
   413		kzalloc_node(ALIGN(sizeof(struct buffer_page),			\
   414				   cache_line_size()), GFP_KERNEL, cpu_to_node(cpu));
   415	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
