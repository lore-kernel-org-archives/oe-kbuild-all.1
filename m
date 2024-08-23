Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C4F849C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 04:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385686; cv=fail; b=GWizkWrWU+onmJgr9rTyfjz07hAzzT4PfyWRN3/90B19MAALmSdv3KJ2zx44xoDCg1tymwl2Dg382fAM1AiZBK3NZb5g5NK6G+RfB5RKYfuxMKYam2DTrWDMoL0g8BbvK93H0GMJWQF9bLRMR0ykREKItxfcGjgj92if63GPInY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385686; c=relaxed/simple;
	bh=3pXiBy4+ljL8sRaXtDrbR44bwUj4M1T5hk2vvV2iqdo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ImrtAoDnyiJHwe6c7hFJT+IKesldD4O92Fi5Gh8LqFV2PHd8vL3YkZ1EoWoPBGi6FoK9CLV7Cm5CGsniZSp3pCmAWntZF4XY0dOoWQwBLKzuPNC1WGbOGn2u1xQLgFKq4l/4Tislr0AjsFazbX96u2VHyNCMtkGfvq7WyO59l6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+ZhMtx2; arc=fail smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+ZhMtx2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724385684; x=1755921684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3pXiBy4+ljL8sRaXtDrbR44bwUj4M1T5hk2vvV2iqdo=;
  b=H+ZhMtx2SPd39wtyQAz5HJEF0wqJN0qqp/V1sxP9uL3Z/lVAOIjUopm0
   SzRFQ6u8EUi/lPfojtGW4tb9S12wXtLSzLzc1dBtUBO3gjA41pSXzjFJR
   aNsheWaIcn3F2c61D76FGqjJ5EYdOjJkRRN/Pck73Bc5eCut7qZQKhBc6
   IR3IrDAVWXwxdETPB7qRQTRMmEOagklLEV3N0YoiT3bFe7qFH4Za1cAlh
   8Cy99RG4MzJ7YzBTGTp+VQgcAw3vCa2sH9QWHaJDT11s8ulrRiCSSFGz1
   ZXqF3m6BT1i5sWkxrGrcbHIGxkaIFuBYHpdaQ04BWCRdbK9y3NxbWAA9w
   w==;
X-CSE-ConnectionGUID: vG+E4l1wSMuMU6Opyk4v5w==
X-CSE-MsgGUID: RT++ERAzSpaYwLliW/rWrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26705574"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="26705574"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:01:23 -0700
X-CSE-ConnectionGUID: eVaMj9b0QcS5xchZjNQyBA==
X-CSE-MsgGUID: Ko4mXv3KS5e+Ys7cOaaIHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="66598914"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Aug 2024 21:01:24 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 21:01:23 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 21:01:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 21:01:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BOJYcMvW/2m4RmT3+3+ndFiG89uN/qC5MdjwCYNQvuYcZki1tUITDsPmmyb5nLYovOYPRjZgxDrB/aG9ESfioHOKOowX430E2QzAa2gCcm+j5wGX3SZxod/Qe3LGeksJFVec6nji01l6iZO3WG4UPXXTWOaVxmKw5beXUhkbkwwvvnnHAHp3dc9+qKBoUeBTodhdlN/gXP/LxuEWKzgXqU8GO8+q7dbHpsvuVYFYaInuC+aOfR87rneLxY/d2YA9zAZlXjh6pkCPAi6+Fw9bNjbvTiesqDTD1SoMGUG3jVdwQO1d+vICqR/qTp0jf7zS1uxoppUGUkJ8kHjhGMToyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5jjb7L85/5fuJvwfSLGJE2/2iDJ0ukDgKu2bC1cB5o=;
 b=jlfiZOSUyBR9IYz0NPRlX1LXuqd9P0k1i7fCh1inlgZQF4/dAWeYc3fUJ+ZfE1ZnddzxrKVTXPM8xLdTz5kxiwZ7IBKaqEUfrVHg4FR741CS0Z7S0XkA6K7vLZqNSSCGZLxZaeKyEBrW86sDsiV2O+jk+ORz0J+md3TosjK6DuDLytlvyrTjHmUwc4AdMPD22cQTMNYw8uCdwI+1y43Kkl+nBKRlPeQmH0hjewGsuyozB/nCeauDi+7rfKbxgXL3RGlDDGwNZ5/pAdS9jSIPIoNP9tI3iQr82iVkQYllnFh3cOJQFBMlULCH4pgbZVMqNRyntGFz6T54KA14O0i8lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 04:01:19 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 04:01:19 +0000
