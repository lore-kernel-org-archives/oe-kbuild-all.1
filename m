Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03DF0377ED9
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 12:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781355423; cv=none; b=qVzduJq7vz1QCJrCmQYntF3o2lom82KqYNpApjKbkUe9ySzjuDTRnjo6djXPayYI0oNT0k9Sl5BZOHYnc1+lkGU7wKA+cjvy0smixyGqeDGgu74s1+MCCm+JtuhNL+5JN3guvsD4FacNb6+3UZAsfJcwHuXs24FUNjo4/eBiHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781355423; c=relaxed/simple;
	bh=3T/mJ58dx5Kbsrh4nwVl9hRtkcl3ZUpJZIzq/GWESns=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n/GtsfQytSA+ijrfjz+4Jq/yuFMPz/8rUQ6PJ0TdN1HNNKPUch6GEMm3zAArPrQiT7uGQBINsU78fpbkpq5nIwn66EBaLtLNHjLaIqlltSjEZjg/SiFLgzjhV8LqMuJxm4qozaxaWpqkFZ4xFjJBr5ORGvTCvXrEalPoyDNymhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IZ5gmJs2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IZ5gmJs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781355421; x=1812891421;
  h=date:from:to:cc:subject:message-id;
  bh=3T/mJ58dx5Kbsrh4nwVl9hRtkcl3ZUpJZIzq/GWESns=;
  b=IZ5gmJs2ut6GSzUtInEFhisU4SxzKHoVJzpUWvtVZ1s76wg/XE5k09nc
   R+U/794SUJ0mKGR7psbXan4HjBxoKissfeMniOcaaHB/ONoPr/wtjFTVN
   uPqXZAmtmffbdQx8Co8n4TD934hx9lwnJ8HS5MJodR3kkuZbrAZRy7OrK
   fbpNBvc5gUm0MkCiApZZGtdVLV93TQTHGZwQWRLS77rUBUs2eTcp8Qz4Q
   yLV12uyxjdRbocZC9hpmxGsskxf7ASOyYt8XSMiYjVapReMSOPACFTBZg
   y/Y3eBAfKyGcCtAMT1FMbrQDArSxrq67qG52d10RmvQAV0l5UG9TqanHo
   A==;
X-CSE-ConnectionGUID: t9Soa4tDQhauIrb3z1ZB6g==
X-CSE-MsgGUID: 5eNfHaEVSSWll7dt+L157Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81181463"
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="81181463"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 05:57:00 -0700
X-CSE-ConnectionGUID: 8o0M5g7KRgmgXAdPiu5Q1w==
X-CSE-MsgGUID: 9DvqOHJpSo6sydT9UYUdRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,202,1774335600"; 
   d="scan'208";a="251989657"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 13 Jun 2026 05:56:59 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYNux-00000000Pug-3kLL;
	Sat, 13 Jun 2026 12:56:55 +0000
Date: Sat, 13 Jun 2026 20:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cris:scmi_telemetry_unified_fs_V4 11/34]
 drivers/firmware/arm_scmi/telemetry.c:1228:16: sparse: sparse: incorrect type
 in return expression (different modifiers)
Message-ID: <202606132034.hjBY3OZS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cris/linux.git scmi_telemetry_unified_fs_V4
head:   ed28087005811783e972fe7a788446936878932f
commit: 3edc55c44f2aa68b42aba2b06d75aaed108fc466 [11/34] firmware: arm_scmi: Add basic Telemetry support
config: arc-randconfig-r132-20260613 (https://download.01.org/0day-ci/archive/20260613/202606132034.hjBY3OZS-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260613/202606132034.hjBY3OZS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606132034.hjBY3OZS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/telemetry.c:1228:16: sparse: sparse: incorrect type in return expression (different modifiers) @@     expected struct scmi_telemetry_res_info * @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1228:16: sparse:     expected struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:1228:16: sparse:     got struct scmi_telemetry_res_info [noderef] *
>> drivers/firmware/arm_scmi/telemetry.c:496:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:496:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:496:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
>> drivers/firmware/arm_scmi/telemetry.c:549:48: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:550:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:551:53: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:552:42: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:553:39: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:591:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:591:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:591:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:614:36: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:619:30: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:620:32: sparse: sparse: restricted __le32 degrades to integer
   drivers/firmware/arm_scmi/telemetry.c:734:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:734:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:734:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
>> drivers/firmware/arm_scmi/telemetry.c:848:20: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] flags @@     got unsigned long @@
   drivers/firmware/arm_scmi/telemetry.c:848:20: sparse:     expected restricted __le32 [usertype] flags
   drivers/firmware/arm_scmi/telemetry.c:848:20: sparse:     got unsigned long
   drivers/firmware/arm_scmi/telemetry.c:872:28: sparse: sparse: restricted __le32 degrades to integer
>> drivers/firmware/arm_scmi/telemetry.c:902:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 const @@
   drivers/firmware/arm_scmi/telemetry.c:902:56: sparse:     expected unsigned int
   drivers/firmware/arm_scmi/telemetry.c:902:56: sparse:     got restricted __le32 const
   drivers/firmware/arm_scmi/telemetry.c:939:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:939:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:939:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
