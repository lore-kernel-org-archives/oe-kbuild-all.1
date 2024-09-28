Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F81885B7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727533342; cv=none; b=bQ8zU+IdVn0WhDGGCFNCwRNB5n/g8/zFburqJeUwHb+sfMI3NKJXlWn6v5bnTozvkY6LDfvb1v4Ca9k3RUJHt75EQMn2CSE0/7llrLWWmg8KQ0fFLpjn00Xfpy5ysmJwRhvT1zE077Fd7cfF/sHE0+Ro7oxvzoMse88Hja8mLEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727533342; c=relaxed/simple;
	bh=ba22z1d2bo97ysMZasCXw/LtSfB9Pkdpqo86iYx7hRg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=deuUxlx4j7DK+uh5TdV4t/Qo+ZL2GLDe1H49IBQsnejHF8mnMdSMnREFcaXQNmLuFEc2n7XTtPKffT+ocpx54uKVxZwZG4LXWCeqOJOD6uS8u1ot/F729w4nVGhfgaj0WrRKiVd2WpvTtl0U/yS7ARDEOeRadUGjjN7gzvXn1SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RL8JS3Rq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RL8JS3Rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727533341; x=1759069341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ba22z1d2bo97ysMZasCXw/LtSfB9Pkdpqo86iYx7hRg=;
  b=RL8JS3RqVwExB/bZamzrOaeYc1TTn+c/uA+Rn3Kg5QjEVwXw0zobqjh8
   /1O6W+h0vmSJUqpUStTQ7hSLLncvSkARkNlC9o+Au5JOZZlxN30D8Bpmk
   PSLaHmKZH7u7WXNqbOgFoza4siz/6+KPJZPhKoU9oZVqUkylquLzKYqRs
   r758Mg/AD0xtA0b2nCluF2GxjJQ11fqM3dG2RrEJiXrVLEaSGtsVdn+vs
   MjThqxqVwPwsxBRd6+D8TLGtnT9fkuMU4thxQVLLaPFuZxTrgnJQ1Alu+
   jmwN+6z7xsuOrQmNLq+C3CQofOTfXVTGeDSvsSmEtAJroqRCiygBaAAs4
   w==;
X-CSE-ConnectionGUID: YTYmV+ncQdyVq59myblYMQ==
X-CSE-MsgGUID: 0m202ymzSMmuVsvGKOWm+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26799585"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26799585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 07:22:18 -0700
X-CSE-ConnectionGUID: JCEDLnSWT6ab8x5QlQDCsA==
X-CSE-MsgGUID: RWaCDTd5QLCl2PtUx/d73w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77758029"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2024 07:22:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYKs-000NK3-1t;
	Sat, 28 Sep 2024 14:22:14 +0000
Date: Sat, 28 Sep 2024 22:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wupeng Ma <mawupeng1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 27522/30000]
 drivers/soc/hisilicon/hisi_lockdown.c:56:19: warning: no previous prototype
 for 'get_valid_sccl'
Message-ID: <202409282220.v0Ys1Flg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   bef6f06e039b8929481350d15d6d8c3ba81c6fd2
commit: c40d971092ff58cd771bb9413ae132a3eb74fab3 [27522/30000] hisi: l3t: Add L3 cache driver for hisi
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282220.v0Ys1Flg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282220.v0Ys1Flg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282220.v0Ys1Flg-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/hisilicon/hisi_lockdown.c:56:19: warning: no previous prototype for 'get_valid_sccl' [-Wmissing-prototypes]
      56 | struct hisi_sccl *get_valid_sccl(int nid)
         |                   ^~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for BPF_NET_GLOBAL_PROG
   Depends on [n]: NET [=n] && BPF_SYSCALL [=n]
   Selected by [y]:
   - SCHED_TASK_RELATIONSHIP [=y] && CGROUPS [=y] && NUMA_BALANCING [=y]


vim +/get_valid_sccl +56 drivers/soc/hisilicon/hisi_lockdown.c

    55	
  > 56	struct hisi_sccl *get_valid_sccl(int nid)
    57	{
    58		struct hisi_sccl *sccl;
    59	
    60		sccl = hisi_l3t_get_sccl(nid);
    61		if (!sccl || !sccl->ccl_cnt)
    62			return NULL;
    63	
    64		if (!sccl->l3t || !sccl->l3t[0])
    65			return NULL;
    66	
    67		return sccl;
    68	}
    69	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
