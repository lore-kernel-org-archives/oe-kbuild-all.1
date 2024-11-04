Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF776469D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 Nov 2024 14:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730731877; cv=fail; b=tpu4MbvcCeqd8JAQj8ZgsaOKLUtTS+VLzbs5vAdNAubgiNtf1Y0JCpsxLF9Jrr6ZvLMUQ1whOCpv9LNasQJTIx/sc2dpBI+vCvxcoFuTtvLAbfNY6AleEHlYpYA30tZ/qYkSavhFQQ9e0E8KYSKlgUnznkbCb8w0gYYZ2b76J2Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730731877; c=relaxed/simple;
	bh=YmFMpgtmhtX8RLMQe01WIXVh5gW5K31fI84Tb41VATc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Nh60h9MmWsrphvG3bzgIMlQsk+Ef+9zELPqwRhlDVeA+vR4VQQMyUJqMLHD4JiTZ6hv44DX1Mi7Duq2M1OdkKj5G01VVATG7MmEoE1jCewJR0wVjqccaZygF052Ukr20+czr3eVG9jmc1cDTQOTudMT7WWLxC3eTdioLvfIIl6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSqqI9jW; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSqqI9jW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730731876; x=1762267876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YmFMpgtmhtX8RLMQe01WIXVh5gW5K31fI84Tb41VATc=;
  b=LSqqI9jWlQvHbsP++iddqBOjBV7HqkOzsXEksLcVrsIHkZO8alpeF0mZ
   IoA9aewOdc0coocirH10iTJ6UfuRwxDxdlkbbCZ7wke+Ac8agc5Vn4gvj
   nEx9bLuTePFpX5aCCp2KEi0XX1NWBpM+XQfwJV7YtLDO2xcG407m09XZX
   nNbD9lAnELgi3enyZpaoKUoa2tGRjk0MBu3zw6ck249ZajxqXdDI18ED+
   SFYtcoyaaVfCZIrX4XGKvTXYitg0hiN/zpx+whNtEKIxibFQ0gm03TPcP
   KFZbvS0Yxu55IUFHp7RswA56b3JNbqE6GoUcNktY4A/PyGTeDwEPmKsmw
   Q==;
X-CSE-ConnectionGUID: UrEZt+kfSsSsJ3TB0qkCYA==
X-CSE-MsgGUID: sEOD5Bz9QYaov9FTC6PtaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="55832647"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="55832647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 06:51:14 -0800
X-CSE-ConnectionGUID: brSmF+l4R6KRVbB+YVdHXQ==
X-CSE-MsgGUID: SXMju/cqS6GOh92B/LVf+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; 
   d="scan'208";a="83357134"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 Nov 2024 06:51:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 06:51:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 06:51:14 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 06:51:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yxyxEYNmmLdW5oLv2LBiR+E0SDEJKaRitQ8vxttmPdzAdYOb0b2J4e26nI0A9dbszzku/V7cFm66Wd/C0i4W47ov8WKbMwYTQRX8qUFumX/dJFx2x806oM8UoXg3n8hSIdIbgMAziw5AKXaZsAHGOETWqdMDGAEQv7Uh3ddbqMUNZC5LJXmy40V4EX++XYdykZQKeXv5bfvSanCgNtFq7USg9Led5NnG4z5CcGoO/X1vlPklgFICcPc2jdqixEOCQKp8IC38/+oeJLvXtkcCo5y8DdEBHUSWdDVCw7l9VSmMGH7eMIK3eEakQ4JRIMcnFDytg5foSRfF2LrX+wsC1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdgB8l0soDmWn0ks8L5HNfFNhLA8ffmDTLPRxgHqrQw=;
 b=lVpkJFMMMe9x8aWF4Iv9eOxqBK8NZZ6LJsgfI4a+y0S7vESdL4FHrq1ngqYFfdTRGCyyE/XUq/cpF2R47/I0MkPm7b4AHL/FRBUPs/R0KOaUiiziNtSABPjYhCobNEUyQECSu9TFB9dS9H1pdiGSkvboA+BYQORGMlJZBBDXUN6QXqlnTvNytCAb5gZCWIlgdF6v0fh4HDpXkYiyVe1YHAKQLxC09XcP6tTBvgPuwoL+HF7wgC7K7ht2TKc690GpmvaM0Bjns7/uMcfn+yFPoTg35CMJ/eBhTFlU0x8RTkcdQyTraCAm5U6oUcYy+aX6fwePIyOF46L71FI3L6LwLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SA3PR11MB7534.namprd11.prod.outlook.com (2603:10b6:806:305::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 14:51:11 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 14:51:11 +0000
Date: Mon, 4 Nov 2024 22:51:03 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>, Zeng Heng <zengheng4@huawei.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-6.6 1360/1360]
 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error]
 string value is redundantly quoted with any quotes (quoted-strings)