>> drivers/firmware/arm_scmi/telemetry.c:1204:35: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected struct scmi_telemetry_res_info [noderef] * @@     got struct scmi_telemetry_res_info * @@
   drivers/firmware/arm_scmi/telemetry.c:1204:35: sparse:     expected struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1204:35: sparse:     got struct scmi_telemetry_res_info *
   drivers/firmware/arm_scmi/telemetry.c:1212:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1212:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1212:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
   drivers/firmware/arm_scmi/telemetry.c:1254:49: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct scmi_telemetry_res_info *rinfo @@     got struct scmi_telemetry_res_info [noderef] * @@
   drivers/firmware/arm_scmi/telemetry.c:1254:49: sparse:     expected struct scmi_telemetry_res_info *rinfo
   drivers/firmware/arm_scmi/telemetry.c:1254:49: sparse:     got struct scmi_telemetry_res_info [noderef] *
>> drivers/firmware/arm_scmi/telemetry.c:1009:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct eplg *_eplg @@     got void [noderef] __iomem * @@
   drivers/firmware/arm_scmi/telemetry.c:1009:20: sparse:     expected struct eplg *_eplg
   drivers/firmware/arm_scmi/telemetry.c:1009:20: sparse:     got void [noderef] __iomem *

vim +1228 drivers/firmware/arm_scmi/telemetry.c

  1130	
  1131	/**
  1132	 * scmi_telemetry_resources_alloc  - Resources allocation
  1133	 * @ti: A reference to the telemetry info descriptor for this instance
  1134	 *
  1135	 * This allocates and initializes dedicated resources for the maximum possible
  1136	 * number of needed telemetry resources, based on information gathered from
  1137	 * the initial enumeration: these allocations represent an upper bound on
  1138	 * the number of discoverable telemetry resources and they will be later
  1139	 * populated during late deferred further discovery phases.
  1140	 *
  1141	 * Return: 0 on Success, errno otherwise
  1142	 */
  1143	static int scmi_telemetry_resources_alloc(struct telemetry_info *ti)
  1144	{
  1145		/* Array to hold pointers to discovered DEs */
  1146		struct scmi_telemetry_de **des __free(kfree) =
  1147			kcalloc(ti->info.base.num_des, sizeof(*des), GFP_KERNEL);
  1148		if (!des)
  1149			return -ENOMEM;
  1150	
  1151		/* The allocated DE descriptors */
  1152		struct telemetry_de *tdes __free(kfree) =
  1153			kcalloc(ti->info.base.num_des, sizeof(*tdes), GFP_KERNEL);
  1154		if (!tdes)
  1155			return -ENOMEM;
  1156	
  1157		/* Allocate a set of contiguous DE info descriptors. */
  1158		struct scmi_tlm_de_info *dei_store __free(kfree) =
  1159			kcalloc(ti->info.base.num_des, sizeof(*dei_store), GFP_KERNEL);
  1160		if (!dei_store)
  1161			return -ENOMEM;
  1162	
  1163		/* Array to hold descriptors of discovered GROUPs */
  1164		struct scmi_telemetry_group *grps __free(kfree) =
  1165			kcalloc(ti->info.base.num_groups, sizeof(*grps), GFP_KERNEL);
  1166		if (!grps)
  1167			return -ENOMEM;
  1168	
  1169		/* Allocate a set of contiguous Group info descriptors. */
  1170		struct scmi_tlm_grp_info *grps_store __free(kfree) =
  1171			kcalloc(ti->info.base.num_groups, sizeof(*grps_store), GFP_KERNEL);
  1172		if (!grps_store)
  1173			return -ENOMEM;
  1174	
  1175		struct scmi_telemetry_res_info *rinfo __free(kfree) =
  1176			kzalloc(sizeof(*rinfo), GFP_KERNEL);
  1177		if (!rinfo)
  1178			return -ENOMEM;
  1179	
  1180		mutex_init(&ti->free_mtx);
  1181		INIT_LIST_HEAD(&ti->free_des);
  1182		for (int i = 0; i < ti->info.base.num_des; i++) {
  1183			mutex_init(&tdes[i].mtx);
  1184			/* Bind contiguous DE info structures */
  1185			tdes[i].de.info = &dei_store[i];
  1186			list_add_tail(&tdes[i].item, &ti->free_des);
  1187		}
  1188	
  1189		for (int i = 0; i < ti->info.base.num_groups; i++) {
  1190			grps_store[i].id = i;
  1191			/* Bind contiguous Group info struct */
  1192			grps[i].info = &grps_store[i];
  1193		}
  1194	
  1195		INIT_LIST_HEAD(&ti->fcs_des);
  1196	
  1197		ti->tdes = no_free_ptr(tdes);
  1198	
  1199		rinfo->des = no_free_ptr(des);
  1200		rinfo->dei_store = no_free_ptr(dei_store);
  1201		rinfo->grps = no_free_ptr(grps);
  1202		rinfo->grps_store = no_free_ptr(grps_store);
  1203	
> 1204		ACCESS_PRIVATE(ti, rinfo) = no_free_ptr(rinfo);
  1205	
  1206		return 0;
  1207	}
  1208	
  1209	static void scmi_telemetry_resources_free(void *arg)
  1210	{
  1211		struct telemetry_info *ti = arg;
  1212		struct scmi_telemetry_res_info *rinfo = ACCESS_PRIVATE(ti, rinfo);
  1213	
  1214		kfree(ti->tdes);
  1215		kfree(rinfo->des);
  1216		kfree(rinfo->dei_store);
  1217		kfree(rinfo->grps);
  1218		kfree(rinfo->grps_store);
  1219	
  1220		kfree(rinfo);
  1221	
  1222		ACCESS_PRIVATE(ti, rinfo) = NULL;
  1223	}
  1224	
  1225	static struct scmi_telemetry_res_info *
  1226	__scmi_telemetry_resources_get(struct telemetry_info *ti)
  1227	{
> 1228		return ACCESS_PRIVATE(ti, rinfo);
  1229	}
  1230	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
