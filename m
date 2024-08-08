Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F61145B0C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 09:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723107861; cv=fail; b=SeAcdtTOgwlGU/QYkk+xKYWif+OyS5Da1e6UE2nDOYJzgBs041Cz11Dwpd9qWexN25Z54EiPX++R3UMY11SI50r7pF0lmfdhStciP+cuYGlLvvCRercaZcKEA7kK8RoPyvkIz0tt/Rw9iCtU3tjjw4Ycy0J2Tnbr1uou+n1MLZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723107861; c=relaxed/simple;
	bh=OFTL7Ul6yb49CwAeFKf6HWDkVIdrkcD1ttMNz1q/ZyQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=laLAn+NIxtsJOtyuUB3nkkVDxelHly21/KkGHo87Y5+MzDRTp7BxbPrwonyoi+rLwqHAjvwuFLZLH89b7xgXAiwoPcbdAYwMYZpjYEKZcbdoIknBOS5A1haMBGo7GwxxcJzlmpElJK8Ct7ZRXICwEmRLpdx5+P31F3myK40Nexw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGlICbGy; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGlICbGy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723107859; x=1754643859;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=OFTL7Ul6yb49CwAeFKf6HWDkVIdrkcD1ttMNz1q/ZyQ=;
  b=GGlICbGyCU2A4yjRcjAk64bYPyLNQz14dtKBA+X77uvtKz5j7AIrGrUC
   /ZGudgxlnCS+yz9yzFLcdGP/7jV7t5zjNxaFfNbWHSWpx5VRQ6Ei/YP+x
   jggvSNb2wGPB/UYYqtyt0OAy1Ab1HofOzSfkIxzx+tTfyKnp0jm6xTX9K
   CP8ldulz2NrRxUrbX1YMMiIi9i2peBxybZuNE8o1YxNNEtKoHP66WymjI
   JA67HYZppl0/Iui0FUf0zp3BnPyeI+YcaJ9obuTVE8NJBRIeIdGHzT7BM
   AxqCoL0AbpsYVZr8DC+s+4GWWiYkk0wTgyO9ugVMf/4k7jIhaN1ypXn8J
   A==;
X-CSE-ConnectionGUID: glccDG7BSb+nfy1MsuYuMQ==
X-CSE-MsgGUID: CHsUV6GjSSq6ALrefAkPSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="31850197"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="31850197"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 02:04:18 -0700
X-CSE-ConnectionGUID: Thfv7Z5rTHqao8uQlsbX4g==
X-CSE-MsgGUID: sbFN2s4eQNyAfhsK3Qg32A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57112754"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Aug 2024 02:04:18 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 02:04:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 8 Aug 2024 02:04:17 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 8 Aug 2024 02:04:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 8 Aug 2024 02:04:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qidvf2KEpFWPPgaxueq0gvtKtZ8nCbY5/XFgyz3DGBW8VdmVnPu/TVfwtRJ66UT0AQH31eH6pH2yIy+RyCgqZW4nnzBmHpmAUKnWq+/jCJ23UWlAdLPIo6ouuTEeaTngmT/2r+0/+8j3Szw05hZJTGpqRdnHX/QGbR4XGRKKmgt6GJDEQUFL9vSb4Pcz1F6YNMoaT83qgc0EDdZSeA8GM9pBzm8J4EIECP0A/jFqo37G77rratu6d6zvqBpt21aTXN7wzqhsEE6npfgSEPGH/KjQDIUDbfARRG37MBCufsJvse+rNuKQYJuzKkha3XB1pJd8JJ9beBde7v2m52f+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gjDxFlQFaG8L4i0WuCVlOD3veHWv366SNdBuoaxpWg=;
 b=rbJSGaUk212JaL5v3jPFY48d7fhkmbOi8ig/MyhKRwu19azQl6R/v7oBRI0UqzQJMKxirXkhgNXyjl/1ro0oKRb2tlnCpcbNgNVre+uXS0hivoO5qWmZk9R3EsRmf0iN+AMq+dBb0l39xLiR3P8mZH6idBiWzPmji6p+9koRP37JIA4e2pwaPYMpbO6NrE4c4XPkHAwOx/GPHed1qFkmib3uocNONPO66OB7PHqarQyYeiTa2YT4D610Csu8cp6jdz8m9K9NWLkjBFnZ9Km6pY8E4Lp5piaWx6EuZq55NmB58lcP2kdxB29hL/4hxCFO/qfyF4xqRPv9bsb5+C7abQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by DM6PR11MB4644.namprd11.prod.outlook.com (2603:10b6:5:28f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 09:04:15 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Thu, 8 Aug 2024
 09:04:15 +0000
Date: Thu, 8 Aug 2024 17:04:06 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
CC: <oe-kbuild-all@lists.linux.dev>, <git@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 705/1001]
 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts:92.21-94.5:
 Warning (unit_address_vs_reg): /axi/ethernet@f19f0000/mdio/ethernet-phy:
 node has a reg or ranges property, but no unit name
