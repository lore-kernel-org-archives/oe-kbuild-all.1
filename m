Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570AD182D2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Aug 2024 02:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723688520; cv=fail; b=QD/R0kYrigaKqMhsrzm9EUve+3AGRsPpn7gFQSgQ7HJRceFCrgEGrycuGOK8g3BeeBjSD8yc/ozdQeOPJGnjbWsY2WGlyPPF5Yv5dbXYPiDp7uHK6Mjw6Vs68IqJJ7GW5tiZ51KLEN5UeDjMsZkl2sZrugcv5xbwFyHYwVmBv2w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723688520; c=relaxed/simple;
	bh=Z/ykyRE26tkRU8e7tlkBqIW+nZZEBvoIuOwbMNERC9Q=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oSIi+zTX5L49H93qnv4tSSx5RZ/l7LcU2prU5o3MmnxXbhbbCostBLsiIKmQMauamcqPNOsnMMvRIwFEZ+yHkTg8Tk3smVLpD8QfbbhzCXcCemDa9BRCtrKpXmo/3y7SkE374FSAPiyz8GDgOa3G3Hrc/ZDAxHq4jh4cKzdReHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SzVL15Zx; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SzVL15Zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723688518; x=1755224518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/ykyRE26tkRU8e7tlkBqIW+nZZEBvoIuOwbMNERC9Q=;
  b=SzVL15ZxppfYASb4GXnjlnVhs++fby2Mxng0A82U349GVvqzHN3Gvrww
   ItWwQZuia9uqU7pzAt1aU4i8KOnxsWQ1W/BUniuFFFE+UyjaPle+St2yH
   wqcdXIDOr/TOs8+0XduZLFBp77zvKWhDyy2w6jzMbbFqw6ylV+QDM7848
   SjG7ud0iW/VRCMMiLUTWQHh6RTFrLOEL3E2BRtMZr4ajjTJlr9A10wHZ/
   F1Nsg7zO6OizktnX1hGF1s0/UAq0hE60OD6GH6EgUSkOICPtqeZn06wiD
   AKYDxXg3ehbSgEOe/74Yk0XrNzBz29kmC+vRSh3O3xfJ3827BnZv9ab54
   w==;
