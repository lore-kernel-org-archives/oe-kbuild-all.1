Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4C4734EF
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Sep 2026 12:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782962; cv=fail; b=VK9ZpD/39HghuO0griTEd6dLScfFW5t90/zNQOVMtv4MVhrLZpd3ea1WF6083qgYHKULfMlqPaR8TnT4ZwxmUc+MkwcmgnzsjrTLo8upjHR6MddcUVgq7zCe/MCObV8QkZrXBsZl2HVyCm753IcDCLIzJQmkCHu3yqQREB4qQ9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782962; c=relaxed/simple;
	bh=c7PfgYjx7xMbZRvi8DhNGBMLleE4jdt7XZO09sq3IDw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=cgU5xhkYCB0y5fvaeWzQ8Iahk8gCfxuRigpdfkN1pTbwbVAFoP3QVnhXTJ7tGrH4QgHvaWLBJ6WIqWFee8Dq6oXrPYeVkUzxe82y+SR9pafqqkHAel11NKnnvyi7gczuXBzQfaqi5SW0irLGou8KDx555hIuLo7TRf5mN1XQSuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BuyJZizM; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BuyJZizM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788782961; x=1820318961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c7PfgYjx7xMbZRvi8DhNGBMLleE4jdt7XZO09sq3IDw=;
  b=BuyJZizMQ1mkGCwmH3OLBVbpyWzkQZqnIfyHAQu/jM492DXW+Kg4Nxcg
   uGqL37CVj8kKiifReSpz3GEyk+GmGjHVCOeGRJInn7GMdMTl3vUNrqTPA
   6yxuFKN0XG2WGUngQOtxAD+0G5oWbL/u+KTBwsT/DArFxlre93N8EpByp
   mBhRgiiMss9t4eROrghJHa5mbWXrdPKTFPxViHm6HIDgIfgaMxoqkai2q
   M6xvVhHH3MuyoVogrbchMGF4B2annje0/coT0HC/EWfPuBkDsZozw+9iL
   f4mImxDQ9WUwEvt6alMCElJtK/LbDMbY8Rh3kYMt4EBCCbt7fEvCu0FiT
   w==;
