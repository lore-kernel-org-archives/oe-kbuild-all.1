Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF38BE49
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 02:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720664449; cv=fail; b=joJFXr3wqlYJVRuHmJMsBlNZ1K9rQ037ZWWyEAyCCuY2a92A48X/QuVTGyup+AjQr+TNmD7DXwFDiKaIy6XhBl7c5pygWdH9LHlL+72h6Hp5kibxfQS1a7Md8E+gXJJldrCpHKfGSYPdVFIMnCkpKcDaePRE9EGuaAiG9IcSOKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720664449; c=relaxed/simple;
	bh=Q3EYG4HvrpxN13JX2qivzp+YVKt8y1UJaDYoJFSWQDc=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=r7JpjAXMShbhSLUrJOQSoOjAqRpGPyiMWMrkAlYVkwhqfw/KYY3uoWF5QAcoNG2kVNmahNhGjdVJ5KQr7tkW7fDwvli6a8l//3yMFuw1Xz+Dc2G02tf6AaY0+MF/rPc8wJiSrHUwKCw5qZue8ZBtOCOIs8FKPxpPhjdzsNp8akE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TIw9rELX; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TIw9rELX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720664447; x=1752200447;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Q3EYG4HvrpxN13JX2qivzp+YVKt8y1UJaDYoJFSWQDc=;
  b=TIw9rELX6fOA58tWMVdXH8RkwB0n0wf2VGOuD0nKwyxWLsm4l4vvbHoK
   NxIWh/M9mrBIOVUW20aQ6evagA6iuv0G316ax55zsuxnFZaJ6m2UMw04I
   9edqH4ocdIbLw8bEyNroOwN4hy3y8SbE/4kNLO1bWD+wJD/v3TUeVg33M
   51QyhuKImIy9djelxmjDMnZuJLlw4tjS3HqmAUQqY6ED3/Wuq/Tf+WPVU
   cMUwTaVJiRUyXAcXwduV4gs+GJVmhNP5ABThZDWjuIJLwH60Z6YgGUZmV
   e7EblexJ4PGO71XUayL285Ev3bSzTerHNmJUii23CAbCXoSD035/pTSfo
   A==;
