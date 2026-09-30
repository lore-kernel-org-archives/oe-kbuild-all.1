Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32381250BF2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Sep 2026 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769720; cv=fail; b=pEDNS0tsmf/tEWr3knKJrzI3Ydi6F2iBXX7PJANAZio8cf/d5oW/NMlzxM2uqAsz5PxYdjxqo3qU4/Obq7OL238MYABlFQRUAbR0Qp0/EHXJXGNMtM8t4yQxjhtVIDJPo5OelZ6md+OAIjuquWRjLep1QPHbVYcJTzg9Nyz42Sw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769720; c=relaxed/simple;
	bh=UwxuaBwM8gTHrgDdSiFedONrvastAhAPY+3uSg+LNZ0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GWDPBnnO4jKTD7GAE0tzRxaUd63c5aeFn3mPNDx8igVzmj7qBh37eWi1tjDrmhbsf3WizR5XizoVFhtL6V/ZRmKFHX9cK0UdSod1+uBmk1RgTkGANZRo0BcQKcX4HBXFumRYxijbw0X/k2UXTCtglAb8YA4x8FbgGrMoBGaWVZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T28p0UFM; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T28p0UFM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790769718; x=1822305718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UwxuaBwM8gTHrgDdSiFedONrvastAhAPY+3uSg+LNZ0=;
  b=T28p0UFMV9Qt0bVkl2GuXzMHTBSdvXAYMAAt06r4pjKbpDoRARfInee/
   z8l4LR6GFdkP5mLi8Oj28WBr+6fAWhYzPIcBvPK7K9rW7fAdImkhBELlg
   xLBEYq8pHxSh45YTDnjWQzZi7wMvZuP1O/TcRrAkr3dWh7uSedj3P4ZMf
   YRkLnWI2J8+d34ARTbLY05cGbVwLU8svsoRAdX2rfG/I/TlFIzdth6y4s
   EjcSKcSA8305YAQMUqUAHPnMltpxIOWmU3VMqg/FOUrqvZz6EA9fqqxrS
   w0QSkACGk8etf405bP8Od2x8X/FFLrOomHMrHMcUVTDHh1CM4VWPpEBr5
   w==;
