Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A91BC2A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739029859; cv=fail; b=jCQPkptOS4K3M6h2TT7PLUaw6lT11aGJ+JajIF0SLPzaZnwtHP59zkaTyyRe8LHK51LYc73c/56AmlmT3kIKA6u/i9k5ZuJjf5WDdo6uChj8dp4HrKoMbWowyqg5HnH+FthGP1LTUjK4i/JWtYa588992bnLp+2Rgsuuu0/RT3g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739029859; c=relaxed/simple;
	bh=7WWgOtrU4KU/OojOGyZ974e1e7Xfn8RfGBh5K69xbAY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=nyMYxjgS2nGjCnDzhKy0kyWss52wpB/e4KYdgtLNMOhP4aArUvgDM5dy+PnFjUEe4CI5yhCffoGt3AQYWJYttahvHRuy9Xud1TicqiLWSttKRei5hcOGByZ57QT9l2Uvr3kqNbYtoRV49lV3qWA6rC+XRqcvQEupaINq1Wkdl7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnSnAU7P; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnSnAU7P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739029857; x=1770565857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7WWgOtrU4KU/OojOGyZ974e1e7Xfn8RfGBh5K69xbAY=;
  b=VnSnAU7PNbXnREYqo3d5imGf7VDhg69B6F70ABKC8lVdCs39QMZxymDq
   y0+d/c7A27QNZc1ARI7x9/TKDkg5ss/an5O3URQ3iqZEACimX1vRx48o6
   xHJwtYoFblVR4STY/QoOsOUzVhmRYB3jhZtw+qzDqxPddkBaL/uFTauJK
   MWEgdBb8AvxS1w0tMyPPjoUIrkNhUdzCjJpZlIX4lKLQX/qfVn9FDLKss
   jN0rAoZBq8V7qNGwy73QL9tVr7nJyP9jgiJ3rJ3QkMH185idI26kJPZna
   UAyqMkhUcWyCGww5FcC7+gya79mVx3coeQKQSs+nLZnoAmlBUO42diR1g
   A==;
X-CSE-ConnectionGUID: NcFAiWMISPqn0P7I5zdOfQ==
X-CSE-MsgGUID: n0nODbcDT/y3BPRcZf7b6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="39527745"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="39527745"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 07:50:56 -0800
X-CSE-ConnectionGUID: ZLMEqTSVTya6TD08i5iEiA==
X-CSE-MsgGUID: QKLmIi5eQwK2L9PhpkhNoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="116800925"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Feb 2025 07:50:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sat, 8 Feb 2025 07:50:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sat, 8 Feb 2025 07:50:55 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sat, 8 Feb 2025 07:50:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DaKVU6mVSpdXKpI5D8txWJlBm7WzrjBsMTrVNZA15470WuM6VQYxP06Wqlfr7KR0ZmG/fDvQKSw+hzOmqRp6YzQVWvTE3Y6dp6i+EWkw8C7GpEuNiTmil4EMHlooKEZK/rfh8GTO7kJuSQ5sXR/D4M+S82oiwOoGoSsbHBIDQsixuMU8flo7SGjd6IjvLIw60pojEvsDVJ6Tgb2IsgGA+2ucQONH0d9gTJfIFwCyizeF9xh8zQbebiQWZ0GkAn9/SHh+R4gt63Ikzl4reE7ENrYQ0hde6fuQ+tJ8/lzgtZ9h2qr0fxPMZMmySz3kQot5ko2LB3jJ+nEL3zePzkIuTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S4FTwq9HNkaRywG2v6HscLVGhC3YKJItdBDj2JJZ7aE=;
 b=l6kEZtWRINDgKBEkB+hby1tw/jAYsZRH4YGnmK9W4LBhoqyDHXp1XdeZ/vldnedCScMRQnLPvjDgVl3X4IJ452OrWBN+z6OZGL4e7Z6n58/3x54pzufvBpbmQVJ+EWfoEWR8ih5QvQ90E+CGAYpypqiKtF1noQELhRZ7dQjmsC/072zkiGhY2eDhqkuvUhW2NBxrPF2lR0psE7H9BKLqjRRtg5Ex9LTlwS9m3Zhx6hJHpL1GX6LITeGOUFVWhjgosv3tOdrbaj8D3z707t4ahrc/Kcn281n7cVSgwYqWABh7JBQqbz7SwQDf1cJpyIz2EwqccGVsYuIB0OvUsVs3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by BL3PR11MB6364.namprd11.prod.outlook.com (2603:10b6:208:3b7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Sat, 8 Feb
 2025 15:50:52 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8422.012; Sat, 8 Feb 2025
 15:50:52 +0000
Date: Sat, 8 Feb 2025 23:50:43 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-6.1 3/3] WARNING: modpost:
 lib/test_user_copy.o: section mismatch in reference: (unknown) (section:
 .text.fixup) -> .Ltmp1 (section: .init.text)
