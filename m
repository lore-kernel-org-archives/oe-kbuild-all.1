Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67932245020
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 01:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790903869; cv=none; b=rgmtrBEusZLr++Yfh+OVbZDL0zwBVx+jm1thimiYpZ/p08BpWraUdtqq6HP9EX0nTOoGQWv0wGj9ZQqAMqGBu0jl5vx5ZYF9l6gv6HccDRsJCKNDaEAiKFXc/niJfi2ySyvi9p8YaR9ddz5PhZFf1t0EPBGMc1bS03TknDae2jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790903869; c=relaxed/simple;
	bh=B6HSAZ+6K3grqgMe/vw9RI1AW1pluiLzSQto6DrHgYQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OwoNrSaw1WuXo1bwwtlVNSEzXG1nzrVREFLwoPTjDvWtR7jD5rWgz5Ok8w3zcJwu4wptXbbpwPzb+/ujXHwVCC6dXpwFisAMUr9rG42WCkBkpEalzAToanZA9+FeahKlRWIJrdZt/doME6bxMTYu82f+JWbVvFl6WzTasNtChPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ls0gnJyJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ls0gnJyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790903868; x=1822439868;
  h=date:from:to:cc:subject:message-id;
  bh=B6HSAZ+6K3grqgMe/vw9RI1AW1pluiLzSQto6DrHgYQ=;
  b=ls0gnJyJD2lFIf4uNCaP8sY3IyXf8o5lElDiKDFxHsek4D1Lr5utoyBQ
   MiU6bidqZ8KW8jW1z67LMA0XwcsZsXJD3AoASKYx5l83WqiezgV/9eixs
   4m6pTKpHxnwJ2TbQ2xYwE9kzT2Q+oEvc9c1PhoVLE0UtVxQks1kpDns7p
   iMlZOrNmRfGWTkP7Q1RjV/5YS0qI3MVLsrM62ayy7qPFjTK9PoEAN84sW
   S/IoRYgWGyJigly6pEDk3Md9r1CfoiMES93gQjqjd0EDzzpccrcZDXh3o
   +BfcjEKD9P4j+Xuna8qVp9wCOaego9vsnZFrNp14XSeIFNOWhF8WW5HBJ
   g==;
X-CSE-ConnectionGUID: 5H2jY5uyRo+b/pjiW+hU3w==
X-CSE-MsgGUID: qaLTBhKxTMa3CEKAJaeXNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="94386357"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="94386357"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:17:39 -0700
X-CSE-ConnectionGUID: Zn1IxA9NSPGevUcNCDKvnA==
X-CSE-MsgGUID: 8oiuD9g5RHiXYM579VTFNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="275690994"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 01 Oct 2026 18:17:37 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCRu2-000000000Jx-2UjA;
	Fri, 02 Oct 2026 01:17:34 +0000
Date: Fri, 02 Oct 2026 03:17:16 +0200
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 67/87]
 drivers/hwtracing/gtrace/gtrace-core.c:359:15: warning: assignment to 'struct
 gtrace_comp_priv *' from 'int' makes pointer from integer without a cast
Message-ID: <202610020320.0z7YevLG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 9d884d22932da958867424488aadb1ed67681c24 [67/87] hwtracing: gtrace: Initial implementation of gtrace framework
config: xtensa-randconfig-2001-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020320.0z7YevLG-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020320.0z7YevLG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020320.0z7YevLG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
   drivers/hwtracing/gtrace/gtrace-core.c:315:9: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     315 |         kfree(cpriv);
         |         ^~~~~
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
   drivers/hwtracing/gtrace/gtrace-core.c:359:17: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     359 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |                 ^~~~~~~
>> drivers/hwtracing/gtrace/gtrace-core.c:359:15: warning: assignment to 'struct gtrace_comp_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     359 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |               ^
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
