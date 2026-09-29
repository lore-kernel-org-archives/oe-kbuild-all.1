Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582062236FA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Sep 2026 01:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790645619; cv=fail; b=PdgbsBlKvt6/zK6fbWtkSIBIBhDHrEYwIwL9R0YGUiUr6ewzcKuBnO+vAMXoMEgwSacKh1qYgQg51et2gCIkrq9xFGgXGNgGy4uWyRAJiS9TJ9bjhexLlti89psu9rsvvZLABbTzkVt7ptEXMaf7guKEuHsCAxibHoXKwIwPkA0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790645619; c=relaxed/simple;
	bh=xFPr7lFWf7ZR+YxfTTwou6kTa9tM6lpLv1qxImx3xzA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VY0qQe/tJndtGsSHt5BFirdm4fd6GJ1jVREcxW8KArJI0XwWwhZE3PGQH35ayST2lOhVW9s2QBjYBXcCl8whft0PRnOgYmqEO68dTIvFPSVqe4wF+ubOmtDgVN9peutV07m2HHgBKDN4UmzHmGZBOWJFLiStywBZFvv/yMgEBTI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CsyAsjk6; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CsyAsjk6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790645617; x=1822181617;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=xFPr7lFWf7ZR+YxfTTwou6kTa9tM6lpLv1qxImx3xzA=;
  b=CsyAsjk6o/Iu3uGXAEFe4qBODAsKDxqRm76aIZm7ocDXyByBemGfMleA
   ooD3wiOJKaCFEgoCLw8cPadl11Dv4UBCTKyEY7dhzEd9SQJr6NiRflIj7
   5SVVYSXGG4bO7M57s3iZXOmuCkfm144pjGlKk3lRKIvq/gGGO/oEVWeJx
   jZJ1HXHtHHYYV4HLxILjTxEMKy42zXzJ2N7xRutmeibgimDBcPtGlIY1r
   bLbks491GMlHmii+IRiJxO4blH+eUla7b2tSnlCN7R1FEb+XqphQyXump
   uYkwcZCvhiF5MQhU7mfrpuzILaTEuFpsTx7JZ4HG/UagXouYOAvXbBcN8
   Q==;
