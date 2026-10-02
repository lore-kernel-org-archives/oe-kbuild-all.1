Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501B53438BA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 12:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942639; cv=none; b=ny2Oodc8mI4Xr8MovaQIPz5fQtY6ieON7HSBWzr3uef57QToaKLX1ua96xv348Y+EtH67IEJ1Gyw+nOxiX/PSJCxNXmD2DYV6cGF2qy13fVnBu6k+jc93n/8U8TeKdcYBpgAu1LSZzZj0a2sXCnouNK9ejqwJUENYfsaSrb6h+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942639; c=relaxed/simple;
	bh=buYY1SIHWXR5svsGQniBOwTmoYuwY0aRb4NctFwW5/Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tOa6mVjseV7W7GF67RyE4lfkBfkrBMdN3P1toSMCrcXU5HSzDysESr9b4A0nJ/lZ8H1EHbawFAKYB+WZkPoC3utyJNI97SNSbJNmTuh/OVmBY+7GJ+LUoCYDlWi9PbYgpP0NB6+wiY72gXkhTxptT7g5Rqy7yQUAR/5h8++gOqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MPO0Bzwo; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MPO0Bzwo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790942636; x=1822478636;
  h=date:from:to:cc:subject:message-id;
  bh=buYY1SIHWXR5svsGQniBOwTmoYuwY0aRb4NctFwW5/Q=;
  b=MPO0BzwoadY65YHpfwoN/hKZmlMmW+3KZoyKTQHa4Dj3caSo2cj+Cevr
   UQxW4q040yWEY+IAhpH58Qj87ERRVskW8vGMUVI/+VHrKHFRSKcy26bAc
   ArhzTJH4VDY4LkPYdJCE6w7rIl5NPQEMLhVJDfMifvwV/5KmTyzqg/MVG
   i7n9RcNPyMQrwMEwCG+TLJIEdM0+4EJX8BBQ/ow1+V0nJcB8QAeh0M8TC
   5uWGsL6GeQgJtH5bROUOCHh5SqBlxql3n4G0AN+xFZPTSD/SplJSyZbGX
   qEWammeg3TP3C3Pi0ZhshluYn5v2MEGXdoCPW1bRGcQLSNO1tN6xXm4JY
   w==;
X-CSE-ConnectionGUID: U5Xedi3KSXGdP5F00vdzTQ==
X-CSE-MsgGUID: p2I72YURQi6BT6KAqQCkHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94194729"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="94194729"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 05:03:56 -0700
X-CSE-ConnectionGUID: VoJxh1JnQbaCiYw8lFlCOw==
X-CSE-MsgGUID: ZGp4S3zCT1qhmgbb1apO0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="279514734"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 02 Oct 2026 05:03:54 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCbzT-000000000WZ-3kva;
	Fri, 02 Oct 2026 12:03:51 +0000
Date: Fri, 02 Oct 2026 14:03:31 +0200
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 69/87]
 drivers/hwtracing/gtrace/gtrace-core.c:590:10: error: call to undeclared
 function 'kzalloc_obj'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202610021442.SFwk0lIK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: e66280cd072805f1d20509bf41ea75382a4c1fc6 [69/87] gtrace: Add functions to create/destroy a trace component path
