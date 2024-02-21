Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEEA42A8B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Feb 2024 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708539340; cv=none; b=IV8qXJoZx59FOMuHkRaHlP8zpzglqKSZnUZGsXKTDU4O0ZjcNdJwk+HGFS0/T46FSfq7KOGQZDlA2sfXa4DAAgL44kXhe+0MfHBOi03chwViIGuUHb7gMxG6GeQtUyh6X0oyPMa+jUYAfZ2+iSDhUjwEhE6wd+8O/4XCxnzjXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708539340; c=relaxed/simple;
	bh=qsuJQtewVBCrLrF45fUlkmjjeAZsf21MPfZee7UNW1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ssn5SpBjvaFEz5nRjAuvIJE0rFUVxyStoOWez8TBeBFV0U5gqBTk1ZX27Hd54jUHIjyoyeUqy404A/b1fIwy2fOlRp8/wNZ64Nvw5OGpqNH9C3O/9ipmloSn6Sp/+gVb8CRkYgG0ZjDVH/ez7wUOLVhUXfJsAcDPXkBsI7S8nQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1et7OZv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1et7OZv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708539339; x=1740075339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsuJQtewVBCrLrF45fUlkmjjeAZsf21MPfZee7UNW1o=;
  b=a1et7OZvSu4+wiL8zXfdVzbAozF+mWxm2lIzmVxnD/BX80r+UP2mXSYg
   7Tm7VTVQqnZXeVvovYOZ/P6O3FgNPqDrzUAA9zE0Klv/0wpn3cv7MhZjk
   eZGyYgQT5XTxrQz4wtcAN7ydPRVrxhvkvT/Jv/z3VRFDZlS5Wmebzrza8
   gtGjp6i3Wze75WlQXAx7Y2coyL4Ry/wWxyNsVih9p9jsR/U/tiMidA4Ta
   0/vqJ2yLzd3is0V7qmD3IEtFM+GPGjZp6HdP7DsWLdazxcmsJshSD5t6e
   Ly9W0c1iC0b1eBU9Wm430xqLKUhk2WU3cLeVwmIkPGEKmSl063YVpQTtc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="2583547"
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="2583547"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 10:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,176,1705392000"; 
   d="scan'208";a="5576214"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 21 Feb 2024 10:15:35 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcr7v-0005a0-1a;
	Wed, 21 Feb 2024 18:15:29 +0000
Date: Thu, 22 Feb 2024 02:14:36 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/memcontrol.c:4865:23: error: implicit declaration of function
 'mem_cgroup_nr_lru_pages'; did you mean 'memcg_nr_lru_pages'?
Message-ID: <202402220242.P4WDOp6S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.
date:   2 years, 11 months ago
config: x86_64-buildonly-randconfig-003-20240221 (https://download.01.org/0day-ci/archive/20240222/202402220242.P4WDOp6S-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402220242.P4WDOp6S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402220242.P4WDOp6S-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/page_counter.h:6,
                    from mm/memcontrol.c:25:
   mm/memcontrol.c: In function 'mem_cgroup_get_max':
   include/linux/kernel.h:875:45: warning: comparison of unsigned expression in '< 0' is always false [-Wtype-limits]
     875 | #define min(x, y)       __careful_cmp(x, y, <)
         |                                             ^
   include/linux/kernel.h:858:30: note: in definition of macro '__cmp'
     858 | #define __cmp(x, y, op) ((x) op (y) ? (x) : (y))
         |                              ^~
   include/linux/kernel.h:875:25: note: in expansion of macro '__careful_cmp'
     875 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   mm/memcontrol.c:1577:28: note: in expansion of macro 'min'
    1577 |                 swap_max = min(swap_max, (unsigned long)total_swap_pages);
         |                            ^~~
   mm/memcontrol.c: In function 'memcg_nr_lru_pages':
>> mm/memcontrol.c:4865:23: error: implicit declaration of function 'mem_cgroup_nr_lru_pages'; did you mean 'memcg_nr_lru_pages'? [-Werror=implicit-function-declaration]
    4865 |                 nr += mem_cgroup_nr_lru_pages(iter, lru_mask);
         |                       ^~~~~~~~~~~~~~~~~~~~~~~
         |                       memcg_nr_lru_pages
   cc1: some warnings being treated as errors


vim +4865 mm/memcontrol.c

  4857	
  4858	static unsigned long memcg_nr_lru_pages(struct mem_cgroup *memcg,
  4859				unsigned int lru_mask)
  4860	{
  4861		unsigned long nr = 0;
  4862		struct mem_cgroup *iter;
  4863	
  4864		for_each_mem_cgroup_tree(iter, memcg)
> 4865			nr += mem_cgroup_nr_lru_pages(iter, lru_mask);
  4866	
  4867		return nr;
  4868	}
  4869	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
