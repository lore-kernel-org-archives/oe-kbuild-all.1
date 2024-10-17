Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71933111AD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Oct 2024 01:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729127594; cv=fail; b=s1PbZ8EO3RwGInGU9r+1L9RKMxlDU3erQs1fk4xI2v9FpsqxZ/nUGsSS+QW0vnfv5b80uLgYE5yfRXCSpS0XFd/dT6RtqNLycEfPwX6MfSTR5xQ5TJKW8OUK81L69f6UFSyxBD2JS/m+hEJ1nyZYLitTowzo1mt1uhpVE4TYMt8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729127594; c=relaxed/simple;
	bh=5jOy/JOjMbE0mHK/oWoHq9FTtai4kBwzZTkSy9yFgJw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rb9PShWfenQBIh/eY5EpQX2A/G2EEY7KtR9rVg1MJYJltX7qRTFiTJwELpzJUBDM92Xx/K2gTJQ2cIutb5vnxlMR7NDskXmV3lUBJcs0jT0ATbfE4JWbdeWzwUNI40XwmYMCZg3TJ8VcI0Yws+8zIR+Y1Y+G7f7ikR7zv2ShoNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KwRKnxOi; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KwRKnxOi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729127592; x=1760663592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5jOy/JOjMbE0mHK/oWoHq9FTtai4kBwzZTkSy9yFgJw=;
  b=KwRKnxOiNmgaKhSkNJHPX42Oeyc1LNze1bUU+0ZjVgrXQcl6IItsiRLQ
   U7jLxh4DznbXHhu5J2XAask/Ogus653Aq1n7IPQwOoJrsDY+wzaiVIz7h
   FxCoIKc/0ZC61pZSDFLeaHolMRMXkrouKKMamU+NTJLGs4XmrWyYf4sIY
   SC2p+6WXyjMHLlUkfNum9Gzgpj7tEoFoVdiZ9D+94UL+VZDypMM+U++fs
   D+9ZqT+3rTNuJZSLFaC1DgjolFeJAk2AZsaukAXarHeIxbOkDHppqaIS+
   9gozMYVR838f8BaDoD/rq8FMbNsk0gospWKtpChu/A90acT4mfksJAMHy
   A==;
