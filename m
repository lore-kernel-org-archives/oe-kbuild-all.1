Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0521DFFC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Jun 2024 14:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718288603; cv=fail; b=pxEGgxj32m7xjNzJ2Edim+nxx6MrXwqEQFJZSpFLnXRxRTCz+/WLfz/OVsZw1Y6uIK/wkVg4DIx86RUX+o2kxbosM4rjFKg+bWe7Ra8t/a2MJ/erdDMFZoR0PpIKfD2Bir6eO9fAmS4kAWidNGWLQ54UXuMuzY8QHzyROv5YE9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718288603; c=relaxed/simple;
	bh=pJ6ehvbhdMF3Aa2OlIqfSqZ7oQKYAKeafcizD5njE18=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=GX/bovwUyLVMwRUVrCacCop7oq0wEtvTHU5nCwK5wtSqKwIt6xibWrJ1wvclaOQ51Iu6PZQsKHK7Ns7Gk/N0TYd7HKDgQU9l+JtOc5dtXdNzz6cnSs84QLWVuDS1Lbtv+oX2K+Ja+B7xZDBhjObiw13MmRoBM6YrUabTMM5jeog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QpiKYhWQ; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QpiKYhWQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718288601; x=1749824601;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJ6ehvbhdMF3Aa2OlIqfSqZ7oQKYAKeafcizD5njE18=;
  b=QpiKYhWQV3+GzYdNvurLmeFDK0yIkTSffzTQ6EDYiiN0MlU+ANk5sQnM
   APNKrXJHfmkoFNKC5Z02wWAkl9u6EysgEkNVCgVLQKZywze7blRpG3S0x
   0jxAnGC1fuN9wSy/gTUZp3uyr0WKkVeJwAXuJ075+KYyTUL2cEtvkva3l
   OG/OR93Fitq4fMAW8fTtlGjalxezHKYyAw8sFXHht6nnz54GGCHPRLtK1
   dN9m2yVh0m5xnQwRbbwyNTLj7Qlc4jvt+/GW0q518Sv2eWqfinr9H573s
   14xl2SmEzaz04tW6OgSEKf19OVo5lqcYhnjliMq5gw2dfuGr10tGtIY6Y
   w==;
X-CSE-ConnectionGUID: xmHQvjcCTE+udD/6Ne4+aQ==
X-CSE-MsgGUID: PCNJBSc0TwKXuLfJ2viO4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="14941587"
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="14941587"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 07:23:21 -0700
X-CSE-ConnectionGUID: InZUeFQdSpa6LqlI3c0hBw==
X-CSE-MsgGUID: xgLcoWAsQEuqk9Pblp7C9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,235,1712646000"; 
   d="scan'208";a="40118748"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Jun 2024 07:23:20 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 13 Jun 2024 07:23:20 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 13 Jun 2024 07:23:20 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 07:23:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TklUDKgp0plPq6Ft7WcArKb6gzzlOt3D35XrKVwRM9C1JEhNyfEHI2NO+QR0V3qt/KvszViJCQFRRjdtsjSCeFL/iv/uoKKVZUaWUSvZkfCcZgK9Kxuh353ypLSKJw8fbcm6eNwyag/gbiQTBcGbjH/VTqRTBBy8bCaZShBwi3g4bg2PoYihMM1cds+o1t7iiS+4lW8ZHg7StTTEywayTefdD6XRTLGjd8W25hssaLQkutMmmxhbY7TKEbW4qBQx69mBuHIPTrHVx60wVCz+UTYOpmP9UxrQNYy6Q2RldAHur9dTJmcY2vlBLGwVCMWk+cDh3zAzcNh8QuuF79xA0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1WwpcSfv68Lr2HHPaQcMkowPA3sEkLDGW+54qdOh/U0=;
 b=DhNhOQ7zKGQ9M/QjHHckO55SY/nKkK4zEmcsnAbsp0AVjj7lRt5InhBAlPIrSasCJv+rtP+4GIhVBRsc/csHtCI4MQLkjVAgqVDYG9QJROziXvV77GfBUVNlJsPAi0pI6VrxvfokT6XuvRxtIjrI/hoYy6z3akjRAmiPdLJXlKLQKOM5NnrDima4jQo1I3jdJ6XZDkl3Uw0UHzVX3KVckg0MJfE/l19vmkEmb6zUl4AVxR2fMG/3ndX07hMjEF1tLZsXovtY00p+KXoRyGfem19uCgJTHKUWOuQcbE82UZahIghkEcwe7xZ/cAVx8vNt6mY423UnDb0kdjA9BeeSkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.21; Thu, 13 Jun
 2024 14:23:13 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7677.024; Thu, 13 Jun 2024
 14:23:12 +0000
