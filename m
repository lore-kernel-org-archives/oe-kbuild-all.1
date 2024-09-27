Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A955D14B948
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727445598; cv=fail; b=ZZ7nmDJ8vE4tr1Z4iQPU4hANCJF0LQCYlAafRY2jBO9/nyVqWTmQ170eW8lTPmlE/MERRJIqtV1cv3ermfKDCQ+NSoIYJ8eSqEgrRDz8hsc9bNo5XGBRPDB38RaTcG8buixqGNYZdFnpL2lgwnGD30XQmZYpW0onHSUkQX4ZZvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727445598; c=relaxed/simple;
	bh=TFBDt+TFxqeLOL2WLfOBMHomskZpgOM0U1iEkdwHNWw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=pKyKcMszzMK5NVo/+bTdRzDyzZH2BlNEPMOh7OxWsr2EZmTWjzt0SqI68zG6lUOacb9iPJtRnylD4NYnGi3yKTPuufzig00AJuEw0gnruY0VCms7nurhhcYycLu3jArgMp1A23aJye4N1lM27fkDaOn/EWORvfNuR4bbsUhtgAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a8MgDzVL; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8MgDzVL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727445597; x=1758981597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TFBDt+TFxqeLOL2WLfOBMHomskZpgOM0U1iEkdwHNWw=;
  b=a8MgDzVLInMVuT1+pDEBVlZDFQKjFFVcmRt0tjfrcPQ7/G9ADQvmP5Dc
   9Nbu5W6CojLbmMvA+tFcFXHWni7ndmpPZ7i541dhejxOZsT1qfWpDJZ+/
   k5Yu+kaxc9dOkK3KDOMept/AtGDJCQeZZH5x8AqlLkeAOClJXNByyJX5h
   MdG82vs1dvH8B3rGxJIV+Dy7PhUBMR6gXLNlKPrdzX40sgpZyiemi4cYf
   gppRjjYT5mdyyL33MtCIoic/wbeQrQ+3CQYDfsks7Am9GHyDJrzmcUmzk
   mvWWqWTfkYT36jCKVFZ/WpekFp4xuNO+GjfFsoanAQLgl4jIyxZeX8tOj
   A==;
X-CSE-ConnectionGUID: 5UpOaQMpR8q97qhNSO1aNQ==
X-CSE-MsgGUID: WUCYkeMPQcOlHdlPPWOLHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26461489"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26461489"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 06:59:52 -0700
X-CSE-ConnectionGUID: gmXmtC/fTCK/o1veZnLVzg==
X-CSE-MsgGUID: wEcAWHuUTM2/ELJbZKLxbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="103351445"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2024 06:59:42 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 06:59:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 06:59:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 06:59:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 06:59:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kDEYzzPtrzKNE/LgNhwKYfbx6u/+xA8P61QwA6hTnPOZGRyDl3cYHEulqZOAEUP11NxcIHvh2LVQTvYXm1DYXfG79cXyTGtmE+cwQq1Ec7JnDbJKLITrSmaVUvbtLB3FQkk/lO2H56waGwEcO+3S4riiHwObFo1skEo7SP5d83QlS0/wwuXDQtXqQmxm0JgRPCWHdwURD+EFzyV74WhS98x4+o0ZQJZafrKGjfodgUruyHbtDmFMUX1C9PAon+x1kHaMMZ1MGXuwUCbdbX+vW/dF+uv3wqaHRyWC+9NE9/BfzRE6uWSvTLyMyk6AdPjhnl6L4zumodcMjMcN6cLYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skANAilmAlMSZlBaMjOob+koKqOnKs0kLMbaqn9iFa8=;
 b=kLjD9AIIO9ZCsuuh9nSV9Ru3LRi1vDpW93XsXUL6PJ3zVU4Qdvww/VuH2oIzahOHgC+6nAOE53zsllWKOTB5OHNFryPUohmlBzCUn9m5h2wHTMkN+BROjxgAnNHjtJSXKfOeXmodg2reuGwNZlEbviA2JyBnQ4o3VqK26JHR5kgjL0//zpXt47oP5MNkD9ycgRaVgSBqK1geBZ6kjnCkcs96bP4gpP5lCEgK6RGwaICVQuLOhGSZOGtC64JqwwTlZ7cVCW0xdix/E3Vlmhcqxx6wrnnGK3accyIzD9NXw6TYDKfJBnf8WEdy8ohhHCGAQsEkYc3BhPIfWS4YNttyng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by PH7PR11MB7075.namprd11.prod.outlook.com (2603:10b6:510:20e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.32; Fri, 27 Sep
 2024 13:59:36 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 13:59:36 +0000
