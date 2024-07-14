Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8EC79EF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 15:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720970840; cv=fail; b=gGnQAvh1x4MAGTHn5azjBcWw1Wpx6OafNuW1pMQzq+51rcfojVKE1JKbIh/jsZBVkzy+dUaN+E5B3ADsFDOwC1+S935msbfD1lu7Hzv3qrdj16X74eEs1XJh9odqhBj8bHjvErOl8Ppm12+KO3gqiiFw/kIwzZWsJ+iNl7VWR/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720970840; c=relaxed/simple;
	bh=LPDF/nUMdD0Zd7ph4wAj6ZqxGa6Ql3lPDCfInQOjscQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CERxgr+JuppPblxmhxH0GcxOmp+hnDkYmKnGdYiOhm1gLwoI54LuPdD/aUZYWUzi68zThcxlfYKTuPyg4mYpnUbI9OFkLQkR0IEwWI2Wzx286eBzHcTdEkJMBupDAqEVeDSDjH262jI54bua7U9hxucfZCzjnxrItRb3Vdq5t40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRRm2K/m; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRRm2K/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720970838; x=1752506838;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LPDF/nUMdD0Zd7ph4wAj6ZqxGa6Ql3lPDCfInQOjscQ=;
  b=QRRm2K/mNpPjJJncQCNhQdf+4uqOo1vZgOmIsfMaiRolfbYb4UQMxIhu
   5XGmx78MTwicYzWS+VA3MbjO9KzbGWbCDr590SXDxOfAN226GzH+L5xAd
   mAhJLfdHrAOJAMSflY1SQ5tVNfU1IoV0NaKReDjnmVSpq+z8/nX4r67RJ
   +jiOSJCMw5PPQdQFZ32fHP+Tzygg79hZU4uosOySe0MaCU/ibp7Yv4iax
   2J5VikQlMmPWZG7BiJzPip6tTsk5w03EQKL0zhh7U45+IrMX/ALIDnuYo
   EOkOwVMQ0tcztrrkT4Q2D17TdNHJZoRUsL0gUPD8RIWOQPIhvc0Ug57MH
   A==;
