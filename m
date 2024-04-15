Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489134A23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Apr 2024 05:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713158117; cv=fail; b=BciUF/YdR06oXzE0FN1rnGCb+Hjv7FgXinze4SIVZcEvItdcJtiNofaztCOUrKS6NBLA72Xd+p1mgKbSsUjRdWOxt/sa8PdbEf0YOwVmh/UONPATK8wp+qhjsMhGrnIOIiieQz9c70+Yey2zSRyin8qFwZEWPq/c48WQQkIM0H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713158117; c=relaxed/simple;
	bh=XruP28TRTW3bwHTy7X+iq/zz7THgUiJsFt6dr52KinQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Cf0cLpUz59ITNFY3o1AkSYD4vs+0dSztVxmfTRBcMUTSpYqu9apKvgcxIOxyBDnU28O+TuaRQ4fPgS+ZWIWjs8ViMUXyPxb5CMMV2HKsaUdFTgDDK/WBurBX59iBWFp+vO7ExNFB/h7ZC9w6yhWklXYZLibq7tgnuvMaonjH/28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KymVwgtT; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KymVwgtT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713158116; x=1744694116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XruP28TRTW3bwHTy7X+iq/zz7THgUiJsFt6dr52KinQ=;
  b=KymVwgtT487UTl79pkyWhdudDEUj56L7XHPmWahxnY/fRVVCrBPVoon7
   8Lt36WMsJDQXPk9GjzcvcnSJNxeGatJBWvJPwPA6mWv6XTty+atqNm0jN
   EJZjVAckpcHKUKFuDVgw+nEkunWkSOJ8EhmsijsKZ43su3/+layYCD3O4
   pIUFNlPg47Om0BsXssSTRs8r34Q5zuRGJkzdyLkKnKWpQcH0vxr6KZtNy
   xqCzvuPdZl6i7isJ+/1ZhT+C8aRTHgLNcLbnB2ZZbLpjR9hDUJZ4tWmap
   9w0HkdRzDV5t35qamqOIueuHy9c2Hp8fN03BWk5L5AlTPbPYqBa55NzTQ
   A==;
X-CSE-ConnectionGUID: bY8zg21eSZ+06bdaBksBPw==
X-CSE-MsgGUID: 2OHG2UgeQFOTFI9hGg1qcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11044"; a="8653231"
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="8653231"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 22:15:16 -0700
X-CSE-ConnectionGUID: rJkpLu5CTm+xov7Ln/VZyg==
X-CSE-MsgGUID: vlk6AyViQSuNYit8TysK3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,202,1708416000"; 
   d="scan'208";a="22274182"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Apr 2024 22:15:15 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 14 Apr 2024 22:15:15 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 14 Apr 2024 22:15:15 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 14 Apr 2024 22:15:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEIopp7PGdGQ4+XZ6Uo1+RRkrLVRK743etKQcgxqVdRxA9WvIBp99GRU1PP6jVGPuPA/99fMJcAeNUv6UvClx+XY/c6olDxI9qCcIKnKckNYdld7RFRqO2OU8tjOfiDnCFMd84JLbxeC12zuKy7T8vRJUTuXgRHxGr3QPrHBM1qmWwfWmGRfW+RDo6Z6sASF9YlfYqedekgs4EUgUyNzCej6I4ztOvgYq7Q2H2aA0jg8oycBOnn00WwyUD/QRMprAdZTuLE+7xMFcxXcj5ewckZ3KSdRxAnQ3rPFs6WMu9XuqXgYn3rTZ+2SDzvJiRJazUlLqdKdD+wjDtJn8+eqfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0d7k1yYj9gsvWlQY10o5TBnu5aVR7IKwl9ZjIc2qKTo=;
 b=ME35lhI7oGY4ejlJP7ZA3oObabuHeUu4hdIJH/X7sOWXBi6ysrjTdQDV2tCPtkv9vcRH1YqFr4A71LTkpfEiwsQGvALN9zD6LOmbdC3MgRMJ0pbIKC9ysX9h/65NfmkX2HP82uR26hu4lQwGzHzqsv1X41UyvbCmNBGwK/gcRal1UNWwIWUvfAeC4SehHD9rcy3jGCPhPIevDfKLdyl/LlWucAO8baBw3dchGN/ct+x+ap7LLsPn3eZJWbNCrMlR4HwDQUzm9byz0MADVaE+5TEV01jyKWCNziGzLI7j38V/2msKg3Ra2mxFtxPw8W3HKGeo1H5GKeed8mIdVdeW8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by CY5PR11MB6116.namprd11.prod.outlook.com (2603:10b6:930:2b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Mon, 15 Apr
 2024 05:15:12 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::c0cf:689c:129c:4bcd%6]) with mapi id 15.20.7452.041; Mon, 15 Apr 2024
 05:15:12 +0000