Date: Fri, 23 Aug 2024 12:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [xinli-intel-fred-public:intel-lkp 34/36] x86_64/debug_regs.c:37:15:
 error: symbol 'sw_bp' is already defined
Message-ID: <ZsgJhugVZBqXv5sv@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0153.apcprd04.prod.outlook.com (2603:1096:4::15)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|SJ0PR11MB5183:EE_
X-MS-Office365-Filtering-Correlation-Id: 825fa87e-2971-4934-5ff2-08dcc3283de1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t7cvcJo/Utsi/z+bnzxNCKp4fbYUeV7R0v+4JlujEkEUM2oD6aZm4ntU4VbR?=
 =?us-ascii?Q?YrmUaRplOJQlViNevJxl5LRFSJLBx/Zsl9MjYvsxWhMIKEAR03wAnnmH5gUA?=
 =?us-ascii?Q?MBaqgurLZ7pdOZR9olLTW88+Qn6Cy74fatvYOLXkPQ1qyu9o/QxEvAY/cDpM?=
 =?us-ascii?Q?tEmEkusKPACgxQEwHLbS6G+Mt2tBCm4G5RuHIuaucqldikS5IyyeW36MMs+q?=
 =?us-ascii?Q?/C8j9wEuT03xypBmq2CfJh/5pas2081UaGK7hVoL6AHrJV+H4CHs3x4iMaJZ?=
 =?us-ascii?Q?bJc0sN24FGu8KHjajGA0VlngzxUeQpMNdmVhkreBujDILCxsWEjoFU++c/mS?=
 =?us-ascii?Q?HBeKC2anrRZDqYpYDYGQaOf5nE624kxfJdXPEYZVfELVlJ6CyKpvI1JYlugn?=
 =?us-ascii?Q?/R5foIopRojxaSWPmQirWoJFIjYfJZnEkc+yzYeZDJmClntguGRvSn6la/5l?=
 =?us-ascii?Q?5zWW7EyFOl87t+7Qzer87j19xS/u4BAHixu+4vFkhycSZHYoDdZJIUHf/H0i?=
 =?us-ascii?Q?mv1kRFApL+vyBygoDks35H67oDSRvDVs9GrO8WpIQSy2kNJFFFxnq1soH5kH?=
 =?us-ascii?Q?mN3QKrV8hqQAT+gE3Or4gVjP0DNYRWk5YAtfeNuc66UPId4rhjQFQmQheMh9?=
 =?us-ascii?Q?5FupcehINxhYNBvZQOLFmfe/H9XbCpRfLOSgIHF3eDQjZ/b23/2Dbv/NdEWL?=
 =?us-ascii?Q?7SOhTHQnpiaQGQPUyCmXV6xqLE7LDaSyk8Z1o2I3sqLEq63anewUcH25+Lfq?=
 =?us-ascii?Q?6vLfs28DbEd8qS/WLltG9uyz93KH6RfyDGh/hL9EA8i3/LZl7Y7QWDNGvCn7?=
 =?us-ascii?Q?M/7v2N2Jx3wYwLnkLfRZNhUSBCVnkdnTFcmaEML/VgTRE0a1e/x2WPvIjEbS?=
 =?us-ascii?Q?pPQHQ8jwilLPj/JNPl7pCpN5xloVGuRR9psDIw0Atp1WwSCsBgQhQ7vPZoVn?=
 =?us-ascii?Q?PXXe9dqYUjuVxfJbhRX68wHqL+44Hi2NawW5r1PvlTTne9SVfUUs6pJ6QezM?=
 =?us-ascii?Q?31pEx/lPpCzioBL/Boo51gVxuPYerUjjqLdXXzV6ImxhD1E5I72gNrW3v1SH?=
 =?us-ascii?Q?+MZVVlT0fmKQpe6MDDVvA5tyuDTVVF0KZ3W9ncv0VYK0rugZn6wDq4m5OxvC?=
 =?us-ascii?Q?LLabm12rSTruM/YFBoSZSgxgSwGxrrhUpAFGq+gTNctcaxp7aiz74ll5NmfZ?=
 =?us-ascii?Q?xpZhgcTZsBcHi8zDt+ApVtqLROpwfwvPVGax49Wih2v+BkeR3g0tPSPkInUo?=
 =?us-ascii?Q?y4irY/qiXSlAr5XIXkBlKL+OiawoLhZefakOF/U7fWQXdXruxm2NELqvejgu?=
 =?us-ascii?Q?p7E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wRp1HDBKijLGSD1b4xTRIqEvgOZJOXUVf0xgd6Eod//usaTUPR6Z9Y/G8RCj?=
 =?us-ascii?Q?sLId8OVqeNim5UScd1AN8dObUTfEcvkjzagR9oWZ5VlU0KCmEJ8M8a8F4nIJ?=
 =?us-ascii?Q?A51/n7TBMdbYM0QqFhyFo+sQUgPP/7gTu5Z8VZAD1dkwzRDQoVOxx415OQ0L?=
 =?us-ascii?Q?AmeZKMeft681GpKUTj2kWnOeeU+g+3aYBbOR/hDnS7dJtcSGX9lC7cnbZNN1?=
 =?us-ascii?Q?zMTR8Qt2M+b3ATSd9cherkRmSd2dLoYMkR983JLvQbjIip0Tl8eyTHF23UhZ?=
 =?us-ascii?Q?7YfsxYcyj8F/v7jQeZw8Askwa7oGAD1Dnni6+c4x2rgrlc+8vTeq7YOdVQi6?=
 =?us-ascii?Q?IPE3Nk9gaofXpW4Q07odT2Ra+O4iHP1AASvwxPd+hRya5No02rzE5gS/hxmI?=
 =?us-ascii?Q?pnOW+aeJ12gpBW9isxAtesEW8wp5WWJ8uViEYzhMm/NkQi7EBqhF2+XqLNZ1?=
 =?us-ascii?Q?Wz48rvHcyHz4Nytpbo1q8Mb1G744+XTmV9dkiAgRtAxgfRMD2uXPzo1w9mNI?=
 =?us-ascii?Q?IzYkOxDycOfXLKKpROed6qENWUts49UkdegGWdnxas1xg3sSsZ4UO/+s1Bjd?=
 =?us-ascii?Q?+HD4TeQm0RWZbNP226TCv6G8jJ0x3NxtiDQXsciBzfEN5wCi/AMYbHYjbhZz?=
 =?us-ascii?Q?U30CZymwJRq4G5n4X4KQKK+m9dMIgI647UaApnqj62VmBqXq0RNlUbDADcEF?=
 =?us-ascii?Q?M//TmuUyebnwwiwgl9DY5e80Rv/IOHRIFm6t7rJaOKPV/HHVyEyyhCEOZiI7?=
 =?us-ascii?Q?+gcf8OpHqAtFqP35bZhYuxPkc601zieaqnZg5coywgP8XGL/Y19TPlASxqlW?=
 =?us-ascii?Q?0n9VvDqQd1poc/RssJz37yisWNlOptfiEfSg/du9JL4bEVmvAWWeIQiZ7O62?=
 =?us-ascii?Q?/2jDX4IZrbOqjuZBozCalDR8NOdOu7i+hX6ciSe4t19B8fAjkiodlgHXNXBK?=
 =?us-ascii?Q?k43XLqTdTkJkXUjjzkKTAWdn0rlapFwBJ7OVm7pCuQXbUwX41DMJyvF1TIPT?=
 =?us-ascii?Q?7EoO8LaogAjnJxVtuzSs+Z6yweVDKbJnQZdiksxlClKQ6aiM+UA02KL6Qg11?=
 =?us-ascii?Q?7iBCVZkRHhtbnjDJAwk0j0Nr++ccQITioMZdA6UT/OzlQmoNPen7cfPE7o7t?=
 =?us-ascii?Q?JZ4W890IxKN45shOVQVJTiYTr3G5yEj6j3UwlH7ULr+t2HvA/A45+IoFvwyY?=
 =?us-ascii?Q?FlhSgrE18LZav/Z8qtwsEDVifynDs3tOmj7/R4gNgRycLsQkS0LU9D6NeAFm?=
 =?us-ascii?Q?sbkwPK/I91j/DAGE/py1RcOsT2C7eftlTUleXevF4hphHtMLrXzXzrPTkFCd?=
 =?us-ascii?Q?gjH9K15050ySRg9/sfKaiZaOrcFlYANGQkz2iLBJCq5lHab6TUvbtNZgEFm5?=
 =?us-ascii?Q?L0u4IZaAwIIvgxz9i0M2Kt0QKUJa7WLE93Nhl+aV0gIeqwXshvrdu0kSFqDG?=
 =?us-ascii?Q?GA0gMRyRwLSaFGXsxcpUwQHFWyHsJIA+qq+lDmFL2Jds++FyRU986eVqyq/r?=
 =?us-ascii?Q?3SG0KGT2s8e0b2kje2YBxZIzhKpkjZHVfKteu0fCjTzKpcbIq366/e/Wv4Q0?=
 =?us-ascii?Q?D3hcaOBFQnHqxXMPU074jj/nL0kG+ql7Bxk/QJ4Y/CiZDDg1FBP3pOUKOrCO?=
 =?us-ascii?Q?Ig=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 825fa87e-2971-4934-5ff2-08dcc3283de1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 04:01:18.9500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wxTquBq8+TGhYu+6DygD9EYbVZLEGX33hpSAU4ev71bUptJw6cZO0QRT/FImk/i58fFNMZyq62U8UtgAVAUDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com

