Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794106848;
	b=ho5o8CtrrHreLkbhzJHZv7hkK/vRRyiSHSw8l5yQTwNllBJfsK6WkXleTUQ35CFaadEW
	 Y34FovuTPpX9VYrdcJRFrQXJSyK8KypHVCE7jha84DjT8XjZSulh40TlDU80XiOwhYbFa
	 qK/3La/qRvXZ8iE2AKKYckpXW4IHWu/LDMGn56jXUoBJaC3mV90Oi9fFeeWk9MwAW6eVK
	 /N+FnULm7wvU4HyjIFo0czOU7CvHM5lCy3K20oJCNrHmBsA5hws0q3ZgNP9A2gp/av9Cg
	 Gl8qMECaxt8D7eVSVARPVsbIJ+CcpV2kmKkCwzfQZBYDEzwpSI+jzO5a4NtEd/wisQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794106848;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wNdf+pD3YDUeg1yaqPDh926a2mzNbS/VZ3Hx4Nz/L9w=;
	b=0NRGru/eosNQcTnCO7al9SBxZJfMY1s81IOrEPWh9HO3Q4qDalx0/rQa6CDofGaTWFib
	 bnF4ym/tRVH9EZTtE+BbG4DS0LeOYstkoV9KI5rn7H8QDwM0C6Qz4o9alKbrVbgHzgwSQ
	 mA02j+QTkycuCBv1puGADIyZfKotrkC6Y3pBw2ANGCtU8nF34C8ak31SnuvkuPsY77sKh
	 gtaRtZ4xwFw7qgBalKkBoGvmB5vAcFVJXAxqzyJS/E4EyvV2aZOmlJ+jW9P3gOI9g/2VM
	 SFF06kqz7A39V/i7tmUmijkd0GuXAhsoJYfmZaHHtdjK6YHqAzWpGRvRfUmut62tCXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GeCVVLXR;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E280E606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 03:00:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E280E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GeCVVLXR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794106845; x=1825642845;
  h=date:from:to:cc:subject:message-id;
  bh=E6sSvq8Kl9hBYUJw6xxFujs7ooCsRK7qeDmP6H0DP3Y=;
  b=GeCVVLXR7ew0hm9BvftAADqYLlNcLFVM56RNQDuGBCC1Pq1gerFe3zeW
   CsodTH1kh86gCqwYsAUXaN+aVPLvxTFEv2TUIeZZv2GE27wVNqIasT2aD
   KnrSUblwRn4V/ad41PxveLMgLqT4iCTJDvPM1H6Ar2EogeP9D273mPhBs
   9tdI2ipYAXnJu1+wVLxmTi211xerDA1fSRMZGtUnrkWrRE2zMUXglvKRi
   Qb8XoVYIjUqm+VyiXRvqClTsNIhcJ6qhDkEdFo1Bx9gUhxzYPbF7Yzvc0
   WKnOMuriNDctLA3tv+60PFkrrsUaBR0lriQWnsoePqjyUC0RcwgI6Usu6
   Q==;
X-CSE-ConnectionGUID: gVdfMhRjTTS5AQ+okGhBWg==
X-CSE-MsgGUID: W9r9FCjwRr+kUxCza4ForA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2754747"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2754747"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 19:00:45 -0800
X-CSE-ConnectionGUID: trIyu3xzRomZcigt8hAMoQ==
X-CSE-MsgGUID: e+bWvQaETzCpZzYVxTxCWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7483280"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Nov 2026 19:00:44 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPt97-00000000ryP-3HVR;
	Sun, 08 Nov 2026 03:00:41 +0000
Date: Sun, 08 Nov 2026 11:00:31 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v6 70/80]
 drivers/hwtracing/gtrace/gtrace-core.c:590:8: warning: assignment to 'struct
 gtrace_path_node *' from 'int' makes pointer from integer without a cast
Message-ID: <202611081022.54wlwEdr-lkp@intel.com>
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
config: xtensa-randconfig-1000-20261108 (https://download.01.org/0day-ci/archive/20261108/202611081022.54wlwEdr-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081022.54wlwEdr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081022.54wlwEdr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
   drivers/hwtracing/gtrace/gtrace-core.c:372:2: error: implicit declaration of function 'kfree'; did you mean 'ida_free'? [-Werror=implicit-function-declaration]
     kfree(cpriv);
     ^~~~~
     ida_free
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
   drivers/hwtracing/gtrace/gtrace-core.c:416:10: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
     cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
             ^~~~~~~
             xa_alloc
   drivers/hwtracing/gtrace/gtrace-core.c:416:8: warning: assignment to 'struct gtrace_comp_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
           ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'build_path_walk_fn':
   drivers/hwtracing/gtrace/gtrace-core.c:590:10: error: implicit declaration of function 'kzalloc_obj'; did you mean 'xa_alloc_bh'? [-Werror=implicit-function-declaration]
      node = kzalloc_obj(*node);
             ^~~~~~~~~~~
             xa_alloc_bh
>> drivers/hwtracing/gtrace/gtrace-core.c:590:8: warning: assignment to 'struct gtrace_path_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      node = kzalloc_obj(*node);
           ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_create_path':
>> drivers/hwtracing/gtrace/gtrace-core.c:627:7: warning: assignment to 'struct gtrace_path *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     path = kzalloc(sizeof(*path), GFP_KERNEL);
          ^
   cc1: some warnings being treated as errors


vim +590 drivers/hwtracing/gtrace/gtrace-core.c

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
