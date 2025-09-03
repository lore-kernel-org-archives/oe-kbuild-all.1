Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A532F744
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 23:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756942569; cv=none; b=tyPAF7y2gCi3Zo8DJG7Jz5xp3UqK4+tWOJbbfXGnJHGxwOLg+L/6379An+uDjNN4w6WpRsabXiLd7IIEmD7gUP2jUjfKeV75cwiC74M4x9T/1IwKKx4HTfkSJfdZh95ouTsHO6iT9ZAWNQTAk+UewtIzcZ2xAhRqPCUjr88ILjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756942569; c=relaxed/simple;
	bh=jOzolt/4L58sNNYxLt+TDKVivTg5m69Z8ISwMozH9qI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5Jmt1w0KTm/gY1+99s9ddTzO4Q0xg8P2EgfYllkl0RQ5n8kAy+aT5oK0MSc84wK07UZjK1XKUI5jK9nI0g4hzsbXDpp65fZCgqG8aERuhhf+/7/Bt4tCZXWO3kDM39mETtVpNnsDefYU8x95Tef+Z+nbPoaszJbYVroAb2U2Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CTw4KnXf; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CTw4KnXf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756942567; x=1788478567;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jOzolt/4L58sNNYxLt+TDKVivTg5m69Z8ISwMozH9qI=;
  b=CTw4KnXfWf+F4IzBaY0RqWPB0RwGKKMsxF7kcPWa3BZxdcTDwQiMFOOp
   PsgRiSYCooqE95x74mm1smfR+d3Ytcn53RAEPNZkX8UhkGzyaaVlyVhCY
   easfebXL4Mm4dRVWicxnzByxiZrBBtjaWMpc8xjZW3VwgJyHZfTQyA/jP
   cZUVYMZUwFNjiDq5TmJAZ4RUSkQ85A/z3cViBWduVzPN/9Tv73H1CGxtf
   xkmPOZKdto5EEdHemOAVgseNCQSikPdrJs3wpFXzv4OipTUTtFiW6zeqM
   j3DV9XK55pxvqDQ8XfoUfyOINh6edjvajzYvy1I32Yg/eeuW4mT7hUncr
   g==;
X-CSE-ConnectionGUID: Qh5lc/YFQgiX6DdUBaIJew==
X-CSE-MsgGUID: Tv54725kS6agUSgD36650A==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="70698261"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="70698261"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 16:36:07 -0700
X-CSE-ConnectionGUID: c3HAOFDOSa6rfF2rtbPAYg==
X-CSE-MsgGUID: DGrVOG9jS+eK9aaji75mtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="171616135"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2025 16:36:05 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utx05-0004WT-1N;
	Wed, 03 Sep 2025 23:35:12 +0000
Date: Thu, 4 Sep 2025 07:33:29 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:126:5:
 sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it
 be static?
Message-ID: <202509040747.kf1P19QW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   e89b998912c3f26072b4a79fba9fe4365c38ab19
commit: 1845e7add95773a24019fb72bbea24a0a568663b [1740/1740] mm: Add reliable memory use limit for user tasks
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250904/202509040747.kf1P19QW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250904/202509040747.kf1P19QW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040747.kf1P19QW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/mem_reliable.c:126:5: sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it be static?
   mm/mem_reliable.c:126:5: warning: no previous prototype for 'reliable_limit_handler' [-Wmissing-prototypes]
     126 | int reliable_limit_handler(struct ctl_table *table, int write,
         |     ^~~~~~~~~~~~~~~~~~~~~~

vim +/reliable_limit_handler +126 mm/mem_reliable.c

   124	
   125	#ifdef CONFIG_SYSCTL
 > 126	int reliable_limit_handler(struct ctl_table *table, int write,
   127		void __user *buffer, size_t *length, loff_t *ppos)
   128	{
   129		unsigned long old = task_reliable_limit;
   130		int ret;
   131	
   132		ret = proc_doulongvec_minmax(table, write, buffer, length, ppos);
   133		if (ret == 0 && write) {
   134			if (task_reliable_limit > total_reliable_mem_sz()) {
   135				task_reliable_limit = old;
   136				return -EINVAL;
   137			}
   138		}
   139	
   140		return ret;
   141	}
   142	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
