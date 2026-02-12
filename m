Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91EF1448E0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 06:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770878147; cv=fail; b=JHyKQtw0+yn0EGf/NhmsrEtH3sklGyQ38HWLDwftdIqKAfC4ra6dDn7MEL969v3201/ILMkknlWJNeWSjeU9QzdIt7TXvfRLu/mHgF503RSAexLLHpphOWJFjoRvkc52hQW1kDuV4MIOkT+VWXZ5nFsIZV+izRDsfSVa/OPAFYg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770878147; c=relaxed/simple;
	bh=l0HSVej1Y+0utjzOxDuOa3gZvKDlMynr1HvfCW1lPRw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pMZlpzCEf65W8l5U8Em6j/SgVPLMYjSbt0EsFVLqCoolQpnttCwHnuITiyXacns9ebpGnHH+L2zwMmvuYmLlJAnUZoV74tDesPBV/49E3P8SAb+klC2qb/M6hhZ/6G+bbJhxtcKp96pm7+xeP0gSnJkS6WJ+CIIoCiouOlsaZSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mayu54JV; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mayu54JV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770878146; x=1802414146;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l0HSVej1Y+0utjzOxDuOa3gZvKDlMynr1HvfCW1lPRw=;
  b=Mayu54JVoBDsz8vprLXLYWQEv6hIfKfTXIrTaq1Js9BcYyfN/UzFktwT
   w6ctOeNWOv+AIpQm1H0kb2aOp2wbj3wVDbc1fk1h7dL1OJVHYPloXTUIj
   outbPk+XpZvlmyt6r+2wYPPWawjDR8TVumFvFNCAHGHkY3+chL7IBNojI
   M6NwKnQpMCrCp1lhrW4VxZFgTvgsZQxeqKXy8Air/ldzR1DSV92YqQ+eA
   +IvUUwaGmEStend89hZGrdUvWbqxD86+ARdg2f4b7JKagnKkKLt72xwcS
   8xvWecaRgsVEC+Z3eUMyYS7jOsU1w8xjtTQ4XUlO1qVvWhVBKlSc7hT8+
   A==;
