Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72332FB97A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763807113; cv=fail; b=txP+V10798rje/f1prl6koHcjCSD5OdoyBEJp0tGaoZmHcdrJVnp1JKv24xFw0iZ2qAqrOHTFfJfsH+nzkeMM+dubmLmgOVsYjuUfKt6V5zcGcEsaeDz77nDRmsNs1UwLgxZSe2gZBF/Tmr0zfu0PkPmdlX3EkMngWbwBE3CofQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763807113; c=relaxed/simple;
	bh=EGdjk4PCL0vhybDbenW53wvU2AXPkrKbasiPuXXCZ5M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=S2DmHQYWpT+Zg4Zpw//LMBiKskugEEVDtv86lo/0Da0c4plm5NtD0CQxpUFRm+n5ODMCDpYBvfEYyeofHTe0s0cZoGi6uITmWB3ij/xQlYRSY9kpe6+u1gIy7gbJu5R6dcSzI401USohZxRVu2zL3FV7z2LRYP2JW5QNUPLt2OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HUk2SNWN; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HUk2SNWN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763807112; x=1795343112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EGdjk4PCL0vhybDbenW53wvU2AXPkrKbasiPuXXCZ5M=;
  b=HUk2SNWN+7w527nRnSNHEQQJ9oOZBvkeIPnFElWa75v/ZF0uNzARBIfc
   J8aS1lgleQ8eBARZtimKamu+LIwqAWSNRkkXNa8SmP6FbPUmfkhn14oXY
   c/UnEKn8pKt8TT2UOwAIUdDpnRsUwUTkIHPramlFzWwDr8ngjKfIK4sHi
   PqKROaZ2kGYa7jY8v7hYrsA9VkROd9uIPwyoyR63e9ckEYfWjQQYwWV0X
   e8Z2lmftW6wAolTAd3+kqQi0wN5bZ74qAL4lgBLdCKy0WBGJd+TBW6pGa
   qfl/TqFgYaUrPibDE1shIFk0DGddr0fMroBIAFOLLURDU3RjnPYmP4/kQ
   g==;
X-CSE-ConnectionGUID: MswtziHJRSODhVY9AvB3bQ==
X-CSE-MsgGUID: sK/p95lYQ2mby2l6L4+AmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="76214805"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="76214805"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:25:11 -0800
X-CSE-ConnectionGUID: SqkZsFGpRm2nBoHcvvL82g==
X-CSE-MsgGUID: RRmvKPznQ3C3xxuCiHBa8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222851570"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 02:25:10 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:25:10 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 02:25:10 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.21) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 02:25:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DiHf2HKdPIr8r/Ny9W9+vkO8rCLxeAThXlvZ1cj1eeU2r45IvR3iO2x9JaoyfV5fr/maQK+wU/Gd1Yt36BK6a6FpjUPpcKNzgdHOyxjiovrrr53AYOkIUhG295W/ow4dMm3b9Ea3zMKZ8cz5sI3Sto7h0yHU6zNG9n1F6XqTY1JXqtewEvHaqjiUIdOAnbONd/cOd2I26d9BtyM/H+KuuSDGczXEKkvX2eZ1+IhKOPZTq0UpAzolnV7pgIPQFmx68EFwKuBdJoocUUP7Dbbbzvx0kcu64bc9XsosRgb8pE6JIDD1v/nfrhdmFk6EYM1xsc83+1Bdan6m8lPoi/w4QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpLoLM/49yxVkmMpVVuUTRNWkRZA9kEvHMEPcYFwYRQ=;
 b=wOCQrOECebsNiz+zTpGa0qJUn+k1u4vZOdgizuNSAWnqnJj01623MiV/ivuta06/uWuH1doceNEo/8TUO0wcGukqlbMr0KQSGFK4QmhGr4k56lNDSy7JUsY8njQElzQBxor/pHU7+TAOichOZLQcI6NCRAs8XCxJ9c5W7XE5i852Ef5jBu2R1g2U83W/nYSFUlwTS7E9tydW6iFJwwGFm5Vjf7nSmzAOlF/ntyOjCLZsKUE82+vW6mookHoCr9IZss530PA2Pf61gaHQzYTjXk/w3lod+wudQ4xtlFVilxrZCSQUpG56aWXV4U5pK+5qa1yo+dblPHh1qO8m3o1jug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
 by DM3PR11MB8669.namprd11.prod.outlook.com (2603:10b6:0:14::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.14; Sat, 22 Nov 2025 10:25:08 +0000
Received: from DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd]) by DM6PR11MB4172.namprd11.prod.outlook.com
 ([fe80::f86d:a320:27b7:afcd%3]) with mapi id 15.20.9343.009; Sat, 22 Nov 2025
 10:25:08 +0000
Date: Sat, 22 Nov 2025 18:25:00 +0800
From: kernel test robot <lkp@intel.com>
To: Eslam Khafagy <eslam.medhat1993@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-review:Eslam-Khafagy/HID-memory-leak-in-dualshock4_get_calibration_data/20251116-102918
 1/1] checkpatch: ERROR:SPACING: space required before the open parenthesis
 '('
