Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE41D8E10
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 May 2025 10:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700308; cv=none; b=RB5f+5K7BAojvlRbXJfpPvxoojmNQuQzlb4p6+DOiZC4Ae+S/QzuWyJmhNw5PehN9VEx5Mold82tmBwW/FWWXHJngAr6kS7B4Hdz+3ksiuZOllR+lcsMc69lkXZFBn/UONvkcI27Zk7ROq5iRqODBZa1oEqQC5qscfX1mlu6BD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700308; c=relaxed/simple;
	bh=KXY7hpyLZrSl7JlfMIauS1f2ihZ9L0cgCr+ZMhq85vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GIT+grouMVEcNOwKdagt0u+1fctI8ZohzUJZiog+8z1Bj84/ifuv5uRkcKXr9D7xXu3hclrojWI04SPR/XP30qj1Azwbiqr+rkTV+YobOCF6HuwT94JN6+fYZs6vp3hiQa40BBoUH6f/XRve3yDOASnQwlp0xrD3UbpYXAMD4uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OYUndRvd; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OYUndRvd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746700307; x=1778236307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KXY7hpyLZrSl7JlfMIauS1f2ihZ9L0cgCr+ZMhq85vE=;
  b=OYUndRvdF2/8wvxL/FpteiJuN7F+CaTVB5FI5qj+f03wCxtXJ2l0kPoV
   Y+8iMMd0Ojzn0Kb11sqaQCsqvnFiQZuC+cUhdvqeYZWN1MVeS9j2CeuNt
   6DR76aer7hW9x1KF68GghvdtWyaKKYn3YzlmVQfdmFX3JOkl0JqERc8r3
   JPAxASPkSNVQg/IhhVILdjzOfpYc2yA4so3JWmFqaeO00zORcRGNTPZ1+
   b7wYYXT6aUYAERiTuxdJUIOZiDe9fINOnGTbRAMwG+n0KnGkBLbBWES9F
   bGQ3YvCfnD1QfpXv9kUthds8AMnK0uCQBT6OZ7UiWDBs+WO7oayUkV+NY
   w==;
X-CSE-ConnectionGUID: tOhtGHWZSDWuin8XR53X1Q==
X-CSE-MsgGUID: 50cV2NmuTrmit2rET38oZg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="59463129"
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="59463129"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 03:31:47 -0700
X-CSE-ConnectionGUID: OSrxGmoOTs2tyEUCx+X6iw==
X-CSE-MsgGUID: PC9N8ai9TFW1Jd4dxhsSvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,271,1739865600"; 
   d="scan'208";a="141466919"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 May 2025 03:31:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCyXX-000AsB-0e;
	Thu, 08 May 2025 10:31:43 +0000
Date: Thu, 8 May 2025 18:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 3/9] fs/f2fs/node.c:315:30: warning: passing
 argument 1 of 'is_node_folio' discards 'const' qualifier from pointer target
 type
Message-ID: <202505081851.LCOBZGtX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   5c0d3e30440de65110257a38163686110f8f230a
commit: 0d36032e3b1c316a0afaaefec82720597fda20b0 [3/9] f2fs: introduce is_{meta,node}_folio
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250508/202505081851.LCOBZGtX-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250508/202505081851.LCOBZGtX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505081851.LCOBZGtX-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/f2fs/node.c: In function 'f2fs_in_warm_node_list':
>> fs/f2fs/node.c:315:30: warning: passing argument 1 of 'is_node_folio' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     315 |         return is_node_folio(folio) && IS_DNODE(&folio->page) &&
         |                              ^~~~~
   In file included from fs/f2fs/node.c:16:
   fs/f2fs/f2fs.h:2103:48: note: expected 'struct folio *' but argument is of type 'const struct folio *'
    2103 | static inline bool is_node_folio(struct folio *folio)
         |                                  ~~~~~~~~~~~~~~^~~~~
--
   alpha-linux-ld: drivers/net/wireless/intel/iwlwifi/mld/mac80211.o: in function `iwl_mld_mac80211_stop':
>> (.text+0x2850): undefined reference to `iwl_mld_no_wowlan_suspend'
   alpha-linux-ld: (.text+0x2858): undefined reference to `iwl_mld_no_wowlan_suspend'


vim +315 fs/f2fs/node.c

   312	
   313	bool f2fs_in_warm_node_list(struct f2fs_sb_info *sbi, const struct folio *folio)
   314	{
 > 315		return is_node_folio(folio) && IS_DNODE(&folio->page) &&
   316						is_cold_node(&folio->page);
   317	}
   318	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
