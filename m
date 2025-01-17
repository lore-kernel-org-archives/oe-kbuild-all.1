Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500A425A64D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 00:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737075355; cv=fail; b=rTaXzriwggbc/UmeUz2myvyaeQIqTsEREAnwfTF+uzPhMKgAffVxfi9t32mJxU4BF9+pnRumAJatYJoWZ5WpHvW9Hx8PneXu0TmxnXtOCeJ80F4S4namD01oNY9FsGaPgCWSo5bLr15b5/W2WGsyavYAU2OjBcvZ5vITgup7uNA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737075355; c=relaxed/simple;
	bh=s4p+JjyjB4mPphJnipSyrGjVlqWhBRyKRcnXUFxaoMg=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iHWm0iQgfsSozOYvM5ovW9U0fDFArSCDAFgaaWYjABMFiyC9nVGZIp7SGhyj3W457bSpTV+f7fQKAjabg06kBuT1Oujqp3ciQOPud7GEb/g3vtpp8etkgvn3UtZqpJnSTHBplzkWlSQiOAwTsJ0u+t0elQkEILyFaWZJf6kkWEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iqs4/7J+; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iqs4/7J+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737075354; x=1768611354;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=s4p+JjyjB4mPphJnipSyrGjVlqWhBRyKRcnXUFxaoMg=;
  b=Iqs4/7J+zNsCCUb1VE/XZHlGsPDKxtQWxZZemurr38Et6Bd3vNCR3rqJ
   Hvktan1FT0K81kslvBYt//PmmeyRuat8qq/+uqrLwOQFjKYcXEbos/ajS
   VVx9M02O8AQzp8aiW4wY5cPRT6lOmFJ2hXqVFZpXcmy/DRG7nq2127Ij+
   ASswLKn6Ay9DNt3R51iB1Hocu9qPiLY0QpqnvhhlcQH155I6baKWK8jtN
   NSlMujTYP9Q6fYWOz1RDHpR+ZeGOoFgw/UU3mlJZpgCXqEZsVzQJkebRU
   X9FjPAVJpw72R3PKoyE+y6ZodsyB1iJFrqkslmueFVI/A9SbrTIF0cncS
   w==;