X-CSE-ConnectionGUID: Pk+Esme2T2+EGuxPnyUzjg==
X-CSE-MsgGUID: xkFTs7p1RNCMxPhkSRdShQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72088631"
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="72088631"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 22:35:45 -0800
X-CSE-ConnectionGUID: 5s2Wpw/zS8agEgaOhTwHFQ==
X-CSE-MsgGUID: SanrWnvWSVaqJgRYsSaVzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,286,1763452800"; 
   d="scan'208";a="216981463"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 22:35:45 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 22:35:44 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 11 Feb 2026 22:35:44 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 11 Feb 2026 22:35:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t+0MYqIwc5XKh8d1ewjC7F8MUJpK0/MU5FyizpyEPBumZJPWd09zvQA4fXd3VdMGQU6lFdlDTzitA7s84NeOUKypmib7hNTiA9VqawC7y+VbnDcE59WnbcIMOkA6DKrofDKY9Wi+bTwyvuIS5EGQ1cqzsC1vAmwF+Wql6O+6mY6HDII6DO7He1nSi/GjCZf8EfWKnTjxSo58WwvpfzS8mKFiddm5PKk4iGdEUyKt1rA7LmvqRpQG9pNtqvc6FdTQqQ7iLA9mz0VzoViOg79puppEGEjbvoFofXYxSvA0uTEobKGL3ZABok8BeJCQPuWAF77VtUE9eapu+3TV7bxOgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rrf4vKlaLX/HTAJjJsl5AQ6wICv7BzaFK3dxtcoOuPI=;
 b=ZQvqsPL7znoA4PFrWXvMd/V1iC/NVU8Jx5pxlFYnOo/n6L98j/VciYniFPQIzME4o4lU5IGWPQzSqEhPxwdRa+tyTZmRkmP6xpZ41zqki12tBowBvv0vJ+8cL+ViD8/K74NJoA/y4IcNQVsEJBPpIQ0QS4tiRoi0OIqX4Xi6GrNBy4nXcO3Zk7RDSbR1wKstfwU8rv6r36cuMev+uvh4pkxbQ6d7X51LeNmwuH3ly6/Hr7kMSW2gr8TEXCXm012aQscRSBEnid9S6S5kNNJyDwGXF/Qt8R9cLnIyxbp53pqEbekUiThdYdmMPefMwcp12oxt+kptm57uxeZsKSWrxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by LV8PR11MB8487.namprd11.prod.outlook.com (2603:10b6:408:1ed::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 06:35:41 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9611.008; Thu, 12 Feb 2026
 06:35:41 +0000
Date: Thu, 12 Feb 2026 14:35:33 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [peterz-queue:sched/flat 7/11] kernel/sched/fair.c:231:13: warning:
 '__update_inv_weight' defined but not used
Message-ID: <aY10tXNAPn6T26xF@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0167.apcprd04.prod.outlook.com (2603:1096:4::29)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|LV8PR11MB8487:EE_
X-MS-Office365-Filtering-Correlation-Id: bc93d7f4-598b-4070-4a67-08de6a00f111
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|3613699012;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dYyfkS8IBAkPH5hcqdAuqESDlSGJfxXhNHBkrmbD6H3LwG/eDZLCczfJ0sXa?=
 =?us-ascii?Q?fUamU42VRRZvoxZUasll6ad1fsbpfLbl+s6qAqkur+Gdp+VGAQ8CWnVLCdn6?=
 =?us-ascii?Q?t+pizcRzzwRxPswKsVk+xleGqcZ7/UuvvmofGRCcU61YX4NhvFGXs3K3ayZt?=
 =?us-ascii?Q?aYu4DH5wKq33hJyJd7zLQw9MBXegrOPoM9R3oZS6rJGpYEV2qDcJs5J3JEgC?=
 =?us-ascii?Q?5hJOlK8iuYWm3HBwsTRGsj/HKMOZOka6b41whoObohrOgtkiJKcnPgzn8r5l?=
 =?us-ascii?Q?LOlpVZ7Td6tEzMTlcRN1Q8yISqODDKLKnRD9qU9vt3Bf5xzGWH3OflnF/tdP?=
 =?us-ascii?Q?Dvo6qSJIDuSTuIuKVUeuWIu3AhfXH8q5np9nEtolS5ESwxAyPuyd0qWRjIAN?=
 =?us-ascii?Q?/jpvgUoGXnmdyTfq6bpIkMrqYyWilJf2nb2f4ePHKfVUsByT+TpqRglsqgNW?=
 =?us-ascii?Q?IPXgecJHSA8O/UVMTpI4UQl1rlkmcuiTy/aaZwfUvI6M1NXWplR/sSVvZHRJ?=
 =?us-ascii?Q?K/5Gr3YFrn+04+zWJb9xlL48ZjDB3/jWLhYRqNuOcU4tt03K7EDiTr95P6OQ?=
 =?us-ascii?Q?CzH/7SZoUA3aWDSGVOOk0k0/w6d9Twr+lhwnQVtz2hwr51XJGUi6QxgyZvq3?=
 =?us-ascii?Q?rljFzGI+bRSIKCBh2GP6L/QPq1cN0EFhHmpKCDLGIGWpebAOgOFpqswkNq9F?=
 =?us-ascii?Q?6M1gchQu/PPddnXwldK87cDkglMBSmko0pOFpjXXE+uq2B8itdbOH9iYHoU6?=
 =?us-ascii?Q?sMixnvL7MWLzFFhJG4TTIBfWWl/5lp1cMRtvJCakDqn6KQwln2KQ8lVPh+zV?=
 =?us-ascii?Q?Rbr2M+3/cVhP8+kEr4ZndzsYV13LFW8uTy48WCIkAlZciZbBk5QcdEHlrGx4?=
 =?us-ascii?Q?khTIEq2eC3kEW0+7imKHUGaE2HWowYFZVho7v1XO00Ri8xz0JDcDTyskW3KJ?=
 =?us-ascii?Q?5DdjFF9TY2EaW9IDxcZuDgJpkreos8Hq2lDhMOa6lBKTb3sN6ylQa3BSQJiZ?=
 =?us-ascii?Q?q1/MzFRkxHXhLDVv5uIKe6ATXpJH07n30vuWqW/Xq4/qHGAC7fzL5WVAnKaq?=
 =?us-ascii?Q?gX0hWE9fvzMWUV+MinETWBchrmKeD96iKI8ojYCFzBnUzJlYGVl0a2re8Fuj?=
 =?us-ascii?Q?7SsfdFDynFQCO20NbRs3CtFe3i/7+8sir3iN3ENDNnUzRv9K0aGsSumWp9eq?=
 =?us-ascii?Q?fCqf/KC5Ed+y0KIQAo5o1XKoefUeVWZ4GS69hsRhoxFGm+z+qCPQKV4TBOA/?=
 =?us-ascii?Q?55tVi/th0TfJvn4dmWbX6k+FIKALvx9kghAdi1sQsRDAXmHpnmKekzmN98mj?=
 =?us-ascii?Q?5j+VUTJkqad16ll3RMbyYxR5WzVH6246ytUYpQCwiPzbvKx4rdzbvIcJFet7?=
 =?us-ascii?Q?zRwy3wtD4fevIHPrew5NRTGtqOse6JHz0/zH29F5+vIT61V/LnLgmQ+Tvekn?=
 =?us-ascii?Q?83+C1hH/kOF75vum4O3Ob8uMdZfLuSpl+Hnq+xxeT6Gazv2kBLfkZBu8KyTW?=
 =?us-ascii?Q?WZkD2BlPJCE8mhv2S4vSr0iHuo11kOsAic5UmZWhMQMhOYFha5viYWTCTmNk?=
 =?us-ascii?Q?VYl347v2xX4zBk8B+JjaNr0eu+ToPjYsBOvk3Vi1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(3613699012);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PwUD6Ytrzm9v05P1+nsfCkMPwu4jIUwBpP23CmvAfI1Os76g7o1VtFKK4hdJ?=
 =?us-ascii?Q?hd2IvS3TZml7Sm0IYIcO/Zv1ef3kcYOULi0DGbOOXsa0h620OtW85OhxMppX?=
 =?us-ascii?Q?RFIUhaY+7e/Znj6Qs6t01oKbL1fgigK+JBLEvdFe6cJ9w+tWGHrGgamE0qnv?=
 =?us-ascii?Q?YwO5y3nd8ngI8ndZlfxxI5iJVhArfU+qefyhYeZ/VcfCNI8pRONWen9O8JHt?=
 =?us-ascii?Q?zc2WEGjm5Z5kLr9bnUyg/niYMhNEBvXV5fsZvp2OuP16zFQ7JWH4H/AB/lWO?=
 =?us-ascii?Q?Hm40JkqNHvH0uJ4il1GvNrl3QB0pCfwTeLqUR+/sI9vS2hA2hxqlVQ2FrUxw?=
 =?us-ascii?Q?wxxzu3Vik6/MpuGmndZ1WpbkP3vSq5ccvvtq6y5EvKXUcmQeS4iu/eENLgxL?=
 =?us-ascii?Q?M3+0H8rkC1b1SXGpMLHeBPXAUz040F/wCGNjpTqS0k+u+82z9N9mbgq7FLI8?=
 =?us-ascii?Q?WwYkGc7S72kQWnRVgec9nOWnUE7MzkAu5i2+lEERwXzX2nd+4FNypLcQvUBB?=
 =?us-ascii?Q?tegf5+Rf8N51F3QU9WYjtOs4GWV60X8abZ9ufNKxAn+awpTGO+Id01JIk+rt?=
 =?us-ascii?Q?cEckxLAqZJbvU7tkBCI1HvbcO2jmxploiwE8kKXwnZvLPUh7Yme/U2Y0OChp?=
 =?us-ascii?Q?3Y1uQwboBpODWvwQraJQ+N3P6r79e5qACPrdgW06b9ZnU6HxbTogEc6vGoI8?=
 =?us-ascii?Q?2sRD+t0Fl9zxQPWbXZHq1iz7rVj417qsATU70IRvlys32oc/QnwrzqZJFDy6?=
 =?us-ascii?Q?fY+RN8fBoY0b5Mto88uRcmFWgOR4vr1Q1SZVvS04Pie0coTRPvpe60QjzoM6?=
 =?us-ascii?Q?G3fqkx2hJnWuJjdEdVEQrMBjy3JgBBxpmZ5yT0EzzDUarfmO+7NgUOmxJjgr?=
 =?us-ascii?Q?h1HI7cf7CvbZB3gdLAs2ml08y1AQrZ504fo+ZDS28Kg8EYDpFPoXExUkCJGL?=
 =?us-ascii?Q?BpeOzYucN7W9KXfkRdrQMlELWg4Kz3kiPEHAwzuO0lx4K0YunhBvu1mtQZ6/?=
 =?us-ascii?Q?LOkQ9LxBcHjFnyyKIDd/qOfKdxIx3BUqDzJxDGlM7jdrjza9zeZLmzg33psv?=
 =?us-ascii?Q?w/8OmR45m3twwgWOIS974R45gRMFtmSWjFqnSjkSbrqZ/kB3+WVjH+HJKaTZ?=
 =?us-ascii?Q?U3ZVjiE2YuKD0knlZMYybS2UEEdKyAkRg3+gTDUWDxQx/cN1Jjtprga1huaO?=
 =?us-ascii?Q?swQI0kH2ZQGrBfCS5eTy8TQYkRhC687FsRbUs3kTGRkAPq5c0BIer2mGR/nd?=
 =?us-ascii?Q?7LPL+2hgQPGslKWv6IpnDoN2xHpdG+lb3836gxq0UHhvEQfqqItH2tge2FMd?=
 =?us-ascii?Q?O6eCbGF9oamasmRu520gGQHswA/eWIFIPRdgI9M30NobRgxQc4M8BbyEegmW?=
 =?us-ascii?Q?ZSD/39tcBgBJV1MkjJVSsjVU7TLdQoMeOD9YstI2Bl1oV7KfpP4v1HvxaGaP?=
 =?us-ascii?Q?Hz9A/9LY202N8apRIlzqZud7Zmy3IbtAy3cmq1zWFG/q9IKuXBkBRkbOT3cF?=
 =?us-ascii?Q?EdcukVu56N3503Bj4QU36ffnfVaWKWedbb2jz+/PK5vCCeIhaeeAj39EvtYS?=
 =?us-ascii?Q?6AGE3n6dAwGfhyJ767QKnl5DlvivNk/r5z4Q0Csr/VdCh6BHssY94A+QkGqo?=
 =?us-ascii?Q?HtqfTSogadD8JVh4p+mpECKOqqNYMAHw7LsisXMD1WxrPS/q2W29VGBq0oQo?=
 =?us-ascii?Q?LTphS3ryASSdDuCim/pj0IHsMvf/0jF/6I81pzgQMcNht0DCc+Zp/amKDxEK?=
 =?us-ascii?Q?M3l0TFkzYg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc93d7f4-598b-4070-4a67-08de6a00f111
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:35:41.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxtLNn6W3VNyz+MHw6miHmL85BkOVPlCDskv+VLWPa4tOBQf1P9mK9fD2Q1UeYNkOGU29y64WfddrC1w5CTyLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8487
X-OriginatorOrg: intel.com

FYI: this is W=1 warning

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   0900b7ccd9fd82ebb9af824a43994c4d20c7cca8
commit: 5f7dcdadf71c0b5c475bc3ffe4d4f69be7bb87b5 [7/11] sched/fair: Use full weight to __calc_delta()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260211/202602112233.PL8ehyjC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260211/202602112233.PL8ehyjC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602112233.PL8ehyjC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:231:13: warning: '__update_inv_weight' defined but not used [-Wunused-function]
     231 | static void __update_inv_weight(struct load_weight *lw)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/__update_inv_weight +231 kernel/sched/fair.c

029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  230  
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18 @231  static void __update_inv_weight(struct load_weight *lw)
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  232  {
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  233  	unsigned long w;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  234  
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  235  	if (likely(lw->inv_weight))
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  236  		return;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  237  
9dbdb155532395 kernel/sched/fair.c Peter Zijlstra 2013-11-18  238  	w = scale_load_down(lw->weight);
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  239  
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  240  	if (BITS_PER_LONG > 32 && unlikely(w >= WMULT_CONST))
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  241  		lw->inv_weight = 1;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  242  	else if (unlikely(!w))
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  243  		lw->inv_weight = WMULT_CONST;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  244  	else
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  245  		lw->inv_weight = WMULT_CONST / w;
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  246  }
029632fbb7b7c9 kernel/sched_fair.c Peter Zijlstra 2011-10-25  247  

:::::: The code at line 231 was first introduced by commit
:::::: 9dbdb155532395ba000c5d5d187658b0e17e529f sched/fair: Rework sched_fair time accounting

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

