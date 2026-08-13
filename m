Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C77380FE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 04:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786594376; cv=none; b=MtXQfcXWVZfatATEoZAP5VTvynPIh1NDJE04LLBnXQT1eV12wVb+BfeOXcyC8wbX4RjDMV5UIZCv/rpOwu4XBxfdLtfDhZsyHLNQxOZ7jNT/8T8Ecab19++Wqd/LYJHPVVskN6GanaXJVbzbsUnIcGSwItTK4FeaVLhKUCwWVo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786594376; c=relaxed/simple;
	bh=4ccu5pVVd1OI1aUS5wQEkwozlqTohx6OpgwzYigsQVM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q6PgtuUcM8JraVX2NSVP8sZBLjB16g+1a67YIMza+jJjrQghv4PFAgkaYvgV8MxGYFz3FNTSkD0bsgoFs14ZcJFIpfORKoQHJL/aSVtUeeYp8r994CR1K8gDGPEUCrZ6CYR69rLoipl0KprZaw//w62AZzRuTkWxIRtp5DGVknI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kehJG/xc; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kehJG/xc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786594374; x=1818130374;
  h=date:from:to:cc:subject:message-id;
  bh=4ccu5pVVd1OI1aUS5wQEkwozlqTohx6OpgwzYigsQVM=;
  b=kehJG/xcu3a2gI9HQZbAv5jh+izEA88rUEotKbT/hixmdnRFED4I1yFs
   +DYVCMm3D+C2a/LbQW0fPSatEchbp4rH69lv8zha38SMCJW3hxIIyt2kk
   qJGYjMKJWkL+wxcDLHUySyWHbpOUy8M8DysNUCiJSpLmfFM6qiQiPyGVF
   9+uf876DKpsiQkwAfzr3j7+3LqDbW9snCmUh8Syia0JPQDqe5tNaHUXBG
   ckvqhHmNkHYVN49GRbPkiKUtiZ3CLcoO0Xtol6TeM9OfwAIl9JSCmJlcq
   qB364M3WA0nYhkfIkR+SgB2MgYhr15ByWqZ8vx26CvqD4tWfDKeKya+lk
   g==;
X-CSE-ConnectionGUID: Ickc2PtXTn+hUg+Aajkgeg==
X-CSE-MsgGUID: v/heUfy0Qe632Mzf/5yzpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="112704395"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="112704395"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 21:12:51 -0700
X-CSE-ConnectionGUID: A54/XbZ4RKSDhQr0z1Q1BA==
X-CSE-MsgGUID: rath1lENTkCR+7DUeLuJ4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="260008498"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2026 21:12:50 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuMoB-00000000Sls-4Bjv;
	Thu, 13 Aug 2026 04:12:47 +0000
Date: Thu, 13 Aug 2026 12:12:30 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 94/112]
 drivers/hwtracing/gtrace/gtrace-core.c:561:10: error: call to undeclared
 function 'kzalloc_obj'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608131205.sppv2u7u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   04c254020ba99b7f6db9ab6c87ed4cb4a688ba9a
