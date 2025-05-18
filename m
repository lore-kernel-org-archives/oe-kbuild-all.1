Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE27F507
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 May 2025 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747535180; cv=fail; b=UdPYnxGdkxgMH5vYWzcUDlvR5oF3NlPhkVVhGxEMC/TyXsN9dBIFXxa4PiMVQGQTbS9ulF5Q3aKSVUBNlhrUDNxYAgxfePvCPRAAglqgVOYsMymC4ho8xZkcTUWiLixkZQZgjrndKDkHqdsQbgDivFDnqUc53lefBwnQH2Qxz/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747535180; c=relaxed/simple;
	bh=Isfs66ymtIs/cKNWpeqX/cVqqc6luSwie4KRYMPs8xk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iGKyHhfCSf5pdexlvlnpOnZqrth/VcUwQOZGVABg09dhcGG7/bRN4+zKr7GlDwqoFhq/7qLptbFSWpEka4oGEfxkx//64H+QOoJ58OEJ7I48kbrLDjlfKgITEVCCZjStLnZEZqFaLBuzU8nhMjtYH/Jp1hdrU0n+cYRoLEfVWJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cmCuqSST; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cmCuqSST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747535179; x=1779071179;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Isfs66ymtIs/cKNWpeqX/cVqqc6luSwie4KRYMPs8xk=;
  b=cmCuqSST3JlX+J+0gX8X3r3u5H4XenqsoeevyOjbPy02Dwa4G89sQQ0e
   i7cl/voN77TBbbJvDo8kOQTY9/m/7k3YRjbvZhcqm5FP7UeYompMCDJjH
   q7/1x8n5hs4+lsfGfOY0WQz19CBj0PJs97KUXPwKxZ/Es1dtqfv70nI4a
   mV8XtT7yJtwKgS9Ew1mLstU7iViAOPAGu4wAXi1pdmvhJPL8lZgFX3eDN
   BOex/LJzDyOF/2QyWRpVCWmcRmP/q2Mj42JvkWYIu2hfhZmF0t7HZigFC
   OLCI1iKsSQcVbd+HPW66pjDkmm42JjzAB1AAidl8JMz9Iu06ox3SnPpCa
   w==;
X-CSE-ConnectionGUID: opPzYZ/rTUywi4hX+j7XNA==
X-CSE-MsgGUID: hgZ436gmSrq4f07R2u1SZA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="67019300"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="67019300"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:26:18 -0700
X-CSE-ConnectionGUID: HnTktUkFRMqkDJLQoMwKtw==
X-CSE-MsgGUID: JK/dA5H/RKWEY1GB8vsbGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="139089028"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 19:26:18 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sat, 17 May 2025 19:26:17 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sat, 17 May 2025 19:26:17 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 17 May 2025 19:26:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVcGzH1XyWtuLuLX0Gx43O5cwX6zF/CqgB5QMFey841U8+8+AEBa4MBhCbUz5fgxZ6F2Nav1MsroLRcG6+YEkXtZdyytUmGTWooehuL7Rxsu1uvJnBBBy8s2VnoSP5Reo2J7+ySmrTZg0h/llzj6FafZ9suyrnfXg3JhXWIUBjQTUewAfZk/Y8PgPAwUvXIgUdyyV+NUzaDaa2uoocYwTP0JzHMMY7R6hbsw/tCIifDpmjsokElDYN7l7JFzeBDl4pNzx5DehnrBgUjxauS7BsOd9Ij8JN4r3j8JTD1DI4xAjonXDjri1L7ropio5819pD31qV15W5OTzQijRR3gHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFGiKvNnuAyji2zgGQMNlAGkDZcYo6lhCWZ2ckzKxCA=;
 b=T72VSP9Sz7NicgqZj9BW+2vQLqtuHUrfi8iapI2MiPff4y1XHjwu7uJ/3aou6gdmb9pK9yRkEWJPBHPiD9j94r8xFhji9IJQ2MNJXN9cochkkm0F5KOv1vIrG4UjXDk/jx2U/h4HtThvFaBgylH4BVI+o81+LMOjvIgROzJ/QA9HMPUxMleYsObZBMXoUxdbu7Q5nsFi7VT5yjMaenUQ9TZW5kUzScaA1Ed5cMDOkmmza5q6ZVQeZDDaTzuOiNGC6dO6L1GRgl1p+8n3M5z+2ClkmoSvCt71dW2TziPntWrzjAtiPJQ6tdq+/Jy01RaX9Oqa0jG6w17qgiT/yAemXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by MW5PR11MB5764.namprd11.prod.outlook.com (2603:10b6:303:197::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.26; Sun, 18 May
 2025 02:26:09 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8722.031; Sun, 18 May 2025
 02:26:09 +0000
Date: Sun, 18 May 2025 10:26:01 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android13-5.15 1/1]
 Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: connector:
 Missing additionalProperties/unevaluatedProperties constraint