Message-ID: <ZyjfV/HqAFZ74k/r@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SA3PR11MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d1fd280-47f6-47b5-c801-08dcfce01f71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zug88M0j3N0QKbV0qOleQyGh1vIMht7/dmysbvwNiP/hMtPVsVd803qCMrZ7?=
 =?us-ascii?Q?/OOp2Uzn/lHioxEY4gNOCw0hxqOJinxFW0099PebTkPiTYQxh92NucPuAahw?=
 =?us-ascii?Q?LN0BoAmlcbhD4zy0EN5kYbjbn8hQFuu48YxYMWpQgkBVL9NaB3IrxRcRpCLb?=
 =?us-ascii?Q?ANCYda1bPNQi8MWehnbnj1cWZ79PP88C1KabPobBHX2AKLiVsVDFMufH0kY3?=
 =?us-ascii?Q?xRzv/Uj3BZU67Ii+yR5bxIo7wql+U61lKSiaUEPzlRov0D8BBvioiNkzZW+r?=
 =?us-ascii?Q?OkXIniGe3Qahx1Abfj/Jsiilsnm7OP3xcxcww56MFoo9ne76s2CaN0O27DW1?=
 =?us-ascii?Q?8rCQ5jE2gE93eXXwWmAyHcSe7xvYu0WCVshMyuSbrb2UBKXHc8egdSQE1rR3?=
 =?us-ascii?Q?WULxB/oHuy6k+SxslxamiDBLcVRJg1H8DfN/3FuMNjp+s64ZydrpZHgefI8j?=
 =?us-ascii?Q?9CKCWSuuYQSK5OxfCaMdI0u3TaY5fg/iWPIU55I+PVPk1h/AUa2bDPVx6B9I?=
 =?us-ascii?Q?OY7bp0MHRfgF7fyD9pCQeJXJgZoguAjmJ+nGZjEslsGq/4S9fcTRsLd+M3nX?=
 =?us-ascii?Q?eU38tgebG1mzGuQigp91eTGsksx5BsyndeDFyfNB0d8ToCU2Gnf6uB/LxZkk?=
 =?us-ascii?Q?Uu3i0CUjKWFjNFg7Tbmk283cMYUh6gOjmbkkaEl8gxHw3BOxYUouCz5X7ljL?=
 =?us-ascii?Q?go4RJXUFch42ONxETZcyjCUqe+08vwsadmxXd/5N75cSi6O+IouPb6/9pOLm?=
 =?us-ascii?Q?uJowm1s+9FuUqcQXPnBfFW8oDGpVvCI9wR4ZfktKJY5trRfFzurCWmYVh0gX?=
 =?us-ascii?Q?q9miMMwRdkJE9prznOhCxvtVV0tVxkrhhJL0Z63/+aVtC3pafq/VWu+hXu1r?=
 =?us-ascii?Q?bTO/FE+CDalHE2iFMXZoZVTOPxYAfZoENh5412VZ/vuNOq2650MbO+x7edIe?=
 =?us-ascii?Q?Y0Ew7tZ0LRsd7R7Ep9eGSwU0jp5NcTeNIUNFUooEQpMW0Oed9Gd2Xk8mQV7s?=
 =?us-ascii?Q?WdcrIk2gB+OgXDZg+rG2CNXU9OajgZyj7DhauTUPpYEjQdQDZmupaTSQKCRI?=
 =?us-ascii?Q?MOWLokR/MlpcsdhaMUCOV/VLgtFNrGFPAm4JOEwRjOx84DvzQFNI943r6ze6?=
 =?us-ascii?Q?KOzPhkm1ZXElPWN5oYUkwHa8vbmzuUsHWoI288VgcvOz9rbjswgUIpqAJ1K3?=
 =?us-ascii?Q?VYNvUzyA5mOjng/t1akEnotvHzCmo0V9R5fH50fbmPwUfORTrdXKDkIrVg8J?=
 =?us-ascii?Q?tcw4/7fU9A4UuU2e+39cnUeKp6aXL7SRa8d0ETBABQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z3rB0uW4B2BT8SN1o6p13rLDe8wKCC2ERU6LhQ3U7CCIRAsEnHfgXkw8xJHH?=
 =?us-ascii?Q?/aC0QWlPK8VGu+c96tqdTAEshZ4G1JHhcnymA9M2sK3q9aoK+PipwSewUklQ?=
 =?us-ascii?Q?oYyTopx963eSW6pFT6XxIBbEnLTY4ZFVZXekvAKReNdtfQQ/AMTmPBWNvgyH?=
 =?us-ascii?Q?ujUHSbZZvckIwQg/LuK1/jj9aJep708l84CYeS+vWn+kuU6NZKUqA3PdQiBK?=
 =?us-ascii?Q?CLX6g7mSZpzwKoSOncoFxb+upMDwws15vXn1od6wtn7k+SggxJkS/ouUR31/?=
 =?us-ascii?Q?7GcY4s9V0i8K3KmToBlJHJwoXRVI/777m8mPvDz0qStcd31TgrRjtjaeRGAo?=
 =?us-ascii?Q?29yJYV9LOxFr2qWonUyzWUk6UsQvs0thMo9i7GhVFTCy6wpDL9N9PIFiGope?=
 =?us-ascii?Q?gmP5o/O3p3ju+a5oGnIJAgGv/Q0xqvyn3WoNLH1uOeFxYaRgQJaL2VLkVmxz?=
 =?us-ascii?Q?VHnLV0DgekXqHSH0FNl8fTARFppT+CpTZqEIWJIS8n/n5grYw1/0Y90tict/?=
 =?us-ascii?Q?k8aqeOSgpx2f91o5a35jAwGl83XzH5gNPgWOcMNXQsfo4otgoKV0HvzCSP3f?=
 =?us-ascii?Q?uUxlr+GMajSr7Z53rory9pi5qnD1rWklKPRg4d91WYIY/EE1MygHgzmN/vsH?=
 =?us-ascii?Q?pYACVmqZk4JqBfNfwZxBO/pu/1tUK6B0XMBbYx+BMYnmn+xpzDTD0tszofBy?=
 =?us-ascii?Q?UJk0mau1yHCvYu7NPVdBDN9GOSddOcZQnQACT9eE9dhTSJFJGWYS/Y7uruqv?=
 =?us-ascii?Q?GlqYsoiUl9MEeWA1eoGD/fieVqjbAwR9y7wTZnjB2JLrWjcZ6jeD9+QeTwKe?=
 =?us-ascii?Q?cdBA/Ih3F90NpOyQEz3gO0WY0b3qkipLrM60fYfn8ZpHAjW+1H8JY9v9/gU7?=
 =?us-ascii?Q?S6fruh/VMKweZ1qhvLbwzP5f0fIGIBDLG1tcot47cHIFYw9AHifWhp8Q9Q10?=
 =?us-ascii?Q?fGS033hlI6S9BU5vkoAhJYeZuM+1R3m6Mz/KbJmIESgiw0KkBcpHJys7Hq0A?=
 =?us-ascii?Q?2/ZkfkvIbXLWDRhhfQLKTq+nDwjQNJERrK7hAGbI9pcMFGAh7IffuMvZDZsJ?=
 =?us-ascii?Q?begTe+jhbu5pqHTgaqqPeTXz/VjUEHNG0F4xGgB74lkU9l/cpuij84YFIF5S?=
 =?us-ascii?Q?Om9R83tmJIBVcQ2/gyPGSl07/OF6EnTFGdSg75cYbWsg4Wq3A1p9Gkt2ZS8m?=
 =?us-ascii?Q?QgeNTTky+mPfJaCZc0A703oHZQnRETCO0yrdciYkfqKz9Kf5gthU15jHji7U?=
 =?us-ascii?Q?yoz3OgtjtX3J7JYcY/4CvLC5KIpwFgE1gs0yyHCIQzgvrpB2L6uYPaquDeeQ?=
 =?us-ascii?Q?leXswniwloeoitQxS6oBflXuYkgNDxgiGxmfR/iYdNNt11l23FYJbDTgOEmA?=
 =?us-ascii?Q?eJTrQOIkPN69vCqSChOUBN6Ios2Ymh8VG1PE2OzPcoWO2biVnUXI4CiTKFtN?=
 =?us-ascii?Q?yHdaFnIJHJHmLy4yUICdDl9TAqGZ7QALROVGjDH4h88yJy7Qo/f+oV3BNQq1?=
 =?us-ascii?Q?fM4v52wmd8q3ZDEjRtnNt7gqv2rBUmcDo2UJRZoXiw+QJ6hefg8qKIBQ0+yY?=
 =?us-ascii?Q?AX46t7tuDlfBtZkkQnVfDXWmNBMO9B7+EXce0lMCeLUKMVYoVWQFvB7we8AN?=
 =?us-ascii?Q?8g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1fd280-47f6-47b5-c801-08dcfce01f71
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 14:51:11.3804
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h7VgFAytkxYwOkALWWUAyKJ7/l8eR5kZg2bNG5cSr+hjhIg//U5C/ED5ltBQ+GHNpSkTn7vpCfMwdXZCqhyznw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7534
X-OriginatorOrg: intel.com

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4d3056ab32e02139d7656adf048416e877e283b0
commit: c21dc717760f8594e1fccae49eb86eb05e9a5f12 [1360/1360] dt-bindings: arm: Add MPAM MSC binding
:::::: branch date: 2 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-052-20241104 (https://download.01.org/0day-ci/archive/20241104/202411041305.karqcxbp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241104/202411041305.karqcxbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411041305.karqcxbp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)

vim +76 Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml

c21dc717760f85 Rob Herring 2024-01-22   8  
c21dc717760f85 Rob Herring 2024-01-22   9  description: |
c21dc717760f85 Rob Herring 2024-01-22  10    The Arm MPAM specification can be found here:
c21dc717760f85 Rob Herring 2024-01-22  11  
c21dc717760f85 Rob Herring 2024-01-22  12    https://developer.arm.com/documentation/ddi0598/latest
c21dc717760f85 Rob Herring 2024-01-22  13  
c21dc717760f85 Rob Herring 2024-01-22  14  maintainers:
c21dc717760f85 Rob Herring 2024-01-22  15    - Rob Herring <robh@kernel.org>
c21dc717760f85 Rob Herring 2024-01-22  16  
c21dc717760f85 Rob Herring 2024-01-22  17  properties:
c21dc717760f85 Rob Herring 2024-01-22  18    compatible:
c21dc717760f85 Rob Herring 2024-01-22  19      items:
c21dc717760f85 Rob Herring 2024-01-22  20        - const: arm,mpam-msc                   # Further details are discoverable
c21dc717760f85 Rob Herring 2024-01-22  21        - const: arm,mpam-memory-controller-msc
c21dc717760f85 Rob Herring 2024-01-22  22  
c21dc717760f85 Rob Herring 2024-01-22  23    reg:
c21dc717760f85 Rob Herring 2024-01-22  24      maxItems: 1
c21dc717760f85 Rob Herring 2024-01-22  25      description: A memory region containing registers as defined in the MPAM
c21dc717760f85 Rob Herring 2024-01-22  26        specification.
c21dc717760f85 Rob Herring 2024-01-22  27  
c21dc717760f85 Rob Herring 2024-01-22  28    interrupts:
c21dc717760f85 Rob Herring 2024-01-22  29      minItems: 1
c21dc717760f85 Rob Herring 2024-01-22  30      items:
c21dc717760f85 Rob Herring 2024-01-22  31        - description: error (optional)
c21dc717760f85 Rob Herring 2024-01-22  32        - description: overflow (optional, only for monitoring)
c21dc717760f85 Rob Herring 2024-01-22  33  
c21dc717760f85 Rob Herring 2024-01-22  34    interrupt-names:
c21dc717760f85 Rob Herring 2024-01-22  35      oneOf:
c21dc717760f85 Rob Herring 2024-01-22  36        - items:
c21dc717760f85 Rob Herring 2024-01-22  37            - enum: [ error, overflow ]
c21dc717760f85 Rob Herring 2024-01-22  38        - items:
c21dc717760f85 Rob Herring 2024-01-22  39            - const: error
c21dc717760f85 Rob Herring 2024-01-22  40            - const: overflow
c21dc717760f85 Rob Herring 2024-01-22  41  
c21dc717760f85 Rob Herring 2024-01-22  42    arm,not-ready-us:
c21dc717760f85 Rob Herring 2024-01-22  43      description: The maximum time in microseconds for monitoring data to be
c21dc717760f85 Rob Herring 2024-01-22  44        accurate after a settings change. For more information, see the
c21dc717760f85 Rob Herring 2024-01-22  45        Not-Ready (NRDY) bit description in the MPAM specification.
c21dc717760f85 Rob Herring 2024-01-22  46  
c21dc717760f85 Rob Herring 2024-01-22  47    numa-node-id: true # see NUMA binding
c21dc717760f85 Rob Herring 2024-01-22  48  
c21dc717760f85 Rob Herring 2024-01-22  49    '#address-cells':
c21dc717760f85 Rob Herring 2024-01-22  50      const: 1
c21dc717760f85 Rob Herring 2024-01-22  51  
c21dc717760f85 Rob Herring 2024-01-22  52    '#size-cells':
c21dc717760f85 Rob Herring 2024-01-22  53      const: 0
c21dc717760f85 Rob Herring 2024-01-22  54  
c21dc717760f85 Rob Herring 2024-01-22  55  patternProperties:
c21dc717760f85 Rob Herring 2024-01-22  56    '^ris@[0-9a-f]$':
c21dc717760f85 Rob Herring 2024-01-22  57      type: object
c21dc717760f85 Rob Herring 2024-01-22  58      additionalProperties: false
c21dc717760f85 Rob Herring 2024-01-22  59      description: |
c21dc717760f85 Rob Herring 2024-01-22  60        RIS nodes for each RIS in an MSC. These nodes are required for each RIS
c21dc717760f85 Rob Herring 2024-01-22  61        implementing known MPAM controls
c21dc717760f85 Rob Herring 2024-01-22  62  
c21dc717760f85 Rob Herring 2024-01-22  63      properties:
c21dc717760f85 Rob Herring 2024-01-22  64        compatible:
c21dc717760f85 Rob Herring 2024-01-22  65          enum:
c21dc717760f85 Rob Herring 2024-01-22  66              # Bulk storage for cache
c21dc717760f85 Rob Herring 2024-01-22  67            - arm,mpam-cache
c21dc717760f85 Rob Herring 2024-01-22  68              # Memory bandwidth
c21dc717760f85 Rob Herring 2024-01-22  69            - arm,mpam-memory
c21dc717760f85 Rob Herring 2024-01-22  70  
c21dc717760f85 Rob Herring 2024-01-22  71        reg:
c21dc717760f85 Rob Herring 2024-01-22  72          minimum: 0
c21dc717760f85 Rob Herring 2024-01-22  73          maximum: 0xf
c21dc717760f85 Rob Herring 2024-01-22  74  
c21dc717760f85 Rob Herring 2024-01-22  75        cpus:
c21dc717760f85 Rob Herring 2024-01-22 @76          $ref: '/schemas/types.yaml#/definitions/phandle-array'
c21dc717760f85 Rob Herring 2024-01-22  77          description:
c21dc717760f85 Rob Herring 2024-01-22  78            Phandle(s) to the CPU node(s) this RIS belongs to. By default, the parent
c21dc717760f85 Rob Herring 2024-01-22  79            device's affinity is used.
c21dc717760f85 Rob Herring 2024-01-22  80  
c21dc717760f85 Rob Herring 2024-01-22  81        arm,mpam-device:
c21dc717760f85 Rob Herring 2024-01-22  82          $ref: '/schemas/types.yaml#/definitions/phandle'
c21dc717760f85 Rob Herring 2024-01-22  83          description:
c21dc717760f85 Rob Herring 2024-01-22  84            By default, the MPAM enabled device associated with a RIS is the MSC's
c21dc717760f85 Rob Herring 2024-01-22  85            parent node. It is possible for each RIS to be associated with different
c21dc717760f85 Rob Herring 2024-01-22  86            devices in which case 'arm,mpam-device' should be used.
c21dc717760f85 Rob Herring 2024-01-22  87  
c21dc717760f85 Rob Herring 2024-01-22  88      required:
c21dc717760f85 Rob Herring 2024-01-22  89        - compatible
c21dc717760f85 Rob Herring 2024-01-22  90        - reg
c21dc717760f85 Rob Herring 2024-01-22  91  
c21dc717760f85 Rob Herring 2024-01-22  92  required:
c21dc717760f85 Rob Herring 2024-01-22  93    - compatible
c21dc717760f85 Rob Herring 2024-01-22  94    - reg
c21dc717760f85 Rob Herring 2024-01-22  95  
c21dc717760f85 Rob Herring 2024-01-22  96  dependencies:
c21dc717760f85 Rob Herring 2024-01-22  97    interrupts: [ interrupt-names ]
c21dc717760f85 Rob Herring 2024-01-22  98  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