X-CSE-ConnectionGUID: yiLPyHs3RDO+Yl2h9omfnw==
X-CSE-MsgGUID: 3pY4ty6BRLq4+oxP0d+B4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="28730802"
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="28730802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 18:13:11 -0700
X-CSE-ConnectionGUID: +dqOYo3xQdWY5yswj3PBKw==
X-CSE-MsgGUID: h+brfojzT8u50/7f4ykpNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,209,1725346800"; 
   d="scan'208";a="78426993"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Oct 2024 18:13:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 18:13:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 18:13:10 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 18:13:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JfnkCUxVnWoWw1l+6GuXOqR1XlBJa9URbLjNGcVQkW7djHvj7Zch/whuHwUCPnOy3XDRJb8QpnqneSoYQg9INd9nJHUxz+S4Ngvz76PHjtS6rUzV9ihXdwVaAxONmDu+toCieo58bShMjpfiThkYWmYXtNx18cxYCqmmpgP7pD0LjMGll5geQjQiTmvV40zlysustpbwXrdASpW0MxDcv+QXYtqtBvgrk7juZTNdq/Wp7oHVFB/SRrHITUen/4g+hYHT1mzaTyZH31Is/xa3beKJZfrkgQPJUFhRSA8evV2LT0VOTyLQU58E1g0N7nzzMB4pWG0wWRMLH0bxRFBS5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBjNhNkGyy7IT43U4Pp+k/4DFAbUleyrWGv4gFYBawU=;
 b=FBPbehP3e0jwUL1gCyjrg7ImTN7SCEIZYv3++l8RZjggbssLiWUBcmvVGQUx4xnDvB3CuvTVOX2AsJMouQzAufjGLmedVU0Rl4ai/Ou/FB2HvYb9mCKhsljvRMPoNaZXOc9dOULhFbzLUxrG7F9vTrhMfMS6Huvw4hB/zfP6wbhLnaQKoi6wnnBkJ0UHWTIsKI39t40IgiNsZEQEHXTmOKgggS0rVUOgTlA5mQCPbmUQ73nk3DzKLggQ9l5SQcbwsZ3YSqbR6lcpiABbxCZyV4YLZ8ZNP1fRFW+DV2vBy3JNKKr+i07T1HeODNyyw763FHppfhjilS3KXoOiOjoLIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV1PR11MB8849.namprd11.prod.outlook.com (2603:10b6:408:2b3::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.31; Thu, 17 Oct
 2024 01:13:07 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 01:13:07 +0000
Date: Thu, 17 Oct 2024 09:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>, "Devarsh
 Thakkar" <devarsht@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 376/382]
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning
 (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <ZxBkm/Jqfw3FlMoy@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0154.apcprd04.prod.outlook.com (2603:1096:4::16)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV1PR11MB8849:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d7fd653-72ee-41c0-ed2e-08dcee48dbe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|220923002;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fgWcN30V3O73ieHUDCpOA4jXZNPoCxE67c1oVkHlpt5306d3q3PhuXqahXjE?=
 =?us-ascii?Q?O4VsXx6jUbXC4cbJWGqzCjfxmHOodVd7j7i1RTAjXTpHlsizlYGUIg+ONdrY?=
 =?us-ascii?Q?7xN7YkgwdFO7u/cDJZbOIAmRA+Mu+5WLR1Ht2atCXvs6rHUR60iBctYfta43?=
 =?us-ascii?Q?MQsdDlfc2XLwXpjmeWyuedQQ4OmdL0qcbysMAVHuqdZjAIWaEEciZ+VOvZgw?=
 =?us-ascii?Q?eqqn6OBcuF4Hb2YMj3ALs4CiuOX2uJtT/h+YdBykHoKkSSkH7QpvTcnNX4a5?=
 =?us-ascii?Q?uwKQDSt36xRBGfw5ql/yo3uG6mLBAlaJ5YId+o9Bn1VIXlJsadCB6xvciVXh?=
 =?us-ascii?Q?X5sUD509y4y0pgH5pW7+QAbBNbqxKljPMIKSYnsGy+pTotbOg+A9s/gVSLSo?=
 =?us-ascii?Q?xFDo7N9wxemIWQOtYU0gvAzAw7HDzT/CS4TUNobuuvwjKXstzugCARQpHhOb?=
 =?us-ascii?Q?dXF64d9N9Bvu7ymSwewgFsvpS3HdeLdZD6At33T2fDniF7ma/TaJABchnpmp?=
 =?us-ascii?Q?meLghilCTiwyyb1reKWYUVXqxdff66vM7QP/+N0Eg4POZ0W7X4x0pJ9W7Q6J?=
 =?us-ascii?Q?BWs5ODVrRNETICn2do68TTz1G4iY45o59lNRUK/rTaNWqrD2+QC2AFBeusj4?=
 =?us-ascii?Q?S5n89OPqmTMe8dS+MTfVrOqgIK0t7NFfaskvueXtlJdKk786bZqEPzwFSZlm?=
 =?us-ascii?Q?HCx/Ki4M5CQT4Su4WnH2f3lqpMVmX1QfSlGTnl8OE+7Y4sbXKLkGaJXny0TY?=
 =?us-ascii?Q?/6XsL7g8Ndu1atVIToh35hW5u+CpYgV+hoxDDoGjHV8R91Gw2uKVQZr2jEFf?=
 =?us-ascii?Q?RRtg7mNHvkSG7qlrOtAZGRGF54arXB6ccJnjPLm6jE3+myipyBnozcakchyK?=
 =?us-ascii?Q?MM+HiCKtxtbNYhZythcaWOEqV84tZ4eloEgfEdReM5m/BP+l0JMgOaQUoJF0?=
 =?us-ascii?Q?m4U/MMP1sI39rgwdr3sfKK8IHQBxrA05sJybdKGNcmEiDlGjHcdKOWRcOLH1?=
 =?us-ascii?Q?dF7KimWrpVvcfT0pqlYOPM2hYHqgqPxZrgNrM0g8ZVLv2CE6CXKprTUQSE5z?=
 =?us-ascii?Q?owpILBSZ/yGxOfGN4lDDeYeOL+R8rTlnwoVYXUECiDXJ10P/MUfWULUd/eEF?=
 =?us-ascii?Q?DDrUQNF9MZFpyurXJkXHjYfNoFoyxK/rl6zgwEP8EpbRkk+6TrAsi6WYGkwm?=
 =?us-ascii?Q?/iUfrgdc1SV02dqVPoGsa9mBJmr4Xn2dStHzl07SNtYmWrhwl+D/YxaEllY6?=
 =?us-ascii?Q?C69eKBJ0TZvtdkeL/DcFrzRjioubMxYapSr5a8QZv9zPDwZTdGJeARkdx8hx?=
 =?us-ascii?Q?+97iL7yNb957qYaXpvQq7HC3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(220923002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lGU9caeAiOnXvvrCZSH/VIRmuBDtF6n6EI1pA04XjS14sJ4qgeA8ZGmh2/v/?=
 =?us-ascii?Q?GD10gtZj4PBBKOLe48R1dSX3IO/W3yCW0Q/JjbKCDkLz/NkM3HXTAJhMKMJA?=
 =?us-ascii?Q?VyjG9LtouVqzU6qNlABEZYlWMW3fQr1XLbm26kuP5eiOy7IZF3uNxuzXDGmv?=
 =?us-ascii?Q?B57CGgvRPKS7CneEMEqgn68Ey9PAEXk15kbMZihYvIs1SuAGvRLNiCL+KBGc?=
 =?us-ascii?Q?tz82NZY8Gm0PTvhQV4gCPlSHIakEDoqJzZjTKE+y9A/X7+vKUe+r1pC/rj+5?=
 =?us-ascii?Q?sumEQumn2K4I8jgB25JAGG1tia/5j4zqTS9xppEjYyuE94wgTVXAwRIIlRbq?=
 =?us-ascii?Q?6nUHGIXCeN8G/0pRXdHbE6xjF//b85mFwFRAgao0oOJVe9vNPrrdtR6UDEFn?=
 =?us-ascii?Q?iX6HuopHg0xZpCOvBC9ZVZifTvUt7fUQGCfVAl/UaT+Q3EpRN1q5Ay72up7+?=
 =?us-ascii?Q?JNNFFgRdxSV0MVbeySgdcLdpUiwV7U7Y0vLvn+4GegFhbglkhVaH4y7ZADNG?=
 =?us-ascii?Q?lBVoGmF0I2LXO0w/a4JujyLiJmmhKa7B0OjC9OZZHc24wF7u4U6uXBEHE9Q7?=
 =?us-ascii?Q?HtIqVZ0H8tnk0fo6zCkPqZ0crjDCR8uvP/PGA+JS4UhaKnSlA/eM941o//yC?=
 =?us-ascii?Q?6J/OH949vFksQQW6ywNz27WIshR2L34iQNSzQUjSLdLy+l0/kq7DqkRFsKho?=
 =?us-ascii?Q?JDxNFLDON7/9/bDGCpkgScbZBGFvAgbLzTHpi7ursVG9uDnXH9/KJDKn4d3l?=
 =?us-ascii?Q?EA14r/svmkILtXN1N9OjDk4IHSnUqFi5t//mgCBpPPwYFV1r9ep9bOxu5sIU?=
 =?us-ascii?Q?monYFe54VqgFtrtv22rdDhAbLhsuosFzgS8cklSW/3Vi/2qy05aA7LXzC2yh?=
 =?us-ascii?Q?VtvMOkysXb73pVgUotvf6DMIolAZ+zs6U1zKSL/cSeIHduzDvoMVnag6mqqN?=
 =?us-ascii?Q?pTZsbThnLMhGIP2Fmmt4BTGKliMH//zIJU3UHcA8t7PxHLV9EcOOC+DyyMaH?=
 =?us-ascii?Q?mw63mRf3BQ0vFrCbz7U5awhg9TY3AcKtnBj4cNjAV/ZZ23y6HVhCAtDccmsY?=
 =?us-ascii?Q?d96E6sQLPyPHfBvWpSc99ol9FLFvFq0/f85gnMWwnJVybL9Rk5nzloZ6aHbv?=
 =?us-ascii?Q?y22+Ont1Q+2fsWjONEtVYY0daC7iJI/usTkffo6YVY8XHjTmsniv5fuAbudI?=
 =?us-ascii?Q?qb0UN5hlFIGlhiW9uwntdHVLuAtqc5FzG+u13Q7XmQDpleLSIFfpXY9+E1Vs?=
 =?us-ascii?Q?9IXKTSMl85LBelVod9nKMwo96gAWYHNGRWII1GGcOR57OBAsb/qjwSrz+H3A?=
 =?us-ascii?Q?DiGRNCT6P1qhxdxMVTG9LPS91qRlx14l+QoMelK74W85z9+ZEzT+SsmmRCZO?=
 =?us-ascii?Q?iYVGkpM4Brz8te82xUTcfk8ROZn3BJDD2MI0gb0gYVhNIRSX1IntIM6dwok+?=
 =?us-ascii?Q?zeQ9w+fOgv8f1NtHTC2diQID5rFy24p7B9cFQ2Cf4TIzz6RIB3U2AbgKPYww?=
 =?us-ascii?Q?vWTMkZQAtQBTokmCSvfVtg8rcbLoqoOE6DX17v87W/aGkcy6O3lgEBZr4Uiu?=
 =?us-ascii?Q?YkTam3PprDQKmPl76GyLsTZz2OXDZSl5qetu7/8N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d7fd653-72ee-41c0-ed2e-08dcee48dbe3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 01:13:07.6649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qekg58Y3Fztlcg4MDT+WsfnODCqIZYb9uZ004v1yyRkBc0mKpNu47UevBZ5QBJqT+x15wuB8dBBCrqrndeggIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8849
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 1eef2deae95a3f819afbe06798f1fd70a0048e11 [376/382] arm64: dts: ti: k3-am62a7-sk: Add peripherals and pinmux to enable display
:::::: branch date: 26 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241017/202410170512.iEVlLJz5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410170512.iEVlLJz5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410170512.iEVlLJz5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am62a-main.dtsi:844.20-847.5: Warning (graph_child_address): /bus@f0000/dss@30200000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +844 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi

555df2427c6270 Aradhya Bhatia 2023-04-21 @844  		dss_ports: ports {

:::::: The code at line 844 was first introduced by commit
:::::: 555df2427c62703f82029d150939d027a85c50c2 arm64: dts: ti: k3-am62a-main: Add node for Display SubSystem

:::::: TO: Aradhya Bhatia <a-bhatia1@ti.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