Hi Xin,

First bad commit (maybe != root cause):

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   3162d9822c0cb7cb2a3392416d2d5c471a31f276
commit: 3670a5472ea048aa86e62b5bacc22894d7c21f20 [34/36] KVM: selftests: Run debug_regs test with FRED enabled
:::::: branch date: 8 hours ago
:::::: commit date: 31 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230028.6v52vRVl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408230028.6v52vRVl-lkp@intel.com/

All errors (new ones prefixed by >>):

>> x86_64/debug_regs.c:37:15: error: symbol 'sw_bp' is already defined
      37 |         asm volatile("sw_bp: int3");
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         sw_bp: int3
         |         ^
>> x86_64/debug_regs.c:40:15: error: symbol 'hw_bp' is already defined
      40 |         asm volatile("hw_bp: nop");
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         hw_bp: nop
         |         ^
>> x86_64/debug_regs.c:44:24: error: symbol 'write_data' is already defined
      44 |                      "mov %%rax,%0;\n\t write_data:"
         |                                      ^
   <inline asm>:3:3: note: instantiated into assembly here
       3 |          write_data:
         |          ^
>> x86_64/debug_regs.c:53:15: error: symbol 'ss_start' is already defined
      53 |         asm volatile("ss_start: "
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         ss_start: sti
         |         ^
>> x86_64/debug_regs.c:63:15: error: symbol 'bd_start' is already defined
      63 |         asm volatile("bd_start: mov %%dr0, %%rax" : : : "rax");
         |                      ^
   <inline asm>:1:2: note: instantiated into assembly here
       1 |         bd_start: mov %dr0, %rax
         |         ^
   5 errors generated.


vim +/sw_bp +37 tools/testing/selftests/kvm/x86_64/debug_regs.c

449aa906e67e57 Peter Xu       2020-05-05  22  
3670a5472ea048 Xin Li         2023-10-27  23  static void guest_test_code(void)
449aa906e67e57 Peter Xu       2020-05-05  24  {
85cc207b8e07df Maxim Levitsky 2021-08-11  25  	/* Create a pending interrupt on current vCPU */
85cc207b8e07df Maxim Levitsky 2021-08-11  26  	x2apic_enable();
85cc207b8e07df Maxim Levitsky 2021-08-11  27  	x2apic_write_reg(APIC_ICR, APIC_DEST_SELF | APIC_INT_ASSERT |
85cc207b8e07df Maxim Levitsky 2021-08-11  28  			 APIC_DM_FIXED | IRQ_VECTOR);
85cc207b8e07df Maxim Levitsky 2021-08-11  29  
449aa906e67e57 Peter Xu       2020-05-05  30  	/*
449aa906e67e57 Peter Xu       2020-05-05  31  	 * Software BP tests.
449aa906e67e57 Peter Xu       2020-05-05  32  	 *
449aa906e67e57 Peter Xu       2020-05-05  33  	 * NOTE: sw_bp need to be before the cmd here, because int3 is an
449aa906e67e57 Peter Xu       2020-05-05  34  	 * exception rather than a normal trap for KVM_SET_GUEST_DEBUG (we
449aa906e67e57 Peter Xu       2020-05-05  35  	 * capture it using the vcpu exception bitmap).
449aa906e67e57 Peter Xu       2020-05-05  36  	 */
449aa906e67e57 Peter Xu       2020-05-05 @37  	asm volatile("sw_bp: int3");
449aa906e67e57 Peter Xu       2020-05-05  38  
449aa906e67e57 Peter Xu       2020-05-05  39  	/* Hardware instruction BP test */
449aa906e67e57 Peter Xu       2020-05-05  40  	asm volatile("hw_bp: nop");
449aa906e67e57 Peter Xu       2020-05-05  41  
449aa906e67e57 Peter Xu       2020-05-05  42  	/* Hardware data BP test */
449aa906e67e57 Peter Xu       2020-05-05  43  	asm volatile("mov $1234,%%rax;\n\t"
449aa906e67e57 Peter Xu       2020-05-05  44  		     "mov %%rax,%0;\n\t write_data:"
449aa906e67e57 Peter Xu       2020-05-05  45  		     : "=m" (guest_value) : : "rax");
449aa906e67e57 Peter Xu       2020-05-05  46  
85cc207b8e07df Maxim Levitsky 2021-08-11  47  	/*
85cc207b8e07df Maxim Levitsky 2021-08-11  48  	 * Single step test, covers 2 basic instructions and 2 emulated
85cc207b8e07df Maxim Levitsky 2021-08-11  49  	 *
85cc207b8e07df Maxim Levitsky 2021-08-11  50  	 * Enable interrupts during the single stepping to see that
85cc207b8e07df Maxim Levitsky 2021-08-11  51  	 * pending interrupt we raised is not handled due to KVM_GUESTDBG_BLOCKIRQ
85cc207b8e07df Maxim Levitsky 2021-08-11  52  	 */
449aa906e67e57 Peter Xu       2020-05-05  53  	asm volatile("ss_start: "
85cc207b8e07df Maxim Levitsky 2021-08-11  54  		     "sti\n\t"
98b0bf02738004 Yang Weijiang  2020-08-14  55  		     "xor %%eax,%%eax\n\t"
449aa906e67e57 Peter Xu       2020-05-05  56  		     "cpuid\n\t"
449aa906e67e57 Peter Xu       2020-05-05  57  		     "movl $0x1a0,%%ecx\n\t"
449aa906e67e57 Peter Xu       2020-05-05  58  		     "rdmsr\n\t"
85cc207b8e07df Maxim Levitsky 2021-08-11  59  		     "cli\n\t"
98b0bf02738004 Yang Weijiang  2020-08-14  60  		     : : : "eax", "ebx", "ecx", "edx");
449aa906e67e57 Peter Xu       2020-05-05  61  
45981dedf555bd Paolo Bonzini  2020-05-06  62  	/* DR6.BD test */
45981dedf555bd Paolo Bonzini  2020-05-06  63  	asm volatile("bd_start: mov %%dr0, %%rax" : : : "rax");
3670a5472ea048 Xin Li         2023-10-27  64  }
3670a5472ea048 Xin Li         2023-10-27  65  

:::::: The code at line 37 was first introduced by commit
:::::: 449aa906e67e57636086967bf0edc1328fd0ca9f KVM: selftests: Add KVM_SET_GUEST_DEBUG test

:::::: TO: Peter Xu <peterx@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

