Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0E51D958F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 23:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729206842; cv=fail; b=H8ihHgBDAio8eeOJwRbCfkSavE7qT7c3KYzBYMsuB1usI76rVqLtzw/RaCVSatA2gvOuE1J5jeTqpLaSHxxbDx+nPcTj2wLfQPhS7Noaoe2Ii7hKLWipBep3DADJwOIG/zcK0FYWV49kaa5Q1AuqO3bQt7Nf/ehUa9/Q2Umoe6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729206842; c=relaxed/simple;
	bh=HPyKojv6Aiv6QeBB07v6xiL6DGNcTs3qg7bcKFIdEpk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mv4FQcXpUDch+5beAOu4l11KYX9jNoyLAqTj3OXmTvxHHQDTWPUoyJVzx76c1blJihC50MaIhj14mLDMmD0zulWOQJMf1FPFHIGOsVayLPdkNAMmvOnXA5Wj1ZEvb9SVix2DaqbXgUY+BVJAQcb0OU3DiSEBKHW3Mzri6vwMIQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7Il4iv3; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7Il4iv3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729206841; x=1760742841;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HPyKojv6Aiv6QeBB07v6xiL6DGNcTs3qg7bcKFIdEpk=;
  b=K7Il4iv3mDjCWYsZ1W9mcx7Swdj56E/USCRIS7VCB1xKwMgaAYpfBLHi
   9z6H3wMdio0ae3pO88XquS1NfOhLUAV87UCsJQOYZkeiWkJ7QZeokG5u6
   yrqioI6i9BRu6dDfBD3CNDil3j/98PkQsZgSb+1XI+q3MrZMWhLy4Wl7Y
   XApX8YtlhlVjRlzs0juyPAYZN/dEbfp4gjU/yzaQQxf2S6UuJy7TkW8+9
   ehWL/7ArAfSfOOkrIytfSxAFYos1ahEdlqZDN6rEERiPYh7KLzyjD2iaf
   aEup3ibRm4P9R7m8g64criFRXRcNV1Tm6y0SAhAJFW+SHZMANfPZfmxb7
   Q==;
X-CSE-ConnectionGUID: eFcTFtzyTVmQuhZcKbXeKw==
X-CSE-MsgGUID: x9UobKb3TFKWI5JCOpsW9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28513590"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28513590"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2024 16:13:56 -0700
X-CSE-ConnectionGUID: HH3R5KsdSgSEDM6kbvm8JQ==
X-CSE-MsgGUID: zbX9xFRwQcKPFCnOAd7xNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,212,1725346800"; 
   d="scan'208";a="79128287"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Oct 2024 16:11:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 17 Oct 2024 16:11:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 17 Oct 2024 16:11:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 17 Oct 2024 16:11:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WKFtOQCe15fpvXXBJupSacbdBpkjpco2d8sjyinoBEVMTFP0NBneZSq15tK86Fcd9vXMnQCj/L9NHorkIBniRP1LIhGTryh5bC5RyOSIQpxH0mMs4dguvupZXVIEVhCt7FEhvABrd9lps35Zc7pbgiylN2iipdgcGIQpDmm6p61tya6QG/tO2k4Yu6Xcr3Q0lXgIWEsdBi0nPdohekK8Exoyd+CaHCm+2j5zKqkE4VDgfKNUyAg1TT24sxFwJebFUEEU4kCnWDOHXFJoQWVN391Acl3qHijRVM9ppKLqBIdFX8ogmHnkwSjudKm2h4M62GfDY81OFei+Zf865rs1Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mx5Grr4f7kTrCr6LunjpepO9BIbxtwrw+WvaQJsdZnU=;
 b=MvaxK8nBw2AHoU2v7XBRLLEy/A3eW++dDYrmRsnj6fjhCU3P2L5qeUHe5SboCtS6xPCxSJFupDdlsZFyh2xLKR5lQHsBYNI2wK+1OgronjHjEST89PJNHddqOcOrccHClG9iHyzOvivvENp/eJIWSASBnCxcNmdYP2nuZX4y+HAUoC2xqIeNs3oQmmOiol6qmrlASJxzIV39P3GtIG2SDUZZuwnLpn+QzQvhiHMFKHvrLQq3nHid+1FwO/4fhGdxATtfCvyOHvISHH9HiNS6zYQoqq8BbUTvY5IVfQaXxFQEQ8gEGB9CRo1tUSBRV8LbNPD3WixiE6LveThZemFtSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SN7PR11MB6775.namprd11.prod.outlook.com (2603:10b6:806:264::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Thu, 17 Oct
 2024 23:10:58 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.020; Thu, 17 Oct 2024
 23:10:58 +0000
Date: Fri, 18 Oct 2024 07:10:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
CC: <oe-kbuild-all@lists.linux.dev>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 4889/5321] arch/powerpc/boot/dts/turris1x.dtb:
 reboot@d: {'compatible': ['syscon-reboot'], 'reg': [[13, 1]], 'offset': 13,
 'mask': 1, 'value': 1, 'priority': 64, '$nodename': ['reboot@d']} is valid
 under each of {'required': ['reg']}, {'required': ['offset']}
