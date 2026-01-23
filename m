Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427C51A7264
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769131070; cv=fail; b=sVdq86JKjkrg3cFGx3vvFjMmOQYhmzlMOJotNnvGbiRxc1yu8lU2BYJLfCvUvsMqu9RTWT+h2DTTIQguqHChFJKbXwNJOf4jQ+H7OEqXVr9YFPoqoJ1GfjDvBTRM7Yc5LoA+NTC8Gqw+NY7dT/rmAHX92lDmlhn9hw02Sf8vDvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769131070; c=relaxed/simple;
	bh=FAVoYfNcJcbswE6uADVxkQoicCsgBn8VXtG6zpQh/1g=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iQ5mB9pdnVjzl7p2+/o52oi5xaAz3a06qIOVKOtdy7VN4zHNjT2GS2uRJ4UD+N0DjPBr0j5sYDz7p4jlxdVli/AgKj1y+hn88lYXvlbmINnqwIil+ld6YUW9HcMD+lG98rpXxTZnZsuWbjuV226xhY+XfeqkIaplV6WqDsjA31c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RoclwI80; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RoclwI80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769131065; x=1800667065;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=FAVoYfNcJcbswE6uADVxkQoicCsgBn8VXtG6zpQh/1g=;
  b=RoclwI80C2C1pX3BxeOp29WOYBBvCBOn2WTfJ8K4m6+Lcu8aLmHWj/J8
   bsMPSr9t9sJt8teKmWqu6iwFk9r7uKXHT08j1zQ4LWMC7DPnVCg5RabWi
   UpZOxzGuoIArPYlWDFh2tuQCo/oym6Ht7xdWmRJXIfsjkyTeqcxdL1P8P
   FA4krcJ6lQUTHA07pPCd5XYreq2CUK2WjazxzTdxnxy0rOteWkqrYYnBP
   8f3DB4HjfincY75LKJhaNZyyXmX7bfuUxOZXjKfrgYzx5TMg1Hhzu2NkG
   DrkJlJDpVPpce7v3VQkC92VOW50GYKDhaHHK1ZHtSrFcHLDxjoABzDaxp
   g==;