commit: c8b928f098710cd4a1cf5604883f2f025c011cea [94/112] gtrace: Add functions to create/destroy a trace component path
config: arm-randconfig-r053-20260812 (https://download.01.org/0day-ci/archive/20260813/202608131205.sppv2u7u-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608131205.sppv2u7u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608131205.sppv2u7u-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c:347:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     347 |         kfree(comp);
         |         ^
   drivers/hwtracing/gtrace/gtrace-core.c:390:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     390 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |                ^
   drivers/hwtracing/gtrace/gtrace-core.c:390:7: error: incompatible integer to pointer conversion assigning to 'struct gtrace_component *' from 'int' [-Wint-conversion]
     390 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:399:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     399 |                 kfree(comp);
         |                 ^
>> drivers/hwtracing/gtrace/gtrace-core.c:561:10: error: call to undeclared function 'kzalloc_obj'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     561 |                 node = kzalloc_obj(*node);
         |                        ^
>> drivers/hwtracing/gtrace/gtrace-core.c:561:8: error: incompatible integer to pointer conversion assigning to 'struct gtrace_path_node *' from 'int' [-Wint-conversion]
     561 |                 node = kzalloc_obj(*node);
         |                      ^ ~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:581:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     581 |                 kfree(node);
         |                 ^
   drivers/hwtracing/gtrace/gtrace-core.c:598:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     598 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |                ^
>> drivers/hwtracing/gtrace/gtrace-core.c:598:7: error: incompatible integer to pointer conversion assigning to 'struct gtrace_path *' from 'int' [-Wint-conversion]
     598 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:626:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     626 |         kfree(path);
         |         ^
   drivers/hwtracing/gtrace/gtrace-core.c:636:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     636 |         kfree(path);
         |         ^
   11 errors generated.


vim +/kzalloc_obj +561 drivers/hwtracing/gtrace/gtrace-core.c

   547	
   548	static int build_path_walk_fn(struct gtrace_component *comp, bool *stop,
   549				      struct gtrace_connection *stop_conn,
   550				      void *priv)
   551	{
   552		struct build_path_walk_priv *ppriv = priv;
   553		struct gtrace_path *path = ppriv->path;
   554		struct gtrace_path_node *node;
   555	
   556		if ((!ppriv->sink && gtrace_is_sink(comp->pdata)) ||
   557		    (ppriv->sink && ppriv->sink == comp))
   558			*stop = true;
   559	
   560		if (*stop) {
 > 561			node = kzalloc_obj(*node);
   562			if (!node)
   563				return -ENOMEM;
   564			INIT_LIST_HEAD(&node->head);
   565			gtrace_get_component(comp);
   566			node->comp = comp;
   567			node->conn = stop_conn;
   568			list_add(&node->head, &path->comp_list);
   569		}
   570	
   571		return 0;
   572	}
   573	
   574	static void gtrace_release_path_nodes(struct gtrace_path *path)
   575	{
   576		struct gtrace_path_node *node, *node1;
   577	
   578		list_for_each_entry_safe(node, node1, &path->comp_list, head) {
   579			list_del(&node->head);
   580			gtrace_put_component(node->comp);
   581			kfree(node);
   582		}
   583	}
   584	
   585	struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
   586					       struct gtrace_component *sink,
   587					       enum gtrace_component_mode mode)
   588	{
   589		struct build_path_walk_priv priv;
   590		struct gtrace_path *path;
   591		int ret = 0;
   592	
   593		if (!source || mode >= GTRACE_COMPONENT_MODE_MAX) {
   594			ret = -EINVAL;
   595			goto err_out;
   596		}
   597	
 > 598		path = kzalloc(sizeof(*path), GFP_KERNEL);
   599		if (!path) {
   600			ret = -ENOMEM;
   601			goto err_out;
   602		}
   603		INIT_LIST_HEAD(&path->comp_list);
   604		path->mode = mode;
   605		path->trace_id = GTRACE_INVALID_TRACE_ID;
   606	
   607		priv.path = path;
   608		priv.sink = sink;
   609		ret = gtrace_walk_output_components(source, &priv, build_path_walk_fn);
   610		if (ret < 0)
   611			goto err_release_path_nodes;
   612	
   613		if (!gtrace_path_ready(path)) {
   614			ret = -EOPNOTSUPP;
   615			goto err_release_path_nodes;
   616		}
   617	
   618		ret = gtrace_assign_trace_id(path);
   619		if (ret < 0)
   620			goto err_release_path_nodes;
   621	
   622		return path;
   623	
   624	err_release_path_nodes:
   625		gtrace_release_path_nodes(path);
   626		kfree(path);
   627	err_out:
   628		return ERR_PTR(ret);
   629	}
   630	EXPORT_SYMBOL_GPL(gtrace_create_path);
   631	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
