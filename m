Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2152925745
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Aug 2024 09:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724492829; cv=fail; b=L4j5dWbwLVqMj2hEAZ7Pg1vXFaP56X+suhRxQsvKfcxCPn0Cw2Bd9OUfXdrDEjlhvYABzEkVVTil4np9JwW4qgx+ZQ8NdcBEWvzAVOfuqMQLEUaXwHgAJHDF9isr+zqlphdZanrh8OrNHHH32c+f341V1VVGNpjMbDQDnZ45aHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724492829; c=relaxed/simple;
	bh=JCW0dV2WyK2pS+QPLXgu4kgjW6BTfZvq37nMT+uq48U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=MTnEgAgCeP7V4Tj86TlwgOZMnoq4LXb+P22BBGvCK+QcBk2kKMBq7eR1rHnB6dJ5hGqXP1BvlCvCU8BTDc1nMGlukyvz2DJMVMANAPHuyYhC83iFia/l0fGt1D0HKUsD98aev8FTw6IYw4KmuTY1pnnto49vHZVJ+ENrVoQRR28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n5O0b2XD; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n5O0b2XD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724492829; x=1756028829;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JCW0dV2WyK2pS+QPLXgu4kgjW6BTfZvq37nMT+uq48U=;
  b=n5O0b2XD+0/4vsCv+8DQi8Udfcoh18xBXyt6am3XkkmZ7TmOe9PFK5/w
   hJb21zN1vXTOz3t2qCwnPlsdLScWlAvGZMLr9Fbmst/4+0vXHZsE0vp2M
   b4YzBgcc+WMHV9nOLw28jnewXP+lylBmIsXnmnfMSsm0Ki9sWAlWPMEL0
   GZWWBqZ1ayvqIZplXz/CWq0OtdZJzVnuLQnM5tdr2sUMozdh1ljmvzyqo
   p8zfcLAFtK3TZSoY2AWhYPH09VxfvDKt4fG9n0AJulGWpNNcY7RSkfdxi
   c/nQh7bxUvP6GwBix6SSWtk0jZPC695j8mRmQC+0ZQyD0ameXP84OAzI6
   w==;
