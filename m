Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794109550;
	b=gCk9q+xQ+TDmH32PV9Sjazy+TFlCuyanQCmzpwCFUjvHemFPvg0iX0MYV3YvCrXFUZL7
	 gy17mRztJnzpAXW7Jq1BCLhQhkLrXe754exlR3CERQRxIoTJTdIibN4bn8auNTwl5/6CK
	 skrLCuziTh81w2awTGGp5qfzh90YY1PNpkRFeMH1HESflNxZOkbBfjUK5UwMQ2dVmh6NI
	 ri/2n0VylBSFLxpfcw+aZgsrVcJg8RzDaBnCjuFqeuYo99d3UBLBOm1m7iTLMHmaLrMp9
	 WspuhrcDNzARTRTJwnSXpn5KAY3M7l7syP19UJ3Kp+vmr5z3lqYXcBo59Z16NGNFn2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794109550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=dJg+j+fIDxugiOjxUEh7UUKZdNjdpyLabL6N7y7GwjM=;
	b=ITRKsTQGKMV4KoNTwMOe+wToc7n8bZCpK8I5is7gPz+gxdrL4a0TkiOlLV489ISkMBlO
	 Qm2arnTd03GMOXsCXVrRMixVL3i/XyAl0OWGe7lYYNRM75HvzeIvnBBIGdhxSy2aVP5tX
	 jc7yunnTKfs/syEqUFK2BBVyKvIH3ggqvxHxiT+DA0U1SnIo31gUZxoeAKOsCKFhn67F9
	 swjEyMi9X4pOdVIR2RxssLa1EhukELvEPCtdcDEXcCs2UVexSQhND8kpE8mxDfFnkWGpn
	 QsXDZ6j47p6oBDXAT0h3v4Ghv3EQrI40OcUc2Gdn/KdRBa1O+F56P7mG2rexJLnZ86Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WST+MFGM;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A0D606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 03:45:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A0D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WST+MFGM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794109548; x=1825645548;
  h=date:from:to:cc:subject:message-id;
  bh=jU5UXcLwueXc8K8Z8U9odhNgEUZgitSNP30Y1WMqFUw=;
  b=WST+MFGMF0hmiPw609n8CA+kXZqpwhjl8UJyRXj0df4hYvcC2GsjkAuh
   80tUc+6X/reNHYYwDJQQJKJ1WnFEgepKNNjbH8/T3QdqNecfhSp+fpW1Z
   i01JJWD6khDCH2ZhtXw9gdjLe1j8i/7y42osi7Xk2Mt8mFkgrz7n5Tkg2
   QI5/XMBkZp7f0VWUj4F6Y2LoCVHMiZeUNXFi+z1ZWJSsYsdwerl+yg7T5
   aMJVn/4FMbafrXyExS1mTbYaw7N7K0T+xF19Mecke68FVD/d9RcY/g5b1
   FCPpe5IosEjrB4E1PzMFZKDauPygTyuC3brhUxjiedN8dr2x7f/gf9pke
   Q==;
X-CSE-ConnectionGUID: oMWu/YOzTsagEI8SnbSSPw==
X-CSE-MsgGUID: nSuBJOp7TgquIS2bOUQ4fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2792993"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2792993"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 19:45:47 -0800
X-CSE-ConnectionGUID: oPeMau4qT3W9TbCQt5wwfg==
X-CSE-MsgGUID: HrIrFqUTSfyYnAaRg+hvKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7924255"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2026 19:45:46 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPtqh-00000000s0V-2ioA;
	Sun, 08 Nov 2026 03:45:43 +0000
Date: Sun, 08 Nov 2026 11:45:15 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v6 68/80]
 drivers/hwtracing/gtrace/gtrace-core.c:315:9: error: implicit declaration of
 function 'kfree'
Message-ID: <202611081118.NxCV6iLg-lkp@intel.com>
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
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261108/202611081118.NxCV6iLg-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081118.NxCV6iLg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081118.NxCV6iLg-lkp@intel.com/

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
