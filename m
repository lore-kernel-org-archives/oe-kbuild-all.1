Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E5D1C6FE5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 May 2025 04:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747628082; cv=fail; b=VlPGtZKZUNgzJSMpCjqPiuf5yBQ0axgyVrDc8Qc6maf6KQIC9xl4HcTRRR7vs88dcbfR77SdoH+IeiEhX8WsUPEcZJ71Ra2P+UFKN7xPQdIAKeRpgY9KlDHSu+mAeeY/9dV141YzEnUQZ5yHKeV7ex13Sq0ORlyDoYHCxb9+jPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747628082; c=relaxed/simple;
	bh=bJnu1BEoDCM4Iry2qxM7r6/4ZrbxG9S/HDqjRXHLF7A=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kNk+axVZ++dYkL/TWxXOPjbknfw491MjQ1SxnLR0fgdYPJR4F9tWE/gGd82yrEFEjNaS8dIzyflbogK2OcMetD73rNB0Rybl1Xa2FWNuNOpFfTtPurwF0UQvQiDM9LM7nesaRfuXxGQgnzBXaxLZS+STPIhEiokEYqtPSHDWfXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V18rXrB6; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V18rXrB6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747628081; x=1779164081;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=bJnu1BEoDCM4Iry2qxM7r6/4ZrbxG9S/HDqjRXHLF7A=;
  b=V18rXrB6bDv5qIuqL213oQsPjWzm+9mPbaeZ4FGjDZquookK0S5vqsSa
   aFOrOzFrcN3roNoZ094Oscd/1dWxNYOw+NtRySZB0YvyBA5wGu0cr6O8a
   SnrOHuu2SyqgGG4izA6fY/ZEBsqpDtjq3uCE7OxzkoOmvfVagmiFpEk7C
   5e/2bJmxG0eya2479bpjlT8TnvNCoCfgbmJ4tzBLSEOogabCcPL3Ep/Cc
   ijQpr5RTSeR0noWQo3lm2JAbKblpdm2B8z0dvw8jiahF3JckthamZBYxk
   JIBXAvj3WsDsfLvZwoIVqNO1ZgicC3RmzWTGd0AMvB1Wq1NECFwCADajI
   Q==;
X-CSE-ConnectionGUID: 58st/N0DTSOaeE4uTJFC8A==
X-CSE-MsgGUID: 3Z+xjH37QUyUsAUKuL6oPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="66927718"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="66927718"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 21:14:20 -0700
X-CSE-ConnectionGUID: CfocgOnGTdmu87+t8stlaA==
X-CSE-MsgGUID: Qo1KSWYqRe2r7Mij3DoG4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; 
   d="scan'208";a="139156057"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2025 21:14:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 18 May 2025 21:14:19 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 21:14:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 21:14:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhGHGkM+Q+liWc7fH27zrlieaBbcIZkACm1OIlmz/19ogzlJ+M/DYI4u3BeVthCN+pZ8phZ4TnxqidhMwDbkb9OKezmQorNsylgtQeW7BnaNjOfyl8AFchVyswKTyT3SoIZz+UxHa/ZLzOHyCLVooeRgs2skZ+R88bN8KOTfkJfYeo2HOmW3X0ee2456hDYnfjT3Kc22P+C2gTdmSATGEat61wqZmM0aXLTpCRlbS1BxsoX+XIz0ZiMX/FaGB6NxBBFWRP2PE0AxCURMbvK2i4MXM3lun1CFOhqtIODSVdR7ihQf7kM33cdP7HeQgZZNlDkE9tGyTNoVfqUCVHLuEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auZL70gKlcBI0YNXMQHDkTeshGDw9r7FKaOuUnGapUE=;
 b=osA0fDwcS/8mw7uT0YLS3bX9kRzXCDEbFof97Ld7H7GMrqx+IYOkRmaqww3wf8+yd7vwF5q68PcZLqRHs6sXJHGXOzD0khyeTFYykmm3XS0om5hTPeiOAldUkvyiG29d5k34eXoDWoKY1KI10o6nVGLknJlQJ9OXEBQEU/kXAZWYCjU3sg2IKQeiL/JGNhFOGBcv7nlvK4xFoQ4jTnV1iLry2r4yPZvpoqMkvkE9LOZHrdfp/JyAmiAqZU64dvMyGqR8xAMsFD3rmbrCenM4BLpN9Gk/E/3DD/LRslwpWHVHO5tLyOKj08lwiqZI5SqdtjGS4M1KyPpzqJ5kttp8zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by PH0PR11MB7616.namprd11.prod.outlook.com (2603:10b6:510:26d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 04:13:48 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%6]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:13:48 +0000
