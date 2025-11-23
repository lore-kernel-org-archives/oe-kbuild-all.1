Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C8D1D555
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 06:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763880687; cv=fail; b=Tcp9n8q4K/vklnLfJkiF6KZzLykYw9h0gLP4NTHbjTRmV5Cl/9X3jdbsaFTQrxbtd7i88JxcuiATff/beZo8idOS6BVtqd22VZzpGw/MjPOmR+LnwVIqezyfzjLw/tPtFYNoI0j5SUbhDybJVnj1UiiVx51E888pFHevZ28j3qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763880687; c=relaxed/simple;
	bh=KzlsV48+2a+gyfuWtZjG5gCIPFOPH8BzP6cOXySNjIY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=jsOzIoy5jZsqNyEHTG/794d84ZbDE4GLCGVE6WXzQF6h2FnhEqwAyGNdlEJEasB6q/8hQTuv/9NgHt0LAEbrS87+AHrsSNPXoGRsCHWNrVbGgIQwnneSr6gDU1TWAlhk7E+6k3ix8rnzVGraQdZabjP1nH2x5eug55FehkZbBzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HN+9QRnT; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HN+9QRnT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763880685; x=1795416685;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KzlsV48+2a+gyfuWtZjG5gCIPFOPH8BzP6cOXySNjIY=;
  b=HN+9QRnTkI033k3N/PUlq+Qd8qlFojy48yrI2jiIz+fd+QCl84ZfQgBE
   kqXylIWd+xsne0OUNjrXVCxLVcFzNcHP11s0uP2SxfVbHUk5ANmQK443f
   XirpRyQwM/pSzlqyx2SRvkvqkZ5Bja/eI0k8TsH4djTVPyRGQNRZYILix
   Ezc0qAxbAAuYl0QZVJLzerXa5FQ62k3W1c9O989Xlog6ot8Edc/zLwYpK
   JEtNUbnibLANUqWt5scPgv2SgrdcIBbsBSiZlaXrvPqWmURIsazjgK4HO
   0AtKCDn/IPU9hRdxbKixCcxW6/FOIluKNyHdWqO2dszLUKZHHUYYqaI64
   A==;