Message-ID: <Z6d9U8tzk2s4bASS@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0163.apcprd04.prod.outlook.com (2603:1096:4::25)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|BL3PR11MB6364:EE_
X-MS-Office365-Filtering-Correlation-Id: d1d53bfb-4739-498e-8b7b-08dd48585d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oF6VAd4kG0M5uzJEp+Tov6Ojv27/m7uypQpnY4WyDM2xth7rxlbXOL4+5oJg?=
 =?us-ascii?Q?b6MlRGOF6lbha9GeqN2WwKquJsH/rqXots1oAs6qe2CWK2ZboleOPh65Z6Om?=
 =?us-ascii?Q?DqnVrTXAeiwfN6cxbIF3K+RVnrD7AuNjxndx3RDNNkpsCuZdTRW6roPy0nvH?=
 =?us-ascii?Q?53w4vTYQ4aLbOS4Vm2F0JWVfkmiEwWEyLXVKsZFI1PA8OFTsKI/FZvenfWRo?=
 =?us-ascii?Q?zXY4UyNrlIe6Ue9ed2C0g7L268d+hwuLYkp2Mhuw3qZXXb5BX9KDR7SrzjKS?=
 =?us-ascii?Q?j6qkB/+WjtLkE+NqnoEYV8E9f19rtJazxphs6k01lfRsBXffkkcpNP+W21+4?=
 =?us-ascii?Q?vcUFndL2muLekBzyJXItHk/J+/T0GECFH+xoS5IyVZ84heP6ypSHx4q2Cj23?=
 =?us-ascii?Q?a02pNRHl27h5eryfKPNODyFSN+RFW3Ppj/rYtVLNZ4ohPrzIEfaK1Vzr+PYW?=
 =?us-ascii?Q?Fm7HLeolw3G/2TU+R+gq0HmYRF/vCYYYEiiGShlrjZR/zoRQJlTr4zR3GqlG?=
 =?us-ascii?Q?ofB/rSb04hSAY9ffkz53CmCeBVZocDOaOjiR37Bex80SJbIX6jQ8A6g3MpnY?=
 =?us-ascii?Q?hb78m0n2EC0MpFAEnOnHAb+53E8kBwFU54B4+pF8Y99gQU82nxLisU6onJ5k?=
 =?us-ascii?Q?YLbeOVODu4F865GdAuTTM7W862MNbZBVwrwEBNWFvcr2LTRnMcHkn59tQILv?=
 =?us-ascii?Q?j8+rangFQZRBR0Zd5kF/Z0Zr2TOgUgF+Dgo78ZG7C6zzomDgu5NoOEWnzVcV?=
 =?us-ascii?Q?27tWGsC8+C6JSLzGJ5w4L3SbJx/b0gJCYDiBqaH7rb4rBjh+7YqzWMXdWepQ?=
 =?us-ascii?Q?xXWjW5cRiwpbUBmLwFNIA6zFvHWGSj5Cik9txH0OqlZmY7Tzr9l1xzQM8kd5?=
 =?us-ascii?Q?4GxeOTiR2Hxdk8hSj7g49t4Kd+DUl1Tf2LvQfPiRVCDkJbpHEXu3NeLWn/yy?=
 =?us-ascii?Q?mhVnI13igtNMs6EU4V7E517nkAAQzoxsvVtOnWt0uqw0kX0w7XHQvXotkHXg?=
 =?us-ascii?Q?2V8uAbWbQfFPTuG36PDKcxF5/NDeJvImMprYRQT0LCB+0EmkT4LUV8kPdg2p?=
 =?us-ascii?Q?P2lAyLSkPHsM4vK+TqvYVixj06co9WaPqNamkl/EL6gfCu8Zw1l+YYiHPdzx?=
 =?us-ascii?Q?ZIVB9UlPnexipSaF8j0qa7GjCTRXLz0RrtmGHA+9gBVTrM3g+fl1sDo05bgU?=
 =?us-ascii?Q?FzpiwfA7OttWug97/SjPXaDMVT2TTqWa0baZp589U6fw90G/V1SypIoSwkSo?=
 =?us-ascii?Q?lqjXSd801lzPy14UyWNU29vTMGQjXhxESO1mfntniZnZdDLf8NIR/K59RVg/?=
 =?us-ascii?Q?XOxX3TVy7qipEUUrqH+vUcI+/laW7nU2OuyPOUdEc032qw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oOGB7uzdtaiZfYLBDhxeza9+wetX+3Mpt2M0YJ7/LUA4MxGdcNanamayN+wr?=
 =?us-ascii?Q?JJaRO72/FRNfHCDMECrJQ6mrBCWFTnjzT0BaiNOCLX06zHCawSFwtacV+ONv?=
 =?us-ascii?Q?tX0R8g+baSYZNYTjw3pDqHU/7uXfDusHjykZM5nFOAu/e6iWNTbLR6sDg2up?=
 =?us-ascii?Q?VaseTCUQ/CIeNF/LI5IbQhYlR/ML853PeCgsillDQevPVk32fYOPLBPdVc8l?=
 =?us-ascii?Q?M3yiRdHwzgfdpPXl0anpX4nmqmO8OGN16vRBdifL1kfvWEycHFICmkQWuXj5?=
 =?us-ascii?Q?WoBAqmaDCvMuhrMVK1wss00FUA7ZIV7qsycJH+4J1jLKmvxHeb7uP0Bvk1pG?=
 =?us-ascii?Q?PagxCeyn84eSCxOX+PeHgVYytOHfhETZro9sBLwWSmTHL6ZvXYHCYfZGyJwp?=
 =?us-ascii?Q?vBhhyESy3b2gBoNfYPX+0xcVXiuj9uP9Scw/pwrZd8vU8na8nyzfPJ0XEYEX?=
 =?us-ascii?Q?9hT9ec/A712jWOw9K2a7X4ZDFx4KhMLYygkp5YjJZnjUW7rXQS8BMduyU01L?=
 =?us-ascii?Q?FXBI8NoZQYX5BvjXyY2Busxu7pAxtv0wJbRR0TWOjI11VZLfDHSp9Ylu5XOF?=
 =?us-ascii?Q?kC2WSXhVyvbW6uGPqDPu6lx8wGgsHS0kdEd5gJ48Nhx/IjfCTAsFP+YdjAAa?=
 =?us-ascii?Q?jtBlcnQyhKaLNk+/7GtfBUtLTkOT76lY7nVuAaILMGNMi9dPmDsVJRid4B+L?=
 =?us-ascii?Q?K3M1n6BNUYmloDNUyH2xGkbSnle0i4iJjcHEXteC+YIEYUNYM/FBTFqD9Q4X?=
 =?us-ascii?Q?UZrX+GmQBizm2cysH9YZEmIFSv1wpaXKOvpKLHaHD9ByNBXDdYXUhrIvgNLO?=
 =?us-ascii?Q?eezivvSKr4SJrScSdJtDL3LP1Q6LwADUZdqAqryn4AcqM9mTsPADJ9zetKhP?=
 =?us-ascii?Q?V2MbTi+RoYDJNUxhH6QJnzzkTtRxbBdXhlyh4Ll5JtuW9CNvCXMECCVrTpb1?=
 =?us-ascii?Q?B2jVKWY23NbZ3tUv0qx3DFJWWmuMpraX+OBV4NGRwu3P0fxRtwEOrlpFAHFf?=
 =?us-ascii?Q?D9PTCkyGLTciWqAxPJ4VzcaYGVNU4ZrdiwvIjEpWjdCIXfkmggMGJZKH+jEy?=
 =?us-ascii?Q?idiFJzngLDvt2LJsXvkZaPsj5as5OGHQmWR2Ipy5KAzJFw+kpS01BUS4K4nW?=
 =?us-ascii?Q?+IeG0LcQLQiTLdVIH7CPFvIiQttQPzHpbSrXxDe6VTP2UgZfFleD/3AuaElp?=
 =?us-ascii?Q?r/xUTrlHsRnJxK8Cci3ob2GyHs+GdPk798FGM+HrMAvqW5c/EYnb3ENzhsU1?=
 =?us-ascii?Q?PkFVkID+xjEgJwTdECpcwncGQDLcaDEULbjHBDE724pIIAx+8J/LB8F3IpU6?=
 =?us-ascii?Q?DxAp1IRGI0Bv+YleNA2zEBhGDQiChhIn1Lv4kOJUkY1rZFUBovouhfNRgMTd?=
 =?us-ascii?Q?UApy1tb3uRSZF8gdudorUpwNYb1tqsLTiTffnlooOgr9KctPi5Ky8ovlv0bm?=
 =?us-ascii?Q?v6rOX1ZSbiGue/mKVyummX2Sz27vJXaf3/2lH3rQNEX1fJV9VmJFlOU9OKzG?=
 =?us-ascii?Q?VkFMP3c0PgiLV8x1ZsmdSxOzt3iBYnBuRujAjZXeaeNnXZFiXoYWynfzLGPL?=
 =?us-ascii?Q?C0h4rPpsQpt2Mm6O6BeilwfzFB1PLzYv52fb6Uqf6cgFKcO0xzsi/ZqONY+H?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d1d53bfb-4739-498e-8b7b-08dd48585d1a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2025 15:50:52.0666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pq1nPRg+XIzmAtxPQDg9qXogaSZQwKyElyRw/SVwyryeTO7DtkkAaMjSjiSg8qaxon9QxG5zejfRBtTu9NB7Aw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6364
X-OriginatorOrg: intel.com

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   1ac09f5c057146455dc10fccd52a8f5f34039fb0
commit: 36fbcadc208e968008ed3ffb89cb2a265c4f276c [3/3] modpost: Include '.text.*' in TEXT_SECTIONS
:::::: branch date: 73 minutes ago
:::::: commit date: 12 months ago
config: arm-randconfig-r053-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080422.YsrV7cyX-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080422.YsrV7cyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502080422.YsrV7cyX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp1 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp4 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp7 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp10 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp13 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp16 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp19 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp22 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp25 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp28 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp31 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp34 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

