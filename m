Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854604;
	b=Z9waiSQgBQBaidYUMGPJ+Q31H2A5QfbUQIwOMPNja2MbGMXF3uO9KEkaSnvQZwYBeq5F
	 k+hYz18UbiU8dP+3lnTj6UfqitC6ckZf9crqNCiZqSf4Q4m7Xl5ePvoNw8+h/MoFfyHdf
	 zNNdUrVl5zLw1uRiIWMEydVrGxrm3Ct08G5Mvor9glfbulYezdxJEzAlCVIGHs4lrca/Q
	 347lhTfMo1DQST3wahZ40t1DQV2W9okNfaxLgatsFDS+W0P1RBf3+vG6di4P74qNGHnTP
	 xQLS5omDOc09EtJT41XxjNLtlVqfl3re0YQ3uqihmDCndTrJywVsvj3QPj2JYn8rYyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854604;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=amqxr6Kf2L8RL7kQJeueoGse+lDDbUp4Ct1I5vKzj4Q=;
	b=TxbR7yNduxj1LfR9v5o2+K4PdB+/Zgm5QmTy2CNux2ez0ombs8WD70p0QfahKhhRjPnk
	 d4seByzhrnemzIVgmqE1jqHhl3cc6NOqdhRcZhpAFTsuzIgicZH5kCujwRKYXCj1MI0X/
	 8ULr+XRmXwqQXhBMtDpcAXmFULstUk5M6z/Dr6G1RooUuqjL+DpSYuph/XWbY6GSwbwF9
	 QTskAGGgncAsiZcVaML0s5Q/bQSGLQ3wZuuEsGPka6VATy0jbF+qFmkFCE39sJkU6QdyR
	 s5mv/NF6UHFEDpmr6IQuoqLWLzF0gZUOjMQWdsJOTqENEH0XyOslQF+hGCD0dx0V9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMY50kfK;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72A5606A32A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 18:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E72A5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMY50kfK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794854604; x=1826390604;
  h=date:from:to:cc:subject:message-id;
  bh=e1IZDiZv60lsmLvzb+3Y5uljk8jfnHqJ7hzTzujCjBY=;
  b=XMY50kfKyQCwXjCzMfAbGrGwUzwLQalros/mrMfE26ShdIiOlMkg2Qoz
   LRzCWaf0338LizU5p6k6L64Sr4nuiXen95/K6LsyorGbQKQ4WbcJHri6L
   kqhK65XULvLVu/NvZYnfBdofTKVA1AdvFAv+268vL01FDzPEWt6fKIpqq
   wG9t+0BtJgOBYaBIpagg0a6cqZfi87J03KBrk3s3TqBmFzNU9TGoLd1/D
   I9TF7W2ynqgLvtIKp84EJbz+m3EzSLJ2JFyyQl2GO4ZvZFEQsskPu1KyI
   JL+FymdbylMnaqEkow2615MQwpTGkFJMEUEV+Ghddkc+iykAQfFCrCUp6
   A==;
X-CSE-ConnectionGUID: G7Wvr7F+R4KcuOls5i+QHQ==
X-CSE-MsgGUID: blsIt63xR2OWnb3ZJl+h7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3592036"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3592036"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 10:43:21 -0800
X-CSE-ConnectionGUID: 3Q/Z1SrcSh6gMG/K2ttHaA==
X-CSE-MsgGUID: VhRRFkUERFWqmSXHadlpKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="9932030"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 16 Nov 2026 10:43:20 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT1fh-000000002mg-22Th;
	Mon, 16 Nov 2026 18:43:17 +0000
Date: Mon, 16 Nov 2026 19:42:45 +0100
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_sspesa_v2 77/98]
 drivers/hwtracing/gtrace/gtrace-core.c:315:9: error: implicit declaration of
 function 'kfree'
Message-ID: <202611161949.xOdzAUlu-lkp@intel.com>
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
commit: 9283e64a956f8334eb942f564f401342531974ea [77/98] hwtracing: gtrace: Initial implementation of gtrace framework
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20261116/202611161949.xOdzAUlu-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261116/202611161949.xOdzAUlu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161949.xOdzAUlu-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
>> drivers/hwtracing/gtrace/gtrace-core.c:315:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     315 |         kfree(cpriv);
         |         ^~~~~
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
>> drivers/hwtracing/gtrace/gtrace-core.c:359:17: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     359 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |                 ^~~~~~~
>> drivers/hwtracing/gtrace/gtrace-core.c:359:15: error: assignment to 'struct gtrace_comp_priv *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     359 |         cpriv = kzalloc(sizeof(*cpriv), GFP_KERNEL);
         |               ^


vim +/kfree +315 drivers/hwtracing/gtrace/gtrace-core.c

   307	
   308	static void gtrace_component_release(struct device *dev)
   309	{
   310		struct gtrace_component *comp = to_gtrace_component(dev);
   311		struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
   312	
   313		fwnode_handle_put(comp->dev.fwnode);
   314		gtrace_free_type_idx(comp);
 > 315		kfree(cpriv);
   316	}
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
