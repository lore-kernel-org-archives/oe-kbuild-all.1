Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105021FBC8E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Nov 2025 03:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763435554; cv=fail; b=GG/kNdRXEpMFDO8vjgObDWiHRlkZ2FCvamAt2i/cwbRaZREu+jrhAGev06WBocmBzeVGhprctfH26C44fgW7NxFL/epRkgzZrTnA3zhgJ00pYiT0Apz+9bdLaFr/wqNwNZzpDpQdnmCu5IhojBhwzZ6m4Y/tBo+TsH0OEcVls1I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763435554; c=relaxed/simple;
	bh=tr4L5v4hoUDtp/Gr+TNFBFWoaIJDcgmegqezQFbJsUg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ZRP7wMK/J/kEqQcTWs1K/9Qx2WA3CjaEbS2a8d/Re5JjeCmZBGfQ2CWPP/svtMx+D8fKQB84pcViLBUomdu0Wfgo0H+SqGnGZ4Eakj0dTuxLoNbt9DweWgQCXZwzAexwtUvyWebENTH0NVzStVK/o2SvK2SQz7HpJVFzMgZSCTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3locHWG; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3locHWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763435552; x=1794971552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tr4L5v4hoUDtp/Gr+TNFBFWoaIJDcgmegqezQFbJsUg=;
  b=X3locHWGol5SQyBC2AuqLH+tgrCl/3oa8/0i+K+gRFXqFX3VyrSOEzVf
   J6wFnsGc/RqTaZe0R0GPr2TlHEunnoCuaCT0WFNUfMtGKUMF2dV2L+Mmk
   Owcokw5h9J/1ZMsDHN3Sg9+579BueGdfRHGdO2SoxBb5jUO9NLXy6dvDz
   +pMNsnyNYJxYZRtMpZkMZ9smJPunDswL7d8D1bEGuQvOdyBfgXlECQ0KC
   7N6kZcu23IpjaUvLuZgtvS+LGlmy75fldqYlvR5MbY32tdTbtexXidUWy
   qCgX2yQhxZXfMS3lCPwKbaqlVn3tvYbr70Dhs9MNf8lanXDeoNvtCUDPQ
   A==;
X-CSE-ConnectionGUID: E9gLqaRZRhGDjTOuaXrU4g==
X-CSE-MsgGUID: BWYxtrlGSAuKog6EGkWJWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="65384676"
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="65384676"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:12:32 -0800
X-CSE-ConnectionGUID: L6jVQfcYTTGGlXYkDGigJQ==
X-CSE-MsgGUID: /SQ2a086SNangGSN1RiOOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,313,1754982000"; 
   d="scan'208";a="221535787"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2025 19:12:31 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 19:12:30 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 17 Nov 2025 19:12:30 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.10) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 17 Nov 2025 19:12:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiKEXnEBGXzX2UhDXUH5vkkAhdYrWoNcByRFNuiqc8U4gqqSfqKko5HojL3n4VxrPVohg48HDMDXpKWK3eSXOM8jq3TuRx4KtB7etNK+P1Y/xRx4LENcC/FTsLmMNusKGyeWdE9TvYp4gEsXU/qkIaft8VUFpu58JmKn6PfHE3kq7+UreRmEBnvmshZenTQAtjnnvSMxY+SrO52MqHQ2Y0vHWVrkpFfuJf3tk7StqXm/jrSA7grCZUrjQUid+wl9K7r2WmbwvR3GK+syqCffVcLZwybGX1wle93tiLEazYt8wWaN8sAbxd7jYyfUM5Od7tkSiiz4w06e++w7Q0mK0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KOY491hHdiHXjAguglkKBq8XbyCx5MkmroVmogXqrTg=;
 b=wixfi7K9b5dL+bCs6BPRAiUlQSpybfQva9diNTsiPcN6Icdn0CSL6hNTYQM5ZM3u2O3HSLK41gQcmSXlnkMjEsvMqZnchwWz5vuxe876FHuF+Wc+KpzOY5V5NVmxnOddZT3bq1sjr8VeAGsJ4+2v89RoOHG07hDFzXB6Nm7swbjLjcE/J6nu1JYGGqFVbmFRJFqWbAZ36hg/T527IIxyrm+l/wgR6/GpF4oyysIH1YoIX133eCwf/297dc6MAJdcY0uGuZSOZD9V5TohKX411NguxR1xHHzQY1LADJlf/Wgj23iHvH0xykc7+wv45b6/xrCeiAJttmsO6776MUZ+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
 by IA4PR11MB9153.namprd11.prod.outlook.com (2603:10b6:208:56c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Tue, 18 Nov
 2025 03:12:23 +0000
Received: from BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7]) by BY5PR11MB4165.namprd11.prod.outlook.com
 ([fe80::3876:1eb1:8e84:84e7%6]) with mapi id 15.20.9320.018; Tue, 18 Nov 2025
 03:12:22 +0000
