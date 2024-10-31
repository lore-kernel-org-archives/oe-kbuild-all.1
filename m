Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B0879CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Oct 2024 01:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730336580; cv=fail; b=CXV2wUS0sDRf1inqooUGxJlj0L+M34aVIs9wdEuYMSvTpllGNS59iTxHJSGGvJUjWqzAJQloTAtXbOvcgkCRys8R4SD++BcstH4zpvEjYViaRHh98sCD+SZUQGhGEPQeHrURbj9x0j1mwQKzP85gfcgOL/MaF0gF3zx03qwZDLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730336580; c=relaxed/simple;
	bh=dEHTORdELsTDAVIvRvgu7w0XffEGjb3dNCY693f5Mts=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=R8vqcm2jVJnSElf7m028nKIvSEjs3O5GQvtiEKbWlmDB6e+bZDWQ4G4sRkIh8MoNMnXpXk0JTUvKkYvptIh6bGs/SFYZY662q664YjVMA1gRin4u/Y2LsesAgqXlYTkpLKlQ+iLwbqtwfSVq/4EHvTOCWcguwucrg/9Jrl3uEIE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mmFHB0v9; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mmFHB0v9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730336577; x=1761872577;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dEHTORdELsTDAVIvRvgu7w0XffEGjb3dNCY693f5Mts=;
  b=mmFHB0v9ktcMv8RDBKnhYz5W93gi+I8Qbce2mUqM/D9Wt0YdARUi9nKB
   JJ2gImDvKrdcYnxOPeJjvhiLSsxhfL47t6eL0RZMhQ9zHr+MDUiPsSo/q
   7jWMuzifK8d9yoMz9B5OcUNufIdvPXQgim1bUpuy6JviSsXTIX8WXY6TP
   UG/YpHlB1lIMhEru7gHZFnAoFBD5dBdLsWVlmWyM/o3bk5XqLzsVZi2QU
   ECFfd3GrxvSKUX8WevEZ1Z8PbccuX6IKHTNBq527M74SQj1WURJOCkvag
   SH+yqm7HbWQli2ixCpRkKKiL99xmbsTkXIkLU/AYIygYh2d4i4UGHgsTP
   A==;
