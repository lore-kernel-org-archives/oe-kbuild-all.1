Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF307FBC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Jun 2024 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718023496; cv=fail; b=Vy6UFd/SwqnCxd3MArcJ3+XN6SQviKEoetm+9p/kXl6w8yd16Ry8JmGot+Dh1Gug5/DRwzRX5sepwInCZ6XPgOclF56+8MEe2x57TK3+POQfYGHLpA19jIHve9EuED8VybpHRmEmJxe8UYMvc0Fo18ZjpxtZjPJ8xIjjYR30QcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718023496; c=relaxed/simple;
	bh=XSMy2byagktxITrEhRhZIivh0A3zvI05D9Prc8l4k8Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=kTRAM/1A32J6bC3yb1hC4dMcRx2wMvGGl/aCgTYkPoHM3EYXnfbHsc8kf4JwwqPpMFUgVawtCkSVxzY0CHWVL30A2HKLisVfjpJpkD7Fm+qgeBvAClr408nJMsg5T9y4YPm8b4oYebMS8dyjyyzUy0WUWNkRXxEPk4VfXR/cMxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gWSrrLvS; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gWSrrLvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718023495; x=1749559495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XSMy2byagktxITrEhRhZIivh0A3zvI05D9Prc8l4k8Y=;
  b=gWSrrLvSB16rqE5Ig0Q9mGQY1O5wUbsyXH/vI25S4d+NTiOOEaB12ca6
   1FQRh2DYk8aC0m4+oZN2lzcinfBZsSeCPZvgVncZv1vpm/Z/vo4sKdGEX
   aHtsv15sAnrtYpdDYYiRYftC6g1TDBFiGzBQ6Xt7pQD+GSHK6qswnx2ws
   lg9K/2C9TT+yuSYjGL5TW8watx8Plg+MqqbDaFAWtnplvd8d7jx9QDqO5
   2lkyNsTiSUV6bEyKtZ6a+RVTJuKIW3D4Yn0pnJzXS/O8BPgI7TJzYVyob
   5lrEUYkH6fLDSEl8tKNwGCbb5bQGNEZ06cVQPdAMzD/NGCesj1V8jC8dE
   g==;
X-CSE-ConnectionGUID: 75mwd9z9ScyuhYT5JxSNpw==
X-CSE-MsgGUID: zIoSW5lOTDm9vuYkGp7C7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="26092774"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="26092774"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2024 05:44:54 -0700
X-CSE-ConnectionGUID: Hrz5YVw5Tr6oiVgjyxAJAQ==
X-CSE-MsgGUID: JCX9BcCiSweWVSB9ttiF9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="76505988"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jun 2024 05:44:55 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 05:44:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 05:44:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 05:44:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DK6KLglq6LkCfd+WCleuGCkJB7FRO9RE4GN4O/6w/mOYpRpEE4AG7ChA1bMKFgCJMGw8f/3OVYKr2WgnHMEC2hPfsd3Scx4bBfUkWhvEOqXeRuv86NurSr8FVxNxed8vDmWeBOkxujxDhR52C/FdH3ZZ6jGHhcDHLi75O8EayPSXf2GAjTmK7AK41am2bb4MRK0doSDHekzb4j4vYHBo7VN+UGqjWY25bnPdJBq2hYk2WnyWozVY819fnT9SqGBFW86pawbFzl44uZeMwDNM1pb0aCt5xb6iEg/4IvvAWaXKqQlLSzDmZLgljvhZySIckTuoTqCz6n7E94r+H56eNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vY1dNsroB6a3QG1hrX9LxNhWdgcIuQa/9yzN/HD9p00=;
 b=IBrfP9g+QJ419dLT120itL2kB6xYAFmdYvfN+p2lKU4t9iSNwdoRap9iDK+kjGAH6NKoFXPeN96Piu8sbMLgm/u2WB9BszJLvgXCJOmCGwdxLhFzoz0ShyrdHjT7F3cyp3p6bFcC/3aXvt2wfAxiC36H4Bnkcp1n56VylsDQfOqGKVTMPM9kLKDSwFpK53oLUhtmgvvT6oaI6WoXN6P7PISwJWIPtUfXZsNerNpj8NM82MlqiZ4mOTt+U7Lio0tW1LhFzSgkHknBXuwoMf4Y8grfxQFv3nLeFEzbiyeYxdqJlyduL7LzLv7v+iqtcAMzgmfzOiO8OwBWY29WDi6mJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 12:44:47 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 12:44:47 +0000