Date: Mon, 19 May 2025 12:13:38 +0800
From: Philip Li <philip.li@intel.com>
To: Dongliang Mu <mudongliangabcd@gmail.com>
CC: Randy Dunlap <rdunlap@infradead.org>, Alex Shi <seakeel@gmail.com>,
	Yanteng Si <si.yanteng@linux.dev>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>, Alex Shi
	<alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [lwn:docs-next 37/72] htmldocs: Warning:
 Documentation/translations/zh_CN/how-to.rst references a file that doesn't
 exist: Documentation/xxx/xxx.rst
Message-ID: <aCqv8nUmt1AzyTLJ@rli9-mobl>
References: <202505160627.WtzIIpL6-lkp@intel.com>
 <dcb8c986-b6ec-4803-aa88-2ef2670a6b10@linux.dev>
 <CAJy-AmmsqK3x97yncNrnugCNrf5qNOTUwixFNiBifqigLrp2zQ@mail.gmail.com>
 <aCqhRwOxvUiCFtpN@rli9-mobl>
 <83ed3edd-97fe-4106-93d5-4058a61bc4a3@infradead.org>
 <CAD-N9QVGSP3n+T13PP=5eakmerdERkYsrO5i9-O=9xoSdmB7Gw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD-N9QVGSP3n+T13PP=5eakmerdERkYsrO5i9-O=9xoSdmB7Gw@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|PH0PR11MB7616:EE_