Message-ID: <ZrSKBmg9l3DLBrNM@rli9-mobl>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|DM6PR11MB4644:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d515d6-3f2e-416b-ad0a-08dcb789138f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?69OM/Fk8YCYLzArUwpwBWEMa8B9s7fxCi+Yv62bzBz8DpcPwQZS36jqHLS?=
 =?iso-8859-1?Q?3t9wx8sG7ppgmxvi/W0VqXZbh7Q+6ck+IbuUyls8nPKYASgNy06e6xG8d9?=
 =?iso-8859-1?Q?8BTCEt9jWj2fKQKCrOT4RMTjTzOhy5ebHklxjygvJzl7Rb+dEd8+fO1L26?=
 =?iso-8859-1?Q?l8duqkJ7k5qudIUEAWYvVqBlgR1Tt4MqWO7BiY1dfjmc8hHEhMJwl772eZ?=
 =?iso-8859-1?Q?/HhNQToGgMhgcuw+b1fD0goPxOHqOTfMtlwbt1Ssips3YzspIc7LnUTNH6?=
 =?iso-8859-1?Q?6CrMm+1FIuRNkLnrFSmn+gLphKT5IoaVMiA2onSSw0VvAAzu2IcmogVDt8?=
 =?iso-8859-1?Q?xCdQqOjWwB+LzWxcHFS0fwrhHM0m5GF+VUCEn80oYj0kcTpy6j0CBlx4p1?=
 =?iso-8859-1?Q?7EEgEr6Nc2m8csaNvd/0akMgWbSGJ5yxF/ZYpZ7ft80pTVAFGwwiSlOqNq?=
 =?iso-8859-1?Q?l8/sydQb0BUb7UC2HvfN8Mdtob0MjZ2jtgau+exrvZ2vliw0qRwwYZ4bzo?=
 =?iso-8859-1?Q?7+h+tUjnSyj44FqYuOJthtUdZrJ9FxGg/6NYr3yUyH8l8UFW/bOYb32/lN?=
 =?iso-8859-1?Q?fxKDZHR7xui5JuPgnwuW/q0P3cfgxF9YjZW0khorgm/gk9Xeoodc7AU4gB?=
 =?iso-8859-1?Q?h3b+zZ5jaL3qwNAp9evcjm4J+qCAq43EH2uWZepwYAqjB+pVuqcGt9qjAN?=
 =?iso-8859-1?Q?rFd1Bm6aCc6kRsTw7n1L9E58N+O/OMkT2uPjhzUD1Ez79byxOd5Rp2a4Wk?=
 =?iso-8859-1?Q?2IJEvrMNY2bGkeCRdDDkBHdgXgYDPQoDto2UxbMMMBQNiyEwAsUhuexTVK?=
 =?iso-8859-1?Q?BHy+1zeJke1dERtNNvs1GfUxFUhk/k8/4L7V/GDWYSnM75pg0h2YynGqYd?=
 =?iso-8859-1?Q?vKKzHbHFCsMA0QkJI1c5RPkO/Bi5rX0kyxdV4A6DXj20klsUU2pZBCAlhD?=
 =?iso-8859-1?Q?aXIm/uuhx8JXbmrlskqx+FtQa+2KCWioJWJKzd3WsKHcpONtzKEWmQIk8u?=
 =?iso-8859-1?Q?qyYeI0NJmI232gNMn2FV0KJOuZYARyUsUR/A1AME5Oo1rsyhKnUsUkXIPz?=
 =?iso-8859-1?Q?GC3/6/nopQ6pjqfcHHxa2vH/8losm8ttKC5FQC9mrpCb5srZWTxuKDF5vK?=
 =?iso-8859-1?Q?rA7niOcSB+HSOaoPF+OH2osv0XAbZidQO9xjB8uB/uA/zd5cApZRq0tT7z?=
 =?iso-8859-1?Q?8AzsQfKaqv7O8hMh61vCIA+URZDzPQPWcpKUyr1qjwnimMwumH8/lb/3mS?=
 =?iso-8859-1?Q?p+nJoqIy5UARDzyLSE5Cviv6pvEeJcv1qBhUmzqNEClFq8ZpVOqqQ/wr3d?=
 =?iso-8859-1?Q?/wdN4j4JitI6C3AhLSduOkg3VW1rICn270I4VMFd1qYWoR5VK22SeZyhhR?=
 =?iso-8859-1?Q?+eM9b09eSkE+YhoODpxhvvx3EbU8GjjR1z4YYKSIgccUla+7R8IlI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NPGuI3gvPxJpQE29G/1prByAx3QzGrdRMmiut5cUBmui54L9pYp9k40TO8?=
 =?iso-8859-1?Q?bq5YhD7VFRUrWFYfT0lDReN7uCoPkXVJ3ax2+yhmfAYIw940Ut1xHwwAaX?=
 =?iso-8859-1?Q?QbBIn5/+A83P6t9cr/GOpbQNavoWVUhlGZsPgnj4rHjahvqEyQyq+OQ/ch?=
 =?iso-8859-1?Q?mVRV+l1QEyFJEo6ib1oa1j6NE5jk/RnsTas6BBPWlpmanHRVJO99yPIQ9F?=
 =?iso-8859-1?Q?ctcXNTC/YLHVcElSBxIv4PjT/JISbtlc+rXGnAQY6ncI/SNOMwmKpTkL9k?=
 =?iso-8859-1?Q?Yc5Xya66Ctr1VMd6q5pNJSTh6ZcEEHHByh2kVz5ClgIghbRiHQIauENlOj?=
 =?iso-8859-1?Q?HTn0KQ3UeKgHwR6cDDMM3apjz5DC4ExyXm96awuwy3BtfmIhyfT6w80aMl?=
 =?iso-8859-1?Q?Ys1h+40K8njAU+9qex3j2lduBzBoVz8xytehjcX/LsW5/vtfP0yzJJUCBd?=
 =?iso-8859-1?Q?bFW0PpTu+TenXhlujzWXLXtQPX5cMeQ2DeihzBjfO1Ff/VMzD3mMywE+zj?=
 =?iso-8859-1?Q?kMeWdeYqWSkdAU8XyHNs5lOBIOB/NQrzK7oo+/rj9fj8Kv7BDGk73UGpU0?=
 =?iso-8859-1?Q?cl8/PUyw+BNcsBJnzgICSdM8/84N4DrrANhiuw3sKbzqq/Grnr87YXfANV?=
 =?iso-8859-1?Q?VIcDXrTZ8RlbVH5ODS4s0yjU7LwGXf8/EryNc5SwvyQ1VXrrfGO6OdDQME?=
 =?iso-8859-1?Q?k2mfak+iePZ677yASAtv/SihJ9UiASl7oN8XdCBc9Kco4yVjmOgo8VAse+?=
 =?iso-8859-1?Q?Xl5MmVTKOrB7BoarFjGYfQ6mAY1uFRONqsaumzXNJU+KNjn5c4FQrWBsHu?=
 =?iso-8859-1?Q?EKSrigv3UO4+XX+kwsAZlXBw8jvFDY1Ou26NqughMkaMHPSq/sizf4dLtQ?=
 =?iso-8859-1?Q?O+jlhbKw3/jeS7TtJuxkzrKQmQh+KQFyllcN2TuuGXY97KWPJ+XmsApJIx?=
 =?iso-8859-1?Q?7Q8vSqKF8srQ9/ggBdM/0ljdVMVPkDLZFnu3YeRtBVS4zk4Mh/010q+i9t?=
 =?iso-8859-1?Q?/55ebz4sqUmcVnSvpPMG3YAcTZVLdnPT3U6mhrLnW3xSlImIN6767tIfP+?=
 =?iso-8859-1?Q?cpGTvFyq9/N0Oq8eQRGwFh/3ivYWa0UtSX4poDlHv/29zsYLDvyuu04ag2?=
 =?iso-8859-1?Q?V79t51Bq/NuOrZTShdSvQV3XWIuuQqKlroWDm+vPU8Aclw9/BK03ypk3GQ?=
 =?iso-8859-1?Q?f69WgcNZ/8/sGJknYIOLTkI3t5uGgBhrx/JwqOSBYszcmXSyVFQfdx7Z6q?=
 =?iso-8859-1?Q?HS5p48f1e28tOyC0s0UTDMgO13N82pukcwbbxJAEFKlfXH72iKZd7pvid3?=
 =?iso-8859-1?Q?xWTr8IT5B2MLPQmwKRnudEDgGcdrcoCTBf54fGz0FgLRRrAZr/MuWNw3dl?=
 =?iso-8859-1?Q?hSonEbl0Uwg/vLGjgd19PKQ+Jrga/p3CFGwEecykbxDVehO9pqtszBh/bg?=
 =?iso-8859-1?Q?TCqzualDd5atepalx+/D3NwID22cb23t0AmD2Q44iFy7IGNFHYUJKUJORx?=
 =?iso-8859-1?Q?nFCVDPRwaXH/IRQYrG2TGSYIizQSwF/iEODqhsV2Ul1nz6r61ao0WY2Zih?=
 =?iso-8859-1?Q?rTXmaBbUxIyQ9hTpfDAQnNRdKhK9tc6eT3vpnXSwNgSdYiXGJy9MpuMotQ?=
 =?iso-8859-1?Q?wlrK7ovclMTaVaxl3Epb2PscP1tGy0qc77?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d515d6-3f2e-416b-ad0a-08dcb789138f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 09:04:15.1758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vysJaRYbI3eXvOQH0mX40un+V5Zs7nV0eYV4xBJ/IZZeVdv6jRrKYJ2X6PncSzhHycZM2UqWp/I6rxJxjmlO4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4644
