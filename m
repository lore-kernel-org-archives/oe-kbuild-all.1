Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A3E2FB093
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 19:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765655601; cv=none; b=YMFCO5I+8CVvX2G0MKMW7ou0IFOpZeaadqWEYJ7GTXGtEa0phGvhU25cdQtPZhsvVIiqwc7CQUm86nmVTVLPKsgkf+Pcx/oZfwz1VKzfvCQb5Z2lEsv5MoT0spKBoWp0aBtozAgO++OQz+EJ50HVQEh5td+CSJWIYnQ65jARvtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765655601; c=relaxed/simple;
	bh=QNlZixQqBbuurPXbid54SXjkxf6bQrgaEmJRM1c4CQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RuWbtLXmHoIWsr//iKsbK8e6FZZneZv/bMs5ev5puvFejat+JkER8UGGEGyaN647KpwWdyFBBh9z+QjxvAMEvBaNZTBTdF6SGElMKySzGx0VG4KRdqVENXk4BTeKoddByz4W+9BVkUdlnuUSB0JkS9F4rLgScS/wcFoRnp2e8qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIowHUJi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIowHUJi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765655600; x=1797191600;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QNlZixQqBbuurPXbid54SXjkxf6bQrgaEmJRM1c4CQY=;
  b=EIowHUJikDZIwB+Q7RZl4VM5kCqAZSG9CeZubJfsFx0/gz4ggq5JgfA9
   Z+J3+gIy8ZBaC9TgqNouxKdETPPNtBgcoWBkircMfNo/0DkdE1tbouC0C
   VFSV07I0QCQboqZJ6+FGO6gUyo1euP3aIPwzAGB4ZtCSF6ZLR03hpxhDV
   z3N3cMeOW3AbIFPp/tUCMFZfCHu22rmDMGE0F1Uiy+O8qml1k+ZDvUA/E
   y4iM/gPLZS0lNzGrM9taoJlrs5F23Sih8uBF/WrJy4R6/KagzkQuOEOVr
   A7MSa/dGOel9LH9h0Rlkv7Gd32PiisaVx7BkF4cO2QrGr+87xgpC4mGC+
   Q==;
X-CSE-ConnectionGUID: fqsOPPm3QPGhY4jRlrYycg==
X-CSE-MsgGUID: 4MYs8FpoQESo9Zl19Uuoww==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="79076637"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="79076637"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 11:53:17 -0800
X-CSE-ConnectionGUID: nVOJj44nQ4mNOEFqjsozag==
X-CSE-MsgGUID: E9PJ3RJvQ8q2o/VCIKWkiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="196979703"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 13 Dec 2025 11:53:15 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUVg1-0000000088P-1kNS;
	Sat, 13 Dec 2025 19:53:13 +0000
Date: Sun, 14 Dec 2025 03:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1942/1942] drivers/base/node.c:480:
 warning: Function parameter or member 'cpu_nid' not described in
 'register_memory_node_under_compute_node'
Message-ID: <202512140305.nS3EGEEx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5a399b91821faeec2466751db2d714b24f8eb17c
commit: 9e8e325cfd089c66c9a2f570f99021a62bf0ae09 [1942/1942] node: Link memory nodes to their compute nodes
config: arm64-randconfig-002-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140305.nS3EGEEx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140305.nS3EGEEx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140305.nS3EGEEx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/node.c:568:5: warning: no previous prototype for 'register_mem_block_under_node_early' [-Wmissing-prototypes]
     568 | int register_mem_block_under_node_early(struct memory_block *mem_blk, void *arg)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/base/node.c:480: warning: Function parameter or member 'mem_nid' not described in 'register_memory_node_under_compute_node'
>> drivers/base/node.c:480: warning: Function parameter or member 'cpu_nid' not described in 'register_memory_node_under_compute_node'
>> drivers/base/node.c:480: warning: Excess function parameter 'mem_node' description in 'register_memory_node_under_compute_node'
>> drivers/base/node.c:480: warning: Excess function parameter 'cpu_node' description in 'register_memory_node_under_compute_node'


vim +480 drivers/base/node.c

   463	
   464	/**
   465	 * register_memory_node_under_compute_node - link memory node to its compute
   466	 *					     node for a given access class.
   467	 * @mem_node:	Memory node number
   468	 * @cpu_node:	Cpu  node number
   469	 * @access:	Access class to register
   470	 *
   471	 * Description:
   472	 * 	For use with platforms that may have separate memory and compute nodes.
   473	 * 	This function will export node relationships linking which memory
   474	 * 	initiator nodes can access memory targets at a given ranked access
   475	 * 	class.
   476	 */
   477	int register_memory_node_under_compute_node(unsigned int mem_nid,
   478						    unsigned int cpu_nid,
   479						    unsigned access)
 > 480	{
   481		struct node *init_node, *targ_node;
   482		struct node_access_nodes *initiator, *target;
   483		int ret;
   484	
   485		if (!node_online(cpu_nid) || !node_online(mem_nid))
   486			return -ENODEV;
   487	
   488		init_node = node_devices[cpu_nid];
   489		targ_node = node_devices[mem_nid];
   490		initiator = node_init_node_access(init_node, access);
   491		target = node_init_node_access(targ_node, access);
   492		if (!initiator || !target)
   493			return -ENOMEM;
   494	
   495		ret = sysfs_add_link_to_group(&initiator->dev.kobj, "targets",
   496					      &targ_node->dev.kobj,
   497					      dev_name(&targ_node->dev));
   498		if (ret)
   499			return ret;
   500	
   501		ret = sysfs_add_link_to_group(&target->dev.kobj, "initiators",
   502					      &init_node->dev.kobj,
   503					      dev_name(&init_node->dev));
   504		if (ret)
   505			goto err;
   506	
   507		return 0;
   508	 err:
   509		sysfs_remove_link_from_group(&initiator->dev.kobj, "targets",
   510					     dev_name(&targ_node->dev));
   511		return ret;
   512	}
   513	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
