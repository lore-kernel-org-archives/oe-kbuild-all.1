Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A25B212554
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776045484; cv=fail; b=SiRdL1lawrJCYcUq37j+9OBqMtC3E6emqlmq5rvwDeeT7mAYB0QuR99m5mGj96jAIc1Zn0pN5BGF0R5oADMxmUT79I/5hQgV8EIaDY9ucguEdQoWpuW2hvNxSU+jdhzeGAtHeiWkKUrdBTegiqx/0QsS22+9D2m3URdErzXYKyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776045484; c=relaxed/simple;
	bh=TnrPR9yQ6YsE3lN8LqmbE+O2vHXeGGaqVbnxwSmrN1k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ou6IMcpXY9OZ6OEduIcX8DJYuyKKSd9anrZa2S4LoZHdvx3U6bMNPpBrxSkGyDyFqBskNzpphN5xwQfDFjolt/litDxwJBV7MKfAoiE9IaoWIY/Af74V6ndGY5CzK0zZVCpwGTu73qN0CpcPxpGKpEQbvtqpzucFHlJ1iF8JKF0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+qoEzyo; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+qoEzyo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776045482; x=1807581482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TnrPR9yQ6YsE3lN8LqmbE+O2vHXeGGaqVbnxwSmrN1k=;
  b=S+qoEzyouzeZhGsESAJiIqZG08hkPFfp+uIMv2AAwA7JHTCPQsAYFc9H
   5JyFiaSmzZaJNsjhuyb7EQA8kLLvzPf8J/RQvqmJrjadh5iivI0amUv/0
   8klzr/i6ZNa1U31XX2HGovzXkSYjRjF+KT4+HuAP9LzFOTKTfv24m6/LP
   YzwvnSz7kwSKz62/a2TVsnk2YDYxfuq3fFUJ3KJB0dmGbctrSBsOZjk2a
   6raNoYjM+/4CTVTHS4WcInD4cgC8ppBtlB6n7Qz/pwgeewCUfXSistL9Z
   ppkdJWBV1KIghv4NyDOl4I99XnfxQj55TLjtm+V634heqJ3WoD9F2LB7r
   A==;
