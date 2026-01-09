Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F9A2F1FDA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 09:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767951593; cv=fail; b=mtN2RMLGLIO/YhMp3OgMe6XxrgUCwsZHa5c1H04J0Y70ldD2Nxi3unDdp9hZdF1qDf32eYowM18YpZ5aC47Y+kKPSMpKe6o8QwHBWopE7Kk4bhOXsDwLy6OMjwvcg2RWEf2XMyn4CRX5eoo56cU/zrH+osMKTCbKwjmr2lwTn74=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767951593; c=relaxed/simple;
	bh=FgJERJfb3OEmJWdi4qvUjmyfXsnyvJuDficeOYs5URk=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=gmpJgqRdSEmIA6abqI++hGXDQxKDjDMRvpo1eacE2eoIO9HYD4wuZoiBAm+hf7+vf7gFszT0ZnBSVsytFy7HqGMqTwGKX3Q43gr2xpnFKYDjz2FfRKzYrcaZtrAbRIw5GQ7eZ9LdtdbLkQzd4Jbbc97kBHiMIH2ni0Y6YyWN7ts=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnqaeMez; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnqaeMez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767951591; x=1799487591;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FgJERJfb3OEmJWdi4qvUjmyfXsnyvJuDficeOYs5URk=;
  b=PnqaeMezqyUWQXVu873TDh6BII0NJ1FkzTxB1HfWrcCO5hpNw8s4TMli
   u69kuUVGB7CJGdP0h1Y54Y/BhF1FQy3NjqG2mzgEIh1qWW611JLenEEAU
   cWiNWTeegAzs8ta6hVs0FqEb1rxCDFq+xbxR5yfzPM9HFHfzzaWncI1w1
   wUgyRwXzTJzRPeAXl73wUxsg2gDeEo84MgaZjswprY6lniVYYufLAgouE
   7ukU35UKib+v1K8vb6nxFTdUOwDJg4JKq+C5Wt8aqcVElwZxMBuuWcyGm
   t24U0XHdYwIphLcrvPCPXRIT8fLX6/yS83u4tG6H2Ul2cF1fJG+msSqh8
   w==;
