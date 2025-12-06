Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A652C19CCEF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 12:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765025974; cv=fail; b=gSR7D8YRoICRP/MCxD2L+cxDcWsam/LQNFrctvaTow1j3ACpr//N5Pask5XY+TYKx3V416vBZw8u+ExWwGy4R+xyE2vBMMD+u+gZFiOdEWsbFZ/QY25xPkmJbpnmJW4nHTglAmrI4YxaRGLqKebNQYkKqaKi8M8zPjyKNShzUpw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765025974; c=relaxed/simple;
	bh=WoSfk77XPVoGHl3lDm+DWYeOBC9IAkD8NjrmRy6dSFw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=AWa7ve6boQhkzuK1ziipg9V6CH6i5VI2TvSl2B/MBK2u9gvYP0WFczDklE/+2e2aNlpGgE60sN7qEOnspBcnREs9D1YlBipmU+hGcojrXabSmeG8soAlPyjvhGGyRyXbVzoFwkuwChuUV/BopKvAPLdrIrjgwYq7Bl9JfdJzmUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jD2ymezY; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jD2ymezY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765025972; x=1796561972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WoSfk77XPVoGHl3lDm+DWYeOBC9IAkD8NjrmRy6dSFw=;
  b=jD2ymezYlBAOjE2VamosCAT3leJkPubT0cr4TIuVgl/ikIwQh9GGH4+Y
   8X2Yg0yS1zqYk3lAGKBiRa0Dl1ZUvI9y/dzQLAsNVd77iCU6mdHjenc3+
   F8R4oeR+Mbdes/7tHCFMxV0TvTcAn2rrQ1hjGKiPUZKNdY77r7zNzM2xD
   kZ7c2H6SQcIi+F2KoFpyatsQzORpq2B2rVUrtlJj5OTAcg/1z2B4joXHe
   CS/O6HHggLAm+rj1zCEwCD5rZuJ/c/HphdvvyvApvvt6YX8fFTfuj6FlV
   s2pNdvHk/YIjkijceGGZHct15wXCNH1uYPUXHPTwRW4aVcq8heHT0L1DJ
   Q==;
X-CSE-ConnectionGUID: TZ0XohoAS5KhGCS4Fklm1g==
X-CSE-MsgGUID: at2RBjhySWCh4gD1rSX4eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66227486"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66227486"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 04:59:32 -0800
X-CSE-ConnectionGUID: TJo7JVZDSBKuhInpseILtg==
X-CSE-MsgGUID: OHM+UPznTyeRVnECxEB5Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="226541505"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 04:59:32 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Dec 2025 04:59:31 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 6 Dec 2025 04:59:31 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 6 Dec 2025 04:59:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVhOpKRhyt04kc0IslJ5A4y7F6CeRJGzBic9mGp0xPuxB7S8AUKSE4uFIbhWB2gvjbCDKZmAKF0NSdM3LP98da0layf/w32jpvL0qkpwZ6YFf52z8VH0qP0OotgNycfoFIx60eWXmhKDsPTR5/zkaLNbXaua5yJgYTdBvG7GVCJXoxiUKbqHnrQNFvLcuIDfR6Cn+tpG8yl6KS4CbtnRsy7qDUSB/af3b9sGJ3qwFU+pZlDHOdWjALjLJgkbj1qlORuJoCYK1iWbl2RXuvbTx/k/QHq932Scp6or2EqNQuOgMShETInrBZGM3sUHzxBg3O1xQZQ3jMi0316giGMwdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDhppnDIUlIWOO/lK1vR1mLNTdtOAnQiCh/tA2h3upw=;
 b=rQl/cvv4z4TwNZEy9rvjvRiDJoZYH6B+cHvHZvOe4sFuGnYgnkHywJIQxlf2CRb7Laf5kjyFHgwXvI+Ljos2CSYRsCRXGXIJZIO9i+JVCkpvBdkYxvGe6PWrrpSmT+8yjzQX+BRL6bSK6E2GAJXkwqmxryHWoR+ivGgKe+4Tzah+gOnk7HGTcbNJS5ygJCzAL0LgKBbE/MxvZqsBJokFPxJVPo6Udf4TRSlE87+MXh0pcV3ENDs4QaOcQAQasI7psSruh9yI29RnM45E2UkeQLSOtZ0htLrWiQ+2Xe32//9mvZVqRXanltOrpTo5jGuS0NZyabksdyIfYiwe07BpAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA1PR11MB8245.namprd11.prod.outlook.com (2603:10b6:208:448::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Sat, 6 Dec
 2025 12:59:23 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Sat, 6 Dec 2025
 12:59:22 +0000
