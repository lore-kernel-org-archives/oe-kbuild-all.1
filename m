Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794132340;
	b=pfsTGimoStlKhcJPGN2HX4BhF9wucCu/ScPQnw48XU9vidXqWIKzIvs54H9wNSL6CVdd
	 eXy/BXecQNC7h6DsLGmJNti4bTDqy7bxsAenNNXf59srxtlPNNJFqsNt55NDngUq+5z9c
	 8usBx6BWlaqCoWu8rrVgZ81zMKexWWSTUOH0iXExk58qvVIiLCx0xQyDO8wduUFuEgcPR
	 iHFgnJOnbMxElBTsFv+zEaIHgzADO1c00jrbWmhIWjZ1xchWz9ypYp8txEOLC5iExi+2Z
	 wJcnbkWAfo/5NitNRgkGxEdsyVF+aLF1nCxQHxFEGQ/4uzLhis620utAYbzfZ18Yhfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794132340;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UKAjOtGCOQUdb7LDDkMTCenI4sBuR72nwlqbC2lVzSQ=;
	b=0gRApiTkicG2Gh+4C5PS5Ou4qWYZ7LeOV9A8/5Hk14HCG4NGPuF1HYiNM10ekt+Z9ep1
	 Y5mK/azV3NF/+KY05xg9GlYUhVzdrf87UmQm8CKzxHy+aDtwHfbjcD4+Qm1qfKk8p5SR4
	 GJ58DY0VEclyp5jonOiEZ9YIeZRSjva51e+qtlcmHn0Yf2ccSG4XDgzaT+VI9vdjvQlKg
	 OtZahw0HFuNwbI31EsN9+VJAjCtxIV11C28afpOOAPtudva1FFj88EfXX9BmHjZOT9PLL
	 T4JLEncNwlVYXhfSk8kFsCprQCl0+qQZwyyGaXpYVnPm0FDxSrWC3OoqrlZT6GvC15Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5xnllAv;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6DC606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 10:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D6DC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=L5xnllAv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794132339; x=1825668339;
  h=date:from:to:cc:subject:message-id;
  bh=W1xKQtOLpoqwR7+qh0E7rb2Ay7oQpO9DaGvHBOIYezQ=;
  b=L5xnllAv0RxvxJbP8M1Iq17TpFyJFyasAD5mfvuwqT9sdDxqZ2tiMiep
   JK/J1udVvajrq+GL5I7/YShO6c98PlUjtvNARlGst1yLMQAkK9lCWuldr
   /LMcyrjt4areVL9flxJnE+tKwLdKdefv8FYbfyuzYY9Fu+6fZ+aB9Guz1
   BR6reRL2MkoX9/4VF0FNEmJ2/i9iD/tc8Yx6+Vq3CGJkZ4IT/Q8wawMEU
   NMx9jRxXNuTLbrSe1d+RpBlQ9/PUSRTHxhn6ggP3x7OsGy/9Y3KEG02L7
   95zcbqvtaXIDuQ7IFTgmU18+oCG02qCwrzjKMDVLwure51/tF9E53zgxG
   A==;
X-CSE-ConnectionGUID: zQ3MlTI7TdKOBDuqzNfQcQ==
X-CSE-MsgGUID: /+ha8+LzSe2L1mfzjGDhsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2762073"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2762073"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 02:05:38 -0800
X-CSE-ConnectionGUID: sugdh1KSQ1KQuePBECaGiQ==
X-CSE-MsgGUID: iV8TJ3tBTcqXncQivB2o6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7968217"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Nov 2026 02:05:36 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPzmH-00000000slr-2pga;
	Sun, 08 Nov 2026 10:05:33 +0000
Date: Sun, 08 Nov 2026 18:05:08 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v6 70/80]
 drivers/hwtracing/gtrace/gtrace-core.c:590:24: error: implicit declaration of
 function 'kzalloc_obj'
Message-ID: <202611081723.0j5O0SXq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v6
head:   f98be19c4d4f657fa0ed2a17aa8ef5ece29fe8dc
commit: 3889440d4d89d7eed212c92d6b46a87676fac5a9 [70/80] gtrace: Add functions to create/destroy a trace component path
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611081723.0j5O0SXq-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081723.0j5O0SXq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081723.0j5O0SXq-lkp@intel.com/

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
