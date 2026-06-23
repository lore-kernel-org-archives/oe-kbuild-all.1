Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B67E31D74B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 05:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782190927; cv=none; b=INHnaT/x6Tjb2wHeiTB1nXJ6Mkxv2aXCuPgKIOg6yIsgQD1hdyzn4qXtHs+olsuFKaqJqN9a2q00obhTKCL8Mpw53BagmGACjdgb289r5SM4mtutZWmlH0rfRz60f32aQlAeEjJcB48TARDcbWemmRk/xpFiy+d0yaJI5nwqaXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782190927; c=relaxed/simple;
	bh=rJxQK7Zk3Ua5nxCG3qV/dr1QqZnDTjJpLWxAOBcdJ3g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Zj4WOpXkK0fu52JeQOTDYIwh0AZvMW6oTbNIT4tF/Qje9W4OfbUsutQQ52DUlvlED9oMuEbZgL7fHguWDpwDHTfiXUrAc9QoCA23hwxH1MqomL3TA0T4MmTjenVvk2YYg2d9CGdIrkM99AI9OqKVDmgK1XdZTCsqLSJqvx1AtJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lyazb4jn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lyazb4jn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782190927; x=1813726927;
  h=date:from:to:cc:subject:message-id;
  bh=rJxQK7Zk3Ua5nxCG3qV/dr1QqZnDTjJpLWxAOBcdJ3g=;
  b=Lyazb4jnNGi6IMYxMCDZsoc1nWizSP4vG1fuU8hp5iKDijnXu0ocPTsh
   CMGEq4OsnPPwqBuIGvb7V4gm1YAbAzOT7LsKXt0DQDpLwTEiiV5OtM+77
   vJ2SDFxXZgOLH8E06Yh9jI3pLSt2sqiA22u/6Dm1IylC/pYtSi44Ak8pM
   4OJ/CRMLaztxzi6gkpkbooUXR5DtLgBOXdu1wlbMtxN6jQCyxb5xYxpUN
   h/6uyQKdSjfZ4szaYZjjUdTsrb/q5NzvucwlLrOAo2BF+bVg5NVobNrVv
   X3fH6/YeGUDPAEnzAz+ueSlKJIqC+vSMngqTtdOLyLYSSGiatQkZYalL8
   A==;
X-CSE-ConnectionGUID: LxxFZcD4QvWU81oY27tM9Q==
X-CSE-MsgGUID: bhj63WQPQ1aUey92aHLITA==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="100353314"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="100353314"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 22:02:04 -0700
X-CSE-ConnectionGUID: I+ZIwSgxSbi12NunpstR6A==
X-CSE-MsgGUID: RkjzUjcRQaiI/DQU1dVB/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="273471604"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 22:02:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbtGq-000000002GH-0qcT;
	Tue, 23 Jun 2026 05:02:00 +0000
Date: Tue, 23 Jun 2026 13:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 26/26]
 drivers/nvme/target/bpf_ops.c:104:59: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202606231257.AlAit6EU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   22642e5d1c63efa6b484188105d45886f637d2be
