Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD8A13DDAA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 01:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757900805; cv=fail; b=Ev9OIjbcdFak/x9GHlgQVFXqIuyjjnGHueT9AeRj92Og4pRwvWydOgdRQRcl3NxxB30MLGOg2iO/YdhyAzA2NHEaDBEL1qK1OCmq2iFm4IMbe5WmzZQp1MJ1OnifCi60RvDeyhq8BeRxfx1noFJ3GN1YTxohSUjHaVSASBQR6Uc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757900805; c=relaxed/simple;
	bh=oJrcYec6IfMEUvLBGRty8lZuh47x4W9R9Mc1gU6Qx2k=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=n6f9fTaBot6KnQoLvPNYeQNqQzPB8yZ6/h9u/0lH+65ipVq83mdV60lwfX/xS82vnEesFx4LOOZx4iYRl9OodWbWnDtYdOjTZ2yrWJDS8Rep9OfrVSRH6XGMuwKt7F86fWbhpztiPqOTLb1zC8YWdHKNqKqnzWcsIXUQPti+t2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ThOYOXU7; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ThOYOXU7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757900802; x=1789436802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oJrcYec6IfMEUvLBGRty8lZuh47x4W9R9Mc1gU6Qx2k=;
  b=ThOYOXU7hcxN84qEJ3xhUdHld1iYVhdt8N+o2fnj8HgeM3jiVmebPAz/
   JrEcTFxeiunUg+868pEPKCR3X2+QFe0c5pUArxVnV1xn/fvEGmw3bXVmz
   ocV226ti2b6TmrZxIhVNcvc0joA04u/rIcOsWF1IQBajoPlN81BTdfbVh
   zZqijFLSrpVt+Eb0swWfAc0LW0BF5isrRYEeQAnRq5zfZOkN3KIZfejUj
   yzLqPxoIuwnXSurdFxSeFpNVgobkkMqIKdxVDjMjv2wxzzjEidae870Pa
   hgQM+3XwJ+efPXDIOIYComvy569eHQ+1kUkbGdWWzJSiNkPmwMiVZyIKJ
   g==;
X-CSE-ConnectionGUID: KzPg6K7xQ2WZw51nhw6WAg==
X-CSE-MsgGUID: IB1Amz90QVCPk2ofhkJG2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60095516"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60095516"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 18:46:42 -0700
X-CSE-ConnectionGUID: RX+euvcfR1Cci0kpVRJxzg==
X-CSE-MsgGUID: PA1rougIRFWDA+DboU2hoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="178841726"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 18:46:42 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 14 Sep 2025 18:46:41 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 14 Sep 2025 18:46:41 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.70)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 14 Sep 2025 18:46:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JvBloPHbXOZxUrDZi5+HBuuu7vo4JVnjRqchwnXUKc2LXfUtW5TD/WN9dnlhGZvASCISZTEJqqn07vlbb3ZIs24vGSAxZAoNf0cL6/jqeBdPODkZAD8KxeX+g1u4MnsGN3u4dTCW+Z0z1Eo13lsSWDqDTy9C8L0prKFRZoBxGQSSDQ44KGoSwY2sRHT3JYDNFnNRKm6xxl70HDCF5yv9pTec4Vtty9dAKOAIrkEQSAfZLg9fuAlAI7YjtayGL32VYXDKxL9EblTe7yv4Z2wN0vGNtm5ipa9zRDjWEaH8qAIAlE0H2DEU33iZm1vSCEu8S4FugMK7zKBYVHjiC4TWBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5exp5SNKIfl5FjqQpWINbgPH63qNUWhohe4QFJ0r2g=;
 b=qkHNkY8MpDAUdi/qAnDwBl18hmtQPNNzSFBv8C3iPcwC1CsbkC8cLXyawPeMl7wt2oyfyicicbgRcPd8WW2sYmMw/L0Ot8zN4LEuPSDzlU1wtT/GHRND0xtLbf9mgXyo6dkrFYZDLJ8k8Fe3IaqGWMG7BKaHMFPpG/4K5XGeaDphVdsBs2JIR1NXj4y1yXxguQ45k9V/w7OJZQ5mHYsuA1S8+CDxQm5CFF2Lo0MEQWYiLaH4cdQPa+unJ7LJPqS7Tk9PVdmjwCLNkrIOR0TvTxl+JcXuREdxsNFppi51bxRL8TwaHlAs0gEq8HwVkEd/ExYAON82UfCN6QjeprIKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
 by LV2PR11MB5997.namprd11.prod.outlook.com (2603:10b6:408:17f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 01:46:38 +0000
Received: from PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a]) by PH0PR11MB5674.namprd11.prod.outlook.com
 ([fe80::77d3:dfb2:3bd:e02a%4]) with mapi id 15.20.9115.020; Mon, 15 Sep 2025
 01:46:38 +0000
