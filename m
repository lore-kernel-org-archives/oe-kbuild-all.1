Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC8C347A2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 04:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385743; cv=fail; b=K9vZvmTWLiQrTr/iPhpWgAxh15s3S6doQBTHp1s2BIFvyWshH7Zth+Wa5bxq4Mf/3gD4VGMAE3mv8DOQtCbchyTWSO9C97TzLt2OaFyP2m3sYI2S9s0xYvuM3Oins5VNH+rI2RZaJUcEuHBH69Kv5WKpnMXs8Wc2tQ3X2o5vvpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385743; c=relaxed/simple;
	bh=bk2irR4UHyyol4OEfcL1EGfYhJcCYuEvwKPMKyvwnjQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=r0glIG13wJx9vienRiCo6e3oW/KFC9wRqlGgg4Anjup6C9zfzte61jttTbdpYlhsVeRlPRZxofLtCjoJ5XN/9oZ2FMjm66Rs5ngSC50STUb2hvC40ZgZimyQja1Fm6thn5G1aUKZso+gXb2cQr3VJGTkz5CE8ks+E9PKJNYS3Nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naiR5PJu; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naiR5PJu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724385742; x=1755921742;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bk2irR4UHyyol4OEfcL1EGfYhJcCYuEvwKPMKyvwnjQ=;
  b=naiR5PJu9cqy2efqqqK2kdPBUIAuqIPvkOQ2p4qbyk0rsXNYmrfgVPa/
   Wz5lvnSzDx770qNFe6p3n078/WxrlGnJdjnSi+O3GdBfLqyrAJ+fop2Ii
   dyEUrHQr3NnqDhenPKLLikeJbJJR6bj33/Tve/+2OtzcbqZ1hT9kI3POB
   Q5lHexvaUbEP02TcelNWFemNErTW1vGP1j9Tx9efgTJ3LZdNkSCAr7IdY
   zNgbrUtb6kcOl3xqwQGe+C7u7DmNaSQeUIVaetXMd29M8+PwtN1tEjt74
   /qERMsrzHJTwr8VKzRl1GG895Uu9xBODp7xyLzMtwru+A4AEe5802ACwM
   Q==;
X-CSE-ConnectionGUID: zAOwS9EiRAWtGhj1BtuaSg==
X-CSE-MsgGUID: Ppn3OmcTQji+gWzAkPZT1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="40301768"
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="40301768"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 21:02:21 -0700
X-CSE-ConnectionGUID: CRXkA+p1TT+IAhCnvzE/sw==
X-CSE-MsgGUID: 0F+HzM+OQUGqY4V8UiDY5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,169,1719903600"; 
   d="scan'208";a="84859543"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 22 Aug 2024 21:02:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 22 Aug 2024 21:02:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 22 Aug 2024 21:02:20 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 22 Aug 2024 21:02:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbPPiX5Im4LyDB8c+zMqYPeLvn70C5iQnYIFv/u66DnHtAwNVididvNMQ1KiNxCMkJAp0iPpBXgphwFcKEN9eoYNzD9SLmNrOsEMH8CBV+HQgXeKjW2aGUIOOKctoRN0Nz3F39thQSEce35IBtqKJpvurAz1AcLfivptIpNekQ/E7M2vkxAk+WYGYmUMvZGpjNDNk6+sFIOqlF+bB1d/G7QLKGuMTvlYl12rC9oxPjickuKrOTx1irdtQKWIoNUtbx9xctuGJuLR3wmx5fne3DQl+8iQWYYthMPw4FSd1s5q2FLa6vAm0C7mAJJeIpB0kRhdA7l1GlYhfRcej31WpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loxVIS7GGhX4uUrp8PTRVXWdwewzSibMQDSsVpBYZoo=;
 b=S4+AdUFagJdQMS9Xrg1I7purZXj2GvOmAcuWiF1b2XQLBG2U40rUD9k0EbKhoiW1ozoylxCwIF/eZp3ibrg8AQTV8QYVj5WzB6bsafQ7fo2wfpKMgbnxESVWDCoy1K2/YByZY6G5FYvG5lkExxZuvKmTT1SzDTLaYC7gvmyRdUWtc0jVfudWfK/UB1dIDPYN2Ru2IWgd5mAPboI90RHmM+hYUtPS7R8FFy//KKvuW1iuHEjJCdhYcWV4B/x701bHfBIOozixBbYs7u4PwqJhLb7wpty6+FmZ1eh8Dcwhd2th7any9WPE6awOHbizvzGXSFMXLlg0o0X8Cc0HOmD5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by SJ0PR11MB5183.namprd11.prod.outlook.com (2603:10b6:a03:2d9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 04:02:18 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7897.014; Fri, 23 Aug 2024
 04:02:18 +0000
Date: Fri, 23 Aug 2024 12:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Jiang <dave.jiang@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:fwctl 17/20] drivers/fwctl/cxl/cxl.c:
 linux/auxiliary_bus.h is included more than once.
