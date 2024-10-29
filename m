Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0927464
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730181350; cv=none; b=OF+bBp2mlIZ4NGmBfeXW+zcLW3STCOXeidtpelw+vsEEt1IJkU+VHSkor3stzxLyymViRovhfzS8DTN3InAkJkaY7wbzDj5kFjmicdM7ZyZo76dy5wFvOyonIN/hQjTOv95GoiJfbdm5+j0I2ENuoWHc/g9vwpuV0M/F2QWS/FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730181350; c=relaxed/simple;
	bh=TC/puzeigWq7hyXxIAW3A3niPvz+TwKGtFlk5ko/zoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YhxKOAOjtde510iChth3xOQkxh0556ap2r6oW/VJCmqlhEz/0WJPNB2qX3WwaMaTYj5EUzilLK+6SUU4y1vRpyVqeq9vzwisetl2tVCyXLiUG3hLYG22+ti3b5+f16sfLHd1eYr6JlI2QpyoQPZ2r0DISl1SKkKCz7ox4Ed73g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0o4+7cu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0o4+7cu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730181348; x=1761717348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TC/puzeigWq7hyXxIAW3A3niPvz+TwKGtFlk5ko/zoM=;
  b=G0o4+7cuK6YRIusR/+ox3iEMnOUHGBq853edx34caZAGsajRri6k3zuV
   ogAi0L9SOlWt/p836hh6o0vcQfUmCJJ2+7rKhL4CY0DTjZ404UhATHjDj
   NiPxxdZl+dNaqu7XD1mHACIOlpcPDrF6svs5gUn617sDeOubRB/yLcImh
   Rm5aBbkHN7Nd7gNnwW8kXXbXg6SG4/WrK+C16qSS8ikO3tigxVE/n2KFo
   6eYwuy8IWxBFha1BYL99NCCcfGZUGmybd7dRHZgKUD1mOmJmyo3SSiL2z
   moYDm1Yw+j2bCUqsx8rRVPHcy3ucEcal4VEiLeUrGwZDVijkaKGI211Um
   g==;
X-CSE-ConnectionGUID: Gwxh5bJJTGa3vnvc2RAetw==
X-CSE-MsgGUID: 83BK9AGDTjKqHYdLFyTBOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="29259620"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="29259620"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 22:55:47 -0700
X-CSE-ConnectionGUID: sYR8pFHaTlOyNG5V/kwrGw==
X-CSE-MsgGUID: GH7VWfLHQK6wMcJw+4d91w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="105191498"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Oct 2024 22:55:44 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5fCf-000dIw-1x;
	Tue, 29 Oct 2024 05:55:41 +0000
Date: Tue, 29 Oct 2024 13:55:10 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 7865/13046] kernel/cgroup/sli.c:647:14: error:
 'cpuacct_cgrp_id' undeclared; did you mean 'cpu_cgrp_id'?
Message-ID: <202410291305.mNaGPKIo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Chun,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   ce9f9d823a41831d622fa11e29c3d620c044f51b
commit: 00423a80429a623a28227d306c3108e801dd0f6f [7865/13046] sli: backport sli function from tk3
config: x86_64-randconfig-121-20241029 (https://download.01.org/0day-ci/archive/20241029/202410291305.mNaGPKIo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291305.mNaGPKIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291305.mNaGPKIo-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/sli.c: In function 'sli_memlat_stat_end':
   kernel/cgroup/sli.c:404:17: error: implicit declaration of function 'mem_cgroup_from_task'; did you mean 'get_cgroup_from_task'? [-Werror=implicit-function-declaration]
     404 |         memcg = mem_cgroup_from_task(current);
         |                 ^~~~~~~~~~~~~~~~~~~~
         |                 get_cgroup_from_task
   kernel/cgroup/sli.c:404:15: warning: assignment to 'struct mem_cgroup *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     404 |         memcg = mem_cgroup_from_task(current);
         |               ^
   kernel/cgroup/sli.c:405:32: error: 'root_mem_cgroup' undeclared (first use in this function); did you mean 'parent_mem_cgroup'?
     405 |         if (!memcg || memcg == root_mem_cgroup)
         |                                ^~~~~~~~~~~~~~~
         |                                parent_mem_cgroup
   kernel/cgroup/sli.c:405:32: note: each undeclared identifier is reported only once for each function it appears in
   kernel/cgroup/sli.c:408:21: error: invalid use of undefined type 'struct mem_cgroup'
     408 |         cgrp = memcg->css.cgroup;
         |                     ^~
   kernel/cgroup/sli.c: At top level:
   kernel/cgroup/sli.c:642:16: warning: no previous prototype for 'get_cgroup_from_task_id' [-Wmissing-prototypes]
     642 | struct cgroup *get_cgroup_from_task_id(struct task_struct *task, int event_nr)
         |                ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/cgroup/sli.c: In function 'get_cgroup_from_task_id':
>> kernel/cgroup/sli.c:647:14: error: 'cpuacct_cgrp_id' undeclared (first use in this function); did you mean 'cpu_cgrp_id'?
     647 |         id = cpuacct_cgrp_id;
         |              ^~~~~~~~~~~~~~~
         |              cpu_cgrp_id
   cc1: some warnings being treated as errors


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
