Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B2D3DB337
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Jun 2026 11:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781092671; cv=fail; b=m3Wzale/KpiyWqmOjXtCLXh0zXOsofn6B2rH59whbDsZhk1GVJVLHLhjTzrx08ihNRHD/UZdkoWYsTd3LHPxharfCBHTcDHj33H/gbxg2F5oK5ZTvZWxRretdHLBH4aCMBIDw9wwn3dXKzT2A2IAW5BeSPB9bcy3MCZj3qa1Cyo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781092671; c=relaxed/simple;
	bh=UsDQxMy49kOdMxIprCR9QWBzXfvB4CVJs6uN2PycoeA=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=qBiZeFYH+2iSXnuuck4IsfL6SbcNVGUX2y56lqRyVcM00XkDfLxQ9LL+SpNMtZMxT6ufauOgJ85dbKzRETVqd/jeobx9tDTnc+IDDN7AWNTXrXdQNQ8LYjDpXd+odozqsujLSXNB0KadTqUjbcUZNWhLT33TXuYWwz1H0OHLrBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gUc0Ullh; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gUc0Ullh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781092670; x=1812628670;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UsDQxMy49kOdMxIprCR9QWBzXfvB4CVJs6uN2PycoeA=;
  b=gUc0UllhfK7BV+MkPwuGYDd7F25hI7l+fi7I+mySDD8Bcbrt/gN1NtYd
   GaHTOA1Ni+0UvSNv1UD8fxp030aU4/AizFADI+WHAMv31PJs67+5trTfS
   ODSntXbEbDx2k/u3+Jr/IoD8YOn/7qhKCh1xVCTIYf2RMMIjZ1V57RI7Z
   pET8ZrAfoR64jg+wqBCBEZaZErcB7ZH7CshzHyK5D/6nmQgQ4ML8Db8q0
   W2d2nhyczasNlFqeN1z8CKiiFlX/80XQzIwyRHPLNppz4X4bklkq8bH3h
   M5DfUvVT12a94l+QNg/P5cuPyhglarr6uYljEfaUlYcIFfa9hosyi467u
   g==;
