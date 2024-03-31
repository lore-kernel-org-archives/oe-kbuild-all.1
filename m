Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D781C33
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 09:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711878085; cv=none; b=KeuMqiqQUztHUnFtdmAsu6TJtvQ03fg1A+bblnpn91UwI3mP9JD4Z97jgo2g8rjCPGMpvwuBbRmYjvTA8oWDGgTzHDFs536ITwR51b39GsjsN1cqod91Cg8cKXGYODjGwuRjo4eZjHlLBXHDI9ZCBLcPqXFDKLDouXkA4WHdQzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711878085; c=relaxed/simple;
	bh=nbcApOTxWLduu1ItfwCZRkPFWArulSSd5n4W2NCwrWc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LhINZBS+FdZ1M4DD6KwDpu/h6a4sk4uImU+zlTkjJkUjiNPf5vhpzw5pKlI7J92BcKBEDbRQaOe3Nuj9e72uC/5MF9xcN0Q+SavOTlf3B/vEG0HMaDcZjpZJ4Tqd2C3qFezLlALPnwuhnfBaM4EZIGzZpwm869UvoF4tcDMw7TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzGFyJ65; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzGFyJ65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711878084; x=1743414084;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nbcApOTxWLduu1ItfwCZRkPFWArulSSd5n4W2NCwrWc=;
  b=fzGFyJ651L0wnyqYINqM5uG85+ucn9nLkiMH36213g358lKhUbiypu8j
   Y6mqI0E9lY+nz/Kb1/KQvoAte2k7SYAS90N/gUWM4nB/jR6htokPv4avY
   Iq9Ljxlrjnj/C/QuSumgtg4NPcNTTypgZNMJeYItf7kvvRZHgtliKZeFK
   tQ4zpUiiarW+D7AIGS19g8qw4urFMf77hVw8an8+Gd0HarHFH1OgNMWQW
   hRy9xw4y/erJD8ScicY8y582iMceeixM+0Lb8NGgIs/jmvNvzZEVrLsbk
   CUVTvslZhnSW20Lex3u/7SeHlZGtno7IsLm3iUnx7qisR1TmDO9Z2NG5j
   g==;
X-CSE-ConnectionGUID: NbTYWlReTQuXXbpaC56Qjw==
X-CSE-MsgGUID: 3io2LxYASXmMCGHBAAQSrQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="17579301"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="17579301"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 02:41:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="22112045"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 31 Mar 2024 02:41:22 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqrgl-0000zw-2k;
	Sun, 31 Mar 2024 09:41:19 +0000
Date: Sun, 31 Mar 2024 17:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Ho-Ren (Jack) Chuang" <horenchuang@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Huang, Ying" <ying.huang@intel.com>
Subject: [akpm-mm:mm-unstable 262/270] include/linux/memory-tiers.h:143:25:
 warning: no previous prototype for 'mt_find_alloc_memory_type'
Message-ID: <202403311756.GDcbqLdZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   0cef2c0a2a356137b170c3cb46cb9c1dd2ca3e6b
commit: 57fc2afac84efdb0968e028382023a937bb4d6a0 [262/270] memory tier: dax/kmem: introduce an abstract layer for finding, allocating, and putting memory types
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240331/202403311756.GDcbqLdZ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240331/202403311756.GDcbqLdZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403311756.GDcbqLdZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:43:
>> include/linux/memory-tiers.h:143:25: warning: no previous prototype for 'mt_find_alloc_memory_type' [-Wmissing-prototypes]
     143 | struct memory_dev_type *mt_find_alloc_memory_type(int adist, struct list_head *memory_types)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/memory-tiers.h:148:6: warning: no previous prototype for 'mt_put_memory_types' [-Wmissing-prototypes]
     148 | void mt_put_memory_types(struct list_head *memory_types)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/mt_find_alloc_memory_type +143 include/linux/memory-tiers.h

   142	
 > 143	struct memory_dev_type *mt_find_alloc_memory_type(int adist, struct list_head *memory_types)
   144	{
   145		return NULL;
   146	}
   147	
 > 148	void mt_put_memory_types(struct list_head *memory_types)
   149	{
   150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