X-CSE-ConnectionGUID: 5m2d9tohSsuotsg8YZgylg==
X-CSE-MsgGUID: ZNj+hfyfTXO/RWfzxc4UqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="17893468"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="17893468"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 19:20:46 -0700
X-CSE-ConnectionGUID: V5yocYBeSMuKxOKc4PAI1Q==
X-CSE-MsgGUID: 5gGt4tCfS4OSll96p4HPLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; 
   d="scan'208";a="53589091"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 10 Jul 2024 19:20:47 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 19:20:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 19:20:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 19:20:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 19:20:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byn+frtS5K1saDL4+e7eMV9rOng4anGEGOQQiPzfuol2rzA5w973HN0MwGZ5z2LJt22iTfaAWB27iy8pP3eBE7phOtjYVkio5VNsb7auC9gmxC1W48Xhj0yYjCMZ6+wSlgOs3ilfdjIRAI77cBC++u6T5ar+QATtA44R1glByqe436o6rSIKK9Hvnf9HbDTqwu8ZL9ofCjkfBKrICQ1Lb1nx4JlRwoMAPCYYh9ye+U2n4tS8qT+9Vm1TOhYRBWqb1tFIy1VFiriMsoNVu+IFcjZK3W9d8Taey8NFw3rcx7m7Q5SPN6NBB24q+GxH4FhImCDn142JC/NDTvXBNfz4Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNpVOIrztPiQVfppCRl4zs1qhij09S9nyzxZFDAtuv4=;
 b=Djfl4s3nwpK6nLXMNMmKUD7MehmNHWqmEncvjSRoi59q9R+Y6UlXOGORfPvNANTOuZWvf58KuBfV9BTLzrDPqK6vlk8ftXlFdwSQ+aMWwRb+OaY6GZBnwz4lylqr72NwvBY3RDoVknR1Jaif7FnyRdm3Z6pZOscaDv8kC2/zcoS5X2zq2/YMAcbp/3tTjH0jVB4aX46BeZAiI23qlZwBYl2Q+TEnNYN+oH1zJJnNOgQf7I6UElXERfz0wyUW1F0qN4TRhP/HMvMUsZ9MXsIOGNMVgXt+UK2LvY3UOOLXeeoNT1HpkNLaynjqHbtitCCzU8OddRIHI0xsQi6vYE18vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) by
 DM4PR11MB6118.namprd11.prod.outlook.com (2603:10b6:8:b2::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7741.35; Thu, 11 Jul 2024 02:20:43 +0000
Received: from DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9]) by DS7PR11MB6039.namprd11.prod.outlook.com
 ([fe80::3f0c:a44c:f6a2:d3a9%3]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 02:20:43 +0000
Date: Thu, 11 Jul 2024 10:20:24 +0800
From: Philip Li <philip.li@intel.com>
To: SeongJae Park <sj@kernel.org>
CC: kernel test robot <lkp@intel.com>, <oe-kbuild-all@lists.linux.dev>, "Linux
 Memory Management List" <linux-mm@kvack.org>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: Re: [linux-next:master 7425/10451] WARNING: modpost: vmlinux:
 section mismatch in reference: devlink_port_rel_cleanup_cb+0x16 (section:
 .text) -> .L0  (section: .init.text)
Message-ID: <Zo9BaCRGMigjZwNi@rli9-mobl>
References: <202407091849.4HyNYQIj-lkp@intel.com>
 <20240711001614.100561-1-sj@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240711001614.100561-1-sj@kernel.org>
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To PH7PR11MB6029.namprd11.prod.outlook.com (2603:10b6:510:1d0::7)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB6039:EE_|DM4PR11MB6118:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b59220-3ad0-48df-e5bb-08dca1500fed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DH6pvFmv8DaLbF3eTF6ZNbGEw5LGk4vSo814brE0iQUmCBQqJw6S3/9/uJ6K?=
 =?us-ascii?Q?6LqQK4aG5ZVzVSCegWVrcM72B34UWPN5JNZ4RmOGbkRtyfX4P2K8GpVFOSO7?=
 =?us-ascii?Q?SLY2/mWEmxudIwZgMtB6MHx+uhXFD8skT8yJNx7pxKPPNQD46QPB5+/M0kI/?=
 =?us-ascii?Q?eTTnCz4mjREMPIq77fJ3LkBgUcu4gfhPJTDi+WFXVHaJTUuOjKjjXDKH8cW9?=
 =?us-ascii?Q?5oud8a9EYZrkc2/3x4+8sVOEAb3oOmMEngGvLN0uB8tzjrhZicOJxKaCOCZc?=
 =?us-ascii?Q?N/KKggjzg3s35QMyvcQtGv8cA7PiFeDBI28uSdL6LvDDXtc9dItWJopSisIh?=
 =?us-ascii?Q?nENNS7PORDckY/Fxid/IzmoB7vC2c+Me5Jt2ZojMJ8mLCnTDo4FMHUL7tpTz?=
 =?us-ascii?Q?D2l9oogBoIxrn81yWq1on3KIQN/sPhUunI5A6WUyUSqamEdxh3hod04q64sO?=
 =?us-ascii?Q?l3PwCoCUUFf8lum/139d8TDPIMkhzAwayzFC4FjmT8e1uCbkKlguhjx2Mcdv?=
 =?us-ascii?Q?c8tuvEoY44wlf0MPvpHgYfMURukdWjbolefpoXQPPWwFuMptn/RavwLHeik+?=
 =?us-ascii?Q?zImXtZGXlJFcVF7QnNkipP71BX2FxEC+nH7rcwWOotescMqk2TVZGg7qNDaz?=
 =?us-ascii?Q?cnW7DE2KXGy67H4t2FjacwssHW41CGdOe20fFVHyfyZkBrza5cq1LNWvT6/u?=
 =?us-ascii?Q?HoDDkM8arv7/svhVtJ18V7T2XFVcywPViVxURRMj8ttMTSbt1Ttesn4u1+e7?=
 =?us-ascii?Q?GHAridXILaLnX1OXOLFiBr9j9948q+T9JgIb+LvoxFerk1m9rL/LIu5PBtoX?=
 =?us-ascii?Q?Kmm2iqIXlz1uQFemRYJxUZ4TQV0t6xT6ZLOirwVpRXbxOI1+gQ9iyieKJLyq?=
 =?us-ascii?Q?JREoyhoEugES5iZcFpAAraq8/XFTIB7RG++mA/e0wvnNOviOM5BjnDu5Mq0n?=
 =?us-ascii?Q?OzxjLUIoTLyxj+R+wW3w8Hi1/9IIv1VLIXrahr+dTRqhcT9D6Z/PKukKfXbv?=
 =?us-ascii?Q?waea5uimG1u5bI/nNcEsOcfcVby/jb/bUWFhKoTUT/LruaYLfTQ4gw/vHovd?=
 =?us-ascii?Q?Wji/YE4/EFwXfJ3KLGpJ8fbEIgRdwue8CQPSVheFFX7eQnqIBxRWsITpglaY?=
 =?us-ascii?Q?QBAoQkSrWbTXbilABaoF0q/a9A2HAF8bWVKFR3b2zgD6Rcn5ZB3IJ5NAd6t6?=
 =?us-ascii?Q?xSsNrgvAAwL8wQvguqKfJPDmwGmK4LmxPktDnKrRIN0x4MPJUFIF9beT2zB4?=
 =?us-ascii?Q?62tuafbiUsfL+AlpJNjW4zPxds8STTDyBwBdYyhc/NjACnNjovzsfGZYY/14?=
 =?us-ascii?Q?Jo8YzYWl+OLnKnt/YVo+oIBJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB6039.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+2x+E6cgSPJTYJksrkDehdBQLY7o/pPWhgi4+IlxXA69siNRH47e8Z6s4bpP?=
 =?us-ascii?Q?8jcaL1gNzrQetqNiyrdjLoDQmP311nfUxtUCs9YHyD7Ahp75u3QXXQedDmws?=
 =?us-ascii?Q?mETWzmj56uvin1h5xwOXMviYRW3oTZ7/YgCtsLoZ04cPRi2NFAJ+PS/qwqMX?=
 =?us-ascii?Q?El/y4LR4yfKM23GLkuXNvpqgB86J4dtMLD4FGT48Z0U2XGC8uees0tEOA0Tr?=
 =?us-ascii?Q?/8a2scSLuU5uFQPH2kd5m65TjfiJmOI3FiFSdbXKZonnGJQRO4aBGsq4Ra77?=
 =?us-ascii?Q?1tPTH3IJdUheG95jKV8l3HFddEx3TiEexoCbq3F+rTy9oO+hwFHQ6eh1jj4T?=
 =?us-ascii?Q?OspRbsY8i3o/eE6jd5B7ejloBHT8m11Xz35/+SgKphCTpnuuKc6nYvaTJ4cx?=
 =?us-ascii?Q?SmLGsOokx7Xq16k2Nk6a9/43m/TbGyqp5DGtv9DuQAE8v7zVdM9i31KKXwu+?=
 =?us-ascii?Q?9DTxx+3PYWRKon7Ta90RAh2vEdX7gFnrGfNO6fkCvrD93Zz5BcqzeMZq9oup?=
 =?us-ascii?Q?7NEvsu1IEdBbjYBgxKMiTj1lvKSLwHwn5K+F9gX4N8XJ93vEcEcfkVRTNV3j?=
 =?us-ascii?Q?jgvegOoUsz0kIqsVyo1PNIf8AJetIP37QODzmy841XilACAaDFAq+T5DZNP0?=
 =?us-ascii?Q?Sx8YxeN3jV//ttF/yy8FqSYNEP5MvbsqSIZGAus/MSmXc6/hzwcSTRosUIV+?=
 =?us-ascii?Q?Trq8LNhZPIXuW48WzpWG0GOfK0976knsglQZnQzXkIDgpvwDdle2MKgbjoW0?=
 =?us-ascii?Q?l2cPfO9DOaCnGg6vAJqSm1eZtybeLo3ajLnxCvb3QQ3v0AO6TuLXUN2V5Kuj?=
 =?us-ascii?Q?Zanhuh4ErvHGL00bWSCLW0tiXaaLh7WrrJbpW1X5k9ft2KPJi4alHq9f3XI7?=
 =?us-ascii?Q?Z+TMPQpkAMgBSHBVdsghEwEuqk1iPKUM6zlOqdtACyFatBFtoFKEqrqJFheg?=
 =?us-ascii?Q?I3r9lZwcBG9t7iDBnFydoZw7sjqQcLk0dYSNX6MXL/1FDjszGjj6r7CNB63B?=
 =?us-ascii?Q?6GLboZk6EzNkzchzvBnknawIx3Jh8xdfb8GKKTEZ/uqMGebdWREV2AYRegLO?=
 =?us-ascii?Q?O+zA0JKnrELKROL9QkGSRFueePOso7MLsAtcMjE0k5pPJtHwCbGhijBXCLwN?=
 =?us-ascii?Q?0m4oJbrNLsnrgFZLMEd/H0KuD9x8Rt4KF/ywFgthKV+2VzHFduDvf/fWkiSJ?=
 =?us-ascii?Q?yLjy+mTLIKD5xIR9OoNyUBw/OeF5MEHzELln+EfUQV0uMBOy1sOo23gfM1VZ?=
 =?us-ascii?Q?llJDHMfDemy1zci8nY4Epm6y3z3CgaNBxwNScaiVpKMrseBBd6PhGirTEsiQ?=
 =?us-ascii?Q?nUAUEfVs6v28/A54aoxW8vtv67BGR6dxYVvhVc5yav9u/r2jD47uYuKTo577?=
 =?us-ascii?Q?VgUDXb/Zh1VTiGs8nDdLsw7iF1pQpt30/pyXy1Q14yJvKeBnqJakVskikq2i?=
 =?us-ascii?Q?Rc2jaxL94MFD/cpW8/VEq1vItg4XY3KQzmAmKmvm5uoOR3xhbE0yk448oVBb?=
 =?us-ascii?Q?n4TOZeFM8M+gc4r4HgQdFos7y1eqioWM5GKor+ZUNMVst/ETYvOvQTw94TWm?=
 =?us-ascii?Q?I3M10I7i0UbcLGPGfPIADZOxF4ARSonlTkzu816g?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b59220-3ad0-48df-e5bb-08dca1500fed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6029.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2024 02:20:43.5250
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9UtPK+1eRsa1Bh7CGzhqTNhw4n0Wi37EH1qfHMqJkUUcT4qE2VRWU/WhQ0pmvDT3LiXVR9vPy3ukzP75gLExrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6118
X-OriginatorOrg: intel.com

On Wed, Jul 10, 2024 at 05:16:14PM -0700, SeongJae Park wrote:
> On Tue, 9 Jul 2024 19:07:55 +0800 kernel test robot <lkp@intel.com> wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > head:   0b58e108042b0ed28a71cd7edf5175999955b233
> > commit: e576342789f1e76ada9fed44f891f5fce83579e9 [7425/10451] mm/damon/core: implement DAMON context commit function
> > config: riscv-randconfig-r033-20230517 (https://download.01.org/0day-ci/archive/20240709/202407091849.4HyNYQIj-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091849.4HyNYQIj-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407091849.4HyNYQIj-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>, old ones prefixed by <<):
> > 
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_rel_cleanup_cb+0x16 (section: .text) -> .L0  (section: .init.text)
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_attrs_put+0x18 (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fn_caps_fill+0x2e (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_linecard_set+0xc (section: .text) -> .L0  (section: .init.text)
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_function_validate+0x26 (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devl_port_fn_devlink_set+0x2c (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: __devlink_port_phys_port_name_get+0x1e (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_init+0xe (section: .text) -> .L0  (section: .init.text)
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_fini+0xa (section: .text) -> .L0  (section: .init.text)
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_set+0xc (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_pci_pf_set+0xc (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_pci_vf_set+0x10 (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_attrs_pci_sf_set+0xc (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_port_function_set+0x3a (section: .text) -> .L0  (section: .init.text)
> [...]
> > >> WARNING: modpost: vmlinux: section mismatch in reference: devlink_nl_port_split_doit+0x4c (section: .text) -> .L0  (section: .init.text)
> 
> Similar to my reply[1] to another similar report, It doesn't look like the
> commit is somewhat to be changed for these new warnings.
> 
> Please let me know if I'm missing something.
> 
> [1] https://lore.kernel.org/20240711001043.100459-1-sj@kernel.org

Sorry for the false positive, this is a wrong report which seems to only occur on
riscv arch. The bot will be fixed to avoid sending this kind of issues.

> 
> 
> Thanks,
> SJ
> 
