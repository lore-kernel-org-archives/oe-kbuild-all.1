Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2161DE541
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 May 2024 01:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715564462; cv=fail; b=pptX5Os5t3z2DVrRbzWH7tGvkfbuXKfXNzQ9D+JzPzxpCGA4lXd+4/fPcTZqIuAKGL4Q0Eo6Cf8gG4TkqEL9Yz7vHvdK5xHrRKR7E39tyewZ/H0kyVljVxV9pTOUgjX15uWtklA5S8ojaExy78PNy3ZTVG0hWZoz1JtOUBEeTQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715564462; c=relaxed/simple;
	bh=R58OV7UGBIOhNXBc3iGn04eZyWEb1iSeygTbbmEhtlc=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=al+v5ilEUTak0DHQeUjXz+kTONeXYHlOfVKmLq1F8IWdurIMF6mjFqRrIOFbc3yongYjdFPu1vqUauE7EGOUFnD9TfFWdcDLSXKDHoNTiGjA7guX0WNOSE6SPsNAqRRljj1C041RPizfrbYJknhOA1LvzLzdxroYP42GS+msEzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UZeXaYFU; arc=fail smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UZeXaYFU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715564460; x=1747100460;
  h=date:from:to:cc:subject:message-id:
   content-transfer-encoding:mime-version;
  bh=R58OV7UGBIOhNXBc3iGn04eZyWEb1iSeygTbbmEhtlc=;
  b=UZeXaYFU47b+AnBPni7NusGcxagl3BF/ms+d257utVdsfwNhqkgKbWkW
   k12Wcl9CmEj05QQKI29NiN5Ryprk+5CD0ge7ZhA2fa6scy9ZLKpcMZm8/
   DSI5TjpqN5RQB+xgL10Zj9QFzy+KhSo/F/kL1ZkMiYBESHORPAeNbxita
   GWaJGjgncN42aCXrbL0t7jKMbmDzID3no20wne/T/i3dUZ6bMWq7T6GxP
   EyvhItHpOp/JJGgUQ2HMeMNNdMLAHmfo7lZhh6eg74shHPvt15HigMxX4
   KsAsZUTdzb1rdJx88P5DqfUdxuF+G1ydm2nUXzUvUDVziz+Ns3PTr5zIs
   g==;
