Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460E41E520E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 22:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754607387; cv=none; b=LDqVJL7GmalRQU60gjVmoH2DBbWhPpzelOdTIhnmjwHe1q6GBO+OzH4mSV72Gx/6PI3pwcA0hf+zfVjw5qsIvqQivGZfklNbFULwOciS+UPPZprRxg2/GOQJritpBBb4HxEwJKDuFpdAulwNJj6/u8BxvRf2GdSeGigJ+YEurIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754607387; c=relaxed/simple;
	bh=x3SJYyHJRhY+n7DLNkTRTTs07lvnD7ZZPYtpaG63BfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFr0c4p2mPka4ZA4PS/bDSjuEkS5bO/J8dvrRvmDbcgzINwxPQhcgnmje9l9Kt56nvCGEymmjBGBylWx3V8HnOzlY1NAew61Sme6oU4l41TUTZvoUIFA9TD3ic0asnM8Sj8XSQfVjMJhHYsWqxSnJP+HUKcMJpA5IP7qjkeO5zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C95O4ZkM; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C95O4ZkM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754607386; x=1786143386;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=x3SJYyHJRhY+n7DLNkTRTTs07lvnD7ZZPYtpaG63BfY=;
  b=C95O4ZkMe18eRPMiz5ValU65FuAdx/gPftOKpEekZ0zMqFSKWiRvTaHk
   A/2JjNWxbnA/FXHw8JWu4Og5d/cfnpb9X1fKkpFE3wbraWK8G5tWmvwIh
   8Q5CSGwC1G491OwuifAgBqW7IdxkDU46K6LXptl7CTsfGp9WTmOLApDTQ
   vYH/hNLlV6M4MedBdzaAS4hTwFnMHuHwZqzBHmO4AxVn/yVlo5DDhqSj2
   QYj79T6FzE4y1s0HpB2WD+K99uJls6yFrLMSYznzHZe0whqLT1L7WME2t
   lgolGnYKE6Oj/OFwsKHelw/5eEGA0bTLlgXL3w9qMWoC6hLLglnsauSlk
   Q==;
X-CSE-ConnectionGUID: vqxeZUhjRH6sS17h0V2HDw==
X-CSE-MsgGUID: jPVVr/IySzW7xwoyIoIWzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68036652"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="68036652"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 15:56:26 -0700
X-CSE-ConnectionGUID: OVcowfqvSf2y7BRcQ7vVsQ==
X-CSE-MsgGUID: fmvMa4nGQ7et7v8klGEXSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="164845373"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 07 Aug 2025 15:56:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk9X4-0003Kw-2l;
	Thu, 07 Aug 2025 22:56:22 +0000
Date: Fri, 8 Aug 2025 06:56:15 +0800
From: kernel test robot <lkp@intel.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 2/9] freezer: Introduce API to set per-task freeze
 priority
Message-ID: <202508080646.M5mv6IBA-lkp@intel.com>
References: <20250807121418.139765-3-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250807121418.139765-3-zhangzihuan@kylinos.cn>

Hi Zihuan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on brauner-vfs/vfs.all linus/master v6.16 next-20250807]
[cannot apply to tip/sched/core kees/for-next/execve]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zihuan-Zhang/freezer-Introduce-freeze_priority-field-in-task_struct/20250807-201611
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250807121418.139765-3-zhangzihuan%40kylinos.cn
patch subject: [RFC PATCH v1 2/9] freezer: Introduce API to set per-task freeze priority
config: arm-randconfig-002-20250808 (https://download.01.org/0day-ci/archive/20250808/202508080646.M5mv6IBA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080646.M5mv6IBA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508080646.M5mv6IBA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:77:
   include/linux/freezer.h: In function 'freeze_set_default_priority':
>> include/linux/freezer.h:95:55: warning: no return statement in function returning non-void [-Wreturn-type]
      95 | static inline bool freeze_set_default_priority(struct task_struct *p, unsigned int prio) {}
         |                                                       ^~~~~~~~~~~


vim +95 include/linux/freezer.h

    91	
    92	#else /* !CONFIG_FREEZER */
    93	static inline bool frozen(struct task_struct *p) { return false; }
    94	static inline bool freezing(struct task_struct *p) { return false; }
  > 95	static inline bool freeze_set_default_priority(struct task_struct *p, unsigned int prio) {}
    96	static inline void __thaw_task(struct task_struct *t) {}
    97	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
