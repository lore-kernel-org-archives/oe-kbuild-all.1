Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5592C29B8D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 15:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512116; cv=fail; b=bRYkZs1E3/8si26yFATc44ZUy91fckf9GzYWQKM9+lVL0uVSSEol/x6SWC24EoPnZZrf0e04RsHNJ/uFZVRaIey7VlUlglCJZP+fEAsVXEBqWLpkZN2OzlcPtDI83f0h+39LuXixIMKq2gBiPaxUrPo6TvILDjM+vbH62GrIy/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512116; c=relaxed/simple;
	bh=0VggRhcIXkWRCmAgiQScCOieVMIuwWSpRwdKVp0jIkQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rlYPdUkCKzM9LPZDJmdf5rcQTG80m+OpihDx3kwcvHbE0TdgJooQ433KtymttoIL+Ip6q4TC7Gd7oIgMgW8dFoC140GMen3n/YgKdtwvOLEec7Ca760zzKKE0FEYyYHmYOxcRnatkRdCmPmGe9sHI6Hmw+tETij4htFLlE+KUtI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XpOidIFn; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XpOidIFn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778512114; x=1810048114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0VggRhcIXkWRCmAgiQScCOieVMIuwWSpRwdKVp0jIkQ=;
  b=XpOidIFnkCiVxeiroFBjWFqnxjld1w2dQyvzEJrTUGENBQxsTRUczsmO
   m/BzEzOVpF4IDgtMkQD1Er5pLx11haavjnKLthSIVlfdVAkuKmBy3Eu6X
   eEMk8rMzKOrqWmTsHIEhSmCLR1xOa0y1mOhCzxbFHQc9MNxTQYX9VPrPV
   K9wN6XKpfXPbBhFhn+WuKx5xqaDZgMWhVBLEdTwtiolPssF3V5acTZ21Y
   oiwovmdMknJvUnXurZhg1OguVoNSNeDjYzwkUcTxDUo+5ifhkQrOv6tYs
   CAiOIJDcTJL2s7QUijQZSUlDl92j4F5aLU2iAfwfqj5VhX4xT2OX5mLQC
   A==;
X-CSE-ConnectionGUID: R3wlce2HQnif6A8yji4oHA==
X-CSE-MsgGUID: SZ2XWyU5T22c7WXJre0CsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="90502352"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="90502352"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:08:29 -0700
X-CSE-ConnectionGUID: Ziossty3TEWsgH3h9rry/A==
X-CSE-MsgGUID: MHPM0aNGRB+DcqK0TPpoSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236625552"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:08:30 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 08:08:29 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 08:08:29 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.61) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 08:08:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SQcgGeszXY25oornj4uiFpxXUlBmqA/8IQwT/qzgGpttg/Ow80gPwADO+T+XuDuTP8zehQxeQCQebQIg3AEUz81wKeWD/vrtSeQAtU+UA5frBzi6uPDKXiStyu8Ad4/L1w8VuDmyNLD6LF4SQJCHi30K4SZKAMEA85nVQ/k9Z8dSVuVJyrOiMdZXkkymciY3G9FLWamwEU4RCgvwwX7GD7TFDVwbP5h0rkDPtpyLHGb95biXp3XgoYsZsC7Us7Cf7zV2t3A+7d7WuR3EQoA2FBc3PYZOeop/aGOe18qcWx9dqx4ABof8wB0/LM+uzvw60k9snoGpV3jsBY3Mb+KZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjmRxfb3m5dcBnwKJdsh+vWdoEjBnvxswz/9ennOheQ=;
 b=hIMyiKAJpxoq0kpDavjoIb24AoECSxBa3Sa832axSCI7MRKZLfUzDeWoEkG6S2dl0HC4drd3gIx2mC0suqtiexIArkqN8ex+Akzdu7J3wKZBHC2LI0qoy0urDfszfq/KXlAyAjAt8C2FQS402Li/V3Z+bBygcn1odJGUiLYHVta89CplZbver8ZcVVn304KY8LA87tejA26HT+sCHAFmYl8zrMW+EAfXolLVlqM9Tuym2eoljE9w+7mZMdqB20mVuEsJXuYJeD2RMk3Fh+7stt2ApOr+rjnad+ISDkvBXGf3GowHKcFiUuzmj57KiDO0gpD0hnN6KNksFvNq3NNaiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by IA3PR11MB9061.namprd11.prod.outlook.com (2603:10b6:208:57c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 15:08:25 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 15:08:24 +0000
Date: Mon, 11 May 2026 23:08:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:mm-selftest/v4 37/55] hugetlb_fault_after_madv.c:81:46:
 warning: format '%lu' expects a matching 'long unsigned int' argument
