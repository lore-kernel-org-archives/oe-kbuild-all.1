Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794097959;
	b=sDzpLGIxxzyc7FVepi8hmU3BcHYLmdoMGluxW9y7+6yCklI/XMb5JjPzMoA5lAfn5YAE
	 501r8UbQ0JkRcqCi8q0zGat/y4dWdEk/AzPsk5D0MDz+yHnMY1QLkckuCn/4gcqPnHMye
	 LUQHNCZFgCpTK6x75LdP4/KeUqsd2tET4d2dXn7eONbuAT2rnRl3teEUtgNASAUHJcjC5
	 s+4COQweqqVpN0my8CEdyHwPCZn9jKZzoGaWucfcx8vRs7EvjaK9V4QsPj+xssNSUJJ8h
	 pDf8YK8vKNw4Rc3Y3JzaA29AGUTtvp5P8PXmb0W9inh7Ek36+JUHVh0cL5c439rwYWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794097959;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=qpqhiA/JtZUYaH7BjEqVcbYlOSTf5brZGHgMtc9/8Rw=;
	b=o7+HCBTU5ONmKQLhCV6w3sVfnwk8SqIqJfpvoW2cG2UIQj5iV5Mu/Lkdixp3vpcR8ExD
	 JaHXRb+Ay+7MsITajSSXaOm3dT/f/vusvKPigxQJJr9u3kzH9CgbDZDvGTJBwZQmk15Px
	 VyZIhB4TJEHB8ZDLE40AXQyjg5Oe4yNNu7NWfex6dB4t18RtP79rc2v8yld/2/H9ZM8TE
	 m+bN/gR+4TyJ3gpTL020NyMSvXEw9d7XMzL9Qw8xo8y3h3NTZ08j6GZznUxh5g2E5IUX3
	 1MqEfpIEpF1idf2q6DMmeBLVKaZZyTgflVKR8cnDQC4zAbZw8AfW4/8DmPD/DK4/cGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtW+GSE8;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88973606A326
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 00:32:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88973606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JtW+GSE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794097958; x=1825633958;
  h=date:from:to:cc:subject:message-id;
  bh=2sHC8LKMrO1/hoCGoKQHFDoxRWYSIBnMvRjouKk26oc=;
  b=JtW+GSE8a97HJpLnNXWzJd0cG2Qnr65OhNILwO8aWvlJTNve9+WZnkgb
   M3MvdkfbKfI98D0SG3QLSdHlhI/n7thtXvDEwhyPAJygJ5li/aNIN1oI4
   l3DttUNiltWtuOVxlZf/BPN5MnborBQbRcAXxHpVrYToCvIO6jfn8Nuf2
   i7W+0kSBgmidQrrKU7L70LGQYtR0DgL3n5VETpUNyV8n0GBjxidZPxDmy
   DVDrnvFlSG5xGj4M1mDilLcrsWDO0QQn66HSFt7x7wIIPIM2xQSBR9EYz
   tJgbu5/SV91mY9svjMh1IVNOqEqqtdXxEOJN3uxcD+6DAJA1oz5cLUHWV
   w==;
X-CSE-ConnectionGUID: 8hyhi6jSS3uaymBc04DcFA==
X-CSE-MsgGUID: U3C1dz52TgOVim6ddGGaqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2872089"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2872089"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 16:32:38 -0800
X-CSE-ConnectionGUID: PovgInvIS5u3RcMTCdMGZQ==
X-CSE-MsgGUID: wrGpD1DKTWK+s+kl1ZpyIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7912562"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2026 16:32:35 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPqpl-00000000rq1-0S0B;
	Sun, 08 Nov 2026 00:32:33 +0000
Date: Sun, 08 Nov 2026 08:32:13 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v6 68/80]
 drivers/hwtracing/gtrace/gtrace-core.c:359:8: warning: assignment to 'struct
 gtrace_comp_priv *' from 'int' makes pointer from integer without a cast
