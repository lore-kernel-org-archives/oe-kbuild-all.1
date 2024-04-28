Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2A265C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 02:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714271946; cv=none; b=UobuUDmI3PO0TvLAVsKQlaiPrsrT13kz3uGgdAFtba81cD7PZwnEGDxvNL9I2k4YEE5DorY01XvEHYB5m0xeUy2rNHasGudjEE505pbJxaGB6QhRMBSwKWfOX2qQxOmmX0FbXjI/7Hhrj89rANNdqX3DMq9tYWe4EhjLxReD7yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714271946; c=relaxed/simple;
	bh=SpYQ+O8uF9UBPSg2lFf7N3fs0ladHVL/UL1ynmD+W3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jAAXZjxk0t71U8OCcWL40Pm3P0M5zYl5dl7l1iySFme+nAnFptFUv5HaTU+KNI7dukX3lv1al1y0T7HUaphmz3eBPO/bSFsLGRW+/gctGDhq+COENve3XowVykRklF66ofEs3hxbeVygfLJsDH6MeJGwuendtjBPhL5Fg+PYRAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TtEgLU8Q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TtEgLU8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714271945; x=1745807945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpYQ+O8uF9UBPSg2lFf7N3fs0ladHVL/UL1ynmD+W3Q=;
  b=TtEgLU8QU29AmyEtHodbd35p2ft24HTziP5r5KDXolx1hcSAlygiC8je
   eYhYS0rzkp7wkZfj0dZHU0WxPaKZj5RDs0mlQwSqkJ4DeBW/fu7PHpizS
   oXdmkhsGLlwpE6YyyAsx/888QuScNAI4tBeOJh2j+dYSozse+yR3P4upt
   9sp77crEUIAI4cLYEUgATvQZSlq6/yRcT5OM1ubnYllp+CPRAZWDRoTeN
   M9xuwUMQgPtfUi8pZc20eN/02qh2jP49wcvCh/DzO6rM6Hj33wY1MntiJ
   xvE+9VqVjT09u/qw0/4D+evF6uNcUQM01Bzbtr3XBkUfj/xK11NvI+CaG
   w==;
X-CSE-ConnectionGUID: jTPP4sblT3+goLpwWnxDNQ==
X-CSE-MsgGUID: D5kDoAZzS1md45VfkmqesQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10182254"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10182254"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 19:39:04 -0700
X-CSE-ConnectionGUID: MXUQXZPHTqWeoHPzlsG3Zw==
X-CSE-MsgGUID: O4/wT3V5SHOOtwSmgaaNKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="30596769"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Apr 2024 19:39:03 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0uRQ-0005li-2X;
	Sun, 28 Apr 2024 02:39:00 +0000
Date: Sun, 28 Apr 2024 10:38:37 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3 12/14]
 include/linux/page_frag_cache.h:158:24: error: implicit declaration of
 function 'virt_to_page'; did you mean 'pfn_to_page'?
Message-ID: <202404281044.3kwXWqzm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   d4839424731dee0af1ba520ac3b177893e765399
commit: 72fcea0d811a05d5e8983f14fd6154f792054e7e [12/14] mm: page_frag: introduce prepare/probe/commit API
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404281044.3kwXWqzm-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404281044.3kwXWqzm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404281044.3kwXWqzm-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/page_frag_test.c:18:
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_pg_prepare':
>> include/linux/page_frag_cache.h:158:24: error: implicit declaration of function 'virt_to_page'; did you mean 'pfn_to_page'? [-Werror=implicit-function-declaration]
     158 |                 page = virt_to_page(va);
         |                        ^~~~~~~~~~~~
         |                        pfn_to_page
>> include/linux/page_frag_cache.h:158:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     158 |                 page = virt_to_page(va);
         |                      ^
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_prepare':
   include/linux/page_frag_cache.h:187:22: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     187 |                 page = virt_to_page(*va);
         |                      ^
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_probe':
   include/linux/page_frag_cache.h:210:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     210 |         page = virt_to_page(*va);
         |              ^
   cc1: some warnings being treated as errors


vim +158 include/linux/page_frag_cache.h

   136	
   137	static inline struct page *page_frag_alloc_pg_prepare(struct page_frag_cache *nc,
   138							      unsigned int *offset,
   139							      unsigned int *fragsz,
   140							      gfp_t gfp)
   141	{
   142		struct page *page;
   143		unsigned int size;
   144		void *va;
   145	
   146		size = nc->size;
   147		if (unlikely(*fragsz > size)) {
   148			if (WARN_ON_ONCE(*fragsz > PAGE_SIZE)) {
   149				*fragsz = 0;
   150				return NULL;
   151			}
   152	
   153			page = __page_frag_cache_refill(nc, gfp);
   154			size = nc->size;
   155			va = nc->va;
   156		} else {
   157			va = nc->va;
 > 158			page = virt_to_page(va);
   159		}
   160	
   161		*offset = page_frag_cache_page_offset(va, size);
   162		*fragsz = size;
   163	
   164		return page;
   165	}
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
