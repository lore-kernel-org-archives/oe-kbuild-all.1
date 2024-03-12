Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCC310E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 01:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710207371; cv=fail; b=aJD0uKr+NgrzXwobLBYVmd0hxU4Knj9g6cL3MEAmv075QXZpeVaaGl5mqyeHUUHxSoW3Rs4Ri4st2Q809S8Exm9vM0NdcJVi8IFVJwY4gHMvyrur7+zYg56YkcM4fY0YVtg1NYRKGX6wTjv7rCOxO1GcHUNcrmw8hvUQEwqBwp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710207371; c=relaxed/simple;
	bh=bQ1i1rV2Y1Xur5nokfgX92mgP18sxXnOqiamrSUsMCI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ouIl0SpKt5ZNn2vuo3Yav9+0uZ/1UN2H8+V3dSGn/qCxYPpY3pOzPAjTI0dpKHw4YthVWUdQ/XaJa926EBwU8TgK8jFfvekFxj7/mjnSZpSeHPFon1JLJpan37PpSBpsOtrxR3CmTKe/+3HgqBKJhdQA/3AF9zMu9PBbzedpHbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IsoXQDDX; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IsoXQDDX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710207371; x=1741743371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bQ1i1rV2Y1Xur5nokfgX92mgP18sxXnOqiamrSUsMCI=;
  b=IsoXQDDXvsm4JXoMj+5gbhMcAgYCCOrwj2SpLkSeRFpctFXsnMEoye1/
   LJWizZtng2RLR26GxefOgmnmQYgL2wjSARtK9XYaUGCr7o/OnF0hPutg4
   TZN377s7g+mF9xl3Bc7KXG3xiRjnGjwDPGPX0KIb8vcApxF033M7aFmvn
   9U4m9M4QU93CQGVJGHAg14CqnFcjF4WkTwHJYoBcefNDvIphQbdtXbRqh
   /zSN+jydHDYolOhqJWyl13+BfTXsKypSYyAuk/j43f0qiKy3fm8AEYeXj
   Ha1uhwToT8nIY6bSilgNcA1RGHReB/G3NepHKfccoSBei+aDGaNqDMb7H
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="15624852"
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="15624852"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 18:36:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,118,1708416000"; 
   d="scan'208";a="15967824"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 11 Mar 2024 18:36:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 18:36:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 18:36:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 18:36:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 18:36:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n19k2JFOS5PzzkECX0txupKq2htLryWUundv2kNsfSZUKvQ9mOFRO1iRj7ZbNEghmVrIYzOm4thCKmzgXkF7vmMK6oDiha31jkvPOemmdO7vZyrxS1HvNqMnVWcAs6t0FYxFOFKKDdgZjAKL5m4vpRXWDeu2WRORJU+dJA3O7TwDMcn8HA99OiRT9TM8ZSW2o6TJUT2tzGjKr4Klj3UqYbPs65JL2kDfmYDSc55Ys6c3cDV0tUao8gECcudS/Y9Z4MJH7bK4eZV8SRrN0gFWn+a68m+TYOKUhVUpqLOtB3Y8eiMU3nkoBA+cAFnxSpzxrBgy0skwqUcfQMszwWDYhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dyLnAM6lR7i67STF2WDwYeX27xD+1DO1EoF+SCBqr/o=;
 b=CFsXixOERD2LucayKYxTINU/8c3iSPStKPiouDhEE7TkqSgmC53U4bjrfvqiMSywN2vMskvjgKagHc/TuQSSZlHEpFluJYqBOKycjAEzAxO2mOU1E5ErE4IYpvR8I1vP5JRyGMgKWWWY8Iq1k0/evzl+QWXH9yPOmV58MtVG4+Szx9fGHQzgLh8BfJG3t38I3VvSEG/tXfj3Y4GAF/10MXAUGqs/uvl7XxhLBF2/C+VZa4qZHeGAZfYAOxxebCZI0nEQ2i3FdslhCo1coqefBkG1otE9QDIkK8crDw1VXBZcME50m8cLEhLzBlKgzcEtxQnJCuJElvprmhtM8AuVZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by DS0PR11MB7766.namprd11.prod.outlook.com (2603:10b6:8:138::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Tue, 12 Mar
 2024 01:35:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::7118:c3d4:7001:cf9d%6]) with mapi id 15.20.7386.016; Tue, 12 Mar 2024
 01:35:58 +0000