X-CSE-ConnectionGUID: jEfLIYhGQTiw063sbx+IaA==
X-CSE-MsgGUID: 9bdaeC9XSvu+80vKTFlp8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86920504"
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="86920504"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:39:51 -0800
X-CSE-ConnectionGUID: PrT34LlPRrqNLcWVJSrl+g==
X-CSE-MsgGUID: juxd/YQXTu+05IwfTj0l0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,212,1763452800"; 
   d="scan'208";a="203052607"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 01:39:50 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 01:39:50 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 9 Jan 2026 01:39:50 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.62) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 9 Jan 2026 01:39:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MWzPgYknqnMhy9xlWUzPOi4h1jG99fcXF2i//DsU12xWgRopvTvaKgSdkjmkle+H26aG5J5iUywfliifipVtTy6xnMCvjvv/DomUde8l6RAoYuOBjPrid7TQ4RmPFnM3Lg0dONkr/m7WZPWg1L+ldwBKmFmJgcP2tGAbNW9FKjthMydYTrkurZlx2w876XJumf49PZ+DAIO1Itpdjrlcpw272uuTy8KT/c63pP62b3reNElwmb0gTzDIjNWDcoqWBmzpEumVEH9zVZjRGJ1qk0O2UQCVMm/BCiKh01r/iw2jSN5Pcz+wIGCCHP9OkxUoFJC95khOu5pa8e8tqkjtxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+K0jBJJ3GZ1TYSK5IokNg+9GLn4JJXQsL3AYTD0i0k=;
 b=wEkiXf8hsJeSL0HrQUBerDNATz0x2oh5R6xMlDRBDVl2hVRzyK77P4BXHA+WQYyBFdmqRtdY6VIZC663Z4YG3ko30TDQE+MMxkTbnWUPJdqekfKXIkQH2z3vwp26mGK+WOtUxRTk4jbGIIJMf6lv7D+MsyQWF0FqSwVY7KF8ffbf+o+DNYHbVN0glM5eyMhLSsWKzQoGgyxdYQ/krQngaSrgK05bH4ZRWXUaoyykKXQxAAK6l9sTD+Ym8oY0gqXd/Yz+U5HRW/VlgCcYsE4XR1VU93pWJPhmBVuUmLVgRGqRs0JzUp15qi6JaOO53KkEqpM3w9duflccw43Luo5xwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH8PR11MB7143.namprd11.prod.outlook.com (2603:10b6:510:22d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Fri, 9 Jan
 2026 09:39:41 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9499.003; Fri, 9 Jan 2026
 09:39:41 +0000
Date: Fri, 9 Jan 2026 17:39:32 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
CC: Philip Li <philip.li@intel.com>, kernel test robot <lkp@intel.com>,
	<oe-kbuild-all@lists.linux.dev>, <oliver.sang@intel.com>
Subject: Re: [ardb:x86-pie-v3 18/19] ld: vmlinux.o: relocation R_X86_64_32S
 against `.rodata.str1.8' can not be used when making a PIE object; recompile
 with -fPIE
Message-ID: <aWDM1OMaaoLKAp9M@xsang-OptiPlex-9020>
References: <202601011320.wfOmjyKl-lkp@intel.com>
 <CAMj1kXH8L19zFLnM26JnBKJ5pbqp0-igOn095NTtW8ji0UAbbQ@mail.gmail.com>
 <CAMj1kXF4kfpvzT+-GzLFBNBb=aTN8Km0tumTm2Kw9zbu4iRuVg@mail.gmail.com>
 <aV+HboykUV1ac4Oo@rli9-mobl>
 <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMj1kXH4NysHuvSyeJtyRENLe-6ua3zij-vMcz0Dyw8o3JVjBw@mail.gmail.com>
X-ClientProxiedBy: KL1PR01CA0080.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::20) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH8PR11MB7143:EE_
X-MS-Office365-Filtering-Correlation-Id: 866d13bf-7a17-49d6-4367-08de4f63036a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ga9Ra+lnStMcH5pr2WUy8fW9GCLzXDWUjRpQ+wjRjXdQ7WGT9yP9INu75jbE?=
 =?us-ascii?Q?c7PbdWnedqfFxIPpZeL+9Dy2GK4NeXIDCBs6JSfLcgxvdBGHAAmZJoWx0RtE?=
 =?us-ascii?Q?adrkDSQRnnpu+qCXZUhz3bSbYpYx9b5B3xL5F3HQmNV9O7Y/1QAVrzmHYjFQ?=
 =?us-ascii?Q?3VJqTEQiahkfeETHTuLOF+EsJWac67YTYHVrxmsdpZxUsHvdmifCfaRZYteL?=
 =?us-ascii?Q?MTD2mgaLzJZw5dEArYWGWaRGHbgB7i9PWW88fhO6vJZzAvfUEWnNb8Qivwgm?=
 =?us-ascii?Q?MgykgDeJg1VR0BfV6Y1eJ7XYNfsli0zjwVW6a3/A7yV8UKGDoG3iFYljYsnY?=
 =?us-ascii?Q?r0+TJQEaJCNtu4oh9ZVXOwMNSq2R2qLgAkMfbsochOSp8QhO8YWjX4GYNdvf?=
 =?us-ascii?Q?gD+ebQG6PKybhc2LpMtj0Gsyg7rJg2zPtX6smTOAoVnEWpUnLCI4DlmHdkqx?=
 =?us-ascii?Q?rKE9qpI+xg1u61wch+Fs8Y98jaKyOL281jTjbi/xFFuzeQhsIpbQ8gT3fAkP?=
 =?us-ascii?Q?xEjEVHd1PYLa3To0kJu/uzuHnXd/dXgHML4pqFnPtk+tMm+7M+DQOlDYFbFC?=
 =?us-ascii?Q?QvlGnFqoaks8wNsdS4vWYn1K54vUSJxDHeo0ptiKY8MCgHL0QjN8sxl24Qnr?=
 =?us-ascii?Q?0UNv9JXVxhxCFCpS6tIbquY2c7jKLylZowq88qgtKFYBs8NS6A/YLlb2YDj1?=
 =?us-ascii?Q?3V6kXiGSmadqRO6pVRRV1pSA7LA5COKoPyXGzvUZ+AzgNJAvRMr1sgkuKYbt?=
 =?us-ascii?Q?3kOCIW4Yp9lmEE87j2meCndthpUKNoLuOSlWYsGRXLPelZNABHeTJaX7dy8a?=
 =?us-ascii?Q?sQx1aw0JbOoaHr3iVGUED6e79myK91Hot7OyCt+wHRPKx5NXSPngK6dmVTrn?=
 =?us-ascii?Q?+pzhis9RSd44W5Nb7+h3m8zbY0E7lHw+EMgiD/pnYQ/RA2w4QRUZQKi2rHSk?=
 =?us-ascii?Q?SddEflYfhvyfmjpKr3ROG+BR3Yrjb+BSc0mthZk9LhV9NvQZZ7FR8mrkFtOX?=
 =?us-ascii?Q?V7dgoIisDkelzMfdUKVuCcy9OcEhHvfwDiiHLHvyxHQXvpGDxOMbSSc9aIX0?=
 =?us-ascii?Q?3qpHqgcvdpQ7JNDREcJnqdp2r5WrhtiGJklSlkUMcXyBBltk78VitXBeAjke?=
 =?us-ascii?Q?3Fh0fqvhL61/SuPvRWN8cwnfTd0Ir373jWoUwTp8B+mhetu6UGGp50NF43cO?=
 =?us-ascii?Q?xbs6igdEZ0PmBtAcWNXZDNRVIEGweTsNueubSzFLEGVZqftxbJcDljlyXndD?=
 =?us-ascii?Q?Sv1y0Vdv1TiH8xkSdVfbdpzM3HLTSDfQsKj9WsvSt6yaeWbUCyD+H89VzyGQ?=
 =?us-ascii?Q?APH17IAnDNP6JrousWnwtV/5PQ5PgVDbNncQsDBuqBh+XIhc37b1rhi9EwcG?=
 =?us-ascii?Q?zaf9NLOwU1H/nXN3/8iK2GsDRtp79XqcXeFFy0EcOV10M3n/0RzmU3W9jVxj?=
 =?us-ascii?Q?6x1BU9MaPzqao3t9DGxaMfxz9zt6cXcWjLyI2av+ssmOX8UIuk5How=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YaqrhsjUunh+Cot5rQlXHK9BByWC5MTuZ9NoK/pNnFsulue5VEOOTRLzqsi0?=
 =?us-ascii?Q?XpJXI8LkXuzvEfUi/mkFL2qaWPOMEJ8Pzl3159S3FGLpkLr2xyYM5pa2e+9e?=
 =?us-ascii?Q?bpXpB+YJq/GWhPn+t4rgbgD7UoskrfCe/cVOrZNQFYwBuae163jlDnrhxKXh?=
 =?us-ascii?Q?pysZsokHPw0++L2qS0e7SaBCR21z0jb32qOYbEN6x9hUGL+qHXoPPMGAjP9E?=
 =?us-ascii?Q?MC6tRf+Uh0AOlPBg7JDGbWr2omdqzfSOdYfBjoZ99pOyDm+JB/r9uRhOi3kf?=
 =?us-ascii?Q?J0nxl82L7ZwG4bEUZd2I/i60hOindjvfSoPuC0kEdfVlLNyBRSG+R5AM4LN9?=
 =?us-ascii?Q?rIjbtdRO1RxvfyYLGeyV6sm79XqzZm9+7wJet2s6F1haU1XhMZ9DrIxyx1bp?=
 =?us-ascii?Q?KFHanZblacbjm4RQrZRdVzIaIIHSc+s8gW9dcTfk2pkX7tsXJ9c8H9MpQ/IK?=
 =?us-ascii?Q?5iv7trpH4L4XBYwBFAgDxbhjj1SPmEKkK9dHWeDnvwWrAro8r8Es1IcdDT7F?=
 =?us-ascii?Q?JiSwbh3rttN8/E9QqnVbgq9k6tu2Jz3GH8abV95/ZTw9QXP4MTh4zgk3Gyxi?=
 =?us-ascii?Q?uEDalkJMw2QIU9/icYeN4UYON7Ml5AegYvnX7BZBzHaQsciYnlrSSG76idcA?=
 =?us-ascii?Q?FHC2wSqdrFPpLqaEWPRqhuQfoQQYF2i0RT1T4lodoysEFPPjyZWdzfYewiFS?=
 =?us-ascii?Q?kGyLGThNVJ9/CUt4muKITt032SC2wLLGrjlwTr5pk6DNw3ber+DK6sq+Th7f?=
 =?us-ascii?Q?jWoX9Y9mgKaAYdYYq7XT4dS1qYoeEf323WPZK/HAe59LvIXHkVxI5rrn+hXV?=
 =?us-ascii?Q?EOqxHw6Y0jydx9qAODuDlHQkGVNhbw7v+tn31beh1SSxbS6Cl4jgS5tmApsh?=
 =?us-ascii?Q?2NTPDq3Wt8HiGMadmF3y9lLmuel0LFfJ9Qz/iGAtfjoWgKBtuTw2z1GDf7Ou?=
 =?us-ascii?Q?7JQkUqNt2bx6h3wfzKhGFND1V0JThD43uvzKVdSWRgUzuiOl4qJd0rpC/MF2?=
 =?us-ascii?Q?BSt1XVljq3eqFM6uSFHgehaYc9PgrX1mcCugXt8VUMPYwFoqW1PcNJ37y4oZ?=
 =?us-ascii?Q?lgc4FFQ/no8zhNa11iWJ+zYG3OK03BsuCvYo6tFYvLY8sP4Gi26uyzmGjTV0?=
 =?us-ascii?Q?CHKOa7emJ0887/kQhdYNfQLDFIgt16JwWhvuoa21FQKj9PTkWhLmDinjOO8r?=
 =?us-ascii?Q?m+quruyhvdMqsGk6ezhyggGn+NpuqsZpHpUTjyASK7nUFSBDz6TV2ARzR783?=
 =?us-ascii?Q?Lnma7wtKaqZ8fMuo3kFUBCYKumlh3NGs9WU6KK79O1dgtYJXFAMXkhzJx5e3?=
 =?us-ascii?Q?4/A9GZMCv1sx2sBwL5TXnm/of44cC94CHgEY2b1GnlNY4JJKQaJ96u9L+ic6?=
 =?us-ascii?Q?HCz3BB1IgK9YMyizXoWFmq0fHgu0a7yLPm1l0tCQtNKBNgoXxmayjjf7xoH+?=
 =?us-ascii?Q?hQ03/dbygiiY4e8B1Pf6DlgIrwLU6XVJPi5VF7S1saum4fDkwoxpNLiHscxw?=
 =?us-ascii?Q?w2C/sfvadXQ6xVBVrGXNTtWG4JRzYEuiFjupT0cCi2mDvxgm0fJLOg8oWRos?=
 =?us-ascii?Q?zTF2F4tk0PTQTwHgAprWo50wGfxl5dVU4e3enuUYNzXHqIUzS3YIYbXGsBL3?=
 =?us-ascii?Q?RQVukrQQy7PjsSzc14MXLfJvUzceM+WNG+xBjWnx/VAvan9SzbG+ahBWCMQJ?=
 =?us-ascii?Q?rtwElN0/1ktcf8ssZ2a9SHN1x2mnW8O6v4vnSFGpmz9/8InkjFzNK4mb6o2j?=
 =?us-ascii?Q?oXzKKiS3lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 866d13bf-7a17-49d6-4367-08de4f63036a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 09:39:41.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E7mejnIb+Cam4pLOr07P7X2qcGbpqceGIgS35zSQ9dKf+32OkGYd+IhRmyOArzhiBk6rJ4UVYen8CEEPF4DLhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7143
X-OriginatorOrg: intel.com

hi, Ard Biesheuvel,

On Thu, Jan 08, 2026 at 11:33:54AM +0100, Ard Biesheuvel wrote:
> On Thu, 8 Jan 2026 at 11:31, Philip Li <philip.li@intel.com> wrote:
> >
> > On Thu, Jan 08, 2026 at 11:25:42AM +0100, Ard Biesheuvel wrote:
> > > On Thu, 1 Jan 2026 at 17:03, Ard Biesheuvel <ardb@kernel.org> wrote:
> > > >
> > > > This does not reproduce. Where are the build artifacts?
> > > >
> > >
> > > I kindly ask again: where can I see the build artifacts that produced
> > > this error?
> >
> > Sorry for not responding in time, we just start the investigation. So far,
> > it found the internal build has set below extra flags for x86_64, which probably
> > leads to this issue.
> >
> >         KBUILD_CFLAGS_KERNEL=" -falign-functions=64"  KBUILD_CFLAGS_MODULE=" -DMODULE -falign-functions=64"
> >
> 
> Why would you pass additional C flags and not mention this in the reports?
> 
> 
> > But we haven't got further root cause.
> >
> 
> Thanks, standing by for further updates.
> 

by further check, the issue is reproduced with
KBUILD_CFLAGS_KERNEL=" -falign-functions=64"

sorry that the reproducer in [1] is not correct. need append the flag.

so below can be used to reproduce with gcc-14:

mkdir build_dir && cp config build_dir/.config
make KBUILD_CFLAGS_KERNEL=" -falign-functions=64" W=1 O=build_dir ARCH=x86_64 olddefconfig
make KBUILD_CFLAGS_KERNEL=" -falign-functions=64" W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

but we don't have good idea about the compatibility of this flag with your
change?

+ldflags-$(CONFIG_RANDOMIZE_BASE)       := --pie -z notext $(ldflags-pie-y)

not sure if you still need vmlinux.o from us which is 300+ M. if so, I will
upload it. thanks


[1] https://download.01.org/0day-ci/archive/20260101/202601011320.wfOmjyKl-lkp@intel.com/reproduce