X-CSE-ConnectionGUID: 5sBG4WinQHK6+5UId7+pXw==
X-CSE-MsgGUID: pFBZCjp1ROKMY7HlMJ1dHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90405077"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90405077"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:01:56 -0700
X-CSE-ConnectionGUID: u3xoZ1wQRVO2mAXLz95V3A==
X-CSE-MsgGUID: eZiCuFbCRSyivdGnn1NF/A==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 05:01:55 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 30 Sep 2026 05:01:55 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 30 Sep 2026 05:01:55 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.58) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 30 Sep 2026 05:01:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOivVXRXWKwZN6+kElwMh55Kg0BtHC+LJYeYNITMCCW1226Kbrv0qvCtjDZTwK8GT+NTT0Csi8+FApjKVAzmLEEZ2/rKu7mZmxJCfyr0JxG7Qj8pxZB5/ESf6vxZ+dtBMBl3OkvvRpI6kUF0H/j35TBXYFdc98jO7CaHp+RVZI09eOPQaUcdoWGGq2s4T19TgaPMuc8hFayZUCRd9hPbL2LdU6dnQtBfX+YvAqHuu9UJnzzRB5a76vpvgZlvakasHUcF84OA4RhW067pGzxRXDm5KkHq0BhjGtPUc5W/u9j17jjoUX3K8J9U4AV5UX0FrZuHR3ARmXyqHhSTcWJgAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4VBXfr3wCw5HMryZ5SzdQUUhHgULy7Kv2tk+IanDsg=;
 b=kREX0RUMIkl8woSQfSlMqD6oqJ1jXn2lCByvVnux9hbxyDuk/iarUkFvMrVdNzeIWSVO3d85j5KjRBh0og1oKGWHMhowsij6lEyxOS9WFDi5XwM2HhC2OHciQZeMM4dISme9IgrMaVCTnbDO51l3/EtirSegzHxBLA5GP69euVSRnjFU1gE5rEbPvEWN/kOdawRfTon+eD/srrsj2A2Tdvw+rSuukdXucb+hkFMgUIbJYP3KlEZtxHYTRoounaM+jGr6pv6mcauBh28EpztdO0psQVYt627NMHdUb7TYh88oms6P0WNc/rZ3U+5e0Zu9ZKZufAbrdOxNM7Y86rpNHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by CH3PR11MB8383.namprd11.prod.outlook.com (2603:10b6:610:171::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 12:01:45 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 12:01:45 +0000
Date: Wed, 30 Sep 2026 20:01:38 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: robust_list.c:56:9: error: redeclaration of enumerator
 'FUTEX_ROBUST_LIST_CMD_CREATE_64'
Message-ID: <arz6IreioXVJJjcS@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR13CA0012.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::17) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|CH3PR11MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: f42d8808-e3cf-424f-ec3a-08df1eea991c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: OFXzKU6fSYarWCoEw7fCeAPoQe24dAmeef06yobECWPvpPaE8JRzIJZ+xHY5j2uYWNhII+FUh8N305AxN0yXnGuZu2iUJR1OoXlhE1I3URAwOtEriJcS/NeLvmiFyYCs/uX7JGtGm5KGx+oNy3rcI0AGhjeAzc29D7h0vJy4cYphJVdysw4ba7l0XskoEOGkoR+RhYGeZX1Jcv18dEQl801YvUD7iIA8o8ecfgo/bvHBW5rbyt9D2YcCjbWpKIWR1nHyrgT8wdZRzzw50lsUGchHM3pmhGJmAJiLtr23yG0kpZ+SItYjogdy9vaNXU01u8ONBTDBahX+bHZfhxm0jQv/49FU2ynbjDm0yCyIusFL/buxLPVTXvLq7rpbmE5f7bZgB58TKsjKiajJjrmXA6wRpC1DboZNHsX/qwsa8atKJx328ukpnoNKrcgKMO4RECgL0Zl1yeph4AO1i/BpqMrRnepflWhntyHSz+BjPmmXq4EyeFadVOvHqzbq4nnNBOhu/pbNUGA+offm2MulkU6SbfN6TSsQi7+Sv6+PBwlDyq7oEwH/Zc/zHk5yqdg8cRT8jsZB6ppoQGpzKxbHkFicoImcZ17mRUWDnnbiwMFEFt5lZ7N1oMU7Hhl7Vkws
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eFqTxYig2nVRZ/AZLrvFgmdvaUGONjMPgx5ExEoHOpjLbgE5sGeZsm4oO5o6?=
 =?us-ascii?Q?LT2XAuBGikDB+H8c/f/Qemh16k8TbgPGtmpuM8bHMaR2lAziq7TPHbOgQYST?=
 =?us-ascii?Q?+S3i6KpKTPT51+bxjn3qFvKcQFK+TRnPytUAgGMydO+RSgPz5OmH6NqgVWFH?=
 =?us-ascii?Q?/DBjhTQYTVn/vRliBjM9bkjZmQLUgxd1/GSY6nDlqlKTS3gbS8GfYmS0UGWZ?=
 =?us-ascii?Q?2Dt91+raJFhqcqg0+hxy437zYj7cZ3L0bu8GK/p6hc62QAOpT85rRsaFKk/D?=
 =?us-ascii?Q?1R1ACwYfU2DZ5nLqaPSntx4swA/bY/9Ppuv7/VzvbvyIg/doGOPP+DmVjMlK?=
 =?us-ascii?Q?64k2J7sLoy+J2eU8Qm/dnaRXdfUU9Z+uV8GgDl4jQLnYHJmSR3h4lFa27MQy?=
 =?us-ascii?Q?A5AeteApvUSb1a4oKEXQT0/AhaK8rHMRw8eZArX/esAKYhQ2bUKxn1fL1FIJ?=
 =?us-ascii?Q?QoYrLdLvDP4UXNRlRO5DBOZ0HQasrg02dH2nazl73puMdIOu2vAngsbsNnu9?=
 =?us-ascii?Q?9UxivaUqqWCOEUd93FZAUFwBN2HqGJW/X2eBvATBie6h+CVVrZL7tfwhdkFl?=
 =?us-ascii?Q?M4BvIjm6lPaIESIlIt2nIfE5ZNnoTXx9UYNrVVve+hwah7LmM3VCRiTxet2h?=
 =?us-ascii?Q?Rsnsr5+NHlZgLUwsXsMew18eNTJ9JQnxHqs0yD+TnAeCtaDcyZO98id4fjlZ?=
 =?us-ascii?Q?RslrvdMRGB6qfPkOEMMwxUSbJ6aJs/iFdnIy/WSF51/AZTLHdJlsbSDrmqGN?=
 =?us-ascii?Q?/51k47rNbgsuk6jmjsfprsRmzanMw6/8YxjR3CUh8BLK4+sA5ighgFfWIc0P?=
 =?us-ascii?Q?mtsJwQ5N3wihlYvG0sdY+uRxsm7qO5usWFM3mIdssUXO3mjZAtyXzj5XnIoO?=
 =?us-ascii?Q?X48AUmtsKG4ytrbkf2fswTOKeSh0cewt1vMihu1LElfFR2cV7zUOA7+2ascC?=
 =?us-ascii?Q?H5cvnqrxVjt9OI2LpW8ioMzzUcWSB4lf7cQCYqvQDjsD6FPGeJpgN7nl7ZBV?=
 =?us-ascii?Q?AY4eGeIjeIj/g2Xy1G6YB+NChbgP54l9HOpqY+c7galIpPJpx1GXtjDL6eMS?=
 =?us-ascii?Q?OzP6lceXATgNkikk5BZ+fV9b0VdMz+mAfGN4MWjp1A87GGgTWqWX7rd71hOj?=
 =?us-ascii?Q?OAea7pbJ/9C9wG5KuF7EVMWlqAWDi8/aoGT2pkH9j47nl15+mtrock7C6nvj?=
 =?us-ascii?Q?6SW3qyTb2z5Rvctwt5lyLVx9ItylO4WDAnOJ6Libx0D2HeR/FxUQDVnJWcbv?=
 =?us-ascii?Q?3ifnTo+iaItbt/5/q/TfdSeQUb2PWmsyXoqSXDfLJQamuf27HfebXAQ2ofvs?=
 =?us-ascii?Q?cOchsUBl5pg4rCGcQhlKO9CFc3Ui81yZw0pKsuZkheYm26z35XynLyjjZJ26?=
 =?us-ascii?Q?bn9Uo3fTLmj5gFBO/v8a+VIAzILMj52KrKGfswAL1+BoPBm9HNdoDsiQpYvT?=
 =?us-ascii?Q?c+jQ4qo46+Yh+ekRgLg0cqPv6Wt6ElXVaBbYuUGcYMIT5VLeZKaRRZjBeqGV?=
 =?us-ascii?Q?jfHClfqijpHi59mPb26uwgH15kB4ZtW1HIJvjln/Z9g+yjGtVDC5vSc2UAYc?=
 =?us-ascii?Q?8xSI6ZuUrhlcivuQSVAYlrYytsBHSurcSjAZxIrSVXADL/J5tbI5b3cirQBG?=
 =?us-ascii?Q?frcGH/J1Ckqe+88Cxwu9hlz3sXi2E9kPalpMAYm3qC35YKp/rHGrN/SbjA+D?=
 =?us-ascii?Q?2bo4DkccGZjwh/4u1KuDXCZmE6uM2AjyYNsacz67FnQKMIDCw2ybAhFeSQdf?=
 =?us-ascii?Q?sqyxzYQgZw=3D=3D?=