Date: Sat, 6 Dec 2025 20:59:14 +0800
From: kernel test robot <lkp@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [device-mapper-dm:dm-6.19 14/29] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'that'
Message-ID: <aTQoojhUIfLw4rUl@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|IA1PR11MB8245:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e153551-cbef-4d05-a2cb-08de34c746f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ySHKmU/BcK3O/6tZv7pidNNo7gxFfWaLuGaxJFwASmVHqBTZPy1hh+IhB1ux?=
 =?us-ascii?Q?lcxrhceLgl3FSz9eUWlxcU5ELa7896ZABweJURnbb4VFG5GXjHdq7huJkIJO?=
 =?us-ascii?Q?xPGgludDxEviokKEf5Z4wkdWvntS/o5GN4x0YphwE+C3RyoRHPD79h6i7Z9R?=
 =?us-ascii?Q?CSpjs0cOWY+lO1snIbX9LBTsYFRn2nOuE3O3Qu7sLf3mWx023Bo6YD8o97//?=
 =?us-ascii?Q?2A1Hd5nNi9+7smcqSK45mW5j1/eWbCxt1ZXF6u+zpZZI1x/LEgg8B5bIZKFq?=
 =?us-ascii?Q?Sso7DRK872UAj9fMy67exFYstX4nwLPah3KN+7sYC1QLH0QpmaFW1hAvFfCh?=
 =?us-ascii?Q?ftksUGuk5a3NlDZKQzSsTTYIPOeQaLBm/lnDLCahHegtNKJZyuvdwyEMr0hx?=
 =?us-ascii?Q?QyyPeCB+pVXNSwxH+0wn5ry/STSG9wdjvtBMIZdxNM/QQCTn0AupgGofDPtr?=
 =?us-ascii?Q?GHzaGiqhyT4O1wex+fXIdmdqtvgK/RHd6UySSH7i7G0GtJFCCOdO3VZvS+Dg?=
 =?us-ascii?Q?TgYAjWNUNJWWoFmXsQGSHyFf33CPH1s45nuwvbDvZ3I41Jr/srx8apZYjI4C?=
 =?us-ascii?Q?fKYDa5UQpGT4+/u2p26SSql7YNwE3KnAoP+5TA2XC9fEa1sBaKlS4Rq1UIre?=
 =?us-ascii?Q?mxtBjhiRr3e/jOOtbwqvH7xA9+fHl/oW9zDI8SSUxUnPxfa+5RKt/DeuLmv+?=
 =?us-ascii?Q?9+TEzXwPeRPfZFmahMqbUGs/7JwGNt61X27ENvMo+TbhmDnJDMEmdo9yvr5F?=
 =?us-ascii?Q?u5iBE3qm/ourAVt1rO5/3VmVOTjNAMfPZJGHKmrHZGrnaru+KnzSCZ+Ogy90?=
 =?us-ascii?Q?SUd91AsgAh+mLLFUxcLoMLMcjsOGrFjDlEGt7g7sWGgP5RkYZlrovkQRd6FB?=
 =?us-ascii?Q?9PPT35kjiu97fERXLY6QVba+QyaHiBFJXNcRal+Scx9jr6pFEHRdyAw2n4tc?=
 =?us-ascii?Q?+BPVglDQY/ynKDo/AmWBS9szDks8P5D7u8KI8hq/Segcz0sPfdQ8nr5vD556?=
 =?us-ascii?Q?yCOAobOoOjoHvKLdye9jpUZH8Rf3ZB2CC8jjQEGe1dxldarGmBtPXnkc5cM4?=
 =?us-ascii?Q?hWpkrGBhhJ9BHXLhu6BH/GffKVDjPIEifTHT7QbyEyGJ/lkYy5qTZZ/Uf92e?=
 =?us-ascii?Q?afGypzOywaii6DNXmJjOXHaPLfCd2qSXa1hzEvY3+Ze+xiLHScZn9j0Xsusa?=
 =?us-ascii?Q?bbADhqD/S5/TSb5vwv84cQgvHU4CQjow1N4kjKmQ1y79ELpM8LC48oW7oAaX?=
 =?us-ascii?Q?O/Xmwt49fX5myKfe0lmP+fvb2tG8TgeVG+KO5VZa1wZR96IQynxhWXmiE+0k?=
 =?us-ascii?Q?mdpUnv1yc79XCggvhDToXtkb0phUFYIhEUtX4hmgRq89dSUTP55r52QQd0fP?=
 =?us-ascii?Q?mSY6hMHzp5X+qvG5rOtJFVlPn2Fs/4T0sQjCl9OVOjKlfCehCtUxOM2g+CVB?=
 =?us-ascii?Q?TDvZSYX294finP8++Zc6CBGkTU+fCOxpZJhgNasNdpnB+t4bqt6f/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hyhc3A1Bh9vrVEhv0XklqEtHy7JNbQ4KmKA0YwBhlLArjCL75ey5V5DdDEFt?=
 =?us-ascii?Q?YlPVUob2GxKmmN2CU5lhrluAjLtwm9jupHMu+VygQp0Baoup6njY+lEl4Vv1?=
 =?us-ascii?Q?o0BN4Q5K0HceEuZkBWdq0VJ94Iv9k88ghTzkAPh3yFnB/SPPN7756UIWHpJG?=
 =?us-ascii?Q?7bhD8ogvmRQaZ6dyah43aEyKkj6zMVS0JRI0Op9hxUVvxPubvpuIK6dH1T5W?=
 =?us-ascii?Q?4NaEVVOg51v4dQfdcSQZ72MNVx6YKBlO/nkWlQAEDBW7/z1voQ51b+jt+JPO?=
 =?us-ascii?Q?nhtbT66BhY+P9B2dUBwjFouSbgCKa4OqyxmKT8p5EUi/gS/zg5ciqhQEZG+o?=
 =?us-ascii?Q?IlvGaT/4RisoGLd6j7XaHXLeCg3/KCjjCSeQbMkUbEyz3arXlW3sXx+t9FE/?=
 =?us-ascii?Q?iIhdD6beukRHfFK46ksJhiGoFkb5u5BpGhyVhXxJ7bIruSYQ5BQNnf2igSSR?=
 =?us-ascii?Q?qye8Nt+zwMmmqCaF7Pg6VOawbe6JZcOfdtWcBrmB9SngPhrZeaW/WaDng0OW?=
 =?us-ascii?Q?/3qsTptnboca+ghYaX8Z0LC08ss2A03WTKivrSMBiTlsyTzyZaFMIe9IzXPi?=
 =?us-ascii?Q?sWQ8xqoiu4h3yReygKjwDBGYntvw2z0+v0wppivQkVaUoXvHPudDE0GvhYkQ?=
 =?us-ascii?Q?bmy8WbcJBPPvQoILVZ7M4aOT6b5Qnc+CaYn7T74fYrHTepTtZ/2qL14G+BCd?=
 =?us-ascii?Q?Hv8u3OzqhCW+1LVYw0jd23Cs7y8T/LxeY0lf4a78Z86KJIcG/whs14YXlRjv?=
 =?us-ascii?Q?wok56v8+0OqnULp6Y6Fu8n1mN8k98SiKmjl33uEHj4IeoeBD0ebW7J5PqrgV?=
 =?us-ascii?Q?DM75WKecjDSQxF4NIYbHWVIUoXkPN+s1tvjmUwRNq3z4RP0k9qnQ3/AvSvpz?=
 =?us-ascii?Q?64yxPeAuzHbKbxYonIw6cTuyE2m8jF89t2trRFHGQC6bMTwngZbZcf91tFqx?=
 =?us-ascii?Q?nY4OOiTXcWhzyYcZbkgv41sPipUujp1RAaXDSHd4MErJLq5IVREE71beRBUH?=
 =?us-ascii?Q?1liV30Ui4Fv31U25eDiO9fJzepvqlnbLKyVsZuIfxLrP2yIHH3LpVkI6zaY6?=
 =?us-ascii?Q?Tsbzxa6rgansChVii5yG1KrAmxxhwsgXm5EZgcq6b8qixYLXPzDhGDhXtwt7?=
 =?us-ascii?Q?uCgHHgoibm0/NEfnwvALTHINHIdz0wPUA5CoyFsMSrK+xgjuqQIADp9/Ka0r?=
 =?us-ascii?Q?mP00etD3Qz9gcsuOHw5jlcUcNJN1SupLTXCGmBuVJup/dwk4iO8uA3t9Y6jP?=
 =?us-ascii?Q?q2Ccht8RqGGSu/7XGDIevesOVp2+ow2+1HZ/EPLErkYyDqiZUzb12r4N7AIq?=
 =?us-ascii?Q?UWM6iHfQ/PhnKcB/t3IGZbQ0JIbevwGWzz+1tTH5qwffehRpLE2evL9Gepok?=
 =?us-ascii?Q?5l8lMkXrOQsQCxttDBCbCSRw20Sl6KBOwTxbusUAa1ic2qREweKcYUBLSic0?=
 =?us-ascii?Q?sR4wBf3XMjunJF29cvGVFUWZCqUNYqYyvqFXOn3Gh2LNQIBlDkaTpuLbC/en?=
 =?us-ascii?Q?V0YW4FDrV7msvbRSbFtS875Ti5HPIIkqwwxkY3s5h8ZUBhLY0Qx44qFmVBIv?=
 =?us-ascii?Q?z/tnfcH6aqgLjwlkOFPH83jr2Z7FzzRFUEmHEb9b?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e153551-cbef-4d05-a2cb-08de34c746f0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2025 12:59:22.8096
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/669A6UYXjSCfjSoM6GBPHKsO9ysMy8MrN5upPgNhiYe7xnHkcDlUxDJ7ESaH9t+TlEdJyPKwCL6VinJVLH0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8245
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-6.19
head:   58a0cbb4f70a5dfbb7b70b50ad2e13026186b14e
commit: fce0ead1b7542095f042126b0259144f34d9db33 [14/29] dm-verity: disable recursive forward error correction
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512061350.fAGFuJBe-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'that'
#12: 
actually created an image that that pushes dm-verity to this limit - and

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

