Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C12472617
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 21:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768252603; cv=none; b=VfPL17vm6s6fir+289F2cwR/JsLP2qVospCbOVtr361ihqh5DpSjuA1jJv2i0L7jc7YmOvbb5diJTedhmxPmpYewVpYftGbzaaRzNPNcD5GXQIAvSh34O8WTT92msqSV/vv+6cmbewqjNzOazFAtiHh7wNJdiZhP5wU56F6TBXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768252603; c=relaxed/simple;
	bh=cCt00/MsNcdbti0ZYO0e9eWgGifWhaqlWQvXsEhjwl8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qOSAz1v1FHv5kdz+OIxxVA/RVpwLo/3F3HpDc3TSDCZCHIQ2Xr3s9ev09aVfgTXHOl6dXUKLansuNLZ+8TVppk1fDE3PeunyvnLF7aUTulz2IKNMT+xKEfULIZvZASLsajTPkZ+jnZRgnk5+BBARnO93kBYokcF3ULUQy+3IF40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YuOsswDN; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YuOsswDN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768252602; x=1799788602;
  h=date:from:to:cc:subject:message-id;
  bh=cCt00/MsNcdbti0ZYO0e9eWgGifWhaqlWQvXsEhjwl8=;
  b=YuOsswDN2QntQ7/71zqQAOOoD1bCjJ3f2HUEAarBnuKEem/F2XKOk7to
   IR0HqHP5m5eWnnMaaF/lPlzJ0PgM2V0PBTJ2lQRQ//9KG71V+LMOgv4fe
   Wq26mFwUMOpsXXL8fpXu6b/WxxX405vNiqLfJLhu2iivY/r9r7b7VfG7V
   zuDee4Bm/fa3DOMRfWPQ9bj4ZjaUaU6gl0/7xwY2vlSV5oXVa4UJrqrq0
   MIBaiaYTB7HFaugyiuVjTlKB8i8FyOYG95DonHGaFRyVJmTPuXgBevXd5
   JUpMMcIsib5px09vrxgqVdZMlBA7nreXK1cGH4LuoYjcHID0mjT5emVWP
   g==;
X-CSE-ConnectionGUID: mtfKX+FLRT+bWOuMhSXhPg==
X-CSE-MsgGUID: yu+/CmndQeutdrDWYZKcew==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68742331"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="68742331"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 13:16:42 -0800
X-CSE-ConnectionGUID: 42ahzLe1SWeufhlosGrRdw==
X-CSE-MsgGUID: XBs35KMLRimDNwDsSq9Evg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204285547"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 12 Jan 2026 13:16:40 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfPHB-000000000z3-1IVk;
	Mon, 12 Jan 2026 21:16:37 +0000
Date: Mon, 12 Jan 2026 22:16:07 +0100
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v6 1/9]
 drivers/base/node.c:1166:9: error: 'private_nodes' undeclared; did you mean
 'private_node_ops'?
Message-ID: <202601122238.L4rkYwhl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v6
head:   75ba13ddb1f86035a0a20a211670b7a2dceb852c
commit: fd93f242d5311a329afa0689b3e1d0e2d1e71560 [1/9] numa,memory_hotplug: create N_PRIVATE (Private Nodes)
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260112/202601122238.L4rkYwhl-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122238.L4rkYwhl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601122238.L4rkYwhl-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/base/node.c: In function 'node_dev_init':
>> drivers/base/node.c:1166:9: error: 'private_nodes' undeclared (first use in this function); did you mean 'private_node_ops'?
    1166 |         private_nodes = kzalloc(sizeof(enum private_memtype) * MAX_NUMNODES,
         |         ^~~~~~~~~~~~~
         |         private_node_ops
   drivers/base/node.c:1166:9: note: each undeclared identifier is reported only once for each function it appears in
   drivers/base/node.c:1173:33: error: 'private_node_ops_list' undeclared (first use in this function); did you mean 'private_node_ops'?
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
  1173			INIT_LIST_HEAD(&private_node_ops_list[i]);
> 1174		private_node_ops_initialized = true;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
