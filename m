Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB0B3AA510
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783499772; cv=fail; b=uMKL0YXGb2BUt1Db9IwM+yNoRc6rwYsAOR1hKiJ42zt0hf8IzM5snGQ5yMNba25xZU1Q0PpRU1TV0uFMAbPp/6feMLpyTUcamJrL78AR0XSqHB/TUsUpEIrs0kOtHyUrS32VTp97c3amu8+/YwedCwL/qOHC5WKOD2J+JHMPCTs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783499772; c=relaxed/simple;
	bh=ZfLepnhAfc4vvZiA64FyNK6uuJjvQlfhzCOjINYS+J0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r+vSkcifD2vBix+uOM2U1iWB4y4A5QZVcOVBwyrYau70a0fsL2+L4PGbUK2zgRrZxQL4iXPX4+VG4taY48Df6NamLWK9QD2F9eWavxXxZUU7QjUVVlgy8INaw0yli315JjXe7Bze1sR9DKi/a/+xaXk9zbFsBW3Rju0zbTd4SJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n+tjgfqa; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n+tjgfqa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783499771; x=1815035771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZfLepnhAfc4vvZiA64FyNK6uuJjvQlfhzCOjINYS+J0=;
  b=n+tjgfqa3kZlvhk6t3Q8MA1gafh1TtDfb7AUJGsOjWgtzdXHZixxKVBJ
   kaYWNBOVvQlg6t3t+obkudtPEpEloGeBFlvIWBN9WS8nzxlktOfOJ0cw3
   ax1A4EOlQhsiqbiLvvR9mT80TDduXj7AHsySCO6EoBUuZHJMuYae69K5M
   A2JmvzFA6GkbUJzj2cza2faujdb6lKUUyC8kln5ej2Z/R4ZfZ1Bj6+X3l
   +67dnmT3WNcECEP4tlunIsjvfGZMBO5TFURDpBtVX1SHVVIXIavGDX+yX
   zVSlNpIBxMPZKej3T4heoMEzC0P8piifHC8ihLisbm5VKi5iE5VH2UwRY
   Q==;
