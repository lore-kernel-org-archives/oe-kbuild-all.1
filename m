Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36C04430
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 02:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730602073; cv=fail; b=JPGBpydl+XF6rpaffQILXDBPtJBaU7vuwa3y9cC/mjWrT5aveoD9pBkipSKSOxH9WMXGnI3W43wgXF1K6IEgPJfLbYJnJCFGsQ3m72m+H94EhFuyj0uNmjYgRFnfSV1+GAN0UIt86q1cLiFRx2gHa4ygqgU2d297tbfrDr2InE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730602073; c=relaxed/simple;
	bh=WMLH9f2zt74lC+jIyxmctPYV+Vu3/71kFoDlGAsxZRg=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=qhGFNNT5uly07aH8K0yiLo0BdoE6pC/TU6MXJLGtT5IKEeUd7Te6+uwryperJgL75iCCGz2vDGDxBDCeyGNaPe2/Esle4c3COdoDiFGenPjhSUAJ7q5ivnzCZMxBXM9Z9Sa3p7nyWQFrBjh9t+Wglv4GcZC612RFyMjiW9/5IcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kdEolo+Y; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kdEolo+Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730602071; x=1762138071;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMLH9f2zt74lC+jIyxmctPYV+Vu3/71kFoDlGAsxZRg=;
  b=kdEolo+YRRJ70BzEBJ1Z0CywjEqGc1qTNOO1kTP3e3XR4w7E/DF0VGda
   88sLJ4+593xn43ZWzfCb9xYPLCnqKqa+b1GF9J8DyWuYdtPM37Qe0FJRY
   Z01/npemw+0ZwlNreDSok4dn7V6rZPKCyD/IH1ACGj0JKvaMOGO5VQt63
   us2T+ACfSdQMN1APEE6dskoponw6xZSd3RPXDm3hPXfcZCSL2sDYtBEIR
   t85SJvUVVUSR7JWMKkfdlaVhLbXRz4O4MDDLQQQBMbgRSRoPpQKm4X/BM
   S8MWrroKcjxDPmGuzGg4m+VAHhQmFAJe4LanEXL3cR+SInF5wv96x5Ts+
   A==;
X-CSE-ConnectionGUID: uvz+HkNFTnivSSiK4o8ncQ==
X-CSE-MsgGUID: +ZZTeJgZTymANNNqPvzAMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52887897"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52887897"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 19:47:50 -0700
X-CSE-ConnectionGUID: e0A4TIOeRJOEd/QbOezw+g==
X-CSE-MsgGUID: c94cwWK8RjGZ2UfvmdRFWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="84131240"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Nov 2024 19:47:50 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 2 Nov 2024 19:47:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 2 Nov 2024 19:47:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 2 Nov 2024 19:47:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SG2fTwQOmHg76X40r5Gavw+x5oLd7ylFvtsUzQXYVsochMO6yGwt1PsssJL4d/X7OJB7MN9etvD80xlNTdgg6JK42SbGR9ZNeXMOhYNgoxxcXNOIXxZXFq9PM09K/gBcnZa0qYqQcTe0aky8xvowObOfasxyVLijskTy0qp/hA+l0nnocdDSlTdykeytueU15YjqLwyENR4ognpwU+gsBxlqoOWQiyMWCCO4fXdYlCiwmA8yKjVXrUS3BtY2AUfixGFK1PfjQDO03EjP/uvceIZwfzG9bcEft96nnSbUbtQztptP2Jcqp9tNvnnYgUdTetSf1XN0JONAeqsuQDWa3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARPQIbQpLyn6oM/IiamDz1bPByN5Ot5ve6Fo6pgR/ko=;
 b=c8YHdmLjhO3q5ZrOOUBBewCQ5BHBnafr+TrPyCLqWRkQRpM3euwQwYHk9Njz5h4rqD+XsySvku5xaCjttt2jKWELYll772qpcmdBlfnHUFsCVcavI3IpdshysmDeN+msjjhFh9JWVQ3dADYer4Tsyaeb3RqkaIUVsEqLou4/WhsiwOyUzqRlgqzvmUYGP935ia5Z8E9ADOMP/DMMFpdFzaXujM0XB3qUXM2sIafk7S4PXTrOIMv8DkfP2PbSWwKNK0fEVf2MAywALBtRHw6dxTFYOXLtm0eQlFMX9Zk2dBRx9P4P/zlRgCUGJ0Ot03MBd+z2HCHPMOqMfp8du0rKPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA2PR11MB5195.namprd11.prod.outlook.com (2603:10b6:806:11a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Sun, 3 Nov
 2024 02:47:42 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8114.028; Sun, 3 Nov 2024
 02:47:41 +0000
Date: Sun, 3 Nov 2024 10:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android15-6.6-desktop 1/1]
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb:
 /soc/thermal@1100b000: failed to match any schema with compatible:
 ['mediatek,mt8183-thermal']
