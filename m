Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BA2441DDEA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038689; cv=fail; b=UKmNucQUYvmKPAEKcP2wB+YDE/8MjotrhoHhqepy9phoEXq+/9/S0CrkBF7NB+CsGJP5vkNtzyBMoGFHFWd7MSMgiaJuJPi9g2utJrwAdqFlv2yU0ymtdTrZpvQf/f8ZaFco34czo6WdJ0UAFcEzAWI8U1Al1hiRSptN0YzsIRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038689; c=relaxed/simple;
	bh=OqAc/0B2HFNTxkgb6NQ3/xwSiupIYa6/Jkb/8FxXkSk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Ezxx4PXrYSR8CoGiQyBJ36Amt8HftIpwjuoUkl+/IKIfCBPrjGjpenGwBsrpOt2uvtOJGTVMevikRtyJnSGn4/OE6axO9eSHFF++Ch21jaWH+sxqJl58rrrfff2cgO/kT3+b4FyXOCbIX+ON6aPaDvbM3FIeiFYUcK3ALGoOUhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CxR0z7B8; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CxR0z7B8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038688; x=1822574688;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OqAc/0B2HFNTxkgb6NQ3/xwSiupIYa6/Jkb/8FxXkSk=;
  b=CxR0z7B83L1f85j0G6gvOCDwIKBZpWQ0gzbl8yi2v75L6cqYlyt4VK/3
   RWa2BSfYqfOO3GAmredKiulFCwQd62jGG0D1SIDQRy36DfQlnG1KfRiyp
   12UDKXXfxLz9hfe2ZID2ZG7LGjOl/y0MiyEJ31eQpp7k91Zc+kSfVcLaZ
   zCpVzgmMqF8QVSuJQPI4OAwUDX5of4AaXuhfq/TFbComSjbStal20DmP9
   yqL+pF3wOJZYl72SK0PZDVKJT1DZTxGOAo+m4NhZGkijyFG3tWY/VLU2y
   r99lHG5PXSwavRotW1ogFpKAUVl73orRy27vnGjuU7liTTKV35lEOBzx6
   A==;
X-CSE-ConnectionGUID: Fwx9YiPXQm2ZwamCOvJmUA==
X-CSE-MsgGUID: N4dSv3NYTzK1QZmihqy8Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="91641589"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="91641589"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:47 -0700
X-CSE-ConnectionGUID: 73b3zymKSjyZ5B7XTK2fkA==
X-CSE-MsgGUID: o+S7IwXxSG6U7JE9jZL7lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276006887"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:44:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:44:46 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nY2rdxsRW+21cSE34R4PbmQ8mKjVlh8RpeSz6Nrkxkbj/qpbukcRFnqa46NTkcQzEaP2E7Xq91p5/6R7aqNuz+iIi9pvWCHy2pmwFtZsouoq3bkKeLWI9VZ/v0BUHSmSLi5yfmoq0wTHJYS7WBhXxSXOSkmcjl3uomGJEQDhz/lwNZZ6cwt2b+PlUzqxZIKLfoU3F0vlB+QdAo0AiSKI2/EpaMoi2Z4VTFLqGcFKZMtBVF2+j1EEsvFVGCkxq4nAe65vGIPS+UNjWm7dt2L8egLCzpVmANsvUjK3wHlbRYsMGh6jKLw0y3S2sCb3r7sbaesbmePIMGx1eoOgwsoSSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNK4ZyttQ7JimGDbJI1PmPYOsVa5S13a6f5krBA8cq4=;
 b=S53fg3sMMdmTuA2EsFmLrlSPHjBc/tFjISk7B8Sco8MRA3NXsPkQn+StFhEb+It7VpDmdJSCJgPGmcFfUvnTSXnZvKJG1T0K+Ra050W6a0O3mUfr9mXV2xVLAP1xAlqW2wyzAfrga9esNBnFXYnVReZfyIBuu38ZZulGksWmYZV9QtYEsyqndFNByIg5IkHXejl3l/A81isWWeEfvdnzggP9cljsdKhuBG1/6aBupsEAPKkGFw6CtWq3DK+00Fky6tvWV4gSd+MOhKO3He2+qBfhPcfacBk0xNSGfUBKWk/Jd0ouHVl3gtLE3G9TRKDUp8kD9OY24IzN33Dw3SRMJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:42:41 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:42:41 +0000
Date: Sat, 3 Oct 2026 22:42:33 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpirko-mlxsw:wip_attestation_pre_rfc_draft1 17/26]
 ctlv_tlv.h:239:9: warning: 'len' is used uninitialized