X-OriginatorOrg: intel.com

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: db2cebe1341f43028ac855c49238eb7244a5f75c [705/1001] arm64: versal-net: Add all missing dt files for Xilinx boards
:::::: branch date: 7 days ago
:::::: commit date: 8 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408081621.WK8SJpUp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081621.WK8SJpUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408081621.WK8SJpUp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts:92.21-94.5: Warning (unit_address_vs_reg): /axi/ethernet@f19f0000/mdio/ethernet-phy: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/xilinx/versal-net.dtsi:439.27-446.5: Warning (avoid_unnecessary_addr_size): /axi/ethernet@f19f0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts:132.21-157.4: Warning (avoid_unnecessary_addr_size): /axi/spi@f1010000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   Traceback (most recent call last):
     File "/usr/local/bin/dt-validate", line 8, in <module>
       sys.exit(main())
                ^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 150, in main
       sg.check_dtb(filename)
     File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 89, in check_dtb
       dt = self.validator.decode_dtb(f.read())
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/validator.py", line 536, in decode_dtb

vim +92 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts

db2cebe1341f43 Michal Simek 2022-12-12   82  
db2cebe1341f43 Michal Simek 2022-12-12   83  &gem1 {
db2cebe1341f43 Michal Simek 2022-12-12   84  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12   85  	#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12   86  	#size-cells = <0>;
db2cebe1341f43 Michal Simek 2022-12-12   87  	phy-handle = <&phy>;
db2cebe1341f43 Michal Simek 2022-12-12   88  	phy-mode = "rmii";
db2cebe1341f43 Michal Simek 2022-12-12   89  	mdio {
db2cebe1341f43 Michal Simek 2022-12-12   90  		#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12   91  		#size-cells = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  @92  		phy: ethernet-phy {
db2cebe1341f43 Michal Simek 2022-12-12   93  			reg = <4>;
db2cebe1341f43 Michal Simek 2022-12-12   94  		};
db2cebe1341f43 Michal Simek 2022-12-12   95  	};
db2cebe1341f43 Michal Simek 2022-12-12   96  };
db2cebe1341f43 Michal Simek 2022-12-12   97  
db2cebe1341f43 Michal Simek 2022-12-12   98  &gpio0 {
db2cebe1341f43 Michal Simek 2022-12-12   99  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  100  };
db2cebe1341f43 Michal Simek 2022-12-12  101  
db2cebe1341f43 Michal Simek 2022-12-12  102  &gpio1 {
db2cebe1341f43 Michal Simek 2022-12-12  103  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  104  };
db2cebe1341f43 Michal Simek 2022-12-12  105  
db2cebe1341f43 Michal Simek 2022-12-12  106  &i2c0 {
db2cebe1341f43 Michal Simek 2022-12-12  107  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  108  	eeprom0: eeprom@51 {
db2cebe1341f43 Michal Simek 2022-12-12  109  		compatible = "st,24c128", "atmel,24c128";
db2cebe1341f43 Michal Simek 2022-12-12  110  		reg = <0x51>;
db2cebe1341f43 Michal Simek 2022-12-12  111  		bootph-all;
db2cebe1341f43 Michal Simek 2022-12-12  112  	};
db2cebe1341f43 Michal Simek 2022-12-12  113  };
db2cebe1341f43 Michal Simek 2022-12-12  114  
db2cebe1341f43 Michal Simek 2022-12-12  115  &i2c1 {
db2cebe1341f43 Michal Simek 2022-12-12  116  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  117  	eeprom1: eeprom@55 {
db2cebe1341f43 Michal Simek 2022-12-12  118  		compatible = "st,24c128", "atmel,24c128";
db2cebe1341f43 Michal Simek 2022-12-12  119  		reg = <0x55>;
db2cebe1341f43 Michal Simek 2022-12-12  120  		bootph-all;
db2cebe1341f43 Michal Simek 2022-12-12  121  	};
db2cebe1341f43 Michal Simek 2022-12-12  122  };
db2cebe1341f43 Michal Simek 2022-12-12  123  
db2cebe1341f43 Michal Simek 2022-12-12  124  &ospi {
db2cebe1341f43 Michal Simek 2022-12-12  125  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  126  	num-cs = <2>;
db2cebe1341f43 Michal Simek 2022-12-12  127  	reset-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
db2cebe1341f43 Michal Simek 2022-12-12  128  	reset-names = "qspi";
db2cebe1341f43 Michal Simek 2022-12-12  129  	#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  130  	#size-cells = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  131  
db2cebe1341f43 Michal Simek 2022-12-12 @132  	mt35xu02g: flash@0 {
db2cebe1341f43 Michal Simek 2022-12-12  133  		compatible = "micron,m25p80", "jedec,spi-nor";
db2cebe1341f43 Michal Simek 2022-12-12  134  		reg = <0>, <1>;
db2cebe1341f43 Michal Simek 2022-12-12  135  		stacked-memories = /bits/ 64 <0x8000000 0x8000000>; /* 128MB */
db2cebe1341f43 Michal Simek 2022-12-12  136  		#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  137  		#size-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  138  		cdns,read-delay = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  139  		cdns,tshsl-ns = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  140  		cdns,tsd2d-ns = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  141  		cdns,tchsh-ns = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  142  		cdns,tslch-ns = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  143  		spi-tx-bus-width = <8>;
db2cebe1341f43 Michal Simek 2022-12-12  144  		spi-rx-bus-width = <8>;
db2cebe1341f43 Michal Simek 2022-12-12  145  		spi-max-frequency = <5000000>;
db2cebe1341f43 Michal Simek 2022-12-12  146  		broken-flash-reset;
db2cebe1341f43 Michal Simek 2022-12-12  147  
db2cebe1341f43 Michal Simek 2022-12-12  148  		partitions {
db2cebe1341f43 Michal Simek 2022-12-12  149  			compatible = "fixed-partitions";
db2cebe1341f43 Michal Simek 2022-12-12  150  			#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  151  			#size-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  152  			partition@0 {
db2cebe1341f43 Michal Simek 2022-12-12  153  				label = "ospi-flash0";
db2cebe1341f43 Michal Simek 2022-12-12  154  				reg = <0 0x8000000>;
db2cebe1341f43 Michal Simek 2022-12-12  155  			};
db2cebe1341f43 Michal Simek 2022-12-12  156  		};
db2cebe1341f43 Michal Simek 2022-12-12  157  	};
db2cebe1341f43 Michal Simek 2022-12-12  158  };
db2cebe1341f43 Michal Simek 2022-12-12  159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