X-MS-Office365-Filtering-Correlation-Id: bb84c70e-851f-4c61-62ec-08dd968b8db8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnIrRzVuOXNtNWVLZXdzcjdwbER0MUgzOSs2SENjUnQxaXJ4bzE2WVNERUQx?=
 =?utf-8?B?OW55dkZzbGpqQzVicHpWVXZSUmZDZWZWZ2J5NUZRck5OTElNbXR6T1IvY0lZ?=
 =?utf-8?B?TDcyQS82SEFwbjJ4YXdLVk5pRmVHMnZEb3JpVEZ0LzJseXRTSHNNaGYzMVV5?=
 =?utf-8?B?NUNxWXRHRWFZWHV5V1VYamk2cjhIM095eGVjZDJJVGNDamtWR1N2SVVXV1hZ?=
 =?utf-8?B?YVZmU20rWVVlZVJUaFppUFJTaHBvK3JURlNrdUdPYVB1VmFnekU0VGVjTUVw?=
 =?utf-8?B?ZDhmOCtUdUJ1aWQwOGFNc1R0djh3YjU1Tjd2WnVudmVHYnpQNmJBdkQ0OG14?=
 =?utf-8?B?dUxpZlhjRVdlV29PQ2I1UUlxOWtJa1U5NStEL0U0MVRXdzVkVE53WXAwTVlN?=
 =?utf-8?B?OTUxMy9QVGNZUm03Nm5xUVpVQk9rbVE5eEVucGZ0N1dJMlQxN1ZVcVUrVUd4?=
 =?utf-8?B?NGxucFdtRmtYcTZzYk5NSDlFakYyUE8xdVhRZDlpUGl2VElPSlVUdTB5eElT?=
 =?utf-8?B?cThXbVE3VjRMY0MrUXpCeW1ySFc2R25kbFlEbzFlQitNVHY5Z1BCdlZZN3Bi?=
 =?utf-8?B?Z3M1aXJDOVF5TExHbUM5Z0NlK0xoTGpaalRqTFJtWHJ3NjAydE9NMlhWMG1R?=
 =?utf-8?B?aW9INkppbndkV3lFZ0U4MHNCclNEeU93RzN6RFVNc2pFN0RteEx4Tyt5bDU5?=
 =?utf-8?B?NEs4aSt2N2lCWVI1UDRsTXFIRWwzUlFMamZTRlRIOFk1bzQ0bXU5RG13VU1k?=
 =?utf-8?B?SU5CTGN0YkVHVWladHNpTUtyWHcvcVFSYXRQOERvUy9NUmhMVDA5djdHaHUv?=
 =?utf-8?B?MWRUOXVTelVDc01CQWN2RHZOWUdoRlhxdVpuWkRCdXNqVXdqNkUyUVdZaFZP?=
 =?utf-8?B?dE4xcmpTd3dsaEh2NkM3V3lsR0xncVM4dnJaWVNhMEprZTFnR3dZNnhvTTc1?=
 =?utf-8?B?MFE3UWt4UDFma0NoaG13eFd4cFFhRTJHZ3o0U1RQb1lCMFI5VEp1cHF1RUxo?=
 =?utf-8?B?WG5zM2d3amFVMzBDSnZreXcwSG1GeHpPUitRQVFvZVFMbnlGRk53bzE2V0xN?=
 =?utf-8?B?U2xMTUk4cjlZNTRxWlhXc1VGeW1iNU4xaGJJdUN1eTJhSmVpaVZPWW4xVjkz?=
 =?utf-8?B?T1h4RjBXVEhFbFMrOUhJNDZIWDV1V1VMUWNNblhtVTlZZVhNcXZKZ21vaE5U?=
 =?utf-8?B?dmRaOGF6NHREUFdwSTkxcStIS2poWlZteVU2eHl4N0VQK0NKVDZaR1hWWEZj?=
 =?utf-8?B?OTN2dHdvbUo5WTV0VXNacjJ1N0RVckJMcTd2UlFvb2Y5Yk1yYjZqbjdodXBv?=
 =?utf-8?B?ZjczUkJCd1VYeHpkZmdQUkNOUGxnVVo1cGZBWVJMT09KY3RoRUE1Zk9LaFdB?=
 =?utf-8?B?em9BbFhidGtIaGRtaTYwUC9ZeFBmMFUxanVjd0p3K3BmWXNvdXI3TitjcnlG?=
 =?utf-8?B?TkZtK3l4Qi9sSUw3M3dsV0Z0eTNKT25QQVozSGpRQUZZTFYrTmNRTjFuVTgy?=
 =?utf-8?B?QnJjdnNLaFVZenlJZkhmeGozVENYWXZGQWQ4cWpKTkJrdHg5d2tCVDF6d3k0?=
 =?utf-8?B?Rk5zc3dnUGphM296MnpnZ1VZNitJemU2UE9DNlpXN2U4cStOdmsyR29VWjNn?=
 =?utf-8?B?amV1alFZZSs1VHpMcUR4S3JQQ1hlSHVPKzBNd3ZpSzJPZHdMRHJ5ZXZITnpu?=
 =?utf-8?B?YWlLekNROE10Ujd1dnVMeDZpSW9uVHNBY1NyT0NybGJDOU5qa2dxcU9wWVhw?=
 =?utf-8?B?UTU0ejQyZ3RJTE9wcWRzc1czQVU3NlppVnpCVjlhSTR2L0dRbUNkWjdkYjAw?=
 =?utf-8?B?RWRNenMyTDMrOVR2cXVQL0FzNGxMS2hRU2svK2NQbHVNUDhzalNJTXpPVFVX?=
 =?utf-8?Q?EcVJ+QNs+hQV3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDRDOWMzYThRRFJLQUlBOUliU0ErTXI3YWszYm43R2YrY3Brbit0d0NYdlBi?=
 =?utf-8?B?eU1Oa1FQVm9tbVpYWWNZZ3pFR0M5REpKa2YxS0txODUzaWRLajA3elZLem1P?=
 =?utf-8?B?WGJtNlR4NUQyakVTa3E4N3dFc01xN09zeVRoaVltOENBaDhPTnpPdEM2ellv?=
 =?utf-8?B?aFdRU05nY2k4UUd0MjJzdWJpdjhwSmk5anc3RzJveUVWamcwQ1M0dk1YZnY1?=
 =?utf-8?B?cHRhRExZQzNHZER1TkVMZVRIQngxMytZV3IyUG9MZ0N5RENuUDIrZVVsT25E?=
 =?utf-8?B?WXNyWWNnaDlYQ0dnb1ZhUE01T3ZWQlhjbllXNG5MQXBOQTFPT0I3bmgzWmRy?=
 =?utf-8?B?SUFpSVhMKzJOamlGNHZ5eVB3QUhSZCtrSTNuR3RQblp0clBiRWxzQk5VbGVJ?=
 =?utf-8?B?MWIxMzJBNEhRYm5STWYxOEE3S0dOZUUyaGpTL0lyNE9zRENYWUhHL0M4SzN3?=
 =?utf-8?B?MUh5eGlaY3QxdnJzTTVzSXUwQ0s0aUQ0enROeHk0NUNyTUplYy8ydzV4SURX?=
 =?utf-8?B?UFBmbGdZQktydWhsdmNjdHdkbVhLWHE2LytqdlVORUpKSXdUNnkwUjI5aStP?=
 =?utf-8?B?YVNJajEvVEtHTHovcmJvT3ZrMmQrb3JEWHdtdnIvK1p5cml3dnorbFFGZ3Bs?=
 =?utf-8?B?T3VWZ3ZZbmE5NWU1VGVMWlRoMDVWY21lZ2pmYlUxUlVSYjdscm9yMUIwM0Fr?=
 =?utf-8?B?eGxpb1pVL1pxWjBxb292Yy93RGMvSCtHZFRmTW5YajhyQlAzN0VWd0dweU9V?=
 =?utf-8?B?YjBLeWw5RkY5OVF1anptUDBkZHRNRGpvNmZTYVlBRW9HbnR0ZjI1eDFQOE1S?=
 =?utf-8?B?QVVoc1BQbmg2d1hBMzJrVDBqTzEyTEJtcGpxeWFKeXJqMFFXWTN3Z0N0dkhR?=
 =?utf-8?B?SWkzWnlRYVp5ZHRxald2bjlDVW1icHduRXhVSDdWeFJXUXk1REtJWTUreGll?=
 =?utf-8?B?TnNndUVoNlhpb2RONTdDL3pvOUV1eUU0M0lQQUpWaTAxR2x3ZHY1WThVNFFX?=
 =?utf-8?B?aVZWaExDWmw3SWJuOURIaDVhUzBxeHh5TzlJUUpwcGkvZGErWWdSaXZ0YTNw?=
 =?utf-8?B?R2lrZnB5a2V1di8rMjVaZkZKazhSQUZobzRFSDVnVEI2akYxMGVqL216Y2lR?=
 =?utf-8?B?RlRiZnBxKzR6dHNuMWRyc29MbHhIT3BPSTBGVFExSlRQUVZHSVc5T3hURmV3?=
 =?utf-8?B?dEkvUERNUzF4cFBoNzZxWk9CL1FEMzd5aXAxWmhHUjUzYTU0RGxzOFFPb0VT?=
 =?utf-8?B?cHMrQUM3MTlDTkNnUmh5TVlvTDg4SGl5aFh4Y3lFN1J4UXdRYjhqM1I2Nmd1?=
 =?utf-8?B?Mk5xa0xnTy9ob3A3Uy9tR2VoVnEvTDI0ZUJDci82ZnFuZHZJTzJuVm43WTZl?=
 =?utf-8?B?cVdkaW5YcytRV2MxUVpOS1lMcVFzUHlWcUFIQUthVTMvdVJ3bVZDbklUeWtY?=
 =?utf-8?B?bCtyTmVHUW1ZaHpHU0EzMUJzTk5pNGVSWklKNldmZ1REcnZyejYzcE81c1hk?=
 =?utf-8?B?dVJoWjdmcEI3dmdaWGlBeGpqSEV1cGthVXB1bzREbkg4cDJhUzNBOXNVd0Zt?=
 =?utf-8?B?cmNrRzFwZVd5d1I1NGVmMGNpb1JNTXpmaHIxRFQ4VDN6aG5RTlNIOU1hMnRs?=
 =?utf-8?B?c2d3YlhhTGorQkNIMGRrYU0xOTg2VHRGdVZEUHF0MmxIT1F2QUZrRCs4M1dI?=
 =?utf-8?B?UXFKbVg5TTRNbmhaczEyWFU2T2R3aFJ1di9nbHM3bGFWRU40cnBUREtqUFVh?=
 =?utf-8?B?MjNObDhuT2hiSWI3OTcrUWxOWlhnZFlXdURacjFidmR0ZUZvZ2FhU1pDTk12?=
 =?utf-8?B?Y1RpcUJ3QUZQc1hoaW5kL1NOYWF2R0RFaXp2MVZsZDJGS0NCMHJUQU1kQXBl?=
 =?utf-8?B?RGl5NDE5bmdFWHhzOUVzc2ZpazdTOTVIWTlqcUNIUkord2dzRFN1VmZxdWk0?=
 =?utf-8?B?a0tjbkd5YThsd0dsMzcvclFiay9oK0dqMHo4bVdIY0JSS0owaitkTzExMTJr?=
 =?utf-8?B?LzAvdWtQTzhpVE00Sy9LYlRYYzdUVERBV0E4anY3M29vYk1WOWJudWR3VGpo?=
 =?utf-8?B?Njl0eFA4QWQya0JlcVFIUGJwSmJrL0dEeHFTRlgvYTI3REZiZnZpcStFd2E1?=
 =?utf-8?Q?Ssf2mkqJBif3ojgV+2LIhgyMy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bb84c70e-851f-4c61-62ec-08dd968b8db8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 04:13:48.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9RVJvAnC5bKuSMCU61ZiH5M6gfcOLwi/GYftTgObyopHyZjGeCB9ncYJ1W0mvWXgf/K5FHkPYDWHXxF2WyfqWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7616
