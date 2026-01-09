Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32410338598
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767955160; cv=fail; b=nvve7qs6ofJLoUgiyX9ADb+xfwn7aZvRtV3UiwDWwxGnlkhYQpNgNZ6YkgNXoJ/ha5UqxvyqJlAewcQirRVOhJxkFn+32rOqTcfMh9dajGfhFeYNhHK+hYAYdMkKrkQ9e9L4buVhjS/KV+TJtw0Y0IWmjA3XTTQt1klS4iXOvT4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767955160; c=relaxed/simple;
	bh=vpr+Ky4K2T3KKeC7duKaiNVde73b0fH8OSi2ieoll6s=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ep2XE0FmLgr+0oqmHvxr+qEFbkVeoaJor/qW8EW9FGaVmVAmKvE0Md0zk+QLRME3j+UXmTlklSD+oXth16rF3c6OVnBFApMKprL992Fv6QGid7MqCNUF1sT8W5/+jbosEXSWcjBQms5q3KsAStUnQJ4aeNzv1YJbRGJPpXGBw6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QDCJ6OOv; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QDCJ6OOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767955159; x=1799491159;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=vpr+Ky4K2T3KKeC7duKaiNVde73b0fH8OSi2ieoll6s=;
  b=QDCJ6OOvwdMGb+ZwOOBSEijdeWRd1PJwZjl+ubIu0Ea1QW79fLr2gwUA
   H78hjniartB4tFZHNX3unzOIMhqazm9A1w5fuNfKnWkeMvJSp3Stuc3WC
   5+ZGYClY/86f3PaoHD1im3YIona97Kr35X5BO9duU+/1sU2ZiVFbAmMt9
   r5Fij4DwrQGXfqvMXsZu+bk6KdfpZ5X5XMR3URHN6JrqcUrUNqsuRglkA
   iJBmzjtypU1737I7iSYuFvDFmvWs3DoD0rwv2vlkp+WBDK/WCxvcm+EIL
   iOiLJOv65RuA7CgKTzDmPlJhneV7PRhh+pXNfQ4fdwDNJnj6qqHMQb5Yq
   g==;
X-CSE-ConnectionGUID: RzQkIEiBSYS6ev1usPqz6g==
X-CSE-MsgGUID: IzpMf6VQT0WoN6suyekgUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="92000048"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="92000048"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:39:19 -0800
X-CSE-ConnectionGUID: lYtWhVawSMetS3/gLzxaIw==
X-CSE-MsgGUID: 7YIXwMiSRM2X6Me0TzLoDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="202557397"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 02:39:19 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 02:39:18 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 02:39:18 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.1) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 02:39:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsFGoCPEUe6qVfkfy8NFlXwI3Z26nkj/YcXQkM9DGEZTobpo6sNJy1TMhQmQ8QJAQ+ps1tKJ2CDsJcu/QC26ZeFprjrRAITm9PB/i1B5/Q0WWSz7ECEoWLhD81mcabdl+yTDtKanAeAaW/UGiAxhvdLOtas11/F1My5q/FwGHzOTv1MVI+g4xVrnKKDsLJz6EWABLJm0I1K/eYYxqy3a08KGuJmQKpyECVVtbS3KCa7RMcbUyZ8Y9zsKTS+YhlXfoAaeA0mRLVTAItDWFXuaiZKKVrRWJvP5OHt/QpUcYAke41285qNDhcdAyoDEmNPrloar9ccIXolM6c2p/NcSsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xCRcIGzsrzH7xtrgoGs5rEiQimFTBMPci1JMo1l8c30=;
 b=igc9R3smjTY/cPJP+jwrKqi2863DmbrRy2arfdq5bNdbXkRT+VSqJ2aL5s1GTVmK42WWTO2l5cLFXyuRPslmYyNmPe9usxrWXVX2tpDfAkyztOzyikDsMTYU1D4tVyYA9HQFquirHQbR5gyM2VkvNwW1iVo1KGCaD8m9GmPIZqDGWyaesgcI70UHDyz/sLbHNqcdy7iAKSTREf36k7GGPcF5xfMxRDZaOowlZ46riBUIdCbpNLOA+YMUc4NzzmSih+iCmSsBV5wOOKs5c5axGVAraMfoA4/PBr8GfkT1r1cKdfeR/FZ958JKYYMnwlgbq50IezrmPAxQ3jVZL7hpDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.5; Fri, 9 Jan
 2026 10:39:16 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9499.002; Fri, 9 Jan 2026
 10:39:16 +0000