Message-ID: <aClFOX42nMqV9W7w@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|MW5PR11MB5764:EE_
X-MS-Office365-Filtering-Correlation-Id: 021a01bb-5aa3-4861-0814-08dd95b359c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qYm/jJ9IZyTUnIxgP7ho4t8fksaZnsned2z69HPrR8g/SqQ0HieWouLr31IN?=
 =?us-ascii?Q?FeNoSkHgO++a6iwvQDn2uwGml14eYAAOVOTX2zYWDW4uqxI5k4bb66TKvXHh?=
 =?us-ascii?Q?T1cnHx4agHPM4XgbBKWXzdCMLSdIrXmHULgpJoqVgGpH34q8rnalmwo+2O4h?=
 =?us-ascii?Q?NqshU/1MijUKqxVE+FLEUV3fV3LjvlQO9+oxszC73g9XyDM7+k+kXIWWpRfm?=
 =?us-ascii?Q?WSe34Jx0wa4bA2d1m/bPyegclW/3V+g8TGcokiSxi6hz0QdLLFRGUc/QVY7s?=
 =?us-ascii?Q?bWVVR2BO2hV+bltpGFhB25J8T8Zeoi+khPlGqzQqY44D8EkOykVrsVxrHQY9?=
 =?us-ascii?Q?t83Nmq72wqTtSM/24Z3DB5aLwLLDVbNZ0qM6YXBqof/GU/gtSSO/8cx2fjOU?=
 =?us-ascii?Q?fEprPz6FzA3Y8jo6jpS7fbcHh1cZJehzGJxwJIpLcjndHxVmHnKrJotPMqTP?=
 =?us-ascii?Q?o85ogcNvhr2q5mf3sy1tB6Ws99eDr3xvDHOeLeEte+wGU1tU1u9Z5dzY7oep?=
 =?us-ascii?Q?3mYb4T4HOG4fQOhgNj0VzbkDQObA6te4KkCcVmTU0RLbK+WnOWqe9Fam1s64?=
 =?us-ascii?Q?KbBfhJ3Te3Cub9eybMbJ1qZ1HY6CQiMGk8wqjkwrvJcv9hs6GjPQD4B2UUyZ?=
 =?us-ascii?Q?JiX+zyvhfHWyw9vcyCM4aiC3pT6hxUP+BtBiQaG1M+YdGpIOt4Wx1URTRa3v?=
 =?us-ascii?Q?SouqFP3rV12KRBCTHH00Gl5I7SBlzhp5CQcJ4dH/MxA8wUqwoDtbjGI+y3wo?=
 =?us-ascii?Q?zDe2/CXE9tR9adTkWx0pTIzcLaQUfsIIXVDD5JRU/IJCsgw/zhoJN2Nr7GxJ?=
 =?us-ascii?Q?R8LwQozDP1xQsDubgZze0q7VQfgJgBqQpNBziUbjY4ARi3G5iS1WfoeMcw20?=
 =?us-ascii?Q?XIvlbeHusYl6GjercVZIhRBMktr00RWYRB1rwzZ41pfNra/IuZeNE4UNadyY?=
 =?us-ascii?Q?YIRRZsV7mP7V0dgtE3lBwERN7Tiv2Jm40UPsvqVPJPoQIXF09F8l44D8f/kx?=
 =?us-ascii?Q?Wk3vijEUdACcgXgok6bMSN+2+ax7xeJ/UqxCP5IsiL+o8wyxIz90QPyPOerw?=
 =?us-ascii?Q?AS0TxnrAvIvOuHS2bnlGhBSjSnB+EYvxIhj/hnwQn+ffRAZ1mmNVSPOzvz3v?=
 =?us-ascii?Q?bLShNJbkKV75fC/l6wkO4iChwfZj0C4do60u0fLsnR5UjHU/AndV9z9zK3lN?=
 =?us-ascii?Q?9/BsXQAeYZqcLzb+w3+Fv3to55JTEmF2m5R7kUXHbmD5hDBCDf+UXd88Mn5L?=
 =?us-ascii?Q?Pk1J1DlHGOFCOMMDOVw5X0yU+Gim8l//tcbjBQzvn1epWa91d1SvNs46NBcx?=
 =?us-ascii?Q?UkL7zTKyzp2vPCR2BmIMU8kOJ/ITEqugPHpcgEJc8qGEpBiRdWSyQj00RH4i?=
 =?us-ascii?Q?xCUtaOStigR3PorhlzrYuVWGfVb8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4tQ8z3Yw9zGRhB21F56I+daYPM1kEVAaq0zI3tEmeM5M5Pte4/s7h5ZbTXC8?=
 =?us-ascii?Q?mRB7S16IxQ3Oc+sp5854fmHO1bT3Nr0clxdc+OXF0b6TpqY88jz35QuUoOnC?=
 =?us-ascii?Q?RgUawGlUemLU/ARyxEv41kXw+tLnW3npgZWtIraZURB5mIjdKWw/FJ43QdSu?=
 =?us-ascii?Q?87fJS5Mp1qzivcTJPoLhKKXkKWhUzbPxQb2tFkEqOAllFaCeIXUnznYabQUK?=
 =?us-ascii?Q?9c3OelxGyZt2w3h7Picj3YpZcRCwb8aYAcyePYMmt4xTqM2gsOTWVI6xxRyW?=
 =?us-ascii?Q?GWL3XB84MZe0vRoG76nz8p30SolFuN91kBTK+xB4zcs+J9QcSqZV2IFyNlg9?=
 =?us-ascii?Q?AvMZK2NzfwmnSP1pAUofWkIYNe2V/n2zaEB6bVmb1JLaKEUWpdGMrC2jaSya?=
 =?us-ascii?Q?ZGvVF3P915LYj+UOCOl8NHpt3ktRNcQDWJTqrZpFKltxmCAihgJvW30NzMmo?=
 =?us-ascii?Q?nZ16et2sdQ/fYXP4rjwtMKVVhszVRVMrA9+n+U0u5rpciSrHpPSl4lJ6YN40?=
 =?us-ascii?Q?QPA0c6LkYfCmiR0r5vU+C5zyUg2BtXvp5tTzSaPWxXbEkp6cfK5jacYcrg9u?=
 =?us-ascii?Q?BAFrRfeDEXxcRuJc0m8TbhfupSFqbuL8i3wo0iP6q9IdNl7i6IJJXyI0r7Ba?=
 =?us-ascii?Q?eIiGMDsobty+CZlvoJChUPyk8ckDJ6in35JQ8qDSZimgcjylrjex1D2wwfSK?=
 =?us-ascii?Q?UGl2/LxfeuNFIpT1kCm+WI0gsGNsZxeEM11k2OR5BQGZ7XKwVWSJFoB9yakA?=
 =?us-ascii?Q?RS2oj0NFgICCr6DX6zVywfwZU7tTkbalJSKaU1iAsUSsZQ4R4Ua/eclg8nGf?=
 =?us-ascii?Q?LgFXmjN/vn0QiIo0X2qHf8ZvbbKSdm/tQu0DZCm5CNAbkhwpzwGS1mf3MQAf?=
 =?us-ascii?Q?lVRZlasew5TspAgZ669aGXhXNhTgAwfipuzpmcJqELbphH4XJC3lS7DZui6h?=
 =?us-ascii?Q?F9zSkmDlWzgawwsHR9BZb7WmEP3G4MNtErAnQekshRrUc+o4gwx/v7wUnyJ8?=
 =?us-ascii?Q?LeJnfH3s60ZuH2n8/x5ZpXGbxsu2Bbt1JQIkN5rg8L007rTGUdIXESvbFH6+?=
 =?us-ascii?Q?qsoUQfelcXxJy7ZGypdqRyDLmqude+m6cHGTB4iqPRUYeCdh6ff2azcQxPtw?=
 =?us-ascii?Q?WLpS4WI/gVECqBvlr4nnEDlfmLfJtrzWkHzZO+gxh6Ag2Az1f5zLoYXPsmHB?=
 =?us-ascii?Q?uRWWp7rTLhrWcmo7JJ/mzHrKeF2lfmcEURoMg4OPV5wu0c7QrCQIrgoJfgY/?=
 =?us-ascii?Q?Zrlrn0+oUMSwrLOD7sJulP6kGPnch2TM7p5Fk0jrKNavBbxy9Mi4Kc/4cxos?=
 =?us-ascii?Q?cOyuP/RUXJV9PthTwnjTe0b5OKKRBNIzAYfAwwSvdEAszpubM7K88OA1cO+Q?=
 =?us-ascii?Q?5NYLOKvMUqq5ruaSIXBxP4tTQ7PTDIjM4dmywlpvTLMGTVw9CfwGoTzkR+5G?=
 =?us-ascii?Q?KpbhXSXmyL6hrYH6qHnIYe7ix03UOqOgwWMTQMvwYmBh1ZbhOYJqpeC4EQUg?=
 =?us-ascii?Q?ghBalB2IJoDoEkzGUkx6sfxmplUUPrGV6/mcmUiMRJcBkYk5OdL9hlMQdSyp?=
 =?us-ascii?Q?KLN7ShjrbhzlV5GdaAR5ru2Jaz1WUXlltXervboM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 021a01bb-5aa3-4861-0814-08dd95b359c4
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2025 02:26:09.6906
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbJpWAYQvKYWnEOGHGozvC+yvSnYVUgmUPfz0xaE8QJYYk/Q+6XnQRXJqXFnthUX6ynNtzct20Db3DZla51qDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5764
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0caacc39200ed39c9449b0b8da1ffc26e2402876
commit: 621600ed2ce5833a72f73433aa5b05a7b9fed3c5 [1/1] dt-bindings: Another pass removing cases of 'allOf' containing a '$ref'
:::::: branch date: 9 days ago
:::::: commit date: 9 weeks ago
config: arm-randconfig-2052-20250516 (https://download.01.org/0day-ci/archive/20250518/202505180943.OjGjyTl8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505180943.OjGjyTl8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505180943.OjGjyTl8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   7 is greater than the maximum of 5
   7 is greater than the maximum of 6
   hint: "minItems" is only needed if less than the "items" list length
   from schema $id: http://devicetree.org/meta-schemas/items.yaml#
   Documentation/devicetree/bindings/clock/imx8m-clock.yaml: title: 'NXP i.MX8M Family Clock Control Module Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: title: 'STMicroelectronics STM32 USB HS PHY controller binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: connector: Missing additionalProperties/unevaluatedProperties constraint

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