X-CSE-ConnectionGUID: SKe7NzwTS5S/0H7uPE27oA==
X-CSE-MsgGUID: MGBqJFw8R3qDTMISniEPBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="94366968"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="94366968"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 18:58:01 -0700
X-CSE-ConnectionGUID: fZqZKcebQTmVcEWfJuDeAA==
X-CSE-MsgGUID: zn3aZagMSRyX2UkaR5eThw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="226948524"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 18:57:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 18:57:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Sun, 12 Apr 2026 18:57:55 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Sun, 12 Apr 2026 18:57:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O09mjghD6g0NWaFmiuv6flgT/bhi8HhMFqrUDFh1HERZKlT9PJQUotqDYQtKpVN8tQgoaCQOFmdPl4t9lsYP3cRhxwFhmkonDk1HgMNvXaG2vU1PQvWlRoRmWqI+YW6DCPc2paWQkp3PExU645r2dyM95GIKdEIDRdw9sKRsdANBVnWBPVmfbYVVKMuFWZnoQL4XbEKkZ5AgDnmJBBpbvtLg7G+ltXg/YI7HgCJaa58Vj6pnTL/vZLkr/r1sJMoEBP1NJPdoAtQ5QbeYqMaV+s81DGJDugGpVKDoRDdiYLY38ZZ7v0o1FJNsJ8z5o2Bj42zrySMK1Bjp6BTdTpxzyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87I0O+IK3zIYedfztgRnSNt02sLxZUu4fKbLRC66I1Y=;
 b=Zg7W2Q/UNahETWsHgRK+KAcl6CuMm/aPMQPfKQeQCKBYhHfFck+RSQOGJHO61ZDs/9BeIlOnOIUgXbFiSHJjH3fjU9GLnfQjwq6hQ1ZztxGxVOZx4HIKmBQ9u8c8AzxqApayLwCIe05tDsHsPXeg9dES6OGMQAmn5+jmbiOJUHufA78DNbtklDsVn+4KW/YNK+Gl0vNNQGVvwvnjZnThgSsCemQcNFS4U8RDRpXa143TRgKEO18cjTiRE2U4FHZC4/IAgNJgbCsDy5puAVCQQDrN40XBAy1wkojyPWMU6Cfr0glfFxIMAn/k1A/zVao5XJ4LOl7jpyiKLg/4oDzqFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
 by SA0PR11MB4750.namprd11.prod.outlook.com (2603:10b6:806:9d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Mon, 13 Apr
 2026 01:57:44 +0000
Received: from BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a]) by BYAPR11MB2808.namprd11.prod.outlook.com
 ([fe80::defa:788:da96:2f9a%4]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 01:57:44 +0000
Date: Mon, 13 Apr 2026 09:57:37 +0800
From: kernel test robot <lkp@intel.com>
To: Val Packett <val@packett.cool>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "mipi_dsi_driver_register_full"
 [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
Message-ID: <adxNkT8Ksh2//cH6@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0171.apcprd04.prod.outlook.com (2603:1096:4::33)
 To BYAPR11MB2808.namprd11.prod.outlook.com (2603:10b6:a02:c8::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2808:EE_|SA0PR11MB4750:EE_
X-MS-Office365-Filtering-Correlation-Id: 43db319f-a1ef-4ec7-74ab-08de99000de8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: kns05reMW3im4UoXShTZvJIo5hckv/i3RxYc55uBFY76woBc2PBAfMB0WLw8BUFeFwiRel20OEF4RGLksoPjIBH7ygjPLgWzLJlPZEv3RyhJj166AT/udR1leoir7pzslGckqnWDKgvP2j4vgAguc/TAc/5kcVMOAM7W5RNVQceNcfS4UCsKCygDZtuBApdLLIvOecjVUbiRXMjPc/QNDuykIlLg1kJ8VuGoMhbAbx021iCIDSWpx5GZKk0XCKRL6JlmWCZVSyQXVyLucXiv99n6dFhyZlf/3I6WMfFMuqBVdNClkFvO75O109pLWX7OUpwQHhCDyVi8eszBMDGYm6UTKAPW5r47InLQkp2BjBO2c7GfaZUAAgdie6o4FUw1VCi5cMD8YgTjWpE5gWFVDYwqZt/8EDIukVeUN8turlxC+wJjQM0gXuSEsZS1EIQMqvrgG+rjZuTPfvjChezgkyR3UWNNy5ZZxCNTShHsbj4/pmVi9XRmpaw1Mmb/Pkz+s4hcWteWzc+cd0RJNMklukjZgSY1nKfaK3iAp93uyPnsUhJ4QGvlJ+7FvYsCpbofoNWL+M0EKDlBYvZiorSor/cOdzMQdQBRM7ddMQVQ33X5ampar6U0ZBYLGcLHPlLPVnzXzg7qOpY4ON6lByKojznvUhy8msx39fAkY1W6Ys4BNk0Sh247EZdmVRyyUAF7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB2808.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fq+/fCaOJaIGk8lempyYyOrJMN0ipa6LhJqQgJBhENZXMHXutPdnTHqsu5EB?=
 =?us-ascii?Q?/Cy4iHCv9e95kFTv+evWG31a4dfYxYH24Ti+vLEIDj0NXURdpj3zcw1K3VKf?=
 =?us-ascii?Q?b5G/58jtxlewa7s0euHWCeg8VdbYRavJ7ZTIe2oHjBEalW1Kttd9fXiAZUev?=
 =?us-ascii?Q?/gynRBK+vIjxrqRXdzjz7Xj+GwYedzBgyyduH+2T7IegLOacwqEuJlaeykhy?=
 =?us-ascii?Q?zDMy/Ksyw4bD4kEpdZMbtPOgz96iF/kZBjGPSW5JobBWWPFh9JpTuCLb5ljk?=
 =?us-ascii?Q?rDtPDkhR4/n6//DKueeIv6x2zQgvWu0cyGaQMPYJjiYVzRe4iR9MCB2qhK/V?=
 =?us-ascii?Q?DRzR8ajbLwcgjCbKU88eM30A5R+Mk7u0bWchZD1Umn/DmNTNn3Pf+nHmqL2M?=
 =?us-ascii?Q?4o0srrm5gyHH4HqA+buwsZoq2pgoA/cjaThSXalsfOiYYAu+8IBXwQV97iog?=
 =?us-ascii?Q?0/Pqd0PaBs9TcKjUy28h+7Fk34OvTY+tcQwUXdwLkNLm7i5umDu07ugckFoQ?=
 =?us-ascii?Q?r4qJLWOHblMYnvxjpkXVHcNwaY4UKVJOLSSWOPXuRnPBiS/t2zDX6fEx7Pex?=
 =?us-ascii?Q?HDzmABQqBPfbTBvh3pbd+K+N0DwHzvVuUSYkAoF4/30jcIRnXeSYsKtkzFyr?=
 =?us-ascii?Q?O0rYGmf9Fwvv5CIbJqNGwZvk/WCZvMaSq8TDi8WLtjb/qeY5laiTZJy1BWsT?=
 =?us-ascii?Q?7kYHitO0hcnrUarXwj+rmu43aO/KCOY+NKVTdyMpbuTVcR+O2CMc436sUoPJ?=
 =?us-ascii?Q?/IotnczAI1dPG4DQf6d1Ib4hPNtbOfQ5MU6gQLEgpI15A2CcbOG+ByQDGGwg?=
 =?us-ascii?Q?wEu1F7RJrC5FCRFMC2hsn9pXSvfIo37aZHTPShP3q0CNLetQR2JplOOs7gdD?=
 =?us-ascii?Q?BIieedTLD0f+/wARJvt8CAbjIM18a9iLAA5Rxql535rJgCvUxiE12syS6Tak?=
 =?us-ascii?Q?k1tGn1Jae80NUfIZrTGrOCOFSe2GX27+StAFG104Es+Irr9SccHOFNJS5uGe?=
 =?us-ascii?Q?U5ghRXlrSqJNL+zfIJsHs1AWQPNX11D9bor8EJVFcC70pOd9T0qG0GmpjgRr?=
 =?us-ascii?Q?+DtLhu0wgINoOoiO4WIVYG5EpKwJ8BJaT0+pttECI4o3vIkzw55Lr28BVkvq?=
 =?us-ascii?Q?xWdpIaz59XgAQEYUkmcMRYZ25EJF2T+i3OcGNFv0Lsyzk+UwDoXQSk40xpot?=
 =?us-ascii?Q?3fRPVT0P1laNXjNhR2PVb7n2XAlwqPndkzCMBLV7JYYswf1uPfio5Yt9OInL?=
 =?us-ascii?Q?/VtBEPPlgQeth8Ef3fTUKFXsceJ7Zp7RIcWsCU78j8OITCNVIiQ+YsOjvtnE?=
 =?us-ascii?Q?mmZU+hb7dswc9dsO+ruS1tAnld3tz7f0Q7fRlL8tMcsFLlLvti3Dfdyoy4se?=
 =?us-ascii?Q?gApjKHXT0ley6ehBHZxVCUw80zQAYo9ELRzG3LR+qBBHTMz0xW5/7ph9/1Q5?=
 =?us-ascii?Q?JQkh7e2qANOkNpdd1EUxUNf5DTIIdr5x7U/5lif5IJ/NzXmmRK5Ho7xcqBn3?=
 =?us-ascii?Q?HllnTIVAfmMojf6zyEc1HhuoXR8TNmPFCRZrVWipsnrDJ7RZWyiStDbYclAM?=
 =?us-ascii?Q?z6gNsgB2YnC7utsQz/N/m3Xke4554ASDA1/nkRSCo15kw9mpbry0lFdvsPpY?=
 =?us-ascii?Q?q7NV9uVhFUmokp3UKl0LapfSpKk0N3kIfGxScPmWF7gBtR9rVKerU2lmH1oc?=
 =?us-ascii?Q?kcCiSgNd2JxaEmOuFu/ztFSTRhvdtyuq/twBZzFSlN17tFnAvmNewgYcsmA1?=
 =?us-ascii?Q?cmD7M5tBbQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: FRtvKpJbGnxoNqW2dM9qk1CTwxFzczDZAajBk875U30hXFKGDyjpzCMYF0ytEhuSE3YZYdqxmLw3Dd5V8LMa7b4VQCsE4ojINBTwj27W3zZ75I5FBmrUQbgtMCpNkxjYOvUSrSxKCQyxFg6TJXgOOBSZPfWrIRRak69ad7HGz7EsnX3AhUeK4utefTuHU2aC1lezjwUUWrf2O9n4Mfup7n0XXcIbLYKbtCNZ9x9Oo8n8xlWQhZ6MPk8+9stdD078ljTKQDJZj1Hz7AKIWR3T/t9Q/9BGCKCTI/fZACZPC2N6eNwOk7mC2ojXv584QvVQtUDrlNIFtSzhW2I678q1eA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 43db319f-a1ef-4ec7-74ab-08de99000de8
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2808.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 01:57:44.7283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mOfS37dkSaN1IryTFNY4h6cisty060ySQvzoTl94nNBRYcKdGfinVnTVIM96cuGccDGZkVQWOUqLFiAcXvv+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4750
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Val-Packett/drm-Introduce-drm_panel_prepare_for_mode-callback/20260412-203219
head:   a210eaa6cf90ed0bb6afe19395c080e50a1f71a7
commit: a210eaa6cf90ed0bb6afe19395c080e50a1f71a7 drm/panel: Add driver for Novatek NT37701 based OLED panels
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260413/202604130226.0edM0POE-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604130226.0edM0POE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604130226.0edM0POE-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mipi_dsi_driver_register_full" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
ERROR: modpost: "drm_panel_remove" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!
>> ERROR: modpost: "mipi_dsi_driver_unregister" [drivers/gpu/drm/panel/panel-novatek-nt37701.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