Date: Fri, 9 Jan 2026 18:39:08 +0800
From: Philip Li <philip.li@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: Oliver Sang <oliver.sang@intel.com>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
Message-ID: <aWDazOJB6dUjjeyH@rli9-mobl>
References: <202601011320.wfOmjyKl-lkp@intel.com>
 <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
 <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
 <aV+HboykUV1ac4Oo@rli9-mobl>
 <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
 <aWDM1OMaaoLKAp9M@xsang-OptiPlex-9020>
 <CAMj1kXHdvfcUAf96QLyme9eQ6jw3WjT5JzP+-NngVAkFKaUwsA@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMj1kXHdvfcUAf96QLyme9eQ6jw3WjT5JzP+-NngVAkFKaUwsA@mail.gmail.com>
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CH3PR11MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c32780-fb61-4975-6f59-08de4f6b5658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pikLNYgUIZWgRobcdt6ZLxSR8l5pL7U0NuivzzmmKntVC8lrKjDsQ4Shsa1D?=
 =?us-ascii?Q?3LIi27C4KdKPQ7EbkfKLWtZ7NE9paP39Fx9S6E0TNnYFHIgXTfHKYf1Jq+I6?=
 =?us-ascii?Q?+KzIz7358NpLMMF8mYTwpfTiJzlygCaFeOczckxeEx9/pcNHx/MhiSAR+oim?=
 =?us-ascii?Q?+1PXhJaU5YoX5tFLdyRw8NXveB+0PFg7GClNeKbavaZIDzNLWWLnlX4ogRQQ?=
 =?us-ascii?Q?LiOOUiwCRx3KN7iyQHvJ16eaWsgA+/MjwMDquNjU6IXrjaFVZjb7xyHY9lVB?=
 =?us-ascii?Q?BRVosAjmSvHg6sC/jLfuv6ZdwSgX+749CNsVwq+kwo0uYOCmTPbbiAzkzHRZ?=
 =?us-ascii?Q?Vz9VBzEbCQeXCErRgENVc7Sa81JSHUmrhCR+n2SHJF1FJCN4yuKbr4Jgbyzc?=
 =?us-ascii?Q?39udsAk51elfByMkNoMgY/4brLIoBKrvgbsaVZqXaJ3SrpqHOfh8EHm9nvk7?=
 =?us-ascii?Q?wVWHZZ3z6V9R7cq1U4IVsIG32WIm3/jho8lsIW7t2UuxeQmNz+9GgIOHIOga?=
 =?us-ascii?Q?1FZVTym+eXqhkLPBNOENGvi9dvy05+eEuMcRaBUIZT5BDeefhaQwLwZjxDIc?=
 =?us-ascii?Q?77F8YQthYIqI+0g77qmYppNfwIsXWnN6wsqmHEMNE/HnCdmQILf9g/VA9Lw1?=
 =?us-ascii?Q?ffLC1jeuwNgPdpkfzqSelKXUr7SdesOosoyBGuMCOEJaIofz5TBXhaPRjceJ?=
 =?us-ascii?Q?LB8UMhc+40ul1sGJRs84G8T6TQ5jhXazQZMh8ZZ1995K4d0et2uv+khyK0/J?=
 =?us-ascii?Q?/I5dZ8DJYzlaILrF40uYhRpT6iifKSW0JSr8BgXmjVmgoaF+Ggzslfj19o8H?=
 =?us-ascii?Q?U7FTXpnOav2x4Rn38pRby/mnqivvaNHWunB/yG+9bmG4SsS4U/zex4DHqSkl?=
 =?us-ascii?Q?VHM2hC9z/mblijTqvR4mruOLNklbwqFcfpJSPtBZLFBv4LA4v1oSFuS3o2fX?=
 =?us-ascii?Q?ucu2GrAcfNdAisCkdn4l/Pr5TwJCpmKNfhPz/rZ/oCWLxuSXAfDVJlTSfNrN?=
 =?us-ascii?Q?O/TLSpt/Z72yeaKraEN0kxOjjejGV4y3il0d7sps5e75M8qd8OHGqcuKsaXi?=
 =?us-ascii?Q?X3FYIwwAn+Wq/6rjB6ozxgqetWpGa8LBkn+1k8j7psmV+jh5YCN0ARrpQCR6?=
 =?us-ascii?Q?VWi7T9mTxOAQCsiyQ+BV2jWisDsKG4ewMLw0PLizRmxCMvh0XwGaMOBnm6qM?=
 =?us-ascii?Q?x8nI0Rmn5Mpn47gqsAyZhJsAH/gqQEUbRQYyYeYlw8yH9eJa6vCvb7Os0qIz?=
 =?us-ascii?Q?/L+2vnJi3/CERXYa0q+F6Zdm55nc99wbdMqsUZJMyX2FeU4hCAYGhCUzbVMG?=
 =?us-ascii?Q?Uiulz8qFqtFRZBwor5M/7ow0PetU6YRvv/MI6Oz65aZjv+4d2i1WaBHbTymt?=
 =?us-ascii?Q?YRAgrIsel7x1Mo6+BrHFK5kzKKErqxL9hjH3B2TB9XNmn8LvCswHT5KijX21?=
 =?us-ascii?Q?qMaZ4OdAHu1NX2AkAPZ7SwnEbrHcvkdl?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ilJoXfQDE+0prLPwVOfWIGyLPKq7K7q8DTfTVGNKHoHVfNV6fySYyDXBxbaG?=
 =?us-ascii?Q?nAnys2q6KQ23uxOebmAoOxqtCVWmVKYpbuoWP4LcIdcjbRBdKujTONBPQp1y?=
 =?us-ascii?Q?sEO55v5OWVOAFbHxuN+Lsc2TmXHCy3KFPtKpfGvw/avQdM+x+h3NavcCerML?=
 =?us-ascii?Q?wP3fKRibbXsc+VwuNDYCK46XUyqWgBDluC7z/axVOXWP6Q7gGNU2fGTBWmgL?=
 =?us-ascii?Q?8GhByGnO2/rilp67LNTrP8DGihxaGuU5r+aNCqLXN6ef6P7vygQPsfhIjbi1?=
 =?us-ascii?Q?Z4xAgbu4iSYA4CSOhq0+N9sowDSRCSbxzZse7ByEDqkQKNuk4OQGEPKSNEnZ?=
 =?us-ascii?Q?/RUuQxtK0J/ISe9VsNxVwgr2WihFqrsTrvE9xuKjJkAqWGFZ8Z6n3RxsPCDf?=
 =?us-ascii?Q?FByYTnf6vNhjE1AjXr1tz8S64tyltiq6zKNt8uFCoheY6kqv6M43fi4BipT4?=
 =?us-ascii?Q?nCZ3gHZO0YadKU3apcATiexEoq3+bT8lYidxB1SVOkhskhRf+aF9TV46sc9E?=
 =?us-ascii?Q?nAjAKUuW1+iZJMgLqXsM17lefxsotsVZdWPoX1aDEiHc4s9ikGEnF4g5NiaG?=
 =?us-ascii?Q?hDTPqpktKEKctNU79QyMEmza0l+hhGGZrGg9vD3v1v9zQRRmfspf0rNUwLSu?=
 =?us-ascii?Q?gGEGLktElUTbfPKsyJjhWhCoA7mzf8xXjUE2T42qSZ8wdrGUm+51oVe/5qcn?=
 =?us-ascii?Q?rFGWY331xKaVdGu+h/Q+EwJ4bnK/VNwSNSdlFT3FmjlDoR5inEHlygk14TFg?=
 =?us-ascii?Q?9v1MzDOqxfOTHZx3RWcxvJPRuo8JVwn5VsZXrqmaEsdqwWC4Vxx/JyemfhWY?=
 =?us-ascii?Q?6dzI6/wbMuKFa8Y72HvpD7asXUpHEXLEGqjRzQ7pf2cN6QZ3CH3JWhv/rqQG?=
 =?us-ascii?Q?1vEYq+p4JFGXym7wdWedXaQw03+2gaxxFhHmlDf2wiZHX2t3PHGB+tRkwerR?=
 =?us-ascii?Q?C1zfKH9SANV04m3q5vrn1SqcrOYZ0vCgKaqR+ggqDzykVLVQ3kOUm1btNfik?=
 =?us-ascii?Q?bZdW9/vSU+CLuj14igPxJ2Ib0Vw3ILUyc8S0wrDqUobytzfYS2qRyEp06Kmo?=
 =?us-ascii?Q?KJf9fWbQwyc3oJUn/LPDSriZqw2qq0+TT2jjuxlbk32NsV3T41HCVGsrhVsw?=
 =?us-ascii?Q?Sdvu0UZL9KrKz+pIX6I/LMZX8rKEVEm38bPrTbq4EBdCIABFFawacUJy3XMN?=
 =?us-ascii?Q?wGUD6EtPRu9ZSIxP0gKwfE5HuwlKxt90VimUB4le41Zhkgg/k+a+XFLetI4e?=
 =?us-ascii?Q?d1Ou1aBGz9dfOxrimnT49zmd3WZ0sc2SF7+Wn+OoT3GWfXGw1M7OBlVy0l44?=
 =?us-ascii?Q?jgK/V8OC6Vsi2wlaCvw1tT6h+wXXEqJM7s7ZN0SEnxVePtHcqNRevYVuxMFY?=
 =?us-ascii?Q?VvemZ6PiNYR+JKd1DrBFPHTkY9BuL0PE0HZszrsk9CjvEjEqlXENq9JRulFn?=
 =?us-ascii?Q?utcdxDpCa88h7FnwosoZ+xINcuCe8gc4NzpbCLFNHvUa7sfb/N3yKSrMy/iv?=
 =?us-ascii?Q?zAhDshks6hnE+UvaYKNivfdW4pwo6WTqfd+wPZDzgYXUBdZJY2AMMQHbykMi?=
 =?us-ascii?Q?9VKQoY+14YR0X3k7MeBr/bHC84wTZt+YSTSI5XDSQFTLcLX8jgb9M86Wj+j7?=
 =?us-ascii?Q?AOGE0Q2WWjHIshQ1Wtz7A0FBg8HkSp1p3yV9PcDbz6rvNPLpWowQyGOl9lcn?=
 =?us-ascii?Q?cSgP7ssm5yxU55dlgDL55JMinut8r4ePz8rStj0xLQ++FUAw3YdMUo1znA9T?=
 =?us-ascii?Q?DaQAdsG8PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c32780-fb61-4975-6f59-08de4f6b5658
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 10:39:16.5414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7LqDGhFWSouMFTbtGOFKrmiNlRWnaqZT9IPrFa7Kln4KWjtS1YFoQwC9A7UBwzm0ziwezi6xSWPlZozSBMgt9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8706
X-OriginatorOrg: intel.com