Date: Mon, 15 Sep 2025 09:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jcmvbkbc-xtensa:xtensa-6.16-esp32 24/55] xtensa-linux-gcc: error:
 unrecognized command line option '-mabi=windowed'
Message-ID: <aMdv9xo4nbLbk0DN@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To PH0PR11MB5674.namprd11.prod.outlook.com (2603:10b6:510:ec::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5674:EE_|LV2PR11MB5997:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d3db058-495c-4ba0-d670-08ddf3f9b61d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o4XmeBRAoLexngwp8tEPPV7MDqYLmFVHhA8BxIvHGzW/4UNlPUXmdfjP60MA?=
 =?us-ascii?Q?IyT+XVGnYxWwayM/ev8ZI73phWi+Gig40LFyEHrA3YyZh/QzGd7ACkhNnFx0?=
 =?us-ascii?Q?js7KQPx7HyPpWJb5GcTskOhuomDbebv2oXyayvnqzQbDdRp2CO1Y2T8D/kj/?=
 =?us-ascii?Q?GVYLTtNPYhOk9aTgMDnZqJAvaGZZr1mr+WpYzFWDeXyozBnd47sThM3ImDfB?=
 =?us-ascii?Q?ZaqN5On8YVLmUK1jgW1ClVht2+Z91xYffNpuM+9tU2uSDmRfg9h9uu67l95I?=
 =?us-ascii?Q?KtQqIjEzVp2OEn5O+5a0WwiuPM4lcf+z3mOjqum0HOsMpk3ggyaqzkJSU0sz?=
 =?us-ascii?Q?nMBxTqk2n22LjNrLDJzhHCzP9kmSdA0Da1mIwC6qMgyWIoanoJd9d5iXCkIJ?=
 =?us-ascii?Q?CCpqL9wUT/3GJbSCmQHYBGC4xf6BXTqW++CfYgnlYXU8SubgBn8Pvy3DvGRG?=
 =?us-ascii?Q?Q6YrckbUZgDA5+Y86a3Qr3zUewYP3qDP9l2pRGj/lgNcvqRdWqRX96l//036?=
 =?us-ascii?Q?aWgkGZJ9/SHzb4jbvZe4eybtRmMGKUcFphWVEoqVhdjMOJpP7gmuJ/yQmoOc?=
 =?us-ascii?Q?DSkfKWjU0zQT/MgpqSt59WdDI/f/SoI8BqQQAA4DssLqavSykEP5deCICil9?=
 =?us-ascii?Q?BDrQwKj2LcLhjQRnJ34/hRYxeKlTA8TGu+YKZRpwuaAVpn2KeckrV5nZ33Lk?=
 =?us-ascii?Q?DpkrO3d91mXRUH8SvRnFQ+2qDXvqbj/B/hvuCY5uNA+lNyJJKLlw2W0eGszW?=
 =?us-ascii?Q?BnoudkubfCx9XgJ8PnorkDQQ3UVCw+iTHcnXFi+q9hlmGz8HK2JiFlqmfH5+?=
 =?us-ascii?Q?qh9mTjWQK0U8MBcs3TxjbM/klpqBWsO87YfBAeZ+Flh3kHqCt/MU4dotpplC?=
 =?us-ascii?Q?m785BVgNJHZlbgPW7DvL3fVyf4Rv4oVfbasUNxG5XCl7nhiQjZAkCEM/jUxe?=
 =?us-ascii?Q?/7E8adwDNW711yIiyCzddKDW9bjqIcrh8zh1QUkU+phgMmwI9SZlsmbxLmTi?=
 =?us-ascii?Q?QM9TbNvYkt2+Vou7a/L4FIFYyXlHvpFd+6EhyYEIzMwPdpLtzmOL40HsXpEF?=
 =?us-ascii?Q?wM3Sp7qop72Dtr+PHLhT6hLYmG+MaclS7ZBY8p/w+L+SABssIXQjvg3jQL/J?=
 =?us-ascii?Q?QJlXPpSl0BnxlVxnvpcjGv9hVuxLadGelZ0LZG35vbKFrkeJBJQfz64h7XuP?=
 =?us-ascii?Q?H1rlilweuKAGkYIH5EPBJKoab1k/DOk/gpORnUhHA2EiCOIVT2Wqjjz0NcSy?=
 =?us-ascii?Q?ejAFUQuWuAi4N8R5ZWFXRceoh7i9k3E0/hAReOlJALOkWjfwnonMc1uxIjLn?=
 =?us-ascii?Q?YLYn2soTpqK4D9cv7Qm1Q6yMDmbFJJszUml4TPs6pCNfdjHq0U8+0cZeqWv3?=
 =?us-ascii?Q?ABoqVn5ZdiGjQTEdyFkcW6AT0chJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5674.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFqsZFOtzfU9fF8K8Am9lDlkVmoUeRSj0IfZqtfDlRqZKuK2k9VZHv3BNzoS?=
 =?us-ascii?Q?ItzQe3wSkiOIBlbaufnyxlrmhFpjSEfBbmOARWzCDR5IJ0eewo4V3i58jv3f?=
 =?us-ascii?Q?kmcmbk4mDJq975J8hBNPfq1bBt8zEGlo/dG4N1qTvkJTnMoJwhMAG7/tJOld?=
 =?us-ascii?Q?HTsFes3RpMaSGpieBDOWkNxSLxuGR7q5crH/WYj0OClFGqtM5YLUcVUMgXep?=
 =?us-ascii?Q?9iZYPNryfrLbRCoBWuYjXtDGUEfRnyBBAXYjM7v2mpG1yXuQuGnls7QwECBC?=
 =?us-ascii?Q?K+cVK8zqg/ibeNVNlMVUY5L+GGmTIzcQd+q/qlFp1Jy+ABjp8sBHHM17h+v7?=
 =?us-ascii?Q?XDrPBoniW3211JK5tG9t8KcE03bK2kLr7Y1uV0mU8equTlSIQvuMsx352ehG?=
 =?us-ascii?Q?317McC8mQYwl1dUUb2ewQr4TOc65EFm1fHpx1s0dm2+CYZ+Gj67G09SlIDom?=
 =?us-ascii?Q?FvklsIKnjgh2L+0pUpDXIEUiKjNsl6+5TJPCLIUf5MIB8ouLg8Hzo4XNiUqm?=
 =?us-ascii?Q?EttLLxr6z2uR2mfZU3N5AWLHx6oa6aFNSAmWayTRJw0RJ9XgFgfa8fTKKIrw?=
 =?us-ascii?Q?pGSOVgIVI//HWW675wYKc4nd76IndwSUqrDaKt3KopnMNHNWH5X97ZPOoBBJ?=
 =?us-ascii?Q?zEUvsx9VRr9Jj3hUCNkjlajzudbKbOYrbwJvE5ial6Q2ocICAmJ4DZM1VbN9?=
 =?us-ascii?Q?g1c2PHRCjq+MQyzHGfkztY8hmQCChWbJp/hqXVlXvz03heibNuCBlO211QHx?=
 =?us-ascii?Q?njdsdM/KYhhlu41of3DWxYtR3fiG59eWMNLd2++/EzTJK5uilFnpe4UoC3Hv?=
 =?us-ascii?Q?/k6nOQqV9/HJ4Gnl9bNCaDCzPnRqcEJG0PtE04kJ71BYoon8ZIObls6dBdow?=
 =?us-ascii?Q?/l71seQZqvNbZaS2TEJnWiItqGiJta+UC9huEFihr6dY0E6ieIlVCQy4z0CI?=
 =?us-ascii?Q?0RiEbVHPiRhg8/vL9XFq1g8phtR1NUJAsVOxQcccOI3OEdhhVNR1L5SuGmm1?=
 =?us-ascii?Q?S1QIpLqwKZGNKfs9+WK6ATaXXW5qtw5O9jfCyDrkHApJjdCH2CDJRYeFRKEs?=
 =?us-ascii?Q?L1RVjvukW6+yv/ekcKKs7iFdRKyD1392HtZvC7PaNTarACZdZ61GYHzs+qxm?=
 =?us-ascii?Q?yLpx8q4KvKYLkHdxg0/bjQDDEti0M4z05YdJFytufnqYtNyaqPsy02Zkscpk?=
 =?us-ascii?Q?1IgJrqUCxa9toLe/pgkeDx61Ai/0hUYZ7Ohq2WwqI1aw/zf/MTawXe3H4FTU?=
 =?us-ascii?Q?dN2Z2sJD1R2oAk/yNbBDxK67I2yssKdaacI4gimn9b7EO19Z7hvpXVwIFWOB?=
 =?us-ascii?Q?nAkx5ycprLS9qPYTO3cz6sVdb6e6D0khCP27sux4Ylz6YTbhnxuCxU+9tebB?=
 =?us-ascii?Q?k+BwJgI7iewPll8ee1JQP9xynPX9ymNgEVq3E9Tpf/SoEtdyg17m8FiZXUew?=
 =?us-ascii?Q?69MdzCwjYK3z32553iD4z/NrVxxjsdwPU4/O8pDIAFpvqCYf0EkVbxxfix0i?=
 =?us-ascii?Q?hNbrYVJAFMNB8EdFnFiMsTNoovz4kU+97WyGr3r/olrabzPu+1XyGGkV4Umq?=
 =?us-ascii?Q?HNQoJTG/FQ8KTL+jjVvSva4sc2cUDwyuDbpHNu/7eAvcpanMqP2zLGDNgf/+?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d3db058-495c-4ba0-d670-08ddf3f9b61d
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5674.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 01:46:38.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qOMZ0Dr5zNIzbutaowBipPbiNwS2bmhLJ5L/A9Aq/I0Bx7HZK5mT4he3jHpXOScZHReduUKAEgU2NK40AdYpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5997
X-OriginatorOrg: intel.com

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.16-esp32
head:   c492d6909ab1d5d30a0d25bf49b19a4b0f5e0fc5
commit: ae435cf52d07063eca3719f8eeaf839c3274b522 [24/55] WIP: xtensa: change default abi to windowed abi
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: xtensa-randconfig-002-20250914 (https://download.01.org/0day-ci/archive/20250914/202509142310.iAhT5vKV-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250914/202509142310.iAhT5vKV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509142310.iAhT5vKV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
   make[3]: *** [scripts/Makefile.build:287: scripts/mod/empty.o] Error 1 shuffle=699669312
>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
>> xtensa-linux-gcc: error: unrecognized command line option '-mabi=windowed'
   make[3]: *** [scripts/Makefile.build:182: scripts/mod/devicetable-offsets.s] Error 1 shuffle=699669312
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1273: prepare0] Error 2 shuffle=699669312
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=699669312
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=699669312
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

