Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2375816D9AD
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718957321; cv=fail; b=GoX6ydPNR7nERnVzZebaAWuidA67lPGnfSoeovgx+9jiixhieaX+oD8etihFo2dox7Kvx7R3kg4lxw5tP436tORQfeeNfwmILdjJ6oosqH3DySGNwvRUSH7qKkaSNBqhjDRJdm8XpJUwLBXq5iSHgdabnR/ZV3C93+uHub570ps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718957321; c=relaxed/simple;
	bh=4zYnwPMf7QoLP+1PSoRVOvJIuBBezz7hhCYqF34iRI4=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TZQc0UemvEznJRLkc3sUqVr+HcjLsy8mHnCVUUXLaO1h3nUFSWWGdFudr9l2lYcfYj6HpLRwvFetTX1dWq2YMzWM/SAPKNXAKikJEKHRLuIvtgTUg/vpttuuBQIDPxf9exxzpdPvSikbUJGXBNFxz1Udnympg2ad7UMOkCcARKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dlzkBCgJ; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dlzkBCgJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718957319; x=1750493319;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=4zYnwPMf7QoLP+1PSoRVOvJIuBBezz7hhCYqF34iRI4=;
  b=dlzkBCgJI63/DGMY5zJP//DUfJt2rdo+SJgglNZ/3NtVhZiwdTMr20tu
   JIEsIzN93LDmTGxP/ghWftqN/Q7/GAhJu3xzh4cxymokUZXda771QuBVM
   Mp1ehaOQLRJvF0gtpt4Oib1+GT/ILgTfAd9TYom4qvo4XsuA4LJx+vQjk
   wqFuLqNKjsd8arqU23q82XNBWeeuRNnXDC6F/wBQNoYdLZmtoaAWoicUI
   cd07glaJr2rdzG7K6aNGEyNSb90xjnnjreDchKjNyNTCwZHutMoR/rxAE
   5plOWDh6KCM/tK1+mr1j7zqE5AUlZxe7eRaWcM7xPDMSINge1WfyyNS4o
   Q==;
X-CSE-ConnectionGUID: eSV37XaoSlKYJCNbOhbosw==
X-CSE-MsgGUID: 7M/dKHS6QyOwTGe8BYDX7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="18888174"
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="18888174"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 01:08:38 -0700
X-CSE-ConnectionGUID: hrR3JYwIRq2iYZil22jIZQ==
X-CSE-MsgGUID: WNxWm286R26BMolsPF/Hqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,254,1712646000"; 
   d="scan'208";a="42378162"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jun 2024 01:08:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 01:08:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 01:08:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 01:08:22 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 01:08:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pm1kmjuF5Cun8D8dvNIHhMEg3U4Oc/vs8wNsaDUVrl4PRQO2RIZmintPVc9zsYmtCUiuX+KS1rE/nesLj9tTksp0iFd2IahC1zMbNrTWqs+Jbq2tbHThIjVmydk8a7KPASEtp+FSjvbuLgMwTmwkQeLo/hNzny+57tQ2I3wFhSt1PRUZd34Ta8j/FanppwlRrlvf5erce4XQB4WbcCKcokPW4ZQqTFkpV2ge0711k/lKmrArTqLf7fQ/p2hHYyyidFyFozrhg9EuhNw/6gYIM5WW+SoKxBTGQxnmLG59aRhFcgRoLHntSJJhkwUw9IV7X+mfQXEP9U/G3K/mZtZq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eKCvxBHj+BoM8UDGF5cdNoVQonHGA7l3JOSzLmrA/i4=;
 b=oNL1GLQtaOnou0tY1csIKcxyLFq3nRYbh+oK9h7y+VzlKCgLBphK8edCXToSYglaP/ehSfSbgjShAXdYQ565W7KrtI9xwLKn/qPGd35IRva6JsSDtbjVuPmpGyc1Crevsa5j3zGObf+rhBk/TooXDq6+1suKOOXLLLSqHd8ueQzrTLbXmvMC+poe7MSsXXSHUC3hiLPEOlAkPwZd2C27DzN47kXy8q1KojAzRKoqZCWLtJHdsgp4+a4Z21ZCEmXxUi2ryXSCMw3YJJV/H2Q9xcDqQ+y9MFOI1Q6SCcyOshjjv9nb5YHGCNeqRrHlxFxpp6+ngjfeJV5kJS42TkysMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 SJ0PR11MB4862.namprd11.prod.outlook.com (2603:10b6:a03:2de::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Fri, 21 Jun
 2024 08:08:19 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.019; Fri, 21 Jun 2024
 08:08:19 +0000
Date: Fri, 21 Jun 2024 16:08:11 +0800
From: Philip Li <philip.li@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 6447/7105] mm/mempolicy.c:2280:15: error:
 redefinition of 'folio_alloc_mpol_noprof'