X-CSE-ConnectionGUID: vrocfOOiTXmWUhhHZua1XA==
X-CSE-MsgGUID: u+Bw+a6URTqfw3pAgiDaxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="102016226"
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="102016226"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 18:33:37 -0700
X-CSE-ConnectionGUID: lkTsG642TfO+n/ECpUCXEg==
X-CSE-MsgGUID: ux4ILqGUQ+iKuFFC4Wlmkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,129,1787036400"; 
   d="scan'208";a="303161374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 18:33:37 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 18:33:36 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 28 Sep 2026 18:33:36 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 28 Sep 2026 18:33:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZBvyxOAG0VDHNYU8cAlR4fpm7XKbH/98HzN5epcXL9xbdx5TkQQqPUd/0RYQrLvWSrNL+mxOlBQ0GZcH8svkGWh7xtaZ+Qy92kS2/lt8VZ99db2Mizfwqrgl8fd6j8LXExDv4fxJNvy90Ei2XKRTRFOLrP26OWfNb469ju6beFJ0/5pMvXia5h6xsdYAifOXSnVj/3cl60/j+MPlQ57m9xt02dGwq6gPqyDqS2g/qRp6qdpY0EOQH6LACmpAl3Xx6T+2rghSLSNS+vWy/Lf8uUVoxxmVq1PffCyEM3wOPGCu6GLH4WV62N3pz65+QQ9fJfF8HDaMhz2HXMmVYVpog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAicf2Mi/3EJnFAHYDqSKAEPV5oFhJuLa2FdYc0FofQ=;
 b=gH6PqurgzePBJy48bLSinkb3d3fGml9Tj+rxgkhj0ORzrwpvGpgNqu7PzQT0X6aWXinoS3KnqkWdxkUQieAY/qAJhC7c0l4kssecX0utRdw8rEPI8yXQ8MAZHoN9sycZHQp9+7aPeh+x9UJ7QYCMqOu/VM1GiSOMukjlykXg2DPtA+7dFF1GsyLK2F2pDL0mMym/D/029e1kdImyPhyxEQFEe+Dul1aWRNwYlzvIszikw99o7wXP0K2vYISdDBBai1hD5Cz4gc4cWbn2ezCU8AoU7B7UgDQyrHTJg3mGFeIGLBSa1uQiYBHpvmCCxSzjLGDYOgSOuVvDn4dyCbxBcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6132.namprd11.prod.outlook.com (2603:10b6:a03:45d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 01:33:27 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 01:33:27 +0000
Date: Tue, 29 Sep 2026 09:33:19 +0800
From: Philip Li <philip.li@intel.com>
To: Marek Vasut <marex@nabladev.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, kernel test robot <lkp@intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, <oe-kbuild-all@lists.linux.dev>,
	Frank Li <Frank.Li@nxp.com>
Subject: Re: [linux-next:master 1377/10910]
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb:
 vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
Message-ID: <arsVX0tTq2WaVM9S@rli9-mobl>
References: <202609252351.5UfBIiOJ-lkp@intel.com>
 <b70365a8-9812-434a-b514-4604835cf347@nabladev.com>
 <735d64cb-b35b-4854-8b6e-d1f32822c244@kernel.org>
 <8ed2f318-5758-4d2d-9e31-bebbb067b913@nabladev.com>
 <27062652-12e5-428f-b900-e50cff70452e@kernel.org>
 <17c2d593-194c-47ff-9c55-b86cba82f415@nabladev.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <17c2d593-194c-47ff-9c55-b86cba82f415@nabladev.com>
X-ClientProxiedBy: TPYP295CA0057.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:8::8)
 To DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 8158c3e3-02ca-4e6a-eda2-08df1dc9a962
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|13003099007|4143699003|3023799007|10067099003|260925022911599003|56012099006|260925021911599003|260925021311599003|11063799006|22082099003|18002099003|220923002;
X-Microsoft-Antispam-Message-Info: Oprjxzdzo64AlDMNOti34SvsQ3Q0Tq1y94SLUmbnQFn44/gGofBAz7zoPMXVG4sQe5M6Mm5nM2FEok4BNBm3Qz+EX0zmLdmI6PY8iu6uCYxA+Qv7fYEPbz3l0ZekvdbDRvJSvL3crOW9CRVZzEjsYHrlMDkrUIYbQ1SljDLcyIMCGNyB+Zi0ID4lV3XI8OOV+zSSDfo29T8AORQ8UXMuilxO/MHQQeCRDGSBYbMvSlwUcqmIeKbFtlDZOb/nQe+P/Hq4jxEiLJvpYAZOnaOq05BgYXnrK/70iSc6wSn2YEYGOgxHJNJxZE/bJB7PFZSUnLp7RmDVMDh+9Ti6stwM7MrNmh9zb1+l9rtGAK3aTOpWf2YdSe0WbV5zhm74BLQYvQHA/XEKGFt5cZ2x5+dhGUN8hSwOlmJkimnJtlKV27UFqb1yr/hn75eYr62avKo/quPi4l7DzLv7W9rE19kQjjwPKMR7I2ogPcsSq/4byCuT7QYbwjOmEBTsGpqmT+HLetJxxpWFPv+3fRtzHhyDEEz/KwVKv1TVuC7VEAIb+5QPhxTEtEUgzhJx659YYJ76CSQhHPgWCCDm8nk167qCLhCqniQsjoIcYC1HPUOscWiFZJXgZSvHsl71PbuiE3DCmHUPl3zRfIiE2SogiL8B88TewF9M75yQXm29Ej99gmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(13003099007)(4143699003)(3023799007)(10067099003)(260925022911599003)(56012099006)(260925021911599003)(260925021311599003)(11063799006)(22082099003)(18002099003)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6iiJX+9pDh0c4JggwfSszkUTML/GoW3wP0PzmHa4Mqpn7uRPYbleZr48Hh9Q?=
 =?us-ascii?Q?MPmIqbYHkDwvc0oSi+oo6wGW7mzchVfTF41CWspxhl9dUbuj5D1yCjHRRg8G?=
 =?us-ascii?Q?haahuHI0OK8cQSzs7K2OfZP7ImSJ6hVWAyVKyET5ryOV+KCz2vN5wcUbkFtj?=
 =?us-ascii?Q?Q3OVOf8bB9ih4WdD5YTjpU2mqzn7sN1jCr6QcwSLMgX1eB8+4JInGqMnbhW4?=
 =?us-ascii?Q?wtQjw48HewowJ3FNcszgdi2Xu4DMoZ8hW659HkkZ9unVgGZ+EtPpvCHRHeoq?=
 =?us-ascii?Q?mS5SFNp/ip6NT17BZWMPyeVrYiMD0ZKyRz1Rl3fOX7Fs6rp8FE8oiM3in2NJ?=
 =?us-ascii?Q?GM/5bM/a1QHAY2ca2+zoPLpTWvDBeQjc1b+j4WX39AhsSCCCXQ5m4nOIbRWD?=
 =?us-ascii?Q?NAQMef5zHKEjtxE0RIh7zjBPsTfSgZ/q0dhPErVd5Ea5tSqOJUQjLQyaXsHY?=
 =?us-ascii?Q?8ZRJV27XRBqQDyjCbMx3cEwsFkkWV6AR58JEDj21mznoHp3q21BQBhdLl/5q?=
 =?us-ascii?Q?lG4BCK5LqggV5g1j6keTCcKFVmK3R3ZmYndbpL3KjkmAoi4jTJTiOYdgkSVg?=
 =?us-ascii?Q?5Iiwkcnu4lS5Q3aW+1zzp3kqDYLPpmjBkZCzFC4Ho8nLp+A0BAwMh12H6C6H?=
 =?us-ascii?Q?gmIDTJPIYV+tBu93TRutDCJKzx3PQSgkk43tXydYEPWAXxPfdjfv0WAIymbP?=
 =?us-ascii?Q?DNLmkFJZHqMJdcAapQe9AvH8VzMSjUx6wezt34D28ALRA9k8q6iP14DabVlp?=
 =?us-ascii?Q?VEgLMEQa+kdiJaLfB+AgGlT7gHJCk/bCbfWSqOPB2lXNf/z3VyrpAFMnNAwI?=
 =?us-ascii?Q?cYRTIMUomnIofvMyE5kNomB5LmFHHTgPsnzyUgLbnCRDUnhmQoSCOWe/e4iJ?=
 =?us-ascii?Q?NrXuujqWN3Fk3pVnT1wQCXw1e8TvgtKwoj+UmCEFnb9txBP4Au9mx9TnG7JN?=
 =?us-ascii?Q?69SkZoxvZJ33b9RmNfknj5xBZz39HR/60ZHGgYKwe12Et2hI6Qz1GAGYEoH1?=
 =?us-ascii?Q?XhCR4sgqNCl/TBwHkgWGWKVeF6i5lXxyaIOU5LVra7Aib0M9LfRKyx1hKie8?=
 =?us-ascii?Q?stUQEr3bTPxjmGt42JTqLHTgjJxnJrpSIbt3Eh6PZiYTnQrc61rrB7tmoBvH?=
 =?us-ascii?Q?eeSs/PqVPPzI39FgB+jzM2KC30070nvi4hfb2MJ68TsVxoyhH0U3ZsVOsIzF?=
 =?us-ascii?Q?+Od4+KjmfCPLuk74iqTjWr5egQB458e06iz8K7kMPsQZrw2QJ+pAZ6m4yhrj?=
 =?us-ascii?Q?d/05+Bdpe16Q6FsSJ1Wp44m8XDzNiiYmXQEDtAk6zpvulULlnX+z3KpGAB0h?=
 =?us-ascii?Q?mtGfMB4rKLrWvZRciy5Pitwsa3d3EW2KbZxHTY8IekyeTi8q67HXRl53HrbF?=
 =?us-ascii?Q?WiXT4FeR2zRCPs+eh0q50w7+AYasU2QKGzkDAvGmscNcRh/JBYU5ioXUUz/C?=
 =?us-ascii?Q?Ux+n+ZR7puwNgEWGUl0cnb08G6/1E9ysjn1FPcbLMCXtn94h9mRzKx/XEwSR?=
 =?us-ascii?Q?zlOnclGG5qGhsvPUlP7Mp04kLxxtQ6xnsfb0cqAFqEhQkiclEbxaDbQ8ajWN?=
 =?us-ascii?Q?kzEyEfka2/F7DlvaD5GvvW+oyJKlVtxa5/y/N2MggeaRARquaoftsIW1knPa?=
 =?us-ascii?Q?yOImihegm7Vp0VBVWQzUv7mwv43TOwdM8TLQDeDSgXnMyaa3bQFP3AS/pIgR?=
 =?us-ascii?Q?7Rn3NxTCi3htnMU3CfnZaqBDmK9EmHWMVMPqrxI/EQHIKV5BNkEgqy4oj6Aw?=
 =?us-ascii?Q?1hJyxwMJ4w=3D=3D?=