Message-ID: <ZybkRhQn1QOmYpRQ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA2PR11MB5195:EE_
X-MS-Office365-Filtering-Correlation-Id: 9608fa18-c068-4d66-a725-08dcfbb1e2bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7fAS7Gl0asshWAealpGS3XmE6+xqcAdsIReZIQP0aKwYyRXXDYzXYdKPCwU5?=
 =?us-ascii?Q?R8vSqjw9yRklXi/xpglQwcfc1fph2nwUvM2/VhiTTHxVfinqzNn1gdJcfiCt?=
 =?us-ascii?Q?tRcbaH/yuPylC3A0ESmyUMeSFlyYsAP5xAEdK++HNaiDC36WAu3h/InWQuf8?=
 =?us-ascii?Q?WIbZLUalVyZg1gY9sHMT5MfAOhw3WMBzABCAsU4n+ThUBarZJ1WCQcO5gs4+?=
 =?us-ascii?Q?ivWUqLd2rRC+pV4aEU46V9wd6hAv7yC3iXp8gBxGAkjLO9tHzAXetSxxAGBj?=
 =?us-ascii?Q?kdF+HNGXhpAxVC2OVjhehjGOu4AkO3Iq/q7mHk9/0D9/+zv6IeQrxqhbs2fP?=
 =?us-ascii?Q?aHehrVlxQ948WzS1PCpFjZvy26KV08sL0JMxKW17StF3xpJqL0PkBhvaABhw?=
 =?us-ascii?Q?yevrxlDrYZq5EERpdUwe7GQgRqYPlsHbeZzSTMNuNKgvqycpp26T8APoYbd0?=
 =?us-ascii?Q?U6O5COWJ8zzKV9giarMilDhH+qUqwg4J37Lky3vYsSYLTK8BVBQPLAMDFjCL?=
 =?us-ascii?Q?C1y2CRkhgAq0A3QBv33+k0JQMoD1jW5V9dJ8kHwPK61Hnoiq+GAjzUOkpICM?=
 =?us-ascii?Q?BeEnNO3U4etEVhyENilHW7y6bpfcsLJmrYDSHkb4LsCbk9w2dWXYdcvD8v+C?=
 =?us-ascii?Q?EI6s3gTEFCWVWGhZ+VdKvUtY1NGOE74avK2zNjgFmHBF3+iB5ywAQY6W74Ma?=
 =?us-ascii?Q?Y1dAg7CxfmpnhF1yITj8TQdNiF+QhhV4wQJgt3WFwwZ37skQwCvp4GBwHykN?=
 =?us-ascii?Q?z1VBBEHIjwZcpFAHITV1LwkwiYUPYIoVk4Qcf4tNLj90Q0+QuDOO0W6UFXeU?=
 =?us-ascii?Q?/Cy9VMkt2ZHukxRP9tFLaHR+igoXio7s4InHEKIYp7d8DWAjHpQQAfwMPwDs?=
 =?us-ascii?Q?1LgNuV+cUkI/l/LpQ+yGKVBqPr4XLGFR3D4DF1FHeOTL7rDq+ctdpkfkX1wX?=
 =?us-ascii?Q?CxQ6RXtvd1Jhpjf5/uhDq5k6SLtIqsBaegD7FNFNbNCTwSxh7Z+SZQRJw9n9?=
 =?us-ascii?Q?XPbox9tYwCGO9wKVW4LutJscufk/FCmBu7zCeSYX5gKHiJjc2PKMgeMsFsiR?=
 =?us-ascii?Q?3eXIkUsYHD/PoKC/1GaOJEHTaC8VdToySX8al4Z1Wsresi9XqvS6U7qDo/xc?=
 =?us-ascii?Q?Mb4v92phT07O30RfJ/1gTiZbA59lcQHq2sVOfU1OMp8HWKSfgEBetmDYbiZp?=
 =?us-ascii?Q?vm9uX0r5dsB7dPYwqO2fsnE8fniBx3+Mxj9bOmvo7SV+lwtk8jDfMgeoRFq5?=
 =?us-ascii?Q?vhYnm0E+kLRmfGZAx/Ab+5jUUjFJQkKrAd+KFktyNpVu8C49ArBUPkp3qsv2?=
 =?us-ascii?Q?BThyRQUPhOu133RWFFr0m0zH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AikTrqqYEF4LZsu9OmEamVSIWCPGCLhuuccBmJcsoR8oYdoTUWOo8SVuCw+0?=
 =?us-ascii?Q?Fa+f4DfmSh854lEZvB28YWgEfHh8HxYC5jWDV2gz5jTQrJhqyqKtXTiMNxOc?=
 =?us-ascii?Q?23R35JnulSYOrzpfKOQ+u5c1TAuiE9gvfM10FOKQCXyVLBOcYbDTKDDLphv3?=
 =?us-ascii?Q?h9CF2ilXSlWypt5MLvXpOT2yNT4EHCPlvEgQY17JPwMhIOKsZqxdzlk1+UBp?=
 =?us-ascii?Q?WoDKhGzlZIpz4QBUh76f/qlq3knldhl10wn5hPcOiL7oodlRc+PH/JCiWUE9?=
 =?us-ascii?Q?v+V6Y2NCKKPDcsJ2gj8uchSnkYNlgOi5wCKtQnajD9btkX4KFSOv3h04qvwD?=
 =?us-ascii?Q?JUzcspGhR4+K0WP6vk59CUVin1BVsRmA7N14/ZbMTVMuTQ5Bfp02VQmgyjc7?=
 =?us-ascii?Q?WfF/biILNRCNr3+BfJTPVAnOLSJ9QvCbXRfNs0Jtf3lDq+0MQ42Za62KKpGC?=
 =?us-ascii?Q?edHKaqWwXTSOtdhDeGmejjHNvJ01TBvI6VWCGzrtpOgjYBz55Xykv/tO7OUd?=
 =?us-ascii?Q?D5qwj790lMLxMn8QuI4lQJq9wF9aQ/PQsVlMgeetpoobV9sZrgN0dXOuxLDe?=
 =?us-ascii?Q?4DIORWnbfLHBJjtbebOPQWqzH3pOvPrzgWCC1lJf2EqnFacIjttJcJnEmWyi?=
 =?us-ascii?Q?o4EFZW8FLZDq5qFwSZ0O4zXVdMb/wXWqGRZAIfXm5maMSf4vDHUDNZ6Wnnm0?=
 =?us-ascii?Q?Hwc1IGpukziCPF+2EWS/CcDoIPKO2Jhhble1v8fiE4QIjeVWIER8KAt+NCSa?=
 =?us-ascii?Q?UB4i5k08mxpcB0oVnxiVg3T8TOFJegs6hZ+Tp8ZeCQWFvXqV/KsV7vS/EIZI?=
 =?us-ascii?Q?sEWskdVfSavD94chbdnGig/kkJf1ECjS2gX7n+HuHkX8Y1+RNvB17D7Fjojg?=
 =?us-ascii?Q?F/akZsJK+RWuJb4s6P9c34S5qUEOrvvn5ZGwf8ctRFkCZw3JrWPIVLl4m04J?=
 =?us-ascii?Q?rvf4xl5A1VLWTy/GKqWh3T5u2/3XqTsF/42PrTZ/KVN8+mYuBOP/kZEneDbd?=
 =?us-ascii?Q?TJMlfkh7NlFWAQTIOXjTpP06yNioBy4cLzW57UCnKFHn/yQ5amwqXn1LHajN?=
 =?us-ascii?Q?IFApLQrFf7tdi0XpF3VfBHyRa4gzwinKw8inzHiesmXKD6U3kmNe/vZSy1c4?=
 =?us-ascii?Q?dXsUncWaZoubWc6cDDrOgDD77emgbnWTJ3G+RME00pBMH16MZQDPKJfA2Vrp?=
 =?us-ascii?Q?lhwoLPawpk+lY5pvJLw/6C5bhZkd2AvZqQiFhMLH6SzUcQw3iAuTROfHPJqM?=
 =?us-ascii?Q?GoF61N0AKdqsFr6VxZN+j+FgN1pKmIzOYFM+dleFQv7JPUONX8eI2YBlsoIA?=
 =?us-ascii?Q?wzE1BBHz3vM04V+ZXSNv1+gyPpBJ2m5RXon6Mcp3Sm33bdq8zmvzIZqrSFeg?=
 =?us-ascii?Q?EdBEwKNakOokjzSFpU5Bcyk2Dj7E1Q+v2Y7xQj1rvRtwCJFzg8niRuo0eXKZ?=
 =?us-ascii?Q?lN6oHPWTjcEpOUFjRiLCGZJvllXn1YdwrpOMqJI/UZyZT9emcnkT37LRhCWM?=
 =?us-ascii?Q?CT5lFUaCj/LvIOxGf+yO2TXB4mvvDCzH22HyVIcwXAYnp6Tcen4aLOpyJBOK?=
 =?us-ascii?Q?OERStEbjd/Y8j1c40rdN58nBaOz1+hzeEskzZ/Qf?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9608fa18-c068-4d66-a725-08dcfbb1e2bc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2024 02:47:41.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+pVspz/fykkg+5f9yQHGehWBttGShmgp0kAYf9QKiB2G7lITXK7LndJMjEPIxUq0E0uoe6n99YWwweH395t4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5195
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   81bd1eb3862e37f2ce6e1148ed51ac214ab5c007
commit: 5abed9956efbf9235c9353d0d170b68791b2c11d [1/1] CHROMIUM: arm64: dts: mt8183: Add kakadu rev1
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: arm64-randconfig-051-20241030 (https://download.01.org/0day-ci/archive/20241103/202411030116.wxqCp6se-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411030116.wxqCp6se-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411030116.wxqCp6se-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/media/i2c/ovti,ov02a10.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: i2c@11009000: Unevaluated properties are not allowed ('camera_main_af', 'sensor_main' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mt65xx.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: clocks: [[19, 4], [19, 100]] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: clock-names: ['xvclk', 'freq_mux'] is too long
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: sensor_main: 'lens-focus' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/i2c/ov8856.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/spi@1100a000/cr50@0: failed to match any schema with compatible: ['google,cr50']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/thermal@1100b000: failed to match any schema with compatible: ['mediatek,mt8183-thermal']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: pwm@1100e000: 'power-domains' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pwm/mediatek,pwm-disp.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: interrupts: [[152, 8], [152, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: 'ports' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: it6505dptx@5c: 'hpd-gpios', 'no-laneswap', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: da7219@1a: interrupts: [[165, 8], [165, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/dialog,da7219.yaml#
--
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dsi@14014000: Unevaluated properties are not allowed ('ports' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dsi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dpi@14015000: pinctrl-names:0: 'default' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dpi@14015000: pinctrl-names:1: 'sleep' was expected
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: dpi@14015000: Additional properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,dpi.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: mdp3-ccorr@1401c000: 'mediatek,mdp3-id' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek-mdp3.yaml#
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@15020000: failed to match any schema with compatible: ['mediatek,mt8183-imgsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/dip@15022000: failed to match any schema with compatible: ['mediatek,mt8183-dip']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/fd@1502b000: failed to match any schema with compatible: ['mediatek,mt8183-fd']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@16000000: failed to match any schema with compatible: ['mediatek,mt8183-vdecsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@16000000: reg: [[0, 369098752, 0, 4096], [0, 369229824, 0, 4096], [0, 369233920, 0, 2048], [0, 369235968, 0, 2048], [0, 369238016, 0, 4096], [0, 369242112, 0, 4096], [0, 369246208, 0, 4096], [0, 369250304, 0, 4096], [0, 369256448, 0, 2048], [0, 369258496, 0, 2048], [0, 369260544, 0, 2048], [0, 369263616, 0, 1024]] is too long
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@16000000: 'mediatek,vdecsys' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@16000000: clock-names:0: 'vdec' was expected
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-decoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@16000000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
--
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: vcodec@17020000: 'mediatek,larb' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,vcodec-encoder.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19000000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_conn', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19010000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_adl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19180000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core0', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@19280000: failed to match any schema with compatible: ['mediatek,mt8183-ipu_core1', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/syscon@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/camisp@1a000000: failed to match any schema with compatible: ['mediatek,mt8183-camisp']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /soc/seninf@1a040000: failed to match any schema with compatible: ['mediatek,mt8183-seninf']
>> arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: thermal-zones: 'tboard1', 'tboard2', 'tzts1', 'tzts2', 'tzts3', 'tzts4', 'tzts5', 'tztsABB' do not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,12}-thermal$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: /mt8183-sound: failed to match any schema with compatible: ['mediatek,mt8183_da7219_rt1015']
   arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu-rev1.dtb: bt-sco: '#sound-dai-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/linux,bt-sco.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

