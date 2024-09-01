Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EBC2BAE2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Sep 2024 05:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725167180; cv=fail; b=FlWECSYlf2MmbIBYpBa4KYMRkq+ecUp4n8W1r6nQ8uEXvD8egNQ0qaI0EjpRaXYeymL5g6k45kguCd/I3RVNU6V+0x7zL9Ddnr5ZS1pVtF1NRJzAhsniC4uBRWErJw3IZDKOu6c5+ldRKuOICmILVMX7Yl+xWl5mDf0D3HyqDKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725167180; c=relaxed/simple;
	bh=Ieg7hSDMzyF/l946yMOyVDApUtpjUiJdkQ/Y2ztRpXw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=DFhjcFGdUJ+HuUtOYKg8l1hGos7NECr09xH7Dc7/1pqKW4blAmZts41nFXlYdkNW4pg/9s+GHkTXfmDdYbRMWyLjmy8aPedPcyUBC6DnxXC+2IskVuepY7F8gKsetJoL5s/oOGG7fhIvw+qQpml+yKZi235YnL9QbwSc+a/4hJ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9G5iTdJ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9G5iTdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725167178; x=1756703178;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   mime-version;
  bh=Ieg7hSDMzyF/l946yMOyVDApUtpjUiJdkQ/Y2ztRpXw=;
  b=B9G5iTdJ5IBMYSGXHnMA8CFWkitToDKBgi77vSerBft77i4Bldc9mkZF
   TphduK4beerHcj/T94juoUpUSyWu2fv5R8wCqIU6he/wNqy+dB/zWHcGO
   /KwT6apOZ3nmuhol08276sXKJh7RJH9L5AcceA4jatgIKvWHaoEBvY3Yf
   KHl01jzD5ALsgvqyES6tKDcdFi/ea8GlOjQjM7XpHJlRXXZq7hyo3/USj
   nWQ7hqxaGp46sSKj+IAnbj8fX0pd6p987LbS46Nk3RReJZzT5Ovn1eeIJ
   hjdy/nI93wVACYPjuQFpHprJ6n1lKN9NK/ZYvCPuz8FSfwYp37aYschNs
   g==;
