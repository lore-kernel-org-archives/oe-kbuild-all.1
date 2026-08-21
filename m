Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546D647254E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Aug 2026 10:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307876; cv=none; b=dAU1D/LyBuvCXzB8b/tb0uwpTass28ujw9FypydMkTB4QJvWhxFba0KxicIhuCbJ0vHTujaWG5WJ6If4zLPaQuxHHWKqI8IeY45gNmSFOjzeqLeeBPqUTJNsPNeJu/UWWOz8PM6Av78xtCfjgzdvR0c7WKeUIWyYzrd68VfZntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307876; c=relaxed/simple;
	bh=UkkOMQikOSq1RnyC5PonmdGI77HA7b6PKfbsuaLwdxA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iD+JMF3CZXU3tjeqNTf5mB75BgCL/Lxo4QSPXXcdbdQTjsBB+nAuiOLmgjqiVklXXJWNVa668NUzltFiUidI9FCNt6rHPz452M2HWs26Iswjy75e5pi3poCdAP0cJZaFmFszrZhN79MWr1AKuyColtTpi5NEzVhp2H/KC89l3Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwDKps8h; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwDKps8h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787307871; x=1818843871;
  h=date:from:to:cc:subject:message-id;
  bh=UkkOMQikOSq1RnyC5PonmdGI77HA7b6PKfbsuaLwdxA=;
  b=UwDKps8hCg7DQSfy8tC1H/2ihXcerqhItZt59JyBjmuViJ3sfJDwiVww
   tTqltO7HKomAqJfJus6DRpOlNU7eLbBxdp+curoxYm2ZLiXwbyzSK77Ai
   MccvEuHQs1sPOgsMf1dKSIx8dL4oyEwSDTHaA2cUSRI9G/NSaDgTjYtXk
   HnL/nrlp5TgEjgi9c2n/HFx271Fq6FD+ydFlgfjLB84eQne4jIRCXaJp2
   clp9/HM8IEc/jEF9YuL/SJCL1dTFDdZOu3mctmCbNu82rJtyhbjbuhSKg
   8k8aVdcPIfcPGNQbYj4vTygYDLDbYNHVWYHm6AdJnschEbuykMRnZZK+E
   w==;
X-CSE-ConnectionGUID: 0/a3TSiaT4K9rAOFvPtubA==
X-CSE-MsgGUID: +gnV/GcPSFeK8ieX53e1yA==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="98189830"
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="98189830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 03:24:28 -0700
X-CSE-ConnectionGUID: tsc54YUXSG+sQESOz3iDbg==
X-CSE-MsgGUID: N5whnqewSJiHPvLOhYvtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,234,1779174000"; 
   d="scan'208";a="263021118"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 21 Aug 2026 03:24:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxMQC-00000000piv-0Zw3;
	Fri, 21 Aug 2026 10:24:24 +0000
Date: Fri, 21 Aug 2026 18:24:17 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v5 96/108]
 drivers/hwtracing/gtrace/gtrace-core.c:300:9: error: implicit declaration of
 function 'kfree'
Message-ID: <202608211840.twlbnI0G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   e58ea3f194d326370813c549a76ecdfa211a4768
commit: 7eb7691614f11ec061f1986bde65b11a34af97e9 [96/108] hwtracing: gtrace: Initial implementation of gtrace framework
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260821/202608211840.twlbnI0G-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260821/202608211840.twlbnI0G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608211840.twlbnI0G-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
>> drivers/hwtracing/gtrace/gtrace-core.c:300:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     300 |         kfree(comp);
         |         ^~~~~
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
>> drivers/hwtracing/gtrace/gtrace-core.c:343:16: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     343 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |                ^~~~~~~
>> drivers/hwtracing/gtrace/gtrace-core.c:343:14: error: assignment to 'struct gtrace_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     343 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |              ^


