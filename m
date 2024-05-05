Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BDAEBE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 May 2024 02:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714875371; cv=fail; b=sCazrpa8xIf7qOWjwljEQt/No3galUqE09GYNa0/2tzVMDooO8BXeibCmODCgNjehOzOY/ef6eizRCjMsbKi+hHYOVgkrbRZNhqUa6g+95GYTm2GD0iMMHrGPiJuBMQB6kcJsR5HR2jA7MzSpJiiCU9viieu2ubuk1XFZUg8J5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714875371; c=relaxed/simple;
	bh=LMXm9vEt7cqk9aCa5TXoFHlxJPgacOHEXqh4QSvl1QY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CDxMchTxxWvo86+RfgJjYoDRLqtpap1ynsKbFpLqMPfaJlRszv3QYNFmaUb7HzSPf9lOnCBYlZbr42aEgBy0R59EQrzkwKwZ+YMy4R6NVHp/+rYpiLaXVAHB8+XQDD/oziBDj5C4hExz682h9mBzvARizRAUACH0VLruIRODkdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HShzR5DA; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HShzR5DA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714875370; x=1746411370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMXm9vEt7cqk9aCa5TXoFHlxJPgacOHEXqh4QSvl1QY=;
  b=HShzR5DA3UOipDZL5Yic6O6fcz3yNYbZiPtIzDcIL8jPISyzbWukk4n2
   6MAE8a/9VVmTL3PtUF8d+8wNzso7DxxwWw4xhoe+BWQSmMIqxu8NBxhc9
   hUrr+n7Vg8sLB4pVaP8vwc2x9pzpBQaF+cf9hr77f1Rlt7nnGG4zN6Foh
   RqobD5vO3ILkwdHL4y3u+tVyl+F/zcd85YCu7pIwSsXP3pNtdbehgeav9
   daIlF+qqNR7UjTnBkKcKc+xsS6IyUkFjGXsC1ZBYQiK3Br+dwCOFRM8d3
   OwjKFVT1uGzTmV+cINkqP/AMBpU0CU5cpmJVywSfJY5Qvx4u1YaV3RUQ/
   Q==;
X-CSE-ConnectionGUID: EQoG7zeKTviCvSrlGBAWEQ==
X-CSE-MsgGUID: qQfVJNn9RoWK82R5TwgXdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10480126"
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="10480126"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2024 19:16:10 -0700
X-CSE-ConnectionGUID: 5BxFOTt8RGmkceaLxCtQTQ==
X-CSE-MsgGUID: XGwA8g0CQgCSEIMtjcJMSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,255,1708416000"; 
   d="scan'208";a="32630456"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 04 May 2024 19:16:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 4 May 2024 19:16:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 4 May 2024 19:16:06 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sat, 4 May 2024 19:16:06 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sat, 4 May 2024 19:16:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5rbE58WP7KZm4XX7QuO+85QdpxivK2AhLQlSjyVWXq1kaAi17s4QIqVcTTi4AoFbWw9OLL1l6WmBF9yL27IiJ/b3C2mXClFW8FyRD4vI3L4VuiWlkDmF4ewE8o3nrbeEr1oEVVFacG192GBwmOBbYf9/oMQnQZ4Fl20qo5LLcHCe5KonNPaS36AiG2w5B2xctHNdMyXQeAhwaoX6GR2SgDVr2w29Csv2gQ8EzeJV4PXCH0ddrCIbSF93mVePANjVdyTUH920NeQPksupfLbKnnY33zCdUANLLeMbbBIC6DW/6H1keLXRRq8W1BQ9FmTGa17Ue034c1kzGxXRk3Puw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hEAvwGEm7EKWZ1x9hV3ZldaeQfBs8gVjdRl4ckzubE=;
 b=fMAxFUs+Yhj2YdNmbda8ViUv5nHjjx7b7eaIXjyG+9GRoOzU/AvT2y1LLKcBVrhwQQ0KlO54tVOxIHe/RoOn0QEmxoqd6A5onfABRM4+nvcU10aNCRCcajZJxl8Es0t5VmXAWm/YpbjEzGPCeScjsrQ7emxq7V1lQdqTzoDojfhR1Ok/CknyqLwUkgwowjf7ph9Iv1oF0cUICVV5bL9kuFO9mulAd3kpXWuPxIu2I1VCPRRoSYvFXBS20ThKjgZdKUbEcJZbBy3GL47kU2+3lA7yM0eZr5Ux/UsKlKxDwXIxkRJTTjjpT9F96WMhJ4J3zs21RwqFTwKZ2ohFR5W4yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by IA1PR11MB8197.namprd11.prod.outlook.com (2603:10b6:208:446::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.28; Sun, 5 May
 2024 02:16:04 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::35d6:c016:dbf5:478e%7]) with mapi id 15.20.7544.036; Sun, 5 May 2024
 02:16:04 +0000
