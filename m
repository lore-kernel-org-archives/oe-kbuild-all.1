Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2A148303
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719909595; cv=fail; b=lKUFQUPHsdpm95zY85a3LKCChtzgv7cgnwuy3j+/40R03LpYaRuH2vbkpSJnzIQRKtzjWF4wM0B6PQegukYcjHLHgqUPr+7FuIZO5bvcQfmmp/+kdKp+Ffl4DpZ9gJG8cv1mOPIZ7ZY9drTcPT1ZHclvoQPJOT8qCsT6/mZIC9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719909595; c=relaxed/simple;
	bh=yFq4R8APpWua9OARCwmnizOxyOaKu252VVTpLYz9Fmo=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YNQYoWJ+9U5edZiPpQhuLp68fHFA2DmqnkarizgEgejOcHePeVrD9lAZBBuVNQ7BwVrEi77GYYSMfslctYLCVoirgrL2TPhcV+vqQZPZoL1LyC/B3nrhmcobV1NVqJU+W1A+//LMOv3htfXX9/TpHHnbkQgX79IOA5Mtovt81DA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GG5TFZ0V; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GG5TFZ0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719909594; x=1751445594;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=yFq4R8APpWua9OARCwmnizOxyOaKu252VVTpLYz9Fmo=;
  b=GG5TFZ0VsyXONKXiocmIxav//iU+MJ1ofHJKSWE6Ot57X+6t7vdWwI3D
   E1W1HexsMXVqPsozG4mseTWSAq+2Exy2vpiKQ3oFg48xNZ7A29nE70LRF
   HuWLzSTpCRs1R3lIxSgnl/GVJ32R55qeanQUhK1AW2HjXNwuQfo4GTiQL
   IONFOAg3BZHHp0/ywWgIh/0czln9aUTFTl7RbduhrpnZCuedT7F4WhTgh
   UfoIuXlezrv9WxDZnQMRf59Aridxv8anBbCPR7a0hDRVx2/3CJwo8cjXu
   S7LjVI8f5kHnXJVPiLy03MmeC2ozZaXq2LqUCVzpZL7APj2EiFJP7Xz+D
   w==;
