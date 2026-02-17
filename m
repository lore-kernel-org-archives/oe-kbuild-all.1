Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE9382899
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771304551; cv=fail; b=rt10jvqyxdaMxpAjbSOe5PXKjxERO2BX78xdTK7vNleU+l73QQ7Bxpk0CNp+4OMwe7vpZoCYU0UCVK2aj9GW1Pu3o+jyrH3OgnJBFDF4xO9o35eeD29bOhun4MuZ12U02pOVSmpkCcbg5KSULCLrIUCF33s0Ho/AbJ88dOOau7c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771304551; c=relaxed/simple;
	bh=7tZiB6FqhngFRNpfduOq8BhVCPqte9rqDLVwWP9sMHk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WNnOba/WmE+n2forBVK9kEu0AxBPKpl84pgbEnsmo4zMY5XzKW7S+rcsmvtDjov5lta0DSktOA0t2jvhokb9jto91N36BRAT1Wt+90hyIBVLIQlYt5n+g6VU+no0pSx3qHbBFc+w6dVPpygEZbiJ0w+vcrwuQYfSNOpa0P1cFXc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YM1yHVZJ; arc=fail smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YM1yHVZJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771304550; x=1802840550;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7tZiB6FqhngFRNpfduOq8BhVCPqte9rqDLVwWP9sMHk=;
  b=YM1yHVZJTkPVQ83Sb7iYT5dujcAeVHM1BWGxtJFQrrZ5Pi647OFNxIPs
   XaFOnlCNlsF5vSrp+3lkAZYY2UEaM9zcugdL1lQ58KHMsicmJA58vZJz5
   JZU5702ttn+AcsdvI6zhLsa8zHruI5/WYd56ZIBP+WXw7Gtl8fVLWOTW2
   D+qFmxOYZerGkYUgPBDFPvuE8wgKARdam+ek7DS9219Ah9Q9iJ8ILy5Va
   lP3TtBmx9Gs6QLDxpFJBqVBW7Gu4uIlht2dBAcKSiYSh4p0jCtAenWCwO
   8YXOVbPL92gBEG8/y6DRI3a1M5eO4BmrY7D2LUIclX+o8F7poajlUF3yq
   Q==;
X-CSE-ConnectionGUID: S4kJt8yYTCuKcZ2Xtr9hGw==
X-CSE-MsgGUID: ft5lqpR6Tq+KzL3l0TA06Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83003509"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="83003509"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:02:30 -0800
X-CSE-ConnectionGUID: tSGG4nurTKSNmKV093hxww==
X-CSE-MsgGUID: KXY8xmY1SQKc/fOFVu7rbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="212526126"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:02:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 21:02:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 21:02:29 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.64) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 21:02:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AksDFeIenQA1c9uJ9YNjt4Ax41DNAkuBluha0V2FgezbefXcQE5gYnw4ikZTVdvhRdl1rXO5AS2rVrfa6rzQA0elK5UgkfpohwwyX5qHRFpKmptMwooio+LrZR0Sj/WHcFrk0LYezmavenyibhLPF34i+W+X2DATxGJpzXKcxFCEFk2JrHpM44OCQZfrkT3g861qWm2rCZ698uhvv8dIvVRpHkb6vpGZcgL2CwZTgniD0/ks3Lx8zPPly75dnwKihhhI1R+7d6XnqJZf5RumqY/1/Ce5obMUSo8s/YoCM3ml0xg2h/qkNmsvWt+O+VPQyqbm7KjtziP8yq59uqT1Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB4AtCGsdJwNR3bTnfJYqJ/m4oXs15/E8arqGfvO7aU=;
 b=v/4Rks7y5Jl+N6hCa79jCnI9ApZK5OAXEEyU4tpsceU97hzk37EHLr/d0wRm9grC3hApgbjv6kVMPWsdB4vCste5cLsAbbS0nb5qiOIKL+sWdNm0cftB/ek9wHkmZHEl3u5QKeMjyHRhGyenmPS2/50WC2bjxEUO9VC29bJrWiI8U5G0lnIYrtmKum7bf2Cz4QQJblQMQ8liLCHfBCvXIL8m+DqG1SEHwA+SCORAjJ12RA4my/fJ/XOaGIQN/0axtDMM4JlqbYFm57nALJfaRlaUmoiZTlXADrYa2/Rr643n4xNxYhngC4NKON0UhT5drgG0kOdHA3dHfuU9oNY7Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 05:02:23 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 05:02:23 +0000