Date: Fri, 27 Sep 2024 21:59:29 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cip:linux-4.19.y-cip-rt-rebase 24034/30000]
 include/asm-generic/percpu.h:151:9: error: implicit declaration of function
 'raw_local_irq_save'
Message-ID: <Zva6QZbg6Au9KcHh@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|PH7PR11MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 44f0bb1f-5d6c-459d-e978-08dcdefc9f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aTOy1dmXTllCisg6jYHkCdufyCqb3J29fosV4uDb/F5Y31gyOZOkAXcEwuDF?=
 =?us-ascii?Q?m7oWanEP0rUWDm8JHKxuPQLcySULRg0arihHZg2TEEt3sTI/VcfOQW2ycyFH?=
 =?us-ascii?Q?RaDU10i5K/fFmos/Fr7M+jifFDlsF8vXsm4zRyOLEl6lyTxEEkcfs0kJMfEr?=
 =?us-ascii?Q?lWrnw60uXU5WRDnbprfv81d+AHf0jf0PsdcvTBRK6Uw00tdsERxKWVdRpNgr?=
 =?us-ascii?Q?zYiQW9vj7Gfv4T5he0JM5LPnAE63vS3rL/1TSJjw3cEEwRgo2wxE3c10pazL?=
 =?us-ascii?Q?TwaVfHIvVAI+t1zoAVSJgPZQuvCoULql+1nrbdwggaLuoxcaWZs3x9RidKZx?=
 =?us-ascii?Q?LeuO2iE2mnxpdnfXTHgok65XB1Xjwwl/V3vn9bbiWawbgJXtn47oXcITZR0x?=
 =?us-ascii?Q?j70QMRprHUm/H7ttRXsjd71W53CXOJkFKGpp+UEXWJ7lVsybNfFMco68cGLX?=
 =?us-ascii?Q?AJj5yb8ftL6uxFJwTdVh9NhiQs3iiOknDM2GnhL3LljGKyop6XjdUWL/O51t?=
 =?us-ascii?Q?Lj7BTV4ukps+3nPaYuw2qiDDfZ5kel9CmsuTKBAqHn5tseD7uSZza2PubCX9?=
 =?us-ascii?Q?I/Fqp4LhDB4CSFUscx32RTmZKH3K/pNbtrYdsJnBmfi+f2n0GucVW1vA2xxY?=
 =?us-ascii?Q?nuGOf86UoTcXGxMuuuO8eV11gG6Bk1NxiP7YFDoN2vsM0Y4c1UyRav/FdShL?=
 =?us-ascii?Q?OI5LBinnus0BKrt0upNZdfIphp9sNQnoA1OK8D3GRUSoOomPmVRGlAmAckAp?=
 =?us-ascii?Q?tESOTyp0v02Nwd0DZDzLgdE50zgoG0/X6Fm189psDkF0c6ET+5VWKDTPO20b?=
 =?us-ascii?Q?d7XBa2adnM0kJ4sbE1dWZp4ZT618IR2f+n4UHdevNmvSUH5JqdtqGnK/B0qw?=
 =?us-ascii?Q?smEohj0fr04IZ0vF+J7WEsEGhYiUz5/7cQDV5W6cvLOxlYfcwHyXt0xvlYGH?=
 =?us-ascii?Q?c2B/nTQu3IoNLqomazv8mJC+SNz5BQ4d4YS3szgm9RCbLTPRLbFgXNv3/d4x?=
 =?us-ascii?Q?rUzwGtWMWPMHAtC7yNV8V33IWb2X5B5+DtixmSGL8ojLvbyEQdUqXUCmWyck?=
 =?us-ascii?Q?q3qxqSynRtgbCS9IgQor8FY62kE2NV1+UKNpu6sh2oFLQcRHTUdtJimTG/+N?=
 =?us-ascii?Q?6sZjwc4C4MS6Y5lYAi+IeusTJJzRSgBj4yWTkCVUqjNTpTOyRqR0T7zTTNmI?=
 =?us-ascii?Q?NQNE6scdJBR/nKFqlYabpnbnw370ZTb5d2lLxP8jtWYWdHcPcTpakFOePttV?=
 =?us-ascii?Q?Mj1MiUplc/M6jqLvXfiQd3OrICq9RWQEK0/fLVy29/ddrPH5Y9WgkqNwTW2g?=
 =?us-ascii?Q?iveXphoyiECe4k6p9hw1QEqa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e1JNUAbHZ6PxdrmtpzQEJk6S7wdd/3Ylc73oRJvEarm2cKOjawto2RZiSJ0Z?=
 =?us-ascii?Q?FsVzf5foopKD96fyQypO9R1ouao4hWYF/y/X7/8tCG8tVdgqqWjCmb9ZxPLd?=
 =?us-ascii?Q?zMiEqJWUFXmGvNBZPsaxdPlBEGMjQvmW6ytDuAcysvh/EZ7GSIBtOADrB/DN?=
 =?us-ascii?Q?Jr9RW8ofIYMRHJAWvAsSqGMOkD+nYRGHgkSfiAvGZzVv43I/5g9irci6MJs0?=
 =?us-ascii?Q?YgQzmEyTgp83Svz4fWkYpXdjsBBL3pUkstyiRS/8z4ny1fewJq0Ajq4WqlIE?=
 =?us-ascii?Q?4M0rYezbSNNwMQ3OtdbZvAJgYIWPSokqs/pRA38RqIAgxWblazwPRRa8mnfZ?=
 =?us-ascii?Q?DD6tiidAEQs8RLTMiG4qN1mwgSVUWgRQXC3+uAA7jtqLHWBxEXCj0SzwM6Za?=
 =?us-ascii?Q?cMqyivbpf3eP9SKnZjnWdO+2+d1WCZWFkh6iN/JBYHDKWzyF01gxpUXFAPSL?=
 =?us-ascii?Q?h24KWAuQhyMjflbC2MtRTwQDClpJAzlV8+SCOJr+pwkWIeDieOzwMhDE27O4?=
 =?us-ascii?Q?NiFhhGpag0vhC7C6WrdBc7HYb+OoRUNMV8Kdh9zspeZra3nZxpt3M8bq7DYF?=
 =?us-ascii?Q?b/WYvLVFROSKoFup4WPU3VjwOeAHpJufE6gLddj5Qqk3kJblPYc6Xwvc2Kya?=
 =?us-ascii?Q?POkhw4RTOKeaaMnvaFcMBc+cyUTiT0GH65i57S6M3koaQMH0tNW4G5w4LuCq?=
 =?us-ascii?Q?m5up62+KX597L1noKrXW2ibkC+1AIKsfmXkZEUwlPd81OlOoxZPYyY6H1d1b?=
 =?us-ascii?Q?2qoGlK1Zn9sP/w9ZPeYFzkvKkerWhUHDBY5KdpXJSwHwyklRDac5ReMWUox9?=
 =?us-ascii?Q?njM6dN6jDSI14OI20/Goq9IonqNrYZbVsUU2jmJTZsq/TXSKpYJ5OANfiPmi?=
 =?us-ascii?Q?gyMguZXS6ytT4C14bRfBiFBEeWmysEj3QWhY7yqNHekg/HX1l3J9uWXglzIT?=
 =?us-ascii?Q?W+TuCVZyaH/0vlzqRyY+E2xn3dKdyMGexiTN2cLzdG7ZvEs9S399hdlmot3p?=
 =?us-ascii?Q?vFCcx39Z4wH4afTl3y7/QtNmkLPywjDhz8j1/TvrmIj4K3f++IrSfkUa3+c4?=
 =?us-ascii?Q?9Gc0e206ejqKbhdk3oS5tpiH4xGfHE4jjWpxq9dQwYwEVARKQfLlDa75esoQ?=
 =?us-ascii?Q?XD9MAwM6VEma0T9Iw21LqIoYcee6OgH71YZt4yTdP3ig90ff0VjNU7546y5W?=
 =?us-ascii?Q?9tuczKJhRghziCxzW+Saq1TRku4Ng4+20Davy32clw17+b/bvucKrm51GLj1?=
 =?us-ascii?Q?70Oe7KcF8N7h/K9mSCzw3yuqfEZT6bvSozylOFn9F2hQ+JJd46D9/sO0E+J8?=
 =?us-ascii?Q?mfRMOvBjX4z8PgBHE8KcX360G9IrXUarubIhuvAEWAkhvUxkNscvcCDLwtCI?=
 =?us-ascii?Q?BNxfDZDYB8zObdeYqqEaMzpGwvqTIKesWMV+q/3tHub2PjqkCIVZ4EOWH5wR?=
 =?us-ascii?Q?BuR218UxpfCZ7PHAmXpdkVxhC3IHIHDz5VbEkgBN1KUz4/M6eU3A0FIV3wgV?=
 =?us-ascii?Q?KLDTzgfBdCRtASpkyGTdzVAkbPqRO/GyWj+WeN+KiMMFGBilbM4C/GZqBSq+?=
 =?us-ascii?Q?zEIs+GOHbfM4avXMIgZaE7uO6iXVOy+f9ZiAZ1eG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 44f0bb1f-5d6c-459d-e978-08dcdefc9f33
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 13:59:36.5537
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9ukQiGt1vH8ibYpcKwxnvwSip8XlF+xaoNLaECFjdLfE2coPxXPa2yWY/VPE3+lR+dGdHJuLFCMSUe/1lXXYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7075
X-OriginatorOrg: intel.com