Date: Sun, 5 May 2024 10:15:57 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
CC: <oe-kbuild-all@lists.linux.dev>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, James Clark <james.clark@arm.com>
Subject: [coresight:next 26/26]
 drivers/hwtracing/coresight/coresight-tmc-core.c: linux/acpi.h is included
 more than once.
Message-ID: <Zjbr3ayoZJCZMt0Q@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|IA1PR11MB8197:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ebd272-bc8f-41e5-e6ba-08dc6ca950a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4tYTTOWwzVHw3JeR10YaB4ILf7wD71OHCusrdjX6IcgFh6chQp0372MzU72I?=
 =?us-ascii?Q?mGpEf4wW03WWZlagD61AFCQknUY4rIlUBmnaPbDlyydXliO13LgPs1XPWPhL?=
 =?us-ascii?Q?obU+yXlbROOrs3Ed1aK3LKCXhp0i6uZAimniyAUxyUPHIc7b8RawXufE1VTk?=
 =?us-ascii?Q?CYJsEZUQ9fDZIYJt2QhYUhM9p9mQTonWs9SeRIv/KY5/k9XFD2L+zuLhmDNn?=
 =?us-ascii?Q?6roHXOyOiULsGNGf5AkpHLdATkgHaN4gRj7mj38/gcjOeyXn0a0TH7L7JCNd?=
 =?us-ascii?Q?eJTa5WAqQhnBJk/wjHwaricxdENRstcFsqI2dbBXvaAUOwJkvjlmkpmIOHIN?=
 =?us-ascii?Q?YjqEuLC/r6QmG0tjcPom4fQ3YcdFpG1aS7MfdVrS23c0a8sDyqMDl1ADuBZm?=
 =?us-ascii?Q?eyTiu3sBCXYyUsVGvWrNUaPByBcwe/aNp4oNzcqziR4FBczHf5YFGPYDJHeu?=
 =?us-ascii?Q?cS7iUHoOvwVGDqSbcA1RYdwkzs2pigtuFmbKUPpkXbLMIte77h6R8Uj0rDif?=
 =?us-ascii?Q?NROcCVY08CPj1mUuhuOXpGHGCzuO2Ne+2XvwYWd0Cb+q9SbDLKIbXp8xcZfT?=
 =?us-ascii?Q?HXxUFT8f/374cJblZulkoIkMseWkoSOkJquIE24MJBoOYO7f2sQyYXyHE8mh?=
 =?us-ascii?Q?VZdlqyFIEAJAJETay6UVN7Pyok6Y6WUial8oKUqehPXMcvEQIoh403i4T7KF?=
 =?us-ascii?Q?etaJSDLDQFX23YfN/FQ4MAMZhPCTw2lygR65mfS+Qv0L61aUk2Dv6GY4a7v2?=
 =?us-ascii?Q?UnvLHDRIh+ilaag6aF61J27BRqn2KdVERlBXwEEK0+mdXOM2PxravDN3eyda?=
 =?us-ascii?Q?PCMt5C2ZiqBsUIMjt5gm+UlvhC2Vy6xwA/IQ8aTrLZkqSHfJq8QdFJEQU8h9?=
 =?us-ascii?Q?0zeWAnvJeC6Vc5rvdze6H/G5ukH4Q+udrB3CAwq3pHqi6Sbp537biH10v3+8?=
 =?us-ascii?Q?n6DFKx37kqeMyDiijSQHJyFUrIU6IEGmhUDw3ElGoGNnHgr6ZaqMOnxttxwP?=
 =?us-ascii?Q?k+OP+ujU+to2DR4Ca3DeSYIn74bex9B1mvk9ZVfQp5RzZ24DPzDCZjU4XKGw?=
 =?us-ascii?Q?zio9eq4qNFToeji3GXUOp4v1pcnIG9QMrOOMusOexraHZ8kFu6IWFbl9ZZKw?=
 =?us-ascii?Q?01PVWZ0QL+3+eMk8BVdEQayYcW/SIFTGynvn8JmC/xFLamXefYu9YjYX/dy/?=
 =?us-ascii?Q?D7riOsB63g2pJcDV4uVzjajo9zfhYU+baa8FP6xnf9C7GY7P4yE7i0ahmFo?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHbyYrX4Ld4LQuRtshb7W3+8K+5x5OOdsEdS8bPQIlHErZ7E4w5tom+t4LST?=
 =?us-ascii?Q?RpIzot1mJMRW6mKkgOxmGoNVAVY/mM+e/seXRHg8Q55ZlzVC77hbY5w4u4iY?=
 =?us-ascii?Q?moCHosRLHmub/xdZcO+pdAa5d4/uUTjzOanBPgMjg5GRYu/FA7J8/mtQCNyz?=
 =?us-ascii?Q?Hc6cxzdsWY40SvNP8aGkW38QOHP59JyJW+GUnZJUOH9I3bPDe+wfi9KrsMD4?=
 =?us-ascii?Q?S77R58jsnmaHtNrlzNlFa+ddQ8JlFL4K9jAhbdk8SQfodoPv6qS5QmwRBvsq?=
 =?us-ascii?Q?Kw4gFI+cVuEEtI96/uaIPiaNK/MutOi0XIhNEcVsN0v0VwA65kdx23pdh/01?=
 =?us-ascii?Q?WYd2L0Wy6Ybgcn4OzHzGaO0VilkmpAElX5QX1KZLZWOGPrq1ZjzIEwhgIkIH?=
 =?us-ascii?Q?/vckKDaCN9qnas2/qpZMoiHBcRAtSH9/OKQLUMKegpW1XCi/GO9znrrSYOY1?=
 =?us-ascii?Q?Vh5qgnuJVeJ7gt6r/WuSrJOJOl4HoyRho2KXpCz9+TPX0AJ9fDyJwghxknVu?=
 =?us-ascii?Q?z87pNkAKAZQLKbCy9I1h8ynRcGAHBUtS7Aw54Ap8ADPYlzPwnUx3l5h/EJvr?=
 =?us-ascii?Q?buQcKYGkS18gty/kO2F+/jOs4ajyNUcO9sthK001ssTsQz7xMpYhliNPXgos?=
 =?us-ascii?Q?RQebGTqFAN+yrlOF+yJ4exjJUMkwUlwEEUtJ0KJ+YHDwKM39UKuLvyukMLZY?=
 =?us-ascii?Q?d1EbfWvFBMgEI0col0C52lahZME4LptQwLBdRV5HrDVmKFjxAnL7gu+1z+oA?=
 =?us-ascii?Q?FfeNLq0KG9r1NOjnN7cI9dkoiXlVLi5Gq0ylsUJwsXuzRwXRYMR325cdhULw?=
 =?us-ascii?Q?u+R3svUHuk3GOWOX8dXADP9OvvgAM4idGUZaZvlFKgndtkAtuITX4At9Q103?=
 =?us-ascii?Q?4es2U9GbEC2F1cVq9nmDs9HK6PeOB0ARJp3gqAvMaoy+Gi97vvmlA4nadkBO?=
 =?us-ascii?Q?LvgwxkFtSfTlpiPFDs5abmA9n5WjHr5lFSE9IqNKCYE86Ln6zduudEazdqTA?=
 =?us-ascii?Q?qfIoKBx1BPWX4iXGCgBRyqoik7cWsXvexfXTbMe3XvdYwv+nSv2VYuDb0i1g?=
 =?us-ascii?Q?6gUNxFp5qryHrXRg9clze6My7tgQas9ekNpps4Lzjvar/7YTjhiWMpcaAzUx?=
 =?us-ascii?Q?fYqzF/BE8QNCeFF7Lc1pGrnz4oiKVzEhKQNrzEoRG4luv5JpOXE9VP7TQfyn?=
 =?us-ascii?Q?XGcXO9B5nOmsz+eS2RTOG3udIunSQ3pt2Fk8mjYkZx7QTOJ/qqnEUgtqdn7N?=
 =?us-ascii?Q?7gE7kESUHe0JmfzXVm07JPvLEaAdrNd4ZVDO40zjnQ82in/AWBvz5G3rPToR?=
 =?us-ascii?Q?1fLCYtjFVs9ldxb4SPFxJvW85B5r53cwDqSbBU9P6qnoi8ORo/zWzQKKCV4k?=
 =?us-ascii?Q?fIijgZ2BYBdosoIT4z5xY9pZBVjfT1V1CzujtOuOgb7DD7Rh0+e/bP7neY8B?=
 =?us-ascii?Q?SXEvp8yipziJ4wQun2jOpN2U115q8Hiv5SJHWPD11m/7CoERNw2LzUOqcDjl?=
 =?us-ascii?Q?py0G4Ci6vLxD20ZQxMdtrnexfHm8X1nf/Q8tLbndXQAKh76wnsWuiAWbkJe5?=
 =?us-ascii?Q?5me5K8mM7/+PRuZ6/unfHkf/M+oPIAIxSLhlAJN9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ebd272-bc8f-41e5-e6ba-08dc6ca950a6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2024 02:16:04.0673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsbByvd3aV2R6FqY53t9+jx2pySGP73WpCe4hd1/CrJ3gyumu0TgyQp8+jrGL286REmELaqI22n0DTI9ih+Z0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8197
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/coresight/linux.git next
head:   8877ef45ef9ec281849870d88039f8dc84cde774
commit: 8877ef45ef9ec281849870d88039f8dc84cde774 [26/26] coresight: tmc: Enable SG capability on ACPI based SoC-400 TMC ETR devices
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405021512.LWPwzJtX-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/hwtracing/coresight/coresight-tmc-core.c: linux/acpi.h is included more than once.

vim +7 drivers/hwtracing/coresight/coresight-tmc-core.c

   > 7	#include <linux/acpi.h>
     8	#include <linux/kernel.h>
     9	#include <linux/init.h>
    10	#include <linux/types.h>
    11	#include <linux/device.h>
    12	#include <linux/idr.h>
    13	#include <linux/io.h>
    14	#include <linux/iommu.h>
    15	#include <linux/err.h>
    16	#include <linux/fs.h>
    17	#include <linux/miscdevice.h>
    18	#include <linux/mutex.h>
    19	#include <linux/property.h>
    20	#include <linux/uaccess.h>
    21	#include <linux/slab.h>
    22	#include <linux/dma-mapping.h>
    23	#include <linux/spinlock.h>
    24	#include <linux/pm_runtime.h>
    25	#include <linux/of.h>
    26	#include <linux/coresight.h>
    27	#include <linux/amba/bus.h>
    28	#include <linux/platform_device.h>
  > 29	#include <linux/acpi.h>
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