Message-ID: <ZnU06wriJ7YN1EJr@rli9-mobl>
References: <202406202319.pBcCfVar-lkp@intel.com>
 <0c35a647-caa4-4451-b74e-65c68c83f0ca@huawei.com>
 <ZnUH4B6MlKEKDM0A@rli9-mobl>
 <6e5844cc-827d-4799-9965-959e631bef40@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6e5844cc-827d-4799-9965-959e631bef40@huawei.com>
X-ClientProxiedBy: SG2PR04CA0155.apcprd04.prod.outlook.com (2603:1096:4::17)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|SJ0PR11MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: a28d5afc-9e58-4728-cb61-08dc91c94ff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O9i/2cIlJ+BTYmUVFeiVi8iVXn7zWLREaaKlIOpVlovJt0/y2d3mpIFsp2Ab?=
 =?us-ascii?Q?pYOh5Mx00P/0H3Hj+4z+slzG8/ttdkLnVet7iNTKvjQp2PfIaO4D6f/zIVfj?=
 =?us-ascii?Q?zfzxh8XnvvXC9WfNebn6L7g4kvjJV5PEiDoN3u2og0foF6ZMnhdhHj2njX1F?=
 =?us-ascii?Q?NVHJKhZpIn34hCet7OwSaJlycCn8ZZo5tAyr1wvhww5PVgjFhOQS+BY7WcaP?=
 =?us-ascii?Q?m8EMDDdSzUzvGnFETYPMos1vRfUGnC61vblT/wUCBatK7wdYQYe4916xz5gQ?=
 =?us-ascii?Q?MBNt/+w+rdOc/b5HreMamUBcb/h3IWru4d7uyrhz15ANIQwsuPPOGIjobbXh?=
 =?us-ascii?Q?fyRW4FFAOWMT1pWiP3nypeHaMRR0vOdM6GWckxoLRa7jE6MYTXVnDtP4yOOp?=
 =?us-ascii?Q?iNtIhEf8rilN/WXcUfrg57muaf/9ct16KPXn4qAkno+gNAa/9j5IQGBDjhkh?=
 =?us-ascii?Q?tdHr21bQ2cxLenNInYuKinHr++jw5Dp+jozrT0ygpPaOKklSyCn6u202uIEP?=
 =?us-ascii?Q?CFL+LFnEwbZjrDEmlFz4YqXIRBwxWiajPK5V2uxeP3VdueqTLJGuiIyEibay?=
 =?us-ascii?Q?UQ9hpjVLYgo4NDz8o0SXkNAT817XV0erP5wq/kGnidtD9kf144kmJSFm0U/G?=
 =?us-ascii?Q?cctee4aWLK0enZV71szctTJyVJgf0BxXGx+QDXSzpFsvZi+w/VdK1kmBcHAO?=
 =?us-ascii?Q?Wy1MuA++xh6F6mQiZeCQ7hi/SmHIyghNexfL6nHxrLlWS1jo++OP40l2YW/9?=
 =?us-ascii?Q?7+DWRSBMwxQLy3RrCLvWend8ald7VWLdOdxvkAKxx19L/0uZpfFPikdib0eg?=
 =?us-ascii?Q?Y0exYbncdhZG/rw5GgG0xK8shWNOohNeemCCV+benKrASlFvW7cx3viTR+mN?=
 =?us-ascii?Q?MJ8Wa1VvtPa1gYM7+30cnTOc1jrSwi5oEaT3uwKe/Uf3XOGoQHKINJt6vd/m?=
 =?us-ascii?Q?OVhwSu2sXhduffWz4Dh+QjMl7Zz5Wp/w8+e5sxlzcPpTK/uZ3c+CUcD510O/?=
 =?us-ascii?Q?+9U9niYstGKYAxOQ6eDcOzy0n9YTnX8cKWxqcXCOF2NVr13fPzdP1ZNYtKBv?=
 =?us-ascii?Q?Ce/clAxXXz6nduXkJIKveE3AG5YawJPdFarFFLE9iYQan9K5BR5D1QvuFcTo?=
 =?us-ascii?Q?VBM8IR9hS+4XuPPf4gUhM07ZBZ1grr+hGBXElM+Rhd7Mngg8m9jVyBhhLnmz?=
 =?us-ascii?Q?eJmqPEntBZnepznF98L7nRT5y0qqZFUN2sE24N2WgaXCuy3Aqqx/qXB3UHZR?=
 =?us-ascii?Q?o3YscHaPwYSp9yDzdZ+wj308WqFQ8/PDDVGvEIAI/A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KgPefFKiyUt7klmW2wXnofvcH2HFhCyTs4uehrSmR/4DCrNvyi2krY0ROECY?=
 =?us-ascii?Q?RQpZrdGFMmKo++BA79tPlR25FV4k3qgmxz52zbdDjI32+lCXYPhie/VGAyWe?=
 =?us-ascii?Q?GzhXuu2Cv5DzhGIOTUjAXkYH437UKYazN87nWHev0f9DFX8IkH6GeYYoPYA5?=
 =?us-ascii?Q?tsUKRmb+tlH8Qvt51MHiLCCd7wEneNVP98qKsRfSv6E6ab0mcf5K+jKe1WWk?=
 =?us-ascii?Q?95VQARZJDFfDSnYEL0LBpnJhGuIwhtl0j9Uc3WbJFPEF9gYWTh48rYyA1ZJH?=
 =?us-ascii?Q?H/MS1SaYjrXmavdR7O2yRRkff9n8+hFSM+VnKqzgobJUgyBgxrBlgHJDhEXe?=
 =?us-ascii?Q?IDKR/PzjirkOsTXpRlR/pzWLWGvLL9POx1zovFWXOwFf5jaz6E/0CHLdKxb2?=
 =?us-ascii?Q?JBFQLwOIjKziQnDbtBHsqUrS7qGek+owitJavY10U2WOsC2BheHRtKBnXyZ/?=
 =?us-ascii?Q?97fKlsTveZlCTcRQQxol+gfzPir3AcPIQkxyRcb88R6aiTDXRdagrDgc851u?=
 =?us-ascii?Q?o8VbqSM3DJf3dV1XIFM8xR4YR1476AfSzQf7Z71goD/TyoEU7S79M4WCA/Uk?=
 =?us-ascii?Q?cYVrmGkQgLZXbA+CFuPQBbq0WDUPSa2goOI+s9PiVYVoV9v7QmHUwDvxz1bZ?=
 =?us-ascii?Q?7OkhgFnnQvf8TemP0Qm6ogY6eOnBcoL6VK1saR6g8HJEsin+va14xrUXxGTt?=
 =?us-ascii?Q?+qaRINI6vQk0hf9UixiN6D/971DUI2CZiYp2vIq7tp3PNVFXS6gl7vEgukXZ?=
 =?us-ascii?Q?/QKKwkNL4i9qynSGqTekoWAp1HmA2+eFzetzg4LeRqluhsgeVhGgMDcTEyMD?=
 =?us-ascii?Q?s3qXwK9jEDQmZlqcvHH272MRhq1/GTGMphvmCfPIzeyZzQ4uEEbpk5Uz7q9R?=
 =?us-ascii?Q?fRPCtiJswo3LPX1BeuFZeqe1cRD7MOZVV74t7KCursD1X6LXxFklcL/EU4bC?=
 =?us-ascii?Q?7RFHhamOrS5jMnzsd6ShVfY6qfmY++9L3chcW5DSzjF+aRsSnTa/Xfng1Mjt?=
 =?us-ascii?Q?e4nbkNoU3Hsk4VN7VdxeOvQJSL0EdIce0xIWVBcLGNkqY/pIed1UwwqI64xc?=
 =?us-ascii?Q?9TysdYOF9SecgHtXylh/A2s/YCtUyRGCzcdpFopcHMnb6nftAv5eW8/SYi9e?=
 =?us-ascii?Q?roYMo02R6oWVIMEEdkVQ1vGje4igP4f+bTivenEkeA7n1kBml2y3axWgPfK9?=
 =?us-ascii?Q?ebh6mdUlvFiliBFLy4w1CkNsZe0Z0GT8rh+Qew1uMDBLZOchgzDFNacGoae1?=
 =?us-ascii?Q?J3hVT8Py6eL8O8S32USxtQcTyYC032XYYHm8+cMkJgcqBbE3RJYIJ0RDp/pV?=
 =?us-ascii?Q?k/waMRzFpB+ItZ/FgmrS5Hr94x3mOO4rhRhfIE6hxKAuu24jhsPyhJ8D9vxM?=
 =?us-ascii?Q?go+DbLVbON800UKGAufHbVnQW4fEjyKKrYET9weA/xAsmu7kSZLaXJNSBjOf?=
 =?us-ascii?Q?bIoQfDP8OTVgNUXObU5RVqV7xo5Rg3vuL5V6eUngXynyLa8UpIgeqNoIWR9S?=
 =?us-ascii?Q?9680V7FxGB3v0rLuBFyF47LjR8RLvQOYUCXYcpxH2+yNmL9shXGz6BeVsdix?=
 =?us-ascii?Q?NKjOpa3Qk6PWaZuaBl+bRgQ4qoav3o4ekmATKg0P?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a28d5afc-9e58-4728-cb61-08dc91c94ff3
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 08:08:19.8658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPfwqQ8zyheDzrsrU7jpzUeYG9V7KxNMcWFeD98CHvkQ/YNSsPCN+2FgUnRdPE0XPER36c94UQEvYO6boMuTSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4862
X-OriginatorOrg: intel.com

