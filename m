Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B2E8BFA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 05:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719035707; cv=fail; b=pNhgKhBliv2Wuie3xRJ+O9pAP8oYZ906gHiynyVBIYRteOt2RCsu0Tq1lJc/o5GZcT7dsOMWN1g+pkkuOQODJtzidykJViwooHLW8zqxiNAJo6dNEwmstgTXi/R80mFIQzBTPwW5dcXj5vOTF9HJkSLODHq092LljXyr6zPgu24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719035707; c=relaxed/simple;
	bh=f+8mcU7Wm3HYzUksBri0cD2PuCG4z8I6Q7Z6F74yUf0=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TxcsRLkdFhcWQWpzDQ7s40es9Qb2pBIYxTjhrLtuvdvS/BTuMgcwqoguAC5ZNk86vk0gHH307sdvgJ/5nEaZGc8GMhpEueZDTt+70zak6fcuhtUPn553HkpPw+KXD3I1cTdIQzoWYmqenA1xu7YovMJL2qnrA7I251tSjJ/vY2g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IalZ42Vp; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IalZ42Vp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719035706; x=1750571706;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=f+8mcU7Wm3HYzUksBri0cD2PuCG4z8I6Q7Z6F74yUf0=;
  b=IalZ42VpADGPKVgIqHjKeebW0zhnO9NdDNfHJNXJHKYB5inhZ2zi7ZXz
   pEjrcnd32UOq4Gik1gRM4uDDuum+/fcWTzEalpWH+83rXjSBE1hkUl93g
   qUSSmufhqrFEpfymgXEOUU+ITwNvmL5GPqcPYYtsNWircRrLagNoFBQtf
   OVw7guob3PcVS+++pTg35cpzrOSPIpQVvN9JSp6o5HK2Iw30IyobCEL4g
   +Fjr3xhJY34EDediZdJEXSzSurVpjYikgTYLxney3k4zssBmdna+h3uq8
   j5vwnOaya6QiKA2hUxIlrtg4rqD537v801POEFi3C8zEtrzGW/kwA9n6j
   g==;
