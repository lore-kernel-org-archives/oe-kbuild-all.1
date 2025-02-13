Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D578F24
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Feb 2025 03:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739416168; cv=fail; b=dJEAyWE9X9grQxAY3fydTXHTdHez4ukIn4quqAxRzgaOAGeuHXBVcfaq4JtIl25gLethoxeFr6lbvVcNbphSsNF5V8TtnUvsigzwr3amqn63lwVah/VYN/NK2V4PIL1Hc0TEf1QK85/8yEOdX9SfkhuPpzB5yGuG5x076LOWatg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739416168; c=relaxed/simple;
	bh=5eP3kNrjfuiMXH/YPi3cCQ0wRyj916YIcCCX1n1bZC0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=iLtm5iRWTsnS2+Zd+vaTsx8pTTS3+CtZPpGF0L4zpAOiJveBMZPfi+3VlIzVfQjPocX/FM69dwksVJ6JX4Z/H23oYt3za1ocH885sBzGh60H3m5f9DZWFEfM0yoKi26wPOL/iolgobG4M9BCWatusB8UE/5URTse+6A1cLVVn1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rb2b7uL9; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rb2b7uL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739416166; x=1770952166;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5eP3kNrjfuiMXH/YPi3cCQ0wRyj916YIcCCX1n1bZC0=;
  b=Rb2b7uL92LJrwy9mwE/pfZsfeVhpd1v7p1BNQ8PphXoO1xbuZY3kSY6j
   a+3pZk7NbX6gEB0X4DgJ0z33EYahUbH5LZ5ePkzHYFAW02OQts4+SHeKW
   snK3mcFCgwIwkDlLfoHdPYoiADpxvyComqm0ZX462wdumh4KaRWbCvY36
   Lp6B/aCecJuz0J3Dv/UvP96HJStK/D3dzXf0S3JpWfVBBm/oCTwgJk9jl
   m+Lgul0myzUNMAYb7Ae3CQMaA5MU4FY4p1nNAfL9RiIbTMPDi+NnyIXZe
   NGyNSrsoqLKc/dIO8E0DV1emm9kmITLqQNiWW3NVhY/x+WcnlvQjoRYoL
   w==;
X-CSE-ConnectionGUID: xFB99cC8RemadQdD6Nf04g==
X-CSE-MsgGUID: 5ATTm2ybRBaVDX+kidf5tA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="51533660"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="51533660"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:09:19 -0800
X-CSE-ConnectionGUID: S+NfYxMnSpiIFuDMWcjoUw==
X-CSE-MsgGUID: ZG0yV/auRbeM0FFO4BKuKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118194448"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 19:09:20 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 12 Feb 2025 19:09:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Feb 2025 19:09:19 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Feb 2025 19:09:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1uefhYUOMsrd9RbqP8245gOVbnm5/AsXC0Ix9enfCAcYsRdeG0muaZ+wQoSQlgCRBDJ3QNwzmlhXzMj6il2wnvpdCwtf7mToZzKq49NG21zYvG2yclodsAp8RjaWeefn1BfbCbTvuKFamymGm9wVRh82go8hSJI3VTCodxnZozgwFiq3Hahzfwv8gMlC2/MH1BcTZjnWnF3qi/8yD6FhR3RIpatgS+aWhl+7lX0a2D+AGJrNITcheYYZSiJueWILPP/FvSdlkjWL0fBghEfZbLedg3Rlk72uG4o5Jlr05XhW22U1Xe/bpU1SLyQB668i6IzeivNnwpGE5+65Tb9JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WljnFVy0hYm2NhWlaAbfiflYMrxPDP/l5dsoK3c6n0U=;
 b=wvwXCAdx//ac1q/8g86tOSxVSTDnSd0JVriepBGTkBV1RepLf3hy2VmfpDLu9UQWL6njhOUHOJ3WHqPVBTNzvPh2p7rEEEBc5KDBUZ3tb+9UdeOltK2Dcsatu0xOszCHZYYsFVWRiiwYIeF2uGXf6lXpKhjH9EDt+0i2uKSUP9G+Si/bLPN/PK3QB5BU0CRdP9/N01QlF8ozYZYobEW1qIjwa2C9ovI+wUD2vCBB8b+c/AN0+XIPWz6yLM75sZugKtQQHe6pWlzSZrva9iaNfcpsLYeMYRLilGVXFiuSLQ9b/nc7BJFQVAibX3hzqiBmeyxiOcm9ztXv9qZUPzPJUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV1PR11MB8819.namprd11.prod.outlook.com (2603:10b6:408:2b3::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Thu, 13 Feb
 2025 03:08:49 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8445.013; Thu, 13 Feb 2025
 03:08:49 +0000