X-Exchange-RoutingPolicyChecked: aBBH2luBHM4CS59WXoj3ZL/gBUz2y2rFd8etF3TCwTE3KGlY1ICufufrmNLSq9DNBGJUFHSM3KNTN0LYN4vCVMeIJ43Lo1WUzOBNtjNnOf7ZJVsaJJ1TY+wR0sO8mTwsFu87QpWzoqpB6G13aYPUjEZhuAJmlTMKHD7JBaLsMAoqQv+Uf3lJgwotYzDyJhI5zDdt+U7A7YAzt3x5hBC6skJjHugS5wI8W29SxGZoj9qnwPrxAZjTmxY/VRzV3kF4ftpKHk3MxCNclMvq6252mvdvqj+BxTLxK8EDoNvYofigCW0fIbavRL3wQg0+w+qPQSZaHFo6w3N2jU4UlUfPrA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f42d8808-e3cf-424f-ec3a-08df1eea991c
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 12:01:45.1477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLdx763YY1JA679yI1l0/yEXv13DHC0nnIfT/3vzjXLgYm2u9dCTbNyy99Lpo93vmQSKuA/51ALmPJC35p7CZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8383
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/futex-Skip-test_futex_robust_unlock-if-not-supported/20260925-145324
head:   0a151b703cae864a3bab66cc7fb5b8dc983658d3
commit: 9de641d609712eb8fe8f8a4b2f246e431c2c6da1 selftests/futex: Expand for set_robust_list2()
date:   4 days ago
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260930/202609300504.0bT0J7II-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300504.0bT0J7II-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300504.0bT0J7II-lkp@intel.com/

