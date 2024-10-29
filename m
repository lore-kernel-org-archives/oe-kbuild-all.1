Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570172107
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 17:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730222184; cv=none; b=aSy2y8xbRJyq074WRe/09Pohkyf4Dzgfdt2egAArCRr5EQ29TLdP5j0AGgGLr6RLOkapqB7NzzTpVy7nSZRUlCRJJImEEdiqqmuMrmyUoz/2R55oaRkDr2br5/yWikxi4Ryf77T0u6Awm1Tn0rE4qhpYr04En+Z0VqVdRfsd5EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730222184; c=relaxed/simple;
	bh=WNXAgwMx0qWnWqt9YNaVeIiO4YtAdP/OYZlOO61AVUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NmLtHftyD+WXRWNmzJL676kfCD2XUbYlheLI4ZSbLvB194/GJG1VKymaGCPwaLJo+Vfyf2SL9UzTxrrQKQ3I3EVbFMi0wdsL6mQNlHa//Yp2ndMtSDGBfqCoBVbRdu3JevLM+LxNzNNd3ZV5G5wiG488HjcOOjC76Y+6czh32bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRI3HxTz; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRI3HxTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730222183; x=1761758183;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WNXAgwMx0qWnWqt9YNaVeIiO4YtAdP/OYZlOO61AVUU=;
  b=MRI3HxTzp/uX3OjUIMDHuJnfHpM40JRhnKe4tRlZPtmjfTK7V2qdmtcz
   gL7BESH7TxIXoZdRa5gYYrF7aRApQIuuFUqNr2L1bBfR11j3EP4imS0QV
   x1OAhFym7gdGktdJnAovC5Uf+Bg/nmj/fApttnTRISsH9ckdGV+LLy6pc
   POrd9OrA8ivvaNBPzRw0Z5Xi7O6glse5+tFR9m/IzdPEENKFPGU+L4vm2
   YI5Q9XjSp+0b09mLAzGhXvsMCeH7cl19zoUDEPh45aKfmhIkErq2aDIWs
   6ptX/v0aDUIQ9u+EAEoCxVHk+gP5ZnIzCTqyvVZEyVY+rU/xfndSaB1eI
   Q==;
X-CSE-ConnectionGUID: nBomDc/ZTB2UJAGyPrMhtw==
X-CSE-MsgGUID: c1dYe6WfR8KmtgWyfBKJjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29843496"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29843496"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 10:16:22 -0700
X-CSE-ConnectionGUID: IW4hrqR0Tbm0Xw6DgnoE3w==
X-CSE-MsgGUID: Uj6/D11CS821Er09Y46NlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="86782895"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2024 10:16:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5ppI-000dvY-0a;
	Tue, 29 Oct 2024 17:16:16 +0000
Date: Wed, 30 Oct 2024 01:15:50 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7865/13046] kernel/cgroup/sli.c:642:15: sparse:
 sparse: symbol 'get_cgroup_from_task_id' was not declared. Should it be
 static?
Message-ID: <202410300158.0rkAhJcg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 00423a80429a623a28227d306c3108e801dd0f6f [7865/13046] sli: backport sli function from tk3
config: x86_64-randconfig-122-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300158.0rkAhJcg-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300158.0rkAhJcg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300158.0rkAhJcg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/cgroup/sli.c:642:15: sparse: sparse: symbol 'get_cgroup_from_task_id' was not declared. Should it be static?
>> kernel/cgroup/sli.c:1247:27: sparse: sparse: dubious: !x & y
>> kernel/cgroup/sli.c:1247:29: sparse: sparse: restricted fmode_t degrades to integer
>> kernel/cgroup/sli.c:1337:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got int @@
   kernel/cgroup/sli.c:1337:24: sparse:     expected restricted __poll_t
   kernel/cgroup/sli.c:1337:24: sparse:     got int
   kernel/cgroup/sli.c: note: in included file (through include/linux/mutex.h, include/linux/seq_file.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +/get_cgroup_from_task_id +642 kernel/cgroup/sli.c

   641	
 > 642	struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
   643	{
   644		int id;
   645		struct cgroup *cgrp;
   646	
   647		id = cpuacct_cgrp_id;
   648		switch (event_nr) {
   649	#if IS_ENABLED(CONFIG_MEMCG)
   650		case SLI_MEM_EVENT:
   651			id = memory_cgrp_id;
   652			break;
   653	#endif
   654		default:
   655			break;
   656		}
   657	
   658		/* First, try to get cpuacct/mem cgroup for V1*/
   659		cgrp = task_cgroup(task, id);
   660		if (cgrp && cgrp->level)
   661			return cgrp;
   662	
   663		/*
   664		 * If can not find cpuacct/mem cgroup or cpuacct/mem cgroup is root, just return
   665		 * dfl_cgrp.
   666		 */
   667		cgrp = task_dfl_cgroup(task);
   668	
   669		return cgrp;
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