Date: Tue, 17 Feb 2026 13:02:14 +0800
From: kernel test robot <lkp@intel.com>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [paragon-software-group-ntfs3:master 26/26] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aZP2VnuaW33Z0IIN@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 10521a2a-10b3-49c2-d44d-08de6de1bccf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cZuDKXn4d3CnoAO85wJufJgIkNQaSe99VKVs5mrchLwZrSomyIzRpIdbyfMq?=
 =?us-ascii?Q?jRhVr3YGUc3Q8c0g2YRDwVwpAJa+UmuuYTIMapi0VkD5pJz2ezh0BjYnQJuk?=
 =?us-ascii?Q?mLMlaRfKk+XNjwK2L3XR/z0oVY1uIXhp5GKmj5vfEAjFdRzKC5OWtpm0vXpv?=
 =?us-ascii?Q?8tVj/D7xhvQyCtoQE6DpitxvdZbSvfJQUcb0CPqdhji6qOf43PvhnAT2cmCR?=
 =?us-ascii?Q?MaZQXeS3Mm6On75Jf7n9rjEyKScZU1gvfaZRf694d1QgX0w9uiZVbk8w3aBc?=
 =?us-ascii?Q?WAS781km5lStc8yLx1adMnuYjGp7kE2U5aENOJgKtn7Rt3bV7cC2G5A9QL7E?=
 =?us-ascii?Q?dMOa+WaWTkC0bXun2mPZC+4pC4F0hztKltA8rGSzcInGzvf/vzSQuUolB7JY?=
 =?us-ascii?Q?QpRyfhAspV84rF76cDrSdIZKNC7g/bCGWK94KQkmPQgxY3mY5U61vF3WQuwe?=
 =?us-ascii?Q?/h1vLsC/wL5vs+DOOvSXOEsYeU0dpLPBhzFCQe9CuOl1IQ1l/xYaql8QuJk6?=
 =?us-ascii?Q?uHRMCCREQhzd1sNpCpbuA5MWkNDZqDn5HvuAJJiSpu+nagh/Ftcuo6ZsuycI?=
 =?us-ascii?Q?sxnPGwOFX8f9fTYwrsneSvduY/IlmckuGpZaBH4SjHuutlqVkkg1QaIVzZT4?=
 =?us-ascii?Q?6dIARvX/pOFHau6EhO44n8NvykAl0l0ZjuY0spJ1eQExRkSR5y/oZgEcXHoT?=
 =?us-ascii?Q?A5YWWNmhEMz8RzcLhpaHi3GB/bIeuMOJeUOzhq9wP+pP4WOm2lGjn+TjNVFn?=
 =?us-ascii?Q?g65DRCNLmsqicmFDFJZGKHSwOegH85TiMOoNfZ243NfSTgXKnIKwJN3A8p7P?=
 =?us-ascii?Q?rELyrIudJCvNfvn9AQilcHLzZPI2s22CSd51hdwhn9Gk55JcoOGYa9rRh4yS?=
 =?us-ascii?Q?B4GtniDeFHTUPQZCQEhI4I1J++4AdF7mAnK+dr4DlrjCpYW9e9XNo68VhcNk?=
 =?us-ascii?Q?y2RnbplPt+E5xk92nJXlh/L9uZcs/fNzCD/9Dh9o5jR0e8VBfQP3gJLIe5M1?=
 =?us-ascii?Q?Dc1THNipE7BUeGl5uz2uQLwImOK1D8CMnEn0RFnQozPNmSaZ+8zJ/xnTICqV?=
 =?us-ascii?Q?u/orcIkidSwhJxShIt/BUZd2Ln7q5LbL+nNqbmlBbqqIi1LSh2Jp4Z4mPyIS?=
 =?us-ascii?Q?pLaB2uckLnZ8mH/MgRMEFnl1q6Nyv1lsrJJCmWgJ6NU4QfD8j7FPmFGbewoW?=
 =?us-ascii?Q?Xt66XpCQFTnSwo1cBLqaUTCvAThGGLQmYuYGV27c5sDVVH5dcgFlWnJdb70s?=
 =?us-ascii?Q?WTTB1egfkQjE6gQyrfA0uAjp2g+jA1Ym8cooTkgQpUGL9G9mtPfxeRwW48vW?=
 =?us-ascii?Q?BL0u64fQbKTK7dld+2+kMnltrDQmDYkfqPFCkalh12XXxkjIX5oCL7XC/44O?=
 =?us-ascii?Q?2OaT1y7REjIBZb1Iey70hpvwre2BRSBT9IRgZy3gytXtYFm6Ofhp6LZZO9dd?=
 =?us-ascii?Q?aENYD+yhz6JZXp+iMLI6ri2MHDMO24/stIBh0DXBX26JL5Du8sf183Xu1xG1?=
 =?us-ascii?Q?CINPJlMeEPOfkxq5EXFzIHt62lYBP1JxYP6cDbB6t0R1nt+hbDdx76bg0lBN?=
 =?us-ascii?Q?v2rKhlups9Gg4hK2JJMv0SYNlndufvgKowDfH+KQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vnTHofmtv+n7RczJkuQSTqmfySz1qRRODyNDu9UaDbVrvFHNStt/eBKNvEm6?=
 =?us-ascii?Q?WMgcquH7bM6KxcCIemG6eCcTYU1uO83OJERpwuO0KBresYqWi4DklgSMKQ0k?=
 =?us-ascii?Q?N/QbIOzNrLGUxDbriqu41wUt4NLWk4FTdlTjiMOh7BqDcukUCeNZVp4LynhC?=
 =?us-ascii?Q?C7ioRdDsQt6y0LJXs8G/JeFAJk3UjbClbzFEXZDUfnmv7fq0bRgr8pUTDg7U?=
 =?us-ascii?Q?vRqRBoSUstYv+kFWRDReS+lpsELYOyQCocg2xT7PQHvwY2av/HWdOw/fMASm?=
 =?us-ascii?Q?OJhbGxuDepv2yFAvwkvKp+jQOgt3nXZN5ZUh3mACs5xNjUSU4WXLx4+lohmX?=
 =?us-ascii?Q?krKVLYMSQP4iEgNCEjPBgcPk/DvXaug+HphyyNCc5BHRPa5UBEKoYILA1dvG?=
 =?us-ascii?Q?/VZUL6skx/su3th5zuVEEj+OhE6ImEINy+fJTEShsso5c2HzY044dIBbg+bg?=
 =?us-ascii?Q?MCaLZ8skMIy8dbN6U+H9jgN3eoVQex3dFAUB2gqxcmWBKuX4lvQU7TB7e87p?=
 =?us-ascii?Q?i5AeCIYey8oiwCj/tLNhKf8dbsrJD4iVeY5RigwMTyq3V1CwxtEHXkpRlXzo?=
 =?us-ascii?Q?SuSO3RBroXDx3Pet4wdLNmOiZdmUsjFDjnUjJ64QLynAcoUXPC0VJN2O7uNm?=
 =?us-ascii?Q?Z1iLSGgk6z2Vci1chizpHeR1lP83vfb8Cpg6a4965zoxo64ZUmqYgw7lQY/M?=
 =?us-ascii?Q?TS9IAlGU1+9cJnZ3DAmuZNj9ppGYmkC9NM7lj1xGDyv3GfR8QrIZoylcwLdJ?=
 =?us-ascii?Q?qC5IV1iCAKlckJAVtae0mvX5T8IAwEHY1Cr1W7xLEIHWcLKur5vlYR3l6G+l?=
 =?us-ascii?Q?gioFHhW0nLoVmUhJ4ws/TBW1a9qav8xhEWaDZrAYbpgo2It0F1iLjjuKAqk1?=
 =?us-ascii?Q?AcgJoZsnfKtZyLcdI2FB6mMrHh3rT5cOWId9f3QFg8I8GJnLo7g9Set3KBLh?=
 =?us-ascii?Q?dcQ2/6Rzne27JvySALaWwV5CQXVqVKqwbGNptamAv+eb5VVJYTbk2pG8TZ7Y?=
 =?us-ascii?Q?tKU7jGRwbsOcHx8XykPJeqC1aKofTJUQzZdHZCDvCttvtKf4JHFiaml6OWrb?=
 =?us-ascii?Q?ihd2ULMKcUYdKFgJ8PU7Tl4sFQyNuo3V35sB/MyQoQkjXoWuF1goV5a0Lh5n?=
 =?us-ascii?Q?6YcMoo9ll71c3CSwJmrPg0d9u0ckib2O41ZVpzir1HjJ6aWkjyZn4I5MRI+5?=
 =?us-ascii?Q?5RO4ObC/SEihKLgw34KOf9yG4vzdZTWrAfnRXYylKsyeJ2it0jronToPjls9?=
 =?us-ascii?Q?RZ6PojaAUnDcCDUJr5jBbYLirat+jqMu0TDcv0TD9hEsJW5OXavIzNUF9nVU?=
 =?us-ascii?Q?QVRfRosWXxoK0VYqdhtkqeRS8S2O3oPPWEMfJkzgHHR/ygRk5xuEn9D16+Xl?=
 =?us-ascii?Q?AP2Z51AnrbZzCAXb21cLepSpmsUN0nKWQ04wJFswQ9dvynLywxZBSWjq/NBY?=
 =?us-ascii?Q?xK/EWW4Q1S6YZxMNS474lC3qKxUM+qGMSNOs/DpI8X7E+eMfBxLGq47rCfDs?=
 =?us-ascii?Q?QWoSllv1s9LOK6MI77WD9Kx5O5+Tk96b+6mx2IcNeq7knuA1h07Begx9nAj6?=
 =?us-ascii?Q?a94vnQl9/ObVTpFFh4bAI0vu337NXO30HJ57fUA1UENVodbcDe1f90Ks/xk8?=
 =?us-ascii?Q?phoI8yeXKUmAgLJVvIJKRQEwKcC3UNSwyLbpSvtUBsq9O62vxd7c19M/E2l0?=
 =?us-ascii?Q?Y1r4MJj2dWoRcMNTRq/r5SE9Sak9fmLnPhrtOWJdTQM6lg9KwwMchK7E5QhF?=
 =?us-ascii?Q?9y44gH5rOg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10521a2a-10b3-49c2-d44d-08de6de1bccf
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 05:02:23.7088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq8+sLZqIkQQTGNIbDchBeut8oot7yeyN8CCIw+uAlpCbF6XDpPIDzRmjqN9MPlE7dXJNWWU/KYuxZUJoeJRFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-OriginatorOrg: intel.com

tree:   https://github.com/Paragon-Software-Group/linux-ntfs3.git master
head:   10d7c95af043b45a85dc738c3271bf760ff3577e
commit: 10d7c95af043b45a85dc738c3271bf760ff3577e [26/26] fs/ntfs3: add delayed-allocation (delalloc) support
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602161952.BfQ8KEac-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#1685: FILE: fs/ntfs3/inode.c:815:
+	 * Normal file allocates clusters in attr_set_size.
+	*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

