Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F101833A9CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 20:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786652179; cv=none; b=Plmjt1fd2nVWdgy+PUTekFEPxjgnVnKqQ0/LfrjM3I7UufAdNoe+KWC/aio21fchWI+mwp13IqgEiZGemwCSKEocEwEWaPL0mah/Xnlw5v4G578wIkoZ9RdOGBuryl6EpR3aT9E07PaEgdyaeOA6a4KA0tB5MrcBbOB9T0Sx4gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786652179; c=relaxed/simple;
	bh=7UPY9mMoZJwUjunWeZBr2tg64NPtffey3tDZtUN7mpE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Pth8xyYqZhfEH10s0t1Ne7lzcjZLfH3vVyBVcCH/j+yteGRBy5I9fL3YKMzJ8FX/cq7Nbxu5d3yvQZnvnArXVl3MBB6aqpKXbx+ZXsXL77gjQdMVEclGGy76rLpgsJp5G9gECsLGXkCoweg9XVlkwy1QVZr12PG6sespNovIhq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hSdW5Fv2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hSdW5Fv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786652178; x=1818188178;
  h=date:from:to:cc:subject:message-id;
  bh=7UPY9mMoZJwUjunWeZBr2tg64NPtffey3tDZtUN7mpE=;
  b=hSdW5Fv2sBvvpJWneqiDYAogIHiFhrpNII7iFx1GLTQfhIDM0C0BnA9i
   0SyWPWFKUvcuxOzzv/xAroePfWgloDosV+JEfAWdt4eZZjWrFiV/SPCVi
   PsXLvGF0x+sUVfYD/0C9JeU528iMf8BQ+Pgao0yrXfJP6Qqz0x3q8J6Vf
   nPsXN3uoKGBFcOJQ95S6naMWwOXtFp8dqhpe+Zzb9S3OpIW8r05TscSIm
   h/AUW2lXE6/vES3zvE1ae/gV7w+izDFBHGMzWUx187LF6xs5/krObwDy7
   ApTLgC9avffWtEExPRE8QK/8HrarV8OiWn4rC8F2knlmnGINqJf/UPqZi
   g==;
X-CSE-ConnectionGUID: j9UQn1s4QN+zjKcbPp2v2A==
X-CSE-MsgGUID: cRTgMOyQTzq5kU27El/hEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="110020735"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="110020735"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 13:16:18 -0700
X-CSE-ConnectionGUID: sra0qzdpRzW8iuhFfZ9rbg==
X-CSE-MsgGUID: TfpoWfRRTOqRJJPOZDxQVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="262292623"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Aug 2026 13:16:16 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wubqY-00000000WVO-0yWj;
	Thu, 13 Aug 2026 20:16:14 +0000
Date: Fri, 14 Aug 2026 04:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 92/112]
 drivers/hwtracing/gtrace/gtrace-core.c:300:9: error: implicit declaration of
 function 'kfree'
Message-ID: <202608140405.83XnQFen-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   2251d17fd6ac95b1f6de32a893141a3481e3ad1d
commit: d3f10d6966418cbed0f472d36d4567b369e9bc53 [92/112] hwtracing: gtrace: Initial implementation of gtrace framework
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260814/202608140405.83XnQFen-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608140405.83XnQFen-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608140405.83XnQFen-lkp@intel.com/

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