X-CSE-ConnectionGUID: vlvUfGq6Rxe7+K1cGFXN4g==
X-CSE-MsgGUID: SgR4qiEETe2iT9kjLOkZEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="22222448"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="22222448"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 08:27:17 -0700
X-CSE-ConnectionGUID: UW54TgDUQWKXN5vPeQxrfg==
X-CSE-MsgGUID: 8JvfQ8NDSA+KA6cZM3pOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="54309044"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 Jul 2024 08:27:17 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 08:27:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 14 Jul 2024 08:27:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sun, 14 Jul 2024 08:27:16 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sun, 14 Jul 2024 08:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TYaUIIIgAlVCaYtIKjhcCKCVSNpq8zgxGvJoXJSK+DcsfwBeviBepSWK36+KUWpUnSNN6NelL4MbqShXfQtwO+QLhRdSrSvTXQHdem958GhEPwbs0UsJQXSqr0kjyVEPqWlLbirHgcIiImQoTh4zZhFVGQYqZ59P5kgHCjtdd+i2Jhu7N6iqfr++dp5TAf20vfb26vuXcnZdDOm8ZKzOmBxhQ5nVnt8QWg/ipyhaQhezL14jBS6C4HJcUR9o12F4Xf1+KwhuW3wVJV56uWfArI2qkOMlAPk14daxTfMQdg+6oM3n3WyLpNtvB0QTwzdzK/gcD1dXY4YBZjysdV/8Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3fSc+ROjUllOxJth4F8uuagHpD3C4O2rfnghDneyVzA=;
 b=TK87D++O2cVfCqSabk0BZk+fswXB4xW3SP3CA0UnudqMZTHZPZd2fsobBNyhVx5XBV+GifS7kp4ZwZap1tHI64rc0A1x7rS/mNsfVhoXkSMv/In4wWSbHVxMb/enC0jlPZHd3xAPtamkmku4ev/ZNmB9laeLGth/cf/SiW9Fgm5Lgk5N1piMb0l2lrR1lWsMGuQcAyoLqhYgRuUDA+YooVdv9XyU9i5/u8jTK9aUwvUhijU6u1ObDKZgkhDE5RvYFtAIgO9pQR66laLIEMaupS0iMc/uNKbX4zZCwHPZg6bYiQedDLBHT+WBGoKefZPDdCm3cC52/37k1qrYugOuMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SJ0PR11MB5151.namprd11.prod.outlook.com (2603:10b6:a03:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.24; Sun, 14 Jul
 2024 15:27:13 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7762.027; Sun, 14 Jul 2024
 15:27:13 +0000
Date: Sun, 14 Jul 2024 23:27:05 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>, Guenter Roeck
	<groeck@google.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chrome-os:chromeos-5.15 14/14]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:57.35-61.6: Warning
 (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/trip-point@0: node
 has a unit name, but no reg or ranges property
Message-ID: <ZpPuSTMZC70M9/+9@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SJ0PR11MB5151:EE_
X-MS-Office365-Filtering-Correlation-Id: 077f13b3-bd1e-4483-b49b-08dca4196fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N4BUVtFUXqNRsPD1Q/l4AYVAmonrzeootciiDzo/BwsHu360WQGi8MdFMc4L?=
 =?us-ascii?Q?Ax4zGvmfEQBZm9ifgVZFN6WjyYC0k/v9/GVRMTN48nj3zDA9XWjpfrWJO6vT?=
 =?us-ascii?Q?BtqyGNz0SS5FdPfpWsbB7FgMqtuz8e/TL+lHCt5zH+4pc2P02EZizBBdajf3?=
 =?us-ascii?Q?U7hJ3CwR8R+XJnGDc8Je7TjdfNDZWrTKx4aXv3FBjuyHolZXuWhbn49rrYe2?=
 =?us-ascii?Q?kJ7Y7LeJcXkOWgcD5vIW+QheuqonBpqpBhM5lYypD83OunkwZ7SOJYoBPwIZ?=
 =?us-ascii?Q?/ynQue4Qjw/Bo2I/IMLIOQjGh6MU8nyzAfF7wMvH4D6H+uMXsLeV5GUXwRw2?=
 =?us-ascii?Q?jE6TSSGAkrPWCzdvwVmd5CaltUj0amWrrf/wi05GvrE1ahxV4lOwZT8j/ldL?=
 =?us-ascii?Q?6QrewyEmNHJwJb3c/BKW4cv5Z8F+6pjxeLhmVofTP15mokEwT1R6zfwuchOc?=
 =?us-ascii?Q?dtjuUtc8U//D+riW3AOtZg3nOJVaydQtxE1ojgi1fuH0/uEzYZq33IcIU7FW?=
 =?us-ascii?Q?Jx7WJA9+KG3YO0mPu1m/bS3lvtMeXDdUpy/x9YclTDCP2LalqyFzstTSIyv1?=
 =?us-ascii?Q?W0Y0TgmWr3s8XVbpmfBEuenrVSn314TlCXa6nJbCQGs5anfx99XwpOTzHtCD?=
 =?us-ascii?Q?CboKuHNbRg/jNoRhSHOzgQ8lsu5kdRIY8KY9MuLV+pNOfq6xaE7Fb+7LY/1D?=
 =?us-ascii?Q?As8JD2txMqtTmW5H8TYpfwhEjYiReYRKKRV1CuYUBt0+AiHK2Tqe/PYcQvIV?=
 =?us-ascii?Q?mS0/KfTXX6FWtqu9mBVLfN76nBRBHBWVnhSt11WuqBisQzKDJUKB9sq3ZjJn?=
 =?us-ascii?Q?8n5BR+90Xc2EvkQ6Jdfe9eL9F44tMILDUs/gIUzSshp7g6NCcLki+Bimz0rj?=
 =?us-ascii?Q?SgUfZjg1Qq9DZZQRU6PsyH59bpLMp+Jd7c4xbwMXZrxo0GGBs0pyZSBlzYWq?=
 =?us-ascii?Q?I0n4ePBcMbMA8vYu6x/6AZuEcNkg3Wyr0SNdb5jZYlVImOZx9BKIhfjNz+I1?=
 =?us-ascii?Q?rx+ZFqDx/zKZtkaoj89llmn808BBpFF1VEV4Bbfr3uUl/7x/Iy9Y/EYzcG1G?=
 =?us-ascii?Q?mV4I7AWH1GzsV0wIS15efRlmDnDey/eSRKxbB8xpr816gkk14dfLo84myyMc?=
 =?us-ascii?Q?wlCwT3wkznx6KBuGyPPDaQfpWv1Bx2sphAtaNypKOf/VD5NKI/0BNd+yjVkl?=
 =?us-ascii?Q?yHLLM0VK21CtxKZCO9gk8Bp4HiGZ1m/Rw6VDjwyir1JCPxgwTfNhEtiynePG?=
 =?us-ascii?Q?AWu60MOdcK9wlk8LG4FkLM1JHqbs+f8Ezmta7NmR9ULd/LjQPms1SlzuGJaE?=
 =?us-ascii?Q?7wI+dYgF6BJHn6EvEwhQ43Aj3JhGATC7NOnHogWwr9lff54LeiWUAzBGxUVm?=
 =?us-ascii?Q?rYoGgmk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bER3eiRkSj+dBEl6/+pZ554ln++q8xVDGJFZUVVGym+o6VUHKkPJHZ0SUHBd?=
 =?us-ascii?Q?r7YWF4GB7RmmvZ3yNX8Lsn/Y62Zni6J7zyqWTT1LHUAd5mq3UQMByadsWQHL?=
 =?us-ascii?Q?6Bac89jG1mdEg3lagfSBPVHzF9HhgoTz369JYsSpRVVVnSBQ/n/b9ZYxDCCV?=
 =?us-ascii?Q?rJ439FZeZZS9R0N86zebcTEpxO7b2/YIgJAm6e4ueBzi7F5HgYoSptongGxS?=
 =?us-ascii?Q?LqTdB7JGup37FXD8wd6aQtMsO+XLLjYb/4X4jSublbyWvk1CVgaVF9u3E2w1?=
 =?us-ascii?Q?dgu4PeMf+YctfZ704IfJfikbEvmYu3qJxfVPTf6ScH6ZICaWzfbPiiDXoy4r?=
 =?us-ascii?Q?U3gcOXxnoakrUdSRikVPiTuLb8+c+HPmmF+L+5zzZgk+NdEK6bcCvMbNTOQc?=
 =?us-ascii?Q?EI9f5AOPj0quTftGUQQHF/cDK2MOXR/hPtHYP+oQ+pHwP4hR3FU4LiuPt0lB?=
 =?us-ascii?Q?pDVPJFSVK1oR4DlOGctWXD3FVIQ/zAHHGjExFHM47Mia8qKimoxHrdx2k4rW?=
 =?us-ascii?Q?vIdFlQe9ECGZwgHEjK62gRQXtIWRYQ1EBr2SG30dgU1n1OfIxA4pTUqntCgU?=
 =?us-ascii?Q?UNCqnQHr5fM+G3wBck5j/Vv8SpB1jJNspugqawL0CgSeNNyshh82ibyhFwiA?=
 =?us-ascii?Q?ukBM0DnjorVueXD1dCM/SsQB+u7x4qb5GRamw5+Gvtc28sh8VuU7x0phJTrs?=
 =?us-ascii?Q?BQ/ZD6v7OMIZTKRNbeUNtkd8Qpej8KNhah0a3o0TZbIMOaFKYGzHGYCoSuZb?=
 =?us-ascii?Q?asEjF3XbAVGKAYTI+IQnc3xx3OQqJGmvQgk7E2YUydCpG3hfCYM74QKoGOwl?=
 =?us-ascii?Q?U46kyTfnyTxzVyG7C0kSW78sLuI5BlbKVIhrxdemDo0E1kHyKhGyalA8ldo6?=
 =?us-ascii?Q?GnCzvO/PQ20/yHa+a7m7aYFjdk5ZLCBME6PUn7EWSKiOPVit6ksuGkaTRJuQ?=
 =?us-ascii?Q?w1+H1IMygZA9BtH1pHTuK8L+zKfdzda7yNIxrHEM/6Wi4ff97zZ5lM07yTuz?=
 =?us-ascii?Q?GjDm5wZh+fLeeNw7MBrNe/sDxBqDKGGGj2Qb3uMZp7m6KFCHJsoJZKJxtzTu?=
 =?us-ascii?Q?fZ777DjU7jA+ATumsHUsdpVoALENOpnDc+0DrKtx8XY8VmK4Q3Pe94gGOHHa?=
 =?us-ascii?Q?N7NhIAXhaaD5sspJtXusw+u5cAU6zd18dHG97vonw5o84cHVJn7gVJ5I869G?=
 =?us-ascii?Q?/kAJ9rVCx1CEadzf/jTJeLiYSAtip5EM6RE9SGFd4Gg/SibBxeoK1PkNOwcj?=
 =?us-ascii?Q?YDfZosSA+/LBO5ifsTbt5ooBU1GpVaVlXFHGo0a6CoqonGDcBbkfuE+XgVyy?=
 =?us-ascii?Q?cCuwEGrirpVnjqKQFgybfiRbcAxim59pbwlpDCM4SikxzzU6FVbs4aj+ydbJ?=
 =?us-ascii?Q?WZ3kH25139PcQ5x5DUA40jQuhh3HqQbhBbsxPQKu7M0aUoUBezN4TYJ6vXBu?=
 =?us-ascii?Q?IrVVqezaM5OJYXfZqEpd9jy2dJeTy2J9Q+gsZbV6VfrbBoI/l8cuacLo3Jq1?=
 =?us-ascii?Q?2ij3MCV83dsfGo4u8XqUCIY6T8R2pEBlPJceoDbw1HsRfSTd15r2Yds5281U?=
 =?us-ascii?Q?gc5rSGegmoyBsoAYa0cKuOZkwjLQ1iD1CjYnKiyYG0A0em9PP6kQSlim1ekc?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 077f13b3-bd1e-4483-b49b-08dca4196fad
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2024 15:27:13.8116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjNUbvKbV6KJSvRPOkCFRydjcSuWCGzEzXync/htADD0UXx9xh33QNaHY05+hGPuTVtgamD14PfeYWLdYHsw/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5151
X-OriginatorOrg: intel.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   9982b53bf389c6dfe6a73336380c64f5d0dd41d6
commit: 9982b53bf389c6dfe6a73336380c64f5d0dd41d6 [14/14] CHROMIUM: arm64: dts: mt8186-wugtrio: Add thermal limitation for pmic-ntc
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: arm64-randconfig-051-20240713 (https://download.01.org/0day-ci/archive/20240713/202407131951.OB2QHc8z-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240713/202407131951.OB2QHc8z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407131951.OB2QHc8z-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1510.24-1512.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/data1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1514.26-1516.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/data1-1: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1518.27-1520.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/calib: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1522.27-1525.6: Warning (unit_address_vs_reg): /soc/efuse@11cb0000/volt-bin: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:431.16-437.4: Warning (unit_address_vs_reg): /soc/mali@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:439.16-442.4: Warning (unit_address_vs_reg): /soc/mali@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2184.30-2188.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2190.23-2194.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2196.35-2200.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:57.35-61.6: Warning (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/trip-point@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:63.31-67.6: Warning (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/target@1: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi:69.35-73.6: Warning (unit_address_vs_reg): /soc/thermal-zones/tboard2/trips/pmic-ntc-crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:81.37-86.4: Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:88.34-93.4: Warning (unit_address_vs_reg): /fixedregulator@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1006.35-1011.5: Warning (simple_bus_reg): /soc/mailbox@10686000: simple-bus unit address format error, expected "10686100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1013.35-1018.5: Warning (simple_bus_reg): /soc/mailbox@10687000: simple-bus unit address format error, expected "10687100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1907.23-1929.5: Warning (simple_bus_reg): /soc/venc@17000000: simple-bus unit address format error, expected "17020000"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2053.30-2174.5: Warning (simple_bus_reg): /soc/opp-table-3: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2176.32-2293.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:43.28-118.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@1100f000/it6505dptx@5c: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +57 arch/arm64/boot/dts/mediatek/mt8186-corsola-wugtrio.dtsi

8aa0b3ed2564db lvzhaoxiong  2024-04-01   48  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   49  &thermal_zones {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   50  	tboard2 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   51  		polling-delay = <1000>; /* milliseconds */
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   52  		polling-delay-passive = <50>; /* milliseconds */
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   53  		thermal-sensors = <&tboard_thermistor2>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   54  		sustainable-power = <1000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   55  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   56  		trips {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  @57  			pmic_temp_alert0: trip-point@0 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   58  				temperature = <50000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   59  				hysteresis = <2000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   60  				type = "passive";
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   61  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   62  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  @63  			pmic_temp_alert1: target@1 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   64  				temperature = <60000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   65  				hysteresis = <2000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   66  				type = "passive";
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   67  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   68  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  @69  			pmic_ntc_crit: pmic-ntc-crit@0 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   70  				temperature = <80000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   71  				hysteresis = <2000>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   72  				type = "critical";
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   73  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   74  		};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   75  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   76  		cooling-maps {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   77  			map0 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   78  				trip = <&pmic_temp_alert1>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   79  				cooling-device = <&cpu0
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   80  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   81  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   82  						<&cpu1
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   83  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   84  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   85  						<&cpu2
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   86  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   87  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   88  						<&cpu3
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   89  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   90  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   91  						<&cpu4
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   92  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   93  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   94  						<&cpu5
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   95  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   96  					THERMAL_NO_LIMIT>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   97  				contribution = <4096>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   98  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10   99  
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  100  			map1 {
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  101  				trip = <&pmic_temp_alert1>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  102  				cooling-device = <&cpu6
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  103  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  104  					THERMAL_NO_LIMIT>,
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  105  						<&cpu7
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  106  					THERMAL_NO_LIMIT
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  107  					THERMAL_NO_LIMIT>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  108  				contribution = <1024>;
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  109  			};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  110  		};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  111  	};
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  112  };
9982b53bf389c6 Zhaoxiong Lv 2024-07-10  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