X-Exchange-RoutingPolicyChecked: NfVCFdGFz8RyNpLKXgQbbkojS2fdv/ZTgzYYhLcLPRZXCsOx5jYVfgOWXpduWYHd0dvDYrn0xAHT146Nd0MVs+4Sd2ZAZdycBIJ63Atn2CjRqkJZWDouZynfpmyF4qewoenDloH618M3e+dbTKbiY66yL8CVzZPHUnMRVMoPjqBW8b74o2z3w1n22rJbh3ydyn3dyLqwWnfH7fiopphc9ZVoDvsT0coSnsGAieWUiKOjcddzeCl/XpvM+rfeSxLlsDnXG2nZvEqPSOvRrwLHayXijVJE63jGbsmJtppV4y+zrLR6gEOpbmXMMbHoRwEfOcz4AX5f1R+NZQuHTiBn7g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8158c3e3-02ca-4e6a-eda2-08df1dc9a962
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 01:33:27.8219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fB8dyxq7qhR1rDG/MqXcibo+UpluC7Dtg0OwtNciHOQXyhlu83jihbD1q2R2KGsIKqXckEkAjLHxbwurD69irA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6132
X-OriginatorOrg: intel.com

On Mon, Sep 28, 2026 at 09:05:03PM +0200, Marek Vasut wrote:
> On 9/28/26 7:00 AM, Krzysztof Kozlowski wrote:
> > On 27/09/2026 20:06, Marek Vasut wrote:
> > > On 9/27/26 6:59 PM, Krzysztof Kozlowski wrote:
> > > > On 26/09/2026 01:00, Marek Vasut wrote:
> > > > > On 9/25/26 11:46 PM, kernel test robot wrote:
> > > > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > > > head:   f5f84daefcd92d7a630066635ecea1433ed5eac7
> > > > > > commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/10910] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
> > > > > > config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/config)
> > > > > > compiler: aarch64-linux-gcc (GCC) 8.5.0
> > > > > > dtschema: 2026.10.dev2+g840a01d41
> > > > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609252351.5UfBIiOJ-lkp@intel.com/reproduce)
> > > > > > 
> > > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > > the same patch/commit), kindly add following tags
> > > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202609252351.5UfBIiOJ-lkp@intel.com/
> > > > > > 
> > > > > > dtcheck warnings: (new ones prefixed by >>)
> > > > > >       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> > > > > > > > arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
> > > > > >       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> > > > > > --
> > > > > >       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> > > > > > > > arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
> > > > > >       	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
> > > > > +CC krzk, I just cannot reproduce this locally. Do you know what I might
> > > > > be missing here ? Thank you !
> > > > 
> > > > The things or versions listed in top of that email.
> > > Linux has plenty of examples of such shared-dma-pool/no-map entries:
> > > 
> > > arch/arm64/boot/dts/freescale/imx952-evk.dts-		vdev0buffer:
> > > vdev0buffer@88020000 {
> > > arch/arm64/boot/dts/freescale/imx952-evk.dts:			compatible =
> > > "shared-dma-pool";
> > > arch/arm64/boot/dts/freescale/imx952-evk.dts-			reg = <0 0x88020000 0
> > > 0x100000>;
> > > arch/arm64/boot/dts/freescale/imx952-evk.dts-			no-map;
> > > arch/arm64/boot/dts/freescale/imx952-evk.dts-		};
> > > 
> > > Are those broken and need to be fixed, or is it dt-schema that is broken ?
> > 
> > This could be caused by recent dtschema change, which was also recently
> > fixed. The LKP report had dtschema git version and as you can check it
> > points exactly to the version changing reserved nodes (which introduced
> > issues). Not to the latest one which fixes the issue.
> > 
> > If issue is reproduced with 840a01d but not with later, then obviously
> > everything is fine.
> I can confirm that the issue does not happen with current dt-schema/main
> 5687115902ba ("schemas: reserved-memory: Fix invalid oneOf match with
> iommu-addresses") .

Sorry for the false positive report, I will fix the bot to upgrade the dtschema
to use 2026.10.dev4+g568711590 version.

> 