X-CSE-ConnectionGUID: 6fdK6z5DS4O5grfombgqBw==
X-CSE-MsgGUID: 0DCtU0KuQTebKZ3oDJGILA==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="68511582"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="68511582"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 22:51:25 -0800
X-CSE-ConnectionGUID: ym4K+NJzRLC3JG4hwQtoWQ==
X-CSE-MsgGUID: sVCuTgwzTFWMJLrpY62TUg==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 22:51:25 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 22:51:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 22:51:24 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 22:51:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uXSadMwAsGiSe+8amQuZbMXHq13wBaHAWDRoPIPWVEOCFkzJDqxLNW4jOhFCzrEZOPBAhnVs4WgL7HeIaqP6/U3BR6TtcYi6nuy5U/GVaGzBT1o0uI+VoFC3zkLxvsrPERGLKA8nfHl/eJn9FXKmQeg8oTravN0G8LfudXRzU/LT9Yg26/dfOLHHBF/LZDpUavc0Lk0ilj/d7K/11DozISCaSo6TaqCkbVO654r48Ti8Vbv+eGbiI2mDsha56x2nGRUv1dIXiMEO64EYgPxnVkkub3myhuWBIY6WMVBW+yPmaJ7b0pevolmuCZ+y283zvamOEc+X90e0AS8c0Sxt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=72SN92bbxbu/mauQjqJ28vzbkObVqxePm4f30qv31ck=;
 b=BPY7Lfx/MJXbebDkycDlDv7IOq3OKzDHcmf6wD65SOjrJkQwmZypJnIX970HLYeCZSBU9Iw3tCPM/+iB0pIgYvW9XPWXpVQaeCF+YBoe/NnuX/JbknLg0UgWrsaUc0chMIJ2SA4qx8GJQQb7LH63PNdIjlk55GddhXE+4EZbA1J7dh6J39O2C9eFfTzpNzO1vr/nRCtiCkIHWVA9+oqno/Hd3APWd+flJN5ZdiPcjQoQkvnw45xTCKoCA7UyRZEIZaV0TAcgocpL3HDhH7rLnd0Izv7GE+noSNTL07dqsbZp+pBsC7rS+LH7AXNJHa2XFhQsbhnSPFlH0T/iWmn2ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by DM6PR11MB4628.namprd11.prod.outlook.com (2603:10b6:5:28f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.16; Sun, 23 Nov
 2025 06:51:21 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 06:51:21 +0000
Date: Sun, 23 Nov 2025 14:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>, Josh Poimboeuf <jpoimboe@kernel.org>
Subject: [jpoimboe:objtool-disas 32/36] /bin/bash: line 1:
 tools/objtool/arch/x86/lib/cpu-feature-names.c: No such file or directory
Message-ID: <aSKu4XQPqRrOpxPp@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|DM6PR11MB4628:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ff59f11-248e-4b55-4281-08de2a5cb615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b3NiO7jKPLQAVT4IAhIveWpTrgUFX1Q9U2h76JjbkFFMWlM80FCdaAWBIOEg?=
 =?us-ascii?Q?OssYVIcJACstbQ7GOluN2RUAdWNhFsC/kKQHiS0Dh+HJUAiBQVs1O95Tr9xQ?=
 =?us-ascii?Q?pX7wI4al/8ytxF3XUsb04Rn3F07BhM9zo2r+ZyDbNZ663iMRqkA8rOARs3dc?=
 =?us-ascii?Q?LuqqlwTHLJf5lJ5InHOWi3AWmejoZlwzLYureRYFp+wFchCxZ6P0k/MVE2pD?=
 =?us-ascii?Q?JMNg+2SsRc0PNamRylT/ldkoRc4mxGPxUxyVDOmp8jLMcAN9GEAI2nnDK5H2?=
 =?us-ascii?Q?b5NKfb74KElIJkH5ghfinSgzkZ3fG5AvfVnSPCqRiNAX1nDnEpPAOt8lPyXj?=
 =?us-ascii?Q?uhQQ1lEFQXSmLupcuzAr4lhLC5vM2Ki5yZPDJU/dmiVOOZ3Atzm8X4nUkxFU?=
 =?us-ascii?Q?w86oAd3KMFlUXC9Kyt7x+aHSnV3Ql3NzSRC/QGp8epu5FTOfOwcS0/4JIlex?=
 =?us-ascii?Q?g9S69oD0EUvc6SXJWDgWKQ4L/Fln1U3uNCkSBidEhLKdbyH2Ebfx2w1Pn880?=
 =?us-ascii?Q?ZiOad1/v9mkboIO9CJTR8MeW3yDXC4Ua3cs66f5FsOrv/LuGxcHFhNQ8Cnji?=
 =?us-ascii?Q?v0xV8c7gJAJJS7TxhNYkQ0/N7xUWzd5iT/if6L8uPF+cremLpBS0fHQgYKyB?=
 =?us-ascii?Q?7ZxufLgXc2KcrIgAS3lzRWNbn+KSyvrJrj0cShxVKQ6chRHjlMa3CbnMH3Dj?=
 =?us-ascii?Q?G+CoZlNTGXzzGmHJo+W3i1b6izg5AEtIosg5Qwkxo8eXwv9dQjg14GHV6eP9?=
 =?us-ascii?Q?jp4MA4HVR3IaFjhF5AcjWUZr2DjnNS5idHES6bIrwH5VLLFur4dzOQcmxD9k?=
 =?us-ascii?Q?U2Q3EGnS3HDINDWWn76Kffam5RYwwbI2exsjEeL8EdXxNTtwWRDT1U9rLbWp?=
 =?us-ascii?Q?HRrmi+cnTi1kpCoDGybMdhsIlCMx4P41wbKMWdekuX+QIbKfSeHBA2JRgTA8?=
 =?us-ascii?Q?iqT0vWSbADWP3l5RaWG6hzM+fH700P3DGHmXz688HzxePK4jY+g18uOaoljU?=
 =?us-ascii?Q?RHXeglxoYda/l9TmG+fKTD9Tj8fdWbuWOUPgUjgyUktjLHpd4KL0mYOE5ez9?=
 =?us-ascii?Q?Lt/VO46UJwIQ0YJXERE55zNxpR2jLo/3YTOa4FAVRlbHT/VwSlGZFbZpnFnv?=
 =?us-ascii?Q?ZOVik8aP1ZoX8EJhvG1QnQyx5tSrHzlws2sIil/PvTStEIPNahGI9M6RgfBC?=
 =?us-ascii?Q?WXsdI17tMnCkCVwZSwVUd9p0Ob++XGMsJWsihNkUwyU0C+d9y7aRi3svQXIz?=
 =?us-ascii?Q?m1af1G9u0nWFN9+hkSdXnU9IFg6s1PLf6tpQXgGTYaz9j5/Gp7i2umH7y2Jb?=
 =?us-ascii?Q?9Qql/Q+ZVG6jvLcrXbIRHAihmbqitaBJhfjnf86z3FDrbLA/gN9hAd2upiiN?=
 =?us-ascii?Q?dtvJMrC/0C/ybigE8cXkZisFgFrd/XzsHWEc38e6oPT7SwN1hAVDgMaXmBIq?=
 =?us-ascii?Q?U+KFuxXWN3RRqbZEZ6v99Jxp8UGMCM9R9QDZe+XxAqww8OhmAqMV5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L+iTm7VUPMQrysIVNKHAOS78veQnQD5+uTW6rbZMMbjqSuhNYT2a5nIqYbPf?=
 =?us-ascii?Q?m8asJoZJMRPQ+ZmZdi8tlLwKPzTtfxua/azxAVgpQoKT6sO+iIKZarBaW3vW?=
 =?us-ascii?Q?Vyj1C5yOQrdIkUCWofCjgeGrAw80TyrQXjO4rWiogEnvCnHsEp0W+M7kZZpk?=
 =?us-ascii?Q?9ZPrYao4jWvBecKEEdhAnaLoQ3vhmxtJNG+ZYlUVl6ACcMyQ6VqoTOJgdFsQ?=
 =?us-ascii?Q?wJ+7U2OJcZeZkGuJBZWG8kT70JkNBKILtJ69Xxo+wlq6xXN+z4NRxoxo5cEu?=
 =?us-ascii?Q?987DBi9jX3Z2Z0ggdGW1AkZA/1ERGwKbPuXJcnyhp3KcPqTSSOso2NMT778S?=
 =?us-ascii?Q?4/TFrgjSrrTtw1LnmvQnv2wRXIoyK4xDqYOy18xn0y9Rf+9V5kIjSqWK6emM?=
 =?us-ascii?Q?Vbh2HesqnV0Z6PV6LFhLRsfjRW493z0OBuO0iov4fWtUUAMHTwuw/csk8L6Q?=
 =?us-ascii?Q?zrU2vjb9cl47f03j+uaJk+/2NshQmo9L+sG3mZZSri/OtaTgTB8IXuWxZUHa?=
 =?us-ascii?Q?yv+AybFTgXg3ufJwjdenvSskpSx3BP/P7RBbQIuk3VYgozpN5XiaxdxhQSRi?=
 =?us-ascii?Q?gRg1TWicSnY7IWP16gCpP/eQ9bCFLij+ryB8G37w7MIHi12Wa4GR1voYLXuM?=
 =?us-ascii?Q?4qAK4+RRGNN/H4iaQ0ErP3my2QHpIKAukA9ktbqkjGkJ+yNUztRo8F32RqPZ?=
 =?us-ascii?Q?6m62Qa57aXhPMZeq2dIjuNGmAUQytfxqZdbpNefSAzcRjx1pvgQyneDlcNHs?=
 =?us-ascii?Q?GAtSm57P5GEyJ9/iDoqqLCXqfKhGM9CkhdJ8obhwlalvLpAThlQ4nPEDrwLi?=
 =?us-ascii?Q?F+DMkClcNfuUfJ+pzwz9LhjVFf3hBt9Jdt3zD+11DcBX9J873dX+/yPSRvW0?=
 =?us-ascii?Q?V1EPWLWT2aRb5bC+KcsWEk/17Y38+WkIY8q8iadUz3U4XJYMIhf+aMN1dNGE?=
 =?us-ascii?Q?gz6o3JdzKh6beW5cUq3oR0TFXXiWG6I+JSh3r8CYiU3wxZqE4oqQStSVgRjn?=
 =?us-ascii?Q?cLrbDXoPiYLkxh1CgjjAqobw9TFHKXmccGCz7Lh5r56WCMIvCpZtJhI5v5lq?=
 =?us-ascii?Q?h+v9N5gLdy6HF+pJRgYi2aH2/SkpNSZ2UoyEIGPh0xwml3I2bOH08um33WW7?=
 =?us-ascii?Q?/wYYKDlbkvqpqhPh28Zdiwh6N3EbNRbkVtFuZPtEKymoNTjJEF6/FrQwU30l?=
 =?us-ascii?Q?Dl5y7i/zgIMGrnh04bVf9O4dJ6OFyH3X3vCIj0urzIADM4hAJsM1ZpikFAdZ?=
 =?us-ascii?Q?UdDws2USzGJilwLr1uNvwf46aBKDbXt0Dyl5pABFj2E+sOr799EZMa+BEA7i?=
 =?us-ascii?Q?oSLqS0ZvW1fRVIF0p9YwXsKePtOyhhrMwWqzeWmif6i2fHrH5pETch5Rzzst?=
 =?us-ascii?Q?p0ZTS9H3JRV8HcDbelbZDjEXg3uUxdkLAHuSOEVFjkLTLRqo73nq6z0A3wLi?=
 =?us-ascii?Q?ZjCK77SX6WE1wFStzX5HHzrr+el+SE21Iqk+1i17ditxEkApYBFhIcoGNg8E?=
 =?us-ascii?Q?cQsOOxS9SUehKx2FMC/rR2LGuaMD7lfIq9Am6pUmivX4XG+MRKL280T1I+Ao?=
 =?us-ascii?Q?tzfAnOrWAINWn9VRHP7GUG6S95GPBtGtkTxC+N8Nw48eR6IkHMoRsxq/CzDd?=
 =?us-ascii?Q?nQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ff59f11-248e-4b55-4281-08de2a5cb615
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 06:51:21.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VacoHsvouEsMQtMzAu/fsRjdLTFCAPff5nr/oSQ8aEu9uEMlvY3N/gioPTmMduSWUkiwawO7QHEU+Mez+lMT9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4628
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git objtool-disas
head:   96068f92207e9c2a20b7b8de4809b09a23f5e96a
commit: 1ead04d189cea9f5ccd9b14c87cae01416da1c1c [32/36] objtool: Function to get the name of a CPU feature
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251123/202511231218.9diFdBQ1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231218.9diFdBQ1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231218.9diFdBQ1-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /bin/bash: line 1: tools/objtool/arch/x86/lib/cpu-feature-names.c: No such file or directory

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

