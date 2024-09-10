Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0950918DF88
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Sep 2024 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725962136; cv=fail; b=LrJhv6TibJarF4D0YvU0aEu9VEWRbcLH4FkL8BG/HWqwlUZcmclJb+GC960rrB4s+NQz+kk5MGQQMNYn3IZjDBtGGCy4C6QBQmNGdDZ3qvZSF8jd6mZj499/1vXdy+lSg3ZUVDbuWGKpLJxVP4XL16X0gJQZvDh645pCPYGqQn8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725962136; c=relaxed/simple;
	bh=tziHkQoLiOWb1aQ0PJ95dNHq7tN3p5s+6iHA+X/wWEw=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JkNzMgOaHMD2uvB0nIWhzNuyTe3P8+0ocFHzk09EL3iPzFEtHrpL6USuLOQ/v1FOfuA5a2aRiONq58m1xzf9AcJBI7Y83p4IMDgU5908lCjTCA6CcqJWAWGQLwv+dustazxWnqmkrOvDdJuWSRolpLJosuAAz22K034VrY4YjVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkA+eC4n; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkA+eC4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725962134; x=1757498134;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tziHkQoLiOWb1aQ0PJ95dNHq7tN3p5s+6iHA+X/wWEw=;
  b=JkA+eC4nUAB83NDp25opCEtzLUBLNnChlR6hef4FbvxDqBWzo4IRbBXK
   sBW5Dc9jkHOiuBlCwy45HntP9OrS7ApSR/s1JwIktv+FhB49VyRE74FL7
   zT7GziA17C0PjV5tIyO3p+zaXEft88eMvN1OS29j/fIoGXHG+nUY4xbKJ
   SKbMk3yycOg5CRhyfbBYKLHhceoQpEHSQKLqWN7cCkQj/2UKNQnWDPtAH
   3txtRuAlgW0m88KSyZJFWsoWbzQ35KjQAcOs1p16Y7oQxNKAEzUQwihal
   2pvu6P5D+LI/+HpN2lO2vKaE3la6iZfrBV/Ntqe0q7y1pZyLw8t+sKkFJ
   A==;
X-CSE-ConnectionGUID: wPqEjhMWQeijLRJ2Fsy1jQ==
X-CSE-MsgGUID: EVCj7sOmS8OTr0IBUi7VMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="42215680"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="42215680"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 02:55:33 -0700
X-CSE-ConnectionGUID: bdc6K7zRRUqJirtY8LTyMQ==
X-CSE-MsgGUID: 4BqPyamRTYCGy8YJ9cwaDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; 
   d="scan'208";a="67025132"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Sep 2024 02:55:33 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Sep 2024 02:55:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Sep 2024 02:55:32 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Sep 2024 02:55:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxt0pJUwDrhu0tGc20pW2XeMOwodMhCAW5DU+vX+KFurii7iso72A9ul2b3vXS8KJc3HM5k6oATxqn/z5XZqQYSeFNzuBxtu54ysr21sd0X5EhbV384Ec0fOT6YDzVMDl+hSlQvcXVhuPSRHjN+CHFaJLIGqSRfPu3Wvzbl7W6ipjMO3kI/hVgI9l8vBNV6B3bVBQtFpnDlpah+tZUSDOaNs+qdB51anYv17GG0OF3FTjXVzcK2vw7lrm375Dve524fFkPmWYWFzuWo9r3tbXMxAD/Y3k4o21wo9AHxu3EP/UNkbOMXpHB3ccudzojGmhiBhCMtbkWFoDC7mwj4Qug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/HFnTXzTuq2IafStPZh3rnEBhNq+016rECcqCS94gRs=;
 b=oZeLXiFVFWpX4XUmNJ4saNliftIbrdUX8C1/i0Q4ScDPvLU3lTuJl3HgyMQ4CetjsgJYTerafP5iHAHtg8ZJeZihcbNDCGIe7baVBeWHZyZPOJr5B/+yZXYU027LIFKZZdf3LGLBGYcXXa1GCH63gwmioy9G5cd85MH5LzkZG3/ielQstm5RsFI5kxKkpaPK9kKGCsPxjIOhkA5Tmzfawp2EM91RpLVBcoi/3c+YprkufqMWBY9F9sPNLxczqCG90l20ayThEAbS2dnIGrJ5mPHyLO2ZhRURoXSgX1PB6fVtnr+RodWuiHSEaLuiUTD5OnHKgCal+SECdwWS++JacA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Tue, 10 Sep
 2024 09:55:30 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7939.022; Tue, 10 Sep 2024
 09:55:30 +0000