Date: Tue, 18 Nov 2025 11:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: Zane Li <Zane_Li@wiwynn.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [bmc:aspeed/arm/dt 2/20] checkpatch: CHECK:FROM_SIGN_OFF_MISMATCH:
 From:/Signed-off-by: email comments mismatch: 'From: Zane Li
 <Zane_Li@wiwynn.com>' != 'Signed-off-by: Zane Li <zane_li@wiwynn.com>'
Message-ID: <aRvkDLdOK+kWTCJY@rli9-mobl>
Content-Type: multipart/mixed; boundary="oDo9PVDlm2ULCsE1"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To BY5PR11MB4165.namprd11.prod.outlook.com (2603:10b6:a03:18c::26)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4165:EE_|IA4PR11MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: 2935cd6c-b2cc-4c13-a137-08de26504abd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tAyRaAg78pmXDJV6GxMk9TuE5tPfD75mxwjZ/72X4ta6ZTcQX4nLDwa4A5o3?=
 =?us-ascii?Q?Gw7AB6N9s4VZHmbKC3xrq0GDXKCf0vX2aoRb7ODNjFfCyh+ouwDlM4ghKtR2?=
 =?us-ascii?Q?aJy0WwSknHEAsQlxqT9s1hIH206YLx0QEWR+0JLmXxGSQUHVTJsN4qvfE9ue?=
 =?us-ascii?Q?gXUVoYfQzewvnZFiMgt4asaR3lOjnmXvHwUPKsEz749b43j22nWg7N2u9lY6?=
 =?us-ascii?Q?SZoFQ0KIZcJ+RJ5ohtAsB7yPqWxKxGFqN/UrgwYAZJxBBUb5yXGdUwbs7aU1?=
 =?us-ascii?Q?pqgqkQE3G7xzWBVvGASyI9hI2HZP5dvE666uPVunz1pcaj8HaSe1cWHCJxvz?=
 =?us-ascii?Q?R/ONeMFbH9q/PWIPPUk51Tiqz8Va+qr5VTD/WxJgCmHXz2LPJDkTRO8L0CHT?=
 =?us-ascii?Q?BDrVmwnbyyb3XphYuhPmgERoTdQSGxMkiJTiekJZBVxMWt5CZYimIDeYr4Us?=
 =?us-ascii?Q?6SlI9aSodv11lg/IMIycjYsZjLLW28uxmhgFbqPzlxDTmeKjTYl1AwQzSRy3?=
 =?us-ascii?Q?NYgFJeFyh8OK9osyM7+6aXbXRnkrWY59/Gzu88B6A9DoVbL3iG9ySimCVLh9?=
 =?us-ascii?Q?b2LGfg/+K+JKldeGHGRZ5i3KZM7XQd7DUnql7JNGwBOyu0X8czBXOJXd3r91?=
 =?us-ascii?Q?Z2TzKDuN0j8CqdMssngJae18wjWvpAnX4xvNAnUHvt/xg1IpT4MJ1Patd70l?=
 =?us-ascii?Q?+acWP9sirA7N8/jYPp1Ao+GKjuXlBE6D1tZhhngA7E8WOdLzvHIcjknRg5D5?=
 =?us-ascii?Q?9LBUJGpUQbkE/8tXdnntzQJqFCM49ZQu02Xw808sUbk9gfFM0JgZPlYeeDHq?=
 =?us-ascii?Q?WNKLlC4dFGyzWwr0v19zMJHMNc2jI2R+qL0sCWIcM2eSXKTX/eCOygAUb5cA?=
 =?us-ascii?Q?WC3SUTOR27w7UfVTbciUREakXtEJfX9zWxnVRlBN0cNzdE5X2Tpo8SXZKHLR?=
 =?us-ascii?Q?8iYmikjl9bCUpJB9H6zM7LBo+UlDaEqzc297rL2aw3QfWhfS1UhR1wJxI6Sl?=
 =?us-ascii?Q?jvqwn0leKXPtbv9YlU/JEqy1P6b5K5UzTPA572ypvS/m2vtpiC+pM30OBSoQ?=
 =?us-ascii?Q?Fpr26kpKQIwkViPPyfg/oK/vPBG1BECEUFNE5gGjQgnmBqavMDKLuKS3Ky6u?=
 =?us-ascii?Q?F2UvA1z52HgGLdklB/dNHXAPKYJN55aL7DEJicMrsWJvfp1ykvClAMyooTVU?=
 =?us-ascii?Q?P/ohO5s3hpVz4DJB/578kg1oTFwv0SPTw++EQIbwqvWlMZeKxR1JN+gb8uj6?=
 =?us-ascii?Q?hgg1r+3Md9ZS5j0xeMhpFeBhYg42rI+AgIXSmkyRchgTAzy2Mbq2XqXkzf1X?=
 =?us-ascii?Q?PuEqvGSJz/dpzRE1sTPPkx3Si101aNoPsRPstHM470TQ7uVjA8rycrWMj3nz?=
 =?us-ascii?Q?hDwzS/Hi51c3jp/GjGaPxfZg4owMOCvJ+KcTFTMCfMNkU/nbvCXA/k2vi1EL?=
 =?us-ascii?Q?wIsQJhNv5H1GkTakTBKGEBpigOTlz81NBV5RvswWHNqvGf5jh6QuAg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4165.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7zqwGVSajZzZSuwiVO69XkBjnROa4IDi6jOtlkQZ3SMaKLcmpmC6NVrL3rCp?=
 =?us-ascii?Q?/JzgG79VABDPSsG5c4NvupG4HOCoXiq6xuGrL/C3ldUZ2FsTOw2eV2LxazS2?=
 =?us-ascii?Q?gR8bCHqjy4bu5bOG31XWgzZqkARHFaK8aNVddLkv8AZS/NB5j5CDGEmWX06M?=
 =?us-ascii?Q?MUiZ5pn3MssXCRdjxrslQUrqzuyPORvfmD/82FJiPUG5YFvub0F4wjrJJWui?=
 =?us-ascii?Q?MQaKeLcNubHEXMbfpFTxg5slxJDYXJYDYOXzLlHOS9GEQdQh4EXh/Jhu5rma?=
 =?us-ascii?Q?LKH4LGBiw+QcdE3B5yGPFMouBj+ZaN5rISjE87klDrF93AmblfcmlVGpXUGg?=
 =?us-ascii?Q?VQxvwtT/uGS0uLnzuQCo9L/62/XO9t+TtLaQrHTX6BXipfcgpypN3RgL+wDV?=
 =?us-ascii?Q?lYvJVBJwl/MijvoXmB3aFWNcdsx3uOvSkURAZ+F4oiJZY5f+I1WKHvQ9akzj?=
 =?us-ascii?Q?f9tdsTqTWDggH2yMPFu5acF+Id+KqtjU9yaKUuYKa1zD9+yE1dMA3ALOiUG7?=
 =?us-ascii?Q?Rh6M7MlaAMtIN220yP5FgCVqPrjDfY4YVw0VFkVvx7OJRI7eyEmrQU9y+ml5?=
 =?us-ascii?Q?KkgSY8UIa2aOaHrMFozVTHd0eWudTdMUeGF37mAheTsfbWVDmgldiU77eue/?=
 =?us-ascii?Q?TMfYa8TAvMUujcy4LedjCKYY52y4KkvZbeneoC6WxnYnxtDcyVmd9NIj8PEO?=
 =?us-ascii?Q?tQ1wa84w+BOxu1OZsvuEvreNRJAwM0lkPhqO1V9LT507BHASUPDIyBr6hODD?=
 =?us-ascii?Q?UbE8+mtDCcHv5ToMA8hheSEDuus72sohTliTimWcfZ5/gXGms+63bwe9c3hn?=
 =?us-ascii?Q?bq/uMs7Oi/nsa6edG6aDKVZfbLSpIdU/a04ThXsaIc1tQdPVqThZXyZfQv5/?=
 =?us-ascii?Q?te7x8Gl8foNbyeSZg+SGQ1VkFfAT4LR2DzC5W6wdf1BqNNRCfJaEeesL3eSL?=
 =?us-ascii?Q?FtwVHuaSsXkuqsfZQpoVB7FnTbmhEibKjiS9o0EGtxtBGE+u2kkIbPgTB+Bz?=
 =?us-ascii?Q?nR3Ln0m5ulJqmJr9K/79y8QEmk8VYMAqwF1MldWmMrGedg5KmiDKPpR0/L+c?=
 =?us-ascii?Q?KkXXx7aacDy0XcLmScLJzvcMHkGFp+EqnciQXH2P6Nib+npQ1fNv5ppsd0Fb?=
 =?us-ascii?Q?U+fh3WQZJBWFkOmpa7iH2k0sPQ3jDci1utmBl/iqQYA2RlUsmRo7rIKYYyj9?=
 =?us-ascii?Q?q/NEy9KGROBI4dM1QhCNXtQaXs1klMnRcf6SdOtSYdSv5rrvPJ855HtpechQ?=
 =?us-ascii?Q?cmGgmgE/LchcCEASAREVkQ6r6/amqB0ZbiZN+g+qzokOje/K63uKNJ1Q2ddK?=
 =?us-ascii?Q?7r49L3DFfZ9oCqDagQYneaYHslANFbi+g6cBaLS6kjB8u1TfiEJB6NQjiXZZ?=
 =?us-ascii?Q?O9g+2fjWBTXozDQ7zvnsq1ASnxsRUljAFBTL9l4HwjJupL6HzSkz4AmxbNFR?=
 =?us-ascii?Q?7f0TJtvajXBNagK0ZMmkGOl/i7JMKXZWVfwojvauJBfihqsblQ/OqJJLH/lV?=
 =?us-ascii?Q?KqmJ6fu/iiFKZM4FGakRw0j7vOUXAFaMKXRv9sCcGzZYgMjo1FNNjgQVv0Zk?=
 =?us-ascii?Q?pY093dpC/y3p+Dx8qk8EO/9CSJaaWvLptHJFzBfQoeWg/C1uOya/951ez9pO?=
 =?us-ascii?Q?hQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2935cd6c-b2cc-4c13-a137-08de26504abd
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4165.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 03:12:22.7798
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kSx1nhqNq/WVhvu1rIQMAreJmZpDfp9prMTyh71n82O5CjV9Gl6MEoRTlItGauazp2jHk+Rjl4rcERUKA/l/Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9153
X-OriginatorOrg: intel.com

--oDo9PVDlm2ULCsE1
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git aspeed/arm/dt
head:   f5f4511ccb747e01ed5364e9eec7be8b62020c4b
commit: f4c7b62be298662cbeb329c7914642b17ee938ce [2/20] ARM: dts: aspeed: yosemite4: allocate ramoops for kernel panic
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

CHECK:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email comments mismatch: 'From: Zane Li <Zane_Li@wiwynn.com>' != 'Signed-off-by: Zane Li <zane_li@wiwynn.com>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--oDo9PVDlm2ULCsE1
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g f4c7b62be298662cbeb329c7914642b17ee938ce

--oDo9PVDlm2ULCsE1--