X-CSE-ConnectionGUID: uP9GQk4WQoqbE1ruY/ZheA==
X-CSE-MsgGUID: bGFqbYhxRgeDbLc4NRsD5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81101173"
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="81101173"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 17:17:42 -0800
X-CSE-ConnectionGUID: UV08i7/2Qc6TjTtGf+7HTA==
X-CSE-MsgGUID: Az5rZkAzQKGnRiilT2E7Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,247,1763452800"; 
   d="scan'208";a="211013600"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 17:17:42 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 17:17:41 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 22 Jan 2026 17:17:41 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.22) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 22 Jan 2026 17:17:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MnMsQSU0sRtNqlLeqb1Php6e6QwhWzKKBMCCCojaJxY0lZqq2ExR6CPl/eDS297zkWULERQ3gOwh3gDD/EE84oE4km/9PwkkoLLXHzbjl0ToXnuDEc0XMJ5qGWvehgibhGXW0KoJty7tSRRooKPHPesg0CCsR99dtGo/bph6rcgqf1Dr0LB9Gz+4/BUZ10H4d8prxLIq1Fl3tZL99RBk8+u8mKVIwzFVFTBD5ZSplxXRcR5Hw+wYsTS43NTJqeRw3tgGlcOz4K8JzjotofFOANw5ZBdJoGqyIqOs5iIBtciCGECcKi+NOp55tKqtrOe8jAOFaq/kWXpWlAB8jZyNAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zdTMwyzN2nm0Li1glYzU2dUni30wjZi+T2Qps5JLy+k=;
 b=fZol4+jSxKpvFRY1ps1G5DvEzwXVtgxiQ1CZWmXyyvvjhUN7hGr9cr1YTMKu/u754SIutChstN/xNwLWfpZ7knPyOGzLPeUmyuaA2trQn0mHsQO9NbvB9VszFSCd7v7/3yAgHaC8scR5yFfhg4TOaVFTcOnH8kvNSp8QeChlR3UNSf2ajILswrAEsVSHAEsDFZN/u5/ftqaqlLiwj7s/x2sn4pEUaoxmmawqdCf4LU2zClozPH3jn74gXl3hB6+x0P45LlR1rBPRFspKHx5rd/GV9kuBVVcQ7rbmp2Z4JBpyMatsX0sRe6mOjpSLX2htpncv2JTz1eNhNqcHMRCn+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by SA2PR11MB5049.namprd11.prod.outlook.com (2603:10b6:806:11b::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Fri, 23 Jan
 2026 01:16:02 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9542.009; Fri, 23 Jan 2026
 01:16:02 +0000
Date: Fri, 23 Jan 2026 09:15:52 +0800
From: Philip Li <philip.li@intel.com>
To: David Laight <david.laight.linux@gmail.com>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>,
	<linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>, Nicolas Pitre
	<npitre@baylibre.com>
Subject: Re: mips64-linux-ld: lib/math/div64.c:undefined reference to
 `__multi3'
Message-ID: <aXLLyFPyc2ljyLzx@rli9-mobl>
References: <202601222217.uzed54La-lkp@intel.com>
 <20260122145752.1e4c4202@pumpkin>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260122145752.1e4c4202@pumpkin>
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To PH7PR11MB8479.namprd11.prod.outlook.com (2603:10b6:510:30c::22)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|SA2PR11MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: a4afe272-8a8e-41c3-3543-08de5a1cf8df
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UZ1aBgPC/9tC02tcdqjO9F3TlFCpRWm0/YLW2fgr2TATzFielKfmYmk/DCbW?=
 =?us-ascii?Q?4GFSxNBRUCWas9Nk13iPswvlYJVd7n35exWisqVUviarcFQni6Bottn7KL3C?=
 =?us-ascii?Q?rCU9rCSyvgV5/kOBeGXAMgExtcvcbL4d4OtQ94g/TOYKax+tbLVfsQVedsjS?=
 =?us-ascii?Q?zG/TaWNeRvzQyd51ilPYYVWnwaUuSyAhMYWbb2fOX0FZSdOZxr4wYmG3PxQF?=
 =?us-ascii?Q?xhe/ZhMg/qk4QSpR1VTIELvPaGqE3tczd+FCtA3AWHzOiccaUheD7Zmst0/c?=
 =?us-ascii?Q?9ptKqC3022evRNnuk3rP6xJ6nmT3v0ZaDa4Bg2cJz6nsQbB+SlzMbSx8Xh55?=
 =?us-ascii?Q?0ZfeelihOu4Add++C5M9rEHn5ehX4j/5A5VZ037s0UZbG19vbopn5Nx/8w2y?=
 =?us-ascii?Q?7weeShFKh+akYh9DuKOSWa3IFlhwO4BCe4GH1WNTQRprB/fp2VlAYDHuHmGp?=
 =?us-ascii?Q?i9TOOCpD5XnhhGmXVlsUWQgrvt1TTEIat8hW3TW5VgXRo+TkqIkWjFO0bzG5?=
 =?us-ascii?Q?GFkLSq4ScRk796P4JVffqRi0pQHh+gmyH3AgbyBKXvp1dg+byykmgZbNLkz/?=
 =?us-ascii?Q?75GKvfE/uy5Mzc35JkvWnYkFyFicYJ2j0k9p9a/SpAZSqojEekG1tIKHZd84?=
 =?us-ascii?Q?V/bG/3RX9nfLh6AMqocQNOQaH3CBoa+ptJPlO5wdCkaQB/glBuuciw41782E?=
 =?us-ascii?Q?vByF1JYE7+CJcuglk5QSQYj2HXgEhlNlACUmf7IeSgG/TceDGsOMeCSaNeAq?=
 =?us-ascii?Q?t99x4w26SF5ZtINw4uWDJrn3fY1IyPkkST0NvepDlAd/56WP+z2/5GASkU3+?=
 =?us-ascii?Q?Vy4y1FNAjiTjV0dY91cjUAeFVCAz9DsFCtMP/oQkuJu57Oq5ZFntz2R8BwmC?=
 =?us-ascii?Q?TFcaWNJk2ZyeGGMei3PZ+hXypzFrAx1s5jwgjZ2+3Xn9fFjyg6P6UGVMceWI?=
 =?us-ascii?Q?9i7gb0VF5XxyDRbzXYmbFfgZeCv4BikwqVY4CUmZaKouFYQUKOz0dUaZoxx5?=
 =?us-ascii?Q?YGKJqKdzHr07MC4a1o86E2q+3Jn3JDDxZULWktjOxVu2XR+XYydlLB2jGbCb?=
 =?us-ascii?Q?VCGAYd+v9tZMbhkPrwNwYpMOjF3Wo3k15K+peI9RibG42xmIXhfZeUT6YrCF?=
 =?us-ascii?Q?LClYRf12l+Re9WB6mKw1hNpJi6IOnQPfBRwydhi6XTK/upRzb2p2NnCEKpHt?=
 =?us-ascii?Q?392PMiI3Fch5kjkgjYdqhfHaowrVz7wWvX9LX4qNlKovpQVg9I+U9COnnjUw?=
 =?us-ascii?Q?JcQ6DlK2vcfrfCNsemR40LFqNu9q8XMg0rguS1qksGxh5Ls8Wyz8RFpqtYht?=
 =?us-ascii?Q?yPE0bWd7Y4wVGhAGh+D3CryQNAp5mIuLzVq04ZGULdB2pfqSdVsV0IrJpUak?=
 =?us-ascii?Q?go3OjoZOCrzIauLPkJY74nM+9NGxkgaztu2SnSv6YCBo05oB4+LqYIf/ul0i?=
 =?us-ascii?Q?caP91M4FGt+5cSLTDb8SbF9zg2td7BbxD3MXrM3xf7XiNmEz7LBSQrRQCuPj?=
 =?us-ascii?Q?YD0kSmChEQrkeuwrOJz2pJ0dQnDCoX0bjCbtI7X4+2FeuCOTK0LKAfVxpLIJ?=
 =?us-ascii?Q?+ZCzy1+5MvA1ZDHBVYBk82F2b0AF1FEb3B7rx6iL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4Eqqn8HI37aIbdA7x3VuK//AYUA6sEUJXbP2xG+JSPK/q5Pr4iv7OlgPfLYA?=
 =?us-ascii?Q?xvtMCkaKGUP3PaWftUP6qqwa72Y0IYSKSUjwFT08GCY27/HmAQ/ehTXdTWeN?=
 =?us-ascii?Q?z5iO0Lf3EUM3znhzJZJKx9QAlXXUny+sDiks7RIFUxXbGqOdudp/1h3+haIG?=
 =?us-ascii?Q?4JJZgnafigUa7vWqkkhaA/0Qquz4KgXFfrJi8xClKlj90sA9QJZKFrCvG7b0?=
 =?us-ascii?Q?3yDpWFMFx90cZ0AV6j0ZC1rLZEKaYItteYppkDyEuOwu22BOv3/SkYT1x3W7?=
 =?us-ascii?Q?fj2y5v4nmUTFBBJoq8SFXjPQbe47KEG8mTPIodJ4pJ4xsCucNc5gtr4YkBHb?=
 =?us-ascii?Q?7FS5GGFssTvmXmoF1ZHHE8Ka6cjLCHxhUb9dce86K416RCw1dUHZP78oxaVL?=
 =?us-ascii?Q?Ss7gkqc0l89SKvDCtsSGg4NdiyjPD/QgNUMqVvCkHBCccifXKLaaUN64eVue?=
 =?us-ascii?Q?cMI6q1UE6djbrblCUTmEqHvbE5JfrIDmSdpaofY1UB8yFT1DBOMcwEcFGIBp?=
 =?us-ascii?Q?+YxWWgdpOzL2C15JE+7xVwiLHLs6ll7DMdXV+x/XbTJVlOsZkbEcrhzBgsz6?=
 =?us-ascii?Q?D1yAvFtli2IIx42a6CkrYreiUTck9eVE7Dxd1d+qKINiB/zjyBQPpJkGeybS?=
 =?us-ascii?Q?BQYOM2M7Bwa68g/xwLRjzmCqemU8Nv9Km70zb3Y6OxagScFMs+UpBFsA+pid?=
 =?us-ascii?Q?KJyg3aRtxGTLWIaom9DIwfoytlNrNqEk8oOduXuHU3bBT5ebk4hURJxdotrf?=
 =?us-ascii?Q?qw8S/xqTTRAMGn7j+9LklDiyU4DsBi7vyqMjzl6+lonGv4T4Gqp9YIk6uXwO?=
 =?us-ascii?Q?wy2RvTa6EMsUdRRe+N/v5pxuGYYM8hkEgbpthOet8mh+u4kyS8dfKPp7Zb5B?=
 =?us-ascii?Q?HvHelFUnbYwWmbasOpQYjIeLUA8DkgcFwHI0jih5M6KILKU9auySbs9xBYez?=
 =?us-ascii?Q?qiRHAX0YPuMWafodXG1OQ86wskgjVWpw1BDAwxj81eXIM+x4I9/40UtvBEDE?=
 =?us-ascii?Q?8OUw823bVaJdZelzbfr0fuADtHcUn4+rCwX8qcCN8kGkw0W3o1jkZ9mqnWLT?=
 =?us-ascii?Q?84hbc5LWyJ9hHCUXlPQNlP4Xi6a6n6eYhTAPlUK/2AzzCqag6OS9jnCNQvZC?=
 =?us-ascii?Q?sZ2IA8TezGEKJXod4m9smqz5pFTTzlmeETeJieuy389gSqFhCEopmXQE0vxf?=
 =?us-ascii?Q?wLEEIZU8XIdX8XqcK4Etgetkfnxu/xgC3rFRKSzbmf+i5zWpv//NSeoG5jXc?=
 =?us-ascii?Q?Y4vSsyAEXjqJkXQ2penUqqLHiGyhTrFOdAlNZauab3W8wdrOehTk3dZ6G1m8?=
 =?us-ascii?Q?CvEAFmfO1FaEHa7DHCaZ76mfIP8ykPSLbxy13gX0Oqf2NDLuVDfhejFFJR+K?=
 =?us-ascii?Q?QJDo6dsG3bwpk8unxCHTnljnFv+Qqkv4u0pPQYHFzZUC8VncW04PHFAtwcGS?=
 =?us-ascii?Q?v2VsVPYYNsuXe+8ktcNR5/cKX3+TQbuBNbngK1V3SAKzduCrX5lai7kD0JHj?=
 =?us-ascii?Q?xwY0MfsxyUSZ4JO3jOQYo1YxXr+TWYkHSJyXwjbKbq2aGMAbYlUYBxu34Trg?=
 =?us-ascii?Q?jrgpKGy9ep1RAuL0d9V5zdt/ld2T2VS8ON2BWYHYYu9vCQHQrDdyhqj+VFPh?=
 =?us-ascii?Q?T+kPHJ7EnD95KCBEoQFEAOMvFjZE1VBMOvSd7veGrjH4F2CPIRS5RZh2HQxQ?=
 =?us-ascii?Q?BCsXJ0u2K84leppG4+tM2fjeyOHy6ty36F6w3M28CJUm7gcRUpYgGxqoLZxl?=
 =?us-ascii?Q?TiGvX7JYFA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4afe272-8a8e-41c3-3543-08de5a1cf8df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8479.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 01:16:02.4359
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AykPV46xlzfeAOT0xvIxSNQLRTpoGKCwpMnPigMzEz413besSIlgbynh6qlvuO8dr8Jih3eexrYdLDoiugBnlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5049
X-OriginatorOrg: intel.com

On Thu, Jan 22, 2026 at 02:57:52PM +0000, David Laight wrote:
> On Thu, 22 Jan 2026 22:43:28 +0800
> kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   a66191c590b3b58eaff05d2277971f854772bd5b
> > commit: d10bb374c41e4c4dced04ae7d2fe2d782a5858a0 lib: mul_u64_u64_div_u64(): optimise the divide code
> > date:   9 weeks ago
> > config: mips-randconfig-r062-20260122 (https://download.01.org/0day-ci/archive/20260122/202601222217.uzed54La-lkp@intel.com/config)
> > compiler: mips64-linux-gcc (GCC) 8.5.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222217.uzed54La-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601222217.uzed54La-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> >    mips64-linux-ld: mips64-linux-ld: lib/math/div64.o: unable to get decompressed section .debug_info
> >    lib/math/div64.o: in function `mul_u64_add_u64_div_u64':
> >    lib/math/div64.c:(.text+0x60): undefined reference to `__multi3'
> > >> mips64-linux-ld: lib/math/div64.c:(.text+0x188): undefined reference to `__multi3'  
> > 
> 
> Known error, duplicate of a different build.
> Really a bug in gcc, fixable by changing the compiler version in a test.

Got it David, we will avoid further reporting on this. Sorry for the false positive.

> 
> 	David
> 