Message-ID: <ZxGZefa4fr4h2PnJ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SN7PR11MB6775:EE_
X-MS-Office365-Filtering-Correlation-Id: 73205ab9-33bd-49c2-8b82-08dcef00f5a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cbSP57wiI9l9936L1bH9lZGEBCi+CAGqfCRzzT1vyAERcpgVmHllF/fC0wa+?=
 =?us-ascii?Q?1Fi5ExFIjE6FUl9EZ2mfr74AWCne3zWsAOEUlC8vrJNqbsoULIkg9e1/FBzz?=
 =?us-ascii?Q?E4CW2iG4DY9dEbi4w3E1eq5F7fHlk/PTgwBQmdGBT5Vz7Vfo3aTA6lWWvR8e?=
 =?us-ascii?Q?nsyh4ZTj0dxp6INEAasxZJTD+jfch5ClXWaByAYR+up7f6XJ7wHTTeq3vz1D?=
 =?us-ascii?Q?R1rK79Icul3JpK0yWbSUdLxfGNsCPbMx/Vog1eAWF1U3DsRjwewViBdkmV6H?=
 =?us-ascii?Q?3jRe/iWxO3j/PHZ3nVf1OEf1wpuAfZ931CNr5xeKmZKvqGSGutcZu8B5gTw3?=
 =?us-ascii?Q?geVyejugEiurc/gemdX06AT3C1siHl2JfUfxMJ3ST8lbynFc+jbLDJOPCoA2?=
 =?us-ascii?Q?lanTQWjVbgNr6gfYAk/VG6qAHdmA6DxVPJkD1BLQ5prZrD67GSVDnAHbNA8c?=
 =?us-ascii?Q?YEFz6z9RaKAwSkGWH3Co+0ELMbol9PHHdR1Hg6jCFRuX58MLk8xKzd124Q4V?=
 =?us-ascii?Q?gRTJBS/55Qisgg653fmlJgK02BBxkzn1yo7P7SPtxksnqMxiNbUYs6pw2GQw?=
 =?us-ascii?Q?70DCmfW4ZYu9t5rXo/Z8793KoslZmOcUNZ4BZDsT21xZBFgbme2nZZBc6s5M?=
 =?us-ascii?Q?A2QjTJoJaGX3T/Fupg5zHGe8BYG4nv0kj5KmvXPyikmF7uoph0LKxpASJen3?=
 =?us-ascii?Q?VsLwoI4Jn9mwELyoCbkP+4gWkkigm9A2v8sqn8kaZfpFrlYgpC8NdnQg2Ojb?=
 =?us-ascii?Q?F19aJ83fbKF6atwbnpZyqkTruiIrwgR287fxJe+1Cugx0gdtwhHuwf3mZjrJ?=
 =?us-ascii?Q?vykTnljccEQTos2yjKx1xiq8FdUzYBWJfHbrxLTS8f7Kn88myUi7NBJskzJp?=
 =?us-ascii?Q?KaGtLCHYbwGfv8z1ZrI+9UfxCSwf1jgscpOZwRnjAltbZk7FN/8hdBNQdzc4?=
 =?us-ascii?Q?ifvq7cZxfPkRjPK8BGR9oyNq9+aXRre9fJTE+CMxrpJFz+suqN1dvnxXnxfW?=
 =?us-ascii?Q?6e2P06JVuEw2pPZMdHUjIbL/qmCr1O4ooWt/qUF/+LBq5zhOPgMs5V2IphLt?=
 =?us-ascii?Q?kuh2oBNRuvQkkGQDELoIFrkwGl0bTUfjkosW0drKRAIsPVqLJr9c4IzXKPli?=
 =?us-ascii?Q?yP8ZiAQRllv750jTpdsI0xSjJJNY8emyqt3HFP/CwCFbI26UWeK3pMlmCb+t?=
 =?us-ascii?Q?WytZ+SAgTZNiCa3hYElDc2CXcFpTgtjWG5Xuf0zp0Z+DvUdBTvvLffmBIW/C?=
 =?us-ascii?Q?7B43FcLHZLd1dHc7WpK3dEta1B6vyft17CTaEBaaNVyQIJCaQOLiuv1y9Mvm?=
 =?us-ascii?Q?e6K2iXEPYy2hogfvy/ECubin?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kB0btKY0NkqhjEqkcq8TqIKSeS1eyyIT3u4bHZE9FfX1I5fHCwqs8viOYUp0?=
 =?us-ascii?Q?8rGOrG3KUCFtEAP/IT4nuB3VI1X2UFXfhn0AdXU5KWbMlFqlpAitM3Ck7tHh?=
 =?us-ascii?Q?8VTiqrsbqa2KcWX02+eY5lO4g54aCnGq1a9O43SO2YawrBmlTSCxBKUFui6H?=
 =?us-ascii?Q?RknSYcJMGmObn2lcGdEgByfOOJgMhAPyLKrYzQW2f+IdTeKQTPGo3HvQ+hIe?=
 =?us-ascii?Q?nBJoaOjhSfm+IB6GWe1/MQET70yYSAATSxM9ZsH9HTzCUo8kswevU+Iz16Hi?=
 =?us-ascii?Q?U8JpBFbIQqC3ZQFFu+140NTNAgL9I+6S6tVD/FB3xg2oDtpgHybtUFFkhUOC?=
 =?us-ascii?Q?WkDLvoye074W5m5ByY8YBcbo5U1CJx5uIP4U7NPRpQiFA5mjHzzhrr+KM97k?=
 =?us-ascii?Q?1/131dJiQZg42e7WeCJeit200evUN3nAcX/Ik18Iig/n4vuIDCAW3BQTQO5G?=
 =?us-ascii?Q?dUR551ifrmvNyEB3gL8D4SobFx7Q1XFCZiuE98m3LyeTjz2/SGy2V9W1B/vd?=
 =?us-ascii?Q?nVR3tkT4olPneCiqJm6JswbwH3sWnXQqBwXjETsvytxsKgyb++wYNfFdOA4V?=
 =?us-ascii?Q?Cwc4ZOZrxtR7/dQiSXS9y2h9Pg8OQtQY0GgDec2G47sEhcwX/uUcdxnhBa+m?=
 =?us-ascii?Q?ecVelXHr4JJMqT8jqx3/BfF1rVu3hQmUySCqBKoDpLAwzCWAGkODELAnMwb/?=
 =?us-ascii?Q?nXma0F+481Xrd0dS54vVO43HAmw8L0NCRhQqqiqsid1+vfY+H4PYaQpbiqhg?=
 =?us-ascii?Q?6s8yRChp1TOkblvgq+SEgBzWpDacTDcsExx755/kohYqosIpRAF9+2isdKOk?=
 =?us-ascii?Q?40zoZaTUdqSLBTbmywXoQG5fHXwYfPctS05uLTCMdwZgw7UAXM1/sdngJix4?=
 =?us-ascii?Q?Uxw03UjqkHUofKRaku3dmY5r8NcWtsTsQV4bah5Dm7ax0Ur6eF+TuSAQOrvj?=
 =?us-ascii?Q?lbxPdVD2m8YfwSoZew/puMnxz15w2dmS7iyT+d0+j0LKxSUFjB3c4zsWTifm?=
 =?us-ascii?Q?/xnoXn1m8xtCDNrNjZ16zPqmB9bZNJ4xwtdTQSdxryTtb8YREKhcssT+CqyJ?=
 =?us-ascii?Q?jSApCcxFs5/7/6fhZ3BX9Dt46p+OKIJdcM8Y958FFndzIoEC4/OGIKG2K9ai?=
 =?us-ascii?Q?Lizs8hb6WdGnHF4eVUZYwfDgLi8bf12W6Pk+3n1GBEEC49jcudoYUwLJVt+I?=
 =?us-ascii?Q?yBBPNFPoloWtyBvzNGaA7kJo9LISv0w/dU1fofV/igL9f9qC16j/ou4d7NQX?=
 =?us-ascii?Q?tMt9nUnQHv1OTUlVYkVMB1lw4qkDRIfWQF5AomakcoOq1Cj6pY++h8fG6p7i?=
 =?us-ascii?Q?NqTruPRoPctJiJg4Y+of4evaR5cysQpHhB3NCIRDWH2SFqLJ4hO4qREZevhL?=
 =?us-ascii?Q?pRGgMSMPNYYM1zvnHknqRCQn3Z40Cgp/Qcak8PmtlEb12MjbiS9ZUdU8bXqi?=
 =?us-ascii?Q?Jc/TzYTY1FLWvgB3rE+Jt4UvFcDXLIBbGhf7otOTy99J153iKNswYCy+2qMI?=
 =?us-ascii?Q?a4993JljZNGlaKCcJq6I5z/d27Dxw7JL1S6acKy0Jor415F4i2pKEeYx7qdP?=
 =?us-ascii?Q?3M8Hvgvp2AAGwY4WtstiGtUmvA9SAJbOzvPufVod?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73205ab9-33bd-49c2-8b82-08dcef00f5a6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 23:10:58.3669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gq3YnAiZBLaL3+CWleolYxDoDTwx2/M/9YZ5C43TWotpCxtHsQgpQjtio7goR/VFx3PxLzNVK/YVDyyJw8lObw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6775
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7df1e7189cecb6965ce672e820a5ec6cf499b65b
commit: e7af7d13316dc5e2293c4f777f71bd8331f5d7a5 [4889/5321] dt-bindings: reset: syscon-reboot: Add reg property
:::::: branch date: 11 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-052-20241017 (https://download.01.org/0day-ci/archive/20241018/202410180305.ZFlGnzVB-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241018/202410180305.ZFlGnzVB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410180305.ZFlGnzVB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/turris1x.dtb: nor@0,0: $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/nand@1,0: failed to match any schema with compatible: ['fsl,p2020-fcm-nand', 'fsl,elbc-fcm-nand']
   arch/powerpc/boot/dts/turris1x.dtb: cpld@3,0: $nodename:0: 'cpld@3,0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cznic,turris1x-cpld', 'fsl,p1021rdb-pc-cpld', 'simple-bus', 'syscon']
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0: failed to match any schema with compatible: ['cznic,turris1x-cpld', 'fsl,p1021rdb-pc-cpld', 'simple-bus', 'syscon']
   arch/powerpc/boot/dts/turris1x.dtb: watchdog@2: Unevaluated properties are not allowed ('gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/maxim,max63xx.yaml#
>> arch/powerpc/boot/dts/turris1x.dtb: reboot@d: {'compatible': ['syscon-reboot'], 'reg': [[13, 1]], 'offset': 13, 'mask': 1, 'value': 1, 'priority': 64, '$nodename': ['reboot@d']} is valid under each of {'required': ['reg']}, {'required': ['offset']}
   	from schema $id: http://devicetree.org/schemas/power/reset/syscon-reboot.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /localbus@ffe05000/cpld@3,0/led-controller@13: failed to match any schema with compatible: ['cznic,turris1x-leds']
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe08000: pcie@0:interrupts:0:0: 24 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe08000: pcie@0:interrupts:0: [24, 2, 0, 0] is too long
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: /pcie@ffe08000: failed to match any schema with compatible: ['fsl,mpc8548-pcie']
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe09000: pcie@0:interrupts:0:0: 25 is not one of [1, 2, 3, 4]
   	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
   arch/powerpc/boot/dts/turris1x.dtb: pcie@ffe09000: pcie@0:interrupts:0: [25, 2, 0, 0] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

