Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B49444705
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Aug 2026 21:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568499; cv=none; b=FTALGL3E/DCkir8ZtdeZPVlMqyow03eOvg2rarewSh8sN6dRpXUzAJgRmjBeIpR0i4g3iMnZSw3cvu2YJwktXetCxz76Z/jsIfT39R5f91jrC0g2g3EQt9EajKBraFKgEx6Dc5jb1eUlO3oVOhEfF5Y+/+dDSg5EXfVT4j6EBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568499; c=relaxed/simple;
	bh=eXNFSRn4qWvgVWJKzJEnE9tYq1kCoH5GLK66AuoJqzE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mzd8KMJbK/ma/IGd89oKphDnfdSMyMlb6dPeJjvwBcpuv/88XwtySzhsr1a8mCnz6D0Orj44mhpqflplXurXHTZ8QFsDxDPDCHdNk6j2UoD9e+9DV+GzZy5OCGDklu8Jhf04VPY/shtBv5V0GcQnFCnwThgZnJwm7h/iUJRAYjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XLi3hoEd; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XLi3hoEd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786568498; x=1818104498;
  h=date:from:to:cc:subject:message-id;
  bh=eXNFSRn4qWvgVWJKzJEnE9tYq1kCoH5GLK66AuoJqzE=;
  b=XLi3hoEdiwbYUfGuTI4fgiOsalcI9Dlv+MimVYvehuisdCxjnsi5ousZ
   1EefxXSlNGJ0pIJ81zXUNdhYgBHuiOiNdyLV7XoXlGmnbiOPlQjy0e37Z
   uvz2F0wI7tD7i1yKZfRh0FNoEWnZiQlZ1IyrbCGaUU+2pD4bmQ/bkxCuz
   ejnehe/FE/m+7siuangY1igBpr7v3UwxhYGvPq85iOpFDCP7t6Cxj1snR
   jpH/CZR6rSkoIqOfox3AO0FnwCL8QakIVZAIheECvbIe5H/Xm1UX7uLV0
   sGjcrRpiQmwMnWxiOD5CNGGGaHHAKg/jPrfaGs/xGTxJmyrh+x2dLr0BP
   Q==;
X-CSE-ConnectionGUID: n4PyYRXCQmqk2icYUqUYTw==
X-CSE-MsgGUID: T7H2xgvXQIGgEkU0fCGgzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="86098015"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="86098015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 14:01:36 -0700
X-CSE-ConnectionGUID: G7iTYOIPTdO/+1Ex5qyjDg==
X-CSE-MsgGUID: BeMzbZABQd6+6vWHx64ZuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="287200712"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Aug 2026 14:01:34 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuG4q-00000000RhO-0DTs;
	Wed, 12 Aug 2026 21:01:32 +0000
Date: Thu, 13 Aug 2026 05:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_support_v5 92/104]
 drivers/hwtracing/gtrace/gtrace-core.c:300:2: error: call to undeclared
 function 'kfree'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202608130418.2pqBjyc6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v5
head:   1d99b155d3c1ca9a30209d51590db002a606f30c
commit: d3f10d6966418cbed0f472d36d4567b369e9bc53 [92/104] hwtracing: gtrace: Initial implementation of gtrace framework
config: arm-randconfig-r053-20260812 (https://download.01.org/0day-ci/archive/20260813/202608130418.2pqBjyc6-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608130418.2pqBjyc6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608130418.2pqBjyc6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/hwtracing/gtrace/gtrace-core.c:300:2: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     300 |         kfree(comp);
         |         ^
>> drivers/hwtracing/gtrace/gtrace-core.c:343:9: error: call to undeclared function 'kzalloc'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     343 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |                ^
>> drivers/hwtracing/gtrace/gtrace-core.c:343:7: error: incompatible integer to pointer conversion assigning to 'struct gtrace_component *' from 'int' [-Wint-conversion]
     343 |         comp = kzalloc(sizeof(*comp), GFP_KERNEL);
         |              ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/hwtracing/gtrace/gtrace-core.c:352:3: error: call to undeclared function 'kfree'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     352 |                 kfree(comp);
         |                 ^
   4 errors generated.


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