vim +/kfree +300 drivers/hwtracing/gtrace/gtrace-core.c

   293	
   294	static void gtrace_component_release(struct device *dev)
   295	{
   296		struct gtrace_component *comp = to_gtrace_component(dev);
   297	
   298		fwnode_handle_put(comp->dev.fwnode);
   299		gtrace_free_type_idx(comp);
 > 300		kfree(comp);
   301	}
   302	
   303	struct gtrace_component *gtrace_register_component(struct gtrace_component_id *id,
   304							   const char *name,
   305							   struct gtrace_platform_data *pdata)
   306	{
   307		struct gtrace_connection *conn;
   308		struct gtrace_component *comp;
   309		int i, ret = 0;
   310	
   311		if (!id || id->type >= GTRACE_COMPONENT_TYPE_MAX) {
   312			ret = -EINVAL;
   313			goto err_out;
   314		}
   315	
   316		if (!pdata || !pdata->dev) {
   317			ret = -EINVAL;
   318			goto err_out;
   319		}
   320	
   321		for (i = 0; i < pdata->nr_inconns; i++) {
   322			if (pdata->inconns[i]) {
   323				ret = -EINVAL;
   324				goto err_out;
   325			}
   326		}
   327	
   328		for (i = 0; i < pdata->nr_outconns; i++) {
   329			conn = pdata->outconns[i];
   330			if (!conn || conn->src_port < 0 || conn->src_comp ||
   331			    !device_match_fwnode(pdata->dev, conn->src_fwnode) ||
   332			    conn->dest_port < 0 || !conn->dest_fwnode || !conn->dest_comp) {
   333				ret = -EINVAL;
   334				goto err_out;
   335			}
   336		}
   337	
   338		if (pdata->bound_cpu >= 0 && !cpu_present(pdata->bound_cpu)) {
   339			ret = -EINVAL;
   340			goto err_out;
   341		}
   342	
 > 343		comp = kzalloc(sizeof(*comp), GFP_KERNEL);
   344		if (!comp) {
   345			ret = -ENOMEM;
   346			goto err_out;
   347		}
   348		comp->pdata = pdata;
   349		comp->id = *id;
   350		ret = gtrace_alloc_type_idx(comp);
   351		if (ret) {
   352			kfree(comp);
   353			goto err_out;
   354		}
   355	
   356		comp->dev.parent = pdata->dev;
   357		comp->dev.coherent_dma_mask = pdata->dev->coherent_dma_mask;
   358		comp->dev.release = gtrace_component_release;
   359		comp->dev.bus = &gtrace_bustype;
   360		comp->dev.fwnode = fwnode_handle_get(dev_fwnode(pdata->dev));
   361		dev_set_name(&comp->dev, "%s-%u", name ? name : "comp", comp->type_idx);
   362	
   363		mutex_lock(&gtrace_mutex);
   364	
   365		ret = device_register(&comp->dev);
   366		if (ret) {
   367			put_device(&comp->dev);
   368			goto err_out_unlock;
   369		}
   370	
   371		for (i = 0; i < pdata->nr_outconns; i++) {
   372			conn = pdata->outconns[i];
   373			conn->src_comp = comp;
   374		}
   375	
   376		ret = gtrace_setup_inconns_from_outconns(comp);
   377		if (ret < 0) {
   378			device_unregister(&comp->dev);
   379			goto err_out_unlock;
   380		}
   381	
   382		if (comp->pdata->bound_cpu >= 0) {
   383			gtrace_get_component(comp);
   384			per_cpu(gtrace_cpu_source_comp, comp->pdata->bound_cpu) = comp;
   385		}
   386	
   387		mutex_unlock(&gtrace_mutex);
   388	
   389		return comp;
   390	
   391	err_out_unlock:
   392		mutex_unlock(&gtrace_mutex);
   393	err_out:
   394		return ERR_PTR(ret);
   395	}
   396	EXPORT_SYMBOL_GPL(gtrace_register_component);
   397	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
