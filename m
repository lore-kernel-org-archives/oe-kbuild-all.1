Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FBA15E86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 20:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727123150; cv=none; b=TFlb0MYxVo53Toz9CJTShGFE1nCKyaJLnhy9wxeCzDOKVCch7LNhoPa4pny8DjMGu9uNNHpfzymcGDOIsd8UGqM4jkKakSWrP5SsUlUi5a7Blef45+OByOdPYBdekCyCbxjvrafXJzcPpHBk8JTgYJ3S8Edvl8whw/WM9KSKv5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727123150; c=relaxed/simple;
	bh=ZTpdQ3qhD4xvFAVSqhYcUGduGcRlSoDS5puBJI4ayuw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BNN+6TFelXc3IH6NulddwahF+OBWHx1fnCY7ij9FuqdYVb7vbU9idFXzDA7qNb5nF2632zHcUCfbsLlSWAOP5I2lpH96xK0BZrsuftHK2V7h40g272wmArws33ZpRtM3+iepRBq5afgVA29brdYPXP/Rk801yHkg3ldU/ugRqL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0SQfdvf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0SQfdvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727123147; x=1758659147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZTpdQ3qhD4xvFAVSqhYcUGduGcRlSoDS5puBJI4ayuw=;
  b=G0SQfdvfyfNjKFX3b634wW2tYDQ/JA40VU+M32H/O+oMrSwC9rVnNi4E
   HOIUwgdk5/ZC947B1Ikz9ZNaeR5mZ6hpFg4yAbiliFdLrdrc5zbEF27rb
   3JwYT8diAoI8x2XVtt2to9Qvo/MFpo2ErGMnoNOfJ+Fq189sfezBrcTyy
   tIcMz2juKm2YZ8zMkWHr64skeIlhFDHrNUJE5LI+N7AXKUUmeLs/+HMgD
   upWap6+Ql9T5T9g3XngkKsXELqfWgBjy8Yn90MIfID+7jgV6v+i+lqPOC
   u3qeMZe8IvU8+eysL+zmuso5rQT5XOAoyefn5DJtX2a835RHtm8L5/Tie
   w==;
X-CSE-ConnectionGUID: p3Ifk54JSOWZT+OzEYfwOA==
X-CSE-MsgGUID: EUrPn5BOSzq+PFUEfkHHLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25954246"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="25954246"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 13:25:46 -0700
X-CSE-ConnectionGUID: ugKPCADLTOCMT3nvSn401w==
X-CSE-MsgGUID: rYA9xqZHRcGDnEa8vSNqmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="71623448"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Sep 2024 13:25:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sspcr-000HaA-0D;
	Mon, 23 Sep 2024 20:25:41 +0000
Date: Tue, 24 Sep 2024 04:25:28 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7865/10987] kernel/cgroup/sli.c:647:14: error:
 'cpuacct_cgrp_id' undeclared; did you mean 'cpuset_cgrp_id'?
Message-ID: <202409240434.iYjJB18K-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   32c289d299ef397e4df3f8fdf99c99c07b3192d4
commit: 00423a80429a623a28227d306c3108e801dd0f6f [7865/10987] sli: backport sli function from tk3
config: x86_64-randconfig-011-20240924 (https://download.01.org/0day-ci/archive/20240924/202409240434.iYjJB18K-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240434.iYjJB18K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240434.iYjJB18K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/cgroup/sli.c:14:
   kernel/cgroup/../sched/sched.h: In function 'mm_cid_get':
   kernel/cgroup/../sched/sched.h:3581:25: warning: variable 'cpumask' set but not used [-Wunused-but-set-variable]
    3581 |         struct cpumask *cpumask;
         |                         ^~~~~~~
   kernel/cgroup/sli.c: At top level:
   kernel/cgroup/sli.c:642:16: warning: no previous prototype for 'get_cgroup_from_task_id' [-Wmissing-prototypes]
     642 | struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c: In function 'get_cgroup_from_task_id':
>> kernel/cgroup/sli.c:647:14: error: 'cpuacct_cgrp_id' undeclared (first use in this function); did you mean 'cpuset_cgrp_id'?
     647 |         id = cpuacct_cgrp_id;
         |              ^~~~~~~~~~~~~~~
         |              cpuset_cgrp_id
   kernel/cgroup/sli.c:647:14: note: each undeclared identifier is reported only once for each function it appears in


vim +647 kernel/cgroup/sli.c

   641	
   642	struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
   643	{
   644		int id;
   645		struct cgroup *cgrp;
   646	
 > 647		id = cpuacct_cgrp_id;
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
