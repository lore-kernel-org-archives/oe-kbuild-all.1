Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1238E17BB03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Aug 2024 14:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723474216; cv=fail; b=ljSoBV/kcPh8gSnAvH2xjMpYjsn+ZURVtLkXqWKLZzA6/01Vmxbx3yEQd8ute3aO0YHwTzaJACekCRBUbFsm0IHe9gaiN8YQ427OvBr2OXAnZjWj2M69v/xB3S2Qrdh7sFzyxCgySWCOt2f0rFYUGG5qZruLvDR2uJm3Z96PPkg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723474216; c=relaxed/simple;
	bh=omt2pc5VbQWhvECgyfJtVK1RPTiIM4d7ev0RGigYF2g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IX3bvq0ObpoPjFO56C0AaH0HGXEpDHCl+/tQUOaLRSKNkDc1oZTfTdfJSueqHc+CH7u4r/LW5H9rlmVZZQyX3aBd8auk1dRvpWuZfULOdBYXEOCSpQvDSsrom0+njdrUW4NlT8uHUybjNdyHdM1EdPA3Zkvi9B/Dn8HJEvDQbrk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=THnJqnJY; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="THnJqnJY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723474215; x=1755010215;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=omt2pc5VbQWhvECgyfJtVK1RPTiIM4d7ev0RGigYF2g=;
  b=THnJqnJYYUztrPeGlB1ySaYgZe2lQsYZE2qlIA0h5n6S5mpzLH62lwf1
   q956HVRWkYyMi6iqhJyC2rjT1F64GZqExh+8mgPysbNMe7PS82GMFzH8n
   YWNYNoX1PWFad4pRmuXCGnQgnaszXjRzltHjlGNLTg5TLE5F6M8iyD6C4
   QixwYXlPLSM99yFSxZogS6bZlz1QQugo6dq043rm9eJ4MwtHHA7kBfwef
   RJ5FLXcxLhgJEIi4PmRX3cwV4YuzsM7+MW9RNZK/UgYwQPv2jb7M95fWO
   CqxmqbAG96jrfpIXzU9/ZP6r3rT8rS/eRIvKLBuKoayfddtf5kyHqk33C
   w==;
X-CSE-ConnectionGUID: h88kY1c0RdiZmktD8UITyw==
X-CSE-MsgGUID: HN7HixWIS9e2aBtubO901Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21396012"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21396012"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 07:50:14 -0700
X-CSE-ConnectionGUID: ZzKClisXRC+rvKudU1uS4w==
X-CSE-MsgGUID: UbpSuUbwSBGg+YYnwaITpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="88922649"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 07:50:14 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 07:50:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 07:50:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 07:50:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iycDcIDTVt8ucAkbduZnuy0XypJbzlkv9BSuRHuiR6TtED01L/IHEd+54k20HKMBtmyMtInm7tA6OvFCj4qtiGU/+g/PbnvoEK2OLIwWM2xTKcmUAYQdNKX7YUW0pzGV+mrto85rKNxplVPt3n0OKfoy76GhDt6Y3FL8HJV8a/OLxNhlbm8dKsDCgAJmOoXouKRUCvr8sJVu74ehxFEDJ4txcCt2nonJE2+CReLhbPlQIe5sdfOJ3V/w0CwNNwWMO8HzqTpDVP5fzfGP3N8Z5Rg+d6VcrKhQz0O4MCr2yNfONqEPM45PX/KsvjKjlRX3ufdrT6wCzZ+pRuAbHTEQVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o06N0rTjoS8Rx9HhwKGCX2EPNdgWMVHZqubJnRLQOFo=;
 b=AW7SXCSVAXYHwzBKfgodJcBzd2pIP12d3sUvNIFQ5LTmgXaqe+G5qcjuN5MuQO2m8FPlW2MVMIc/4fMQvAL/LQ8n3IrrmAgR9GfyUv5gUlQxss102Hb1n1AHuy9Bon+xF5y8l3Z39uZFDq8hGxR0qB4yrngdJNVSeeHmTQZJX1bgCWZpuwXeAKgpsrYr/eLzs1Xf42sqRSs6WN63XbOux8R8uj71HStT/9dC6SQAcuwM0af3M8uqQ70ncsRhWCeEax+JweYc5fll8FGeX+9B7J3/4oQyc2jdsKHraqLwhApix14qOmveD8UcprBFua0BGYEXsT2CTiTdi1RTggY9fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH3PR11MB8381.namprd11.prod.outlook.com (2603:10b6:610:17b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.32; Mon, 12 Aug
 2024 14:50:11 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 14:50:11 +0000
Date: Mon, 12 Aug 2024 22:50:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-xfs:xfs-realtime-rmap-rebase 106/114] fs/xfs/scrub/repair.c:
 xfs_rtbitmap.h is included more than once.
