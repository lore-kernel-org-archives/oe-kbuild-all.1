Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34761383C6B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530592; cv=none; b=nouk3a/9tRCAbwhMOfiPaBwe/CQI88K0Q9iwzWTZgBJ210FBy+W+38D242fckdXyklt6LsVXuo2XxnFzvKRrbJDTHXZZj4oHP4O2GyCvbGPkjK1Zijh4XeYwlI+19HPaMkfzV7kwH2rJ4oxrGu4/rfpjxZWpl4qZiHjZdsdKJ/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530592; c=relaxed/simple;
	bh=7ylE/5VHqiyS8tuQfkCU2/cuQRfA2gpZaaDYqhMhg1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tAdirfAeeLl/A6J5vaB8qot7/LLCzVyDtD5g2XJU/H2BYbjxSxEIyo6EM7KzyLWGEftQcrjtYpfaCSrbZXDzvOux3iCqmE2EbYL1Q+Fn3OxSmoRA3uC4lSBaUlmMNSdyfvRia4yP+7BVsr9Or8OXLd7Zx3B3WG7G232DHRZ3jLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1qjnp8f; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1qjnp8f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786530590; x=1818066590;
  h=date:from:to:cc:subject:message-id;
  bh=7ylE/5VHqiyS8tuQfkCU2/cuQRfA2gpZaaDYqhMhg1A=;
  b=U1qjnp8fPDDbWJTTPQ4Ifxg0E372MmNU+g/j1HHb0CuxWIp0iS7GpiUA
   3U0mQqTh1LLo2vZbPnntH6GwRstqxiCclSyyJO5pZnEnJOSyBg1d94Jpd
   PI9Cwet7Q1ahWIrEgNL8qaQkXmPuKrU2arMuX58Y0xrDXpED55Z6BO3+7
   tt1o8a1Nb4W8y5rOPN5eGHinZPnvNhYHDK9jPJnO8CKZBBlXtksDO7sK6
   hxi/lSbiEs+sgP0pQo1W7Axvdf7LG3S2kZe6LVnIV0dRO9EvY4RRi4Kni
   iMaVEVJwTI3ehU2crJc5uQWFxSWC5MlswRun6uXOOpelIE0VubgV4VtAb
   w==;
X-CSE-ConnectionGUID: 2w07MaK+RGOAAsz2wMiMbQ==
X-CSE-MsgGUID: Pdy5PpzNQ0KyoX3u9VpNkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="112624066"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="112624066"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 03:29:49 -0700
X-CSE-ConnectionGUID: G5+4Wg5FR8KPuXD4j4sNPA==
X-CSE-MsgGUID: fMu95j1lRW6r6luKcFNj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="260288411"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 Aug 2026 03:29:48 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu6DR-00000000QM0-3DpF;
	Wed, 12 Aug 2026 10:29:45 +0000
Date: Wed, 12 Aug 2026 18:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v5 94/104]
 drivers/hwtracing/gtrace/gtrace-core.c:561:8: warning: assignment to 'struct
 gtrace_path_node *' from 'int' makes pointer from integer without a cast
Message-ID: <202608121806.vOZ5LycL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   1d99b155d3c1ca9a30209d51590db002a606f30c
commit: c8b928f098710cd4a1cf5604883f2f025c011cea [94/104] gtrace: Add functions to create/destroy a trace component path
config: csky-randconfig-r051-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121806.vOZ5LycL-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121806.vOZ5LycL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121806.vOZ5LycL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
   drivers/hwtracing/gtrace/gtrace-core.c:347:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     347 |  kfree(comp);
         |  ^~~~~
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
   drivers/hwtracing/gtrace/gtrace-core.c:390:9: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     390 |  comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |         ^~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:390:7: warning: assignment to 'struct gtrace_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     390 |  comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |       ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'build_path_walk_fn':
   drivers/hwtracing/gtrace/gtrace-core.c:561:10: error: implicit declaration of function 'kzalloc_obj' [-Werror=implicit-function-declaration]
     561 |   node = kzalloc_obj(*node);
         |          ^~~~~~~~~~~
>> drivers/hwtracing/gtrace/gtrace-core.c:561:8: warning: assignment to 'struct gtrace_path_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     561 |   node = kzalloc_obj(*node);
         |        ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_create_path':
>> drivers/hwtracing/gtrace/gtrace-core.c:598:7: warning: assignment to 'struct gtrace_path *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     598 |  path = kzalloc(sizeof(*path), GFP_KERNEL);
         |       ^
   cc1: some warnings being treated as errors


vim +561 drivers/hwtracing/gtrace/gtrace-core.c

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
