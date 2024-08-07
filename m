Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC7D513B58E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 17:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723050129; cv=none; b=nJCwLUvnDq8Ei2zPtPyM1aHpqDKoCtAFBLMsFA2fpJF06wf3+8W0FVKF95BKY3EV9wsKkV5k5DGue+XprL0nI4alSr++nfmVeOJKRC0VJzOkKkxC/2xddciz2y+BO4ct4ecp+uxFkf0o85ex24PcvSdLxR8YR7culrYjiHmmla0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723050129; c=relaxed/simple;
	bh=h9VxnwrSh/e1TQBEb6/ns5rIW3JjiF8cUk35p4yHgpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XI07y6GydlQ+tSmj6/C25mb9/sD7SUZT/FNDpSMUibpO4beQ5JDbcpzPu+rXWcVMyriJdq2q6vAkspB/KwBlrpqyDJyoojAksGjCfCT4CprRJ4MhZ9gTqksxkeKiRLxJOWx56HpkC3nOwkuaKSehWUoWP1AZTSqqPzMAme4B1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMPPYyxm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMPPYyxm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723050127; x=1754586127;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h9VxnwrSh/e1TQBEb6/ns5rIW3JjiF8cUk35p4yHgpE=;
  b=BMPPYyxmkVky5rNAbqEhZS749Rlcbdb0lxPlth2XIi1+IvPevWh54yry
   ey7uSajOZHuJXnp85062e6hjdQVWF5wFuP8Z7f+gGNEAHLxZ48ZgGmG19
   4zYt/HnI0lG/Bp+GMCPbAvG97WGpJxmaGPiKImG+DUAvvqCoklBh7vECz
   enaQ1+SDcewVoeM497/t1RTiPZwiBI5xpNPfKboayVLP4pG0JMve6ezOi
   XzzBgsHCS8maCnr6VvRCJQUj6jcMXSVvhBonvx0fj5o0PuQPLIYcS8fg2
   gtMf9cjJWo5jwm/ngZZ+OAzM7Sx0uPWl7rMFtd+3jHLzYMnbswJ9ZDpLm
   g==;
X-CSE-ConnectionGUID: hKltf7loSkGLOWMm5calYQ==
X-CSE-MsgGUID: haB9ZEAGTRenI7aj+ThpXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24045390"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="24045390"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 10:02:06 -0700
X-CSE-ConnectionGUID: J036NKhjSMyJ2jqzAIax2A==
X-CSE-MsgGUID: zC8vpXwWQhOn7whnxA106A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="87582626"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Aug 2024 10:02:05 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbk30-0005a8-1y;
	Wed, 07 Aug 2024 17:02:02 +0000
Date: Thu, 8 Aug 2024 01:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18554/23462]
 drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_lib.o: warning: objtool:
 missing symbol for section .text
Message-ID: <202408080045.jCIFyHQH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c84d316d6a7855966d34b7a68685020ba964419f
commit: 206f9c11a8c8b0197da5a26859d96d2ed65f5757 [18554/23462] net: ngbe: Add Netswift Giga NIC driver
config: x86_64-buildonly-randconfig-005-20240807 (https://download.01.org/0day-ci/archive/20240808/202408080045.jCIFyHQH-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408080045.jCIFyHQH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408080045.jCIFyHQH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_lib.c:19:
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^
   1 warning generated.
>> drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_lib.o: warning: objtool: missing symbol for section .text
--
   In file included from drivers/net/ethernet/netswift/ngbe/ngbe_sriov.c:30:
   drivers/net/ethernet/netswift/ngbe/ngbe.h:764:6: warning: variable 'cur_diff' set but not used [-Wunused-but-set-variable]
     764 |         u32 cur_diff = 0;
         |             ^
   1 warning generated.
>> drivers/net/ethernet/netswift/ngbe/.tmp_ngbe_sriov.o: warning: objtool: missing symbol for section .text

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