commit: 22642e5d1c63efa6b484188105d45886f637d2be [26/26] Switch to net namespaces
config: riscv-randconfig-r121-20260623 (https://download.01.org/0day-ci/archive/20260623/202606231257.AlAit6EU-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231257.AlAit6EU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606231257.AlAit6EU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/target/bpf_ops.c:104:59: sparse: sparse: Using plain integer as NULL pointer
   drivers/nvme/target/bpf_ops.c:110:33: sparse: sparse: restricted __le16 degrades to integer

vim +104 drivers/nvme/target/bpf_ops.c

95eeb6714114cd Hannes Reinecke 2025-07-28   97  
95eeb6714114cd Hannes Reinecke 2025-07-28   98  static int nvmet_bpf_reg(void *kdata, struct bpf_link *link)
95eeb6714114cd Hannes Reinecke 2025-07-28   99  {
95eeb6714114cd Hannes Reinecke 2025-07-28  100  	struct nvmet_bpf_ops *ops = kdata;
95eeb6714114cd Hannes Reinecke 2025-07-28  101  	struct nvmet_port *p, *port = NULL;
95eeb6714114cd Hannes Reinecke 2025-07-28  102  	struct nvmet_subsys_link *s;
65843faa046b6a Hannes Reinecke 2026-06-12  103  	/* This is wrong :-( */
65843faa046b6a Hannes Reinecke 2026-06-12 @104  	struct list_head *port_list = nvmet_get_port_list(0);
95eeb6714114cd Hannes Reinecke 2025-07-28  105  
95eeb6714114cd Hannes Reinecke 2025-07-28  106  	pr_debug("%s: register %s port id %d\n",
95eeb6714114cd Hannes Reinecke 2025-07-28  107  		 __func__, ops->subsysnqn, ops->portid);
95eeb6714114cd Hannes Reinecke 2025-07-28  108  
65843faa046b6a Hannes Reinecke 2026-06-12  109  	list_for_each_entry(p, port_list, global_entry) {
95eeb6714114cd Hannes Reinecke 2025-07-28  110  		if (p->disc_addr.portid == ops->portid) {
95eeb6714114cd Hannes Reinecke 2025-07-28  111  			port = p;
95eeb6714114cd Hannes Reinecke 2025-07-28  112  			break;
95eeb6714114cd Hannes Reinecke 2025-07-28  113  		}
95eeb6714114cd Hannes Reinecke 2025-07-28  114  	}
95eeb6714114cd Hannes Reinecke 2025-07-28  115  	if (!port)
95eeb6714114cd Hannes Reinecke 2025-07-28  116  		return -EINVAL;
95eeb6714114cd Hannes Reinecke 2025-07-28  117  
95eeb6714114cd Hannes Reinecke 2025-07-28  118  	down_write(&nvmet_config_sem);
95eeb6714114cd Hannes Reinecke 2025-07-28  119  	list_for_each_entry(s, &port->subsystems, entry) {
95eeb6714114cd Hannes Reinecke 2025-07-28  120  		if (!strncmp(s->subsys->subsysnqn, ops->subsysnqn,
95eeb6714114cd Hannes Reinecke 2025-07-28  121  			     NVMF_NQN_SIZE)) {
95eeb6714114cd Hannes Reinecke 2025-07-28  122  			s->bpf_ops = ops;
95eeb6714114cd Hannes Reinecke 2025-07-28  123  			ops->subsys_link = s;
95eeb6714114cd Hannes Reinecke 2025-07-28  124  			break;
95eeb6714114cd Hannes Reinecke 2025-07-28  125  		}
95eeb6714114cd Hannes Reinecke 2025-07-28  126  	}
95eeb6714114cd Hannes Reinecke 2025-07-28  127  	up_write(&nvmet_config_sem);
95eeb6714114cd Hannes Reinecke 2025-07-28  128  	if (ops->subsys_link) {
95eeb6714114cd Hannes Reinecke 2025-07-28  129  		pr_debug("%s: attached %pUb to %s\n",
95eeb6714114cd Hannes Reinecke 2025-07-28  130  			 __func__, &ops->uuid,
95eeb6714114cd Hannes Reinecke 2025-07-28  131  			 ops->subsys_link->subsys->serial);
95eeb6714114cd Hannes Reinecke 2025-07-28  132  		/* Raise a discovery log page changed AEN if log page is present */
95eeb6714114cd Hannes Reinecke 2025-07-28  133  		if (ops->log_page_supported(ops, NVME_LOG_DISC))
95eeb6714114cd Hannes Reinecke 2025-07-28  134  			nvmet_port_disc_changed(port, ops->subsys_link->subsys);
95eeb6714114cd Hannes Reinecke 2025-07-28  135  	}
95eeb6714114cd Hannes Reinecke 2025-07-28  136  	return ops->subsys_link ? 0 : -EINVAL;
95eeb6714114cd Hannes Reinecke 2025-07-28  137  }
95eeb6714114cd Hannes Reinecke 2025-07-28  138  

:::::: The code at line 104 was first introduced by commit
:::::: 65843faa046b6a3ff4953aba7319313104638535 nvmet: make configfs setup namespace aware

:::::: TO: Hannes Reinecke <hare@kernel.org>
:::::: CC: Hannes Reinecke <hare@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
