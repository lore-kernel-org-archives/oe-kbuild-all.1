Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F54DDAD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715439975; cv=none; b=UkTcwU5AKwZBKXQNHqccXHF1bq3vbztF61R6STrzdKHf4yFuhYMjiCQxsd81FuGK02xk9jEvoARVGoCqeqPK5QIYgrVvUzAOPeWF6PQWvpMmetAuQrFf8zSYRjUq/906sm2TOrxCO3OTE+7WDPYybh94gwDhOMJcgzC2bP1oJhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715439975; c=relaxed/simple;
	bh=EElsQTLFxHhTxzxyG96c2G7yxcG9HxJNYvKGLKxhoWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+Jq0s2i1DF+uRemM272czBNdNoy5152/Z3SeESFMxP+rrKWdIu6CQjnwuxqxGFNu3zOwjqWT74G12adDH+tqj4EqvEoh/+8S4VhaMxwRp2iCW+oKID6D1JR+wEWb4U69LGhF/ru5lqPwo/VJ/W3kI9AHbS+ee1bW6y8DSIpTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nRVlvN1R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nRVlvN1R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715439973; x=1746975973;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EElsQTLFxHhTxzxyG96c2G7yxcG9HxJNYvKGLKxhoWg=;
  b=nRVlvN1R0KiNFYpthGwabKCRggwhXxk8iGLA27H3dfazZ3W2zswPcln1
   KAYbBauMBOzP/yOk1Jn2ecL1gfhi/YAL3jXg1fCtd8l+gti9YjSejroR1
   2BCeitvMYWinQ9YXTeVvyFZE6RNxT+D9VgNKjhzlZLt9aJmjmm50RDmEj
   MZHuL8xybYmCSW2JDO6+yY52ytx26N/3gagFFGHeFlTEH6KGNwFlHYcsy
   9hhenDD7+gD1s4yV4iJQ/uukPcVlUzBk6wKDfTFihWShxzPRLZUOqPgeU
   93vip0lke3AYjWf7RSszS/3lAkpGzwaxcQ96Z9KwtJvxiaecDOIYgJAhX
   g==;
X-CSE-ConnectionGUID: bICYL2elSGGTj29muNG38A==
X-CSE-MsgGUID: 5Ba+pjHQQCiZe6MiKEPAaQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="22823282"
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="22823282"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 08:06:12 -0700
X-CSE-ConnectionGUID: OFHEYcNWREOBDjDarKgApg==
X-CSE-MsgGUID: DCcpBXpuSCqB7ahGSMLrXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,154,1712646000"; 
   d="scan'208";a="29763447"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2024 08:06:12 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5oIb-0007X5-0s;
	Sat, 11 May 2024 15:06:09 +0000
Date: Sat, 11 May 2024 23:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev, Daniel Borkmann <daniel@iogearbox.net>
Subject: [cilium:pr/misc-patches 8/13] nios2-linux-ld: task_iter.c:undefined
 reference to `net_namespace_list'
Message-ID: <202405112226.P8iGgr4h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cilium/linux.git pr/misc-patches
head:   3c68876290b3daed7a2766d683c73bbb4fa5b3d1
commit: 2c5555038196a4907f205f412de7e09d17c5ee2f [8/13] netns iterator
config: nios2-randconfig-001-20240511 (https://download.01.org/0day-ci/archive/20240511/202405112226.P8iGgr4h-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405112226.P8iGgr4h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405112226.P8iGgr4h-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/bpf/task_iter.o: in function `bpf_iter_net_new':
   task_iter.c:(.text+0x16fc): undefined reference to `net_namespace_list'
>> nios2-linux-ld: task_iter.c:(.text+0x1700): undefined reference to `net_namespace_list'
   nios2-linux-ld: task_iter.c:(.text+0x1704): undefined reference to `net_namespace_list'
   nios2-linux-ld: task_iter.c:(.text+0x1708): undefined reference to `net_namespace_list'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