Message-ID: <202611080833.s1lEpT1Y-lkp@intel.com>
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
commit: 568f8d89f93a9f46e7bb83c0e41d30d46429df68 [68/80] hwtracing: gtrace: Initial implementation of gtrace framework
config: xtensa-randconfig-1000-20261108 (https://download.01.org/0day-ci/archive/20261108/202611080833.s1lEpT1Y-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080833.s1lEpT1Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611080833.s1lEpT1Y-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
   drivers/hwtracing/gtrace/gtrace-core.c:315:2: error: implicit declaration of function 'kfree'; did you mean 'ida_free'? [-Werror=implicit-function-declaration]
     kfree(cpriv);
     ^~~~~
     ida_free
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
   drivers/hwtracing/gtrace/gtrace-core.c:359:10: error: implicit declaration of function 'kzalloc'; did you mean 'xa_alloc'? [-Werror=implicit-function-declaration]
     cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
             ^~~~~~~
             xa_alloc
>> drivers/hwtracing/gtrace/gtrace-core.c:359:8: warning: assignment to 'struct gtrace_comp_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
           ^
   cc1: some warnings being treated as errors


vim +359 drivers/hwtracing/gtrace/gtrace-core.c

   317	
   318	struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
   319							   const char *name,
   320							   struct gtrace_platform_data *pdata)
   321	{
   322		struct gtrace_connection *conn;
   323		struct gtrace_component *comp;
   324		struct gtrace_comp_priv *cpriv;
   325		int i, ret = 0;
   326	
   327		if (!id || id->type >= GTRACE_COMPONENT_TYPE_MAX) {
   328			ret = -EINVAL;
   329			goto err_out;
   330		}
   331	
   332		if (!pdata || !pdata->dev) {
   333			ret = -EINVAL;
   334			goto err_out;
   335		}
   336	
   337		for (i = 0; i < pdata->nr_inconns; i++) {
   338			if (pdata->inconns[i]) {
   339				ret = -EINVAL;
   340				goto err_out;
   341			}
   342		}
   343	
   344		for (i = 0; i < pdata->nr_outconns; i++) {
   345			conn = pdata->outconns[i];
   346			if (!conn || conn->src_port < 0 || conn->src_comp ||
   347			    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
   348			    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
   349				ret = -EINVAL;
   350				goto err_out;
   351			}
   352		}
   353	
   354		if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
   355			ret = -EINVAL;
   356			goto err_out;
   357		}
   358	
 > 359		cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
   360		if (!cpriv) {
   361			ret = -ENOMEM;
   362			goto err_out;
   363		}
   364		comp = &cpriv->comp;
   365		comp->pdata = pdata;
   366		comp->id = *id;
   367		ret = gtrace_alloc_type_idx(comp);
   368		if (ret) {
   369			kfree(cpriv);
   370			goto err_out;
   371		}
   372	
   373		comp->dev.parent = pdata->dev;
   374		comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
   375		comp->dev.release = gtrace_component_release;
   376		comp->dev.bus = &gtrace_bustype;
   377		comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
   378		dev_set_name(&comp->dev, "%s-%u", name ? name : "comp", cpriv->type_idx);
   379	
   380		mutex_lock(&gtrace_mutex);
   381	
   382		ret = device_register(&comp->dev);
   383		if (ret) {
   384			put_device(&comp->dev);
   385			goto err_out_unlock;
   386		}
   387	
   388		for (i = 0; i < pdata->nr_outconns; i++) {
   389			conn = pdata->outconns[i];
   390			conn->src_comp = comp;
   391		}
   392	
   393		ret = gtrace_setup_inconns_from_outconns(comp);
   394		if (ret < 0) {
   395			device_unregister(&comp->dev);
   396			goto err_out_unlock;
   397		}
   398	
   399		if (comp->pdata->bound_cpu >= 0) {
   400			gtrace_get_component(comp);
   401			per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = comp;
   402		}
   403	
   404		mutex_unlock(&gtrace_mutex);
   405	
   406		return comp;
   407	
   408	err_out_unlock:
   409		mutex_unlock(&gtrace_mutex);
   410	err_out:
   411		return ERR_PTR(ret);
   412	}
   413	EXPORT_SYMBOL_GPL(gtrace_register_component);
   414	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