Message-ID: <aSGPfJYUmp+T1ig2@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM6PR11MB4172.namprd11.prod.outlook.com (2603:10b6:5:19f::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4172:EE_|DM3PR11MB8669:EE_
X-MS-Office365-Filtering-Correlation-Id: f2630df1-65eb-41ff-97d6-08de29b16911
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHM8xcXonGO91A306CbV2Q2FqmCLNaxwxl0qPqN59IOXjTMV+kJ3BwLWFjzc?=
 =?us-ascii?Q?lwoNjwkC2ibz9ucwjRFCCe65Fksg6eAQBInRbv8ycw2TXDNCQHi+77TjjbVU?=
 =?us-ascii?Q?f8KRhJkLDkrKChJa+OdAwJyynjmVJKUd735IxM7eaFzW3xMnSj2L4hklV2CQ?=
 =?us-ascii?Q?hltnkoJamviLMcViLYAfJcZFyvo7suAJvM9bFQQ6xJdHXHirU8aeB8V/u89S?=
 =?us-ascii?Q?ko4WjhmvodC5BS1/IuKQfR5b+MfSef6iXpjUxU2l7HhsOGND+y9sInFRCYQQ?=
 =?us-ascii?Q?zOUmSsCWSxJwZRJeeCHq/JmwHwNJfMFCjHWNq0BT2F6YyYM/gToDfmRaUbCJ?=
 =?us-ascii?Q?c7EzwmuF6f3OHd3i+K0bohYOhUA/ptcsJ1G4SMlNHUAPLro2We3qtjUNA5Mq?=
 =?us-ascii?Q?DMKRTga+amIWPozaKx8EbCsIUkdIWsV97zdRyrEPqtpvIfDCVXPGx9qHrGMK?=
 =?us-ascii?Q?xwsUQzN6dsvP7MOal/0EXEOOCq1dAdbllG5I3RC71UoDiz+QXQBZpG+c19U2?=
 =?us-ascii?Q?CTNWUG/S8jzmg1jCAYEf6rpMurLYSfp4+k1nfSNE5Aseez1A8Fx5g2PZmhEr?=
 =?us-ascii?Q?sj7DHi4dwfAw4K4rEpcIKUu3ADLZNtBSss3UjYdb4CnW60QG1FB1ApW9OwKk?=
 =?us-ascii?Q?w/ovD33lvjF4WJnNMRodmwC1/OSmVbebmJveaAiYT42XX0UYhASZbqgpeUjc?=
 =?us-ascii?Q?77WQJpz3iUxrSq15hyVKLQy+qNdKdL1TWRSfMiSlS/zRQsjKi1jHRBaPQRiy?=
 =?us-ascii?Q?WJ7Y2TwL/NT75NAda92fc5vjK3wWRT/WUL36m11HNHZDbJeJrVaznEBWYoPq?=
 =?us-ascii?Q?mpV8NpiPxli8A629ZOZ3b6KRGXIFEkMoKJewSgHsILMAzr0WHKvaUzbVN/G2?=
 =?us-ascii?Q?bWfnXaKjzaG1d/KK5ZVYnE26Ujlc79ivo8DHtbwsdKhllofbPPTBGDvGW7zB?=
 =?us-ascii?Q?BpgqwskBTjRwLDO3P+/2RZpPJR7SnK5+7oFjY0yzeFYDQo+68v+irp4vi5mo?=
 =?us-ascii?Q?4L8ImvQQrBiEXEVV60Av2tjFSQx1zhk0v0//62eEpczLyalYthXcDjfgA7QP?=
 =?us-ascii?Q?epHw30e64kj1WxrXcDqUi4qiaFELNfDxxnsMKfZFjcohHwUHHj4XggWOqMU+?=
 =?us-ascii?Q?94ogGYEjIbnn/BbMq7TXr6QD+ecdJO4gS27y3rflDmfFzitjvyFNMe2srDO6?=
 =?us-ascii?Q?2P8rHwN2jSsVkktInXU74C6DwX3YNkkUxKl61gVdtmG9aC2I7xP9kXR9eoso?=
 =?us-ascii?Q?eVz0EM2wZsrtk0sOLBAYnY22it1GaC/ZuxVAZcH1tZoZm/oVww6lCkJDCAYl?=
 =?us-ascii?Q?LBJ/MFK5Bw46Sg5Wu2Pu+EGabgG7UsZcw02VRZ5zkfJstjPJL9RURbRL6aBw?=
 =?us-ascii?Q?NWwJUHqoR8wrpOChMRt5k1L4Cr1od/nj9+EaHdwRtfpt+51f9zPqwUTmWRWy?=
 =?us-ascii?Q?IYt9u7L+s9c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4172.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uK/Yc1R7QbSYEACl5S2T+RruSh3XI4NU9fabuK7N/4ZDlse331ti4NBGkgIv?=
 =?us-ascii?Q?survmNyj5lDgB6W0STsT3XTVtB8wiGbx2K+D8DRUcGZcC21XLjj9PpOLS8Gu?=
 =?us-ascii?Q?s+dpcBm1BCDlrcZyRZcn7QvEkurdsrKAkYOnpS5HgjAgr8DmsaV5JAnv5TNw?=
 =?us-ascii?Q?QpHQ3ge5TfjaW4gsy+UPD5wKlfwleioQubbC0tOuc8vauno02OD3t0Fvt8iP?=
 =?us-ascii?Q?J1WQmC1WFdoVZRq8GwuFzJO0FGeEj5coxHTut+36ViyXNdYS7mmUVlfvkNE6?=
 =?us-ascii?Q?Rzu9vFH54t3HGyBAezk9WxHSrJL69xKeUi9ofRS9DRa2+5nbpR8/0JQzzhPb?=
 =?us-ascii?Q?3xabiR5Bf+3kzfF4uDzTLM1rLUH/a0gNgnmRtlqLgzXjPncLJGsIqKavFjg3?=
 =?us-ascii?Q?8Eoni3RGFZ8l92U4yrqEcOtu7fL6tafKaJOrZCiILRawpgNF8bNTYoguMXaw?=
 =?us-ascii?Q?34+EOVRjnTfsyiGBYJ3Yae/ejnUd6+JUB2Vna9HgrXtoFqiWK0HZ4j9Q1bVS?=
 =?us-ascii?Q?g68pu3xMUtum6KVBv+JHRApUifc1YxXgVLGAri2lm+3k0tOI7P26TnhmR0XL?=
 =?us-ascii?Q?MZek22VCxbY/RAt1FEGmY3dXV/LA7vajtaG4xs1L+++p5W7CAM7VV6G3fHmC?=
 =?us-ascii?Q?R2xysnosGncxIta2qOLsfq3tmLmLWU5enkyA75B0GucZnYkPmFKDHOVhDn3p?=
 =?us-ascii?Q?gR7KUCDlIEWPMHhYSJisLxz9UWmIP5ReZssxsAjcUzdEBSiOP8yo/ojv16Xz?=
 =?us-ascii?Q?nT8E7PnIZu9rIsn0YppqdvPXR/aFXwbjKv1VwSLhQ4BwM0Ty7EyPh9qUkeog?=
 =?us-ascii?Q?xwCiI+rL6tso6ZdyS5vfN++2xIlMDu8qpnr88BzY4xCihNm8MqXrwCa0VTQ/?=
 =?us-ascii?Q?cMeFIbRndbky+aja+CjnampV+5i7RsJHI+YVRYpAeGplUqG145TvgKVRx5xI?=
 =?us-ascii?Q?Oo8nEyLkwgdN+Kc1fkeziYwX9XIRbS5sdgpZ6YjqtuCDOR56J7f4XDGCSEiJ?=
 =?us-ascii?Q?P7FidAZUYGICUOBgtEuDPKkVC+F5USh3xBBAGDXTNLM0NT2Vma2OveBehd2a?=
 =?us-ascii?Q?d4PJE3gGXxDg3Y07G/suDfBmE2b+ny8O8ZSWufT9Ps4IOn6VRhrDvu4uErGY?=
 =?us-ascii?Q?TARFq4JZwaGpAhVBuPXEzjDmA+zD5RBXsDvJRvKCc69m5Me9hq8UOtQ1V1mL?=
 =?us-ascii?Q?ofFtLf4eRvlIH/R+H96xf5kelMEtvo9nzPQ8ygmzPnHXTmfcwEIoO4q6hX+E?=
 =?us-ascii?Q?Sr0pHOFwzSpYdckRKCVPwOHWxvbX8Nz1zH6wqg+C7dxC0TqYL8vR7gwZJW/Z?=
 =?us-ascii?Q?t5v5RW2CicW8on9S8xdXQzX5uZfsrGNKXsQVuse/ioNg9agDRo9fxWWZKeND?=
 =?us-ascii?Q?CyONT7V44U52vnSLm8RqKGko/A+njwpjKe9riUI3+Levi/283bOu2TSpwFMP?=
 =?us-ascii?Q?afqyIHnLJfv8YDrpWHXkJWTIxuVJk1eeQZEW7edYw8O9uvThexEopFl3iGRS?=
 =?us-ascii?Q?QBQUNeiWeySy8J0T0Q/YwLrHrnmp5OGGi7HSJxp9HQrN8jYM4UyfAP3+yyWq?=
 =?us-ascii?Q?34yUnF1MuDLRHo59Sz3a0dy9sJWH1C5CU4zOKoEwJENQ7Sy8REipgSB85Wuq?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2630df1-65eb-41ff-97d6-08de29b16911
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4172.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2025 10:25:08.2741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxLA8y8M+QJ8c5COYI13KV5WzCOfS/0m7euqiJiiMcyXbS/ghgOri9G1uA4q2nvQQTDqBmtF2MpuquAzJWarUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8669
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Eslam-Khafagy/HID-memory-leak-in-dualshock4_get_calibration_data/20251116-102918
head:   fec234008044758a0779e0976300a472435e850a
commit: fec234008044758a0779e0976300a472435e850a [1/1] HID: memory leak in dualshock4_get_calibration_data
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511220736.l19FvK9l-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#41: FILE: drivers/hid/hid-playstation.c:2042:
+	if(buf)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

