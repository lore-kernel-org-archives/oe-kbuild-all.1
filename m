Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329B258120
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JxSF2MgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705008059; x=1736544059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f2Fe0URilhBq3Tu9azzGhPRDfWOOy/AEvWWGLt7grP8=;
  b=JxSF2MgJutigkv7hrTr7KTNOuKmeT5EDRXK/pidj7cKCre+bo7bRD3DZ
   xjqowIpkxzm7EUGkln4g4qP81Dmn4dgdUkZCBGYcpFjIlNvhZo8nbKxXi
   v5Dirvnw/GbQVtQ1NqKPZDQnyLmWbWAXU7/qeQ/pKfJG0wC1ipwyDhh7C
   d6aUvDBSV1Ya6rKOjzmtFYTJu3uJOcZN1YzP6X1cg5jjgv77OZ2yuy+as
   HXEVOphaZnxSlnmkVwtyuAa2sciK40eqVzDW1J0mSg0j94YGfKoCAmH89
   DzA7/74HByep+K9ERfdap/AsSxwEvNWGB7Kqn5w0bWFVMh6OeeDdCCTOJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="6354586"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="6354586"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 13:20:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="873156986"
X-IronPort-AV: E=Sophos;i="6.04,187,1695711600"; 
   d="scan'208";a="873156986"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2024 13:20:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO2Tv-0008kh-1O;
	Thu, 11 Jan 2024 21:20:55 +0000
Date: Fri, 12 Jan 2024 05:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2271/2356] kernel/sched/psi.c:908:52: error:
 'cpuacct_cgrp_id' undeclared; did you mean 'cpu_cgrp_id'?
Message-ID: <202401120554.MrkUMPFZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: 2dfc29e742a07863c2426aea03d5c2c97b558b9d [2271/2356] sched/psi: Export cgroup psi from cgroupv2 to cgroupv1
config: x86_64-randconfig-011-20240111 (https://download.01.org/0day-ci/archive/20240112/202401120554.MrkUMPFZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120554.MrkUMPFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120554.MrkUMPFZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/psi.c: In function 'task_psi_group':
>> kernel/sched/psi.c:908:52: error: 'cpuacct_cgrp_id' undeclared (first use in this function); did you mean 'cpu_cgrp_id'?
     908 |                         cgroup = task_cgroup(task, cpuacct_cgrp_id);
         |                                                    ^~~~~~~~~~~~~~~
         |                                                    cpu_cgrp_id
   kernel/sched/psi.c:908:52: note: each undeclared identifier is reported only once for each function it appears in


vim +908 kernel/sched/psi.c

   899	
   900	static inline struct psi_group *task_psi_group(struct task_struct *task)
   901	{
   902	#ifdef CONFIG_CGROUPS
   903		if (static_branch_likely(&psi_cgroups_enabled)) {
   904			if (task_is_in_psi_v1()) {
   905				struct cgroup *cgroup;
   906	
   907				rcu_read_lock();
 > 908				cgroup = task_cgroup(task, cpuacct_cgrp_id);
   909				rcu_read_unlock();
   910				return cgroup_psi(cgroup);
   911			}
   912			return cgroup_psi(task_dfl_cgroup(task));
   913		}
   914	#endif
   915		return &psi_system;
   916	}
   917	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