X-CSE-ConnectionGUID: 8BQNfZIxTX+aICTEj7nFrQ==
X-CSE-MsgGUID: o8J1DARgSWWZm4Atk1AMLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="94800100"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="94800100"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:36:10 -0700
X-CSE-ConnectionGUID: WuG6YzCmROuXJ6uIJkBLqg==
X-CSE-MsgGUID: ows8Y68dRvCgpcJgGVivtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="277436020"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 01:36:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:36:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 8 Jul 2026 01:36:09 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.19) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 8 Jul 2026 01:36:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LbtKgcR/ZK8ThW3PxJXF9U9MZx2QfyRIR1lQl+0+PyAaRqw5lXY81H3TNZp4sUIReyAUtBbtF82Z5jhliw6Hf9bxaPjTuWUoUJ5vrk/V2oYbT6ZJZ+jjjk2vf+8h1qV0MPHYBD7ikrQSm33Kv/vyknrRH2Q7AOnHafy4Xw9sQdxMg+EofdtO+xEQAfmNmpwpAhdllSHiHa/woQnXkD3xEyI17SAJ2wqNRlredrME6TtNN6K7pXa6iuRVauWtnjG3v/XtcrF1oinmGS1pzxHYUuBtqgUMQVLGZIbrQel46MlL2JBk+xT4yVR1RXFbuXkjfnxzz6U+4xVpfVN11l42Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t0ArTG6ZRBI24pGX5hwN/813Na/Rj9GC19ncDOO/3oo=;
 b=KuLQJz6u7puHcUYJBAt70kb1hECMxppp/PinAVl8L1g3p9jvLypxQxSKFVD1c+WwU/EX+QjkSVObqOXMl4H5sziVjY5LtfP4XdpQi+/RJcCMMKYOFj8+5+rQGxwctdzDumgogy8VFrQ1zJNiqcLEiadsou6d8zG2nZTMKTQVcQBFZKgqPpvg7fxA5jSpif30nWTCRDAsaPJn4yaWUG8DDheNK7w7YkID8JzOz2C/SEyPM6nmXCMcME6XUxchmdoy+AesHMXZ/2pGmcC/URF3Q61sq8LeE0EAglvFAkx3nB7rB5Tq6BEKr9AhAKU3sXJIAZkg2LJZq0IF/HvQCvLVPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com (2603:10b6:a03:2df::22)
 by BY1PR11MB8127.namprd11.prod.outlook.com (2603:10b6:a03:531::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 8 Jul 2026
 08:36:06 +0000
Received: from SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640]) by SJ0PR11MB5214.namprd11.prod.outlook.com
 ([fe80::5926:3836:4212:8640%4]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 08:36:06 +0000
Date: Wed, 8 Jul 2026 16:35:58 +0800
From: kernel test robot <lkp@intel.com>
To: tao <tao.wangtao@honor.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: mm/rmap.c:1161:32: warning: unused variable 'leaf_vma'
Message-ID: <ak4L7uYRbQgNRk5m@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To SJ0PR11MB5214.namprd11.prod.outlook.com
 (2603:10b6:a03:2df::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5214:EE_|BY1PR11MB8127:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbaab51-dcbf-4706-b287-08dedccbf418
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: JJxoeng2RWCPk4IEjBanHFVRMB2jLgsa6lS/T/jdeqrSAmn+CGhHirdYRMP5bhbeD7EJXSDla0mPKLfnvJ4RPM0wfERWqZhWnEfr590SOuKw0R2WrPrSenNmj/ZZLeUPXpG4PtrT4OdSzO5/OSDT5g85uXRb46V0ZuT1h0j9A3lbw4iP82UBG5QDkEF2VGWx64tyCVx5rSS4Vnf43CfYAPcifm+dXfh067e81Fr7Qy3HDP3fzL3O/TEh/wdcpyipzKHEbfS6FlLWbzPFSmEuBdSOENZb29RR0ZBmxn32A6dVBAa6KDDlbWxC3LW6Ivv3mbVGuAPr/NyZ0DIARwOIurCb9UdzRIyl7y6gQqDeZlCWxWTb+7UvWl0OGKwZ1+893c2ZSwMWx/0XFReBhs5hF13mxOHYwm/o0ZTuxAdKHhq1cOLrqXSYnblUF5v2I+MOvHVDH5Ey+6QjGRK8sGTfhYJ+440SdWB9cdKokVql2DbOfYt33DoYDZlrtfD5rKvab9N2AvruK5J0DGtb29ClS2sA6VhcpXdOnJA4mYYKlH4UoRy+uoT1hMxiSJ5Va4EBRGWePCLucCmfkvIQDMMJZkJeD55NmUn/MFLQdL4ScMz/1sBd5VIfxVSKzYgOE6vG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5214.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h5xKx9pHSwt/0Tb0XaGrQTVO/TrKyS2/ptKnl+Zx00d5m97MztSnMcL/ucWP?=
 =?us-ascii?Q?p4w5Qn46iS9u2RHD1nsPV5GD5KCSBui/jKprnP5hFi7JvRZsvJUJq//I+0lG?=
 =?us-ascii?Q?9c7D+y9expjD4LTfHoIUgx1kE9Amc7C0mBI4sjKEqG+Q8RLqcXaAIEjmoGNm?=
 =?us-ascii?Q?RfMY0ehtflYbOUAO2KTfPeIK2hTpNRuYLbUPN2swFzl/af11BawDuiZaW4/t?=
 =?us-ascii?Q?N2LSlXdETjXi1Lil/pb5DDtsAiryFyHPcp3F19XRvn9wGBX+EoJEHNq7E0Wx?=
 =?us-ascii?Q?PTQ+f6Nulx08BlOu5dVH9ZxvErCc1lrN0wNkKW7InJTr3/639tOyYl32LGcA?=
 =?us-ascii?Q?XSn+CuL/NQQUoylHqZAQGJlh6f7wohvhLKMKOIAPNjNONT0/6RQT1KapPFx3?=
 =?us-ascii?Q?rwyUwyzb9bp0fmjXgxWyjLCnfUOngkK0tMZuaS5fWzNqrf2uVwI6xyXtnQ/I?=
 =?us-ascii?Q?WfHB3HViN4cDhrlGPH7Io9iNreMEf47XvyLrjRCEEbCR4g3qSQyUtBzcpfMX?=
 =?us-ascii?Q?GKxiJJPVqp+9x4ETblRtPQ2afPoN6wgQUobs6SLPtjX9PrV2/mTkMF/Jxx+S?=
 =?us-ascii?Q?n/OYzy66ClnfFp0YMNXqLxCm/754S83Th4seNs/UWV7FThWlwoiyJCIU3XOc?=
 =?us-ascii?Q?JfCEHLBmdeupuCeF6YaV0U8NRooRf7YxmKH4Q/Ld2xFq0GltSmd839NlfnmR?=
 =?us-ascii?Q?Zdz0f01/bYMozNWaiCLWk0jEBXlof7/I4mvWUjmdGv/gdV4BxYdvHLtFx4Am?=
 =?us-ascii?Q?h9DpVfsfX0NG8DYMdN1PNy1xMhg9pAl20wyDQwqInju3weyrFxCCmqOmkvmz?=
 =?us-ascii?Q?Auo6LXc8b3GrH+lVVBHOVqWDO1GQovHVlfxemBkOlsOpXTYsvmnMZ+9EzXtV?=
 =?us-ascii?Q?rfO3wtkWqgfzD9VRF8M+ZPAuPtNlK5q0weGn8AzYPfqMnxzGHQukSR1RaPJ4?=
 =?us-ascii?Q?kLN/1W9i7/bb+gY039VgP/q9Bv/pwWauaDiTdl4TrLrhE4y+Wz0qrJ/I47jp?=
 =?us-ascii?Q?A/gX6DNLLZzH6jcTgWIeWc23m2EEmpKvOKAGAvZth67XIFxu+U4291GSE1xe?=
 =?us-ascii?Q?1xH9ivPSXbcQlD/c/wrD6SbpRSzBJZalegH8HOAv/5xXswGBjSvZ0b9V5IPs?=
 =?us-ascii?Q?ttSyyd9wTdnFqwFtJWLlWHQ08Hk2EUqZPMSILtFoQAW4S6v0GbikrMAikWnP?=
 =?us-ascii?Q?66IHiH0lv6sBtdHjGsZyKs3yY3X2t6Z6N/3OldAp5pKfoW/c8WbpCQyMkIx4?=
 =?us-ascii?Q?HXOzdhLW7+I4wFVS+Xshi1GNoEeduUimCFxeZlC1reMvGBzpsudzSjdFsVaN?=
 =?us-ascii?Q?nqx1qN7sWKV51uindeLL/+hp+EEWxbC9b1woJXB7/6HJ0+4Pt/ggy8u4fo+N?=
 =?us-ascii?Q?fqWmmcO9YAwxUxBxWaiGtF7EI+Bu/W8YxXSPXuK3PdFktT6RuHVw3y/Xbg6P?=
 =?us-ascii?Q?Z8LUpJy+fVAmE5ATYwDhZS8ItTrWfnsz3qCCoNcdD66kaF9n6i5qpfvGefU+?=
 =?us-ascii?Q?3ClhSUakndyESScs6vxjaiFAC+GgSKdVVlwD0upnqPv8U687Z/MQt95b9Sam?=
 =?us-ascii?Q?3xoh12zmZXVBEs1ojBAH0yxxCMkpBggKm1yHLtCN78a+cB5rQBJ3GlFHoaQq?=
 =?us-ascii?Q?POiV8NfpnPNqaks/rFrS3UIR+hd0QfV5fqR/RmFbZS/rfpq9iBYcZrA06vNC?=
 =?us-ascii?Q?GLv6Gm1/a7RGW0eujZbx4rjqIu2mhcjcMFah3+y8NxX7WQmporsuD3KpFbLL?=
 =?us-ascii?Q?RnL5gtv/+w=3D=3D?=
X-Exchange-RoutingPolicyChecked: ViAr4EBK2GfkLpFwjVuK65e3pEK7hQEMSFNGyH8kl1LbXaTDNNECr4QFEPiesMYD3B+YOSD7gR/QdpGo4wyuAAlHvAImPjrbWAEQ4hWFXg8rYqmTwLI2NjC/wf54EZjbVJMfdZ2jP9OU1GY+OULNA9gWoa/fDFASB9HJnLDi9omev7lkmlZBQ5Qe1aet22sZhaF2TMKWaFOHZne+IAuoovI5uUVO57CMUkcQgzwXh5hkU8k7Nb3poeMN4BvwmoEe8VStExTwnvAM2t1yDqJgn3GdM055RxulHCfp5yGIb7hriUPgXNGwPwPQ50rbSNbm4g0XCMmLtVtyXCUsHAzjDw==
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbaab51-dcbf-4706-b287-08dedccbf418
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 08:36:06.5943
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0M0QpQFLgFg7Lcvur7LbFpIoA5ggBLR0p0znH2rbh1WlJB8SbRzAZOdBq6U4+09aNBjEp2Tt2Ks/R5003HiulA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8127
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/tao/mm-add-CONFIG_ANON_VMA_FRACTAL/20260707-144132
head:   e64b011bc52253c6d4c18b85147ef435b008c2c8
commit: f2fd5350eb8cc3bbf1b7be2dece44d930994ae21 mm: optimize rmap for ANON_VMA_FRACTAL with PVL
date:   9 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260707/202607071848.QRHwmAJ2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260707/202607071848.QRHwmAJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607071848.QRHwmAJ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/rmap.c: In function 'folio_lock_anon_vma_read':
>> mm/rmap.c:1161:32: warning: unused variable 'leaf_vma' [-Wunused-variable]
    1161 |         struct vm_area_struct *leaf_vma = NULL;
         |                                ^~~~~~~~


vim +/leaf_vma +1161 mm/rmap.c

746b18d421da7f Peter Zijlstra          2011-05-24  1147  
88c22088bf235f Peter Zijlstra          2011-05-24  1148  /*
29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  1149)  * Similar to folio_get_anon_vma() except it locks the anon_vma.
88c22088bf235f Peter Zijlstra          2011-05-24  1150   *
88c22088bf235f Peter Zijlstra          2011-05-24  1151   * Its a little more complex as it tries to keep the fast path to a single
88c22088bf235f Peter Zijlstra          2011-05-24  1152   * atomic op -- the trylock. If we fail the trylock, we fall back to getting a
29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  1153)  * reference like with folio_get_anon_vma() and then block on the mutex
6d4675e6013578 Minchan Kim             2022-05-19  1154   * on !rwc->try_lock case.
88c22088bf235f Peter Zijlstra          2011-05-24  1155   */
68158bfa3dbd4a Matthew Wilcox (Oracle  2024-10-05  1156) struct anon_vma *folio_lock_anon_vma_read(const struct folio *folio,
6d4675e6013578 Minchan Kim             2022-05-19  1157  					  struct rmap_walk_control *rwc)
746b18d421da7f Peter Zijlstra          2011-05-24  1158  {
88c22088bf235f Peter Zijlstra          2011-05-24  1159  	struct anon_vma *anon_vma = NULL;
eee0f252c6537d Hugh Dickins            2011-05-28  1160  	struct anon_vma *root_anon_vma;
f2fd5350eb8cc3 tao                     2026-07-07 @1161  	struct vm_area_struct *leaf_vma = NULL;
f2fd5350eb8cc3 tao                     2026-07-07  1162  	struct mm_struct *other_mm = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1163  	unsigned long anon_mapping;
88c22088bf235f Peter Zijlstra          2011-05-24  1164  
95b34d66480bbc Lokesh Gidra            2025-09-23  1165  	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
95b34d66480bbc Lokesh Gidra            2025-09-23  1166  
88c22088bf235f Peter Zijlstra          2011-05-24  1167  	rcu_read_lock();
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1168) 	anon_mapping = (unsigned long)READ_ONCE(folio->mapping);
df25569d401e36 David Hildenbrand       2025-07-04  1169  	if ((anon_mapping & FOLIO_MAPPING_FLAGS) != FOLIO_MAPPING_ANON)
88c22088bf235f Peter Zijlstra          2011-05-24  1170  		goto out;
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1171) 	if (!folio_mapped(folio))
88c22088bf235f Peter Zijlstra          2011-05-24  1172  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1173  
df25569d401e36 David Hildenbrand       2025-07-04  1174  	anon_vma = (struct anon_vma *) (anon_mapping - FOLIO_MAPPING_ANON);
4db0c3c2983cc6 Jason Low               2015-04-15  1175  	root_anon_vma = READ_ONCE(anon_vma->root);
f2fd5350eb8cc3 tao                     2026-07-07  1176  #if defined(CONFIG_PER_VMA_LOCK) && defined(CONFIG_ANON_VMA_FRACTAL)
f2fd5350eb8cc3 tao                     2026-07-07  1177  	leaf_vma = trylock_leaf_vma_rmap(anon_vma, folio, &other_mm);
f2fd5350eb8cc3 tao                     2026-07-07  1178  	if (leaf_vma && !other_mm && folio_mapped(folio)) {
f2fd5350eb8cc3 tao                     2026-07-07  1179  		rcu_read_unlock();
f2fd5350eb8cc3 tao                     2026-07-07  1180  		return (void *)leaf_vma + ANON_RMAP_LEAF_VMA;
f2fd5350eb8cc3 tao                     2026-07-07  1181  	}
f2fd5350eb8cc3 tao                     2026-07-07  1182  	if (unlikely(other_mm))
f2fd5350eb8cc3 tao                     2026-07-07  1183  		mmgrab(other_mm); /* put vma after unlock. */
f2fd5350eb8cc3 tao                     2026-07-07  1184  #endif
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1185  	if (down_read_trylock(&root_anon_vma->rwsem)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1186  		/*
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1187) 		 * If the folio is still mapped, then this anon_vma is still
eee0f252c6537d Hugh Dickins            2011-05-28  1188  		 * its anon_vma, and holding the mutex ensures that it will
bc658c96037fc8 Peter Zijlstra          2011-05-29  1189  		 * not go away, see anon_vma_free().
88c22088bf235f Peter Zijlstra          2011-05-24  1190  		 */
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1191) 		if (!folio_mapped(folio)) {
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1192  			up_read(&root_anon_vma->rwsem);
88c22088bf235f Peter Zijlstra          2011-05-24  1193  			anon_vma = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1194  		}
88c22088bf235f Peter Zijlstra          2011-05-24  1195  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1196  	}
88c22088bf235f Peter Zijlstra          2011-05-24  1197  
6d4675e6013578 Minchan Kim             2022-05-19  1198  	if (rwc && rwc->try_lock) {
6d4675e6013578 Minchan Kim             2022-05-19  1199  		anon_vma = NULL;
6d4675e6013578 Minchan Kim             2022-05-19  1200  		rwc->contended = true;
6d4675e6013578 Minchan Kim             2022-05-19  1201  		goto out;
6d4675e6013578 Minchan Kim             2022-05-19  1202  	}
6d4675e6013578 Minchan Kim             2022-05-19  1203  
88c22088bf235f Peter Zijlstra          2011-05-24  1204  	/* trylock failed, we got to sleep */
88c22088bf235f Peter Zijlstra          2011-05-24  1205  	if (!atomic_inc_not_zero(&anon_vma->refcount)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1206  		anon_vma = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1207  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1208  	}
746b18d421da7f Peter Zijlstra          2011-05-24  1209  
9595d76942b871 Matthew Wilcox (Oracle  2022-02-01  1210) 	if (!folio_mapped(folio)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1211  		put_anon_vma(anon_vma);
f2fd5350eb8cc3 tao                     2026-07-07  1212  		goto out;
88c22088bf235f Peter Zijlstra          2011-05-24  1213  	}
88c22088bf235f Peter Zijlstra          2011-05-24  1214  
88c22088bf235f Peter Zijlstra          2011-05-24  1215  	/* we pinned the anon_vma, its safe to sleep */
88c22088bf235f Peter Zijlstra          2011-05-24  1216  	rcu_read_unlock();
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1217  	anon_vma_lock_read(anon_vma);
746b18d421da7f Peter Zijlstra          2011-05-24  1218  
88c22088bf235f Peter Zijlstra          2011-05-24  1219  	if (atomic_dec_and_test(&anon_vma->refcount)) {
88c22088bf235f Peter Zijlstra          2011-05-24  1220  		/*
88c22088bf235f Peter Zijlstra          2011-05-24  1221  		 * Oops, we held the last refcount, release the lock
88c22088bf235f Peter Zijlstra          2011-05-24  1222  		 * and bail -- can't simply use put_anon_vma() because
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1223  		 * we'll deadlock on the anon_vma_lock_write() recursion.
88c22088bf235f Peter Zijlstra          2011-05-24  1224  		 */
4fc3f1d66b1ef0 Ingo Molnar             2012-12-02  1225  		anon_vma_unlock_read(anon_vma);
88c22088bf235f Peter Zijlstra          2011-05-24  1226  		__put_anon_vma(anon_vma);
88c22088bf235f Peter Zijlstra          2011-05-24  1227  		anon_vma = NULL;
88c22088bf235f Peter Zijlstra          2011-05-24  1228  	}
88c22088bf235f Peter Zijlstra          2011-05-24  1229  
f2fd5350eb8cc3 tao                     2026-07-07  1230  	goto out_unlocked;
88c22088bf235f Peter Zijlstra          2011-05-24  1231  
88c22088bf235f Peter Zijlstra          2011-05-24  1232  out:
88c22088bf235f Peter Zijlstra          2011-05-24  1233  	rcu_read_unlock();
f2fd5350eb8cc3 tao                     2026-07-07  1234  out_unlocked:
f2fd5350eb8cc3 tao                     2026-07-07  1235  #ifdef CONFIG_PER_VMA_LOCK
f2fd5350eb8cc3 tao                     2026-07-07  1236  	if (leaf_vma)
f2fd5350eb8cc3 tao                     2026-07-07  1237  		vma_refcount_put(leaf_vma);
f2fd5350eb8cc3 tao                     2026-07-07  1238  #endif
f2fd5350eb8cc3 tao                     2026-07-07  1239  	if (other_mm)
f2fd5350eb8cc3 tao                     2026-07-07  1240  		mmdrop(other_mm);
746b18d421da7f Peter Zijlstra          2011-05-24  1241  	return anon_vma;
34bbd704051c9d Oleg Nesterov           2007-02-28  1242  }
34bbd704051c9d Oleg Nesterov           2007-02-28  1243  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