X-CSE-ConnectionGUID: WNiceLfuQYO8hptHJc2PRg==
X-CSE-MsgGUID: kcuwm005QcSE33tV7HYx/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24838646"
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="24838646"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 19:21:57 -0700
X-CSE-ConnectionGUID: Nidevs73TEennlZiAHWqTQ==
X-CSE-MsgGUID: 4IgJPMHvTc2HIJiU7cSwXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,147,1719903600"; 
   d="scan'208";a="58880745"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Aug 2024 19:21:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 19:21:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 14 Aug 2024 19:21:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 14 Aug 2024 19:21:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 14 Aug 2024 19:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3eUoQ2SSmkWG1k2gtStv/HvA4oJGY1lpnMdZoDZVmjrj1aQ8QXXTQ/FrjNCZLuvDkoZ+XzWW9O9BJSjbSf4Bm4/GnovUFt2P+0En0/MgeK2ZCTF/ZWkt8TQ0kpsE19CWAKA2lemBdIJeB1S+TEKWLx3ZHqViFwT2kks5HaldSatZUjoI97WJLNaG11R4VOqlyNy9tyfRei0jZzb3C6RZQEyuUKOBRlcw+YLYSbRRJZ9C89WSMKfyfjffEJA9LzC3zAmWx/gZPnHWCTzl+vpTOuTUPq5gR/pUe4r4o0VwvL8qhye7Oe94NSyMf6FICJDL+eiNPIz/TLCIfKaAQQNNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cQWbwfGjNxbq3/kGeU1u0GDXTN5ziqkFBkhcsXsdnFY=;
 b=BE1gya6y6NUAWzbIEnSAXyJub5qU/0tgQw7Hg89/0JzHwqXUKldPTeIsIM7nBO5W4QB8PKp12BaggOt8pGr2eMM7sZd7lErShUGtWjzI5B8aDTpTl9zEeYM0gjMktgh5RvxlRR5y9WkWmIspKZHbL6KBGKPYsqCb+Xm8XXkoJ6BCP6tLNbYbtoP708FqWDzLLWv3bGGpYJG5u7pjBh7vug+a/XsQn1Jk+XhO92No6Cv5Ymqh+2BrHXp8RyUPBknxngl6mOg5WVUgPvb+LGiGHuzfEe5IvrmX632JLtiPTkseYvJD4g1vRfe8EJEN4XHD1p5hpaYmzoIgvPMKLKWBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DS0PR11MB6328.namprd11.prod.outlook.com (2603:10b6:8:cc::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.31; Thu, 15 Aug 2024 02:21:52 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Thu, 15 Aug 2024
 02:21:51 +0000
Date: Thu, 15 Aug 2024 10:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [tobetter:odroid-6.1.y 23/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level'
 is a required property
Message-ID: <Zr1mOHagH6wZgIxf@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DS0PR11MB6328:EE_
X-MS-Office365-Filtering-Correlation-Id: 7741dafe-6bd2-4952-8fe6-08dcbcd10617
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U6P339xBESHULsMp91bltTBT8i0IkmZfYyL3yYT3A1dYnbiBEvvtButJZtYl?=
 =?us-ascii?Q?noK7IB11vk6/d4axF80bGto6EvCJWYskcRDnYO3oC/ILno63SWglR41GV8Tp?=
 =?us-ascii?Q?wkRCi7mTqdZK7UgUPUkzmOZUJFQaScdEBr5pWIgyfu867NlNVBXLfSbOsydD?=
 =?us-ascii?Q?Bn4/2rdW2U7buvQdAFROezZ2NftGSJTjE87YUvSMMF7Wg0pGIjaKZqs5htz6?=
 =?us-ascii?Q?8DkFhAnZ6rwVWz8Oc/OzAmwTGMGS8uik6o8UxRa8hnxDtwsgHStGZA4JVYH8?=
 =?us-ascii?Q?zGCvkGiqudpM+ez6m7dA3SfBntnPNONif2b/6EjjKyCuo/rx4VAd6f6HL04M?=
 =?us-ascii?Q?GH2PpEuL/bOhTZTO16zfoJiHuRXuFku770Gz138mIzFwgfHYPB8b03M8/4j6?=
 =?us-ascii?Q?YUn30pnOV6pp6ImWL/EgOkceSHb616LH/OCmBTlYn9ikWEjipUqaJKlMGphA?=
 =?us-ascii?Q?0YsCnLIIEANlCAcc1uCC3LuT7/fhWY2x3v6rEKXSIw/9hi1V1azxnCsFJ0SR?=
 =?us-ascii?Q?+S6+awaHvW4pBZWPnv+Pd/DunQp6fxq8zugI+zxD6LvocPo+IrpZkKrFJDVW?=
 =?us-ascii?Q?vbzFJA1wljqERSqWxg/BYhk8/3KTUBm2WQWjVdoVEiYS29B4TtYcakdmpVAz?=
 =?us-ascii?Q?QxT18bV44D43zDjqvDmtsuVp//qpVwDeC8W0AMQhJKl6q3I/q4XujMLFUGuB?=
 =?us-ascii?Q?JUr/DGtpXnpR8eUdIrC/zCoQNpHnfa6zhyblUVwTri0pyfdAK21zWVZL8V1Q?=
 =?us-ascii?Q?pVddu7uywItuz2v3hPyaC6Vz/fNrQhanBy0cxKfj6cVoMxvFhAvkhbbJXjWg?=
 =?us-ascii?Q?2tRD7eqorcUDBHgRdrTpTXnanjdNQrcp9frqGJzv1ZYqYQZdDIBxfcQPvWqH?=
 =?us-ascii?Q?wVm3sh4OtAVLep0RQlvAWi/9bNV/gXccdirbtdZu4MPdhhLw2FHN5GlrSb1H?=
 =?us-ascii?Q?M7K7DdCpgV+FQIAhPAoaRfYgFEBmuSGUu0MwYSuRo+D1zzOhB+bCONAyU4eD?=
 =?us-ascii?Q?leQ1xzVUYQ6IHkrQb69yTCUbcCdxiP3yKJ8IrX1MyCoWwhCWmVNBwcc8fymY?=
 =?us-ascii?Q?ziAwilLH9kUeKgn+LtWpbudXT8/IRU3AxDxAZVxbi/N8/5aO/QK/LYZTOrbq?=
 =?us-ascii?Q?hHwPyufFKJRxbeHQ9kVGl35cNtVkIfZMhMWR0Hdmm1tu64GHfwhmDaFRtZc0?=
 =?us-ascii?Q?3sBXewAHJwehfwpohSn0uA+XSkT7A9DTzkNQ6CyrS6mZeC93WbjeJLP3uCNd?=
 =?us-ascii?Q?PE/y1fQHOb9vFyWCg+/J4COdsPo8BV2x8l5WbLZd8ijWarRO+0S50O2EFVkA?=
 =?us-ascii?Q?hpc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rnk7yyjxiLuawIJ3YFDfx15uk8HGCKUywjFw6KsL869adB93mn/NnuM7Jo38?=
 =?us-ascii?Q?Mte95YfmMiCbJB8NmKyUVK7vJCmoQ6xAsT9LEweWvEekxXdDs9xyLr6HetdH?=
 =?us-ascii?Q?r7AK2My7RXbi/5sk2akXJqMxYdd2B6pqMGKhyC+fLK5ogfsfDIspUWkt7u9o?=
 =?us-ascii?Q?W5jmDnr4nGK8pHHOK6yVc+Mpw4IUpSc/eoGQtrCqpEyY0PWd63kuWZm1XIEd?=
 =?us-ascii?Q?yxUj3V5PkmVBIJ0/tJ9g2zF3JUCEVcpgXM5DAP4VIRiqm0WwnlgPELiGyC2W?=
 =?us-ascii?Q?vnjWG7rAQnUrauk1ik7vNVLGDarYy/fDZ/QSwhhyZN9e6FBpMmnA4ARriNPD?=
 =?us-ascii?Q?S165edUbCZ1ZuNtzhXUfX0SGK1RoeH0eN86cnv9kjNh+X8ARtl+Y4yfonrhg?=
 =?us-ascii?Q?rtGNIXWcMRbrueGTVtpqMJmRxMzxE9kpGlyU/mTwuFdONQTvKvGm5Xq133Xl?=
 =?us-ascii?Q?jbHs0g88DbhkAlLin2pJMcIB72mRhMvzJOZ0sWw+/ckXqjqRZYwzzcz2YN1v?=
 =?us-ascii?Q?1sHm7CAlCI/vXYuVKc1P7/7uQ9/RKRcKVdvsQ4EpUZYUxzWRYObJhyosImnY?=
 =?us-ascii?Q?gFGY4hs3iFU3E70j6mvDCPUg/8Pwgipbcb8e0YxL1nCRE/JANEWSlxz6kMFB?=
 =?us-ascii?Q?ik7Ij1tBEGCOzZgQKGiiX1HmddYJdM3gfXy+qavbRg/nZ8ZWpSaPkdXTx+eB?=
 =?us-ascii?Q?L9ooym+FzXLe2+BJoZGJQWdrj7mL7V3ip739VqPYIdmI93ne0xT/ouPRXVQw?=
 =?us-ascii?Q?Rw6SGPZKybftiQc3XRYD94sgWFUUzLbh06xVHb4Vmhjz5PCJvm4HZIQMuKAR?=
 =?us-ascii?Q?UvEYS1f+FGEFri4InMdCTBEl0mNEi9+J+s3w4bMEEsY3W7VGkxqZHworQ7e7?=
 =?us-ascii?Q?kKPYIJSHPdr8fgMa74fbYD4oO8arfbqNjQkGZvdqRPkksUb2aQ04ZsLN4gZs?=
 =?us-ascii?Q?W9y+4j6L5lpCwrcndVJEtr6JN6KxYOMjg8KGIwY7CxdwLqXAXWHpvzsBHA2e?=
 =?us-ascii?Q?9D2PdYK3fV+mP5fdH9Hs8dZ+2PAZ8+vRhAgFVVvpaTrJ9bNGmhMgAtiGJIrj?=
 =?us-ascii?Q?1I02pK2TeBN3abpwCIpxiob8MbL57SIX3CxMQJrjvRuSk/1dQ03rfF9rB2lf?=
 =?us-ascii?Q?LbcWBZs48vZST4lxsGnS5WgurwGvFHvv3qRzRc+dBicQHd+VKbHhP6YQsPrW?=
 =?us-ascii?Q?4mzSbwNhFCEwteiZp8E8cO3mknGerdF4l3f8Vn23jTK9JS4bAB1jXv0GOtXD?=
 =?us-ascii?Q?1Awdh8el6TO/JRrukFjHB3ZGGo8RdZi9/V6PNik3UGo871mlRmnBnrBP3Oqx?=
 =?us-ascii?Q?zGreXzjyA0GmPTFp2+5Z5qx4Qt2GQJXY6G5ee3MSIOImcj4aTuivPRhmQ/wt?=
 =?us-ascii?Q?VfDsL6+cfoJeIW3sDG5YjkFVNh42iCdZVbKbN3PFqwswWEFj8+vC0bFkvmox?=
 =?us-ascii?Q?uNP7TpFGRpQrMjv1EzLRtNwVm+vz/20nxxc+dS/uZUPtphihYSRLx7n9Y5Mv?=
 =?us-ascii?Q?O/icyWs1CVCWj9emmyWu0ETL/jMaTZXWC/nsyv8z+/gGCv40/eEhCT8P5Ey4?=
 =?us-ascii?Q?JN5rINT3dRAlKlTFHQwjdrjRXavr4n9kORpHhUzS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7741dafe-6bd2-4952-8fe6-08dcbcd10617
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:21:51.9239
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bXjdokCWQEwZj8Su1QoAzcedWbVFhp2aTaRwGwxIOUh9tFUMTi7Mere/5X1fbMG2H5fUd2H+2qmIP8CUoSaoQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6328
X-OriginatorOrg: intel.com

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2ab07fb3568ffe3b7e17805f28619cd38a41f370
commit: 5e5c31f1c11458aabfa51021f3e0319bb051330e [23/91] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240815/202408150148.kgn3fUPd-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150148.kgn3fUPd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408150148.kgn3fUPd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:252.29-257.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: scpi: clocks: 'scpi_clocks@0' does not match any of the regexes: '^clocks-[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scpi.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/clock-measure@8758: failed to match any schema with compatible: ['amlogic,meson-gx-clk-measure']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0: failed to match any schema with compatible: ['amlogic,meson-gx-ao-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pinctrl@14: failed to match any schema with compatible: ['amlogic,meson-gxbb-aobus-pinctrl']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: bus@c8834000: rng: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8834000/pinctrl@4b0: failed to match any schema with compatible: ['amlogic,meson-gxbb-periphs-pinctrl']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0: failed to match any schema with compatible: ['amlogic,meson-gx-hhi-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0/clock-controller: failed to match any schema with compatible: ['amlogic,gxbb-clkc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-0:sound-dai: [[57], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:sound-dai: [[57], [0], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:codec-0:sound-dai: [[57], [1], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-2:sound-dai: [[57], [1], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^dai-link-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

