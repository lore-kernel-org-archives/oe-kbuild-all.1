Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18FFE1A0BE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 02:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770689287; cv=fail; b=MboFt5/M4W0kpc2RPbMFLyh4s+ere48PHZkjEAJyw/I+120sm5Hx/0GTrFCEfGCiDg/TR9Em21iPngrt+z0DkT6q4WCct1DKgPfalDL0809mkjOGpf0Z8su69dyVvlsmnwVM2M3wr2Du/mH7XgMzMbJmFrWujK8HR35Oy6gkGgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770689287; c=relaxed/simple;
	bh=RCjR4Jowka/g8Uz2oQYRDBau8z2oNa0XdK54l8Mtjck=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NgEaPr001i833p8IijUD11a6pFPNdH33cqEnSszFHTNPef3XkRiAcXULs/WsHqwAJ3DFdBgaQxaNGhiLp88N5XBKBDAEOqetnhPgX2B+drdS3ZszBxyXjLLgR8FnY6Xfxs1BeP1cx4aAZZHa8RxRQ3yacv785LcubKAnhOU04f0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6GtHklY; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6GtHklY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770689285; x=1802225285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCjR4Jowka/g8Uz2oQYRDBau8z2oNa0XdK54l8Mtjck=;
  b=V6GtHklYBECQUG/pIXGx9dmyoM57rOtt4u/JvorAKWifRuiqt3B+578x
   qvlavy5MgbpypYYEYU2WRBBwV0SCqHlTmrpXS2d++2fSZdsmil4mWkqnj
   ub55i0n7xXKc+X+WSDu+lulp1kynbmJbXmUYGS2T8UJCgYXUNT2a5OZTE
   0RnFl9V/cgos5n9cyOgbIA0WVOS6MmoMcTlwbYAQQshqso2lKDHGuC+ae
   LmVrit6Z2Wliu+EwJ5toeRZVh6lRrvDVVzu8byC3IqtJcr7bhDd+nbHgF
   4WVMqidHFFfE6oDyJzGPiW0CyGkmM+JYB+QxpgkFM5/3feMhhku248wKD
   A==;
X-CSE-ConnectionGUID: cIEn6nP2QgeeugdPvDofjQ==
X-CSE-MsgGUID: GDXRjC6WRLSblmXq1Sy6UQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="97270302"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97270302"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:08:04 -0800
X-CSE-ConnectionGUID: O6ZSEuVGSeeapXCPVlUj0Q==
X-CSE-MsgGUID: T+/LDlSxSIihmCrxABB8JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="215940007"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 18:08:04 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 18:08:03 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 9 Feb 2026 18:08:03 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.32) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 9 Feb 2026 18:08:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aJ8qH58U/3KTbRvV77U3TW++xWS7aFA6SOffepGJPf8oT0XO1YaZ0fHvwYrhROckFJCcX5p+Y6krXFiiSkO5uiI0B0dzzIV9bWphA5v4fKbiF3VBU7LdojJcj2s6XNEL866v0hy+6BTvhPMkbO0yuskkm+1qvhAdbIN6Fh42wTJU1QuDt6+A2MaSgVKND/oFWlpj6UgTgZ/ALHDcDJesZ1Q6oav5T7lyEO/o9ULqbP740SzXvx5Ln+HXMUn1xYtH/BQIoSjrtxHOQWBd7ictWCRkKljXqNWQW2fm5/YsGlqkgzpWMAcipv3DRVXraabR4vc15/XNC9L0CsTaLLqY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSc/IlxBQJOGrPoathqrKwbo60tmTaNSSRB2/9wWvec=;
 b=yQ6OClr9hVc4VAfzZK+o2Huw+aDvuPeCT83b2AuRxGrrTU8aURKi3l8ZU4QRwIXZILq5bcFgkhB/tB+tVgLnIyACe2WMDFuda2AQpyg+6cFxJDHjXM2Le2Pumj9G7BiB6XoHptHRf3Y7EnQihOGIooKNN3ms90hzfCKhKicMiCf0uqIdQqTH/UKHNxYtWYveiZhliaHC9c8Ry3oYs75OGaSnih4pQh4HttSJQVgabFw5Q7aAv1ibbFDLUfZV6PfwPuxDUPrFaYa487I3f7jJODxA41Ej4xOEYTV3zklx0MyGBb6E8u+iTI3669uUQmpFdPMwjCO9v4ciAA8Ri7iINw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA2PR11MB5017.namprd11.prod.outlook.com (2603:10b6:806:11e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 02:08:00 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 02:08:00 +0000
Date: Tue, 10 Feb 2026 10:07:50 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
CC: <oe-kbuild-all@lists.linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master 11682/12094] getdelays.c:209:15: error: invalid
 use of undefined type 'struct timespec64'
