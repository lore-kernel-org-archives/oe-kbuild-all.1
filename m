Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E614883F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 17:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753896056; cv=none; b=iprnc89gz92FujDJumeCLyugVMUe0fY6mjWWaounSE7DZDCv0ZgFz5S43E0VuQXLEiCserhE0nFreeSLjHnLwAGPyvcDDvHz0CBayOvpkBREKpJf3JqiU3s4R3iQQz7DJN5qHwpeqYDJX8k3cdvB9HLa8NDnb0pp7KpYH/lNfDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753896056; c=relaxed/simple;
	bh=XwLyQFA0eJ+BNj2LQDHbuUXgooS36pVf1xNx3EsW2/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RngWuIq2ezK1ry5bAUlfCTge2JxhjT7Vf9CnG4M96Mk/O58OcIlbTiPHmUNnX/ihxLZKaJ2aj/ehtrEKtxYo4eq1lIJW3aNj098qaEqjwxev8wCkd6NIVVvJs2jGpq82Bce7n6W5VM9+l9984ZKP4ABELugXpTZ+TgHdDGhlHs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gBfq2jJQ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBfq2jJQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753896054; x=1785432054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XwLyQFA0eJ+BNj2LQDHbuUXgooS36pVf1xNx3EsW2/g=;
  b=gBfq2jJQHJCz+Dk5/TFeDaNCLTSk6mnpbCdllDn5QdZ9d8gfrCN1PlUT
   6KhLsLrqlMRzFkbu3kVHzDl3p0sFDSZSR5QncFfzyjQuZr7f/4Td9OtM/
   jY70QpX5uixqzCLe+5AYpfYRlHCpaxFUO9n3xB5mBfaagVNGyxkzUJZjE
   KWHdh68hYsL3o/FI+WOFwsETPS2VoF131rGnEGmv+zvTG+1BXeOAMe8eo
   pNACILl98dvDxOsrllBQiqz+GfT3P+7Zj72y7KY3oXeL2oi4BcKUWz5gv
   +9Dgbowz7MsjcgKn2gafWKnBm6ul/f8WxRqYB8ElFdpqGlBufAHDN5jxP
   A==;
X-CSE-ConnectionGUID: t0qyqtvnQ6yB47um9jBOgg==
X-CSE-MsgGUID: MoIk53YLQSaqGhvMMf0YuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="55905676"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55905676"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 10:20:53 -0700
X-CSE-ConnectionGUID: ffTnmkZiQJSCaRHMGT9z1A==
X-CSE-MsgGUID: ODzgl+KnQ06JvoHC0H3H7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162632290"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Jul 2025 10:20:52 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhATx-0002zQ-2l;
	Wed, 30 Jul 2025 17:20:49 +0000
Date: Thu, 31 Jul 2025 01:19:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1740/1740] mm/mem_reliable.c:126:5:
 sparse: sparse: symbol 'reliable_limit_handler' was not declared. Should it
 be static?
Message-ID: <202507310153.fW2hs6vO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   859de5033e15abefcf19935429e6478be97d889a
commit: 1845e7add95773a24019fb72bbea24a0a568663b [1740/1740] mm: Add reliable memory use limit for user tasks
config: arm64-randconfig-r121-20250729 (https://download.01.org/0day-ci/archive/20250731/202507310153.fW2hs6vO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250731/202507310153.fW2hs6vO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507310153.fW2hs6vO-lkp@intel.com/

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