X-CSE-ConnectionGUID: 9MLxlXdDQoS5TeBV9Xt3BA==
X-CSE-MsgGUID: caNhWpvBTyG+4yPutO/8FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="99519049"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="99519049"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:09:21 -0700
X-CSE-ConnectionGUID: xLsr6cL3Sy61Wq7ePpr7hg==
X-CSE-MsgGUID: RDIlJNBmSjyGRQmBcWuZ1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="270665031"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 05:09:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:09:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 05:09:19 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 05:09:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zNq4PgZI+YMLcEr2iwfPyi3sC2HCeYqwxvNiVjDAnj4Z1BiZ5157FQGdsWEW8zmF+xVfyp2M5spq/Jtr6b+NmEK1nuDpzqPpdvxLzZ3TAiGwASTWQPW2klyZshhYr/TIzOF3erbU9WJeBu8r2isNJ9rjty3ilU4KQrtKJuyg9slYP2xfFojHfuW0ZslAsagVMeCz+BOe1sGxWiGzwBWiQGVDeqEkT9Ejr5K6C792R4Fz8Ia0rQtoECuhTM+cqOoEHPQQb6yW0mes4Z5EAdbglRne1xO/eL80sPvuZEi64tNBh79ZHkIoWTZYYxCauKIFRsfVvD8bwlqwEXDi6kWKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BYExwXN/Ggi7uzuYvzR8wCYi4ScQKLsYH7KCS89f0d8=;
 b=UFwxZPZUv4ftuVhscHA54LLGCSb5lg2V8AEG6Qh65fNWQMGbsjd/s0n30aO9EOunoEbgOoRYFyq1dqHASk5OCgKss1ekyPIEiuxTHJ1Cjcszna7G85nJS0ALGQB2KcrWge5nMGwOsPLiQTtWJ5fFaaODXjKANAbncee0o4aWdyn3tBUYfbewQ3nUQn/T8/NhSNYTx4dD9lAXsMh5p7sPz/13XDEyG6XAYb4WPLIpHyEX2PijsT8ciXJfwLPeLiPtb+fM+AAJyo/X9TxWtYXiBehUkeu1pShsOzmKv6QJQ6Im6NFzMuhd95i8kk0yK0W9NTaAF0pYO2XUfVVUEvXnvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e) by CO1PR11MB5043.namprd11.prod.outlook.com
 (2603:10b6:303:96::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 12:09:16 +0000
Received: from PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae]) by PH3PPF4E874A00C.namprd11.prod.outlook.com
 ([fe80::1c3e:8202:fe9b:8ae%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 12:09:16 +0000
Date: Mon, 7 Sep 2026 20:09:07 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android17-6.18-kminext 2/2] /usr/bin/ld:
 tools/testing/selftests/vfio/lib/vfio_pci_driver.o:undefined reference to
 `ioat_ops'
Message-ID: <ap6pY2IxnscKUlEP@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KUZPR01CA0005.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:34::18) To PH3PPF4E874A00C.namprd11.prod.outlook.com
 (2603:10b6:518:1::d1e)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF4E874A00C:EE_|CO1PR11MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: ac02ca89-a6bb-48ee-7621-08df0cd8d67b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: EcRHm4PFdMjOApv/fTsk1e2UlOxzoZKsw9I2xKikjNBI3WNMvq8IH4+XvxgIpEgFUXaJqXE50ceKjykEb8DWgkuiKkEzZwvcjaFcBBoCHKbJSJWSL0ROJQxxVnPYXgFuXeqmRCqCp1KdG45SD0vEtn2fnEpUztmGuKnQakix/9+mAJRaJ8F1eGJ4LRcFdIXRQQdBpUtUqeTOufYGgWR1Vzx9C6mJEvckbqbK4kBfgMqwdZqRKK3ttY0mb7mJzjX1KorsWkZinGZ4UrzKuMD9oWq+CmsTMFQLVw8U7xUSVEO5I2UgPUy4LarNnZmDAIEo9zP6Am3dAX0zgP4UhY2CDOmTyL3VS03my0RqeiWiPi2OBGcESQx8M0mcwCm81hXR8V9Sn5k+MqiL1J2EzM+fB/h6cLZUt3ntTy1rg7urkfJtl9KYC20z0zBcaPQF+BqLFo+l/k4BqOCAHwuro3Q7UYdWw12x7k5W2wbwDQr2BysHhMvvZPbotM0XFhSGRYkIG0qyxggHY7xIY5t+LbXuPutrqR88TgGQAiraSiu+CL610VKct33ueY/Vv6lnnRN+aJ93Q6+CVCfwOL0ahclQxzUMhgSlu45qtphJHp/5jUkngfsmAWxfN3YZ7WUp78q/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF4E874A00C.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gJkYa+tl06gOpTZSA609e1/qIkOGiG9ArXbJVDbib09tywJ0emvPzP/46ynM?=
 =?us-ascii?Q?wy97d/3Aixd+k/D7s21U/hmheZQeafQj/fKOxX5IknODZMXdGlL2qXPvy7ft?=
 =?us-ascii?Q?Aw11/zPefqzCQN8qkXmv5L8dZrQYrT6tjfmN0tKb9SagvV6RZszQfcxyTpZM?=
 =?us-ascii?Q?uY2u7cl2xJ95H164Fb1NjrfsThqrO1lMPmS8TpHTm0/+bQ+y2Xwtsb39uVDa?=
 =?us-ascii?Q?twBTJ3FWsc9dPaUD2ttIUNiPVrSJDID6+7abh/CM79YpN0lAfGlooa0TwDEt?=
 =?us-ascii?Q?HKiwwbHd0zGAJhAd5suTY99unLz/+mr4LvEcpDUMoJC6FaZKf+Jh89PAtCSo?=
 =?us-ascii?Q?HK3Q20ETWtLC6C4tsuhzKFp3+//4Dyxd44DfLPFToBNmS/f9RB1aG0P4Bdrs?=
 =?us-ascii?Q?u2Cmd6jp6bGKq3p5Bfy3BfdBMVGmZ/E0PXM8nYtl7fwDTqVTwXshmfDQJhkd?=
 =?us-ascii?Q?6qhknEjCbEq/GSP8NntJv4KS0P1HscYDE7l8yugyQrnG77XTWn2fZRcdttMr?=
 =?us-ascii?Q?Nrb1VjuSFw0R1bYc+Toa4Pt0muP+o0QhSElU14ZVl8T9ESLDvRJgKWITQLw5?=
 =?us-ascii?Q?3N+e/hBhqla2eDmbeC4dMSCsWjs50ppFK4Lgt/JwGksR7ALPKom2lH0Sxck2?=
 =?us-ascii?Q?iG7OiPLhzirvJWlk1RtU031rpCyo451Q0yI4BUwJB1I84Gt3ek7zTXdvefer?=
 =?us-ascii?Q?WG9INHorKtX/fIMdmBe65Pbb3UMyb0QhXep5cyoYkeF8LpgwVkiNT8k5y649?=
 =?us-ascii?Q?1E5XTYPMpylh/SqBk52hEzXUZpO39MZBzV4vrZdeADVkXvEcMY5hkGg5QMP2?=
 =?us-ascii?Q?leqJn4zhxXpWDyvxhVFphz4urd2fyCXEeNBxuk4SA+vjtm8APQ/jEei7vM/R?=
 =?us-ascii?Q?Dkkbvxb6P8DJ6gkAe0HuPg/vjJGW2WDU7NqX8zy6sbj7WvOYRVluViUNUoif?=
 =?us-ascii?Q?tzP/cl3FhSoz3jZ4kBft5HQdK75SPGl5/7kvpdSO79MZvbqKntxVzXxJ2OTM?=
 =?us-ascii?Q?fgRe3v+9S1yXYlQMDu2gUmx9vLp0E4GiHRDTr+rX1pXEygQvenKn54a5DsTw?=
 =?us-ascii?Q?GeWoOJOcTs8pvhmj66HVnmUlmeHxIKXmz1v23Mz6ugxNoWsOBPgijY0tbxOB?=
 =?us-ascii?Q?u/EzcuZnvceeLL1ubuVTnjn2Hn0VL+Ll4f6E6iJSq+GpiFsGpnK/ZJKZ8XuC?=
 =?us-ascii?Q?JSy2uNu3acCClEaRgJKqeYjka6Sl1VkUFcl+OlAUDELE1fpzBxfV6QB6hE0S?=
 =?us-ascii?Q?Q21F3UkMU4/AnLox24kPWGZMljp9cRAS5st4jvTMUPTxYtKfuzJBUMLfDNCc?=
 =?us-ascii?Q?OdXLdeHXFe/kdSpdf0fsgCbN+Cy7wcAYeJtTh/brCrn1OgdRiibkCYw0FVMu?=
 =?us-ascii?Q?QlL3aNw0gZMYEfencPcm1T6tyelOZxzVyKiXa88gbNX67Bre1BADvkXpilYN?=
 =?us-ascii?Q?DXvg3gRJPITGOrrLPw94LpU6d3Pxms87Fryoowr/gPur+5yjr4fr1dBbESR2?=
 =?us-ascii?Q?ItD4FAd+3dhLbdi6m0BvnPNhOT0+hJqdCir96AAfYiNA2X2sh5vJl3KMiEN/?=
 =?us-ascii?Q?19acbyoOgZtgXp7woLw8evSORtsmlNSa/fg45NfC4hZwkjdZICR9v+35NuCO?=
 =?us-ascii?Q?4KDsUM7hFtTDclzjwKQlr5UkE1MlRPxam9euk8+gPRn6pw8NlpP8zYlAHCik?=
 =?us-ascii?Q?DlTSK7cY9wcUyjPfTMAROBqZmX3HJ48gzvIwlntFPmtE6dGk6Tp353q0Z2Qm?=
 =?us-ascii?Q?/MXJNxTqfQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: SX9TAyifN6AeapZBy3GGXnlQaf0XyunEDmswXEwavSJegmDGiBjLOA09CgypeSVRu3HNd3YkHP2eU1EpJ6VysUUMRiPRN5DEM5WNx0QjXEmcYflUMrql+7YIOeg7k1D0au3SJufMdfxbVi4bVF+3VIh7JDF/3zLxhy31M1eVoFhBE0gA16cT5dTxr0NFpz02o3cYgua8htXR6SLFg9w9kaeWW/0yd8eTjLM/HlgE/noY8ISNUAJGF2qOjn4n4mydFaPHypE1imlOJp14ud59cE35a86zmXp0uucR6XL2MLtuAHATItmdKsFKIcy+aGb/HN0zZ7kFfawEBt6MjpQRAw==
X-MS-Exchange-CrossTenant-Network-Message-Id: ac02ca89-a6bb-48ee-7621-08df0cd8d67b
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF4E874A00C.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 12:09:16.4403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJx3uahT61BxxWQ/L9hq4Sq/I740XgFQVdRFw4By4K6r7f1xTXVPvuex1pK0fsRRGHdx7Tn45xEc2Sg7aNtAFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5043
X-OriginatorOrg: intel.com

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   c0a35f3366299626497a612a9fdb7e01c77eb7f3
commit: 2223587df5c5e935cc6f973f62a9608eef81bec8 [2/2] vfio: selftests: Add driver for Intel CBDMA
:::::: branch date: 4 days ago
:::::: commit date: 1 year ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260907/202609071200.fdWMQp97-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260907/202609071200.fdWMQp97-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 2223587df5c5 ("vfio: selftests: Add driver for Intel CBDMA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609071200.fdWMQp97-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