On Fri, Jan 09, 2026 at 10:59:22AM +0100, Ard Biesheuvel wrote:
> On Fri, 9 Jan 2026 at 10:39, Oliver Sang <oliver.sang@intel.com> wrote:
> >
> > by further check, the issue is reproduced with
> > KBUILD_CFLAGS_KERNEL=" -falign-functions=64"
> >
> > sorry that the reproducer in [1] is not correct. need append the flag.
> >
> > so below can be used to reproduce with gcc-14:
> >
> > mkdir build_dir && cp config build_dir/.config
> > make KBUILD_CFLAGS_KERNEL=" -falign-functions=64" W=1 O=build_dir ARCH=x86_64 olddefconfig
> > make KBUILD_CFLAGS_KERNEL=" -falign-functions=64" W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> >
> > but we don't have good idea about the compatibility of this flag with your
> > change?
> >
> > +ldflags-$(CONFIG_RANDOMIZE_BASE)       := --pie -z notext $(ldflags-pie-y)
> >
> > not sure if you still need vmlinux.o from us which is 300+ M. if so, I will
> > upload it. thanks
> >
> 
> Thanks Oliver!
> 
> I think the problem is the use of KBUILD_CFLAGS_KERNEL in general. I
> don't think you are supposed to set it from the command line like
> that.
> 
> As per Documentation/kbuild/kbuild.rst, the environment variable to
> use is CFLAGS_KERNEL.

thanks a lot for this, as the KBUILD_CFLAGS_KERNEL has been used for a while
and take effect, I didn't notice this usage is inappropriate.

Sorry about the false positive, I will fix the issue in the bot as well as
the reproduce steps.

> 