Date: Mon, 15 Apr 2024 13:08:38 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Alvin Lee <alvin.lee2@amd.com>
CC: <oe-kbuild-all@lists.linux.dev>, Alex Deucher <alexander.deucher@amd.com>,
	Wenjing Liu <wenjing.liu@amd.com>
Subject: [agd5f:drm-next-6.10 64/316] drivers/gpu/drm/amd/display/dc/dc.h:
 dc_stream.h is included more than once.
Message-ID: <202404141041.DGVcd1M8-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::19)
 To SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|CY5PR11MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c8b3d12-c4ff-473e-3af6-08dc5d0b0727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cyn8IVLYQmu2pQTNx35M37MLyDvHRliry3Qgl1pg26bs1fhF/RWUWfVTsJ9LMs4TR1MD4Is+/jQivVDjYl8R9ycEp4wjMGXPU2XRjOQwkFYTtY+Xj/XC6aTQ8avaWyGYaqHm82d+D/HOUXHvG3AXpLx7VcRAZucKAicmTcyD2DyOZhmsTD9MtqyhLeF0FA/D9fv9FOZwM1dZrAdKq/ynb/1RpZfM9dvIduXkpE8yc75QEJFT0a4X4ICGb1UTrFjRO+UhgV96uux7GTeCBxtKcyxkSM1i8qoXRpTQbH7OTcQk8sW4Va1kxSu9TC6aCXDwteUzASr7/L7a3Gp5UEJNRLCCKV6HmojbLyDwmFCC8l55eU0K+Sjadoui6fCQj8C4X24oUYVjbrTEkfZtJRs7Cvt0xQDv47/8NLBM0jpjtVM/j2dlEzv5PL5qMnTWhB+KZwOt0gG6Dq3TtvOrgmR8Gy7FI9caFkUqgy4efuaOcwosbESgJ/cCIo7Pns8pj8m9ZzPretz7Uksa1DqTdFBI3yOmNdjwrj+CyaZxaMNQJklwuCG1Mqh55Tvj/sabDJbcSScypt+LfIum2Q2ITgnpQalWLPhgQ65QmfV97eEvDraRawVD/+YnIEz0h/ndb5F2
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3269Er+rba1AswRp7XEBgtaMNaG1ysk+pFaz0tUXhMfZdp3aKbyQ7qKwrfa3?=
 =?us-ascii?Q?fLdh5vTUIH94QtM7DsgMu7ILSYLs/qE6kGTCGSWfnwzDCnGtYsnoOrVEF1jQ?=
 =?us-ascii?Q?3NuJXiWP9WM1Fmm0b0EXqMnVG1BFlZHKhl//ErRF1+9DcGtTjNYonwZIEujc?=
 =?us-ascii?Q?mZidxUNLG6wCcA2grscv/B9cTwVdSPgqdUrZRm0dZVvjV5L9xotTB3qHQ9X5?=
 =?us-ascii?Q?SGRYMYsve1Ck8tGh2FPfAs21CCKc8QzZfEYnJ3E4cU7tkXpVVNJFO6uovW0j?=
 =?us-ascii?Q?L31sIdsOsm8I8VBGA9hXEKymKDBNzEGkIA2KfnWDA5GnNq5OqohIhCbI7O8h?=
 =?us-ascii?Q?AVIVFfzzwRFTUVbw+GenuiCDre0MbAMO77MUV5EWE8x5kXlpgU3rb0TEqwgX?=
 =?us-ascii?Q?2JJBeyL0Xt4VUb/vCE34ZhmLns8kAeXMVVjMlM8qg1B7FJnSx3gQ2moCjbed?=
 =?us-ascii?Q?oIhZA+dhMucH5QLNiAWjd5kPdOUK80FXL0U1r63euEzZ2OR/hxQkEukrN3LT?=
 =?us-ascii?Q?0A/jLE9E7GICees+8zkXeldz1KmOkqXrNOpYxai1ACkwQ5qymrFX3lLPe5W+?=
 =?us-ascii?Q?iyyZAQoDiMzeSaU3VfTmnb955YVub6R6/+mXUkAQfp5kWGiN6TrRAr21I5lX?=
 =?us-ascii?Q?Z0Z1O+SyWRDtck9MK50kr8LCtZqIgp2CtxLcOCnofazHswsS8tOYuiyFuFyd?=
 =?us-ascii?Q?+EelU3EhS3gPC/lLG/egLFX8MAd5nFsCvS2u4ekwZIJy/wYrzInaBztjlJsN?=
 =?us-ascii?Q?DP2XeUHmmrmO9+zC6yTVRuQz2Zuy4ZSo5EpF5gMS9JWZlHoYT+8xFxi0BSyO?=
 =?us-ascii?Q?rXEmmrGPPaYFfKEl9hyw/wnzjJh2MDmhyi06WXFHz1JY/ynukPcjxlxZxc9R?=
 =?us-ascii?Q?iAPLoNrR0+10rrc+cCOwKaYeiVDs0NOimqw5EjGNSaDwrdalhio433eE3GE7?=
 =?us-ascii?Q?2QHQdvUmDsMLAOE3/TpNn+KyEZ/4dE+auWfcUK1TWvCQSNI1C0mgGIFeZbk/?=
 =?us-ascii?Q?CZWa0DWFc1cm1uuzmsRuZo87IumWhXQ28T/ipTk7eZkt6ZTZi1Tu3l5XanVl?=
 =?us-ascii?Q?e/lRZqfZjSgAEAlxlY2zXNUvrnLXvQC70XfJwvjEgG038mGbOAd+p6ej/sGN?=
 =?us-ascii?Q?QWntm621BI/KyjbNcngdIwDno0ugt4Yfy+LuVVOFmZL5GHEdLexuFgWlTV20?=
 =?us-ascii?Q?uM3VmEsj0CtOioB4hSD/DkCXQFchGwGcc/avBExxWjlCrVa3SzgoSt0otDw+?=
 =?us-ascii?Q?zRFgNglXnslOV1HVRgefqvdqlIt8ifyZul6Kva/V8mK0ILoOT4Bp5Zm0MoAB?=
 =?us-ascii?Q?I70z/8mC01CFyNPnPW7euTfzud5AkWU9zirKlUQ4MW7M7qiN9lGEsvQ0RNcW?=
 =?us-ascii?Q?gkES8dQUJ6SoqZ1BZQezk8PT4VZ7MY+F2M1/5os/VMnoiv7dD9GP3z4fl1vm?=
 =?us-ascii?Q?miScqbGpGkQPVqJag5KPT5FQBuuint+yCzNdXPwN1mvt4JAhEn0Mwall6202?=
 =?us-ascii?Q?ulw6Gm5DMNOmB7P9Qbj8l3xiuVm2UgIDY0Uy6NgwvAV6lZjajXgdegVAjxhd?=
 =?us-ascii?Q?giUPik9Vnb7wyZAFPSbKPoGCz1CQ4Pt2U322b1YH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c8b3d12-c4ff-473e-3af6-08dc5d0b0727
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2024 05:15:12.8483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wRBa05jODosxDzbXL4ZlWycE+tWy1HCWJqGddmcDR/K/4wp78bCCI3TGoTkiJdT8Bbj4SqiWDwi1WXxhrwPfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6116
X-OriginatorOrg: intel.com

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next-6.10
head:   ab956ed95b8bc4a65c913d7057075866d5fc3724
commit: d62d5551dd615f9e488b13595d69b308cd019e16 [64/316] drm/amd/display: Backup and restore only on full updates
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202404141041.DGVcd1M8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/display/dc/dc.h: dc_stream.h is included more than once.