Date: Mon, 10 Jun 2024 20:44:39 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Pavel Machek
	<pavel@denx.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-5.10.y-cip-rt-rebase 753/979] dtbs_check:
 Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml:
Message-ID: <Zmb1NzbNUlcf3EC4@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0165.apcprd04.prod.outlook.com (2603:1096:4::27)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: f43fcccf-0339-47a3-da9f-08dc894b1c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Grs9QRIk4gyRBnwzdTUIyJ0G09ksdy/eQV8lZp8b1Gskc8EPcrl8br+/ulZ+?=
 =?us-ascii?Q?4Ad8bSZr36oOFQ5x8KGhGSTfhs7aqihQNpZBDSc9cjx5One2CMRZ9F6eNu0F?=
 =?us-ascii?Q?w2E1JQ0hkONGCTQut+Pi0IXlU6fdm+GjWXnI8JkiQAFNDZVZ7h18RPg9w5+w?=
 =?us-ascii?Q?cVKpaRwj1ED1Mxy5xNcqIPXqxbN2P1wSyOcDYYWjwvjcVplhivvZteRI8hji?=
 =?us-ascii?Q?twOu/L2L5Hu0rABQKLEoDn94n46xrPLAsTITx8eSxW2cc5tccgpfHi2aU1Pb?=
 =?us-ascii?Q?y+J16FatpGvSHIG6NHbBaAz1RZntIwnsuzX4Yr7UxHUUQ+5mxZMrs2EwXUIv?=
 =?us-ascii?Q?xZhUqnu6/nm5vdOV3767h/y7ygbx7NB1XnimNiUB2xRE4cIqMsQfqpE5ysbL?=
 =?us-ascii?Q?0HXquHHP6xu8VmxEiyPHhSvOB6w18TcelpxsVN2RGg61DUSbws/ELLl5Eco0?=
 =?us-ascii?Q?GowNxUsxLQvgeqgNW972UCkM3XDLtiJifzzAeVh8qbQl+KaZs5p2ym/yaHSO?=
 =?us-ascii?Q?Eqwq52sc8IN+jhDAlXuglv59PNtofeoIHgYa+s8gtQBd4kWJbel0HI1eNVHH?=
 =?us-ascii?Q?kO5C50nFeSzXBQ5yB0O0PbxZy+IkN3B03DEErHUFpQ1F4lUboDLJaPM3xXiD?=
 =?us-ascii?Q?K+z62ycid/NeORd+wbqat3/Bk4panzy73cS8Ei9JSCPqC4mRklx9wBN6xAkV?=
 =?us-ascii?Q?MFPLzaXQMjob8u0QbTLoViAKcXfsLbG5LuDuT1dkWEKlBZT3ZQJP06HtO/Gf?=
 =?us-ascii?Q?omf0cUUzXLzfPwzzLk2osdicfomgCo+Gjz23nVZbWNJTgYVs18zoQoTzg3K5?=
 =?us-ascii?Q?9py6/e4/ZFRZBUJB3Z+E5ZRGi8rWkCefb0xHatC+hPjwW9qLJR/muWOaaVhe?=
 =?us-ascii?Q?L0xYwHHzk+Y0bjoWA7hGdDHE09G2/4bHrR6sqN+22sqvSOcbS3RE5UXoDwMs?=
 =?us-ascii?Q?cIpHF3nvSlul1qnDHBOI92HsBj5C6KDZ77+RZjHCAuDWeEt43dbVKeE1Rp7h?=
 =?us-ascii?Q?PFR5on70UOQkphInTsfAWkBPeruVx3HBNFrzaFNYYDM3nJeKPqYOT1Jx5pT2?=
 =?us-ascii?Q?Bpjsu8jGUxWEXGFiV8w2/FPHY+noitPg3imnRmZQvCCFyecNDjwYOoNyrehh?=
 =?us-ascii?Q?sfT4XfYFpyhoMb/8tczkfiElRw4ehO1H/zk5y3+sQN732pgwWTK8t9lO2UYB?=
 =?us-ascii?Q?QhcpYeyrb9rjzjkn42e74xrmAeibLg4dHbvWAaWP5xL9Y7J4+8jtBc27j4dD?=
 =?us-ascii?Q?O8d9pKgyw5+rmkJL0b+NXbkP+Hf78VKFtTh5B6km4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGQR9Ze0jqudMGECIHQl0LJPz+XKj9v0ztcwuSwtFnhWVyifyYeIu94aF71S?=
 =?us-ascii?Q?5GcH0N+0pHNTs4orsRrp/OwBra7nHGL5iZjJfPDyYSSBoDeQhtNNUMZO3t1Q?=
 =?us-ascii?Q?HmTh1aNHj3H99U9sPFw5uqsbu6zmMjRGStZ2m0JKW7AMbHu0qiZq8sB62muk?=
 =?us-ascii?Q?nMVrr+8tEwOpfz4CJ9z7KiZjpLz9Zj2QvBuh71YPfvuf3DnHN3MGl6tG8ZDH?=
 =?us-ascii?Q?+FXRci4m59FTbfMaKRWD73gEDBe46yUzdrqg5rx/LLFCjjBwjMPjPSLE/fC5?=
 =?us-ascii?Q?ifgoVrT3wqp+y4OScYL955cJnpudm3JZaDqKCQa/MMJgCXsPqBCEsfDSBp2b?=
 =?us-ascii?Q?Q0Cy8WKR+FJaFUXUwGjVm7PrXs2VmFnhO9WlxQ/pDFef2tX9FiV/jpJLHOz+?=
 =?us-ascii?Q?twvulS8O3ldlmPg5osnd6xbMEKXv8h+MsTz5/KEgvuPTIjmg9ZQ1nxEJDhb9?=
 =?us-ascii?Q?Hfg3/T7naTBWytiZUrVYnrBBAuG8UgSzfbHeWEDhdq5YI8fSln7/41qGlCdR?=
 =?us-ascii?Q?BVeBRvobj1z5mO8MM4tauynVpZBjw7ONwQXnJnsFqMQGrxFzUBFY1cZQk4iW?=
 =?us-ascii?Q?5GiyOD3bZ7SfVVAqzYDl998V2p8GNU1TDhuZVGym2uEbbPrdG9vJgkJlmwCD?=
 =?us-ascii?Q?B9wP6RhJbDBT43Zbuq8hD8FWsmauRdXZSyTDULkU10q+UI9ha4+vbg4ypf7J?=
 =?us-ascii?Q?tFU2CKaYhucwdPs09Dwt+KvQDDBC8681PAT4HoYE2Hd5gxucLSZRk0g85ask?=
 =?us-ascii?Q?N97W4Uu91hh5vbnOGzhPEsiEq+um2Hpt9KmUqajymCbd+VIsIaNFroKEiTvR?=
 =?us-ascii?Q?rhD0Xphoz7jp8uv35C7qsVa3Bf1ui7AFk6TCEcDj08MfYbKF0pHsXYtDAIBb?=
 =?us-ascii?Q?jiEaGazmQkUtFRX0IJLfJibviCAlPw+p3gGxD7Mc3ExHc58Vut9hYmEEnYC7?=
 =?us-ascii?Q?g87u+hGEQIPdz5PtNe903rCa5jYxsLEzPtTlf0/v3fLtMg6WklYSSm+75Y69?=
 =?us-ascii?Q?QqzkItRnderZXCh9lOUaCaqVrdDVGSPOA8Lrv4B4Ld8NTHGiDMh+DmTSOTkU?=
 =?us-ascii?Q?nc+xP7spPZqlbiaRFfqN1bKH7Yj7/av8+TnKoK3SSCD7bOtFNh69Wmsrlgoq?=
 =?us-ascii?Q?V/CmJp4Xl3la1F7e8Ei2CZ86JgXYuwXH6nz2mKbvzHn8NNnJvFCM+7NUQ+tn?=
 =?us-ascii?Q?HmNIQ1QxYm2KiRunKocDvadxleDLZFJl1IH97Z2+QE4Ar00UzzlBT2gouTwr?=
 =?us-ascii?Q?4Ndn6jQ78uQupHlF37KmoPeqwgKBRyuNVd37TI3QUyQqNx0SCB536QyTxQIp?=
 =?us-ascii?Q?g4GPC0wroufeJi6WLi5Mb9N/ci6O32w3DCdtEVgVYZZQ5WDIXHupOB8wEadn?=
 =?us-ascii?Q?ILy7ZxJRHVNv6OswrYtize0u0FM2IDkp0yvghC5yAn/pFlKfxhaG/q6XSphU?=
 =?us-ascii?Q?M3oGsEQVJSYzdaAC44ua0AT1y1lNxqt16j5khtha1YVAYtQGU/x8eLovMmuu?=
 =?us-ascii?Q?DxJtn4EOV1+0+fYtqK9CGjdybz6KTxqGg6zMnLJp4sqTC9BwaunGFTNsU0hW?=
 =?us-ascii?Q?W4+qLSjVhQa/8CUfabn/iYDw088QveVkLRtsJIyPPm324MY8gNiOHkvBPZsZ?=
 =?us-ascii?Q?gw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f43fcccf-0339-47a3-da9f-08dc894b1c0d
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 12:44:47.0343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 38M8jsMhoGF1Fgek28e4IIBL1Td4Be8m9W4vKDV+tZyIGVQABLPwOjx+FsJgGeSjEwNyJtTjTg7DGK56gL3O0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-5.10.y-cip-rt-rebase
head:   9de69a0c701bb413c105caf0be1dd5cf574866f9
commit: 6d7b69cdeab3b333960221144c9fbd067d4401ad [753/979] dt-bindings: display: bridge: Document RZ/G2L MIPI DSI TX bindings
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: arc-elf-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092201.QhhOk7ep-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406092201.QhhOk7ep-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/dma-router.yaml: title: 'DMA Router Generic Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/ingenic,codec.yaml: properties:compatible:oneOf: [{'const': 'ingenic,jz4770-codec'}, {'const': 'ingenic,jz4725b-codec'}, {'const': 'ingenic,jz4740-codec'}] should not be valid under {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
   hint: Use 'enum' rather than 'oneOf' + 'const' entries
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/sound/ingenic,codec.yaml: title: 'Ingenic JZ47xx internal codec DT bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml:
   Error in referenced schema matching $id: http://devicetree.org/schemas/media/video-interfaces.yaml
   Documentation/devicetree/bindings/spi/qcom,spi-qcom-qspi.yaml: allOf:0:$ref: '/spi/spi-controller.yaml#' does not match '^(/schemas/|\.\./|#(/|$)|[a-zA-Z0-9]+)'
   hint: References must start with '/schemas' or be relative to current schema's path.
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/trivial-devices.yaml: title: 'Trivial I2C and SPI devices that have simple device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/dma/allwinner,sun50i-a64-dma.yaml: title: 'Allwinner A64 DMA Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

