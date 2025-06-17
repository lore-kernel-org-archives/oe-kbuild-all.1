Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA37027EFE9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 05:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750138852; cv=none; b=qb8IXaH8PtIF+nltMvQY6GzjVDcLxD54ViKRYbD05EYy8rMFlg/jg9MymMbHpVNNkpA8C/0AU9LS16pl7lNfmBOpCypdFAa71bZPO22xHyEOHCRTXM9atXZ5cpylXW4B4hl5khTJXBu/6QL5Pd1leVS/3Iys3PKod/vZwEVbqic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750138852; c=relaxed/simple;
	bh=TmCaiUHT3uUVFsrk0MRSN8n19WC4AwdNrgDCxTqVj7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OPK4bXtRH8njFClluTXUcoExjUro6o8rRF+zwLlUmKHMv73/ivo2sFB2H4mtOT3O/G/9Zc7AJ+4Qz7f71ID9+uWDJ8bReHN1SxOOf4pRcPvq+pGi38p1zKOQqqG6CJog6rdz1Brf3Zn0doo0HONXb+SZWpd6soNFcmkzWdh5KqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G17JPkvh; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G17JPkvh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750138851; x=1781674851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TmCaiUHT3uUVFsrk0MRSN8n19WC4AwdNrgDCxTqVj7s=;
  b=G17JPkvhQ2OGJcaLrqYIjT+DOUuniYOa0rzmsoVQMj8hxf6aFYlT1hoC
   szERWHass3Rg7XpVhrsOz+YlyTbT1DfnKY4yn62MGeqNdluVp6ib6QfZ8
   UR56E88twl1HW/hyOZUQi7f0rHHz/CaxTm6VVyNegWKyFcA+jrp+r6y0/
   wkL+xZXkNEk+CMNOIOy2npU4gH2kAZ7FooUdrLwWLjrcpoDYdM+Op+yYO
   3CWMAh0Ms+M5VlpWdNII3/uWTbg5/VmJw/6Cg3wKpsgcgIFkdOIyHjKhc
   /jPKkOy18Rwqc9m85ZNinCYR5Cw/73D2TtMtP5EdXzniJJf6GFgksLFhK
   w==;
X-CSE-ConnectionGUID: 6fjIU9FoQ7GzyK04GvXdWw==
X-CSE-MsgGUID: eiTEhme2RaefJhnJgpC1lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52212771"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="52212771"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 22:40:50 -0700
X-CSE-ConnectionGUID: 9Ck5C0lIRySEmiYth+FZZg==
X-CSE-MsgGUID: QV2vXRDcRSKNcUWoC+fhVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148576832"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Jun 2025 22:40:49 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRP3u-000Fd4-2Q;
	Tue, 17 Jun 2025 05:40:46 +0000
Date: Tue, 17 Jun 2025 13:40:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/25] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for function 'memcg_reap_background_set'
Message-ID: <202506171333.dNI43g6L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   52f058371994dd007ac842b38bab3e576e84ab5a
commit: 67960246d7b8e4034d9a6ef1f75aaa35353ed21e [0/25] anolis: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250617/202506171333.dNI43g6L-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171333.dNI43g6L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171333.dNI43g6L-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^
   mm/memcg_zombie_reaper.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void memcg_reap_background_set(void)
         | ^
         | static 
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for function 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^
   mm/memcg_zombie_reaper.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void memcg_reap_background_clear(void)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