X-CSE-ConnectionGUID: pFPUtHWOTaKFAr2JLY2DHQ==
X-CSE-MsgGUID: p/lX9uAPQISN/SDmP3H/9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48905772"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48905772"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 16:55:54 -0800
X-CSE-ConnectionGUID: M6ibZ5xgSWq626BgGIKkNQ==
X-CSE-MsgGUID: 7G3twRhiRtuLzPXeucf+/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="136495157"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 16 Jan 2025 16:55:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 16 Jan 2025 16:55:53 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 16 Jan 2025 16:55:53 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 16 Jan 2025 16:55:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=laK+Gipfd932NWCyHE/bKOcnLX59Od9A+D6Ygs39X9/outGPVQaB/tw0UylXzKH0B+BFG4kae39s/6Mykp8D2jZGv1QoyZD3fAyCNL4+6Rs9mwTN9l6kAdhEj9nB0OPJYjV0tiBOcXsqWyRETwj7XYIg3n27gfeufIuVeJvVs7QCxeVYPMyUEjZ59twwQ19UakxUx/c36JKB94m1THDKCcq4tlzCgos6b311RNjVmN0XAyGoU0h2gdJp8p+faAAoyHxshxHVpuicphVocy5Ks+VNpux14jaHZq/pjQCTaGWh9nEHooveFuS1+IxfMShBUL1o9GKj7+nxpzlIWfF5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wsEwi4MlIL/Kz1290um33K7Bt5mYYR+tmtDWRtLpesY=;
 b=rBGLP5jdTh1uOf3KsF6bMPB0x4hMTHIfD0W9YVzadSmkWjcI3znphUqCrLsQb0nQ4SG7uYCCNj+7dCZXGcdkc6d3CXGq7f37e9I0DJ1wON9gbu4qXiZgVdXVdZXS82XkUYwE2p19fV/YeDoasHuQ/rs3d2GBFOwgAXWWspJNxBwFt6/iOtAKloxUkm8cim242oDXQrzQoC8OQCH/dLLCpsdalEui7YbXcTbc7ugxvBTkJiR6ZGdOGZnTVKZBWlz0DqxGc5BliWgji37KtlKjhcgxuwyTPUIzje/uK+ZkK5Qxvs6Mp/Kd/LpfHYf6YlVSKAcEJmxwSC2HgjXf6pLnaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB6739.namprd11.prod.outlook.com (2603:10b6:303:20b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Fri, 17 Jan
 2025 00:55:51 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8356.014; Fri, 17 Jan 2025
 00:55:51 +0000
Date: Fri, 17 Jan 2025 08:55:43 +0800
From: Philip Li <philip.li@intel.com>
To: Sean Anderson <sean.anderson@linux.dev>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>
Subject: Re: drivers/gpu/drm/xlnx/zynqmp_dp.c:2312:46: warning: 'snprintf'
 output may be truncated before the last format character
Message-ID: <Z4mqj2eAzlyIbXWd@rli9-mobl>
References: <202501170447.kNoyfjS5-lkp@intel.com>
 <d71b0a61-4848-4394-a3d1-c16d1dbee49a@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d71b0a61-4848-4394-a3d1-c16d1dbee49a@linux.dev>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB6739:EE_
X-MS-Office365-Filtering-Correlation-Id: 083a0fbc-631a-4396-2123-08dd3691b03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zW+UTa2Cl0O/FBUigtlaAqXvGMujUxyYPua3g9Z4DojnaOXdnjxt3tuPOUrE?=
 =?us-ascii?Q?9e3v9lY6ZqJZo/w1f1l191k5DQEThY77YFuiClgvOuISmls5Zc5CcEvP8ErX?=
 =?us-ascii?Q?l1gHNb3CjYZ+8Cs9zXNcfDh3awvZHJHgc32TzaWJVUuucdCPz0Rk8lN7OgiR?=
 =?us-ascii?Q?1MRBpb5TA4ueHVHcQaWwU1FGFuzsurwl8mwDD2Ih6/JrufqgB2IOmP3ffw69?=
 =?us-ascii?Q?bSe+BXKmEQ1dZOTFHpxAO9j7EFxlYWsf4zb9Qg7R/VkSFwuQI70dpieIFAyQ?=
 =?us-ascii?Q?8U9eEHUitaZcvTCMW3EEP3YNHN/5GfNeaX8Ef77J2bx6OUrrLaouBg2s/F9z?=
 =?us-ascii?Q?75SRt40TX5a+W/KzCyFh2NwQt0s1+7Lx5wGR0cx/nCyRDupaAQng2RT/jJrU?=
 =?us-ascii?Q?EbXxtcFH9NrcdGpCp1pqBjrGsDJbe+SSc3P3hvGiJ7sP5kD2HejWUrAbReY0?=
 =?us-ascii?Q?tiANocfx9F1GXSiuAtX2Jp9T/MD42PrdPmQ5mUGc7dKpI/C6YvFHbh7rnjut?=
 =?us-ascii?Q?5oPPqOkrjvSbVD8Fq374OXrDxzneCZy1PP+7fQdopR2hGHu79V9GnrTh184n?=
 =?us-ascii?Q?5J3BILgnJSacWqXIV55ov5arvGcu6OHxXTpmiWF/Z3Jak5aJRPFWNFGEuBQF?=
 =?us-ascii?Q?39O4V90+kggMQ4WgZQQedvxNwYdbyUXiha1c1nMQwVj1cEZvHfYb4ew7djBm?=
 =?us-ascii?Q?3aZ+EEMk+8PqiT7NAYd0MLKnSUQAZNThx+VI6npFGj2IMPyadB2PmiAS9gTW?=
 =?us-ascii?Q?znh2QDiaRekkCRI2qNhYU4XLOTfPll5DPEE1v4MwH/RPptjkn0UQ9GO6N9qH?=
 =?us-ascii?Q?uVpq96W6nHVKYZ/0um6pnraEhBBsyKqUOiEMber1nP3ZqzBbZiucWufn+DE3?=
 =?us-ascii?Q?WlXm8CSDEp1FJuAhBQwFaaA9DhhCKuUelhcOz6lgaHYl7ICmxHlngL2ryNja?=
 =?us-ascii?Q?OmPffkUtJglkZa4Du50WT3H3ghso8LZOSLEtLpZaG8nTB9gFDgC/t3kntdlW?=
 =?us-ascii?Q?zz38tpaIbQlqRVKBsvMWvjedaEr80XszGesz2BErHaq99LYIadKsQeH4KfLx?=
 =?us-ascii?Q?hxJaZhlOCk7JAUX6Dn29j/jcEbY9NuA5rLr22jWQeP5Uprkw9SmTpe8n8D5u?=
 =?us-ascii?Q?MvAQZhHZlinPnOsdxInZ0msJEUod6llF3t46FleL+dwX9okn8BFYvOwbkYPG?=
 =?us-ascii?Q?Gl76HEjJ40hgB0yKKdNKT68De07oJVv3+g/tyHNY4h5Qth2rWoMku3UqmYuT?=
 =?us-ascii?Q?R4FLBdVsq91RjvHQ8PRuitQcVsxp2ceKPy3Xr1wErS/zFMFVh0ORb4c8htjY?=
 =?us-ascii?Q?kH8vhv10eTYE8zT0A/FWAuhl+bwd0SaLkIEGUcr0lQUHkr6O5iF8+1R7A5Pc?=
 =?us-ascii?Q?psy5ot2/oqNJfXVPvvaVeUl1vKLz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQugGdIvGHCxHhAB5dkmcWVH+9NJtzRbhdW6ZuSISK4nKcGH+uAx0D7hQh8A?=
 =?us-ascii?Q?Ib6D+e9MUoI5vz6p8us4x8hqZsBW+sURhjcDwXMDz9x/SbD9G8zmid8h1bET?=
 =?us-ascii?Q?txZ7+Fs44ILyi+3H7x5WFpODy+2i4cRxPGUfSwlqdumi/JfR51w023C3qjqp?=
 =?us-ascii?Q?BiR7dSdZmKFUb7CCyQpxlovrOJuVieVaiC2XS/aruxq1SwU2vuxFfrr3GsXa?=
 =?us-ascii?Q?8Db+fIIDxEswRHPdefK1WSh7IONziU1OYPZgYZUtGuU2Pi/Gtbwb/DEnprVJ?=
 =?us-ascii?Q?nS5bvuHcGBeYZX0nqeL0QAmyCGtc91Js8gkMfDHfmqWsMCUSJpdlGPQ9dHSx?=
 =?us-ascii?Q?W+kDEmHYksbpUpNbxhqF8w24aAdRm52SZKXS659FsPDaYOy09xAay1HYFPnM?=
 =?us-ascii?Q?Yw+vtrY0oxNyfrEDEcfmoKVNJUC9QyMwqP8dXOWmM8R4lNIy611B/8HJTVs9?=
 =?us-ascii?Q?rWw6azAKNSMvIHGPmzMua/Q8BcPxaoT7M0kKlz6/g77o2tDeQksNf+ZjFCn5?=
 =?us-ascii?Q?3mQuFw+43gwi1Rg+tRprMa0UoqULDq1yOKUOPYvF6nsJlHpcEOnVpD+yDsJh?=
 =?us-ascii?Q?CmQDoX0IHQmwcaNVRVvAmvsbUwYObRMY/P+n/9tb0YuMoqf5yPWrEz//c0pT?=
 =?us-ascii?Q?nn2O/d+ihrD0Epls4y615sd1RozpTr/MP5r2OSr2IQSDBJBwkza0i5VwqGV6?=
 =?us-ascii?Q?G+Ro/Eyd8Z5xwhbHfTEhcLgizw3puu+PFiCoZCK97OKcT40/LqZQyzSOFnlW?=
 =?us-ascii?Q?/SVYSVGwHegf8cflTkN6t16bvBcK2Zq487uc8ai4FhR9sAIwQpYYOjvqhhJp?=
 =?us-ascii?Q?DIgiA2Cdplzx40wuRyW4bSX+bSIau0nDD5y8aL9WjSzQhDhxXPmogOdOzBYl?=
 =?us-ascii?Q?LvEWCIdF/gcR2n/LwIumISpTEsaNn0qMEutb8D5OXsVR3JLGCAtpMasFzHt1?=
 =?us-ascii?Q?qFYByOHfGPqusKmJgElwZBiOtIum0H6qFILVl/wGopzgNxOFjLd6g9z5/SaN?=
 =?us-ascii?Q?Twx7AUWrKUITEKdY2xJu2wvBmPfrLKYy0DYtLQ3f9M0ulhQGlliSiXzhzdhT?=
 =?us-ascii?Q?12+llwi/nhqFvjkg0tVt88d/ZhSelQZy4hFf66WhOUkwyBb6I5KW4dC+tIoG?=
 =?us-ascii?Q?5mLEjuK8Cui1hGVO3/fMqQ/sFF5+bQKWO3EkjgWILSi8cZNFIhpoInDi94VP?=
 =?us-ascii?Q?+b7jXtsN72zBTNR6/yisRFd2LOWPf0+Ex81et08yIlrr3m0qEwXATyQUwPM7?=
 =?us-ascii?Q?RvvDjGNl7PfDK5FL7KuAXFi0kYX3lkg2M6xcFu/SdsbyEAVVFM00G+Bemagd?=
 =?us-ascii?Q?XvcjaZMbXJnGUAll0cbKnq+MqAiNBQN+29peH6GGVkdJEGXOZ2oXvGpoDIGZ?=
 =?us-ascii?Q?IVE+0Wftvli5No0DZqLw12dduuKSI/APiwpjiUMpamvHoDGZyeZgQxDD2lik?=
 =?us-ascii?Q?6N9VPNN6IKkVbubahGMGmmOpMTYVSmnRnzXb9udIqYBvXvqVj0ZzxK8Kx+zF?=
 =?us-ascii?Q?Iwht3lYH/aQ1DI/0zmLYlJZNTqnDyRUU3+yE4qN2KzKOJ5jsOM76iHEv+ETL?=
 =?us-ascii?Q?JdWmq2BfTqGw9blBUkqWXgeDsPLD8oivhDqi1M7d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 083a0fbc-631a-4396-2123-08dd3691b03e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 00:55:51.2424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DsPvGB281XcF+sCVggFEkcMO9oHNtyxLJq6sRqCWM8F6nWJjVBribos+1a2EhAPmrdEZgTNhkjVj24w2WQjlWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6739
X-OriginatorOrg: intel.com

On Thu, Jan 16, 2025 at 03:28:11PM -0500, Sean Anderson wrote:
> On 1/16/25 15:24, kernel test robot wrote:
> > Hi Sean,
> > 
> > FYI, the error/warning still remains.
> 
> Can we disable this warning for this code? It does not apply.

Got it, we will follow up this asap, sorry about the false positive.

> 
> --Sean
> 
> 