Message-ID: <aYqS9tBGtK3z9Y7r@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA2PR11MB5017:EE_
X-MS-Office365-Filtering-Correlation-Id: a69bbb0f-b091-43c8-74e7-08de6849370b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PN5Wnh8xt7FTaPkTbtzey0bGBBrF509U14Gi9u4SsYDHcGO4tMlmffMwVsPS?=
 =?us-ascii?Q?hvp2SbcszCERW7QrAnTjAWJMql6lBdE+44GaUn1+HcWq0I9Z2fZZrNDoSYns?=
 =?us-ascii?Q?WCfNhJEZZQdmJYqW0S3QiR0okyhGuVpU6muV6362OS5wSDiPRZSmD2yq2hJe?=
 =?us-ascii?Q?XCU2UodVO4WCga95fX3HtXWtHeJRllQjxRdsdhh4BpbtUOmrMDJG617/m/oJ?=
 =?us-ascii?Q?750PwVNKVm5DGM+c1T/rdGGgx1Apd/i26eheV1K51xIaTBcuiARquLW1/H8r?=
 =?us-ascii?Q?7Q5Vfcu50clRPAHLlMPCkYpcVgSj/iXwfdn7E9l1cK6SFlK2RJFyucPLEx0Z?=
 =?us-ascii?Q?FsZyUQCiemXhwF001Y1+qSIN52Y5FjGTXgSzyKf/BayLrNZd1PkXYTxaeChS?=
 =?us-ascii?Q?ANsTsONSgA2emlC9V74fr5s/5NhfKtGpY+WDRFxQRSQutHADJxg1H3Q78Ceo?=
 =?us-ascii?Q?chxHZqFcLeG1ZAEq1+715bpDoUpyNLqSE7wNXQcdfOGL8bT3SWq26R54awro?=
 =?us-ascii?Q?d2JLFRW63TTw1qb/bKidCbQ5Ub97N0HrufmhIXdFLf67+kuOUkar+leoos94?=
 =?us-ascii?Q?LcPeMaMV2PBZ5s8egKbqFFvJeDvY8+cw0sojwSDE7F52BF+Y38e91SN738KQ?=
 =?us-ascii?Q?1IQVT3SnEFaxgJASXaxSPWprYtOCD+gagijmC0I2OPFBbmOKPh/5WdfZb5vZ?=
 =?us-ascii?Q?P3e4FnOSt8BFtrNTPnHMOFA3+zs8QSpjB5JWzVHIg5O6SdEQrHn4dgp6NHdl?=
 =?us-ascii?Q?V33/ecqJvqmo2+0HqA4o06w7UvbITpFfCYUu0lqaoxrPddtjqNqSQ1+ZHDGh?=
 =?us-ascii?Q?y9YPDzCc0PNMSJDeuFYa+r+1KfBVm9AY/mbhYPf/0mUpifVnEpnoGjQ7t6VZ?=
 =?us-ascii?Q?tcN+C9DeR0MxtjpyUAWGP4sYh3TgwMm9b0uiBhkbQ7Yv+bfD5uG05YPH81bE?=
 =?us-ascii?Q?cDld6A6tImoulQbOTIoZE7X4uylS5od3qNDCDAcek2D9V5Q4U/Hiy63XQbVp?=
 =?us-ascii?Q?b4je+rKty3IFGhNd02PEvnx3s8or87Y8s25ngRlmtWSnlGi189V/SWADB03t?=
 =?us-ascii?Q?3yaHnVh+1RE77URiHPWsBfkCZjJqWlW8vrujcgV6d3stF9FfEB4kYuHv+6Cg?=
 =?us-ascii?Q?hq52p+efK8h61bGuuIG+dCKn4TDuSnshbfbbdJI3NtpX9yzzaMB8/A+TcZp1?=
 =?us-ascii?Q?0pUohJyIfR2Il6L1DEyWP51Xf8p9wFDtnjYUU3f5YB+gNB0LNYtHRXzeK+F/?=
 =?us-ascii?Q?2RKE+pEUs1xb7Uz0W/aPLrcsly3FpBy6z8hLnZymbyetfZNzdeZnxyE5GvY4?=
 =?us-ascii?Q?nZGcgkqEROA1vJtXoMqIEZNcJ2UOd3eSvutXvOcOhfAVcQKhtjU2snjpjqzK?=
 =?us-ascii?Q?VJkCywjDsmWzMv8flq5ZCWAGjB7HIiTahGmK4pstnZWSNWqjieeTsS1g/fHM?=
 =?us-ascii?Q?iWqHQCuW6EVxX8lx0u2pw3tee1//5GAF1w838bMV/aeiY4s3+Lke7wwjV/Xr?=
 =?us-ascii?Q?KtDSVuafGupo7XUD+30P07pOZ81WmFO/b4d2UanSgojRxbMfZ7dZzGr+Qi9/?=
 =?us-ascii?Q?0+AKg+P5aRNEF/n+HaebxQkyGLj/0sW9woMpsNSu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o2PGJRcoRyVcFxrcSmSc0i/I6cMJ0tYTi2vIDcjJxKprKqd5Hl0ttfKvb1VV?=
 =?us-ascii?Q?G/9y/O4dlqaGWhwVDwu//tKOl0JILM92uOFSzijaPDde/cr9VYLEW0OLYF/X?=
 =?us-ascii?Q?6n+A/LlnDKokn/5YUsGyO6JjehRzeZVcHhVzA0AltqKw4cNoggkbLbzISwxU?=
 =?us-ascii?Q?0/dVoYpviLcAweNVG49fm+6hwT+/SH4WwR24JEUzHHmzMoKP6zmG7q9sjszR?=
 =?us-ascii?Q?yr19CfJNA22UToJahFSnVIsLsqMxk2ox3qJCRZHNAS2Q4ZSApaKtpJRxjMlS?=
 =?us-ascii?Q?NAJEk4lYcu2sh8bkr6if3jHJJxM09lgMQlC/umTraSWTRBHnV2+sMVRHAA3i?=
 =?us-ascii?Q?UeYfdA2qQTPPJySUwFNdg6aoQKtwSbAYUz72+vOupAbFX60iUveal5eGOWS3?=
 =?us-ascii?Q?rMdE+4RLa8p7lOqteqnUqm6R2U/9ZE/KYpNocUlObeWplD/dS3vf9XKpC9Nk?=
 =?us-ascii?Q?JASU6z4lkwmPbnQQvUROgVOxeqeG2GqGTS0/m892+VgVFiGUiaH7GDQqIKwE?=
 =?us-ascii?Q?YNIeXoqi5Cl1g9kpNWIa21R9qVeDgiJBYW3Uk1caT0o1k1UA/NTrUolEt6tl?=
 =?us-ascii?Q?gY6EecsK3j1iF2fZh0o2kAY1ROzsGEIpEWPboh+0DyBCf8nnTEiIJdIZqXKi?=
 =?us-ascii?Q?7e/JRgLLLi3Gwadtwp+S3bgW+Yz6D3AGCSn2uB+lTGQ+2k9Z8DK8xbRjwH2Z?=
 =?us-ascii?Q?wxyyZbp7zwQUQV4ZLunjgu3ltrfJM9FfQon94u2F3QkXrtDISj9al+H6W0iv?=
 =?us-ascii?Q?brc8F2fhQGc7V0cQixIRUigUBScgAU3cMyGBcEk3r9rLOWZyzLDOH0tVyaS2?=
 =?us-ascii?Q?z83f9m52GF8kb+nKD1HAWPe1hWRqPJVg0w4iM+5W2k/ajwLYF459yc25Fdcs?=
 =?us-ascii?Q?yxUkf1Yap3++G3n2lt7WzJShgY+J4Y6kWCbGLrfVqM57liuOGuz/3m7DgX2g?=
 =?us-ascii?Q?dVenAn2HT4t5kk66BC5LV3WiS1xkF8I/+ucu4OBf7bbaC+k0d60/jigdWAyo?=
 =?us-ascii?Q?QoH7b6iFt5hImn1RWfayotW5kRvSWY9gKURAAJUtVxXadkWO9DIR6/iLlL1h?=
 =?us-ascii?Q?LeYHMfxXQgOxBs5DX/x+ULfPFikfPLx/uDELbZ7ZFLgPcgi2tjampfRHRFp7?=
 =?us-ascii?Q?bQvuXFhFKuoIZ6/4Ypw/dBBY1PXiZdhLfjAz6xmpbxbBlyUabeEAlB0Fx+tv?=
 =?us-ascii?Q?JRlj0ROrXcnhDULL09v4TFiHQpg9dUVg7QDxgO/vBCC9GZmDudKwVqLqj6Xj?=
 =?us-ascii?Q?gFppKZ2tjz/VkjdLIwOzLHGSTsgC14imODOUyR1CxlQ//7RrKKlUAk+mF5i/?=
 =?us-ascii?Q?oHFF9rPmHSCY1mr87GrThQ/RXmI/7+z4HOSKlDEQ4dNBtLaILSOliK53fShw?=
 =?us-ascii?Q?yBBDVU2J/7PUxkq4vvO6Ac7w0oeymm6N6oVUuS6GfSdx7IAQ/rkazXQ228Ss?=
 =?us-ascii?Q?YZCFvHrD4Bh4lKOkMr3dRS11qIxZke/Vk4uYQyxhQGO+6R2iP4kGathfGymf?=
 =?us-ascii?Q?jBGWHkjdbNdFbUHJn1u/XgrUiSRLqXgg3gljijwXH+Vr33dSDpMkBFw97ixm?=
 =?us-ascii?Q?E5lvrxRSzQuuB2346OlZP1goGQ/48RCd8K0XDEDk0NO8qf020gCmzz3UevjV?=
 =?us-ascii?Q?DRNtymo9tbCWdjUYWkyP5RSetP5rgN4spbpI6sryIACO4DSkBV6fXu5jxDLJ?=
 =?us-ascii?Q?SVDlC2M3oQV7QagAIDznwTgCk+YUkQljqaVpY+ASpoLGsR9wvuv4CJ/MLZps?=
 =?us-ascii?Q?6cLXAoEMow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a69bbb0f-b091-43c8-74e7-08de6849370b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 02:08:00.1093
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcHD5ZEG6INkusbWPNZoC6I8fXnog0rhDxCaovyg3pUD23LriP8cDezqa/xVv70bMBXHAKiniTdye8cnNZSx4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5017
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9845cf73f7db6094c0d8419d6adb848028f4a921
commit: f06e31eef4c1496f2e1e6accd8d3764744742d92 [11682/12094] delayacct: fix uapi timespec64 definition
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260209/202602091611.lxgINqXp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260209/202602091611.lxgINqXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602091611.lxgINqXp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> getdelays.c:202:45: warning: 'struct timespec64' declared inside parameter list will not be visible outside of this definition or declaration
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                             ^~~~~~~~~~
   getdelays.c: In function 'format_timespec64':
