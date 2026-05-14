Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012039.outbound.protection.outlook.com [40.107.200.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C19324DCF6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 17:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779054; cv=fail; b=SSLSvOcSmpTNWp3Rkbwge2EISOvs+pIC8GMpw1UFw/uOtsDbzANhk9UAA0Q5zo4eJZtEMNQnEhmDFTa5cRi2Pf3gdVe/LuUZGpWb8Mq4Rqa7rMzEu97BJ4faiXaVNlxdTq+D1zXuGSDdVl7+K0ZxQTeNgcCdtZQ2VoEZhpQrrsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779054; c=relaxed/simple;
	bh=8LIpTGd9wfAroTB0hrDfQn4s+W9+YFrU7G+jFcMSQ5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=auG1CcIwIN0kybLm+ZnPihW5GVoR8UdKSXgQfBUJ5/ZATrizPOIvIGx05m4skxOFRdq+nLOZYNtdnht/cEMZT6Nt5GHG/tehfP+piqP5gJA4GF6LZJh8hc6fysMIFuLOmMM9H1tzEyr3yqCSanNMHuWMqma8xFn/JSYfFQQy9ps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jxC/Fg9p; arc=fail smtp.client-ip=40.107.200.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jxC/Fg9p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hv9Ptn5LAPKHHLEM1njlg4DZgbs7bjFVxeI+umRlXrZFjF8jsGOybWhkXphxeEtZ5RxbID1MXyCuJINmAyHBkpiBquNEbftXjeLzdGqU9ZtmcfgUNSNu19rEWmZ73t8hlo7231f8fNAu/2M+ujE9uJdWTpAVuXcxLckFc3hNKBBwf8wwdOyRoxanYumhgoWp0z3Yo8bECrWN+IOIvAwMCK3+FMvFUF32E1mdTZIkhBg9josAfwNOLYUqgfXyqV/RzTpygtdLW2DjLFsKa5+B1t5Tfaw9rmBoxV0mqwtBp2Luod3BzbtVnbUgXNFF6e/zJFgt7s+FtuJSWP/AbCB3zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5gEPdpOAdJUKyIY/AIx73b4+1lpiOuW5nJy0aJXkis=;
 b=mq4kUAuVCzoAVam3XsYRmmSUOjDYP4d6mVtDuZIxvCR6Hn1nCS3ZhMswDGnbGYguiW++5Mbta/TVE8hjWPCB2201XATa2BmkUTTFWd4NkuXh1lXbDd4FhcGQTKdqXT0ZvqkyiIfYcAZ3iJ2UJM1r2biPiEn3NA/E0GD5o1xNRCkVxc+BK7R2IU2wZqhnaM+JEgHTbWpsSmoufAixPVgJCSjxv3NY3rOG0fBpDd1LQOlfu0pnzgxuiP2zXhggPpQ1OAoEF8Kwn1+5FqG19xuOBb0LJTXU4xfYls2RGWJNejPpvLN7HgbzQJlDLVI20j86xpo/xdp3KmIcqB71064Yiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J5gEPdpOAdJUKyIY/AIx73b4+1lpiOuW5nJy0aJXkis=;
 b=jxC/Fg9pyf77ZRqf0b1YrhwuUtmpsA20AqlUiYV19kKw0hhgEk4uFNQRY0/08+Aqvl0R69xlWvtAkRYmqafd73Wp0OTQ6/vMP9sP+q1VaHwZwLmNF9b1FHxrIrBq2MLCqFGR+QnKHMN47DGjWbJaZ55H8yKEzQ/iXXQ8Xy4eDbM650zRgMoHVFVC8febrAZYY/l1qn8ii+rAjo/SbgMaUd4PKZ7cBF2REQVpmv7TUl8bOwuOpN6hatWOpBhgkzxITW5Io8WSXPYpqZLeujoASoZX+4SYnD4rIzMwC5ht29OzUDjtOc5zFOKAm8QuK4iPXKSUYABnq+09jHVXmeg0lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by SN7PR12MB7249.namprd12.prod.outlook.com (2603:10b6:806:2a9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.17; Thu, 14 May
 2026 17:17:27 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 17:17:27 +0000
Date: Thu, 14 May 2026 19:17:15 +0200
From: Andrea Righi <arighi@nvidia.com>
To: kernel test robot <lkp@intel.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [peterz-queue:sched/core 6/9] kernel/sched/topology.c:2705:25:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <agYDm_yLG3pgNNRc@gpd4>
References: <202605142117.gyxGm7SY-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605142117.gyxGm7SY-lkp@intel.com>
X-ClientProxiedBy: MI2PEPF00000B80.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:298:1::417) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|SN7PR12MB7249:EE_
X-MS-Office365-Filtering-Correlation-Id: c90b6907-fc7f-430b-1f55-08deb1dcabc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|11063799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	jaQJ1K7S8vOjSG7cCWi80AEEgBQ/pq3Bot4H/9fpdXB4IazIGQJijfnYkTvAZG0KIywcHgdBAEtbKI1HvLNnNj7kydJ+fw8RGg5MryjJXPwRsDwY6GdIBGRW4V7EHDSgZg8Q61N1MWkvGyRsTcSfZpYt7irRfpIEQuaFGUA3nfjLd0aGVSdOP2UA2FwWb192pArM2O7rsSE9HwKc4SRblb4CKUQOnkdd5XPuoFjEUSRK5r/PrQ3XOVBW1JWXxeDYRWiRcXuBlsGjA9jvTxe3eYh+KZ0n29msY5buqZgrUjXNQXA6YToONKGGEC7QKRerzPT9NOp5Yt7zSzEcriGyVFhPDjvx8pICA5jO53BRZOKkAqFFAzjDCBWQpF8pfpyDwUXJllfhJfm00mDvLTl+ysssVfeGFNnYgzpYcXbQ9+vTOUxqZ8N7SPBqNKQTQIXRIxKQOwCXLJIDj2ywLIq2Z1XyYH46FSm58leZ6YmQudnUhnt4Tx2EfdyEza2lYJcpxCVS9DHdUcY73n5QuqbAlrqJCjtCo4cIDdZsnh2IkAMalgovUq9qYGLOqs5YnGfMVBnqoDl4xdYmOXzK9ZtBgDSdBAX2AnF3kJoIDDwS61GzOZyYvz2ygSDQ5Y2B8bEs6Ny9T+uwMuIHaEGM2KF2Yirp0v/16SNcpt8SboO7rC48ApWH9Sku1ReZoVFWPbqh
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(11063799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VAlsRe5ZA3hsnnfPMur8wjk0YfDP8Vd24NCrCME3uem1IK2ypF6zbi8UKG5x?=
 =?us-ascii?Q?E8ozSaKx2Py66XJxj8K3fvYVILzVlNOup+QR8GxvhNZsbux1zE6drALP2cuK?=
 =?us-ascii?Q?VfrVFojJh4mXrR6X1Udy8WkXNWUFruqzuUtGLb+bR5gac4btlNJ1Hfrl5RvZ?=
 =?us-ascii?Q?9d6CTayTDyZAfpayut6C9+mCdAQcX6E83uBAC1blxDDVQQGICjJMFfdPZTgt?=
 =?us-ascii?Q?7UzvvslvoAd3xoQYf/Klfztmj31ynNXYugob8pxxVc93nKE3J0vFk6esE7uB?=
 =?us-ascii?Q?RtTMwgmz417pGqeXPpAhPx6JbCa6OgLctlckWPPjyP4S8H94rgHuqk94rb8Q?=
 =?us-ascii?Q?hEJtBUNgJIkyxqZS/+Kg4sqNzhOkaItewQeKvI62v7w4UpXcgUrNqigx2Uzx?=
 =?us-ascii?Q?RVo72D+F8VaOmMWBYlfRia1xmzOwP11CAfF3eceowE5mdagO6dEU5VGJlMNf?=
 =?us-ascii?Q?ZVBOVb+Ak5Y9IlHJz5yi6sJs960/Dp4wyqgstq5+zhB6zXMExIEyC3PP88E9?=
 =?us-ascii?Q?VptK7HdCbVcHcLjc3hSt6izyCNlUKyWZRLYhRIIKg6irzE+wmKTXMPGYraur?=
 =?us-ascii?Q?AZ0SFZZlTqIIG9Qqiaox8zX06nYTpgLFbMyqP3KMvpdzTqJKZAOyijFg8B5v?=
 =?us-ascii?Q?SzaARxwxzeIowOoHFg2uzevKMQpPFgTB7MblnKtQ5/m9AMxtrTcGaFlmqaZA?=
 =?us-ascii?Q?UJNQf4gfjM5HzMxFewA72y085jqDLeTVH2sscWWu3J6orTgNVVSnpnreRjWs?=
 =?us-ascii?Q?NkjXbI6JeTKvcU14XpykKaRIlHSz4xvB/eKPQck+SAlnPXdulBikcAOI68wH?=
 =?us-ascii?Q?sZt74SqDjZ6t+KupgzJSjzWaVe57bHL/vkH4bgCbGz3i27q2KaO0lXIn27T7?=
 =?us-ascii?Q?v/mW2AF5sXkTj+9xi1tN1mhcuc4vZHyaBloOg2ITIrFaFtOjNKmN3jXA2lXG?=
 =?us-ascii?Q?IzSeCvfIdhiXNlV/X3VdK6B3DT7W6qPo1W92yDRvzmmVuM2dkLiok2vtNqZt?=
 =?us-ascii?Q?CNj/WyxhsmQIj8Gf6QmaElcHcawkURwkZPN2fUNgJp1/vepZteA8Hdzsmbvm?=
 =?us-ascii?Q?tggqxv0igCZIVpLK98vfrDSRK+CSUvA+MR34qawLTduWzjAcii0ZSe5LIrOG?=
 =?us-ascii?Q?sPW7jai8hoPAgZvlo7yshTMzhyDL2spayJEK2yTT5VWa+W0mmWhsccqQUqwg?=
 =?us-ascii?Q?CZTJZsduOm+EkV0J8a6G354U7byt0C8GGQDfG/qQp/Kn4P10WQ67v+CuaaA+?=
 =?us-ascii?Q?PDlUd5VtYxABKbUWDRGvBW3XGO9wJLtrvswTy26hSAL9A1Eu41Mp8WyEhVS1?=
 =?us-ascii?Q?QkxMkp6nWjgqoQNBhyLc8T/Uo7k1PGkqAwRsfN8MbebeqecSxoU30C9yWWoy?=
 =?us-ascii?Q?4vSlFtsxUH6G+Vpd0YuNf/ibLbmmI/LfPpFikHe7CZ7NGOu406Pfep475EcV?=
 =?us-ascii?Q?THCcOZYkifwe03vL2NcWu9sbxImuzrkY5YzKyiaOl9q8haN6ITgv1uWajKtW?=
 =?us-ascii?Q?5nVy1MgM8p8gKyZh46UL47jQp/IttRBLtN47zjpwZVjlzHp94Az0g9tHccIP?=
 =?us-ascii?Q?mspnCzwZ01/2Ia39e++qU8IZS9Gutky2nHb0egoLcFK4YcXnwpgKFv8j/Vjg?=
 =?us-ascii?Q?JC9/4tf9oiYxEVJo6Q/RkWYwvEkZJR5XQaD0H2zj8VhvMa7WrRpgOtaD1f7V?=
 =?us-ascii?Q?j3lPObgKrVYHa14Wvvy3rpEtj/s1zH0yLHHx7Y85gHeSFrm9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c90b6907-fc7f-430b-1f55-08deb1dcabc9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 17:17:27.0042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f9O6PE92X9VUY8Os3I9AFGaTDJ7ls6IOza7PXKHfllg5RSYEKW0N1EtQfFJfnYclneFu1aBUuB3h8dQUU0+N8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7249

On Thu, May 14, 2026 at 09:13:09PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
> head:   238b6f2b3a4948ca7048025a15874b2c253a34bf
> commit: c3d608e99c540bb4a68f31a1e0dffa7af2827216 [6/9] sched/fair: Attach sched_domain_shared to sd_asym_cpucapacity
> config: nios2-randconfig-r123-20260514 (https://download.01.org/0day-ci/archive/20260514/202605142117.gyxGm7SY-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 8.5.0
> sparse: v0.6.5-rc1
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605142117.gyxGm7SY-lkp@intel.com/reproduce)
> 

...

>    kernel/sched/build_utility.c: note: in included file:
>    kernel/sched/sched.h:2379:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
>    kernel/sched/sched.h:2379:25: sparse:    struct task_struct [noderef] __rcu *
>    kernel/sched/sched.h:2379:25: sparse:    struct task_struct *
> 
> vim +2705 kernel/sched/topology.c
> 
>   2679	
>   2680	/*
>   2681	 * For asymmetric CPU capacity, attach sched_domain_shared on the innermost
>   2682	 * SD_ASYM_CPUCAPACITY_FULL ancestor of @cpu's base domain when that ancestor is
>   2683	 * not an overlapping NUMA-built domain (then LLC should claim shared).
>   2684	 *
>   2685	 * A CPU may lack any FULL ancestor (e.g., exclusive cpuset symmetric island),
>   2686	 * then LLC must claim shared instead.
>   2687	 *
>   2688	 * Note: SD_ASYM_CPUCAPACITY_FULL is only set when all CPU capacity values
>   2689	 * are present in the domain span, so the asym domain we attach to cannot
>   2690	 * degenerate into a single-capacity group. The relevant edge cases are instead
>   2691	 * covered by the caveats above.
>   2692	 *
>   2693	 * Return true if this CPU's asym path claimed sd->shared, false otherwise.
>   2694	 */
>   2695	static bool claim_asym_sched_domain_shared(struct s_data *d, int cpu)
>   2696	{
>   2697		struct sched_domain *sd = *per_cpu_ptr(d->sd, cpu);
>   2698		struct sched_domain *sd_asym;
>   2699	
>   2700		if (!sd)
>   2701			return false;
>   2702	
>   2703		sd_asym = sd;
>   2704		while (sd_asym && !(sd_asym->flags & SD_ASYM_CPUCAPACITY_FULL))
> > 2705			sd_asym = sd_asym->parent;

This looks like a false positive to me: claim_asym_sched_domain_shared() is only
called from build_sched_domains() and we are walking child -> parent during
sched_domain construction, before the tree is published to RCU readers, so the
code holds exclusive ownership at that point, therefore plain dereference seems
correct.

-Andrea

>   2706	
>   2707		if (!sd_asym || (sd_asym->flags & SD_NUMA))
>   2708			return false;
>   2709	
>   2710		init_sched_domain_shared(d, sd_asym);
>   2711		return true;
>   2712	}
>   2713	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
