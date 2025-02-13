Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656D6205E06
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 05:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739424550; cv=fail; b=hkORZr5PZ6bo5AzmJhUkObQOIhjLXEWKOFhACluxPz12aQTBCBlcs3WxvlDRXN9XYrdnhDGIrHoKKosOK+/5yKr8cG/O0EnRaTTksdTgOo81bwdwCzgN096Lx667Wr4UzsYAfOhGYgV5mOFKtYVT8b6V4Qq9VBXNZfj/lVjGBRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739424550; c=relaxed/simple;
	bh=vkLCo37Xja3DjO1YzIgktAegbWmrx+Yj2a0P5M52MP4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WSYRBq2E5U8FdC9MObJK2vVH0ND1ONGJjmQw0LLTG5DBBOuNgpIluI7O1WeY5n3q6Rd9eooGZW1YIxOLpACQZbUxsXbi903ocJ9gRz3qHBLHd/AGDSfHWOQnSOKD6473NUzo1Ca9inf/oxWXwabWzR+LC1JPzv8k4XgjIRIEDXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YwDiLZg2; arc=fail smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YwDiLZg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739424550; x=1770960550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vkLCo37Xja3DjO1YzIgktAegbWmrx+Yj2a0P5M52MP4=;
  b=YwDiLZg2Q9guY1w6xu3nfKhkxlwNB3171HPDag1WDh1/BWgqbFtBzbAy
   oBhd+1/bmUNetBj5TkYD7lCSpYC/GEpunrBN6kcabzieSvRTlIq6FRPOg
   dKzEZpnnNdag0M3MBUJrl84qCwSfDrbv3q9loC1xcFXqq2MpfBoriT1gP
   E7Z/FgMKOglDOXDUObMrg9LjWIx/yNI4HVXU/B4G9rMm0vp3REQmYPANi
   a01SJdu6MT5Uv2akt/RqU/JJIcgPUQUkAknzHqbah69tSczVSQx8Rw/xi
   zjwRpccUi4ySMlui7gQE3kAT0mHNC6UGblMatd0UaNi48CBik1Fzkh1Om
   Q==;
X-CSE-ConnectionGUID: r20dKlrOQAWv9plcLKrO3A==
X-CSE-MsgGUID: i8incSOSQ++HMiIG3EAx6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="43764569"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="43764569"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 21:29:09 -0800
X-CSE-ConnectionGUID: hDiDAc/aStqrYe5R0h99Jg==
X-CSE-MsgGUID: FoUgpaqqRI6hRTLo3jvMaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; 
   d="scan'208";a="112895793"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Feb 2025 21:29:09 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Feb 2025 21:29:08 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 21:29:08 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 21:29:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRKI9eY3YG+H91f8YOhuxhY9oIjF9UxscdzNXcexTf0nNFEj8gQnB+jo41qNtWIRllSgOSZXJEqRXWqy/D7SBv9rAJN2fKu4x+UM4Go8eEBywoy8xuNucVdoMlAfawNVh8uEqqGNrqQH413bAmDV6RGjotPub2WpfgagaJb3JB8rGInItHQG1NfCDc9yLWItA4JeLdVc0LOS07Dja7ex25mn0KnA8WsiKtND9WctuTiiH2qjjHsHiAvQ+AYC65jYnhKxR35sg2M+TsESfqSvDuMr3JlTttXlgX24ZwXb90hCGmiVumtjuUdwS3lfIV3FVQsKt3N3bU+kymbweVhcTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UnDmuHtjASDQtjyVUn2nGdAfTgPW77tvgik/IGLB2yo=;
 b=h/FazYLOFnZwMjHnNvJwXtVP/G9W+PjoFIzJrY3ov/JyJNhEyLbRyTxByK8oCQgMwaD51AAQ/5Miw1LIna0kh9H5eJ2zCnR7zqDK62QXbeo2PRrytp9KQlIAtkT6QpzSsCHf+CnmaAa/PC+0Nb6yjZfJT5KWauERZb9QQgb2isZNdCSRTTuQFy1jKhEy5rXNvs0nxVUsOER6IG01cPfcZQAubPsvdugMlMgs/ToviSJggt3idT/18o/vqwdoIoeBLXJUkPSfe8MSe7Sg8Yob9+TRl6ZMyTZ7r1ao2/qNK/pmv7hn3K2CechWYIoGFq/7e/Z5jYkjRCWU/fYRT6+Mjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA0PR11MB7742.namprd11.prod.outlook.com (2603:10b6:208:403::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.13; Thu, 13 Feb
 2025 05:29:05 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 05:29:05 +0000
Date: Thu, 13 Feb 2025 13:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jpoimboe:objtool/core 5/9] make[3]: *** No rule to make target
 'vmlinux.o.map', needed by 'modules.builtin.ranges'.