X-CSE-ConnectionGUID: nABWzBg4R4qN4uK/XkGQmA==
X-CSE-MsgGUID: QFMuD3OGTsSVrvFObEHNTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="27750085"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="27750085"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 01:39:53 -0700
X-CSE-ConnectionGUID: LHGSZS8/Sjy5bqgPH1+1Mg==
X-CSE-MsgGUID: qMUaWoL7RbSrB7DF4cACzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45718322"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 02 Jul 2024 01:39:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 01:39:52 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 2 Jul 2024 01:39:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 2 Jul 2024 01:39:52 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 2 Jul 2024 01:39:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eATd82ZDi+sQukQu9sCAue4H5Y+WjYMIae2zdvvOL0vQCOamJvjeYtGWI8bN5iu9+qX7JfKuOsPXt5AuzrZghHemA9dAiAuWW7P5g8c+W0uaogUXiV1jLaI8+KKcgMtPEs6yRrHq3DmOKFKYW9JZ7x66EAG5DBvZejTZJ//ARdqfF7MZ6h8NgWVkaHny2o1v3m2ZXgxGNg1PDa2tN2+v42zxjnUqS4RqFA/oA8wPomcoEY5eXg1B5Zf9IL1WH9KbACLePjHnTDNezCv/HDCm3AbICW+KY12UcLRnk/ot3NmIBekWRCGrYGBpPL50WwWUVOeGNmnLDP2OL9RKy9lQqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cbf6TU9W6FuoimOoCQAiAqXX/l62+9l7UgqTaxEB92g=;
 b=Byci+uo4mUClccBLKHylGROVtSQaltaAWXvAr+15IB53akBLTxrI2eHq9ia3ixIyVUCzq23EslgFQVXWmCdzi45pYE54vkslSIhUGOm9X47O544623knUDg+vIULLub4w+Lg10PCg8aPQYDgT/yjwk48nMkxmbs7emGpIHJVoIjuF8vC2IayAoFX284jkWhwWTqDV4qehpuV42Sl54kkaPfgh+U3T5UEcQp56hND/jpbr74/mLnmYpiujP7DGZll7F2GG1QbdbydoiRinimdqpK5RwHv08RtlEdq0VQ/1TVPU/9rKobshoOAqPe4oWLd6ipXXi/jczPzmZMDNidctQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SJ0PR11MB5867.namprd11.prod.outlook.com (2603:10b6:a03:42a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 08:39:44 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.017; Tue, 2 Jul 2024
 08:39:44 +0000
Date: Tue, 2 Jul 2024 16:39:36 +0800
From: Philip Li <philip.li@intel.com>
To: Shawn Guo <shawnguo2@yeah.net>
CC: Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>,
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Shawn Guo <shawnguo@kernel.org>
Subject: Re: [shawnguo:imx/dt64 53/91]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to match any
 schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
Message-ID: <ZoO8yPWlF/DO85N7@rli9-mobl>
References: <202407021405.ahrmTsPb-lkp@intel.com>
 <AM6PR04MB5941F075BB66E5D866A8F54988DC2@AM6PR04MB5941.eurprd04.prod.outlook.com>
 <ZoOjPtWSTTn8QryI@dragon>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZoOjPtWSTTn8QryI@dragon>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SJ0PR11MB5867:EE_
X-MS-Office365-Filtering-Correlation-Id: 35d41b4f-4ddc-4688-e951-08dc9a728603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?m0FcnJTuiK7cHQyQ3GsDnF7KZ94Hihq6L67WA6knad56qqGI8x/erRma/wXK?=
 =?us-ascii?Q?TXGMJHQcWMF1UzAeeXBH/QVzzNol+5Cym7lnsFjpQSRU+D7XR4Vvbr//gz1E?=
 =?us-ascii?Q?ShjSuj0U6IycKL5J6zQjr92uNYZAtO9o7VM8td+4M+Akj3+b/LORGBsf4sCS?=
 =?us-ascii?Q?R4pxJr/F/54yBxb2JP5irIAuOrlXDVKLcSRkIY/tVc5yJ3AtBquv+/KDbe3A?=
 =?us-ascii?Q?9aVs/pIQVqq2KlV+Hy82N05LHvkW2aBFqmJuNZ/IQd1OKWBgn8fnRcKkxiig?=
 =?us-ascii?Q?qV/HkoZaWMLsQrFOUqKPp523HpXrTJ/EJjKMhwcHT7dOzEHdjHe22t0C0Slh?=
 =?us-ascii?Q?TG1sAf60gasfmbiX1+iiRxQK4S/+37FnRnkrrzvd6wqAvQRZv5uc9pfeDr1x?=
 =?us-ascii?Q?TI1HhaGS8MAfGL9Z3puXFRNzQb6VclwgOEZsM4jho8ILSDahEhZPKpDGZd0Y?=
 =?us-ascii?Q?xnH+1h/YsWPTBnEIKsVDDL25fqNVbCHM4VkgsqDqxW5jNywWQfW5a3MJxnIy?=
 =?us-ascii?Q?B6vL/+RQfU9XfI3sMvl5Rm+C26anGUWMb7C8HuN3OA0Q4Doxj1OJ6T7iMlgD?=
 =?us-ascii?Q?n6nyVvArEK2nagg0HwnkThG9xzE8S7zyMvJOyjbw8+UsP5Sy7EwzkL8Mhrep?=
 =?us-ascii?Q?l5J0MXgztJxvIZjs18y5YnoLH7Krcf7458CLclNgO74LT8C+4Gqc07yE7J5J?=
 =?us-ascii?Q?n23Y2QuGnhn5nFtpuvGWcRmTpF4djeTI3j9ttggZ11DP+CPNCBoeLKBvHJhG?=
 =?us-ascii?Q?X4yFCK0Ok+dx8rKANofQEHU3/pU7cd08ez9+mNCXCAmmNfVYCDoH/qExUTOe?=
 =?us-ascii?Q?TVk3px5I9TGJCI00UZ+hs7QESk3qPs+qPfZ83jI5JMNJz3rmRxHRXeYgXt2R?=
 =?us-ascii?Q?9ukKfMKqWqO0RClE5mZNgSS9QTgT38odgAP53JtYY8q+yG0unaSi4OMo8/Yv?=
 =?us-ascii?Q?WkC/ZoEnN6xDzTkaU9axF7gbSBVyOQI96jso6KB69trP5SnBFD4DqqF54tvC?=
 =?us-ascii?Q?+OLrMeas9aUJ98iHtwmDCw6ZiLjiZlcloexX21av0USkS+KKtOOaG+Tf/63s?=
 =?us-ascii?Q?aNKU0szMHCAHrm2KcXS/StFRgel1C1+9+Exbfca2qdA5YEZ3/Z/7U7gi/VhZ?=
 =?us-ascii?Q?L+J6LWbwnkQyfWpkjt2LPCFvPsOwLBSSQhvs+d4WUuiwflQDfBlTL7b/Q62e?=
 =?us-ascii?Q?vakql2tIoyxcl+uhXoV8AxeWDlJ44cr7ZFI/Wr//9vOnWxkaRSTEJ+y8Qx8J?=
 =?us-ascii?Q?am99UEOnzV7IvbC11u43gQuKdNDZ5SIYOSMGUoYEYLcu1qMAIEo9EDLMdAvB?=
 =?us-ascii?Q?Q6ZGXb/2csXELumr0gaoEg36zfLZdRmvFMYvkSv4do/1nA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E2KCoyEsfKWUiCE3O1FTUJK/m7rQcXhQVLzbm2i471wozn6BToB2KPvvfC7J?=
 =?us-ascii?Q?gQ5RRQVDpKgBkEGn2mfFsHpv27GIlaezowJjOb+uSTbpms/zY7d8GHub9gQU?=
 =?us-ascii?Q?fz1BCggWK0MuGT9npOIUd/V3JeI+AsYF93uZMpudKLQQi7Vl2gU6RQVEIpsL?=
 =?us-ascii?Q?5ayG1u5NKWMgJDE//eXYUDr6L2kl+vN3/gUmB6sXoESLuu0ifBbe86o2UtQc?=
 =?us-ascii?Q?EY3CASmNnEDF+7666pka7laYQG6XIV2ajbknY+aRlpQcgtF9Ws0DJmzt5oiW?=
 =?us-ascii?Q?tifeIQU62rEka6vIP0+8JalQhi1j3EVUM/iuco7CgXzh4VkVUsmZmV6hZLKg?=
 =?us-ascii?Q?AQsTtkK1xQpO3Fz/mahe3WGFKTldj5YaqdeUFNOhbd9ZBgb/kgcA48QvE2DY?=
 =?us-ascii?Q?vRNmk6ZJfFXGvY5xh9zct/89n+k6JB8ZREdBczz+KY6kPhqadXSffkLYP/p/?=
 =?us-ascii?Q?2p60rfg6nQYVfqXB5A8/vZvD5UvYYnBZgjO2WmIXxyCRVdfwNM6P5EE0zZEN?=
 =?us-ascii?Q?HnXTPkwF1vG/PqpCkl0HLW8Ajjum4t21SRVVdyyGn0i53+bSZvqB2SnkVxIl?=
 =?us-ascii?Q?jljDr51SBPHMn5QXmXmIf9Q6awl+Wa7pCzacBnUXnrNyY8n7GJfVRnjUdtYB?=
 =?us-ascii?Q?/epR5bt+gUcKceqY/lJCcyERLPvH/S2k+dtzpxXz8DWZXXzcxS6L5bsbsys1?=
 =?us-ascii?Q?r/kW6G+mDAzPUBgamZafEtawZh+p25BkDXVScQMt+XuSUPu3K/zeWoA2TgT+?=
 =?us-ascii?Q?GxtvZ3Fj06q5bGYDtaSlClxJcVv2aeIR5iQscivn+Qef6D/ngFEiZM+VahvA?=
 =?us-ascii?Q?ife4Ma9OkE+CiXpRyM+E2/aDVcVEklFM+SgZmsE62B6YMlH6x8V9qnjHaiYU?=
 =?us-ascii?Q?+q2NdNrjDfabCKE8kWCfciaEmrdlueVSWDQ80WOMxaYMfubYbZM6JPL233D5?=
 =?us-ascii?Q?B6WJeS2v8frYVLoBoHr5fSzZ8GjEdaNoT5WXuyF4GeO1RsFEXHsSnM8CMXH9?=
 =?us-ascii?Q?HQKSqnMdxoRkJRfnSTV93IQRekEABt7h6bUjlcrrcQ+H/j6r0RQZdnecWb3d?=
 =?us-ascii?Q?tmn2KAWHwUUZGrnkHFADKpDiAx35rOaJz4fHXa/PyTZBr0/7lgWlA8umwQGQ?=
 =?us-ascii?Q?z8ueUfFkM01YzYlDOwiwX8k2qPqdMmJXb1qNvAJhEDD3s3cpxJ/oVepNp8iy?=
 =?us-ascii?Q?F+82IUbVET09qx2EUKFAA4z3Vc2/tWV+TMgmwEh7mkRqxUoMNluN7H/U8M1S?=
 =?us-ascii?Q?NaJg0Ex27TFJDwBYreJJBwaWPEesLxCIWL7NaedN5ecs74HYw7JUSOPDTnPn?=
 =?us-ascii?Q?CJrjlsdgPKQVvqQvOx9fqXOth1sFhd+mRk2dr779LiHbWFBvaENBnYod718e?=
 =?us-ascii?Q?kMJvtcAqAPvD5AH7XZ3k+rEYyuGOGBpGq3Gwk+sNpFQF6ustF3b1rJWO1fkT?=
 =?us-ascii?Q?jWrN5Pw090q/ES88KJCCU9V0Wu7oRgb0jQgPAFoZilou1mse1PtFm2uJFL4w?=
 =?us-ascii?Q?Hly3u00exKvCTmlpvtdmu4rvfD+nauGgW8y0XOP8CjMsRTHgtDPdHAkrGQBY?=
 =?us-ascii?Q?NQqk7gWQL3JlJa0QyNnI3i3BOe45ZeMiRVDb7xJk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35d41b4f-4ddc-4688-e951-08dc9a728603
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 08:39:44.7845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jvrJDiGKXSgsiomGFcWOI0OCRzE47pp1DPUZKvioc3ZZA1TxZo2ESBhKE/tKB53DP4lXrIh311UhQQMs7/6ByQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5867
X-OriginatorOrg: intel.com

On Tue, Jul 02, 2024 at 02:50:38PM +0800, Shawn Guo wrote:
> On Tue, Jul 02, 2024 at 06:22:26AM +0000, Peng Fan wrote:
> > > dtcheck warnings: (new ones prefixed by >>)
> > > >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to
> > > match
> > > >> any schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
> > > >> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: /: failed to
> > > match
> > > >> any schema with compatible: ['fsl,imx95-19x19-evk', 'fsl,imx95']
> > >    arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: scmi:
> > > protocol@19: Unevaluated properties are not allowed
> > > ('regusdhc2vmmcgrp', 'uart1grp', 'usdhc1-100mhzgrp', 'usdhc1-
> > > 200mhzgrp', 'usdhc1grp', 'usdhc2-100mhzgrp', 'usdhc2-200mhzgrp',
> > > 'usdhc2gpiogrp', 'usdhc2grp' were unexpected)
> > 
> > The binding is in Linus' pinctrl tree.
> 
> Hi lkp forks,
> 
> Thanks for all those reports!  But could you stop such "make W=1 dtbs"
> testing against my imx/dt64 (and imx/dt) branch but testing linux-next
> instead?  Binding changes may go via different trees.

Got it, these 2 branches will be ignored for dtbs testing. Sorry for
the noises.

> 
> Shawn
> 
> 