vim +1296 drivers/gpu/drm/amd/display/dc/dc.h

  1295	
> 1296	#include "dc_stream.h"
  1297	
  1298	struct dc_scratch_space {
  1299		/* used to temporarily backup plane states of a stream during
  1300		 * dc update. The reason is that plane states are overwritten
  1301		 * with surface updates in dc update. Once they are overwritten
  1302		 * current state is no longer valid. We want to temporarily
  1303		 * store current value in plane states so we can still recover
  1304		 * a valid current state during dc update.
  1305		 */
  1306		struct dc_plane_state plane_states[MAX_SURFACE_NUM];
  1307		struct dc_gamma gamma_correction[MAX_SURFACE_NUM];
  1308		struct dc_transfer_func in_transfer_func[MAX_SURFACE_NUM];
  1309		struct dc_3dlut lut3d_func[MAX_SURFACE_NUM];
  1310		struct dc_transfer_func in_shaper_func[MAX_SURFACE_NUM];
  1311		struct dc_transfer_func blend_tf[MAX_SURFACE_NUM];
  1312	
  1313		struct dc_stream_state stream_state;
  1314		struct dc_transfer_func out_transfer_func;
  1315	};
  1316	
  1317	struct dc {
  1318		struct dc_debug_options debug;
  1319		struct dc_versions versions;
  1320		struct dc_caps caps;
  1321		struct dc_cap_funcs cap_funcs;
  1322		struct dc_config config;
  1323		struct dc_bounding_box_overrides bb_overrides;
  1324		struct dc_bug_wa work_arounds;
  1325		struct dc_context *ctx;
  1326		struct dc_phy_addr_space_config vm_pa_config;
  1327	
  1328		uint8_t link_count;
  1329		struct dc_link *links[MAX_PIPES * 2];
  1330		struct link_service *link_srv;
  1331	
  1332		struct dc_state *current_state;
  1333		struct resource_pool *res_pool;
  1334	
  1335		struct clk_mgr *clk_mgr;
  1336	
  1337		/* Display Engine Clock levels */
  1338		struct dm_pp_clock_levels sclk_lvls;
  1339	
  1340		/* Inputs into BW and WM calculations. */
  1341		struct bw_calcs_dceip *bw_dceip;
  1342		struct bw_calcs_vbios *bw_vbios;
  1343		struct dcn_soc_bounding_box *dcn_soc;
  1344		struct dcn_ip_params *dcn_ip;
  1345		struct display_mode_lib dml;
  1346	
  1347		/* HW functions */
  1348		struct hw_sequencer_funcs hwss;
  1349		struct dce_hwseq *hwseq;
  1350	
  1351		/* Require to optimize clocks and bandwidth for added/removed planes */
  1352		bool optimized_required;
  1353		bool wm_optimized_required;
  1354		bool idle_optimizations_allowed;
  1355		bool enable_c20_dtm_b0;
  1356	
  1357		/* Require to maintain clocks and bandwidth for UEFI enabled HW */
  1358	
  1359		/* FBC compressor */
  1360		struct compressor *fbc_compressor;
  1361	
  1362		struct dc_debug_data debug_data;
  1363		struct dpcd_vendor_signature vendor_signature;
  1364	
  1365		const char *build_id;
  1366		struct vm_helper *vm_helper;
  1367	
  1368		uint32_t *dcn_reg_offsets;
  1369		uint32_t *nbio_reg_offsets;
  1370		uint32_t *clk_reg_offsets;
  1371	
  1372		/* Scratch memory */
  1373		struct {
  1374			struct {
  1375				/*
  1376				 * For matching clock_limits table in driver with table
  1377				 * from PMFW.
  1378				 */
  1379				struct _vcs_dpi_voltage_scaling_st clock_limits[DC__VOLTAGE_STATES];
  1380			} update_bw_bounding_box;
  1381			struct dc_scratch_space current_state;
  1382			struct dc_scratch_space new_state;
  1383		} scratch;
  1384	
  1385		struct dml2_configuration_options dml2_options;
  1386		enum dc_acpi_cm_power_state power_state;
  1387	
  1388	};
  1389	
  1390	struct dc_scaling_info {
  1391		struct rect src_rect;
  1392		struct rect dst_rect;
  1393		struct rect clip_rect;
  1394		struct scaling_taps scaling_quality;
  1395	};
  1396	
  1397	struct dc_fast_update {
  1398		const struct dc_flip_addrs *flip_addr;
  1399		const struct dc_gamma *gamma;
  1400		const struct colorspace_transform *gamut_remap_matrix;
  1401		const struct dc_csc_transform *input_csc_color_matrix;
  1402		const struct fixed31_32 *coeff_reduction_factor;
  1403		struct dc_transfer_func *out_transfer_func;
  1404		struct dc_csc_transform *output_csc_transform;
  1405	};
  1406	
  1407	struct dc_surface_update {
  1408		struct dc_plane_state *surface;
  1409	
  1410		/* isr safe update parameters.  null means no updates */
  1411		const struct dc_flip_addrs *flip_addr;
  1412		const struct dc_plane_info *plane_info;
  1413		const struct dc_scaling_info *scaling_info;
  1414		struct fixed31_32 hdr_mult;
  1415		/* following updates require alloc/sleep/spin that is not isr safe,
  1416		 * null means no updates
  1417		 */
  1418		const struct dc_gamma *gamma;
  1419		const struct dc_transfer_func *in_transfer_func;
  1420	
  1421		const struct dc_csc_transform *input_csc_color_matrix;
  1422		const struct fixed31_32 *coeff_reduction_factor;
  1423		const struct dc_transfer_func *func_shaper;
  1424		const struct dc_3dlut *lut3d_func;
  1425		const struct dc_transfer_func *blend_tf;
  1426		const struct colorspace_transform *gamut_remap_matrix;
  1427	};
  1428	
  1429	/*
  1430	 * Create a new surface with default parameters;
  1431	 */
  1432	void dc_gamma_retain(struct dc_gamma *dc_gamma);
  1433	void dc_gamma_release(struct dc_gamma **dc_gamma);
  1434	struct dc_gamma *dc_create_gamma(void);
  1435	
  1436	void dc_transfer_func_retain(struct dc_transfer_func *dc_tf);
  1437	void dc_transfer_func_release(struct dc_transfer_func *dc_tf);
  1438	struct dc_transfer_func *dc_create_transfer_func(void);
  1439	
  1440	struct dc_3dlut *dc_create_3dlut_func(void);
  1441	void dc_3dlut_func_release(struct dc_3dlut *lut);
  1442	void dc_3dlut_func_retain(struct dc_3dlut *lut);
  1443	
  1444	void dc_post_update_surfaces_to_stream(
  1445			struct dc *dc);
  1446	
> 1447	#include "dc_stream.h"
  1448	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