X-CSE-ConnectionGUID: 4ZDynvqOQZm57YLPmXErrQ==
X-CSE-MsgGUID: YYNZjwoXR2KZCx/bsOzW0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="41482239"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="41482239"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 22:55:05 -0700
X-CSE-ConnectionGUID: o7eQ1F5iT16jor1nKefC0w==
X-CSE-MsgGUID: idsHGSdwRdmFJsf+nRrzdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="73535533"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jun 2024 22:55:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 22:55:04 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 21 Jun 2024 22:55:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 21 Jun 2024 22:55:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 21 Jun 2024 22:55:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JKmC1fmGSNRgzvu0JLmSwXc3PfHOTAwmlIqQiqIepzRcNIsjUZxEavKFI89HcX5sO5mHHAvGDb2nBZ21V0mE0/nGlgjt96YQ+PII6ynrRRIpA0a6Xw9LujCUNIvJmyVVjWQDzPH9RO/lOtB4Y7fsaOp8pXSt+Ft5GTK/6txSTraFb3DkA63w62k8hzAKerQBpFNlGd0f87WUW4n6H+EUT8a4pddgVTOQfv+7Efrni6qSozYxRinFo72laRFhJM0P7/1MTSOEgH3QoC3cl5NPoe339rkMe9NEjsA3CL9aYiB5b4JC5m27sGgARS6Oi2zu9VfDcVf/ZP4xS/YhSvSRuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wrXQJT7am2aQ7bjHFoV+yfdFiuAuyKVy6tTfM8h69tI=;
 b=nbQpBwKODkVOGTzyW/c4f8tGJF9TmEeradx81SEl4KCma/RBptvRm8AK6Hm5Gk/oxSyD7MAAIZfhGNnTrlzRFyVatikJ6C07wTNMMALOm7x76qEcHxDca2oCPYvi1EnEK0CHsgp5N1OpeYK5xxqW8rQQwEWvshrYGbg4vXWlsnObeRQfInCadijLzHV2rJqpKyfZFTz0FiHahje0Ay/hWOSsiMtWouYZxsoqt3VjCh95Ezn0RJJZmG/eMFxeSSey/7+EHH8R2YsJFbzadxcuTfBfrwxJY01OiFjdCtWKnXnqm1js4sm1OZRwZTQpoJUGukCEmJuqkB6bz/szx6iBGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 CH0PR11MB8190.namprd11.prod.outlook.com (2603:10b6:610:188::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.20; Sat, 22 Jun 2024 05:54:56 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7698.019; Sat, 22 Jun 2024
 05:54:56 +0000
Date: Sat, 22 Jun 2024 13:54:27 +0800
From: Philip Li <philip.li@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: kernel test robot <lkp@intel.com>, Kairui Song <kasong@tencent.com>,
	<oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, "Huang, Ying" <ying.huang@intel.com>
Subject: Re: [linux-next:master 6383/7397] mm/page_io.c:283:41: error:
 implicit declaration of function 'swap_dev_pos'
Message-ID: <ZnZnE3ZdCv56tYLN@rli9-mobl>
References: <202406210911.j0JhlO0N-lkp@intel.com>
 <20240621190254.8b81cfe0c84c4db57aa85bf0@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240621190254.8b81cfe0c84c4db57aa85bf0@linux-foundation.org>
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|CH0PR11MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c872fac-bbe5-4a8b-b20e-08dc927fcc57
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YMF9hSERFbWLCxkf1UeipDN9z+J2ArsEINGHxg5gckVUCWpg0DJMe9MBETCR?=
 =?us-ascii?Q?zjM+k8r5V6aj2aIZAaTZ6aM7mi8mMrOYKBqaqF0VLnFqSNolZXOH8UdtCpQq?=
 =?us-ascii?Q?0innDbpsVzGsGDAssQ5PJxVGnocLV65Ut0qHp+39eL/lfJ5oE5Q0UsB324UD?=
 =?us-ascii?Q?PFECGV1PHtBaHU7vIJFqj0rdHTSvM7tXW9maJAP5zzEBiKsDQLfqoS5Sh11u?=
 =?us-ascii?Q?tZZ0LptBXtbFfvfoJN5y1HO5gVcio5wuERyoaHHWlnRU8RqrC4roE+vsyBUj?=
 =?us-ascii?Q?HW6yMmmRopbuC6K8UJ8osh8DwQBNsFW5X1LXTw5WCCkZDB1cDnfcLpYenKAu?=
 =?us-ascii?Q?K6l/Nj0SAYYhi9XJveLFT4BpyDEehZzECE2JsDZEKmEqOPgGXjso8JVbWpJX?=
 =?us-ascii?Q?sHm+gRXGZDPF+ynrVb8982GXN7g/z4b6qPmUj9PeaUEI7ElI+27hBuapk9qY?=
 =?us-ascii?Q?wBsJjuyCvklJEdI8RMuLxkdMgeeRKnMS2a+RLxqVWJTW4OkxNdKHJyLbPiGe?=
 =?us-ascii?Q?rYabxuG4isPji0Dmwq2MjmXIE7DNliclKy2eH8uv/lgkhopUJipVS+rzOa17?=
 =?us-ascii?Q?d891NKsFBi8AYuU4BhPEc6itVummvJdpMX2FWZztHC3z53yUMwPxqSI9rigX?=
 =?us-ascii?Q?f1j22ilpy2UW5baPAJe1gZsYER3Aj4F7sgEghC4uPF6ABduVcDpJyFvavDcy?=
 =?us-ascii?Q?6mH8XmAxoLMf9qOxd+hRnUbpoAet6Q8Giksokwcu8xtb4mQyJfO+eW9uCQH7?=
 =?us-ascii?Q?liugMl5DrgXHMJ4ac8Hbbj1x4Uy9h3CxfK3AyM9QaP7TyyS/f0OOTDDWHfqN?=
 =?us-ascii?Q?GYBtaxcPLBQyXDFzSVGgZth8Q6ZJTUJMvJCwarzOMN5gSNW7Zb72CO2XKUQm?=
 =?us-ascii?Q?zs/7e9Q97K11/3FXkWIZ2GATNHM1IEBYer1rw5X2dA/hTxx5aavXVC3crSLV?=
 =?us-ascii?Q?wbz82J+ZH9QhBJmaaDaZ9mflUzbDPYzMJ169sccwK4tIF8XJGpWl201+cgPQ?=
 =?us-ascii?Q?tzcYfHvoxmUDrTptFU8sjN4dbmprDl2E3c048crIAS3ohSQDkkiCFkJ6y5xD?=
 =?us-ascii?Q?wzfqGO9RGyDAMf1tNSrpIyHYgVgoNa/qvD0tsz8iLPGAG8Hc6sotZgNzjh05?=
 =?us-ascii?Q?3tSTv/xsoBviu17FCrGdcAkCz4f+rHaP2GKvMoj2VyQWAMCtoP2U8HYs0Lca?=
 =?us-ascii?Q?MVWv1GF3WcpNqv+o5is0a7p8h2MpY4g8M2MzXwGjRPXhDcl6PxUvicpspJzf?=
 =?us-ascii?Q?yooY/EmvWXUh+x9I+cn1NNV/xkyJhLe4pGqwZzcsow=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(1800799021);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8NDCBEhyHvu4EqqrV3wi6nKL8HywutbwL7SkANhrekT4kq54W43iwcrOBgil?=
 =?us-ascii?Q?gw1Cir6VleRYunzSREl2FNslrTA9hNVqCZGJ3FWsrPHwWXizUqKrkruDAnxQ?=
 =?us-ascii?Q?KybqCKe1/86AWVqqS44+8nCPBeX2blDsbu0nGqNS7rtf6z36+Jg3WUoTjgLh?=
 =?us-ascii?Q?DruzwCqy+a0W0aGwRNE/RlICPPj88JxTJsUt0KR5j6WyfM71jaPpNjPjOTvD?=
 =?us-ascii?Q?PIrmoODn3aOHWk5y1CIrfRVefJ8RSFD53E64hdLmAxaZ4+2m8qEu8jIj/met?=
 =?us-ascii?Q?707C+h3Mtf0N5Zl0rVNBVKxEVRhh0Snn7UtorP36gVQFUsABdyveHJgjTmA5?=
 =?us-ascii?Q?ZjBbC45tg8383AmvwbWVXp7PZ3i1CXTmjaPFYoBHzubRLrOV26R5or92pVhJ?=
 =?us-ascii?Q?PR9DXd8s+CSJRDeJ6BRKjbQyTw46fFI3qK2dW+YFnl9Jeo67CkSXTTL3mJQ9?=
 =?us-ascii?Q?RHfHQ/Yt9csU4vM1RwxdmAlhzwkbtTA2onPb7fxiUwt6lt6VyJdFfjj9Tq5s?=
 =?us-ascii?Q?3fIpxl09iFeV56lXLWFyA2NMZtlzGzJMrdchxG5VsjPB/ai1XtIIaY0Zu5Np?=
 =?us-ascii?Q?DzkI11OA7r92wzMgfXUpzydRtxGV2tOU2XhN8BT9tEsdXGVrDVGl70pYpsJT?=
 =?us-ascii?Q?kJ4II2FGPZhnXoTCv+sx7W0ZxEK+D5iZCCvYRDKADKne3vcwxvFy9Q5vGn/l?=
 =?us-ascii?Q?Ey9olgjU+0WAuwoulL2mM0qnPC0eeaoyN0f51E5O9P9Z1MikrUTV8MpcfZrz?=
 =?us-ascii?Q?C9ztlkuNjcObQypm0lPtbttQtkW4Y/4gn+/JAS/xuUYyKyaZXv/TLVJkwHfp?=
 =?us-ascii?Q?Se6v/sJH5+Nt9Wrn0fxrfJl46et6ZLQ+u1YDL0mlN0uaavZfQd8NCcSrgDS4?=
 =?us-ascii?Q?cxOyiIA5MGyt0P44HbfLkEsQU8MP+duByhSLyOqXLeuQBb4ocUuL3Ajvh/ED?=
 =?us-ascii?Q?lTSzfy68aixJ/VMgu+Zb8hLRayL9uEnwioxR6UQZTjeOhme0yLAOCldJaWUW?=
 =?us-ascii?Q?7VB+nR5Ku7oa+IShAtS+dIBC7jTc7sJOMitA5zJIKk6xX/fwRE8Uh+566btS?=
 =?us-ascii?Q?7/m1UkMi2oIt8guneUeaYqSYILaOIoGJVDPrGRwZ+E56+vVNR9c6sAjRka1W?=
 =?us-ascii?Q?YOnTVz+PPAELK/Ll31WKr+sI30b9GipF8UqToCxN+oYS9jW3UbDiYC6AkQJJ?=
 =?us-ascii?Q?5oEcC9efVQdUQcWwGBT4hIydgV+EzNIPLxsjjaiii9yGvxlJo43mlt/K/wB0?=
 =?us-ascii?Q?+0bQXNstcfmX7/BxhhVaFlm8sSfH/pH6YM6kQZupqVzp82WCaVaLJHepbWaw?=
 =?us-ascii?Q?K739fs5tga8bohTYm6DGpy4VBdN/G58TQA+AAYGv7a0K7Uo55Ee+gsjzUB+1?=
 =?us-ascii?Q?Eu3TUy7dH711kEvJlrPyJJUZ6IWVWnEOgALCaW4c0WhR52KAvMkoU8a4nx2n?=
 =?us-ascii?Q?8sPLQeePDHWDarhszVzmmvG9bs9PWfL5I2UlURO/LDWkf8JBjSWdg5SNZqqz?=
 =?us-ascii?Q?ULyXDKpp/2qiJm8Z35OHHw/Qw1UJeafUnEt6vSYLCIzdaBQVDhlf0r9q/Zjw?=
 =?us-ascii?Q?0803KSsqZnK8rPPuqOpce7RrFQRIzWEsbCk0cDSJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c872fac-bbe5-4a8b-b20e-08dc927fcc57
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2024 05:54:36.7427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iej9OASzDucJhTyUZnrf+of2WSwGB/oM6OC1PCFrNmt+f2JdFyfq6Du+mtr8xVwcBSsZk8hhDRUpMfZ3cyxv5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8190
X-OriginatorOrg: intel.com

On Fri, Jun 21, 2024 at 07:02:54PM -0700, Andrew Morton wrote:
> On Fri, 21 Jun 2024 10:10:36 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
> > commit: d2b0c82185149e17ca3efc51c74c643c21668d63 [6383/7397] mm/swap: get the swap device offset directly
> > config: x86_64-randconfig-014-20240202 (https://download.01.org/0day-ci/archive/20240621/202406210911.j0JhlO0N-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210911.j0JhlO0N-lkp@intel.com/reproduce)
> 
> I can't immediately see why this would happen and the above links are going 404.

Sorry for this false report, it is a wrong bisection.

Kindly ignore this or any one that uses x86_64-randconfig-014-20240202 kconfig,
and we will resolve the bot bug asap.

> 
> 
