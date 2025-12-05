Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B681C8611
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 03:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764905685; cv=fail; b=tryEdfr8tj9AMPBnEujE5eikxq7OJaBWLmcOqC6A5SuaywF/kDsy8b43bIE2VD1BGfzjkgkNJTJCUXWgfZIx47aYmQkMutYBAtoE33xT8WRXQYJwp4jIxIODAGDe75p2bT+qwwpyxUiEz6rvka6te+d0nblB5jZu/H0SUQYn1Hk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764905685; c=relaxed/simple;
	bh=qqNbyeZEmcQRd8iEbsnJQalMyViStPPRKrKPIfT/FQQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ietWFm9gB9kKttCa+Q52YRkUIuHI8DDBbZYBTBqe7ls5EfKvd4ojuYzY2p5DnWfplymdCrVXMk9fOrRsLk/7YG6aw9mHpS8tPlTJ3f8eas+8TjhRSUQzbFqQxX0Tjkkgqxope9SgfrMjumufLMX17E5xsRFRXlm6O7/juh6G1/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TqpDrWD9; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TqpDrWD9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764905683; x=1796441683;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=qqNbyeZEmcQRd8iEbsnJQalMyViStPPRKrKPIfT/FQQ=;
  b=TqpDrWD9hZSI4K06Zy8Hu/j3NEFZdrODlwWXAwv4FgacB4lzopoRkj/W
   oPNw8YWofibD3ujaJPuq/l5YKwtAxZEz/FwdhgsSPTKXayKAkuQCxbJ7B
   JJ7OmVcfIELv1KO/ulMyPiwtR358dI7MCEewVqEskWVP/p5Artkp7Rdmv
   boJMKgbedg/lEyTe2Dr8/StY0i8aXRfl44ELY1GW/HSHrww/js1af1CeX
   U7X+x13p+tmzWrTt3vSEIzu0VebYqCNx1IhxpXVvp6OmKt9QKURNs7xB4
   HcBfYtLBPtmJDE6MGFa0UWGwLFMNr9PImsG7FZ0Nl818dBR5iWmbd+okN
   w==;