Message-ID: <ZsgJwc1SvAPzrTUI@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
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
X-MS-Office365-Filtering-Correlation-Id: 756f53f6-6187-40e3-96b6-08dcc328619d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MXTLBsgpQUQQrmtBDkWmYbrVuto+TczH7YxJxqqpjbWSqRQyUntYbcNSqRbq?=
 =?us-ascii?Q?FlIY8BgA+MudQte78VSuiCO2968/lRiaBupSCvWaXbzYIucDudBkMjqFQyDc?=
 =?us-ascii?Q?vc1SVc2CIV6raVGtNuDQfVk7zCFeD0jCoyAYlqHulWKSQFg6wZraGyR3zRe0?=
 =?us-ascii?Q?lLjVObTFbRWB/8HI3t0n/gtN+lYmaSfAKrpZuXl1J/xf06RnVWhl+2to5mMu?=
 =?us-ascii?Q?6AHEnrShS3WW4nRVPX+b+VNO/noQawjbTVDnUaO0gRXN2fCbQ0vsItR/Qe2E?=
 =?us-ascii?Q?GkkQhF1RvtoyihUwX/+i5tWjrhXlq2dNWo3RFsNohayarbJFyoSlrZlXavDy?=
 =?us-ascii?Q?wGJT8BGJs9yRaVtetBKPun9qYJsAA9zskqV+icXkUp7cJjT6R7zA3/bgsPKa?=
 =?us-ascii?Q?rWOXRQ5xH8v7FoOiVIvWhDkDT+gILZMHhFoR5Uz1CYFq3j3Oh2vTwS17lLGb?=
 =?us-ascii?Q?Wbj4pd8Q7znoQOSuHP2vj3BfTRcXHpxhTR1qSOgR0hZJdJoT8x5N5DwpD9ip?=
 =?us-ascii?Q?QdkqmdHbkb0ROJUlYe7tf/nrkgJ9JLDfZXZYKe4eZaRYpkSHtUWPegPLRmmW?=
 =?us-ascii?Q?h1KNDgL0++T+EhxUAYLl6ayfuIX9DDopKe/1vFv7Cw8YEXFu5mVPP2RB9Aga?=
 =?us-ascii?Q?aHhTQU+MMtHhqK8eQFeM2rQiJ2b62QGyon/lp6t9AJmkIv9krS9h1sbD9L5m?=
 =?us-ascii?Q?B6S0xFatPWnuuYyU5nwGlpPZqZ9ntXnlUl6n2190ZzdH4ENMZjF3lcdsAlrF?=
 =?us-ascii?Q?cmyzsJYr8WSnu/T4cPB2YKz+z2aiNIwdHfaWJj0GDRBN/kjy0mD3dH+8UyYX?=
 =?us-ascii?Q?H96uALxtzSPw3G8Ufi5oHIGottL5wofUmDOjhgCkEVswnoisBBn4lP6cOisC?=
 =?us-ascii?Q?Tz9OgK49VX4ScC8AryjMFZX2Mj23kCMCbdqGAqU9Tdroj0frbh7W7ZE9tIPP?=
 =?us-ascii?Q?kyvwI7zDEac1Ta/J7i+H4k2T7qyUHpuTBN5uoktAiWlm3DZjXlFVJfUjwpdY?=
 =?us-ascii?Q?Wjcs57Yj92RWphjkhCgO/6Of4uZFjxyQsIM9cg0x3pNNX9rDXv4YK02jTV+l?=
 =?us-ascii?Q?IV0Z57DSswO+VRXH3v695g3E1UXm4f5MpCsywDiX5C6/yFqTDyk0vAWgVKKv?=
 =?us-ascii?Q?MdsS4Tk/TW8IW1sLaysNtOWsXgpBqTVtxiE5YvCJ4m83/xfUjKWS7JWoqT1q?=
 =?us-ascii?Q?/GYqkJakv+9Ie+7O9GAfFT/AvncaZgQ6BBHaOaED1X5m/Cq5KREkt5h9K2T5?=
 =?us-ascii?Q?GWYPY/blWoHBwAA+I+6PXWfSTQTNXyhrewTLI2Krh0liOt6tUOvzpy6uKtsk?=
 =?us-ascii?Q?ObU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wz0322QEXigqWvTDR+3Ol3c5eX7wr4M5VuyWS1DxdiWuC5C9Ag4263EMPD7p?=
 =?us-ascii?Q?Cw/Dyxf2JXR+DvEpw5y6d9kru8qnpzxiGVZWFzMpdy6dqBCChy9nWaxhlzQE?=
 =?us-ascii?Q?27q3ldUWIYx+ARvg0rVFyHWOa8CnYo7WdUr+EibGwZTXASfoAjpsjA+e/h/H?=
 =?us-ascii?Q?1WiCYZaiBUhkR01xWi7n9u9vTHI42rOTskRqtnMdOCyosB+MaVTIcdKi0Xph?=
 =?us-ascii?Q?5SUG48gI/xiDy4yJuZTNoie1GODTYU167dkqjvl/OawmqOw8vwqbkztjyY4S?=
 =?us-ascii?Q?TvOHg8xQAy8g7N4s47H7AxbF4AVlbEYW2t11HdJslR/i44LPncXmpmi8+fXa?=
 =?us-ascii?Q?gAhAErcf+bNQVCwIJrzzgAU5vu6ddzOI28hE9GMUzlKfje0h217rfXXz+dtl?=
 =?us-ascii?Q?JgjB12b0Sc75KJOtLc+5EH/QBo4Y7aVTwUshjzdiRyL5/m3DG1tvV3WtFznl?=
 =?us-ascii?Q?KDBWHq6a5xEZTb+KCdC9208S6hzwwCtQvkzpfqpTagOwU3wS3lf2Ncm78NhK?=
 =?us-ascii?Q?SJzOgiw06w4RDDBBBZcspVx66XSLsxwlMshwYk3ST5eV74ktE9Pttpr1qb7G?=
 =?us-ascii?Q?EwkRagSxAw/BssjCxgOJZrEsFzpHXi33InyDbTZyMDNykkwq2CM1A0zcSFnh?=
 =?us-ascii?Q?IJ5Iud/4+6I1F7MwSrs/Hehbw99cHFqCjx0wn5DpSeGMxPQ0phWVSy1PKNrT?=
 =?us-ascii?Q?OAClhtJDhf56aKlAyV1goFwwh73EtnGkY/BafgUV/pTltRqwMUrzjabi8ixS?=
 =?us-ascii?Q?tgGg6pux+5a75rW883CJSg1ZbpNVh3i34GGLu6gJRXlWt+He42pckw/cMI7u?=
 =?us-ascii?Q?pFinLFulLuK/LGPPIxd+TxA644GFuwWMO0pWM5r7H3Sz8SlZxvt+ZhqoPKLg?=
 =?us-ascii?Q?f/XH6QNhAX0rczKJtTSp4BRbXsh+vhEV5/MpY+bdfqAzVYlgu1CkaJyOIurO?=
 =?us-ascii?Q?L18RV3k3YTFszzmwbJNKYKip45kBxfBQRGwxUZPEzcshmR1hyow7ghxxBXWf?=
 =?us-ascii?Q?HJcm8u/4eh0pF2AAFukDdsr7hu8o9m/dO2CcnMw91GGyn8qSyd7m5UJdnFib?=
 =?us-ascii?Q?khmSBr4ssh5iFLUOFyBal5i7wiOwHMv6pwKY5PEs37ChEAwKRxVnmVnbKeP9?=
 =?us-ascii?Q?rgEEbk4U00TPhy0LJWwD1GkVfEN3CgU9Ub9rRLf2h1bsmsbpl4gNBxedYfwz?=
 =?us-ascii?Q?3du4hNfouj5EJI/nrTuBrt/01RzGAmunZydSZCawhQB3SpaaHgkCX5v5519E?=
 =?us-ascii?Q?JQJtHssbU6rFDxkr0DJCfKlfb5/Za4I7FaBfgBr5CwLtVI7OHRP4wYEJ5/HB?=
 =?us-ascii?Q?AnbjOtJ8wDhtZ8rVVlClDQxusNyx5VaE19RMvTthSY8npu54r1UKhdQeHO60?=
 =?us-ascii?Q?oTj6pHJEBdgPknEb9NJDE8zqlO6cWKFptwhtmTXZtUvayxA5c8HB5u1ot2Fj?=
 =?us-ascii?Q?99XnlUbUTYtdvSCUjIVHrDoab/4MjlU1Gm5YZEiSnU9rqYrnipueSDPHXdc/?=
 =?us-ascii?Q?9jt8RdKunOuqQNNt7QIxp5nAbiKGf+WdgZndSLALrctyAzKqBBZ+UQv1xQ2G?=
 =?us-ascii?Q?BiElFvLT4+7GGJMFRC6U+9yxXc9H9gvYb0L9D4tV/pnziArzxogJyRWO3Vg1?=
 =?us-ascii?Q?yA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 756f53f6-6187-40e3-96b6-08dcc328619d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 04:02:18.4392
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54kc0VQsIMCHU+5cHTM76PgcHpRFUIq4ASOA8xZSGA/EDF97RhFhoGmbTeRAyYTPTh/d9W/OxWaE7I8V7cEtqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5183
X-OriginatorOrg: intel.com

tree:   https://github.com/jgunthorpe/linux fwctl
head:   49296e2e608f31151e3b5644cf88a65b7f7b56e5
commit: e6537a248fe6241de233cf02c499dfd48ce73fce [17/20] fwctl/cxl: Add driver for CXL mailbox for handling CXL features commands (RFC)
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408211415.ToWENcwO-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/fwctl/cxl/cxl.c: linux/auxiliary_bus.h is included more than once.

vim +6 drivers/fwctl/cxl/cxl.c

   > 6	#include <linux/auxiliary_bus.h>
     7	#include <linux/cxl/mailbox.h>
   > 8	#include <linux/auxiliary_bus.h>
     9	#include <uapi/fwctl/cxl.h>
    10	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

