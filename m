Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CEA3624D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Aug 2026 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786781460; cv=none; b=ATZSBdXB1uSiNdDldvbczfItUlU0s2MghS7uHNTCo3luBSy4n3lkGZ5PEHhYtSXNS7CYBTJHK9iv+/pl0V3VYuqjB2O0CW+vgSzhkJoutnFTKbupZsm1UKhcYLAl8oGzlVAwjgpA84pbxexnyV6CYMhaheJwb8jD9C33dhRO9pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786781460; c=relaxed/simple;
	bh=0dL9UEN9nWJBfI/N9/H4fzn3s5XvIK1oHDhYQ47IcVg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gBwdXvBxvWyecKxsrKNaisxq6cPXp9O7mdQGFguWvNs3blwJU9zdZuZ2vPFQ/tXwWzyxN0esrPj+Wrrt/u3NMCbhKm1PxRGgrBpM4Vs2KfLKS3IFL5PXf4ICU/SFxP5n5oVFyAu4yElviNsHIE/2giKPUz/YS8C4A22W3dcFklM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rsj4QHTi; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rsj4QHTi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786781458; x=1818317458;
  h=date:from:to:cc:subject:message-id;
  bh=0dL9UEN9nWJBfI/N9/H4fzn3s5XvIK1oHDhYQ47IcVg=;
  b=Rsj4QHTij5jZVrzqb2s0O2cXOnFJQ1xT354qAXRZrif08zdinU+LTO6g
   mJrP0CVWPKkMAKk+G67xI7wjzH6pBe68ckq2eXj5tQa0mpY2RHnuMx+P6
   xYYG7TcPRLVzlFXM9YTE4ZVTV3lG+HwJgCcvgUaybs8TTnHGA/vxI5I6x
   JJ5cshDeDnvV5GOID5F8ta69TR+ccoGJpbfeRUMJo8L5gko4RURgE1IF+
   zw7R/pk6daF70asmo7D7Ft18kMcbjKHhIrIzRYkqUlX/cygJW25LPj2Zt
   0ihI4Xkqooq+3V7N8XQ/O9tOj1doIU/gYK20KmPrR+h9KliTeD0GQV9Mu
   w==;
X-CSE-ConnectionGUID: dP5uoEz+SYmAgRFdqIsdZA==
X-CSE-MsgGUID: Zb+FYWMSQ6CrS/6Lv4K1WA==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="110131085"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="110131085"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2026 01:10:58 -0700
X-CSE-ConnectionGUID: hsoZQH/1TxqxxePUBZqZdw==
X-CSE-MsgGUID: 7lOso4iJRb6XcgFK2Cr5MA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Aug 2026 01:10:55 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv9Th-00000000bX2-2DFn;
	Sat, 15 Aug 2026 08:10:53 +0000
Date: Sat, 15 Aug 2026 16:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 94/112]
 drivers/hwtracing/gtrace/gtrace-core.c:561:24: error: implicit declaration of
 function 'kzalloc_obj'
Message-ID: <202608151543.OyBoptrg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   2251d17fd6ac95b1f6de32a893141a3481e3ad1d
commit: c8b928f098710cd4a1cf5604883f2f025c011cea [94/112] gtrace: Add functions to create/destroy a trace component path
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260815/202608151543.OyBoptrg-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608151543.OyBoptrg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608151543.OyBoptrg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
   drivers/hwtracing/gtrace/gtrace-core.c:347:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     347 |         kfree(comp);
         |         ^~~~~
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
   drivers/hwtracing/gtrace/gtrace-core.c:390:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     390 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |                ^~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:390:14: error: assignment to 'struct gtrace_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     390 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |              ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'build_path_walk_fn':
>> drivers/hwtracing/gtrace/gtrace-core.c:561:24: error: implicit declaration of function 'kzalloc_obj' [-Wimplicit-function-declaration]
     561 |                 node = kzalloc_obj(*node);
         |                        ^~~~~~~~~~~
>> drivers/hwtracing/gtrace/gtrace-core.c:561:22: error: assignment to 'struct gtrace_path_node *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     561 |                 node = kzalloc_obj(*node);
         |                      ^
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_create_path':
>> drivers/hwtracing/gtrace/gtrace-core.c:598:14: error: assignment to 'struct gtrace_path *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     598 |         path = kzalloc(sizeof(*path), GFP_KERNEL);
         |              ^


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
