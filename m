Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794860115;
	b=sqozZO59PxfdAzBJwDoK0s/wW4xiQ5GHgaA7YcN0EHS8Zv1vBA4KNh53CMVMImf4YW5t
	 0CDgkaRlql9DUZLBiUdCsgPbOir/GP6aYdGf1tSQYn0aMOJYf1evSEijrSEti/mbmcN5o
	 gEryMSiHK6mRbqr41aH6tpJeDPmzPJLhR60I9d1k+VJ9/ZtAOTeQEiTxUumWTBLCPzzx4
	 6NM5hzGu6v4LjV9JBQfc7QSuC71Zeui0MM50/uIufv6skAvkxGOPdP90/uajCcUjP8E42
	 xniPrvtfX7WFoZ/qs6SAFdaQ28Qi5MI4grfPAcRijdeGI2RtScN9scgq9ob1pkNSSsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794860115;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UXskvfheqt/c0WMT/RSpIpg8z1Dj9wtPAhBZzUAxqTk=;
	b=tGD6BIj77nO3bzA85R6TBDeEWCfWf2YJ/kviLXkqAyxeT1nvGX0qmNCD9jeeA3MjgxBD
	 SUT3y4y2pDCxoEaG9Mlg2NRg1fZghMv/0jzmVZZSfIzTMoE7HQ5UsBPZBb/XqAVHZNKQL
	 C/9mlSNpL1GjrJFH1PaTB4UKUE9dS7ZpV33ORxupWaEkwD+ESqH6ZZJfniNa/Tag+cNFg
	 Fm5wFXA4fNc2hHcULuZi/mmH4PYZPGZjSQ1ofXK44MvOUrhbfFq26jH0TypgaJ+GrLIky
	 +0xdwVujosIu1s4p7OIJq9I86SJGRYR+nIBOzW1mYrqDbOwad3HXqGLDZqaEQcq8i/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCgfqY60;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95872606A330
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 20:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95872606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NCgfqY60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794860115; x=1826396115;
  h=date:from:to:cc:subject:message-id;
  bh=mhD1BocLw9GmfzYgNdoRVjzQFbHBeQchxZS3pODfhYg=;
  b=NCgfqY60lGyAJe9tIHwLgM4lcPs7BM1yetJeJ4/KpBJnkISe3IjOL8m3
   0y4qoFTFDpRBFISVAya1Zgh+FdAJeOQDq4UkTVdd3ZJWNYAZ1uBlE2yZr
   hVBnnF2d8OcFaI9CQllJx7oW/GP+uAEBzYTIhmJ1aOCxdw0XSyGfQX6rP
   KmUsyn3xmQf2okKrSMPSMHisSuo0BBAJjLrovjK1vuhGccUctbFuytas6
   ykA3AHqLpzbSEPfhqTqWws/N+AAkeun0dsrwkS/zqMUL0sB6bedpru9Uz
   Egg3hR9/iipR65zmyB63McIEpsa9hKrT67YloGsaPWrbYbgqN8tHwcbXH
   w==;
X-CSE-ConnectionGUID: Bt7EJNdsScixrMHE7xTB7g==
X-CSE-MsgGUID: C7SJpF/xQy2H75RR7ndi4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3717684"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3717684"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 12:15:14 -0800
X-CSE-ConnectionGUID: tg803cdxQqaI2AvGWgAQNw==
X-CSE-MsgGUID: +Zx+Xd9STa2Od39N10wnlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9444916"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 16 Nov 2026 12:15:12 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT36b-000000002nu-1wp0;
	Mon, 16 Nov 2026 20:15:09 +0000
Date: Mon, 16 Nov 2026 21:14:27 +0100
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_sspesa_v2 79/98]
 drivers/hwtracing/gtrace/gtrace-core.c:590:10: error: call to undeclared
 function 'kzalloc_obj'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202611162152.ziG1UYqr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sspesa_v2
head:   6deccfa10a938ba2257b489c067a1928022d510d
commit: 0556d8fb8f512a50300ff8436c8b02d4d33d5bb4 [79/98] gtrace: Add functions to create/destroy a trace component path
config: arm-randconfig-r2101-20261116 (https://download.01.org/0day-ci/archive/20261116/202611162152.ziG1UYqr-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611162152.ziG1UYqr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611162152.ziG1UYqr-lkp@intel.com/

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