Hi Ben,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 2c16891623cc7e8c0c4144f8665d117c7fc94552 [24034/30000] Revert "percpu: include irqflags.h for raw_local_irq_save()"
:::::: branch date: 3 days ago
:::::: commit date: 1 year, 9 months ago
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20240927/202409271143.5qiuRG2w-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240927/202409271143.5qiuRG2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271143.5qiuRG2w-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: warning: arch/um/include/uapi: No such file or directory [-Wmissing-include-dirs]
   In file included from ./arch/um/include/generated/asm/percpu.h:1,
                    from include/linux/percpu.h:13,
                    from include/linux/bpf-cgroup.h:7,
                    from kernel/bpf/local_storage.c:2:
   include/linux/bpf-cgroup.h: In function 'bpf_cgroup_storage_set':
>> include/asm-generic/percpu.h:151:9: error: implicit declaration of function 'raw_local_irq_save' [-Werror=implicit-function-declaration]
     151 |         raw_local_irq_save(__flags);                                    \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:337:41: note: in expansion of macro 'this_cpu_generic_to_op'
     337 | #define this_cpu_write_1(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:378:25: note: in expansion of macro 'this_cpu_write_1'
     378 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/bpf-cgroup.h:112:9: note: in expansion of macro 'this_cpu_write'
     112 |         this_cpu_write(bpf_cgroup_storage, &buf->data[0]);
         |         ^~~~~~~~~~~~~~
