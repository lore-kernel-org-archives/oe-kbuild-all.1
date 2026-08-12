Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38A17B50F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 07:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786519788; cv=none; b=AYtaYbDcoWb0ed2Z/+JKXtYDSzTJP6m6DgDX41uZH9eVian7IfC2oa6VlIKAxdB47Rk2i0Eqd+Uc8+/RUWlDrhhAhNEfMZWm/YMBQsH4xpfxBlZdNNRfZOXPpYt1hg73A8sPP+NHx//Waybhclo/PGy2zr3Bw9yGG/FhSKIifw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786519788; c=relaxed/simple;
	bh=qe3zumMi0PhqBQOKg6fb3CHPgFrtFrtQmSfCuqDWoQM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rHV24vRHMJT2voG3Ie8Bv0VCsAhiFlS3KNrhKXj7o2cmk6LcaQI39mWhEi4MQE18xfmumDiqUpXzEQc7ceXnAQBiYVdeWMvEDTinZqkQD5zeitJiP8iVj0BPGC0XMMRqDzI0xtNe+ltHMCvzFHt+MKtexvg46F7OIThEhKY3Deg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fo8TCxci; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fo8TCxci"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786519787; x=1818055787;
  h=date:from:to:cc:subject:message-id;
  bh=qe3zumMi0PhqBQOKg6fb3CHPgFrtFrtQmSfCuqDWoQM=;
  b=fo8TCxciR/GfUQ02ohAHM1VbdgAswadN0xELByJ5eR/6HM7D9CQjgHxo
   1d7ZHVCXLEuKpz/oEZsEq4GLNI1lIzq82OtJSuqCy+yqGoUG8216UPfqr
   0xrHW7AWdeLsBq1pR3gF8b+hRiM+CVBW8M6/3zQalVlzX0Bq9vW16IPpa
   a6dOodBiPuSKOJN0h2ihVv5Xm4yM5+/isMbVZspeCPosLQX+zsbTp7rQU
   FbYnR+41vw3g1wkbBa6d5txDydFdiM7A2YLiGgo8MfFasSOmbg/6HXc0X
   pIJpiT55Y/J3zK40QhGPjMU0L0p0jsM6QZ6DkU/FAkAWyXuknDIKg45Lb
   A==;
X-CSE-ConnectionGUID: Bnr+JX7gQ6GpMsuFRDOH9Q==
X-CSE-MsgGUID: PYbMGLeVQ8aHOFbE0uDadg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90741100"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90741100"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:29:47 -0700
X-CSE-ConnectionGUID: e8McC7wiS86tdOYH/XB/WA==
X-CSE-MsgGUID: 0LKu/egmSx6mLpd8b3R5SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="288297882"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 12 Aug 2026 00:29:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wu3PC-00000000Q0r-2lkS;
	Wed, 12 Aug 2026 07:29:42 +0000
Date: Wed, 12 Aug 2026 15:29:31 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v5 92/104]
 drivers/hwtracing/gtrace/gtrace-core.c:343:7: warning: assignment to 'struct
 gtrace_component *' from 'int' makes pointer from integer without a cast
Message-ID: <202608121554.tw488HTf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   1d99b155d3c1ca9a30209d51590db002a606f30c
commit: d3f10d6966418cbed0f472d36d4567b369e9bc53 [92/104] hwtracing: gtrace: Initial implementation of gtrace framework
config: csky-randconfig-r051-20260812 (https://download.01.org/0day-ci/archive/20260812/202608121554.tw488HTf-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260812/202608121554.tw488HTf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608121554.tw488HTf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_component_release':
   drivers/hwtracing/gtrace/gtrace-core.c:300:2: error: implicit declaration of function 'kfree' [-Werror=implicit-function-declaration]
     300 |  kfree(comp);
         |  ^~~~~
   drivers/hwtracing/gtrace/gtrace-core.c: In function 'gtrace_register_component':
   drivers/hwtracing/gtrace/gtrace-core.c:343:9: error: implicit declaration of function 'kzalloc' [-Werror=implicit-function-declaration]
     343 |  comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |         ^~~~~~~
>> drivers/hwtracing/gtrace/gtrace-core.c:343:7: warning: assignment to 'struct gtrace_component *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     343 |  comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |       ^
   cc1: some warnings being treated as errors


vim +343 drivers/hwtracing/gtrace/gtrace-core.c

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