On Fri, Jun 21, 2024 at 02:21:39PM +0800, Kefeng Wang wrote:
> 
> 
> On 2024/6/21 12:56, Philip Li wrote:
> > On Fri, Jun 21, 2024 at 11:17:05AM +0800, Kefeng Wang wrote:
> > > 
> > > 
> > > On 2024/6/20 23:55, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > > head:   2102cb0d050d34d50b9642a3a50861787527e922
> > > > commit: f85385e70cb4bbb569298830fdf0a3d8325de36d [6447/7105] mm: add folio_alloc_mpol()
> > > > config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/config)
> > > > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406202319.pBcCfVar-lkp@intel.com/reproduce)
> > > 
> > > Hi, thanks for report, I try with gcc-13 from 0day[1], but can't
> > > reproduce with above config.
> > > 
> > > [1] https://download.01.org/0day-ci/cross-package/gcc-13.2.0-nolibc
> > > 
> ...
> 
> > > The above error is strange, my change shouldn't affect them.
> > 
> > Hi Kefeng, sorry for confusion, usually you only need take care of the issue
> > that is prefixed with >>, which is the new issue being introduced by the commit.
> > Other issues exist due to existing commits.
> > 
> > > 
> > > >            |                                              ^~~~
> > > >      mm/mempolicy.c: At top level:
> > > >      mm/mempolicy.c:2221:14: error: redefinition of 'alloc_pages_mpol_noprof'
> > > >       2221 | struct page *alloc_pages_mpol_noprof(gfp_t gfp, unsigned int order,
> > 
> > [...]
> > 
> > > >            |              ^~~~~~~~~~~~~~~~~~~~~~~
> > > >            |                         __count_vm_event
> > > >      mm/mempolicy.c:2272:61: error: 'NUMA_INTERLEAVE_HIT' undeclared (first use in this function)
> > > >       2272 |                         __count_numa_event(page_zone(page), NUMA_INTERLEAVE_HIT);
> > > >            |                                                             ^~~~~~~~~~~~~~~~~~~
> > > >      mm/mempolicy.c: At top level:
> > > > > > mm/mempolicy.c:2280:15: error: redefinition of 'folio_alloc_mpol_noprof'
> > > >       2280 | struct folio *folio_alloc_mpol_noprof(gfp_t gfp, unsigned int order,
> > 
> > For this report, you can check whether this issue can be reproduced or not.
> 
> mm/mempolicy.c:2280:15: error: redefinition of folio_alloc_mpol_noprof'
> 
> obj-$(CONFIG_NUMA) 	+= mempolicy.o
> 
> include/linux/gfp.h:324:29: note: previous definition of
> 'folio_alloc_mpol_noprof'
> 
> but this one is under !CONFIG_NUMA, and from above config, CONFIG_NUMA
> is enabled, so this should be impossible.

I think you are right that this logically is impossible. Sorry that I didn't
reproduce it in advance, and i also fail to reproduce. I need take deep look
to understand what went wrong in the bot. Sorry for this false report.

> 