Message-ID: <Z62DGkswUPhurEew@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA0PR11MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cb8714-dd8e-4b01-d4ea-08dd4bef552d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8v733tq/5kAy9iYb4SSZmhbTX3XFrQR+6For1iILfQezNfiLMdPjr6lwQ8OI?=
 =?us-ascii?Q?NfR2c5USTnkPNKio9Nkag5ii0arNLhc0AzuiIC29/fVbYLAh4DrHv3w4icCk?=
 =?us-ascii?Q?b7PLTT5ZXd3K++0BwYMbRtuWF7AosW/bgs50HU9XbFtqO5p8szfAXn0ZkLOK?=
 =?us-ascii?Q?xAinJIbr3bTPQlZqzKI4gOS3hclF7efYNAjnIZ172fk7VwcggpT0nOkIKw9c?=
 =?us-ascii?Q?r6tbTM88mbdCotffLSl88/XFafLWEw9F7PUnlMfEcZ+MBIQnGC3dZOPiRv2A?=
 =?us-ascii?Q?NqzA7Xnye4nlPzz3w6ScXstQDry1Za2CfaxoGPxGFQf7s4Is9nasw5FhofIg?=
 =?us-ascii?Q?tV0zxv5JJqTU1FmvnnW4sQa/StmdwfxAIAm/7DUP6eTlzbNy0SNRQ34a84p6?=
 =?us-ascii?Q?f+nKLAzO1iLGKCEhV0IUhQ2XH9anX+M1RZKYGJ2+N3SUW/4IysOyUGn5AGEf?=
 =?us-ascii?Q?vmoZYWZtop8TNLCGxdgzTQYQ0afAPVJbauHpEG6yBwmJxumM5J8U5185T8ar?=
 =?us-ascii?Q?gt6lYkp/0ZQaPHaQuu3PRQkgb+Vyv+apwSCwaE373J49oCx0H697rmVHqZPH?=
 =?us-ascii?Q?KMvBrlNVzPB454e79heijmLH9b2FcE/cOxf+5j/2af0Vuo1ST2D3iwUEUuAl?=
 =?us-ascii?Q?pz6NeHA6HZhhUm/e/cbhItQ+6NPmTztGyHzlgS3Z8AfN2ZOYnZlnlCruX3Zh?=
 =?us-ascii?Q?/HXcZPqzFgMt6XdP8csZIuwTdAu2Iz1v4N6pbJa07v2j2gw0pj7im6lDaNTj?=
 =?us-ascii?Q?LtA6pibZVUzELs1YsaHES44OfkoInL1eDPYpcY//JHAnHQTjAgJD0h0c+ZQA?=
 =?us-ascii?Q?kXMXwH0EXRuiQABAswfVaa/dfkyY30816ozEMzTAlE2B+EDAcs2CyEP8gbyI?=
 =?us-ascii?Q?my+nQ1TFurFZQNEGus2KLhgwtR5A/NYeQtVWl4225vD931F43QpBwA2wWl2Q?=
 =?us-ascii?Q?XVRMeN5xzpI2xKfXrvkMZFFSyrxFrvhaNezsDeMLc1dOLn8Iopx7GmdL57N8?=
 =?us-ascii?Q?2C8RQyWty5vkcEpG4DXIO1ISUWhPs+Cf4Iyegj7Gyd5ijBTEZJ1uDwuj67IR?=
 =?us-ascii?Q?qu7hLNUsO2w0IARO8BGTzJEcp3iklqzdDiKNyKY0KO6zNbNLAx0gXHg04GFb?=
 =?us-ascii?Q?+n3rR5bQS5qQVCJFRKgrFeoUtphVElyK2GaTle5kf8ps+7udConyR8d85MjU?=
 =?us-ascii?Q?JFokV2Qy+WUfFxxGTz+mFLWhAAZlYuABUbAC61Wezdv6+/f9lhrQjatgfhn7?=
 =?us-ascii?Q?nWWDX8Cpy+dBeX7WL6FLFqfj/vTlAILUpsGBnvghle7jg3hACpKmkxIUFkjQ?=
 =?us-ascii?Q?czq3IAkHgUG85VTqbGGXuraV+APalWtbCYc674EDFwGx9A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GmIXIJmX1Rbl7eGUL5myV0gyzc9+T9ZsRqURW4j5AVng1TqGfIODqk799j91?=
 =?us-ascii?Q?ByhHv1TRCooXc5rpMxz5p4CUXwdgRjqhOhTLSicu9vJM4l0pC4LWqk6nAgpY?=
 =?us-ascii?Q?udHlrz8bb3F6ojUtmt62Y6O+5Pr7Zq8jF3J75F1IQr/edTXt78j73yrXi9gt?=
 =?us-ascii?Q?2uaUH7vyLs5ROk+Oai3befgBbbGjnHDxFXguwrkGyw26vjKsoTbkE8F6gDN3?=
 =?us-ascii?Q?N/MIOxX1VbrM3Bn720QUV950lFp6DN48dCGQ/pzYvRmPUqzYi9FnHqm7ipyT?=
 =?us-ascii?Q?5V7ZTlB4OsfdgjVS0eG1jJwAKcFBm00WNYN4AbpoNWlxWYoDkrlUnzb3KfFc?=
 =?us-ascii?Q?uIjSs9C/vL6S9u+9TdMBQAozUmNmpVCNKGB3PvZfn/mrQgXbjRU7i1oevwva?=
 =?us-ascii?Q?HIwO9KgIKsPop3QJi91DDNBoF6iBTrq8xziYENj2kexkPo987PtnGeT2oC9v?=
 =?us-ascii?Q?bUPr+Rg0VebBCz9AG5IFkkWehHlJzLmhp4qlLeJD0mwcGKAaja02+FRmoeh4?=
 =?us-ascii?Q?SMk6gftUWQqlg0wzaGcmOvIIRr+Fhck7AV8GT1klQyoUcb5MMH/1guOX2u7q?=
 =?us-ascii?Q?cDH19WIc6C2DQRDlo2O5hriKtpyl4ZraWuxr+F1KOIrwZ/deiPL4y6aONSyx?=
 =?us-ascii?Q?RSntqmFhcHEXnDu7yV/6zDTzjp5EDwQFk8X/6AMosKCWu/i/rMK8ykkJStf9?=
 =?us-ascii?Q?9UBaxwpc0xfruybvbnFDpZONGUKPdeFhWNnMdmXH+a00YW/nbmuOn6AhJyca?=
 =?us-ascii?Q?CfFGKWtPYiWh5+re0E6uPITMyoS1BV/1ChOIIrvk+PaTHLlWcMFFj8Ym7R1X?=
 =?us-ascii?Q?H5VVBdwmX+trFPNClumBtHq+/zVG0rBwaJyOCGjoqAgPpboeWXs1n2FEShfF?=
 =?us-ascii?Q?POPD3KxaOZT5bO2ENywtnM3i9blUYOl7cQuTh8xHo1EG5NrCTq/vBCE3W3SD?=
 =?us-ascii?Q?upiRXqOPj4GylicTps9kWJsqxfq9NzPT+Q6eNyQ2tuDeL/fXr8PR1GqHpXF9?=
 =?us-ascii?Q?9qBilC1M0RAu6cKB5jQavoNdXnoi3+N0GI9aM+97C/xZDWksrfLLhddeVK67?=
 =?us-ascii?Q?3d+PPE3c2nldyVpMDisUlhl2G4tXZqn1oVKmThGdbFsEsZcBsCFckcX3JQie?=
 =?us-ascii?Q?pdmsHKlA6XG1sjaUwBgg3v4CK9YjhlznKoOte3lKSv6e0N99JoDs9asSVR0b?=
 =?us-ascii?Q?Pd1VvqMrTp86v2P8e6XBkAKIzX/MVc5KeguIJegRYaG+vsqTlhcZoBy3uhWK?=
 =?us-ascii?Q?9zdEC9g+Wg3i3+kt17pljl4+hUEyoSRfXw2PCXurCdQCtVRwih4+xGaU4z2f?=
 =?us-ascii?Q?pq9i3H9nT+ZzCAyQeVIH4tEyOi0jUGrUTh0Rk0rjMj1+N3oHGQZoamUNGZhu?=
 =?us-ascii?Q?QdwFj4uj5CJ/wDaieo1ct+eDiURCj6CFNPydhsuylIERjkXFLVbhm1msoHOS?=
 =?us-ascii?Q?MREcxINZ6MwTgdPrS0oTgN0UbLb/lnFDpg/FL8RWkMzuzxz9pYtz/cayFmsD?=
 =?us-ascii?Q?U8qdohe0aOwGghe+k6teUu6/37VE2tadk5Lipkkd6lpmawGbfdoqaSRrJ5Fm?=
 =?us-ascii?Q?yNzmeUKh6m0mrKnfYe46+Dq4THgbSPC6f7VKN9MyA+uGIxAO1VC0/uKyks9a?=
 =?us-ascii?Q?Sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cb8714-dd8e-4b01-d4ea-08dd4bef552d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 05:29:05.5718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Cu2XHXtrSnfl1HHSpSvNf4oZpmZ77Wos0bmxtMg6fyEZrdBmEAzJwWU1dcdyEn1nHeJtX6FBDzKUOGDQK8lug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7742
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool/core
head:   49656589e697a593b312509ededb52d339aa0967
commit: 435f15904e62d96d0c9029e147fb9c8dfbdc11a3 [5/9] kbuild: Separate vmlinux.o linker and objtool steps
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-buildonly-randconfig-001-20250208 (https://download.01.org/0day-ci/archive/20250208/202502081422.zYFg0SOY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502081422.zYFg0SOY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502081422.zYFg0SOY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'vmlinux.o.map', needed by 'modules.builtin.ranges'.
   make[3]: Target '__default' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