X-CSE-ConnectionGUID: 7uIpK2s1RDGYBjykrmBYmg==
X-CSE-MsgGUID: jvcorxlLRTOLn4LJGsMySw==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="34134409"
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="34134409"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 02:47:08 -0700
X-CSE-ConnectionGUID: zKZ5yOIyQTq+WbpcPJijYg==
X-CSE-MsgGUID: lpYvpaPfTBKgzdB7NzEN7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,173,1719903600"; 
   d="scan'208";a="85239167"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Aug 2024 02:47:07 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 24 Aug 2024 02:47:06 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 24 Aug 2024 02:47:06 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 24 Aug 2024 02:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8/4L4tt2QWackFhlHITJR/fuh18JEUDIveA5nPFWagRcTJtWDhdGP0nhOc5vR9cDiyubFJV/6QzdKZWyt7uMn3Ls75LVUMsMi/dChdXpYj3T+Ak9kGa0FrJMM+uiJv6+2uuyVNNp+/9gdk5KtQNjosjIYW3q9443/a81A8ibOHUtlASPGyRIeDULN+EnUn4+jp5RZgqfGubSFmOpKXiryWFtt0KHtySUTpOzDw0+VxItp/dmzJcAjZYwjmy1ed03t1aBqKL0an7mUPguhxpLj6OlAQ/8K6L3vkP4KU34fWqMO81RNRlXHe1gDsuF3sfRTHBnS7lmu6Db5MccXKYLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNjfWGzVzlODg7HS2/ktbyoVPwM/bexxT5bYqWsscjo=;
 b=EM+TVt96YRehknzssreRwBNNtzwa86VjbXm3UXaFUjFP4fV54tSMg3/0TvEupn7v6DxQbTcOCt6wx4zLmDRC6WJkiRfmZp/0xzQrOWhO6SAipVJjklfMxg9kK3sRPah3MCTknl0VBSPUcM9f2y10kBqZYqsyZ/4y+u0ucHY9e4KYxVzP5vJRJKShbB6/kihwZW22KdE6FVFHPwGw6Bt8Oq5Y4GmOVHopzNpx8EDgH1V/boiAMPclJ4lSsin9S5szGfN+7E3jqxo7Axx8X3ubKRbwuCSA5UX/XIRsWhRL1hGTe6HHMwpnR/ySqr/WGbqZAzLA6vhGzAM8jH8mra68mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB5936.namprd11.prod.outlook.com (2603:10b6:303:16b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Sat, 24 Aug
 2024 09:46:59 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7897.014; Sat, 24 Aug 2024
 09:46:59 +0000
Date: Sat, 24 Aug 2024 17:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [xinli-intel-fred-public:intel-lkp 36/36] <inline asm>:7:7: error:
 expected assembly-time absolute expression
Message-ID: <ZsmsC//h0t/BIxaJ@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB5936:EE_
X-MS-Office365-Filtering-Correlation-Id: 51bff0bb-fc81-446b-1dc6-08dcc421b2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Alttjj+xPHUJuNl1npP4+mJi/qwgJnC3Gv+se8D78fYnuNQcv08n3kXKHsgQ?=
 =?us-ascii?Q?2r9UaCL9B/PV9AizV4XKvK8rD0oTmElmCJ2Q99jY++aPdKQp1AvJk77X1+7L?=
 =?us-ascii?Q?xkybHrC4of7Y3QRhB7oJdujjeMnvwxtx8vy3Fea2WnHz3F7nCxCa6oiY+yb9?=
 =?us-ascii?Q?IrCCWPsH9l7YoYoIQ3T1ce3/TJrva1VA1qrxCh1oGyr2ImtE3P+t3S5cqQKC?=
 =?us-ascii?Q?41z7BuEpl4qb68EnYf/TRWS6SFQ7imFfzCyRfnnq1vP5DJzwMqsbGH0sbkSS?=
 =?us-ascii?Q?nVQ1wKCTZj05qwsnoreZTWj3U2Qqs6VKjM52y66ptLxlbpPxWUws60ltPhA1?=
 =?us-ascii?Q?xqCiMYA6xV7JFLcwueYjotJdC92gp7fe0HZGH8nbILpczRF+K3US00yazxH1?=
 =?us-ascii?Q?cjfZsZHQQhp9BdqoBxPWMyrbuj4HhmnKgVdsPDrsCrlS+5YQPTLVzXlPdcMQ?=
 =?us-ascii?Q?KXMu6YeOyfaJ5nSZgdoQtpn/stt4v5pe7qIrtda8lKhe+SQlefEwe30HjYdu?=
 =?us-ascii?Q?6Bv0LVmBk5YazjXVywIRx8aGxmJnQFn6Xree4HaDWWuo7H4EIHzKbOu6b4PM?=
 =?us-ascii?Q?/BjOK46f8xH8BJRrarm0PVy0v596b6nyqXH8CukUSu35Zvo1N76Q7R1/MEO1?=
 =?us-ascii?Q?we+a+08oBSo+o6G75Y0v0PIh4eqIxROPItgKD+/H6aBdCTHwCMBg9GkGOi7t?=
 =?us-ascii?Q?eza6FC1dZje5oYGeqqeKkp5gDZnmU9N0nfsRlxJfmf6bCZpV9K0gb3VL6B2c?=
 =?us-ascii?Q?9QYJ+lcNNjQDavZepQHCT6zo4tWcccjYM+X5y+3u5oWcHUjmCDJMMaFryyA3?=
 =?us-ascii?Q?J9v5/jor6zfxtVh3YyKSYrb+zPBE8rgpFGqglzL2GGJv3d8lp1oFVl1jVLX2?=
 =?us-ascii?Q?5ZQv8GMhxxU0nuJRVub5rB7RVuZXzxR9QHDxpHuZOGPEozBSnwOysL5l+UkY?=
 =?us-ascii?Q?ZBWObQ8SNIVOvO+cJ4BMAyWry76XOspdHuVupOQc86EBcAGRKTvCN8i6XKbD?=
 =?us-ascii?Q?AZV4lslAF15YJFFD/0Tz6n0gtl3p2B5XXwSBorgDzD20myxBBiwUKwaYNoBU?=
 =?us-ascii?Q?WGiFmjbQqIC3xEpn8zV/cNs0RPEwC1nZs2RqTbnlzK0JV6XxTkJKlcmmuU1A?=
 =?us-ascii?Q?W+FkHSR2Ab56y6Lim2EuWFVUoKW68NINKY0+YmbrgrxRVJm3RVOvJKtZulKG?=
 =?us-ascii?Q?XarkRLE4zM+nves2s/zmFoeYFAaHqbUvH+rjOixE4IZR9HWseypUGImKf0UX?=
 =?us-ascii?Q?xRPSLamqmWADI17VQUYKtoipXBcEZgcOc29yFtqXAczl0iEe0omh15LxA5N6?=
 =?us-ascii?Q?61E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4kyD/6pZ3vZD/ytP60I1DE9HHwD4+OWr4hidFgpe0HdXujeQBcfU0CD0wAOV?=
 =?us-ascii?Q?KnSuoOYs0sqS1RH8iutT1kSmgbRYuUlHTlISTX+owU0RzEiZrKSQ48XIdK2M?=
 =?us-ascii?Q?A7k/Hrl+5oFsLIEUDwfrz9Gkn2mjOCxNqCjmJToTnbtzZWDdNO2RTiAZvOJD?=
 =?us-ascii?Q?dO2Ct6hMv3yS1VjKIEhaqg4ET4mE2qz43JyMeZ03uqb/74fXU7B0sThXgsOt?=
 =?us-ascii?Q?J/As+Y/tRwLYdqn649GdHnT6+BCPbAn+CTOK9ZDbc+j4+iRPvLLrLP9HVW5S?=
 =?us-ascii?Q?rcXi4ebsAZ3r29khdWMubc38OvQPviasUpHdcl17doYWXNGQSyK7fg6/Hh8u?=
 =?us-ascii?Q?uqaFe2MEcPEiBIH4HM4Vi9xWohs2Uoo9ynvx5VYt18J3VE7QNSWdXxCV4S6A?=
 =?us-ascii?Q?SNedwmWYhrS373yQOmgTdzxGz7v3NN1b7/an1vfgXrG4fPavCmrymoPykYPm?=
 =?us-ascii?Q?se7pyhUd63WwKTzVSk7x8ZP/2a5C+vUpWtV11nApaWlpIPnPiGCIqcXjdD4c?=
 =?us-ascii?Q?a91EL4i32WCP1vGhn8FJnc5EBpXdn4t+KjIAn6VsO6gO6rCONHkvHPcrOd9J?=
 =?us-ascii?Q?k8P36dYEsggfj1K/Gqp82PyLYXcRclJoWXG5s1y6Wm66sKo0MMoBELjkVpeo?=
 =?us-ascii?Q?ONC+EV2bpi+JYrFHBS4uv59TEtMakBUnJvJIVKxlztXealkJ69UvO3dCQaN8?=
 =?us-ascii?Q?bxckPo4BSD/yz64BLtwiyVw3cYlRY4MA74x9gRjLloIk1B0wjHuoVKeZyLio?=
 =?us-ascii?Q?A5D97ZjYxqK1yGGxvIpObE8RTaMZJ6dwWeSceUZ9/IywHlDUZOBGQD17J6pe?=
 =?us-ascii?Q?nzBf/IXznBoizVolNmigM/8DjESYR4o9ZdvF76sOoPPN97gobMuHps15y5IH?=
 =?us-ascii?Q?vm8PYnymHYa3SX6kHxBiNakXyu5G/obxnoZW5XCoZ/aLb/x2YceIY/57dwop?=
 =?us-ascii?Q?DgS93xgLAFDlmtW+6zT8eInF+XpZggUoU/N+awI0asxsuvxCXZyVCEwjruhz?=
 =?us-ascii?Q?MyA5wB9PbD+knV835XkSBi2fdNy0DBwSEvqSUV2LnqEh12PCpOQP8DjDi0Ig?=
 =?us-ascii?Q?L6wpK+hkqhjS4TiwwJZiXdDRZmiC30M9NgiTRrQQXXA5zVhYTtlIkzeYrnHR?=
 =?us-ascii?Q?+h6umZ9dprxrI7JFCkLnbMmG02z25ODiIypfpZS3N23OyEwE2VJoDz5coMEm?=
 =?us-ascii?Q?2CfXBqcgTG/vgpY8TjkkwERYSxtJxSoWRbpdW5OcAE4ihxuSyFiPpjzaupRZ?=
 =?us-ascii?Q?D7kmW22w+oieezcLBt2Quvdy4riY9zeNz2gV/+UsQrIdrLZBJlo5UQZCEl5c?=
 =?us-ascii?Q?Mt7trDWpQLLE6dVWC+v5DFQ9B3V0vRaBJuEjKVgLic8Xa2bua6JbONGCepSo?=
 =?us-ascii?Q?8UT1m5EofdMw1y2+XElwTGDTtvwAV2Qs5dsHoLI8xLnQbM29xj3SNMzBg2DL?=
 =?us-ascii?Q?D1B0gu8o4p/unUUqe6QhAD7HwWq0sIeCE4uJCtw3FIYjQO7Xpb6ev6uXn9uV?=
 =?us-ascii?Q?tl9q4FUkX5PRJR8uSVdGO+QZrrAECrmNEZ2mcnVcoC9Vk283XDzuVAZsb2As?=
 =?us-ascii?Q?DEvJwZPBT/T3yM+O12rd9zizFsv+rbWZ2vKTug3bz5RXVnimqzjXkf6rmcna?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51bff0bb-fc81-446b-1dc6-08dcc421b2b9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 09:46:59.4111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bqmvqdmMZiSm09g2ThwJYSZ/+HHJYeQvwyD8M0791Y4KCIVtZlNPfuPfUZU4EFNtxetr8oOsm7hYIz7tfpCBCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5936
X-OriginatorOrg: intel.com

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   3162d9822c0cb7cb2a3392416d2d5c471a31f276
commit: 50ac8a7a9a9861fa6ac817aa2507943ff26c562c [36/36] KVM: selftests: Add fred exception tests
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408231145.9ymSSzwW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408231145.9ymSSzwW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> <inline asm>:7:7: error: expected assembly-time absolute expression
       7 | .fill asm_user_ud - ., 1, 0xcc
         |       ^
   <inline asm>:52:7: error: expected assembly-time absolute expression
      52 | .fill asm_fred_entrypoint_kernel - ., 1, 0xcc
         |       ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