Message-ID: <agHw3kc9ahOnZ4iv@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGAP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::13)
 To CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|IA3PR11MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e471c7-ce6c-43bf-0f11-08deaf6f25f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: EltE756or6XgyDq5/bIywJseWORprucwEstocXp/3CAzTrFEU9uFoMzCSYQKwY78mA5y8X8bxFcrBSYu34Dtah0tSKwbFHPwPSVlrwRNjsNzZp3nJbwMFfhkVcM331Uwly4+YsDCIWZtmDfQQW+ab2y/1ebBxNJqwpMN+ufBuWYa9RpNcYqv8wxYtQf9rnj8lnoKS0P86oCLJHb0sbNdVCehV4ZmwotDD4BYsJzW0CKxXUFUbmFrYb/dwkC271HyH2wW6Yrt1HMDY5SzHxLSbqI2FKQU72DN/q+gYWkJxzGtFitYQivm1W6yZjnWvSJHLIjKHzDQdl3qBLAt4GnEmhDVj/3S5emlTcK6qbZ/Ue3nYA+Uv2NH0Ce7O8n/3qzQjJPEaOBYmAOVPt6I1Ovfolb588WapvwWJD82Kc22w1MYKtCGnbtDfB++pKiGXaoMXg7evPhNGG+QDAfH3JKnBY+XdIRWCX0Opr26a2ihP5N5/sbtTF2mEdHmQwZx1jPbGGjcJcJuixXI05Rlg861XWFuLFGGw75Q9bs67c+kwlPwtJ0yIKW/noMLzlE+NQsh3JY/JdPePRds8E98H1sozhF0+HibMwtqkGJKYexoFu3K7/E6LchHFaAp+EZ0HbJfFv/FiOv35wqw4KgWe7b/PA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kbkYbZ93mXM3TkoL5p9rnZ55BuFoCxa0nHLBndCIwnMDn7991Q0IQIyWz5NW?=
 =?us-ascii?Q?nFotk13nrfBMKdjjL/XfmV85jxuV9a5qURC5gmedev+Q5xvrDPGgKp9nLebV?=
 =?us-ascii?Q?PWyCf4bPoG00vVZoDBc5FpLXvuWs0MfgCYdueo5KQcDGXuh9NqzLgweXKv1U?=
 =?us-ascii?Q?9ndIU2DQF1H3a5j4PxxOidVTsyiSjo3XOmA98R59px0i6Yh9NmhFuU7Gmq2M?=
 =?us-ascii?Q?EJLPcIVl7uyrZo3EEuuZ/S+VOLkAJ1UAZhumfKj9Gq/4rw97McoBf2kOUcZJ?=
 =?us-ascii?Q?VSv9dr4hxwy5UfgL9g/vpBsSfjF7K0Kc3n6ENhFWCveHhEmp2UtfFMo/jJCp?=
 =?us-ascii?Q?OU+cOb08kwTSCtic+7o5Ap24cWxAn0eVCo/XunM37nKt48RaXMNKshj+huE+?=
 =?us-ascii?Q?Ta3fM92k50igdANJUI1l+E5fwhBeqcGXQ2tEiv5Sm9oaLoOYr/FK8hrG+I55?=
 =?us-ascii?Q?nX9LdQ6y8c5K1tIOplnEFhog0qfGY2TLMvkB/SHbJsPso9irZLbgm/84PeyU?=
 =?us-ascii?Q?gKrhypSTKAwHA5rq3voroSFN9fzydwZj66wMdgtERpvJmaAlPKlb39ZdIqhJ?=
 =?us-ascii?Q?W32/jdaZgGtNfhlmHs9XPlW0dCSy/FbBmZg/Hx4yfs8O7WTmzxcubPyPhvj5?=
 =?us-ascii?Q?qVPAFj9urplCcK/nM9J4xyMnWLFZb73elg0HoDN4OF7KIU8lKEYZBgod577I?=
 =?us-ascii?Q?i6ragYJM/WF+Lva7272mxO2u24uOMlTlL2e35/DPXKwVeZdLSaRamH/Su1nz?=
 =?us-ascii?Q?lDfctwzRqoTRIvIZC6f9RJRbqIAmNDZ6EqZBGRJvUGNAqSmUR5lo4IEdG1cC?=
 =?us-ascii?Q?E0z70fQvhDKqLTZEw9Oi50zoUIf/ShAOd25HpKJiqGkAEjszm3e4aIrqK3w7?=
 =?us-ascii?Q?HfVnd3zsCYl8NUKFSQypjsL0q8KznNH3hTzu6wPD48g6AT8B26YO3fo9LZrg?=
 =?us-ascii?Q?cdpKRUUWxCAG4PfjI9n/DRF2JiAwqDrL2Z4b9A8tEpxSaOWAo2q89DL44AHj?=
 =?us-ascii?Q?DfYDhnmr/NvY/Y2+pQygJwIkkuLWnf+IRcKyu6OrzrouP7t3xhrcs1pXQcHq?=
 =?us-ascii?Q?xvuY89GrioLtIebcG5gP9hZtXRURcpG/Uj+Lk0Lru4KbZWMAlNHE6wvttlMX?=
 =?us-ascii?Q?KkmVIQcFNMX1LieJ5J4unGiNOuRNspHJ2OArdnccbcIvtQAf4r3z58mZlBVE?=
 =?us-ascii?Q?oYk4hBLMacmREE0LZC1/kXmR8MqvVhyf4/e3vT/Z/PoBaDUIq5h9npeNbHlc?=
 =?us-ascii?Q?uDVANe/5HIJvRPfzjLY8W63HdZA0kz4Zjzz9ETrSh68MnS4K83TSQ+/mVHZN?=
 =?us-ascii?Q?Ay68so6womLr6FG1ys8ZlY3MRXrxL2I737jq8Yt8xcE0f8ZA2qXk7jiGvpJt?=
 =?us-ascii?Q?trEGtJg0uTmn+NVeWPmMyXR2dW+fMHX+KTNGGQ27klKmBz+xiXlzkXzuu6ZR?=
 =?us-ascii?Q?vdkTgszAdI/k0V3QeBaTSruoijUWZHq5qfPxp3mjp158hr13gwiG/HSu/Gm2?=
 =?us-ascii?Q?uq7E+Z26XIOxa4DV2TTqV3H5khgDya1/RgLmm3sZIco1LMZ/LRaJmhWhTmHf?=
 =?us-ascii?Q?2AU/ORDvK6D9LR+5PAmv7dV9RIkHBHLwv5lsPYAOpoyN8NVNnkLBNLJFEYZe?=
 =?us-ascii?Q?plomaGpR5cvlD+Qi0e7XuJOOkRaxV3gAqkvOjo4eYHppcvxw7GHyiOazgEDV?=
 =?us-ascii?Q?5I4MVz3HpFl0zttvWCuDIyQMFsr04SO+yTHGcNFsVAy4IJu7cKZmIkaS4sYz?=
 =?us-ascii?Q?j1lrjjstPg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZgVqdpgXDPEd3YCDX+A0a2FrGk2zLu3NH2Ahgc8bNMRhIIWMmZ3GoOxJJDiNNLG2r0u6u/HjNMiZZBX9EwG+cs5LYfCtNrX66v6K2J11oZJtAki0RQxlf6xTdeqPn2wbw2VaSubobTrqRQAga27/Pt6Nfgl6ihKWjIC59QJINtTJtUJTEGideyemRNSgYahxTShOF6j2pdcpqDEAYGahJGuSVY8xE0uBGRsqlJ7rF3CAcmjVRqtxdaR+rxWCkl7QxXumVXrOv3lhUn+xFGzBZjzhbEVF2AF5Z30X+HiFJYX0nwU2F5M3yFGXpkzONI2KSdJam1uiWWCGE62Y4FPY6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e471c7-ce6c-43bf-0f11-08deaf6f25f4
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 15:08:24.7645
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1FHfAjT8vuSmKVkWWydUXaZCb+jc47lWJehVMUAjl6ojsB8nT0F0VxzQ3zI27xarr38SjA6se0kpv3crSlQ/BA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9061
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git mm-selftest/v4
head:   54ada66ccb76f29a7ec168bfa00b7dc818b44df3
commit: bd4425c38dd8747668403780d9d1f0504400c701 [37/55] selftests/mm: hugetlb_fault_after_madv: add setup of HugeTLB pages
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605110038.pcd6uWCz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605110038.pcd6uWCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605110038.pcd6uWCz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   hugetlb_fault_after_madv.c: In function 'main':
>> hugetlb_fault_after_madv.c:81:46: warning: format '%lu' expects a matching 'long unsigned int' argument [-Wformat=]
      81 |                 ksft_exit_skip("Not enough %lu Kb pages\n");
         |                                            ~~^
         |                                              |
         |                                              long unsigned int

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