config: i386-randconfig-r2304-20261002 (https://download.01.org/0day-ci/archive/20261002/202610021442.SFwk0lIK-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021442.SFwk0lIK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021442.SFwk0lIK-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c:372:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     372 |         kfree(cpriv);
         |         ^
   drivers/hwtracing/gtrace/gtrace-core.c:416:10: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     416 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |                 ^
   drivers/hwtracing/gtrace/gtrace-core.c:416:8: error: incompatible integer to pointer conversion assigning to 'struct gtrace_comp_priv *' from 'int' [-Wint-conversion]
     416 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |               ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:426:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     426 |                 kfree(cpriv);
         |                 ^
>> drivers/hwtracing/gtrace/gtrace-core.c:590:10: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     590 |                 node = kzalloc_obj(*node);
         |                        ^
>> drivers/hwtracing/gtrace/gtrace-core.c:590:8: error: incompatible integer to pointer conversion assigning to 'struct gtrace_path_node *' from 'int' [-Wint-conversion]
     590 |                 node = kzalloc_obj(*node);
         |                      ^ ~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:610:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     610 |                 kfree(node);
         |                 ^
   drivers/hwtracing/gtrace/gtrace-core.c:627:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     627 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |                ^
>> drivers/hwtracing/gtrace/gtrace-core.c:627:7: error: incompatible integer to pointer conversion assigning to 'struct gtrace_path *' from 'int' [-Wint-conversion]
     627 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:661:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     661 |         kfree(path);
         |         ^
   drivers/hwtracing/gtrace/gtrace-core.c:671:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     671 |         kfree(path);
         |         ^
   11 errors generated.


vim +/kzalloc_obj +590 drivers/hwtracing/gtrace/gtrace-core.c

   576	
   577	static int build_path_walk_fn(struct gtrace_component *comp, bool *stop,
   578				      struct gtrace_connection *stop_conn,
   579				      void *priv)
   580	{
   581		struct build_path_walk_priv *ppriv = priv;
   582		struct gtrace_path *path = ppriv->path;
   583		struct gtrace_path_node *node;
   584	
   585		if ((!ppriv->sink && gtrace_is_sink(comp->pdata)) ||
   586		    (ppriv->sink && ppriv->sink == comp))
   587			*stop = true;
   588	
   589		if (*stop) {
 > 590			node = kzalloc_obj(*node);
   591			if (!node)
   592				return -ENOMEM;
   593			INIT_LIST_HEAD(&node->head);
   594			gtrace_get_component(comp);
   595			node->comp = comp;
   596			node->conn = stop_conn;
   597			list_add(&node->head, &path->comp_list);
   598		}
   599	
   600		return 0;
   601	}
   602	
   603	static void gtrace_release_path_nodes(struct gtrace_path *path)
   604	{
   605		struct gtrace_path_node *node, *node1;
   606	
   607		list_for_each_entry_safe(node, node1, &path->comp_list, head) {
   608			list_del(&node->head);
   609			gtrace_put_component(node->comp);
   610			kfree(node);
   611		}
   612	}
   613	
   614	struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
   615					       struct gtrace_component *sink,
   616					       enum gtrace_component_mode mode)
   617	{
   618		struct build_path_walk_priv priv;
   619		struct gtrace_path *path;
   620		int ret = 0;
   621	
   622		if (!source || mode >= GTRACE_COMPONENT_MODE_MAX) {
   623			ret = -EINVAL;
   624			goto err_out;
   625		}
   626	
 > 627		path = kzalloc(sizeof(*path), GFP_KERNEL);
   628		if (!path) {
   629			ret = -ENOMEM;
   630			goto err_out;
   631		}
   632		INIT_LIST_HEAD(&path->comp_list);
   633		path->mode = mode;
   634		path->trace_id = GTRACE_INVALID_TRACE_ID;
   635	
   636		priv.path = path;
   637		priv.sink = sink;
   638		ret = gtrace_walk_output_components(source, &priv, build_path_walk_fn);
   639		if (ret < 0)
   640			goto err_release_path_nodes;
   641	
   642		/* Before proceeding, check that a valid path was built. */
   643		if (list_empty(&path->comp_list)) {
   644			ret = -ENODEV;
   645			goto err_release_path_nodes;
   646		}
   647	
   648		if (!gtrace_path_ready(path)) {
   649			ret = -EOPNOTSUPP;
   650			goto err_release_path_nodes;
   651		}
   652	
   653		ret = gtrace_assign_trace_id(path);
   654		if (ret < 0)
   655			goto err_release_path_nodes;
   656	
   657		return path;
   658	
   659	err_release_path_nodes:
   660		gtrace_release_path_nodes(path);
   661		kfree(path);
   662	err_out:
   663		return ERR_PTR(ret);
   664	}
   665	EXPORT_SYMBOL_GPL(gtrace_create_path);
   666	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