Message-ID: <asEUWZQ+kRyPWvF5@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: c5c4cf74-b1c5-4f3e-1b47-08df215c93f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 4k/7ugdCU7zI/9UX9G7Yyky7/zn41bodZfDVOx9xo34aDQFleYVWCqEHeAzu5su6TlebbtR03RB8fJcBsrw+5QFfWiKXHHrsoRlCD+DFLgd4kP2Y42XzoSe3wLUiA5xbNlFJQ+mPGktl5MRsGA4rHoWvE7FntQe43aHivLECa92zbn8T4LrFSSTpO4+jeOZFkyIYwX1zVXBwuKAMGTIhIG+Hciw6C2AUeKOBsv3+hQdpBfYs3fUHFTbX793cniNNoaG3MpFsWP09soyYpRAXBSyqsBMs23LECGeEJnZzn8w5cyG5l6V5HKvxez04IC0+UiXigkRfX3odDzAI3V+gl6Zt2dCiFrvM/a2/wVolOqGj3yeptp+WsWWAgf2r72EQm6zenpSd+vlkDYcNZcsV0mmy9kTHmBO8oXFAc4/Ij8FPzwm2Js6L73i9UcrqZ+d1AIwI1hghl8Zgn9Ii5ikkBnNbOJAzARCWxKQzWNzImyrUFE5eP1ObSiSC1WhU3J6U2Fh5Fk7Z38SH6jDUGElwD6m0Zhmg+6po/4HH0VwuaBj354xw2YVGBpnYd8mbcg18L0iKNizy9/nGGdKDm7Tv8eDGCDGBF5yfsvny4etJQ5EbSsbfTA9LATxsli0/aMIu
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y89YMtZosbKvQFP/URmwXyt7IlrF1RydAh4WF5CA0HzXfidvMUsy7vXa+Ub5?=
 =?us-ascii?Q?1AIPadch/9UnrfXx/LW4mHEkqjvDeTZp7UhOuLroTKYy8Eg/o/V4Dfo0zoCc?=
 =?us-ascii?Q?GAaDGccZiHo8W203zdy0lYlJfv9ptyfmBgTjP17EGCOSB0ZDMB9Q4CoIW+rn?=
 =?us-ascii?Q?dC7bnPRn4XGP52uxvWf9FpgdUv6cSwub0lS2uawEbdoadm+IOYQabMdJvfl7?=
 =?us-ascii?Q?/QrL9YmA0ihIFsaDWHv6RTQ1QVg3KvqLxH01bsZqDF/ttMd1yG5/WugXeQzF?=
 =?us-ascii?Q?XpBwep3ccLJGWIFu63E3xmB5YHuWd+OIQDMXFZjGlpbvKd6xq+CecdmZcg8g?=
 =?us-ascii?Q?3BA7zaIChWdrg9Bp8UiMdT8jfXycqcPh05DJn8RSGPOccmPw9SSeeOrj9ere?=
 =?us-ascii?Q?SE9moVgkfuA8O/ipCyBSJ1V9Fz8WQhFp0vSdgM/WQgtzxxTxw+kCjQgu65Il?=
 =?us-ascii?Q?rSIdA3IVAsfzrT7wlLe0FX84gmP/dUrjhCGYrpFYNT3ndbUUNnwShu396fuF?=
 =?us-ascii?Q?/7vEgZxzALuGlclFrsFXUw1QGLhI7/jdCASxs37We9H8wf/XPJJZwlWQ4EHz?=
 =?us-ascii?Q?wvjNwncbbvUpjGcxNiUZUyhGpbI6lM/s/rOsxGlyo1PAjyiG667ZILk6GL0F?=
 =?us-ascii?Q?w9Q5qhI4Jb83AbdYxBGXoa4U1ZKglS8upAzzQV22G9wJd6tV+rA+StZW9oVL?=
 =?us-ascii?Q?N9Xq98IZMMFDfdNLofVAXVp2lWIsp7GKWXmTZ2mlkvQR0INrP8YNxEfoYyLf?=
 =?us-ascii?Q?3n+rD9G2TGAyJY3IDBpuue5snAieoXfRJshQS10hXZUmpM7tc2OkpyTZKDCN?=
 =?us-ascii?Q?uhby7DeMFd64fL/6Ki2bXpMwLq9HlxOgPLLLsOaD5FrRHFnwfRpziOUYmorx?=
 =?us-ascii?Q?EhSux7qroK/YSxhQix2THQXChTzHKzq/BC+jX+EG3QY1kHTvKa9HT4DzkNze?=
 =?us-ascii?Q?PMrq2jk9R6CTGOAg3TK/BkrDgXysc95cj2cmwgyYWhKEvmYWOT8jmSTmr6ZZ?=
 =?us-ascii?Q?ZPARx8O7NBF1uarwv3FnCoP62i8E64jt1RZSVYIxr0GGMFRVoRWApykxLrwP?=
 =?us-ascii?Q?oEKtedHE8KjHYxNr8jaKha8fRx+UowlkkOnMf5Zro/K7QqADw16zHG1KDmWz?=
 =?us-ascii?Q?qqlaCpijgWM3kZ3kO9ralIdiS9rBN6w1egkKRWeGY4zv8WGnQAj8UV6IDCQL?=
 =?us-ascii?Q?JMzUhV3wfLljcDEd5T4/69VcFxE93iv2BI+6dfZUKskaIMTSSi4NXrFs9qzn?=
 =?us-ascii?Q?DCKcVAok/DQ38/IBhjV0CyPimEgLR7BlWYxmwoCCPbspJM70pHBcX4JLpbp2?=
 =?us-ascii?Q?vYQDfD8OWJGrtwlVUkP72F4rSrwmmkkTcfvbkJd0wMWfPPUxnEx2Ze6rpOLI?=
 =?us-ascii?Q?BL2GPq7/47iNnzDqtQnxfEQjKXb1P6rVaOyw8uRaWb1y4JnToV2AQ8dXJA0X?=
 =?us-ascii?Q?6MWSiXOIHYmjjtJl+oA4pi1ssarUcQInrCleFlbdr8OVyig7oHzIwb7AS+Uu?=
 =?us-ascii?Q?VqHq9RAe1F/dubsgwhOnn4mLCddvh9wxmkkH9RyD8jcJ/mJ8fzCy/HoCTdn1?=
 =?us-ascii?Q?LEpZQNjB5RtMmhA8RVCjIjAuvfKcUuGm2/akDsasjm134IeGSpwsxV1wwNBz?=
 =?us-ascii?Q?nXjIWWXN/xsH/+idqk7+15KM6AIXipMSxUGOuj5tYRVxaWnN+hIv5+7NDEdA?=
 =?us-ascii?Q?24BtNINQIoCCV1Xn+hEPiNRRkOHABBkBNxDPfqxqkbTVswnzvrruqHgcSPPX?=
 =?us-ascii?Q?B4ptSGrlHQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: CymmGBWOtdcEzPuwR8+2BXOEzE6jqux4diqR1uQiFQGX2Go53byHJ/3/stm54h/Z8qXS11mhDfrS6YHzEK+C39mJ+ocPoRD40YwaDuXVxZHRR8Y7WO7TzUEaTCGTM+Wk9mB98gjDFP35EDkxUT2P2AWyyNfKdFRFdtGBSjXsn2MKDhzMJs+zvWJOeGP1BWORxpPc7pJy2BZK36G8Cm6XhiM1jpXDt5uEIHMcIZzodckYIEz4fSurBf8pviGLoGO3S4Gk6M9TdOYxDeKeGsIDrGjunwTc9VYUi/swoG8LrN8LFYXYDf19Kp9ZxPsJNJwTS2FO+LJJF4mcrWkPhduE6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: c5c4cf74-b1c5-4f3e-1b47-08df215c93f0
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:42:41.4864
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLLtHiRUUva00UWdFF1bYpZy9aL4NCM2ea1V6Zio9wau2jb3bIDndwfq1uoibqtCaNTgGKlpffQSnqNUVHsjjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_pre_rfc_draft1
head:   a18af4e1b514bf11f88ca42d29b7b68f3b375378
commit: 632e6dd46feb3a874a82d83535f9e3fd973231b3 [17/26] selftests/ctlv: Add the wire-format selftests
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609302209.gQo2cqOa-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609302209.gQo2cqOa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609302209.gQo2cqOa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from ctlv_compat32.c:19:
   ctlv_tlv.h: In function 'ctlv_rd_u64':
>> ctlv_tlv.h:239:9: warning: 'len' is used uninitialized [-Wuninitialized]
     239 |         memcpy(&value, ctlv_rd_payload(attr, &len),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     240 |                len < sizeof(value) ? len : sizeof(value));
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   ctlv_tlv.h:237:15: note: 'len' declared here
     237 |         __u32 len;
         |               ^~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