X-CSE-ConnectionGUID: XXZftDw5ShyIQriIKl0FHA==
X-CSE-MsgGUID: /kwbkQrqQGS0oP9BqnjnbQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11071"; a="33992542"
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="33992542"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2024 18:40:59 -0700
X-CSE-ConnectionGUID: 6OReDJhiRaiKNskkCpCD3w==
X-CSE-MsgGUID: FXY0Q11OReK4bvaGL8BIuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,157,1712646000"; 
   d="scan'208";a="30746838"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 May 2024 18:40:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 18:40:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 12 May 2024 18:40:58 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 12 May 2024 18:40:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 12 May 2024 18:40:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG7GEGBKWLHtFYDJaY+w248xckAqsjLthrjyABUXhHKgckEHzd9D1CiD91ULpjjmcdGofqm8xYaZA6c0L6hXakkzWB9GKmdhJVoQEUL8TnNzfLi/Bdmqw5AYvT5rGv0jzE9PGNL0ggjordz9PEzH47ERGi4W2mPlri+5WFrmm3IxtumWsJ7GAzaIHiBcQ9VuI3CHyXfv+CFN9nJE3ghyKTqRD3h4mR1F/x7vlzl9IRMVXmkmoSWNX0YR1sqTe4AyKiECUj5U8cbg73f+Q4jcCABK/fkMpG/KxtBdyTfcbUFa7pMi3NpFBaDlBMRtfOgZGbvqDwMBa2Mq74GqXQk/mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ru/G0clLCu9BpcdeyvdvSapiufTOxI+SICoYkdbH9E=;
 b=Bk/xe/VaGgoYGkT72fKSGhfAHx6WJJQwyv720BJuoCqxqspWqtHrMJ8OhigzB/mhk2aN9dFlFvextg6p5U3YKkY7dAYNP/WVX501gyl0uULu1BKE80P5JLDAq+ausB276BWaBvqI3jetVLhQbX2/yzPEILVJjZ+UwQl04rB+0J+VvZuoiNroDq2QDpYGB9SmkaBhT6BhRRt+cZUlTqvUtzMPd6VhthF0/V0brWn5qLXFownO25IW+Lc0dtf9skVFwiTvYk8ptlR9mWcy3nTSpQVDFSmCQpQw8Aovl72XNGubHyh1Qmad2RkTENk+9dr9vwN9oTMG6zapJBy87bLwtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by PH7PR11MB6772.namprd11.prod.outlook.com (2603:10b6:510:1b6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Mon, 13 May
 2024 01:40:55 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Mon, 13 May 2024
 01:40:55 +0000
Date: Mon, 13 May 2024 09:40:52 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Edward Liaw <edliaw@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>, Shuah Khan <skhan@linuxfoundation.org>, "Muhammad Usama
 Anjum" <usama.anjum@collabora.com>, Mark Brown <broonie@kernel.org>, "John
 Hubbard" <jhubbard@nvidia.com>
Subject: [linux-next:master 12023/12533] ./../kselftest_harness.h:54:15:
 error: expected parameter declarator
Message-ID: <202405130312.R5mxIDyQ-lkp@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2PR02CA0043.apcprd02.prod.outlook.com
 (2603:1096:4:196::12) To SA1PR11MB8393.namprd11.prod.outlook.com
 (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|PH7PR11MB6772:EE_
X-MS-Office365-Filtering-Correlation-Id: 782917ab-4614-43fd-1984-08dc72edbb45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RBuU6choaLSPUlxZ++cVyMuGLNQZxX0LhBbDYZ7wHft0EBiV5EtC37eYCp?=
 =?iso-8859-1?Q?jeXx6KkU+FcXMCkcU86uP7Y7n8wLuJ85sj3SaL1x5iSIgCPGm7Z33TkddQ?=
 =?iso-8859-1?Q?sWLh8ruVVJ+r9YlZVrZ+8LmcRhgDaM6MEclZuv4VwzbAv3nrRz+mMEaeex?=
 =?iso-8859-1?Q?n7580FjITqW4v3EzPG6ZEGhFfTxLV/QGAzlmdP8UrJhl/BSye2afqlHND3?=
 =?iso-8859-1?Q?mLMwG3rTlEpzdxeyHux5CDbJsSMwRvIl2rwcU3gbykZZ2AVoDGduXAySum?=
 =?iso-8859-1?Q?E/l9Em9kEgxwyHtF9TYCnZ1hzmP49gIDT+/U8A+WPOwOw4Dc972VDIFyqw?=
 =?iso-8859-1?Q?gelEjxbw1igOjJzIm72uxgjLH5FELe6e2/iu4BQ6AxblZ9PiZHFbvPa3uf?=
 =?iso-8859-1?Q?eypaIVO3zvTIhVaBqPPJjZehyK8Ovb1zJHwCnkNb882VtTn6tWF9KWOd09?=
 =?iso-8859-1?Q?lUZzmUb1qxgPs5wIWswd0tGPoO6Y/C65whUSE/bJJQXWcKgRNadwg0h3ds?=
 =?iso-8859-1?Q?siLfWP887Pe+HJhtNQbo91aeOtuVTwVi2H+q2+Z2YpBU5MvhQFGCR5CGwV?=
 =?iso-8859-1?Q?WK5qUJlBFpT7qo3G2TTOh0Ffw9SSqvMibdiUXXWT8KTbR8G94gepxMOzG1?=
 =?iso-8859-1?Q?XQapjx42VPe5VE9lpBfHXO7jDWfnUIUXmDP80u0WA06LtWbFG/Osi0ihHg?=
 =?iso-8859-1?Q?HET+3VlqhKx6GqV9G99n5elsEyvMl1V0tjrxfItb74scCgMNFLIUmsSVUS?=
 =?iso-8859-1?Q?hOPLHhD5LLH5NxERtl4CtSCNyOiEvGVbPG2YBv4pbRU7yZ1KWmYGknxEwW?=
 =?iso-8859-1?Q?FNLuT5XZXpTUvbM5WMdgZt9Rcx90VeueKGRyvT1uzKL4JDff2duhGxjYrl?=
 =?iso-8859-1?Q?88PJN1k0dz2cFyAQh9StahQxHAtLuadWJbqzGLROBnKm/CVK4oLnT7VAYk?=
 =?iso-8859-1?Q?Kvtz/fgmcRdp7y7OMT6ZpCQLqNSQ/zGTdsubER/l4mVIet7JGLwv8D+2hJ?=
 =?iso-8859-1?Q?Efztxeah+I27tYxCOFG+0/CPpLOsH6VsNA3KD6Q4debOiNdewcGrNKx7IS?=
 =?iso-8859-1?Q?3mkao95jCAvBywXX/OHCgtuZYw3VANATckAzJo80iNRpBT1XHjvTptI6Ww?=
 =?iso-8859-1?Q?NqKiRsJ4EMfCxkOz8n3hWe73+sHnySxZ5BeT6g/Iz13r2IbVVxXMd+m/s7?=
 =?iso-8859-1?Q?3UnyKh1mgFmi6OkSE+ZPisAYDweTvAmrCA2yBQ7GHXoBrf1ejeyZZMuRrZ?=
 =?iso-8859-1?Q?K9fx5zUdYkf4iy2a/q537DjabsHmX9o37TafYsEdk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bjtv/LLR6ffUsCyX3zDnCP5cvPqbTxNIhAZdGQPDh1ASwOWs3dnPpqchFW?=
 =?iso-8859-1?Q?Y4r3Si9PaEA+bKKOUvXrmvl7N35zhKkzXPvnUBrsnSHESbTZFWEjN11a/W?=
 =?iso-8859-1?Q?vkCQFPfWyO1gcf5ALfGl6kIShG+jYdJukUjJeNwrHjJjzn5ldkOFBxw1YS?=
 =?iso-8859-1?Q?lVnMUQ39RjDwsTrOooMRFPjJrfO0nOSJuiecOI6nodDrm41h2u31S1/QF8?=
 =?iso-8859-1?Q?XQQNe8zHtoWAaxv9JUiiwEnDfS2K3NgtTfT4ZXcBQugQbOecL8TgFavWWY?=
 =?iso-8859-1?Q?FHyUlHi4dtP+dClQ74armZEriFUyJa76P++QeuUuR4DuaL7qsDAYmjQM9b?=
 =?iso-8859-1?Q?2N7PdWR4+PCuCHMGl2SHJlWzL4G0DO8BYraVvhKUOnD508rEXiJaGcy/PU?=
 =?iso-8859-1?Q?t8Q5zto6sr0JtksX2/H7/WBkbh1m2/2o/+buwpLv7oyB3nFRIyegO4oS1w?=
 =?iso-8859-1?Q?4nc7SeWApDaaVnAVdUCTDS4ViKNf9zRDxOeGic6T0WjUkAGmnXbMhd09Fr?=
 =?iso-8859-1?Q?dr+xzr77FB/Qeyu5zdAew2Pun8ne6zZavoZCDL2eC1SvVuBNw6rkdh0kMY?=
 =?iso-8859-1?Q?4KHVsRlRX0hhg3AKVZFDxxP4nFfx1+eXWE5MiFbNJQyDTsbvwqekbw2f2y?=
 =?iso-8859-1?Q?xTYEn/2em4E1nLAu0xXNC58M4McCNPD0QwE3zDq5D1TWcV0PYEHEIq3ore?=
 =?iso-8859-1?Q?p79EIs6RXovDgLq+UycHWrbV+TTL2pfLAaHbAziRKETAAx62HJ0yWT1HAZ?=
 =?iso-8859-1?Q?o+u0BZZ0rNxII3oq4Q02dNJFhaiQJnCyHrg2ExtyekEFeen6OM4GBEyj4U?=
 =?iso-8859-1?Q?+RYJPasVEpz7yvgs7TuxIN7d+EavmWmawGQYWN8rN9lzbAcUroJrGTr+J2?=
 =?iso-8859-1?Q?RGdPOvDtRWCnjol63cZwFpROSd+WcAA6DYU6KIqmXZxNPZ5xwIrP2EcBus?=
 =?iso-8859-1?Q?zJ2fJGMNhudeHBSAfGeWbknKcRen5lpXDg3DbCWGYVEO+Rkdz05hPJcsIc?=
 =?iso-8859-1?Q?w/XSY5vtWuCkouQtpwY437AXLbdlnRlHE/+CkbC261BTYAB+GXKdYDZWcr?=
 =?iso-8859-1?Q?dboHIp9wRni+pqnLPDcXActgXZDSTKvTO1vfmTOyS2LAX2wCQiU+Ci0VRY?=
 =?iso-8859-1?Q?YD+nQ7mIXz/IV1KXzrieBupSfl4M9v/dy+EfF1GqpV8sWISDhebAPqo60f?=
 =?iso-8859-1?Q?Axmnz9h5iOW0t/dgDSnrI3vwwTnxCFtPURA6reLMG9AkeUCJoBDng03mFg?=
 =?iso-8859-1?Q?T4RLj27woRz3mn/JmqUicwabpN4C4/fO6qMFLLKyplkKzLUX7s+fyG+Hso?=
 =?iso-8859-1?Q?hUqDmWq+t+MBBFFead0QH7RExA3GWSFulTtxIhIv/ug7znQMGYSrGCNJwv?=
 =?iso-8859-1?Q?xDwpigOEN+HVrbYPxByTbLJfZlxWJq581XBEZPaMxOUFGrXL7uoWdrE7iS?=
 =?iso-8859-1?Q?5XWS3yfwXe2AcrM+3oS9ASIOCob8x9HdlITrcnjCZhfDd2IUKv896cxWTD?=
 =?iso-8859-1?Q?KWEztLm1+1Ywe015LJQlnyNbMleLd9JkwCTrIkWAOLYUP+aqEZx7pUGiZD?=
 =?iso-8859-1?Q?C5tNTOoGU+sOI0hYs5er3DNfPGymjJXG7i4W3XGOUtLjLwy6Wq7QpZ7NZu?=
 =?iso-8859-1?Q?z6CF1Pj5KLxV/DivyPq9AklEdjCW5kDj9Q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 782917ab-4614-43fd-1984-08dc72edbb45
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 01:40:55.7415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pRAdGsBDMCRGnKAxGmZxK5qodM8RkbZ+gNyBkHgE2a3UhufKK+oLzUpiSGtygmcbpRBjrR1Vb9foH3loAbx50g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6772
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   75fa778d74b786a1608d55d655d42b480a6fa8bd
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 [12023/12533] selftests: Compile kselftest headers with -D_GNU_SOURCE
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405130312.R5mxIDyQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from hid_bpf.c:5:
>> ./../kselftest_harness.h:54:15: error: expected parameter declarator
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |               ^
>> ./../kselftest_harness.h:54:15: error: expected ')'
   ./../kselftest_harness.h:54:14: note: to match this '('
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |              ^
>> ./../kselftest_harness.h:54:1: error: type specifier missing, defaults to 'int'; ISO C99 and later do not support implicit int [-Wimplicit-int]
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         | ^
         | int
   3 errors generated.
--
>> reuseport_bpf_cpu.c:15:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      15 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> reuseport_bpf_numa.c:7:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       7 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> reuseport_dualstack.c:14:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      14 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> tls.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> tun.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> tap.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> so_incoming_cpu.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> nettest.c:7:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       7 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> psock_fanout.c:30:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      30 | #define _GNU_SOURCE             /* for sched_setaffinity */
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> msg_zerocopy.c:28:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      28 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> test_cachestat.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> test_execve.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3.c:5:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       5 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_clear_sighand.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_set_tid.c:9:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       9 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> clone3_cap_checkpoint_restore.c:11:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
      11 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> close_range_test.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> udmabuf.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> devpts_pts.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> dnotify_test.c:2:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       2 | #define _GNU_SOURCE     /* needed to get the defines */
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.
--
>> binderfs_test.c:3:9: warning: '_GNU_SOURCE' macro redefined [-Wmacro-redefined]
       3 | #define _GNU_SOURCE
         |         ^
   <command line>:1:9: note: previous definition is here
       1 | #define _GNU_SOURCE 1
         |         ^
   1 warning generated.


vim +54 tools/testing/selftests/hid/./../kselftest_harness.h

c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  52  
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  53  #ifndef _GNU_SOURCE
daef47b89efd0b tools/testing/selftests/kselftest_harness.h    Edward Liaw    2024-05-07 @54  static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  55  #endif
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  56  #include <asm/types.h>
65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinski 2023-01-25  57  #include <ctype.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  58  #include <errno.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  59  #include <stdbool.h>
b5bb6d3068eabb tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-12-10  60  #include <stdint.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  61  #include <stdio.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  62  #include <stdlib.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  63  #include <string.h>
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  64  #include <sys/mman.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  65  #include <sys/types.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  66  #include <sys/wait.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  67  #include <unistd.h>
63e6b2a42342c3 tools/testing/selftests/kselftest_harness.h    Kees Cook      2022-03-24  68  #include <setjmp.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

