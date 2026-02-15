Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695F1C5D44
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771184882; cv=none; b=S19f+f0J6gY2/wJTSJeNxZgt6A6+Jxz2V5OiIstpUM/KCtBP5sDr0jaYs/XbxU8p7ZNU+Hh2wJYtC1ltxBrw6aX91nznC6okn2OH6Y5lWnw2wbPhydGBSI52bMOMRd5F9+uLqHAuwvjrhXOpvOX7a0IvrmN+WIHH2QEnokPfUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771184882; c=relaxed/simple;
	bh=usY81/KrM8SY/RR3JnAggB2vis8w2I92C7jvHf9hlnU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L/sNAiOJVyJn9tulRvtIiEuQ9TSror9cSq4MY2sRbkrDoPlzldJLln0VxC3JcDTd+l4xcS7M3qQkmhCqksN0tQeGIj3A/1yC+mZ8FXSEWgxgC/4PYf/cy4jLjlHa0Q0HPZkghcz06uCdCUmUlsvjXg7cuJbHiC6vTKhMNWzUKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/wL7CqV; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/wL7CqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771184882; x=1802720882;
  h=date:from:to:cc:subject:message-id;
  bh=usY81/KrM8SY/RR3JnAggB2vis8w2I92C7jvHf9hlnU=;
  b=T/wL7CqVUvm2RbKS/2OZfBZYoV5MIAfJf42ai5vI/BfUA5MJNvQ1+STH
   ERT+lYUMyEZN5sE1b1yWyJEH6Hg6xqQzVcCmVnfgORGZUNJCHGVZ+fWeZ
   7uXuQeIUD+jd4EtvmhSGF1MUhXgXLDBd8yZwZnO5d0B4VK/wnoG/9yr7e
   JoHXgFMX7bWzUEeT1G7WZH6DQWnU1RuL+EnhgOPVAs4Sp2qSG02crETYh
   kHqykB1yW7Vk5337cShiaMALp4ZTvj/BkZKBxglmWAZBb8e/abVNL+SDV
   emWHqkX59QUQyMGN4wYcL6W35zHbZHeVxLp84ANZCSwQlnaAVDl2r2GLs
   A==;
X-CSE-ConnectionGUID: iQAy3Tu6QLOI2KZ5ar5HFw==
X-CSE-MsgGUID: sqoySaMBQqiYDp2AE9449w==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72176952"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="72176952"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2026 11:48:01 -0800
X-CSE-ConnectionGUID: dGzKHLDVQEylEz0dfK/BVA==
X-CSE-MsgGUID: mCGSAsflSiCQ4jX7Fea2ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; 
   d="scan'208";a="218400723"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Feb 2026 11:47:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vri61-00000000z6o-0fbf;
	Sun, 15 Feb 2026 19:47:57 +0000
Date: Mon, 16 Feb 2026 03:47:08 +0800
From: kernel test robot <lkp@intel.com>
To: Dai Ngo <dai.ngo@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anna Schumaker <anna.schumaker@oracle.com>
Subject: net/sunrpc/clnt.c:3332:9: sparse: sparse: cast removes
 address space '__rcu' of expression
Message-ID: <202602160345.qNQDuGRr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bb7a3fc2c976b5d0deb35a54ca237519816d7ba9
commit: bb504321b96550f9a351920e169de141a3f4c6a1 SUNRPC: display total RPC tasks for RPC client
date:   1 year, 1 month ago
config: i386-randconfig-063-20260216 (https://download.01.org/0day-ci/archive/20260216/202602160345.qNQDuGRr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602160345.qNQDuGRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602160345.qNQDuGRr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/sunrpc/clnt.c:3332:9: sparse: sparse: cast removes address space '__rcu' of expression

vim +/__rcu +3332 net/sunrpc/clnt.c

  3328	
  3329	#if IS_ENABLED(CONFIG_SUNRPC_DEBUG)
  3330	static void rpc_show_header(struct rpc_clnt *clnt)
  3331	{
> 3332		printk(KERN_INFO "clnt[%pISpc] RPC tasks[%d]\n",
  3333		       (struct sockaddr *)&clnt->cl_xprt->addr,
  3334		       atomic_read(&clnt->cl_task_count));
  3335		printk(KERN_INFO "-pid- flgs status -client- --rqstp- "
  3336			"-timeout ---ops--\n");
  3337	}
  3338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