X-CSE-ConnectionGUID: XIUPQgA/QPO3RxWYu0RTrg==
X-CSE-MsgGUID: MdwHnC0URAKAEHmXMZY2Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23953630"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="23953630"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 22:06:18 -0700
X-CSE-ConnectionGUID: AhhSUBEUQVC7jTcphaLr4g==
X-CSE-MsgGUID: +ReuPVDSSWGwChb487DTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="69074619"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Aug 2024 22:06:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 31 Aug 2024 22:06:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 31 Aug 2024 22:06:17 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 31 Aug 2024 22:06:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQopOOBVHaUt59Ld5BraZSyOdOd7Ac46to+N9UJMyLH0PxSI5gXhga1QnwdPNll0hL7aRCgzvYF1a5MBYF9cIpH+IjEDzd6IqzvdnbVvnVk1o56I/K+s1RzmWUpmF+HzfGMN/0m4M19EPA+05k367eKzrqsh6bTHNklC4tbQQ+fvd6DGUEZuIZkFkDC+c1a6ysVERfdebyLkZBTbbLliXGgripF9qKdSZvg3liM6zmJ2Hd7XymXZJDN70F6SRMblirXvsnEnYq7xkHqeE9rfZPJ3zS+rQQy5adCPGzi8/dVJu/P03a7atmWcPYjUdzxl9g8KduRE4bRsSVnqbx1msA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQvUH3B+OsAfTdsOZkoVUHuzkW8nvv3RIU4+kvBiPBY=;
 b=mUOVu+YE3Azj6H2vJkn1Wbc2VKLVdHkiftfILVaHGDh/porEN4qrc6rqvZJ4/eqnFYQA+Hy5UTj/+he06YPHFD8Vgwr+6aQCu3X4mE45WEX+E5gY3EGiGPqttqOEz6Th8rTVH182fKhIH99O9jKL3/739YyytUBAv84uyLCoFfsBMvZ9PQDiA/l76CEdo5FrYQLZSt8icSNShLstTt9OJ5AV+q+m1XyEnkr6Qu14Q8fJj0AGxpxR2XvhC9QK8oD9ZWtJkAjgZCrIju3OySpqAOYzoymWa2bY5LZ/RAbzokpZhx8otGgKipmLqs4IPTfYmUVEiSe0xo4R0cIHZUs0Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4636.namprd11.prod.outlook.com (2603:10b6:303:5a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.23; Sun, 1 Sep
 2024 05:06:12 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.020; Sun, 1 Sep 2024
 05:06:11 +0000
Date: Sun, 1 Sep 2024 13:06:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: Re: [PATCH v3 3/3] kselftest: Provide __cpuid_count() stub on
 non-x86 archs
Message-ID: <ZtP2OtJwO0icnCSd@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240829131657.1917-4-ilpo.jarvinen@linux.intel.com>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4636:EE_
X-MS-Office365-Filtering-Correlation-Id: 776208e3-3366-4c57-3bd1-08dcca43cbb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nwsQdRnKDdIbqy40rHtwoDKawlFtU4BTcTWRHcf2SSKWuOZdpQrL/cUf9XaQ?=
 =?us-ascii?Q?aDSeddRfL/HCRaY4wrQZAX9PW1pXSf+qs5bfSy+nWNtb6GdodnPB5setFLvA?=
 =?us-ascii?Q?5z3oie21oRwTup0H/XHkXIPfx672MA/EwGz0GOxKqCyGyA2IvAjEBEZQxNNn?=
 =?us-ascii?Q?Rd0TH/ZuK+uC/nk6RfzRBWbJiy3EoYDSzf0e6CGTud14+trTT5snYIXqdiyC?=
 =?us-ascii?Q?Js/RC5XBfg/FetZUURaZr1OHlaD1/3m0H3HeJVuXTGJxUfvXlm0GjgOkz2o3?=
 =?us-ascii?Q?yUJLGs1FH6OHrnK+yDrukz4T3Wu862fTrZyV4UPkw6Gg/FDToelDjg926QDo?=
 =?us-ascii?Q?H04SQa9nmOBcE9j6McV8PrmV8KqrGSSXHvyK1AWXwx/nclrJPSRBBi5XcirB?=
 =?us-ascii?Q?tFR5bhDQ9eA19Jxj+0EsOGZT4jaP6byEGZNip0EhXBS7zdFr8DwC4UomdLL1?=
 =?us-ascii?Q?OfHl2OmgPeBTD12jhvbqw4Kmi02lu4oiE6Q8PO3tl0kBm1y9W1eAx53j1tQY?=
 =?us-ascii?Q?pLf7+Dw3RqgC/BIdKgMn1piUKV3ie4/4mCbenLD3D4POBkT9x1rnZeDQOBom?=
 =?us-ascii?Q?h8X7keXmXx2OYqx43HNexwU+D419rGcEQPKyozVy/F27of+1fTzCHja4kBCD?=
 =?us-ascii?Q?BfcXlTo1oRXBN8Cgr0bJWJOKu5x6cRnhcKTE7JuEUSomsZv+H9J1qalc1ofw?=
 =?us-ascii?Q?Yh1NnyqCuQTFARDLVmG7fjE76I+Xx7hfsbvO1wZfxk04fB+JJndrACGKZYS9?=
 =?us-ascii?Q?QW944Ku3/QNjy2+KsJse0EsPPwEPS/5Ok38GBiG/bz52iowGysqbdWitqGON?=
 =?us-ascii?Q?FVOnMU6HpyOxqr1tjtKYs3WkTBUmi+nIC/sku9mvzIMsn21Apu78Hj8FVzqP?=
 =?us-ascii?Q?M9yQ6xFoRlDallUI1ym62xOyAF4I2W8OGrOk/la3pRarUpJwbomE/HH0qEUS?=
 =?us-ascii?Q?mNDqLi9j1WZm6xovV8NowkdtegkGdL++pkcqmik02m5Pq5k1ljfqrBphaPW+?=
 =?us-ascii?Q?E98kkbcKyVJP7ZbhCGwfSjpmlU7dUYBg/uevDctlkP4XRS1Cjqj2K+bmaP6t?=
 =?us-ascii?Q?aEwscCNFZerwtM7/uCoRHS5dEes05vJ/A5m52OboAJQRU+LjubYK8hPUhZZn?=
 =?us-ascii?Q?BxRK1kO0lqa4xrCV9uRI6eYsiD//iIq9Mr4dREzlmcvhILXoaM4sl4X2IoNn?=
 =?us-ascii?Q?UDo2G+Vuj+EoGS56OIbiCQubt5l4VBaNjOcwbC+cVEPvQYGklVhZTmbchCJk?=
 =?us-ascii?Q?QQ3C/Y+gRR4TGvu0rygKa+JEIvGQK0ScdXv4Gr5kN442ELaMvnaSEV+HBmS9?=
 =?us-ascii?Q?iP3MHN548SYssv24jRw/B85J?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lkwVaG5Aj1opocpKYV5PuEpyWw2DgSptkEiIjgZum8gB6+8aggAnO79H1S2Q?=
 =?us-ascii?Q?kv+dw4lBUi45AdP9VgLXZ6JAlzV4+UZlgKvjNcbZikVT1EodNskU420pAkWW?=
 =?us-ascii?Q?Hbi8Fp14sW8LlwEIYbgDy4RSScvZcYM7gVa2/h+GohSbOVNqkwnCPHomkDQF?=
 =?us-ascii?Q?rYNPSwORcQty4sAqmXMWxXLNCu8QdApxTZuqjwlAt386apfzZm74OgQ0ANzB?=
 =?us-ascii?Q?CDWCbsYJj+Q+pWCNVqagLongnEmL8iPRGslxay7GIXg86I0Zb1qdd5Gug0zd?=
 =?us-ascii?Q?YxzWefSSr7Z2cuO7u/2xdis3F0zzUs93PFJsMmN09K06L/NuTUt/DWgMoOAj?=
 =?us-ascii?Q?CysXy5cBTN+F9pEQlYtNBuDdb922RzXb9XAp2XRs4PasQmvfM60eBY06mujo?=
 =?us-ascii?Q?rq7Rbqfxzh6qhU+NUNj4qtghHdBLDH8CImmRqo0jVUn19ZYMltOQ9lbqtIjX?=
 =?us-ascii?Q?QQd4Tx6WofjTDqMn++hwHIaPUhACCeuD/OtHYI0S8QTFWdXLqjwRpY/jXp0g?=
 =?us-ascii?Q?SCA2TEFdqgXm3BTgYFMCjSlxi05Sss1sHz9/ubbj1+Oppf73f3LRluCsg026?=
 =?us-ascii?Q?fLtHG+gZU+h33RWjCmhCR6HDDU64DMId2ikYLkA/5chm0s1dykZUZ5IA0fe6?=
 =?us-ascii?Q?Oq+xJJKYyvAj+tDD9tWw8ae3YIl1HrvtMoP+yC+FbgtHT+dj3T7GmvlKDDmN?=
 =?us-ascii?Q?eolOXGmS0nKL02iOdQBgSOrIyHIGvag5tpUIk8jUmkX+30NV27YFA0qbL8WW?=
 =?us-ascii?Q?7QvHQq2YXH1qYfJKeoMXLpvxQLPZ2PW9OuuDqk/Ky1j/Q/2zxcLHQ9lOM+jy?=
 =?us-ascii?Q?dMQqfGU2WE2fkB6HqYTnxIfZgaGZji0rcpnA09Cd+rC9jutR7/OeKV958zw+?=
 =?us-ascii?Q?qVdlL/4eVk3NxgFGqS5OITa5VDkiKUKU17OT7oJWLEGCGCtT7dNtllp7kN+C?=
 =?us-ascii?Q?XFX7TYkFU6F0hVm2C4kd5sIqWaQirLEVQBiy0SXCsISI7UTp5xWqCBwoxFWu?=
 =?us-ascii?Q?/JMJnhJk4nw8paPbjurrLpbNS4MoO2Cr0Vk+y2LdMY801o19n50alvPC9z8C?=
 =?us-ascii?Q?XujARSIjWPnlonuvNyaSwY5BjYXZY1NetNjAlT6Sxvv+3GI4EvKHzix5dPD1?=
 =?us-ascii?Q?ncI+5u6Adi2AobatdWmddPM/sRYOrJQvbsOjUU3DZQ2KM3XED/Ag3JV4cdLT?=
 =?us-ascii?Q?UzmPcJkpD0ICiGTpVY3toJB/lFJp+SGVFz02VmFziv8RCODdWojF9UqvKt2G?=
 =?us-ascii?Q?xSReiUuLssuaFcbLJf+N+kP5m8+bAsdnwAatZEiNooEUeLI1P8WsOHeVItUX?=
 =?us-ascii?Q?YIi4chbc8vV2ojsdtxkYWMWBR1ptZMGnLnidE3LkYkEeqCRjTptS90DF5YQK?=
 =?us-ascii?Q?wuIAXWcCFD2WDjbQSx+adGukVG+ef9C2TVQI7tLfIpC+IdtcmEpA61bDOqVl?=
 =?us-ascii?Q?3HQ1OISoqP9DsIHVsXI3YDLZj+D/+HMU8ImnMaMRfAaJziH+6B6r98OSwzEK?=
 =?us-ascii?Q?Pbxs9bwBigFqQajmXe7VEvjKlwZKwU+Inna+LGiOtVrmoWHDaUFp7LadXo4d?=
 =?us-ascii?Q?CUgGioIZJ+ASko3J6hDIC+MsYmcOAbtKYgnhrkis7HX/SWKmZwPkS+pL0i83?=
 =?us-ascii?Q?DQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 776208e3-3366-4c57-3bd1-08dcca43cbb8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2024 05:06:11.2924
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RWVmu2uUfbUjqvxS7GZOS0BiCSC3vkNq1/HDNIgLoq7AdQDxMuwfjkiR8BqSg+JWeMW+2o9cGDyVY/VerMN0pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4636
X-OriginatorOrg: intel.com

Hi Ilpo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes linus/master v6.11-rc5 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ilpo-J-rvinen/selftests-resctrl-Generalize-non-contiguous-CAT-check/20240829-212248
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20240829131657.1917-4-ilpo.jarvinen%40linux.intel.com
patch subject: [PATCH v3 3/3] kselftest: Provide __cpuid_count() stub on non-x86 archs
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409010931.Xl6TB9hc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409010931.Xl6TB9hc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   corrupt_xstate_header.c: In function 'xsave_enabled':
>> corrupt_xstate_header.c:29:20: warning: 'ecx' is used uninitialized [-Wuninitialized]
      29 |         return ecx & (1U << 27);
         |                ~~~~^~~~~~~~~~~~
   corrupt_xstate_header.c:24:32: note: 'ecx' was declared here
      24 |         unsigned int eax, ebx, ecx, edx;
         |                                ^~~
--
   amx.c: In function 'check_cpuid_xtiledata':
>> amx.c:123:19: warning: 'ebx' is used uninitialized [-Wuninitialized]
     123 |         xbuf_size = ebx;
         |         ~~~~~~~~~~^~~~~
   amx.c:111:23: note: 'ebx' was declared here
     111 |         uint32_t eax, ebx, ecx, edx;
         |                       ^~~
>> amx.c:131:13: warning: 'eax' is used uninitialized [-Wuninitialized]
     131 |         if (!eax || !ebx)
         |             ^~~~
   amx.c:111:18: note: 'eax' was declared here
     111 |         uint32_t eax, ebx, ecx, edx;
         |                  ^~~
--
   lam.c: In function 'cpu_has_lam':
>> lam.c:124:24: warning: 'cpuinfo' is used uninitialized [-Wuninitialized]
     124 |         return (cpuinfo[0] & (1 << 26));
         |                 ~~~~~~~^~~
   lam.c:120:22: note: 'cpuinfo' declared here
     120 |         unsigned int cpuinfo[4];
         |                      ^~~~~~~
   lam.c: In function 'cpu_has_la57':
   lam.c:134:24: warning: 'cpuinfo' is used uninitialized [-Wuninitialized]
     134 |         return (cpuinfo[2] & (1 << 16));
         |                 ~~~~~~~^~~
   lam.c:130:22: note: 'cpuinfo' declared here
     130 |         unsigned int cpuinfo[4];
         |                      ^~~~~~~


vim +/ecx +29 tools/testing/selftests/x86/corrupt_xstate_header.c

b7c11876d24bdd7 Andy Lutomirski 2021-06-08  21  
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  22  static inline int xsave_enabled(void)
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  23  {
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  24  	unsigned int eax, ebx, ecx, edx;
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  25  
170d1c23f2a3569 Reinette Chatre 2022-04-25  26  	__cpuid_count(0x1, 0x0, eax, ebx, ecx, edx);
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  27  
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  28  	/* Is CR4.OSXSAVE enabled ? */
b7c11876d24bdd7 Andy Lutomirski 2021-06-08 @29  	return ecx & (1U << 27);
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  30  }
b7c11876d24bdd7 Andy Lutomirski 2021-06-08  31  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