X-CSE-ConnectionGUID: jOo3VCTkRsmtshbasb9ZHA==
X-CSE-MsgGUID: cnUvZv5+SAO3r978tmZaFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="33988731"
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="33988731"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 18:02:57 -0700
X-CSE-ConnectionGUID: V7tJ82ywRnSJm0/A0BfJBA==
X-CSE-MsgGUID: /n8LtaXzTJiYVvVXX3xRmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,246,1725346800"; 
   d="scan'208";a="87623580"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2024 18:02:57 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 30 Oct 2024 18:02:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 30 Oct 2024 18:02:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 30 Oct 2024 18:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plFTQtS03QdHV1znXtdlY1P9FpZEzrgLenbFmFmWcN5mT29JoEkY8MS78F0pHW6keLBqs+vgnmm6jh3ENoHdCYlY1BNHfwbXBjmJQiW7nk1VdYxgVr2x+03KNiYrfkQ5eUAxCESvPtJloTrgVLRUWsnea/xxVDkdw0H4Y8idZ/G2vVDqTrKfZoCRRkPOzG/nmCEAvef5Iz0b4WspBYujKt2QujwPhIVQMLuOPz+CvVm38QBAfhLwdOPlA8q53Ky4+9CXnKOpYjK0P9i63ce82xeTV9fjQ1yNEianG1mnSlN9aaCF2dIl4OWWZAjJj7gcZSZnMt5WcTAMRtfswJr3SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=77HsNZ03kqH89VpKZMsCUlwGZWOGj2axJeI2RMDTAbw=;
 b=AHyNRNxJ2X3EHmb/DZCeLqBuME5AuH8n8yIwcRQo55Crzx6wgZ89T07TVSbdZcccQa61D5k5Zf1+6Jx4AZG1dT5GBj7lRgQ/3ENIyyQYAi2pK1MiQKs+u9pKRciihZlzrep9ByV9ApYCUlZsu5fXKCQGIGVl7+AgvM559SpTRUAQ2MQQ+xBoA4l4mSYsDtLVDerjd1WtBRtV8D4KjC3LocBubPMzAqgifO4X1O2JmUWEj31T1qVIZ7arRl5z4p7IolXwXkDogoIUE/k8/YvyADk2MjZmugUb/cRG+ULvKT6Ng8MbsvwC/EtVbrRKeBNUwKrKUMc+lGq34mjBccufgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH0PR11MB4791.namprd11.prod.outlook.com (2603:10b6:510:43::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 01:02:52 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8114.015; Thu, 31 Oct 2024
 01:02:52 +0000
Date: Thu, 31 Oct 2024 09:02:44 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 13256/23113]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <ZyLXNGRgSRO4BdQ7@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH0PR11MB4791:EE_
X-MS-Office365-Filtering-Correlation-Id: 14287c47-73de-43b5-5106-08dcf947be65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N/scUWIjDHEkYUFS+rjZRm+hhZj6kYFfyREjmXnYJcuJs18DAWuAiNK5iWGS?=
 =?us-ascii?Q?n+ji1ku70dNtxDTLo98Sl4p8uEsJ54+Uodckx5bf0iAAZkbKMA2fOeF3SXuT?=
 =?us-ascii?Q?nYA6x7GsM3FKU1u3wlR5bha7nWUcWK4m/KysR5+Mu4U8xmuC8QN5V9iyba0O?=
 =?us-ascii?Q?x3XR5uymCZQB5b/HQsxD3fSVaZVulZNnL1nG9OVsuos0XH5z9EqL357GiTo0?=
 =?us-ascii?Q?Zw1mdG5mI4dTxkNd9HxZ3Y2/oE52YVTkthf/jp+T7AwPOJoAjYg+zg8R+QoZ?=
 =?us-ascii?Q?JQi3cbklZC+X+Pa7NJHfTUt11aQxhbIQBVPvJflRx8jOoeUSWSt6s6qg9dI8?=
 =?us-ascii?Q?/8J3mPCpTWDJrQskxZVBG9qWkPSneHeSlYSarnH7DEM0mUIkRhf6fZ7SCfsJ?=
 =?us-ascii?Q?hOiKd5VbIR5KT13zLvbq/CdTZOcTR07+zJQxhO8gX2BEvT+1/lTq/Fa64yVR?=
 =?us-ascii?Q?kPwWncGYTLK0aHe+iqDChuKtthO4pCtJxuXowaEE3Cc7ks7Ks+n9Q++R7oLj?=
 =?us-ascii?Q?hDJtDgmbrg6zUxwEQq4ZioFF+SKAi6YuTDQe14s183C4yXH0Gx0Ql8jV8kcg?=
 =?us-ascii?Q?47/xhVk9rNPtmxPvNua0uwg3gfYfqjY/BUN92v9FZFER77SSR5EiX7WZy5fi?=
 =?us-ascii?Q?bWEHFe4z1uJhTHALf4WRZdxx0X4abjRUVeMNX1qKPexA9Spff24S//tKHWGB?=
 =?us-ascii?Q?MPsp0H7qd78W3l96cbBPjkXvwjRRHwcWorraP96gxSM87s65eOEKiegrFLai?=
 =?us-ascii?Q?us5gRnxREGAub13XYYhcMjnmaXNVbWJCFypSKZ2JnWypwwH2pJg4KEjpYo6L?=
 =?us-ascii?Q?W9tb4LEfrzkziFHshM0VQ6xlQKSQfoe4wH+TgORadjmjivf9Nc733jYbW4Hf?=
 =?us-ascii?Q?B/U7cR7J9cxC8CunNuUvFmT+8Oa3G5tznruiAyGYVqrogr7G9ZydfPqg2TRj?=
 =?us-ascii?Q?Q8kCNz3xP6Rpvd21m93/XVDR8tyeNq0TZmU5zLYc+ErIOex4KEwoenPl3I1T?=
 =?us-ascii?Q?3583OlpvjXLx1jeeaF2i9a4viMc9zxOeo78T79vr+lxPOaVun4Y4kmAgn74i?=
 =?us-ascii?Q?jG+hsbgaAgSwAnujtK+XNNnlnbk3w3RM2VEYpBCZgeHfcL0kg1HLtjARzLG6?=
 =?us-ascii?Q?hQ1N6e78AjQs/UFpMxgbKaWW64WZztDLlA6NmGz2wly3ydiZX0gVgOE0B8lC?=
 =?us-ascii?Q?fKVwQHvmctneIzE8YbiDWmw4Wf3F8p4NilW9HQ/dBU6EZIDX2S8r6M8ew1QB?=
 =?us-ascii?Q?OWeTnQTbSMlF+N3k3mYpFHhj8/d5aJzhmJjz5pgsRQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0VqhY6vGetjRt0wNClD+cWW6c56GDUuRIolWo1rsWaMgp+o0TIiSSurEIPTt?=
 =?us-ascii?Q?X6jKO+jzT9DtE5hz4DwNzG/D3vqrgq3hUKnrEh8b53921h05V09fCYXpk02+?=
 =?us-ascii?Q?A3AM17OMzMlR01DWxNM/er/Zl4dC4kbyG+r55T/WWSB3wHnPJxsrnXg+XLEx?=
 =?us-ascii?Q?RCkJtdFd7uSQUqOtICukajEptKgmcbuh3K8LKlJC/qpLFacTRx3unoqI152P?=
 =?us-ascii?Q?MhpAdSMTjZgVIyNO55Zg1jKibpxkw+I5jgOY++UbhwrEHyX0tU5nPlNhQAS+?=
 =?us-ascii?Q?xqIPOgMt8ML0hXrwwCSdZTdPWTcsKGjH7qYl80shUa3clygraE/c/UJAn2I6?=
 =?us-ascii?Q?f2F/BuHmr5B37CKQa1pXVDFSuL90BJoXONAbAvibBH+r3sQolmoTZWtl0cba?=
 =?us-ascii?Q?9ajiNKPOBkmJ6l52J5BxIQm0qsxbjpQhacSyfGR8TuLZfDOxFzNcz6iHNcVb?=
 =?us-ascii?Q?7ZquqcdyyUv6vCY0vXckP84OUVf5TAqZKa2+qBZvXdA0v8gztZ5T8el1gNnn?=
 =?us-ascii?Q?w8haMu617vGx3SO16qEKm33mInjOcA2WyIzk1OBiK/9Xr/LwplRBdGJfWzfO?=
 =?us-ascii?Q?2F8BBoHAd8m/RwEcv+721KQhyLSLsJh1BeRNqTs6Bpo+CtrzLDfdYb5OW/cO?=
 =?us-ascii?Q?uPPCmxGjo+Ra35zg5kr0TBOqGt3VQPmOB77qywwuBeg75qAUTZQRca6RcUr3?=
 =?us-ascii?Q?2YubARxVuKjjP8IWa4QpX/Y4UJGgHC93hIaDG83iCcBJQqvQO79fFYoZmJyJ?=
 =?us-ascii?Q?tLqhTpN5KUK6hRL6CL4o/7p1xrnCkG5HxkcRosPRv2sHDVK/JMu/FkEVdVLL?=
 =?us-ascii?Q?vwdo/U2Uylw+r7h1zQrdQ8Rtj7/Mj/HOB2lovdtm46tlsF4RMTqPKewUjimS?=
 =?us-ascii?Q?FTxDZap31G5bsHXRbJJMzvRjLlyvTE8D7UYOBAiB8z5V5s3echU71ktZB/JU?=
 =?us-ascii?Q?1for9D2vQRQjceYdzlcJLOUCwodIj4p9Qn7e7XfQOEWTJD1EqWQRiUuWeVvC?=
 =?us-ascii?Q?xLUesI0HOJz6tFct0STwnlJdbBFBTCPqIaGbnYjo2Q/DiZQzjBa41DHbeOsh?=
 =?us-ascii?Q?61q6JqU64w5gLFNdh9jiMhk2kD2TFpLAe2is5vZd8t4yYg4qua5hk3e2faXH?=
 =?us-ascii?Q?so2uWLrLknrY703IOwjFU4yJI0qlsZYQRCiITiubQHuBjPI1qH16xFoXxx75?=
 =?us-ascii?Q?K2Qi9ZuCXrOzJK1ES3CbHtX2ppZs0d+g2nf1fx7TbMpuHScjGNauq3WEDQC8?=
 =?us-ascii?Q?tcqPCiPC+dQHVszfmuvC1bJlM3RA1qSbdjPDbu7lVJ/pH0a6q0TiKfguSJoT?=
 =?us-ascii?Q?Bs2JKa5+GQyVTgw88tsS3J92ixCR/py9H6OOQdfcNSfeT+pKKp2elKRjoiE2?=
 =?us-ascii?Q?tzRD92oblJ4WyuIbyji4nHKzDxr7yPq1TZpLoinWLznmPCB1IVo+TTaOpET7?=
 =?us-ascii?Q?ruCBPhAGqqmHtHveJXmiFqPz0Sq+9GJZpe4r6oiUzLaf+aivgGFl94tA+XCc?=
 =?us-ascii?Q?9W0DBQ1OuqZdNKwGzZcXzVW33JiP9lyg8Kzr8zkGr8+mp/ORrQuX1mbnfv6G?=
 =?us-ascii?Q?t0mh3CgC9GDLRD2uEq9q0w/NUm5uof+1esWm+KnJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14287c47-73de-43b5-5106-08dcf947be65
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 01:02:51.6750
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBQkw9JzM4ITbsdaYFB5G0dp8RF31vNw+8Cnn1pjhw3lDKgO6mJ6yp9VcgPCxblCls3Md+tFp4RVU62i2EAnoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4791
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   493e12c36ca8506b8d553838170e4773d5878b36
commit: 851e91f44acdef60982a319ab23a152db843b98e [13256/23113] CHROMIUM: arm64: dts: mt8183: Add katsu board
:::::: branch date: 12 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310802.FbvkcjH9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241031/202410310802.FbvkcjH9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410310802.FbvkcjH9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (unit_address_vs_reg): /soc/i2c@11008000/sensor_sub: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/sensor_main: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (unit_address_vs_reg): /soc/i2c@11009000/camera_main_af: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts:19.31-30.4: Warning (i2c_bus_reg): /soc/i2c@11007000/touchscreen@5D: I2C bus unit address format error, expected "5d"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:159.25-192.4: Warning (i2c_bus_reg): /soc/i2c@11008000/sensor_sub: I2C bus unit address format error, expected "3d"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:100.27-134.4: Warning (i2c_bus_reg): /soc/i2c@11009000/sensor_main: I2C bus unit address format error, expected "10"
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi:136.33-142.4: Warning (i2c_bus_reg): /soc/i2c@11009000/camera_main_af: I2C bus unit address format error, expected "c"
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1186.21-1196.5: Warning (unique_unit_address_if_enabled): /soc/svs@1100b000: duplicate unit-address (also used in node /soc/thermal@1100b000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1941.28-1945.5: Warning (unique_unit_address_if_enabled): /soc/syscon@16000000: duplicate unit-address (also used in node /soc/vcodec@16000000)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:2055.27-2059.5: Warning (unique_unit_address_if_enabled): /soc/syscon@1a000000: duplicate unit-address (also used in node /soc/camisp@1a000000)
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: compatible: 'oneOf' conditional failed, one must be fixed:
   	['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183'] is too long
   	['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183'] is too short
   	'google,katsu-sku38' is not one of ['mediatek,mt2701-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt2712-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt6580-evbp1']
   	'google,katsu-sku38' is not one of ['prestigio,pmt5008-3g']
   	'google,katsu-sku38' is not one of ['fairphone,fp1', 'mundoreader,bq-aquaris5']
   	'google,katsu-sku38' is not one of ['mediatek,mt6592-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt6755-evb']
   	'google,katsu-sku38' is not one of ['mediatek,mt6765-evb']
--
   	'google,kakadu-rev2-sku22' was expected
   	'google,kodama' was expected
   	'google,willow' was expected
   	'mediatek,mt8365' was expected
   	'mediatek,mt8516' was expected
   	'google,elm-rev6' was expected
   	'google,hana-rev4' was expected
   	'google,spherion-rev1' was expected
   	'google,kakadu' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: failed to match any schema with compatible: ['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /: failed to match any schema with compatible: ['google,katsu-sku38', 'google,katsu', 'mediatek,mt8183']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@c530000: failed to match any schema with compatible: ['mediatek,mt8183-mcucfg', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/interrupt-controller@c530a80: failed to match any schema with compatible: ['mediatek,mt8183-sysirq', 'mediatek,mt6577-sysirq']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc0-pins-default:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-clk:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc0-pins-uhs:pins-ds:mediatek,pull-down-adv: 10 is not one of [0, 1, 2, 3]
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt8183-pinctrl.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pinctrl@10005000: mmc1-pins-default:pins-cmd-dat:mediatek,pull-up-adv: 10 is not one of [0, 1, 2, 3]
--
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: i2c@11009000: Unevaluated properties are not allowed ('camera_main_af', 'sensor_main' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000: failed to match any schema with compatible: ['mediatek,mt8183-audiosys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/audio-controller@11220000/mt8183-afe-pcm: failed to match any schema with compatible: ['mediatek,mt8183-audio']
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_mt6358_ts3a227_rt1015p']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