All errors (new ones prefixed by >>):

>> robust_list.c:56:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_CREATE_64'
      56 |         FUTEX_ROBUST_LIST_CMD_CREATE_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from ../include/futextest.h:23,
                    from robust_list.c:27:
   usr/include/linux/futex.h:196:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_CREATE_64' with type 'enum robust_list2_cmd'
     196 |         FUTEX_ROBUST_LIST_CMD_CREATE_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:57:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_CREATE_32'
      57 |         FUTEX_ROBUST_LIST_CMD_CREATE_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:197:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_CREATE_32' with type 'enum robust_list2_cmd'
     197 |         FUTEX_ROBUST_LIST_CMD_CREATE_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:58:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_MODIFY_64'
      58 |         FUTEX_ROBUST_LIST_CMD_MODIFY_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:198:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_MODIFY_64' with type 'enum robust_list2_cmd'
     198 |         FUTEX_ROBUST_LIST_CMD_MODIFY_64,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:59:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_MODIFY_32'
      59 |         FUTEX_ROBUST_LIST_CMD_MODIFY_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:199:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_MODIFY_32' with type 'enum robust_list2_cmd'
     199 |         FUTEX_ROBUST_LIST_CMD_MODIFY_32,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:60:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_LIST_LIMIT'
      60 |         FUTEX_ROBUST_LIST_CMD_LIST_LIMIT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:200:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_LIST_LIMIT' with type 'enum robust_list2_cmd'
     200 |         FUTEX_ROBUST_LIST_CMD_LIST_LIMIT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:61:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_CMD_USER_MAX'
      61 |         FUTEX_ROBUST_LIST_CMD_USER_MAX,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:201:9: note: previous definition of 'FUTEX_ROBUST_LIST_CMD_USER_MAX' with type 'enum robust_list2_cmd'
     201 |         FUTEX_ROBUST_LIST_CMD_USER_MAX,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:66:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_SET_NATIVE'
      66 |         FUTEX_ROBUST_LIST_SET_NATIVE = 128,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:206:9: note: previous definition of 'FUTEX_ROBUST_LIST_SET_NATIVE' with type 'enum robust_list2_cmd'
     206 |         FUTEX_ROBUST_LIST_SET_NATIVE = 128,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:67:9: error: redeclaration of enumerator 'FUTEX_ROBUST_LIST_SET_COMPAT'
      67 |         FUTEX_ROBUST_LIST_SET_COMPAT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:207:9: note: previous definition of 'FUTEX_ROBUST_LIST_SET_COMPAT' with type 'enum robust_list2_cmd'
     207 |         FUTEX_ROBUST_LIST_SET_COMPAT,
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> robust_list.c:70:8: error: redefinition of 'struct robust_list32'
      70 | struct robust_list32 {
         |        ^~~~~~~~~~~~~
   usr/include/linux/futex.h:182:8: note: originally defined here
     182 | struct robust_list32 {
         |        ^~~~~~~~~~~~~
>> robust_list.c:74:8: error: redefinition of 'struct robust_list_head32'
      74 | struct robust_list_head32 {
         |        ^~~~~~~~~~~~~~~~~~
   usr/include/linux/futex.h:186:8: note: originally defined here
     186 | struct robust_list_head32 {
         |        ^~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