Date: Tue, 12 Mar 2024 09:29:12 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [isilence:zc/rx-v4 906/922] ncdevmem.c:34:10: fatal error:
 netdev-user.h: No such file or directory
Message-ID: <202403111252.fwYq9Zbp-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0025.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::10) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|DS0PR11MB7766:EE_
X-MS-Office365-Filtering-Correlation-Id: b95f10ab-5e48-4fde-b6a8-08dc4234c4a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9bpAcMcwc18WgWOz69K3Xdh8xUuYkRdkv7zMqQpNrjz/R4ZUgK9H582pfkb/m3ACGebMWObdIvQpcErJ7xnxrTXORf1dxNWjo6WrsbSgS1HFTp/nIJW6RpGi/kQLN3owjj2U0yP2qWSFI0Dx78zuwWB7qod1Ik9weECJQkGG+Goe/lUkHX4JiFg7oYTf0d07s8IgNc8ZpHIMc6Kg/qAkKyzXWmQTxE/S8EaimBgZg6p3TCDxcaTFzpii/fofE6s99iiVIXab7GIfqt1IZQNkdymLTsUF+eHbFe3Fv8O3a638fDV+GLoa+LqYgCdsIdM+6+9/I5LhPnf6pGTkRTzUJwLcbb5yoCrLPDB6DRGRaE/FUYcUUYLAKnPdcNSPYcXMnYW6jjXqclhsJjMgEFzOPjPLOK3/AmqCRBS565FNXMoW0fiXvZvXa/HS8Zg0vPOX183gkWQlAB49tObRwHJoRH5hnvc1dw0RkSpLV5zzHARXNmp2zs98pma5JYYPLCBLUnITLIwcmHRRh3FgCh4oUby0p7ZSlDxkEpMnJP7yYjNKrtnp7hT2Ex2HIliJg2P+hpoqIzKB3wATF25WU8n0oZgiR07LvIU+e0jRNkjqN+S0/bCuiNDrYx9H0xWurVEy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zNpum+bpljRyc63wm7soWbc5DjmLJ38B8UwFVe8fB/ISr2TNZTzLOTXCQg8Z?=
 =?us-ascii?Q?BI4zl03MFD4FwDImEurPPjkP/p4XUwzW8BxPmXe91TwQOdkEeqtxSUlL6jtJ?=
 =?us-ascii?Q?wh6B7CwuloPtWIAm5Fo7HJuaYgUfjVes6gNsdwMTG95Mi+dhvBQUrZCgWCK8?=
 =?us-ascii?Q?DEwGGbCIvXVnJnNxtlg83q9dySxXYaiD47cHXg+7t2uSzugRjnFRtmp0TOFy?=
 =?us-ascii?Q?my01lz2+HF1XYtb0nwDMofwRlUve7jYX19z+XZCTHfGwr15+bVMWh8xM9d2U?=
 =?us-ascii?Q?27XzW7U5RRwQguV/qwH520gnpvV66EiJTBYKjRFhOnF0TByAETJuNKm04eyo?=
 =?us-ascii?Q?vBSUmUPwurp2J+6ZPw587h12yWjBLUtYfjR1vOJXHp7TlKQMocJPaH+lM4MK?=
 =?us-ascii?Q?aoxGdydYO+gf6vEWSmhlZI0OukY63LuHpGkuqmXXyteeFUl7SPpqguDVf84i?=
 =?us-ascii?Q?WumnXno1sEJEPRQB19yKxcMXnb46yD/TXLzuBH0Ko1L06OYHpTwqcDcp3Sy2?=
 =?us-ascii?Q?cXU04Dg/nbhGOijNnBX30+kKRFge0SWhF2kHzRZFkbOtti/k8GrCrb1K6qDb?=
 =?us-ascii?Q?5rK82zZq9Xj3ojpFCMsHfBLR8HrCvw3R2jMrdUQm9ia2aBR720J7YFrP/MDW?=
 =?us-ascii?Q?4uM6an0yRiKMSOwUHfK/9GesXF0fc1gKSh7G3tFeEQA3r/KUrrKwUfJzZWfN?=
 =?us-ascii?Q?PUbB8/x5UepqC4nifcNfbMlOsVx5BfV3gN279/T9D6j/lVfppMAJFVP1uDHl?=
 =?us-ascii?Q?6NdrJummOx0MSviESeTW446jSZV5a0nfJZtkDlcNTIdN+vMrKJdwiO5vr3sC?=
 =?us-ascii?Q?TmmJSdRROhtf6tJtNr5X23rHR9GE7YYYHMIfErC5FbnuNnq9aoQSuebhA6Hx?=
 =?us-ascii?Q?TGD1WWoWdALmSuuc1lrnaqPYTrN/OdSubdprnTu1GsIXePp5OT6NzlXzbRwn?=
 =?us-ascii?Q?0HleI7pZ4R8bdc99rUZcmoRDhm6T5GJmUDOBl0PrMTOdjjcV4RPyQy7ayDQR?=
 =?us-ascii?Q?xjmeiGARlGdmCUZZHKmz6jw+yneyj+YAWAFrm6wCrfMJBBFNW+IjSzsy9hHn?=
 =?us-ascii?Q?PMLb1z5BKjiA+Z94o6K/tMHhRThX3i7ciY7Cgu2xousJTl9oF461W1nvhg2q?=
 =?us-ascii?Q?PEVwnC8TbSOz1y291Y3D3e4UBbGizXYmtdvenFU0l4UbIz4B6hvy4DNstAQQ?=
 =?us-ascii?Q?eN9+tODzmwBHdibAMa2KrhdQrjBF/EfIQUQQwC9GLeMV9wNhzVVJMtKD89B2?=
 =?us-ascii?Q?13c2dtMxzy4yKix0BfnRKQElXc4qsnHDGUHuq4RzxWm1D2+P1GTGLkdSdKuU?=
 =?us-ascii?Q?6+TQX+/9kiTnL5JShZzuvKNw+7jKL5xSu7c2WOaphRJOZrAAkDNdUCRGVDvl?=
 =?us-ascii?Q?FE5J2Wa/Cj1kFpG2znEz2jQlTavvmGbhFsWrehgpv7k0/sexERcIIbxoIevj?=
 =?us-ascii?Q?FzWxfNWvPOh/Xu2uM5hi6fjwWHLWyCdr8lYhKOuswF+WK7TOZZTihSTN1LrC?=
 =?us-ascii?Q?MQIgjbEL4K7/52QQcVNG++EfhaZYuQ67LJrJYlJSVRSD5Isxl4B3Rv4pQd4O?=
 =?us-ascii?Q?PB/2viC0ROJGWcKLQg0SgfA44Q3kwNif2TS2mawa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b95f10ab-5e48-4fde-b6a8-08dc4234c4a6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2024 01:35:58.5405
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tnq+Bom0M+sqpXhxgImaFIInNXwNsSboaDj01YslqiqeFtVzKD5OqkRFuYIyjmmHWVrnP24BoLabCLkUh/373A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7766
X-OriginatorOrg: intel.com

tree:   https://github.com/isilence/linux zc/rx-v4
head:   c13f97bb45f13d99fc22c4452f9926dd4a53d6ce
commit: 30cb7b1a2b1cef31c7eebd4f57f56b33d2f418e0 [906/922] selftests: add ncdevmem, netcat for devmem TCP
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202403111252.fwYq9Zbp-lkp@intel.com/

All errors (new ones prefixed by >>):

# linux/tools/testing/selftests/net$ make --keep-going

>> /usr/bin/ld: cannot find ../../../net/ynl/lib/ynl.a: No such file or directory
>> /usr/bin/ld: cannot find ../../../net/ynl/generated/protos.a: No such file or directory
   collect2: error: ld returned 1 exit status
--
>> ncdevmem.c:34:10: fatal error: netdev-user.h: No such file or directory
      34 | #include "netdev-user.h"
         |          ^~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