>> include/asm-generic/percpu.h:153:9: error: implicit declaration of function 'raw_local_irq_restore' [-Werror=implicit-function-declaration]
     153 |         raw_local_irq_restore(__flags);                                 \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/percpu.h:337:41: note: in expansion of macro 'this_cpu_generic_to_op'
     337 | #define this_cpu_write_1(pcp, val)      this_cpu_generic_to_op(pcp, val, =)
         |                                         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/percpu-defs.h:378:25: note: in expansion of macro 'this_cpu_write_1'
     378 |                 case 1: stem##1(variable, __VA_ARGS__);break;           \
         |                         ^~~~
   include/linux/percpu-defs.h:509:41: note: in expansion of macro '__pcpu_size_call'
     509 | #define this_cpu_write(pcp, val)        __pcpu_size_call(this_cpu_write_, pcp, val)
         |                                         ^~~~~~~~~~~~~~~~
   include/linux/bpf-cgroup.h:112:9: note: in expansion of macro 'this_cpu_write'
     112 |         this_cpu_write(bpf_cgroup_storage, &buf->data[0]);
         |         ^~~~~~~~~~~~~~
   In file included from include/linux/uaccess.h:14,
                    from include/linux/compat.h:19,
                    from include/linux/filter.h:12,
                    from kernel/bpf/local_storage.c:5:
   arch/um/include/asm/uaccess.h: In function '__access_ok':
   arch/um/include/asm/uaccess.h:17:36: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      17 |           (((unsigned long) (addr) >= FIXADDR_USER_START) && \
         |                                    ^~
   arch/um/include/asm/uaccess.h:45:17: note: in expansion of macro '__access_ok_vsyscall'
      45 |                 __access_ok_vsyscall(addr, size) ||
         |                 ^~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/jump_label.h:77,
                    from include/linux/bpf-cgroup.h:6:
   include/asm-generic/fixmap.h: In function 'fix_to_virt':
   include/asm-generic/fixmap.h:31:26: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |                          ^~
   include/linux/compiler.h:398:23: note: in definition of macro '__compiletime_assert'
     398 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler.h:418:9: note: in expansion of macro '_compiletime_assert'
     418 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:45:37: note: in expansion of macro 'compiletime_assert'
      45 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:69:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      69 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/asm-generic/fixmap.h:31:9: note: in expansion of macro 'BUILD_BUG_ON'
      31 |         BUILD_BUG_ON(idx >= __end_of_fixed_addresses);
         |         ^~~~~~~~~~~~
   In file included from include/linux/memremap.h:7,
                    from include/linux/mm.h:27,
                    from include/linux/scatterlist.h:8,
                    from include/linux/dma-mapping.h:11,
                    from include/linux/skbuff.h:34,
                    from include/linux/filter.h:13:
   include/linux/mm.h: In function 'pgtable_init':
   arch/um/include/asm/pgtable.h:35:33: warning: suggest braces around empty body in 'do' statement [-Wempty-body]
      35 | #define pgtable_cache_init() do ; while (0)
         |                                 ^
   include/linux/mm.h:1929:9: note: in expansion of macro 'pgtable_cache_init'
    1929 |         pgtable_cache_init();
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/raw_local_irq_save +151 include/asm-generic/percpu.h

e88d62cd4b2f0b1 Mark Rutland    2017-09-26  147  
eba117889ac444b Tejun Heo       2014-06-17  148  #define this_cpu_generic_to_op(pcp, val, op)				\
9c28278a24c01c0 Tejun Heo       2014-06-17  149  do {									\
eba117889ac444b Tejun Heo       2014-06-17  150  	unsigned long __flags;						\
eba117889ac444b Tejun Heo       2014-06-17 @151  	raw_local_irq_save(__flags);					\
1b5ca12127427c5 Nicholas Piggin 2016-09-22  152  	raw_cpu_generic_to_op(pcp, val, op);				\
eba117889ac444b Tejun Heo       2014-06-17 @153  	raw_local_irq_restore(__flags);					\
9c28278a24c01c0 Tejun Heo       2014-06-17  154  } while (0)
9c28278a24c01c0 Tejun Heo       2014-06-17  155  
1b5ca12127427c5 Nicholas Piggin 2016-09-22  156  

:::::: The code at line 151 was first introduced by commit
:::::: eba117889ac444bea6e8270049cbaeed48169889 percpu: preffity percpu header files

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