Date: Thu, 13 Feb 2025 11:08:40 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-5.10 2737/2737]
 drivers/scsi/linkdata/ps3stor/ps3_recovery.c: ps3_ioc_state.h is included
 more than once.
Message-ID: <Z61iOKC841qtXvAn@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV1PR11MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: a0f226ad-bab4-4dd7-34ac-08dd4bdbbc65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u6wJGjdm9GcVTMm9YFaVG6pMv1Zv+aSprOAW1KSUXGOG/jcSpWIee4k7YnD5?=
 =?us-ascii?Q?KgaK7nq+klVT4UPXAGILC7ikQYzDvGBDrWQZEVN5wsvk4uFkyRsduPXgmyWW?=
 =?us-ascii?Q?0p1gAwjXQm5k6UCNFvCe6uJRJYIGgv6RbDLdcrNgYzUZcg0LYgdwTshN9UXb?=
 =?us-ascii?Q?cqukWgYGVgiLond2378awZd8SB1vnh/clTqwHrxhbdYLiQ7pTXmYEs1LlBV6?=
 =?us-ascii?Q?IjRIKpiBGoZHtR3wrZEzd/mIO5e1RUbDDnqi7B0/ZTTqlp0RPsEnljmV5iu2?=
 =?us-ascii?Q?6REIwsMHg+dEGS3XN7fAwttWchR2g57JJ+4e+RX6ZhiHwBSrzfXfeZMZ3DDx?=
 =?us-ascii?Q?PEJ/od3fYfJ7V+208qynDsolqk/0rDkcH9VINNw0ekSoJVCDtMi9CzjarbI9?=
 =?us-ascii?Q?qAfVyQmJzYL2/vJDpCjBKZbwPBVFMp2PVnPDxAzqEHdOx4ACogDJPdwXMI8X?=
 =?us-ascii?Q?rh9sByyWcZK79AZ3xwGVp5b7QewN6YyQjF/xBxP/Y8ZWSG4AlAsKc23gic73?=
 =?us-ascii?Q?mdZLEZPeIvqjXLQLX+fQJXqkXjz1C8CNZBQV+Ud5m2E6Z42yDT9PRz96w7+7?=
 =?us-ascii?Q?tFdNx6Vl2TVLR8wHSJmshnceOmQZh8KdlEJbMRERhiwumm7XZJRAeNBhwG0T?=
 =?us-ascii?Q?EyvEeLJ3qByfkchbowst6l54YbLVd3WGAM4vtnqsEqh5fES9oGu/UeNEuKJ2?=
 =?us-ascii?Q?Z3fmt9PsBlaWQrxIT0tSgjJDXGjzJ96YrGcZ6/TQnhX8TYyY5aNGtzn4A39H?=
 =?us-ascii?Q?eN0iEvHcHy66VgPO3yHrvjsp3Tn6WhPIwvI+GYmrwnuwteeR31xB8Ei1OIX8?=
 =?us-ascii?Q?9CxSbC4hyhIk/vVhO740fjDyBMoVYt3LBLgk1mwFARBfR8WPIAbtKWsB1fQf?=
 =?us-ascii?Q?Vm7RV62JNvk3Z88ekDL4mNgznw6f0DYt29C2dN8yIJayXAtEx9flHir8ro3Y?=
 =?us-ascii?Q?YC4ctpWyqq7CrYy8YydOm1zmc5B+9vOp6798lDWwLTTkBqd7vVfU5B58EUPu?=
 =?us-ascii?Q?3p6xQhYZqMozgojQ/KxS34ba/E5Fyzgmuzi6zpDlwcvfmQiGI+Dq3l7yLVWN?=
 =?us-ascii?Q?6I3NDL0ChOSVJK7axgY9egcfu7qyquQBgI7RUxVTZxhGNHcog/xntMWQyqjs?=
 =?us-ascii?Q?MuLTNdUz4B41KCvu1IjYJYa9pX0ayDUQUgrPoOWQXe1doXyyIfq/yaCaZvvn?=
 =?us-ascii?Q?KMTrqRG51KhX7LGE0Gua3jLS77CxMbKfZWcOWoyEl1I08pAgIkxcNvo3drbh?=
 =?us-ascii?Q?acxmcqapnAySMaMd619sJEJGELx6gwaeQB7CFpA5AepzOu7reyB4N2vZqfsN?=
 =?us-ascii?Q?GSS4U7tVfqxl+CHYaI9wf20XLYuVOaeX8cpumWZCeheeEA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ILVJ1vkYYjCFjQjxpXCYK1tCWebTcMt6eJlZosFAEJHm9sIsl1lJ7v53g6VJ?=
 =?us-ascii?Q?y32mAx3PNZxFUgzEM1no3C5yiGPhR15BYz+KC26VNHKhFmJiENyvT/fs1d8F?=
 =?us-ascii?Q?7EtPzDDngzPN4n6AZ1tlcBWlDpLQYylBmTz5oZ2Pyjziuc5ZjrztXrBNJvHH?=
 =?us-ascii?Q?mwAK99NnL2uM9ZdxvrFdEUolf592mA0SxG46D991NScnWoWUsF6hf0206csR?=
 =?us-ascii?Q?vRfBSLl1enjNk3ocbtGaQylL+5ZuCbQWu5MimhblXM2JLtATDsQvchXn7+MY?=
 =?us-ascii?Q?VPeVuyMHPStS/y3fCIXgcgqz3zP7r6aL8jMhLzzBDH0wjBKqwiA3G5jieC5E?=
 =?us-ascii?Q?fiVD1m+es0eEtn4iAJjIe2mcyOD++BS4UHDHytYbV+RiJdFWxIosC/36aLHe?=
 =?us-ascii?Q?2ntRDPIa18g0NpxPR3+EooSqYGVD3dpkfzCX+FlicJt3aUE6MLTxzuIUBEwu?=
 =?us-ascii?Q?AsCDtzwc2B8ieYQOeLiViWTTr8t0ot/hfEy4TWbJC22CSi2tIosyu2/ET4sL?=
 =?us-ascii?Q?/bbl1w0+RsYKRApEgldvhLyxWyRj3X18fMKzdAJdwZ9858V0t0pzplUO6ztk?=
 =?us-ascii?Q?THL/9+JifexqnYSf++XMr3JUKbEn89PDhl94EHPlGhRL4zZV4/x0v0sqVGNq?=
 =?us-ascii?Q?iwHrGPlTMBGhZxSno5xKLVXalpo6sKtN15d7WSm4iXAJogEAVOD7mTqMF3Ad?=
 =?us-ascii?Q?cRw2/KHSvJtzjHdGwbRkzSronOLsIErt9tUHI4aMAZ8AVw1ULnlZlicZACkm?=
 =?us-ascii?Q?S++hO+HplqENz8WW+I5cKxrFaO8i6+9qUqZPnM0RaXlK9zdmmFqt0ZOyQz0a?=
 =?us-ascii?Q?BhXUsVRQ7KL9aNhfAlllVVZRESc97+5s9fuKRIedosYrqZpuPFxvQMMSL4LX?=
 =?us-ascii?Q?odo8QWGmhxXpwoLwsO4nA/0NMavzKobRiWc70qs/sIfFden362yh4AKNavHC?=
 =?us-ascii?Q?8p0mO76veQLVMRXR7pyTaAMsfJxHeS6R7iZIKMRtjU60Df66+lF/BYeh4KMK?=
 =?us-ascii?Q?IUamMAhU70VJ6nVBN7ND5kg19+4iN/vo+f3AmrWxZpxXrLj9AiaNmtGyN1DL?=
 =?us-ascii?Q?883HTi9NbGadfe+hg+sLkemU5+3c2c0jIda7krJLG/aUdvbj2VCAnLvKBtaf?=
 =?us-ascii?Q?JlL9D4pufszGwsQQ/86monxYKayTv2wcfukLirR92Z0Ijsd4Y50ZRvGhbBAF?=
 =?us-ascii?Q?815iOYelqHFuv4HmsGCH0RsLwnwKLLhWP+8oeKwQRKJ/XPtUGd+AD7AGqRQ5?=
 =?us-ascii?Q?3pKP+J0yIwObJGkDXldG9KDwIlkDCon/kal8SWsag1Mooz92ALxdL9t3Q1Rw?=
 =?us-ascii?Q?93a/uxu5jnfI3hM5/8cCnACgvooLFUEePdc2AtE30KmOoTbTjsHcSAWrf10h?=
 =?us-ascii?Q?m/G6uO2thvYKG9/H4u3vAsqdYaZV0UlrE6wcXEH1j6T2AWrEHTOHIu+TN5YZ?=
 =?us-ascii?Q?KcqKx7neIlcFfR3m3bfNk9yGRA9RE0jCYNxOtd56MmOGsMNDQDJKpANs6S0E?=
 =?us-ascii?Q?kdnojza9zDXOhYfRETOvh2UUyqdlUEOXUIrCUHXjW4xR9fK3vM6OCThwMjKd?=
 =?us-ascii?Q?m/CEKtE1gqrZJKYGb9iv5tQ+tIFzYjRxsRqa6j313ZvrXEa2r1I3/9ERZg0m?=
 =?us-ascii?Q?rA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a0f226ad-bab4-4dd7-34ac-08dd4bdbbc65
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2025 03:08:49.2482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1y9Ml92oFrqqbrfHGid/QaIfFY9S3NAI7hHicvlYcAsVi0GV0lMa3qixCsb1yGr1oJIyPW9RiPwM4A/BtSEVQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8819
X-OriginatorOrg: intel.com

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7152a244f5f9fb024d93d293168ce0b62309680a
commit: 13f748eddc9dfdec8a18922ed601e1906dcb183a [2737/2737] [PATCH] SCSI: Linkdata: Supports Linkdata HBA/RAID Controllers
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502111949.SlRodAD8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c: ps3_ioc_state.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_recovery.c: ps3_recovery.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_device_update.c: linux/mutex.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_device_update.c: ps3_device_update.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/linux/ps3_dump.c: linux/uaccess.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_device_manager.c: scsi/scsi_tcq.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_r1x_write_lock.c: ps3_driver_log.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioctl.c: linux/mutex.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_debug.c: ps3_htp_def.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_debug.c: ps3_instance_manager.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_channel.c: ps3_cmd_complete.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_mgr_cmd.c: linux/mutex.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_irq.c: linux/kernel.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_scsih.c: ps3_module_para.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.h: ps3_irq.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.h: ps3_cmd_channel.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/ps3_instance_manager.h: ps3_inner_data.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: ps3_scsi_cmd_err.h is included more than once.
>> drivers/scsi/linkdata/ps3stor/linux/ps3_base.c: ps3_driver_log.h is included more than once.
--
>> drivers/scsi/linkdata/ps3stor/ps3_ioc_adp.c: ps3_scsih.h is included more than once.

vim +10 drivers/scsi/linkdata/ps3stor/ps3_recovery.c

     6	
     7	#include <scsi/scsi.h>
     8	#endif
     9	#include "ps3_recovery.h"
  > 10	#include "ps3_ioc_state.h"
    11	#include "ps3_event.h"
    12	#include "ps3_mgr_channel.h"
    13	#include "ps3_cmd_complete.h"
    14	#include "ps3_device_update.h"
    15	#include "ps3_ioc_manager.h"
    16	#include "ps3_mgr_cmd.h"
    17	#include "ps3_scsi_cmd_err.h"
    18	#include "ps3_scsih.h"
    19	#include "ps3_cmd_statistics.h"
    20	#include "ps3_r1x_write_lock.h"
  > 21	#include "ps3_ioc_state.h"
    22	#include "ps3_module_para.h"
    23	#include "ps3_ioctl.h"
    24	#include "ps3_dump.h"
    25	#include "ps3_cli_debug.h"
    26	#include "ps3_kernel_version.h"
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

