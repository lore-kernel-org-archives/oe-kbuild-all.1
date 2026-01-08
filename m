Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDF5486944
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 12:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876226; cv=none; b=N9sjL4VI2uqTlvXH+33zNStVFm+NlNK2Jnzmxtso89NTwjpaafmsPt0n2h6mlcPWtSPmjvWMDHmFVTU8fPJiTL+F9nooaM2sifm3i8VcAIf+dxjQLLFtTVOL2kKCAIxBWDB+fIDsiAG9YkFT7mreQC6iRHoxtA1AbTtIXfQLGOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876226; c=relaxed/simple;
	bh=1h0QpDQghAQ/mwoEDSx/tmC99Nd+e8Je0lH+4Mg41SE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HfJ30+OKm9k6SafGY6HRZhyy9ayT16L+EtUXlw2T8Fa0K3F2uZQr2ffHe0V3on4lg0JEa2o4KnkOsC9w5LpZff80OR3mS44/9f13RTFISWfHGqw1tHQ6Zi7l3Rq2d2nAfpURZd6bKNUlf+jMUbkN0W3U2P5DLyhzfdwzqW5IEYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z+4mTS8j; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z+4mTS8j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767876224; x=1799412224;
  h=date:from:to:cc:subject:message-id;
  bh=1h0QpDQghAQ/mwoEDSx/tmC99Nd+e8Je0lH+4Mg41SE=;
  b=Z+4mTS8jH6HrqARfg+/CXbjYPbg3H9lszbBz0raHGd205tmvxBxiWORr
   VlaDo9ykMSSITBoRR4QSUOQrXP7mKVpbXj20QzYvu0QXMDvcI2nm3wY+m
   B/hLIj2ZYO/0SHlvx5z3FjNUFE+gjE22pK0ula60EuKOV52OLNlW8qYtm
   GpBKVTFUxkMewzn/1aCEjEnmrakFeGyLO6dw+fa+ElzkwFaPE+qv52NdY
   ORUEb2RU+N5oyuGuZZDhN0mPcbIMp0xnS5HAoQ30/TCKBP6LZc84teg/M
   2IYoTOjNyYbN4l01ZCUMeeJRVnziYXz4p4LI9+6LU9Tb62YgdcAmhLRuP
   Q==;
X-CSE-ConnectionGUID: jIyoz7wBRRaTepTbHoQ4xw==
X-CSE-MsgGUID: m9jB0XPSRD+JcV+nz54axw==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68985921"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="68985921"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 04:43:44 -0800
X-CSE-ConnectionGUID: 64canayjS4O4VT4mXuq2NA==
X-CSE-MsgGUID: 8bL58ATHSEuDAkhnBdORCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="208261463"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Jan 2026 04:43:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdpMZ-000000004hw-32dS;
	Thu, 08 Jan 2026 12:43:39 +0000
Date: Thu, 08 Jan 2026 20:42:39 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v6 1/9]
 drivers/base/node.c:1166:9: error: 'private_nodes' undeclared; did you mean
 'private_node_ops'?
Message-ID: <202601082041.XkPoGlcD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v6
head:   75ba13ddb1f86035a0a20a211670b7a2dceb852c
commit: fd93f242d5311a329afa0689b3e1d0e2d1e71560 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260108/202601082041.XkPoGlcD-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601082041.XkPoGlcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601082041.XkPoGlcD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/node.c: In function 'node_dev_init':
>> drivers/base/node.c:1166:9: error: 'private_nodes' undeclared (first use in this function); did you mean 'private_node_ops'?
    1166 |         private_nodes = kzalloc(sizeof(enum private_memtype) * MAX_NUMNODES,
         |         ^~~~~~~~~~~~~
         |         private_node_ops
   drivers/base/node.c:1166:9: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/base/node.c:1173:33: error: 'private_node_ops_list' undeclared (first use in this function); did you mean 'private_node_ops'?
    1173 |                 INIT_LIST_HEAD(&private_node_ops_list[i]);
         |                                 ^~~~~~~~~~~~~~~~~~~~~
         |                                 private_node_ops
>> drivers/base/node.c:1174:9: error: 'private_node_ops_initialized' undeclared (first use in this function)
    1174 |         private_node_ops_initialized = true;
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1166 drivers/base/node.c

  1144	
  1145	void __init node_dev_init(void)
  1146	{
  1147		int ret, i;
  1148	
  1149	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attr) != NR_NODE_STATES);
  1150	 	BUILD_BUG_ON(ARRAY_SIZE(node_state_attrs)-1 != NR_NODE_STATES);
  1151	
  1152		ret = subsys_system_register(&node_subsys, cpu_root_attr_groups);
  1153		if (ret)
  1154			panic("%s() failed to register subsystem: %d\n", __func__, ret);
  1155	
  1156		/*
  1157		 * Create all node devices, which will properly link the node
  1158		 * to already created cpu devices.
  1159		 */
  1160		for_each_online_node(i) {
  1161			ret =  register_node(i);
  1162			if (ret)
  1163				panic("%s() failed to add node: %d\n", __func__, ret);
  1164		}
  1165	
> 1166		private_nodes = kzalloc(sizeof(enum private_memtype) * MAX_NUMNODES,
  1167					GFP_KERNEL);
  1168		if (!private_nodes)
  1169			pr_warn("Failed to allocate private_nodes, private node support disabled\n");
  1170	
  1171		/* Initialize private node ops lists */
  1172		for (i = 0; i < MAX_NUMNODES; i++)
> 1173			INIT_LIST_HEAD(&private_node_ops_list[i]);
> 1174		private_node_ops_initialized = true;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
