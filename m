Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3658B328B7F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 01:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790904530; cv=none; b=VYalzRi9W/zfNWwj/PvmJVzIF1NhrKoTX3wV7QJtQD1JYc0+57HT5MhZJtkXwvg6HwA5CPn5raQB7I2+sm3szB4+Hr3iQMBdIfl5z3XLNUlZXOdQH1GnJrhP0Ual0UO+Qyl87p7ai76wDSYVTHqZ8yEPJZ3CfCLvwgHutqOFoEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790904530; c=relaxed/simple;
	bh=vVkj218XW4vJ7pi3V1ju7TPDhNjeAtm/SWNJkvMJj8k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RfwqBtqdn1v9/fzE1hJ651kvga4Vy9Ijd8JfFIi2UNb2+29fYIKLFVmcEh/rSPB5RqPifTOgNF0aO6L6E6OAMfKQMDzd05WlvVoDxj13gqsayvJHiTcrxd2Xp1S5X4cnwlCRanOXgwfs/h8zjOI8RH5WcKzp0F1C+9cIy5s5ZDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TR0S88jH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TR0S88jH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790904529; x=1822440529;
  h=date:from:to:cc:subject:message-id;
  bh=vVkj218XW4vJ7pi3V1ju7TPDhNjeAtm/SWNJkvMJj8k=;
  b=TR0S88jHkjCKLu4FDzykBI5A5Gq8dWeUYECB91Nh/atNHyZzQ9/1a/oR
   x3LaBxBEBAa6Qh7TFOD9uwMnJbFul5diqg8XawQWlUkAvCSPR+ehRNbSS
   /Q8iG7U8yoqzZTk9GYmDbpWowrgEyWuRaPPudFARmkf9sgY6ki2oZwvqK
   yV3ev1DDrcL/ebII/qzaOH2rSq80pCQHCeFOPyV0IQ7xWXdaIoXrnyGbr
   roRVvcYDSa9mI83K5Kth1xrkIpUlcCW1QZeGiJs5CSO0o6d1LI2nmMesd
   K3s4+G5XCymrF7z24jm8fZ+0awfHdkh+NLKPYDU7PyO77G08miCV5qdq8
   A==;
X-CSE-ConnectionGUID: tBIIPEZJTkKF7fmwIvO6ig==
X-CSE-MsgGUID: UpT4XWfzR2KJYtsUVZMyVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102199221"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="102199221"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 18:28:42 -0700
X-CSE-ConnectionGUID: nc5mDFXUTzGm4czV1PhFng==
X-CSE-MsgGUID: IO5g0op2TGGWAOi+w+MBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="274228295"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Oct 2026 18:28:41 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCS4k-000000000KF-0bxf;
	Fri, 02 Oct 2026 01:28:38 +0000
Date: Fri, 02 Oct 2026 03:28:08 +0200
From: kernel test robot <lkp@intel.com>
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [avpatel:riscv_trace_acpi_support_v1 67/87]
 drivers/hwtracing/gtrace/gtrace-core.c:315:9: error: implicit declaration of
 function 'kfree'
Message-ID: <202610020323.iijf3Nkw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/avpatel/linux.git riscv_trace_acpi_support_v1
head:   dc5b9586f90cc15314085bdaa74661fc00d1688f
commit: 9d884d22932da958867424488aadb1ed67681c24 [67/87] hwtracing: gtrace: Initial implementation of gtrace framework
config: i386-randconfig-2200-20261002 (https://download.01.org/0day-ci/archive/20261002/202610020323.iijf3Nkw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020323.iijf3Nkw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020323.iijf3Nkw-lkp@intel.com/

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