X-OriginatorOrg: intel.com

On Mon, May 19, 2025 at 11:57:12AM +0800, Dongliang Mu wrote:
> On Mon, May 19, 2025 at 11:35 AM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> >
> >
> > On 5/18/25 8:11 PM, Philip Li wrote:
> > > On Mon, May 19, 2025 at 10:24:20AM +0800, Alex Shi wrote:
> > >> Yanteng Si <si.yanteng@linux.dev> 于2025年5月16日周五 18:02写道：
> > >>>
> > >>> Hi robot,
> > >>>
> > >>> 在 5/16/25 7:04 AM, kernel test robot 写道:
> > >>>> Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
> > >>>
> > >>> I didn't reproduce this warning locally. It seems to be a difference
> > >>>
> > >>> between different versions of Sphinx.
> > >>>
> > >>> Could you please provide your Sphinx version?
> > >>
> > >>
> > >> I can't reproduce it too. My sphinx tools version is 7.2.6.
> > >> And it looks like a incorrect warnning.
> > >
> > > Sorry for late response, the Sphinx version the bot use is 2.4.4, and it also enables
> >
> > JFYI, Documentation/Changes says that the minimal Sphinx version is 3.4.3.
> 
> $ make htmldocs
> ERROR: Sphinx version is 1.8.5. It should be >= 3.4.3
> Detected OS: Ubuntu 20.04.6 LTS.
> Sphinx version: 1.8.5
> 
> To upgrade Sphinx, use:
> 
> /usr/bin/python3 -m venv sphinx_latest
> . sphinx_latest/bin/activate
> pip install -r ./Documentation/sphinx/requirements.txt
> 
>     If you want to exit the virtualenv, you can use:
> deactivate
> 
> 2) As a package with:
> 
> sudo apt-get install python3-sphinx
> 
>     Please note that Sphinx >= 3.0 will currently produce false-positive
>    warning when the same name is used for more than one type (functions,
>    structs, enums,...). This is known Sphinx bug. For more details, see:
> https://github.com/sphinx-doc/sphinx/pull/8313
> 
> All optional dependencies are met.
> Can't build as 1 mandatory dependency is missing at
> ./scripts/sphinx-pre-install line 984.
> 
> For older versions, you will encounter the above error.

Got it, thanks for detail info, i will resolve the issue to
upgrade the tool chain at bot side.

> 
> >
> >
> > > kconfigs like CONFIG_COMPILE_TEST, CONFIG_WARN_MISSING_DOCUMENTS, CONFIG_WARN_ABI_ERRORS,
> > > refer to [1] for detail. Hope this is useful.
> > >
> > > [1] https://download.01.org/0day-ci/archive/20250516/202505160627.WtzIIpL6-lkp@intel.com/reproduce
> > >
> > >>
> > >> Alex
> > >>
> > >
> >
> > --
> > ~Randy
> >
> >
