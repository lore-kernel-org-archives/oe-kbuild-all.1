Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893076;
	b=iWesYGLt+Eqglcw7AfhL+SY3XvDNQbINXvWObh6NLzvUSYmj4hUgWp8zv/fjAKTM8eZi
	 uAG88YOFw76nzWwWdt+uBsrsFEMZUTs+WZmyh4JggKmi7uTBHEjEcxpl8ZgN/3PpSzVvt
	 67LmptAAqJSSNnUpDMBJLuyPzzRE0KDO/OLdT+IywPmB9ybNhUAKKjxrj5EizMtS38WkM
	 safe12gmfQD5axEvLDFBnVIaBzQMsb+QJGceFyU4L1I3bIRt5ktp7YPiyXQon7mGYOylN
	 SrZP8kRCwrgb2m4HK5jVIiTPKC4ugI1bqKY+aWw2bMR6Hou2psXmknylfLQ4dsYEKDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893076;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dFotAlj5cF0NBsSI7CFOChrnJY5Yvv6nuH3fhn1mv+c=;
	b=M2sxZ49e0Y0Sk0xMSM9VuRSxz73/aAcEf1S3zAyzHW2cLnfcKaHS2ua87+UYy0pDeKg6
	 BxW6xkCLccZrNR5cvO+WWDUNhTv5v0hVNzDmmJgkprih1YlA76QST+amuJZpKBQ4CrdXE
	 2BEGbGVEDKRSJYpx/RJZ5iQvqLxTDxf3J8qtthiMdbFTktORK2PROip5mEaZVK/lp7O8L
	 P9xmb2ITf1MCLXoCBWp8T9hp9159Zp4ay3BxBjCahv7YZ+dkjMPUYTGOglehJPtIJ64Tt
	 ee7Ffsn622ALIOGDXifpfB+12PZdX2tw2tLZqIGLprYJBlwqO4Ioof/op4KTSBgJH4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IDjo0yra;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F6D606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 05:24:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F6D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IDjo0yra
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794893075; x=1826429075;
  h=date:from:to:cc:subject:message-id;
  bh=wgW46IHDJTLyWT3L7PMBvahVetidJ29grlXDn1OKyPo=;
  b=IDjo0yraqUX+BniLGn/ojDuc5LHhu/q2Oya2pBKGzUlNOlLwpKT+JkLS
   YSXNHytTOo3dKNPr+IADUT+KFE16aET7jhMW5KJ7hIanFvOziQrpc6kSx
   dPUUEC7RcsEg43dxky1OnG6MZmXQbVx+e+jLOzoXByox6VC8bBtpQ9DXf
   FePw2l+Tk5wcoinGV5HV9s7ER0EnpMn6lF0hhBfkmBUA+Mm+cRsyIprHn
   WvD2+vxA9yUeHKmCLzHQhHyNBmVD3E5UR21v1+MqRgQnI5UeWlXVpDuf7
   5ow9GPEZowBgKn0K534cfJ5kc2MGqHRKzhDtWkkVWtWhkrmoNDmYz9Wha
   Q==;
X-CSE-ConnectionGUID: I/JlFDdPQ8anyhlGs1XGmw==
X-CSE-MsgGUID: asiYRtkkQSi+ZugN6Vr2Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3639001"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3639001"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 21:24:34 -0800
X-CSE-ConnectionGUID: a3OI9VdQSVeIsLC1DRI/RA==
X-CSE-MsgGUID: 0SYVbg4pQPmOp7/PQsmidg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9906088"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2026 21:24:33 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTBgE-000000002ys-0Py3;
	Tue, 17 Nov 2026 05:24:30 +0000
Date: Tue, 17 Nov 2026 06:23:59 +0100
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_sspesa_v2 79/98]
 drivers/hwtracing/gtrace/gtrace-core.c:590:24: error: implicit declaration of
 function 'kzalloc_obj'
Message-ID: <202611170648.B4WmJK5t-lkp@intel.com>
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
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261117/202611170648.B4WmJK5t-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170648.B4WmJK5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170648.B4WmJK5t-lkp@intel.com/

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
