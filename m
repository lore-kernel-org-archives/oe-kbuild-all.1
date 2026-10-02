Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82690326939
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 04:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914008; cv=none; b=Sl86+itYFZmN6zMqEouuD5TlMdCmZjwPpIaFuWdPr/H7eYuo/YPR66r2YXFODY1d/ZXcYBnEbkMU4HXELfEw0Rh+CcKpqcfNdVWkUyWIWkH1zLyiqp+nGtm1BhhxhbYyxgAqJKGKu7ay8+82S/pue5bzx0/HBcBu2pAAUF+p43I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914008; c=relaxed/simple;
	bh=qUSZsJqYMmxCGPj5S2TYCKu/DebRhqb9oD31FYZMXM0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ilEmSwQfte/kb9wAUBU4G4SuQxFv8HYJnapk3fiTCR9Mz/cRATVRibZcCph9t29YTK0O8VmEGRgOIPgoKADaGYzhi8YKBMKEg0RApV7DRa/gGu4vNvjsOgtJ4p9ApaKXiwdbb/TxC5BB++WQWxDLovHu7nso3thR48yhvk0nuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+QXPlJP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+QXPlJP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790914006; x=1822450006;
  h=date:from:to:cc:subject:message-id;
  bh=qUSZsJqYMmxCGPj5S2TYCKu/DebRhqb9oD31FYZMXM0=;
  b=G+QXPlJP2cYXuprr5OdKKOknl9W8swImHEDK91Ma/vDFeDub01sI8LKn
   2ZFLTV7ihXDKcmQJ4CREKREI+NBd5m4qZpibIzGi+sWnXzhC3Sxa0LRdz
   twrhya6U6SbXTIJMhOEPVQ+EslzvCvSOQaCdIXJxF21Qj/CifaJs4WmID
   su1p91GzkXp2Ae9VL3AnRzziAufb/Pmafpt89Uf36RLSTUaJZopcWtXEs
   qPrpT0Zj8inkXM61LcCsPSC7O8MTTA0fQIUQJlwaiEG9VDOuue554ik+D
   OQQhccJS2M8SWm22aOwafiCjSGJHJBRjGz+Oas8QSvGE1f7w5VP22Q3uh
   A==;
X-CSE-ConnectionGUID: wV7x0Q+/Soy35HB7o+jK2Q==
X-CSE-MsgGUID: xxOTwYCtQzGgUJzxlVuuWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="109167417"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="109167417"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:06:46 -0700
X-CSE-ConnectionGUID: PlgfyoSqTLKdfIQq+wa9FQ==
X-CSE-MsgGUID: blPiBG3yRU+zf5tjf5+iZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="273981902"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 01 Oct 2026 21:06:45 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCUXi-000000000Oh-0bk8;
	Fri, 02 Oct 2026 04:06:42 +0000
Date: Fri, 02 Oct 2026 06:06:29 +0200
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 69/87]
 drivers/hwtracing/gtrace/gtrace-core.c:590:24: error: implicit declaration of
 function 'kzalloc_obj'
Message-ID: <202610020602.ZVxyx0v0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: e66280cd072805f1d20509bf41ea75382a4c1fc6 [69/87] gtrace: Add functions to create/destroy a trace component path
config: i386-randconfig-2200-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020602.ZVxyx0v0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020602.ZVxyx0v0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020602.ZVxyx0v0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
   drivers/hwtracing/gtrace/gtrace-core.c:372:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     372 |         kfree(cpriv);
         |         ^~~~~
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
   drivers/hwtracing/gtrace/gtrace-core.c:416:17: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     416 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |                 ^~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:416:15: error: assignment to 'struct gtrace_comp_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     416 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |               ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'build_path_walk_fn':
>> drivers/hwtracing/gtrace/gtrace-core.c:590:24: error: implicit declaration of function 'kzalloc_obj' [-Wimplicit-function-declaration]
     590 |                 node = kzalloc_obj(*node);
         |                        ^~~~~~~~~~~
>> drivers/hwtracing/gtrace/gtrace-core.c:590:22: error: assignment to 'struct gtrace_path_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     590 |                 node = kzalloc_obj(*node);
         |                      ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_create_path':
>> drivers/hwtracing/gtrace/gtrace-core.c:627:14: error: assignment to 'struct gtrace_path *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     627 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |              ^


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
