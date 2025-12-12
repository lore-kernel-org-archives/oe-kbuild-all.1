Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795A92797AC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 19:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765567346; cv=none; b=tzjMHi82DjAsjN4NjSaXMWkY+sFyfPFf/i7A7kvty8DxMmrmGE/8jFK6QYJ+QzuIVqgLl6KCEFhk7nJAoEAvivTPm1JDFIjIB9GU8Ul5jKt60aQQUkFYRRE9KTqiMHB1vlVWB2qUiBRtJFYVUG0kf4yNILIubeKUarR05/vsjtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765567346; c=relaxed/simple;
	bh=EuSt1Lu6i5knD3JIGX1JsffFueHhuPzUoCBsbS2Q6e4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bF+7HEyyn3VjcQUfSwI/KSMm5slaeB1zzjalAzOXet7W0XGFG5Y08Mp2xHJjM3s9let9Y5o3uhGqBSJy+JlsBzpzKm46Evg5w4Ltp1uljWJUUXb5le8hcW48t4H5oxd7v0yalLZgNOj25zriDHzeIjgHSrGapqRmwu/l53DBwkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXV0S3zU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXV0S3zU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765567345; x=1797103345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EuSt1Lu6i5knD3JIGX1JsffFueHhuPzUoCBsbS2Q6e4=;
  b=hXV0S3zUJvrsonScKGfqu0DCc79AcXTVnWP0dy8MwafatcjfPvJHn/rQ
   2gZ9iDDPrZ/yqnbKKdDiuKSVTTBUq+mdTJj1PjjbsYFHVMonJ2S4kETpQ
   H4qDbfKfhpyvmxcC2DPEPHdo05Qv4m933XphJTCeUeuGpHSMWMo3dF6Vo
   xQcNxgqwsLZU28xsjrt3U2S08+3bL3QRU+xXtljI47DGhXEEGjzh3UEqE
   C6GGUwnMWwwb5jYf4Tj8bGYfRkESuGnAr77b5CTwpUV9XuJ40DWhoNYms
   bb5YfnwFOk9HYxdzQUMYNVyqS/JlzWSgW0yTB2cRYsvrd4oAaFQKht+d/
   Q==;
X-CSE-ConnectionGUID: oYWChw1KTxC0uYjdWm7buA==
X-CSE-MsgGUID: 9BQDlSbKR6KGgTC0BOAHnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="79032446"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="79032446"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 11:22:25 -0800
X-CSE-ConnectionGUID: FYNrTEmoSruOhXaJvz/xxw==
X-CSE-MsgGUID: Y4LSvpdIQiyL4SOzMiYCMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="197062029"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Dec 2025 11:22:23 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU8ia-000000006Vx-36v2;
	Fri, 12 Dec 2025 19:22:20 +0000
Date: Sat, 13 Dec 2025 03:22:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1941/1941] drivers/base/node.c:480:
 warning: Function parameter or member 'mem_nid' not described in
 'register_memory_node_under_compute_node'
Message-ID: <202512130318.QHdKVAVx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df8d11fbcbb07177c2500e63d7f5a36063977596
commit: 9e8e325cfd089c66c9a2f570f99021a62bf0ae09 [1941/1941] node: Link memory nodes to their compute nodes
config: x86_64-randconfig-103-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130318.QHdKVAVx-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130318.QHdKVAVx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130318.QHdKVAVx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   1 warning generated.
>> drivers/base/node.c:480: warning: Function parameter or member 'mem_nid' not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:480: warning: Function parameter or member 'cpu_nid' not described in 'register_memory_node_under_compute_node'
   drivers/base/node.c:480: warning: Excess function parameter 'mem_node' description in 'register_memory_node_under_compute_node'
   drivers/base/node.c:480: warning: Excess function parameter 'cpu_node' description in 'register_memory_node_under_compute_node'


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
