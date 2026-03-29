Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A18327442
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Mar 2026 04:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774759048; cv=none; b=OkY/vc73EkOMFw1XbW3o7eq8V5XRUDCklxS9XYd7qje6LlhMn0z1AVGKnbaywOp7YfcFZlOD5Jworn7rxOcpu4++1+LA3NxoZiaEIpjfTd2nfaZCNXvOhowc5fOJmZuPt9jN1FJWjgdbLLcmqLUVLdivrOLlC7S2N407eRd0yxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774759048; c=relaxed/simple;
	bh=hHLN7Ja3LQZLQWTHsYWN1jUeyvTU6JdbUM3DC4qpivw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YbIqu6SCWw7eJvNHQH3X/9YfMbv/ZhkV6vHNx4VpvEkBGy18WCSA1Zg/ORRxgcPNFVqe/BCK6ZAHOSGgALOJMRO+gdEPgJhJyZVK84swS0Wvmblp2FHplojdQEHR+MTiwQMFo2Ap7PiYITArKtSTJLO7WAXJjl+6FPEd4nK7jF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yl5nXThm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yl5nXThm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774759046; x=1806295046;
  h=date:from:to:cc:subject:message-id;
  bh=hHLN7Ja3LQZLQWTHsYWN1jUeyvTU6JdbUM3DC4qpivw=;
  b=Yl5nXThmLjPb7Gc0QMrNy1o7JEWJSCTQf2wsiMVTvGCJyLZowi7yE2oU
   YINYUGPL6iNlQjFjeb7Qk49tNbsyjm39D/EX+IMbR+dLGh74tSKA7oZ98
   BEJZYFRre2dT+neecNpjnnH4HuOSfwdALc9+wQ9xzqM24QRPHeSBcvk+x
   1FtztLkumLimUd3mBB2Aa4h3HzP+Kl+wtDiIVhAOjT2bqBiqUlntW2101
   jQk0oL3uH78eMLT5Tz+p46AbT+QB43rzw/bThAxP0EbaIWaNQ8BVp8xEh
   sev6qJpV/xUEKetBCNpK0YMQ8uY3q9LW8lpwmF7lPaqQGN61SGFxwYONo
   A==;
X-CSE-ConnectionGUID: nrKoeMB/Q7a7ktRSe/M5yg==
X-CSE-MsgGUID: YErjmTORSDecyaAlGSftCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79646720"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="79646720"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 21:37:25 -0700
X-CSE-ConnectionGUID: IwQuR/VvRLqziO7tz9LFkw==
X-CSE-MsgGUID: verF6TuPTMaYnXjUyKIDlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="263650748"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Mar 2026 21:37:24 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6htp-00000000C4r-0LWi;
	Sun, 29 Mar 2026 04:37:21 +0000
Date: Sun, 29 Mar 2026 12:36:27 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Ge <hao.ge@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 193/194] lib/alloc_tag.c:815:25: sparse:
 sparse: cast removes address space '__rcu' of expression
Message-ID: <202603291211.YhY0R0se-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   df2267b6380964f1305128001f05bc043ddf1f37
commit: 8bee7b4b574f880ff2c7491212e2ef01cd82f2fd [193/194] mm/alloc_tag: clear codetag for pages allocated before page_ext initialization
config: openrisc-randconfig-r121-20260329 (https://download.01.org/0day-ci/archive/20260329/202603291211.YhY0R0se-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260329/202603291211.YhY0R0se-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603291211.YhY0R0se-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/alloc_tag.c:815:25: sparse: sparse: cast removes address space '__rcu' of expression
>> lib/alloc_tag.c:815:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   lib/alloc_tag.c:815:25: sparse:    void ( [noderef] __rcu * )( ... )
   lib/alloc_tag.c:815:25: sparse:    void ( * )( ... )
   lib/alloc_tag.c:828:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   lib/alloc_tag.c:828:9: sparse:    void ( [noderef] __rcu * )( ... )
   lib/alloc_tag.c:828:9: sparse:    void ( * )( ... )

vim +/__rcu +815 lib/alloc_tag.c

   802	
   803	typedef void (*alloc_tag_add_func)(unsigned long pfn);
   804	static alloc_tag_add_func __rcu alloc_tag_add_early_pfn_ptr __refdata =
   805			__alloc_tag_add_early_pfn;
   806	
   807	void alloc_tag_add_early_pfn(unsigned long pfn)
   808	{
   809		alloc_tag_add_func alloc_tag_add;
   810	
   811		if (static_key_enabled(&mem_profiling_compressed))
   812			return;
   813	
   814		rcu_read_lock();
 > 815		alloc_tag_add = rcu_dereference(alloc_tag_add_early_pfn_ptr);
   816		if (alloc_tag_add)
   817			alloc_tag_add(pfn);
   818		rcu_read_unlock();
   819	}
   820	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