X-CSE-ConnectionGUID: Iw0ZkcztR6W7zqp1tgh5cA==
X-CSE-MsgGUID: QCkpgoogTyu2s6DUwb5DAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84544822"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="84544822"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 19:34:40 -0800
X-CSE-ConnectionGUID: iVP5noQyQwWTSa6X4yOxQw==
X-CSE-MsgGUID: B9utnajWRNGJ3sJcESdsmw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 19:34:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 19:34:39 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 19:34:39 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 19:34:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQrB/D7/30LkCosX7AViPwzSF5amv3bp5HPOi6QReodmzcaibj4nwGXYTMF1kOwKZc501EFnLwMM2rCOmMtJKenHMulo1JiRTWpNG3j6ubxUqOeq3ARrv0jmqwq4Ah1/nnZUhfF8R7YlHti6qfTct2VPQjiDRo2rr6UuahI4vNPa7pvuLanPLRXNWw0fllLrUI/l+KgykrCMAblMckHX1ZujcNkVOjnMQwklGyNzhrLVn+bn+YikT8YCVD1lzHrYqh5nALT4Oe2sTKvF6ZAeXbiF7rp6dnWuj1HSw4uIeaei00nqPMzMRUW82SUMdZW+JMfynI6RfIRBiiiFDMJ5lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4mK+hW0x5knfT4giLhGX4hsRwnQzCWkbIlwVNj7DfN0=;
 b=WlKn40p9JJtSDuBd/FJCYFDdxIaQmtNiTMPAG0kWyB6wrN6MHIUHjf6RMJq03XK0ukpDDPVfGvV3vTbzC1uep76eGsgznf0xvBcIAaUU4TM4uTFoYjuwhYFL8/Kn+Se81d85eKJN+/BfaSdn5NObl2JqqxDxPHD9dYRStnHPRdSSHXwcWWRXU5jDcYWMZLe0UDUgAU+PTb/WHBJYRKBeJdHpROv8LMn9WJ4R0Mr1LBxpnY4YCiuyR7e7rBrOhSI7sB9/YhoKq6m0xeS+gEPn+p5+J12nBlyFy/O75iGjxN1XVXBIhIxSYmqN7+MPvpWqhGFMAzmUzzR8b3VLuqD7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by CH3PR11MB8239.namprd11.prod.outlook.com (2603:10b6:610:156::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 03:34:36 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 03:34:36 +0000
Date: Fri, 5 Dec 2025 11:34:28 +0800
From: Oliver Sang <oliver.sang@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: kernel test robot <lkp@intel.com>, Oleg Nesterov <oleg@redhat.com>,
	<oe-kbuild-all@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
	<oliver.sang@intel.com>
Subject: Re: include/linux/seqlock.h:1257:undefined reference to
 `__scoped_seqlock_bug'
Message-ID: <aTJSxJKhgz8KzziB@xsang-OptiPlex-9020>
References: <202512032230.5pqkcg8x-lkp@intel.com>
 <20251204110504.GI2528459@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251204110504.GI2528459@noisy.programming.kicks-ass.net>
X-ClientProxiedBy: TP0P295CA0045.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::16) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|CH3PR11MB8239:EE_
X-MS-Office365-Filtering-Correlation-Id: d442591f-4c4b-410c-5fd4-08de33af36a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ACjcwKdwiPLjCFxcEiy/lVxjse46wttUNAoz+tWO+QN8G3gfKTYHE5zA7K1/?=
 =?us-ascii?Q?I0ni3txsd1jpz48xumQ2Yts1Myt0CTrx63BOY5fWVMCR6hZDsoUW6nnBgg5z?=
 =?us-ascii?Q?xnBf9JWXM8IiHX/9+lFRyNfZ/qSXI1Mj3NWwway4gjR6UAUCAqTwX/GDYGe2?=
 =?us-ascii?Q?r+VN0r5anEs75Wn6O2iwJvU8Hcm2eEHK5XVJ1vvqn+DK0AhC3uY+ePNfzbFo?=
 =?us-ascii?Q?dRhZMikK1iTnvEczPM4nYRPWn7M1Zoyop/eel//teL5mclL0jBlqFstr09rt?=
 =?us-ascii?Q?9hERcobce4PoEgMVSlH02u+uyPUEsmOQH59mDpV7xGSZMgmpqgRA402qRXUo?=
 =?us-ascii?Q?LQoVj6AhTp5qRpQxaJkcDSJ/TxtbGi1/eSzEiA3ayyuLAFaF2EOxreq/eS+L?=
 =?us-ascii?Q?BVqrkXMQTieKLEk6cK4Kfs/n7gCh5Tib7tjkrhFsKZmqG9EdWcTh6t27R3cO?=
 =?us-ascii?Q?KrMl2+tsTPJFhN+qVrPED+5qa09rTjNju8+hvKZONKotTnT3nrSZxn95lG06?=
 =?us-ascii?Q?zPDoAnGv6woNyUxECjAxMgoVqpO7XzYW1TsS8bVDQWikdtaFFwJd7WR/apdW?=
 =?us-ascii?Q?PvRhof4B+APCpZ9H4g7NUKRCCofhh76sALhc5LvQPaB0SBvXumsHZac6DOvR?=
 =?us-ascii?Q?To/J+diZ2HRi3egZAiMW3widZrEXV1g+1W0Mdfavo9FZp5LIUw572NxibkG/?=
 =?us-ascii?Q?vo7Wv6df8nuKtx/aqz4kxZLzX6WzidEeG0F7wqa8nkJ9+5ndWbxGEX2eHfHG?=
 =?us-ascii?Q?48s9NuEFOpn1VBJTAItVcLZZc2Tz8sSHIkXrSWLY1an+fNEFh0tqtIgBrc59?=
 =?us-ascii?Q?LnPyZBOBJZlb/VjM+UPExpCoQnX+SahrdaAlSi4h8rAgPmwcrowH7+kMJAlR?=
 =?us-ascii?Q?ln1yn+CMKkF8eEK2P+eRY/2/mg4gskmic2zuz3bbtNYpmuYNzOSBhmnE95Zz?=
 =?us-ascii?Q?XckiLral5L96FmIUoh8VKsxZBl243S7Q21/dHgDAoUgU3/Dh38Ck6DYQhcQQ?=
 =?us-ascii?Q?kmOIMcRQCzH0OUJmKBzD43+6RwqHQ8GVeC6FXh2q5IFPBw/81/JO4C0KjPRe?=
 =?us-ascii?Q?YMKE2hjF56JTSswymD8MKeRNaXGRzBEeReGlKUowtUnzZhjlu0nwqyCtdwjI?=
 =?us-ascii?Q?ssHlPk5X/ov8DhX0JnJ0Oi6FOHnZh6Qg3ER3YpB/3FwrCXbk1HwNwQhINIbo?=
 =?us-ascii?Q?Lc0SutqQXYyyFlq0x8GPZuq0Zi+i9PYfKqCiNbIrx7R87Pp/bbc4ydtV+hRj?=
 =?us-ascii?Q?ZOzB4F/cVQs9hi9M1FLE69qne5eAAORfQp5ItveaTFko8imqZPUZv05eBJC6?=
 =?us-ascii?Q?N4FQZTFYsB5MjAPNCeFcP5/BvnsyLsQU80V11reIYUX9W6yRcVh1juT8tPE6?=
 =?us-ascii?Q?Nho7KtThnKhqvnx3tshHpvHFwGMw0qQUkCH9wYYhgT/vaIv0RQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR11MB8603.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c7IDH6QKLVyWyfc4eizmLxPCJMvbZn6hXc2vmrD0qLrPU++V4+G4dJ3LHRep?=
 =?us-ascii?Q?apGOninUHnWO+UnhpNmXRbPNjPeYcSB0p6iijEMqDsIhDjkVfJJWpLY1RBja?=
 =?us-ascii?Q?SegckkdLWsUlaci0aRYeTF3+q428kr/cseCUx2XOSTUJHlcYEJdGkLOmL7ZZ?=
 =?us-ascii?Q?OrAQ59waJcwY5jOr8cpTwc2sIOMCJuO02w/4GCsdjGL6XwOh4kv25kjMmI2I?=
 =?us-ascii?Q?hz3sV/ASwjmbRhMyLEVcs6QdoXphKvKUa5bvixk3Gdjf9rcPu/OrfuUYaczp?=
 =?us-ascii?Q?HO7MeOoDu59lBmCwdEP6i5cfQc8IfmOdfTR6n0kJ480dzE2nMOz7lEAKykyt?=
 =?us-ascii?Q?UP1IH5wcWFy9x1fq1Pwz1R7+88Qtd7ZmeBRv9BT/9UZCscS2gRCJlvyuwAo+?=
 =?us-ascii?Q?4Ceu5drd5Fbpcy8QObJMJnNLoET3Nc9M8OJvIbIJlVGTJZCcxS5fGbIUYiId?=
 =?us-ascii?Q?S/6B7fVMp1MhE9/uberQRZd7onlkT5UlR7WnOSGsaHqBtQd6o3/EyHQ9nGEJ?=
 =?us-ascii?Q?gEOKhS0CSfW6kWsFVsQ6sHMDwI3lITaBJqLm5IXbnZGVcBCXpcjNUw+/89fe?=
 =?us-ascii?Q?i0JEyBXWAz6nHnHE0WKAKmH82nA1x95nw94Mxtjs0HyhRq1S3OcBC+BCaDrg?=
 =?us-ascii?Q?Nx9bZxPbw0dfLT8EcoE4e8i5As7pfFziVG7OGG0JVP6j0OqC7lC60v/7/KOy?=
 =?us-ascii?Q?zjtt7Of+BOqWHrRhl8dIAyC/ri5/N6N2oNmYdZiYnFLA4FJThBKBwbvub8bg?=
 =?us-ascii?Q?InhBs6CBI+BpJlQ4hqL+nCJAVqIHDFYZr5o8gQQjc6vA/6W0IPkcWW4cg9lp?=
 =?us-ascii?Q?3czmBDXkGgkdOto3Rf8HhNxr7uULPvY83EUFQrwbCP+f954gXtE6bpXXbxw+?=
 =?us-ascii?Q?BPDRosFtaPt0xhRkQVw5x7ohkZv4UnJVMlrqPmz+kvQD4AsCiHhllmx9C9is?=
 =?us-ascii?Q?qnI9HJU0N1bhdeahawpa8BnziiBnKFAx0BNa088x6z1+RnOzT4Qz8aqdp0Dq?=
 =?us-ascii?Q?Cwei0UJ+og18wnBbBiL4mCxhwpEE9nq8nLgtfTIA77ZL8NmbWy9pTG9N8CU6?=
 =?us-ascii?Q?GagH2f+6BJQ+H4R9ea4QLxSA7q4gz1+dK1QtbD/nRvIX0GSXLqPbyEUkyZwB?=
 =?us-ascii?Q?/qB+AFDorKzJHZzSfi9fw9XNTE7NQ6q2LaovNbNNFL+ODyBHG3loVtvQBv39?=
 =?us-ascii?Q?l58zI0eNlh7NHTqJhjqoS/FVNCs50mqi0sULr0IVmiodcxNJOnZ5Oe83F+ij?=
 =?us-ascii?Q?fTqN4lYUH07VmZy3hZlDbDKvfYcosraSmtiRhmfdytVEuS9CpM2Kmh71LvhB?=
 =?us-ascii?Q?LDJ3TQKVxtP9DPu3Vx0fJCQ/asRNl8l/FUFKS+HdTn8FYSqUGwvGq0uJwEoQ?=
 =?us-ascii?Q?OrkAD/NPTHduoomU+69J899hCifnFB4UuTunkK0yY/WgSz564Ws6+yDF02qu?=
 =?us-ascii?Q?ftAoXh2exF96tco3Uh5OmYRL7QYY81TH2nwlZm7ETDe9RnUat/C9bDVhifAq?=
 =?us-ascii?Q?SM7Qq5Eq5y6zz6PwcB9846PT0TL6otgW0MGFXLMvkDsqTldCL6QmjHvDkdT6?=
 =?us-ascii?Q?SVRjTbzwDM+n+sFBG4lJ/k6Av6nrACLfXhLe5p60pgB13j8v9btNHLwVw4Fs?=
 =?us-ascii?Q?2g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d442591f-4c4b-410c-5fd4-08de33af36a7
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 03:34:36.3508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2iBCu1DR/qf+zbs02zeVRGA3V1pNlTPDQZcw1kBcMx/Dr+HGhkUqihpndulzLpFBCgMyaPnxh1iwfLsh0mRwTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8239
X-OriginatorOrg: intel.com

hi, Peter Zijlstra,

On Thu, Dec 04, 2025 at 12:05:04PM +0100, Peter Zijlstra wrote:
> On Wed, Dec 03, 2025 at 10:22:28PM +0800, kernel test robot wrote:
> > Hi Oleg,
> > 
> > FYI, the error/warning still remains.
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   3f9f0252130e7dd60d41be0802bf58f6471c691d
> > commit: 488f48b32654dc6be04d9cc12f75ce030c9cb21b seqlock: Change thread_group_cputime() to use scoped_seqlock_read()
> > date:   6 weeks ago
> > config: arm-mvebu_v5_defconfig (https://download.01.org/0day-ci/archive/20251203/202512032230.5pqkcg8x-lkp@intel.com/config)
> > compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
> 
> >    arm-linux-gnueabi-ld: kernel/sched/build_policy.o: in function `__scoped_seqlock_next':
> > >> include/linux/seqlock.h:1257:(.text+0x96a0): undefined reference to `__scoped_seqlock_bug'
> 
> I cannot reproduce using the gcc-15.1 toolchain from kernel.org
> 
> $ make O=tmp-build/ ARCH=arm CROSS_COMPILE=/opt/cross-15.1/bin/arm-linux-gnueabi- -j64
> 
> completes using your .config. I've tried twice now. In any case, if this
> reliably fails for you, could you try:

yes, we can reproduce reliably with the reproducer.

and yes, the issue can be fixed by below patch. thanks

Tested-by: kernel test robot <oliver.sang@intel.com>

> 
>   https://lkml.kernel.org/r/20251204104332.GG2528459@noisy.programming.kicks-ass.net
> 
> perhaps it is that same problem. If not, could you perhaps hand me the
> kernel/sched/build_policy.s file?
> 