Date: Tue, 10 Sep 2024 17:55:20 +0800
From: Philip Li <philip.li@intel.com>
To: Pavel Machek <pavel@denx.de>
CC: kernel test robot <lkp@intel.com>, Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [cip:linux-6.1.y-cip-rebase 190/438]
 drivers/iommu/io-pgtable-arm.c:1185:undefined reference to
 `alloc_io_pgtable_ops'
Message-ID: <ZuAXiIMq1fB7OMO4@rli9-mobl>
References: <202409101626.sNel54m0-lkp@intel.com>
 <ZuAKeKb/23ZqSltA@duo.ucw.cz>
 <ZuATUsFNnWxyZrKM@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZuATUsFNnWxyZrKM@rli9-mobl>
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|IA0PR11MB7211:EE_
X-MS-Office365-Filtering-Correlation-Id: e2b6ae9c-eade-4cab-c82b-08dcd17eb41e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IhOC6H+QEMZUhHY5cOFDSJJjU4SjL/KNU9C+nLi5eX4wjARgjFPyy22yoLwy?=
 =?us-ascii?Q?ukWEhxGEEVQSy3EsvHGD3enQ3/RIgXWEraLSo4KP31Y6W8bw20FjlZPq79ya?=
 =?us-ascii?Q?6FEkw022+T2eLQSBKgUA2Ztb2N/6tbUIrfdJwZ+BNWKLD2Ih8BxHfVJG9FGm?=
 =?us-ascii?Q?fc2EkqPanBEI4E6i74Z7p1o5BkPIKJ8BYgoaGsGrP2ZB+amtGa9Ca+e2Lz5g?=
 =?us-ascii?Q?KaWkUXX3Ut4APOSqz/p9AkODS0YZUGkWSIKSjsRT2CECoJKPiT5GvO+VUZoe?=
 =?us-ascii?Q?dBolSaBzchnZpsE+c7cIeECmBzlnX3TvYGVa78scyjsWKccxeePOJBaPS4xL?=
 =?us-ascii?Q?pOipjbQRtC0NRE3/CWFnTUxGyuaJysjN5GqWdxpnLYMe2nMx792RLNxLzZNB?=
 =?us-ascii?Q?g28OtPuqazB0kmCi+z3EBZGcp9EhpxtA3EkP2GNMaHjsvWqzNDYLHzPIRvNb?=
 =?us-ascii?Q?gokVwd5THYM9qOcW0qHhI8IpCZHl1RbABbgdXhCTDvQ2na1JMcMWz0CE4I2J?=
 =?us-ascii?Q?F+jlkDG5Fv9GqwRPAEKsrjRIEzUIXPSdWF/FGcjo/nFxyWIDfAqDiC32Ak6Z?=
 =?us-ascii?Q?DcCPbTlSZuF9guJkN2Sc/7LbgQK95tAoOF1BG+EmGNWFKlovyB3Bi+luLapo?=
 =?us-ascii?Q?0ELFojV/6aJ71xeEXAaTPe9e9VWqWcf8bpsuWsB52Dq1TekOyZfWyr2ts2iu?=
 =?us-ascii?Q?06pY4PRmnkRBTbKQieDJxKVuXUcNh22q4K+8Ual3Pkc+UEfJf7C27e2VQnd8?=
 =?us-ascii?Q?m7F+FCcTNG5i5oB577SyVoc7TJ1FtoIezaAzPKVZE0/QzOjNxKhVcoxfkDas?=
 =?us-ascii?Q?fJJopyHPTFxwto8EYS3uLlXpUaD4rvM6v4liq+K8CQD7abjEX6eWFr59PyUQ?=
 =?us-ascii?Q?of39N3AvEhgwOkLYz8MaD+aOZWgnH8fnOs5N9xy5kz0lARf2wJwa8W8avT0A?=
 =?us-ascii?Q?5uz89+zOI2Ghy7CD1r24UcJlqYyjS3lVdSblpM2B0RL6klIaGfibCAWBLsVj?=
 =?us-ascii?Q?sypoP6Bd9lLrNVJUPlix9HZOvWbqF1DNh/Gzwq286WMSslI/KgyHo68vWRcy?=
 =?us-ascii?Q?1Ch7Lkr6G1XWOH0ZLbnI69eYSP+92kA1uZ5/oWg3NlPYQVTtKxhMw4XlEYjn?=
 =?us-ascii?Q?v7uQ83C2El9NkV7bG9adfEdTeDhQiQqaU1Eipwg+Hz4Y0k/AtHFPyGkR5QEO?=
 =?us-ascii?Q?JPTHb5k4izCvh0Vpq70aP5gF4BxwGS7Qx0/wNTdbIjGpPjXoaYuvysr/wbLT?=
 =?us-ascii?Q?LGQtIFVkzlFBhQJlHt8JO9ESNVxA0jrksXGAawI7j9wvVIS4KTDS1li1dzzL?=
 =?us-ascii?Q?49WHOQLzE+q1Z7eL07zhfhoUodp347ukLpdsPLjz4pMFejBXw75AxipFqabb?=
 =?us-ascii?Q?oZi260Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A1gLPNnmdoulSLdrwphBXz2JFMJP7IAvuOe5IQjz5yNXlVGmLa3ZGZgtxjbF?=
 =?us-ascii?Q?PAFJntVqaKHzOl9JqnPcqrZWKBPsE1RA/UKO+Ro1lyXso4DYU6vRDxJlDtLa?=
 =?us-ascii?Q?+cSr3FBtwdjGcWYN91V4GW/TM+RddGaaY9JKPZErP6j2IwhK8a0wEcYRR32e?=
 =?us-ascii?Q?g9OLxbutR523B/U+FXsbLGzIcdUmIaFWXPsG0ESs483Jw+1w0KANYMBg7fvn?=
 =?us-ascii?Q?4hxrMQezHxFmmNHH5Y8jT/CPC8OZD9AXEH6usgzjv+Wv3Otvt5EnROlhgE/y?=
 =?us-ascii?Q?lUv8lwve9d53u2PS935+9u/s8uawsNxVwEHAD8lALOI8hVmU867qcmOWkRET?=
 =?us-ascii?Q?dBk4rraKY+LhNhQh9yXMja3yP2u4GJdv/enhkbRSoqARXq+oFWYVe6I4lxog?=
 =?us-ascii?Q?x9jvt79Teil9vGNU6Kd0TEZnXLcRzvxljym6ijpbt+L/LEYdsZrEaamDNaLh?=
 =?us-ascii?Q?2GdMwWquC10+4cU7DAOO3HYS4PnFHTh12anSOclZLs/cc6tfcXsd5CM1jY0d?=
 =?us-ascii?Q?TyGhtVc3rVtlPVc/JgRGcdIM6WK6iy4JXuugZyDHTzcpPIaorIOAynzJrJyy?=
 =?us-ascii?Q?pvImAGNjnRYWz/wNC2nNhDA/YQDE8EqM4F3D6Zi8xc09Hegdxq4fuae7YDmu?=
 =?us-ascii?Q?UF6El8u/p6e64VRUCUW1Atu0Cdnf8PYBtFWBclZnWXX/qCxHzNrixk+xHP7Y?=
 =?us-ascii?Q?lpffSlVfAkofGO0S0A/UWSMvKYMXyqeWa/mfdVPLr0l5V13YLFB48UO63YLt?=
 =?us-ascii?Q?atEAg6c8loplibTIgj1XyUVEP+Ni07jA/xJe3vyRpOYnZqkePYnPzG9CmC+9?=
 =?us-ascii?Q?7KdVx5ad0VORzMVDGaNI2S8hWgy+OU33ckvDJQMB0f3Xl9Aj7sfbxQcFBZnL?=
 =?us-ascii?Q?md7M/1DCdWtE5kHsaXduMKW4oXT9ZKk1tp1tUbpw1Fa9zfmHioFfqUn/CLHb?=
 =?us-ascii?Q?eMvJUBgQgiEcSbZv/xoOoD5M0lmCpKTBufrqNmVkYVyJ3GpMmf1k/eq0wZ5h?=
 =?us-ascii?Q?wWCTsj75lSatphwu8I7ydZ+JFnAs8KsR3EBeBF214yFO2qbAOP+/C8U/7T2M?=
 =?us-ascii?Q?O7qAA7CYwPHuaqV5WSokjkIkBQuUQNcyeJiEyBL87R/uFUhwQW5Sb1o+O+Jm?=
 =?us-ascii?Q?TL0Nf9Vk5fISHf8dMIIoeLz8K2duRqucO/NH5aVD8BDeCwa+6EeGkDT20QlW?=
 =?us-ascii?Q?Uaohz8W3yRkqHibTiwuGLSMr061/VjBQedAmfBDhtBXUM2q29a9jLs9ZaCIc?=
 =?us-ascii?Q?x0b4KxXTGHHqdCKI+K6sUDKeb3xWVQta/cs2N0x9AFfpfFyn6/TW7bq8vI7o?=
 =?us-ascii?Q?Phqoi8ZtHptPrwJZ686N25wLUfB81C/9mbYaFVm6BM7Csmug2/FXCmo2L84c?=
 =?us-ascii?Q?Tkep5nnWI6z7VTyNN1071gZabSjNnMXRYH/g43LnR7LU5l4abaIiZmOXm2JQ?=
 =?us-ascii?Q?H3M/gF3aFWD7HWZOj+4OzTTHEKFXi9ZFnDGSCeik9WwxUQPM0vDo50DZu2EH?=
 =?us-ascii?Q?6w1PFyg6+CKmDDLNDlXYjdxvTH3987Vb08pVAtpr1uh7hrtcnV3GPJ7lNzoX?=
 =?us-ascii?Q?gl8+jT6YlyAhLp2fuDHBqjpzx9F/xabBioscwPlh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b6ae9c-eade-4cab-c82b-08dcd17eb41e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 09:55:30.1442
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGX32d3CQ17DM/q2ql/HJcJl4dJ07qGh5H1XHpfkNIq1nB7eg913y0DSdgi6EiBEd7v6OMpCXub7d8xGw64XnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
X-OriginatorOrg: intel.com

On Tue, Sep 10, 2024 at 05:37:22PM +0800, Philip Li wrote:
> On Tue, Sep 10, 2024 at 10:59:36AM +0200, Pavel Machek wrote:
> > Hi!
> > 
> > Who is responsible for this bot, and how do I unsubscribe?
> 
> Sorry for the unwanted reports to bother you. Do you mean to ignore the test on this cip repo?

FYI: for now, the bot is configured to avoid sending mail to you. If there's info
who is the appropriate receiver of issues on cip repo, it could help the bot to become
more helpful.

Thanks

> 
> > 
> > 								Pavel
> > 
> > On Tue 2024-09-10 16:08:15, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-6.1.y-cip-rebase
> > > head:   fb1857d56e47961f0e5a291c3385b88f610320e3
> > > commit: 16cf7a685142727e637f16ed7d9de15b7a32a753 [190/438] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
> > > config: riscv-randconfig-001-20240910 (https://download.01.org/0day-ci/archive/20240910/202409101626.sNel54m0-lkp@intel.com/config)
> > > compiler: riscv64-linux-gcc (GCC) 14.1.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240910/202409101626.sNel54m0-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202409101626.sNel54m0-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > >    riscv64-linux-ld: drivers/iommu/io-pgtable-arm.o: in function `arm_lpae_run_tests':
> > > >> drivers/iommu/io-pgtable-arm.c:1185:(.init.text+0x212): undefined reference to `alloc_io_pgtable_ops'
> > > >> riscv64-linux-ld: drivers/iommu/io-pgtable-arm.c:1257:(.init.text+0x792): undefined reference to `free_io_pgtable_ops'
> > >    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_free_context':
> > > >> drivers/iommu/ipmmu-vmsa.c:361:(.text+0x7ee): undefined reference to `free_io_pgtable_ops'
> > >    riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_init_context':
> > > >> drivers/iommu/ipmmu-vmsa.c:439:(.text+0xc54): undefined reference to `alloc_io_pgtable_ops'
> > > 
> > > Kconfig warnings: (for reference only)
> > >    WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
> > >    Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
> > >    Selected by [y]:
> > >    - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
> > > 
> > > 
> > > vim +1185 drivers/iommu/io-pgtable-arm.c
> > > 
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1169  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1170  static int __init arm_lpae_run_tests(struct io_pgtable_cfg *cfg)
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1171  {
> > > 9062c1d0bedacf Christophe JAILLET 2019-09-09  1172  	static const enum io_pgtable_fmt fmts[] __initconst = {
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1173  		ARM_64_LPAE_S1,
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1174  		ARM_64_LPAE_S2,
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1175  	};
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1176  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1177  	int i, j;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1178  	unsigned long iova;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1179  	size_t size;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1180  	struct io_pgtable_ops *ops;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1181  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1182  	selftest_running = true;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1183  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1184  	for (i = 0; i < ARRAY_SIZE(fmts); ++i) {
> > > fe4b991dcd84e0 Will Deacon        2014-11-17 @1185  		cfg_cookie = cfg;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1186  		ops = alloc_io_pgtable_ops(fmts[i], cfg, cfg);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1187  		if (!ops) {
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1188  			pr_err("selftest: failed to allocate io pgtable ops\n");
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1189  			return -ENOMEM;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1190  		}
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1191  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1192  		/*
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1193  		 * Initial sanity checks.
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1194  		 * Empty page tables shouldn't provide any translations.
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1195  		 */
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1196  		if (ops->iova_to_phys(ops, 42))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1197  			return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1198  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1199  		if (ops->iova_to_phys(ops, SZ_1G + 42))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1200  			return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1201  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1202  		if (ops->iova_to_phys(ops, SZ_2G + 42))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1203  			return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1204  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1205  		/*
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1206  		 * Distinct mappings of different granule sizes.
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1207  		 */
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1208  		iova = 0;
> > > 4ae8a5c528c0b1 Kefeng Wang        2016-09-21  1209  		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1210  			size = 1UL << j;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1211  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1212  			if (ops->map(ops, iova, iova, size, IOMMU_READ |
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1213  							    IOMMU_WRITE |
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1214  							    IOMMU_NOEXEC |
> > > f34ce7a7018c2f Baolin Wang        2020-06-12  1215  							    IOMMU_CACHE, GFP_KERNEL))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1216  				return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1217  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1218  			/* Overlapping mappings */
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1219  			if (!ops->map(ops, iova, iova + size, size,
> > > f34ce7a7018c2f Baolin Wang        2020-06-12  1220  				      IOMMU_READ | IOMMU_NOEXEC, GFP_KERNEL))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1221  				return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1222  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1223  			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1224  				return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1225  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1226  			iova += SZ_1G;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1227  		}
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1228  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1229  		/* Partial unmap */
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1230  		size = 1UL << __ffs(cfg->pgsize_bitmap);
> > > a2d3a382d6c682 Will Deacon        2019-07-02  1231  		if (ops->unmap(ops, SZ_1G + size, size, NULL) != size)
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1232  			return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1233  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1234  		/* Remap of partial unmap */
> > > f34ce7a7018c2f Baolin Wang        2020-06-12  1235  		if (ops->map(ops, SZ_1G + size, size, size, IOMMU_READ, GFP_KERNEL))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1236  			return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1237  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1238  		if (ops->iova_to_phys(ops, SZ_1G + size + 42) != (size + 42))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1239  			return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1240  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1241  		/* Full unmap */
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1242  		iova = 0;
> > > f793b13ef0c9c1 YueHaibing         2018-04-26  1243  		for_each_set_bit(j, &cfg->pgsize_bitmap, BITS_PER_LONG) {
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1244  			size = 1UL << j;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1245  
> > > a2d3a382d6c682 Will Deacon        2019-07-02  1246  			if (ops->unmap(ops, iova, size, NULL) != size)
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1247  				return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1248  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1249  			if (ops->iova_to_phys(ops, iova + 42))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1250  				return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1251  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1252  			/* Remap full block */
> > > f34ce7a7018c2f Baolin Wang        2020-06-12  1253  			if (ops->map(ops, iova, iova, size, IOMMU_WRITE, GFP_KERNEL))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1254  				return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1255  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1256  			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
> > > fe4b991dcd84e0 Will Deacon        2014-11-17 @1257  				return __FAIL(ops, i);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1258  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1259  			iova += SZ_1G;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1260  		}
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1261  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1262  		free_io_pgtable_ops(ops);
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1263  	}
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1264  
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1265  	selftest_running = false;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1266  	return 0;
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1267  }
> > > fe4b991dcd84e0 Will Deacon        2014-11-17  1268  
> > > 
> > > :::::: The code at line 1185 was first introduced by commit
> > > :::::: fe4b991dcd84e0104cf2e29223a819335ed048a7 iommu: add self-consistency tests to ARM LPAE IO page table allocator
> > > 
> > > :::::: TO: Will Deacon <will.deacon@arm.com>
> > > :::::: CC: Will Deacon <will.deacon@arm.com>
> > > 
> > 
> > -- 
> > DENX Software Engineering GmbH,        Managing Director: Erika Unter
> > HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> 
> 