>> getdelays.c:209:15: error: invalid use of undefined type 'struct timespec64'
     209 |         if (ts->tv_sec == 0 && ts->tv_nsec == 0)
         |               ^~
   getdelays.c:209:34: error: invalid use of undefined type 'struct timespec64'
     209 |         if (ts->tv_sec == 0 && ts->tv_nsec == 0)
         |                                  ^~
   getdelays.c:212:30: error: invalid use of undefined type 'struct timespec64'
     212 |         time_sec = (time_t)ts->tv_sec;
         |                              ^~
   getdelays.c: In function 'print_delayacct':
>> getdelays.c:260:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     260 |                                 format_timespec64(&(t)->cpu_delay_max_ts)); \
         |                                                   ^~~~~~~~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:344:9: note: in expansion of macro 'PRINT_CPU_DELAY'
     344 |         PRINT_CPU_DELAY(t->version, t);
         |         ^~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:348:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     348 |                 PRINT_FILED_DELAY_WITH_TS("IO", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:352:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     352 |                 PRINT_FILED_DELAY_WITH_TS("SWAP", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:356:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     356 |                 PRINT_FILED_DELAY_WITH_TS("RECLAIM", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:360:17: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     360 |                 PRINT_FILED_DELAY_WITH_TS("THRASHING", t->version, t,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:365:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     365 |                         PRINT_FILED_DELAY_WITH_TS("COMPACT", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:371:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     371 |                         PRINT_FILED_DELAY_WITH_TS("WPCOPY", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~
   getdelays.c:319:51: error: passing argument 1 of 'format_timespec64' from incompatible pointer type [-Wincompatible-pointer-types]
     319 |                                 format_timespec64(&(t)->max_ts)); \
         |                                                   ^
         |                                                   |
         |                                                   struct __kernel_timespec *
   getdelays.c:377:25: note: in expansion of macro 'PRINT_FILED_DELAY_WITH_TS'
     377 |                         PRINT_FILED_DELAY_WITH_TS("IRQ", t->version, t,
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   getdelays.c:202:57: note: expected 'struct timespec64 *' but argument is of type 'struct __kernel_timespec *'
     202 | static const char *format_timespec64(struct timespec64 *ts)
         |                                      ~~~~~~~~~~~~~~~~~~~^~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