Message-ID: <ZrohG2eVdDYtAsVF@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0166.apcprd04.prod.outlook.com (2603:1096:4::28)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH3PR11MB8381:EE_
X-MS-Office365-Filtering-Correlation-Id: 8289fcf4-86bf-4dba-755b-08dcbade1116
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T0p9NJOIisaY1zKDgaxzXGM0tDefyCdL8lO45V0s7glhgOmX90fO3tt/1ezr?=
 =?us-ascii?Q?t0jgy+B1BJfBbQR9N9eCenMCpBBlkwRTIA6aklGAuPmg9HFv0F0/fl05P2jK?=
 =?us-ascii?Q?q9QX0LBx/yM/kWoe3JPkafoG5qdjdmLgN2nNf2ojXWz40CKe5XVznt/L6wpB?=
 =?us-ascii?Q?4HdZ6djhf7OpYsf5LIPieb+WSghgRnVlKvUHNGZMWFGlXtUpBdClbbRyy9+n?=
 =?us-ascii?Q?lC9ssK0VffPfXV7BTIzcLt8P3K3LEWP01Fk74BfCbp4e0BuT7Rsz8lBOF2Bo?=
 =?us-ascii?Q?ux4Cpqj1jrB/iu/yoitCPNMhrurHqMRZAVCp251lReeLZG01rHWU+IxoEsIR?=
 =?us-ascii?Q?Z7MfWtWf3iZpJYWD1F6BtfCQYS+kTwW8t3EENvdAT4pK+bT7Bxu9XU2/YCVQ?=
 =?us-ascii?Q?NGowaR9Zg0SHfbTscWDc7i3GFVgBPz2AoVHeZerBnfxbA402CsssTK4qMm83?=
 =?us-ascii?Q?/7yqNaffpFhpFX8XvANn+TTg1RPCBNmCZlBW7Z7/ACTI6O0kcRtaOLvV4ffk?=
 =?us-ascii?Q?nmlObucVBOfj74voQScYt0o3g9PbZcFtfLIfxnIgVBlx4fhVe2vy9UwxYG1r?=
 =?us-ascii?Q?ZlLxXeLSixlJ9c8qAaPh3Ozj1fK1zajetYOBvxkYdsS6Nes6/2xJvbK3XSwn?=
 =?us-ascii?Q?jGxXPsvKweqhLxZy//NbD3/X468s/SexGX4WM3nDz+Mkp0yvfAvUkyDQwWPq?=
 =?us-ascii?Q?P73nTfz7TnRkLtDXzDQCfJrl/tmZEBO8Oyi9BXohyHJzMajTEPAWlyERt5En?=
 =?us-ascii?Q?KDcwSjuFpvcn/uSvbWLAx2IDzUv/3+h1qXYM3UQUk0ovSt+JeguolcF9ylJ7?=
 =?us-ascii?Q?y6iHBeoiNEd+nyNT5vEufmBLHLgGA4J5TcKXxfucaxhjSpWneVUydufCD1GZ?=
 =?us-ascii?Q?ADI1qXMoqFKoE67zCoEHtFNRfuVtSmhGRyT8sk9TwJN5Oa4Banyn7ZDRXnBi?=
 =?us-ascii?Q?b154Cg6P189R55KmLX2kjzggUeq1wLCrdq0SxfHI+AMmBz8XWpmOttDfk+43?=
 =?us-ascii?Q?yDk5QZ9OyMdGsSZ4Mk3s3a7ok2HyTVhVg78uoWBX/JCamIe+2LjNkepsWZzn?=
 =?us-ascii?Q?3Hkph+gk6OqFJb1kJZN00nzFinwSuQtOyr7kqLSRqN2OK5W+bAzWDLwPq+N3?=
 =?us-ascii?Q?LveDrxhB+Mu3dpJxQW3LD/bZiqy23t0kDg2W9c2YVvBLEt8mO4PkHxkWPsou?=
 =?us-ascii?Q?jDwxWdXCks696OLB0QJwYYc9CPpdVTijFTf5o6c7+AzR+plQlIbtm1StOmns?=
 =?us-ascii?Q?bz2x61fdrAQRQilJ/JI29VjrmcMmBP5Ehc0/NMzmImihLfnuSctoqsggRl2D?=
 =?us-ascii?Q?wYg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ORsK5SK321oah+3hYEc20hiyue7QYtFuyud1JEfTtVxn5fe+WlKj7ARwo61?=
 =?us-ascii?Q?0/eHqXjhTx1ZWsA/rh/pFm98Y296mtHYQcuOI44ui1MA7eBvCth3C0cQnurm?=
 =?us-ascii?Q?JEqLIlnSiilTVUe+pCZ/Uj1WUFcwXgKoUA4EOMb2wPkL2ZyFFKE/lLITxNxi?=
 =?us-ascii?Q?D6uKAPKMpGj4N0xx8RzNEiVvW4DAYtRvC6QLH8DxbJ7mjFr1baPnh3KmKuPe?=
 =?us-ascii?Q?0KWjLBB8DO0Daw0Abiph+Mub1q4I+NRu9bongNR7/JD4PfTy9j87CiT5iZKv?=
 =?us-ascii?Q?gW0zjZkzraW07HGsYKLKGZxqUR3pNzuG5TETfFYfrfpRYW5YchkZuni3Fzor?=
 =?us-ascii?Q?46Pg6z+XzXHtq+cHtSCewjZ0go/1hOz4arNYIrK90zZwfxlrBGLshV/Wduw3?=
 =?us-ascii?Q?V9lGhfCHNIyDMWG8fVHIxGQgQndoi2ooTK7QVDtMXB7Us2N4oFodMnFc7lHm?=
 =?us-ascii?Q?2tcVOduaN3PCInDDsMPIumXRvx7WptmTu+U/ifANlg6edCGKqRpvoTrdHVvX?=
 =?us-ascii?Q?4zRkhWWaQL/WGLduIfnh1paMw04jgyhjmf0Rkcj5aoyPPPagkopzPU7h7r/K?=
 =?us-ascii?Q?TFfV4iJGDiyswF8Y7ZHzqG4y5cczJxNdBJx4pv8l8qxyV72UDyY01kW4ezzb?=
 =?us-ascii?Q?2qZ1ChUTnnYlW00bZLQK6qAtXqTOiMDnniDrPvS/3TKVzdIHL/Pp/nduZpTB?=
 =?us-ascii?Q?thAtOcZ7p/5itfcROVNCNef9dMt7auXC/KxD3RMTVCMGOoteRQzqtMQpDP7M?=
 =?us-ascii?Q?OVZ4ndk7MK7bkBw+1pyZvOlGRbXrfNJ3WBhZ+s1kIebNRDvGvkN8kYjMWAVL?=
 =?us-ascii?Q?queTJkfXMcidRITJitFzxkc7zqj+UoFiRhOK2s7Xl7dXxuH4i4zmultxcRCd?=
 =?us-ascii?Q?vTRsLC5G8105ThyHcqp1+lEM8bKthZmv2dhyaQ79XM5z+E3kw19Tv9GESbaT?=
 =?us-ascii?Q?qJkv9l1SLQyHDsgUeFHztkrpO7S1qd4wsfniane7roR8Irk3GHpELYLfKLl7?=
 =?us-ascii?Q?LQFKY/tkWPFRpXpCVfXyGRrXgXiErkOtr7jq1zOGpeLl0r8XSS7s2DvH+bfB?=
 =?us-ascii?Q?pE2tARYewtG4p0listzbnPaAa1EjxG3WZPYavUE2d8ktcgdBkVuifOhl2WMV?=
 =?us-ascii?Q?kaJfXWqupMoAA0rQHHBn/nd2UgWeoPZyxi/jaXXwW0R8GhZLf+tO39AWsfby?=
 =?us-ascii?Q?pB1m2ROkP0e4WV3ZvPBgomwy+OK/jrNNA4Rhm5xM6xuU7zzQxjSkWmCs4jvr?=
 =?us-ascii?Q?KYwM5crAnNxvby4JTi2f1QpEJ8eY1ET92G47CZxyPOEleD6FN4ud2dq5map1?=
 =?us-ascii?Q?DCl2ASuNJgTF94SmO/vmYEpHS70zbtxFqXqFs/2MbDUoVy8CoNDshX4GjZ8M?=
 =?us-ascii?Q?zP6khKS7FZwzEfzFMqs8AjoGVN+oCFZx8El4sO/U6O7e7D+k5t3OjsmEbx8w?=
 =?us-ascii?Q?nDoPP3ekFk77i26mNMLau3mlIqKWsk7OYXwbt0E3Cid0Y32z4tM6p/VXkAUU?=
 =?us-ascii?Q?he17IPiV1yRPotd8u1s7IuLsoWG72TIKt++6YhQBReYxTxmYYwcGNEv0Jpgb?=
 =?us-ascii?Q?RejAGF3eyrf7M1RqQc/eI2BoUjzMfE2z+fHIQoQV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8289fcf4-86bf-4dba-755b-08dcbade1116
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:50:11.4940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4CNUunnxrlDfZYr8jEHzfm1Xaa6HJ+cKWJ02Sk3i85TvjsM26Zdyhchue31qF4+ThkR+ci2c00QaRlMPIjbFCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8381
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/xfs xfs-realtime-rmap-rebase
head:   d327a47f8c6326342d07986675e149353d5ea516
commit: 8e2ba6732c1c12f6876866642a506ee7c3d304d1 [106/114] xfs: online repair of realtime file bmaps
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408121059.u6Rj0r8Y-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/repair.c: xfs_rtbitmap.h is included more than once.

vim +24 fs/xfs/scrub/repair.c

  > 24	#include "xfs_rtbitmap.h"
    25	#include "xfs_extent_busy.h"
    26	#include "xfs_ag.h"
    27	#include "xfs_ag_resv.h"
    28	#include "xfs_quota.h"
    29	#include "xfs_qm.h"
    30	#include "xfs_defer.h"
    31	#include "xfs_errortag.h"
    32	#include "xfs_error.h"
    33	#include "xfs_reflink.h"
    34	#include "xfs_health.h"
    35	#include "xfs_buf_mem.h"
    36	#include "xfs_da_format.h"
    37	#include "xfs_da_btree.h"
    38	#include "xfs_attr.h"
    39	#include "xfs_dir2.h"
    40	#include "xfs_rtrmap_btree.h"
  > 41	#include "xfs_rtbitmap.h"
    42	#include "xfs_rtgroup.h"
    43	#include "scrub/scrub.h"
    44	#include "scrub/common.h"
    45	#include "scrub/trace.h"
    46	#include "scrub/repair.h"
    47	#include "scrub/bitmap.h"
    48	#include "scrub/stats.h"
    49	#include "scrub/xfile.h"
    50	#include "scrub/attr_repair.h"
    51	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