Date: Thu, 13 Jun 2024 22:23:05 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-xfs:xlog-grant-head-bytes 3/10] fs/xfs/libxfs/xfs_defer.c:
 xfs_trans_priv.h is included more than once.
Message-ID: <ZmsAyS+pgOgLhfDE@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|PH0PR11MB4902:EE_
X-MS-Office365-Filtering-Correlation-Id: 3faf6a10-d551-460b-268a-08dc8bb45b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230035|1800799019|366011|376009;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h5SMlPiQb0nkNfZvqIKp8XeJ3w4VTfCJxsJtx2JUzCDQlf65jQK8FFK1lXzU?=
 =?us-ascii?Q?eqAB32MaRbHdMBMbdBJ4/HIJ7yb5W984zIEJeUFZWUmAUHzHJTn3WS1x0lhx?=
 =?us-ascii?Q?y4SXXXP2lJqapw85aMpW6x4DVbuCa2aVoFKSQk6PpEg5ZkB7hUmYyPTur0dD?=
 =?us-ascii?Q?LAIQzvIYy1TgWjPqABcWyP2aTQrECXt4gUdWBn6OaIhAgk7UuWst3CavBGyK?=
 =?us-ascii?Q?lMkyavr8N6ntdNnPWVYQdIdrE0bWb9XZQL95xJz9GRCSXXjBbLaHH5erCwNv?=
 =?us-ascii?Q?G31bto+jgbU2UK/IVDtHobmR0qBVI7rQ+qLpWjy23can3S6kLFwDJS/P8GZt?=
 =?us-ascii?Q?3a++4Lxcyv2U/BMrw3vNxePsx//T6qJ8Y4m0Vk9L3PHD/COoKGNPFTWr0qn6?=
 =?us-ascii?Q?a0ZrHHAobJZ3SrbVRuWwuA75P3oKi39wU/eMDE+1xbgLpSr4IWrUKLa4hL0K?=
 =?us-ascii?Q?BnZIRfKT2fq/VQPDWT19Ba/UHNfb/iFJRvpJs8E6lxctCIgkvZQZ6m0HH7FZ?=
 =?us-ascii?Q?3eOhWOIpGOALWc0k/6rxyEAuManMYnqiB4SGE6qyxaTu9jR+VrkLP/euDNOE?=
 =?us-ascii?Q?KmG0mrxAGWfaTWaF8pcYUpMfufnfMhxv+B8otilFE1n36YW2FpX4mi3oO/99?=
 =?us-ascii?Q?TRWNGkX7vnMtF2YWrv2pifxqiWhmHagNgwNSDQUbMLkv6ZgrVuZ+jxPt2jkv?=
 =?us-ascii?Q?kqx3n32qJLAR9rgAzveVOjGqicjC9vCzOtIr/1C7NKkGA3qt6YQ+I+wm2e4H?=
 =?us-ascii?Q?+2GO6zWGAwnwijQB9JbezvuVv+L0xqmcOkqxBHMBxn64HDUzknbRmhbhHP7Q?=
 =?us-ascii?Q?zfyCeXEhKhYDgwzxUPo8iYfSy/+a3ihT/R60482cB82CCvqxFnPMwM6kDKg1?=
 =?us-ascii?Q?DB5e+q4341GaM2aiyRuG4kW/TaNBJ01f31hWCPi3uRSe9wtTL0BTaQ/NGZaV?=
 =?us-ascii?Q?kZ+T++C4vnp1CZTBGC5ouPXtvCQ7SRMoY8c/jw4G07pbld9P4MLmTlnSLQVs?=
 =?us-ascii?Q?pqg74uvM6BzJ8LY0loxgEYHdG4l0y+s/fcN6/R3uKSxI7VoybeSEkm5Ac4h4?=
 =?us-ascii?Q?bW3nTro9/hQPPvW31k1tez/Cu1w7vFVkWWKMGXz6CVptrCFi7uhoV3KSNIZj?=
 =?us-ascii?Q?i7pXkLRujDussBytNt4X7O1z1tsBzfWoC5vNqpkbc+VddVbH5O/R1GZyiRCF?=
 =?us-ascii?Q?wQHDoALVdVDfOcFaQDblQMaaoMw8oOxH2CMZbDTQTMjSgu75Kjx7Q9R0uoBI?=
 =?us-ascii?Q?rq3p16C724p2o1tLwujKDsfEI1gl8cNNzeED++dmHH0quQAPYFG6iYgxgyep?=
 =?us-ascii?Q?MT2jq6mBSmHk+tE3KdII3kNA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230035)(1800799019)(366011)(376009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m51or1TUHDKr6sPoyRpI8u2Nr4ivQLIBmKYyM2wJrmmbpq+wiifEITQKeMA7?=
 =?us-ascii?Q?aUb9DuxACZTS+x2P/HVfdvIWX2ROK5YdSVYrYnLFq2teb+5R1zDez721uApe?=
 =?us-ascii?Q?f8Ocok41kYsOxSRjpr9y1PnKR2QM3s8454iHqEmYPL0DJM/M673okFWo+sri?=
 =?us-ascii?Q?oPKmVl2AQZ2yt1ujyvpJbYn0KRBNrfSRVADoipUGiGsYAsBH0u2Mi61AtGAk?=
 =?us-ascii?Q?f4aXZfqlMBrkZLU2pOfVB21w4Y6JbXkSiT3CBGvIOmgsSbCHWAWtHGToYuJD?=
 =?us-ascii?Q?beiN/TzgTZYaKGVu4h3jMy1CvxfqPK38PMnD/Mepb3Dxv8rrOhoEPogUo6Lu?=
 =?us-ascii?Q?cLD28e3Yn2BWO+YVWLFXkkzc6H/ms8hOvc2ZF9HUiUq+37q4e1NZtUCr0JeE?=
 =?us-ascii?Q?IkxasS2wZP0a78joSy0o6mNo/B+MQC7cJdd7fw3z/mAjS/nxvFl7aZN3lXRZ?=
 =?us-ascii?Q?qZIWpx1IBa6GP1ZzYrZClLrmv4/2rT39pp9E4FarTCbafdiP0i47kR9Jn4mV?=
 =?us-ascii?Q?H5hOCiIyNkShorSjeEZoxi7YoqNSMDqw1W40vDxlobz1jY4CqZ1EjjI/bV4E?=
 =?us-ascii?Q?5beScwZi/gNor02StuQKOK/PL7l44Wr+VojugHVHG3SRFX3ITcbHmuv+6l8Z?=
 =?us-ascii?Q?K0MNN21mRPLTPaFJ5KJEVvRIsgpfRIoKM3XNS4u+0YO6FSoY3Gvhu+0f+rPF?=
 =?us-ascii?Q?brK1+A9MAcVGdsuOQ+IW2klKTD5zas7hImh3dk/d9CkOyZydKfTsdlTHz4XF?=
 =?us-ascii?Q?/tFCR3EcFn0E0nWIG+E08DXxG7zjIIiSFlx2w6rc40FBUfcrLmJOgeCePgoJ?=
 =?us-ascii?Q?3PhtiIDGMS1ZRapshLubGnqoFZePCtl46ajTy+ojtydZp95gesk6+poIxDSH?=
 =?us-ascii?Q?R/anzSutiB4udjuNltwZjF8ON36s26c4/1vFXN80Z5ojQqZTVg8Sz7J/Q6QN?=
 =?us-ascii?Q?VLC/HjoT+JRI+AKwiNRQBRPfxlMmP8N75XwJWY7TwKKs7zXBGIieQEoUnW6W?=
 =?us-ascii?Q?fNvTlWkVNLAPavn4CoakTgXP2704mbG2yxsIFGlk/YSdW/XSW2DFQqTJa2Xo?=
 =?us-ascii?Q?Azu+jSlUgT6CKk4zy7kf65xxAKeZ/aPkvx+cN4txRTC01QtJDRcoFsh70Lz+?=
 =?us-ascii?Q?yry0OxOx1qAXQV8akoPno75u1EnTuPfetnzG96Jhbqbnt1VUli7a4zPSWUaf?=
 =?us-ascii?Q?v4rEUtmY/3sbH5EFTJ+E9hdMveNYMyA8/tGQ0Xz1LE2i+knIS+5LuKBQ4loH?=
 =?us-ascii?Q?qvi5KlqixcPiFWcfyVRkV/XmYL8pCt/vazbFwkYRtEMj2pZjPo0vYZ/zc0tf?=
 =?us-ascii?Q?OcH/DwSE3l8KvZXLAr0ayFEl+LhWX6xcS8HbnBTG2F4ayYH0IHQMUp/BhRFd?=
 =?us-ascii?Q?QR3nglMQdK14wvdm5Mjebi8hVFkfbo1kykevmHUev6F45l6Sy5mwxtrPQyBh?=
 =?us-ascii?Q?C8Xkcn/A2CKYU8XlgBnqSrKF6p2RfqOuMEDjvJ8OqPTN5sB4eIduS+zSzeiP?=
 =?us-ascii?Q?X3HH5JLehcQDbSrXUvLSCyzaLc8TxfgKL7PZVl1R4XwJ0ts24wtf+qphs0Q3?=
 =?us-ascii?Q?SReb/RbKg1vRT7uVad0rwioUpgmVn/n+3isWks3nEMd5KYWTaKqN1x2in02x?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3faf6a10-d551-460b-268a-08dc8bb45b5f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 14:23:12.9261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 560x5V5iKl/+gcfNVJmKkDzmnZBIsbSsQDv525jpvUzTMpLFhmX1RSeWJx3a3UCzp7cLeX041fn0XXGVsl39SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/xfs xlog-grant-head-bytes
head:   aef7177a5c1b992e3c6473d314033a428957a84f
commit: b20f6047961d5e9d0e6f0fed9f3c65c8efd992b2 [3/10] xfs: AIL doesn't need manual pushing
:::::: branch date: 33 hours ago
:::::: commit date: 34 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406140058.5Rh7v9Fh-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_defer.c: xfs_trans_priv.h is included more than once.

vim +15 fs/xfs/libxfs/xfs_defer.c

  > 15	#include "xfs_trans_priv.h"
    16	#include "xfs_buf_item.h"
    17	#include "xfs_inode.h"
    18	#include "xfs_inode_item.h"
    19	#include "xfs_trace.h"
    20	#include "xfs_icache.h"
    21	#include "xfs_log.h"
    22	#include "xfs_log_priv.h"
    23	#include "xfs_rmap.h"
    24	#include "xfs_refcount.h"
    25	#include "xfs_bmap.h"
    26	#include "xfs_alloc.h"
    27	#include "xfs_buf.h"
    28	#include "xfs_da_format.h"
    29	#include "xfs_da_btree.h"
    30	#include "xfs_attr.h"
  > 31	#include "xfs_trans_priv.h"
    32	#include "xfs_exchmaps.h"
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