X-CSE-ConnectionGUID: 86a3jFZ7TRmvMaQA/tEJRw==
X-CSE-MsgGUID: vNt5jCrvTBShR3eglzxu7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="92556851"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="92556851"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:57:49 -0700
X-CSE-ConnectionGUID: sgTNHwk1QyeR63qaIPSOzA==
X-CSE-MsgGUID: 0VnBLAhJRGO9ETAkdY/w2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="270155942"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 04:57:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 04:57:49 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 04:57:49 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 04:57:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p+EJhw6wkObRZ4e2FL0gQLUMMCgq6EoyoV8DQ31Nzksyl7vT4Uo6jz1J7RCpFhZ+lW+7HBfIzVt9CH2zi/hP/XJUe5fC+n/lR8Mke0GjhY/l3bA5De17h9s1aPuVka/pQt1I7+CC6xx6qBGaqC7dfGcvJR2VW6Z+Q4AoN4rdboBiorhGUaSo7l4fnmXHXpnBnMegsSkRgRamgXRjVR5oO6LR8jxQyH+hhvqA2vZAjkU+2BmlI3QNPxoIx5MFTzPAWicJMPPkJpFz07XJwr8e6cifinzgT4ohOZrhDWBMPT5dge+qNYs4c4tKg2ooek4zqKfEoCpyTrVUgTHuaOIupg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjH/ElTBOWq+LAw7sksxLvyBov/wvNy3RDI6E9Vmy1I=;
 b=Ebyjvk/EHpEcJ3/eDLqE0cFL1RREAKhX+ba/FLSehh1F5Er1QZtScdTwCqxmV+oZh0xtocHIGhszhckiFRMn0aEpBSn4S3ZMOey+F6Uvo8y/nsNf/LyqY2dj9nikZXnUpEWhNgbFEKNDAVUm1mklAor6hecZh0ad/sPusA98lB/8h7joXzV3QciQAH7nwBEBUXcz/FchpcepeCOi+JBfNnHdrkH3IQw0IkZUpziwQeNW8TjVADDKLqFNFKG3QJHtZPBS1MRJ8hulpOpMs6HYMbUoLJuFinMEIwC5TuG3R03uz6GtuCGtqLOVARX1iaT7ATrWtpWw1PbvtsJ9qFjT7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by DSVPR11MB9556.namprd11.prod.outlook.com (2603:10b6:8:389::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 10 Jun
 2026 11:57:44 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 11:57:43 +0000
Date: Wed, 10 Jun 2026 19:57:35 +0800
From: Philip Li <philip.li@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [hch-misc:block-error-injection 3/4] block/blk-core.c:141:33:
 sparse: sparse: cast to restricted blk_opf_t
Message-ID: <ailRL3E4dtN6/mUE@rli9-mobl>
References: <202606101953.PdmBi8go-lkp@intel.com>
 <20260610113757.GA18273@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260610113757.GA18273@lst.de>
X-ClientProxiedBy: SI2PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:196::17) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|DSVPR11MB9556:EE_
X-MS-Office365-Filtering-Correlation-Id: e3b7b2bf-aa87-4ef8-5bb8-08dec6e77ad1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: QFSFig3L9/cTozL28ydlECnMWsd2zWHNkG4NPMIeNTNouzyzdKEIURgn8UW1iovMXI21nnAB8JLcHXmASIb/Ry3UwCJ7ls2RN2R6HO3Z17GfXQfet9AmTP9KMrQZ8WL+4+OyHDeSbAxBGUlzYqvN/lbeiYftEDuB7nhYEPBkHt9EUpGrM5PrG/dmUPZG9jyUqlUCoXIBdTlPnARj8a9noGQ8EcH6Pa6tRMgItrBGuEsTiilj75QPV9mYkJVlrCA3FGNkn5nuMmmeInsgvLYLPnFMoqcNldr5Mrgs7xPbmda5f/2NdJc+kUGSfrJ/g8yuLU6rt4v/5lNy2KxGZqZoVEZQL0GXNouO8NRJBmrhB8bS/NwZBsqRGMJ9MTLW1E6zxGx/CiFYxaoXffVRHLOUVtFmFIxcEs5ndJgc6ae8Al0ICBSAGmgxbW5rA3HZTYMwev9YbUxkAKIX16g42ahrE8pEEcOUNd9tgnVdnv1tXuZoiUj9X61uXx0sCy4DENcElpLz3lSLKp/ISSTvH7sbSHB63nCxDNRt7t8ucrarMugtVjQGEBzCKUwPTNU57O3IiSf9ITWRFmbZ/539jJkqqjht8JjK07pkxjMu9HFYip0gypx95kpu329a0CvfrMHcF740EOpuDkfkWCPAgn0KazCXdBXAsIP53OFEpFHWE/WJabsqYfghytHn9ysVuA8F
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sRVyziUY9FWYbzl7AyVdncNtd8OczZG3Dp1ka128yLLqyVR/TjY0EBAjXJ7a?=
 =?us-ascii?Q?R6O+8Rs/QYB0iqRKVgiTeVWavMMqSzXprSVxhG6olBDjfKmmqinz0gVa8uFC?=
 =?us-ascii?Q?t9Kd3OqJ98H8XM/xaSQCEUTjrvZW7F3W5/ptZz2SdBExSG85K++07jJxnt8H?=
 =?us-ascii?Q?srHnActSpken5heAUfFEOJeo7BkxFSvpiwxIBBehjHja7ko4Z4e4sPi8scva?=
 =?us-ascii?Q?yx9XRyEmIuknlJZ2iFiDhyLVfAEqtUuOvC/LjZ+/+lxWIZttqFJurpDZ6yOk?=
 =?us-ascii?Q?ytJc90Z9+NpH4OpdQJ3+Z/DTXspWPkZVmX5AabK1kDlx1YK77ol+OvtNe1Zy?=
 =?us-ascii?Q?6j5dmr6HS9XPZlS+2bO2tSPjrxWVl4MV1HwPAiR6h3Cu5iFf5TUmoL949NWa?=
 =?us-ascii?Q?aj/xzTzBsoE6iseFojYcCPieXwgRpMpujn4q3YP8HtPzV1qRMkUA6bA6+M/9?=
 =?us-ascii?Q?4HqzMWDQ4++Zoaf5nXVgQzT6SvpObpoImjj8kDc6kTZTWXJx43gGyYdij/rw?=
 =?us-ascii?Q?9Rko/RS8/TSEx7YECJtpr1fBCAXzZndBuRu5GXYZmqMq1ERCzYbIw0g7Ia0P?=
 =?us-ascii?Q?0ZxKc5GDvf4hViR4aWLscfzezo5nfF1dd3Ro3Kg8LIjKlkIiCaH2m7atYnzL?=
 =?us-ascii?Q?H1wEgoVbu7W74LUcnpOnF03pPQwBfwXDFOyIL5bAfSoz6Ps7tl1tC+Gy3xKF?=
 =?us-ascii?Q?jxvAJndK6oPZl6IslXXLx0qZHZ2gsype5CgbA9KkNIraPyTzqbjxxItKirn+?=
 =?us-ascii?Q?lzRTQfC+Pbvk5iGWqH6u8pfQ53FeZ6xrYVlpp3A0wf8AUSSMpU+csI8zbtu/?=
 =?us-ascii?Q?LMVkYm4LSPjBnFLhIvBhGldReM+ocLYLbDP2mFcjlY3xh4d5fG2Z5nwgJNCm?=
 =?us-ascii?Q?0xERO+nOLDdABl+ScmxTmUvi7mJ1ykyBtv1DYwY0ryKXOJnxbw8TZx2r6cm3?=
 =?us-ascii?Q?9bAHXQMKhzesK6SpBRNURAVNyrFF9iBTBQ1H8VVdVourVomLXK6/Lz4y2Bsl?=
 =?us-ascii?Q?lbtrTZ3Y0/KxlgJe0y3Ot0iWWx38i02i8KnoKZpZlkPk2RNF7vIW8N5/XKQt?=
 =?us-ascii?Q?LYLeH/DJE4n34tOyEWvvjXtsmRIpYmjnADRzOfax9l69xHbM0RIcYn3WSHpG?=
 =?us-ascii?Q?w9qtbFE0zE/cen2LfDRFPV6Kj2qCgWvsakegk98r8uOKd7qsSel8zyPGxxF9?=
 =?us-ascii?Q?aKaedE4JM9ue6YbjPzt3lOwksMQvvq7QFQk4o5iAWKS5HV+j+s1Qw1/PXTyh?=
 =?us-ascii?Q?OZspgnctQJTmcRv8lEmIOqU8LId50v6xGsxAxqUQxINtp97Wr+XnWsUN6fx5?=
 =?us-ascii?Q?weP0OSkJLnW7ltSltUKe0SUgkIU4rNFQDOXjD0tQSxjp3cJ6QVPoBrq7fMxU?=
 =?us-ascii?Q?1aYsQNbeSslXNpbzdudMstCh263wUORzqYHxgyAsqZH2HylIBgK7ZFBzi1ZW?=
 =?us-ascii?Q?W6+jveGpHF+jYkbOrM6049flcVWcmG1re5zLvg5JLwbF+srtVXKE0v+kVqlb?=
 =?us-ascii?Q?Ad3Q07tVkHvJNzC+yuBjNNVgU80bN9buppZMI5m3umVb4ExGUvJ6sKcedpGY?=
 =?us-ascii?Q?+K6XpkKUATkE0ZT2yKtD5+rOhmrVZidcep3irlJJODRz6QNKG0Gfi4Kai/PK?=
 =?us-ascii?Q?7U/2qmNHf/d5A39m12liB7TdoNNz4BrOBYL4rW3v5Q8Ep7GjuVrI0vHI1lSu?=
 =?us-ascii?Q?eG+kF7V6CzWkaocAW0BWsYUIfxd3Rsnjf0hy6YhPh7gdpJN7m4eOazyUvf9S?=
 =?us-ascii?Q?VbTfcgleYQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: WfI7R0ZsHWip7FFSGl8VYMauSsAvbAsmBIaGHyBFQnipF1Mg7MmPSw7pjiLt8tMLFevZmuPIW5KLEdWlpylS+zr+BjYfGkjLWpr7kmKVCuP+Mf2vWr06P/bdJ1Bf8vnehvWYD5l0mAR38cRfZmpwt4RPpYTIVsofbOueTWDFlL1QjYEUC9dmVUOqUQBK4fLxheqpnf4mbxL02kXHhXYBaZX8xtLz0NX1K/LNLH/9R+f6dTSeSvN9ayfZniYcYTXJ2ejxYFVQxpI/uRd7yZhNcGJXjR7Tqv5XfWxzD3iMB4xkkYUI/xVxrBt75F8FMIPCo7Heyu5C1M3X6U07A4fIVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e3b7b2bf-aa87-4ef8-5bb8-08dec6e77ad1
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 11:57:43.8177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TkABccN1bRnbDHGZNRMDyIyM5bshrZiJY2rfIkQ0jtAyQnfbn802WowvjVTsnijAvCDa4TGD71+JJ8CdMqBIYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9556
X-OriginatorOrg: intel.com

On Wed, Jun 10, 2026 at 01:37:57PM +0200, Christoph Hellwig wrote:
> On Wed, Jun 10, 2026 at 07:22:03PM +0800, kernel test robot wrote:
> >    139		for (i = 0; i < ARRAY_SIZE(blk_op_name); i++)
> >    140			if (blk_op_name[i] && !strcmp(blk_op_name[i], op))
> >  > 141				return (enum req_op)i;
> 
> My spare on x86 and varous cross builds is perfectly fine with it.
> What sparese version is installed on the microblaze build box?

The version used is

  sparse: v0.6.5-rc1

Thanks

> 
