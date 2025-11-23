Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD42C1A9F90
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 01:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863198; cv=fail; b=hN8aOlOeYMPAOup8B5zaByCzLZAsST6ffdvzsdB0mUILh0uRn7AlQv+PQ9xE2+iY9SBJVBGIzl8Q6BKC7tFsNAdE3jc2CJMwvFxyD5Ne1k3T2ADG5kyJMOn2vUT9DnCPX/aXalYrg2ZUjh2Dpa++0SJZM6mmKhMnT1w5FXobRVk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863198; c=relaxed/simple;
	bh=ZnJfRV3UucpdfDLiIyXXiT1eBU3/5YxPmDhe26f6YJA=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ea6dY3pe9AbF8vLuvcV/oUI4IXrCJWPH7uvU0oN06RdbPDyNQS2cx5GIchz+hMWw+1Rk18k7JqlBnIoSo/d1A9Q1fK1NU6VN3djGVIXZV7KvZTWk29hygifLBuVxv3bYxgADvXFTv84kHZCp//efXYHZDYG4fURwEs8dDNinYNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoGiGZ7d; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoGiGZ7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863197; x=1795399197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZnJfRV3UucpdfDLiIyXXiT1eBU3/5YxPmDhe26f6YJA=;
  b=HoGiGZ7dCQvC3nuyP8b0u4q4Ugs1ie79kVnKdNVqGM8PafOA57iu9H0G
   FQZF7Wo9zavw6MVk2XsaPNAYyGv7OGQ39QnoFGk6afxaOcjoGYP/9wqSI
   6Aubxi4g6miGCvcVAzMDCUh2LiFRrnYVSIFk+JAlJMEOpO2lBaQJArSI+
   3zz/Gzwjvp9ErhRFUpC6lnGFp07Jlq1lr11B1M8KNns8s72OU8sGnHsWB
   IXQfzTcFoQg7jiz0Nz/0d1kbPl7roX1dAd8qKj/37kDgFy2ZaskhRU9Dv
   M+cncC8j4tTmHg90was/nnC0TfhWd76bAS/ZkyZAsr+srjmF6ekM3tK/i
   A==;
X-CSE-ConnectionGUID: b6w6WtFIQxq40LVisyVX/Q==
X-CSE-MsgGUID: diLr9FcTS8KEEGCofc3ONw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65951739"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65951739"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:58:49 -0800
X-CSE-ConnectionGUID: sIBH+UwnRnSd29EcQHGdew==
X-CSE-MsgGUID: tIyBAwBnQouAuFvVyqjI4Q==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:58:48 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:58:47 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 17:58:47 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.55) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:58:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMoHh9n3wDT99/mFS5mLm2m6ciSXosimMe4YNSkrEA5qQ8ynOuQ9l9txWgMQ/lMBXC06rTNWIxj9AR0Jmwqke4A9riov5u+Sm5Cx/d/jalKiEEGFPcjQE5Tyv6tj47VSBdvO+zVuNXsUEgpMJfQZ4Bjt/VaJGT6znPdATUeU/4Dw1hE4T/IEXRBJkaFLgkBBQck+Xj0NjDYLJHdqX5GrFfo+Kr4+KeRPX3f4yTcLo8upZ16kBQNjnCqmAuON5hPcXu78plXPRckxxHbcqHWFwmjOproJc82MaF9ee+77PRZBcJu+1ozA8jpxDyBSw4IrtTVX6/e951ZJmztztHWPGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q9zCT7Ugi16h/ZbuSMZSSuazSJQZ9JLeWwuR+RmPT9s=;
 b=q2sWCvTI80hr/ypSYxzejcO6keOc57ahpxqreKbsQsyMksEemqYTNS1expa0vBLK1/YRkg0yx4Xb3YvGzjNOz4jzhvOLbFQEVZI81uK0dNolyE5Y3mkeQ59KoZzzjZGWe2s7+HHiuGIKO4oqJaonU3pDe7zJiYdbm0LQMd89ADwnUjCQ7dkBphjBR+Z6w3N/e0zsigJGrr7RXPbJz95CZrHjtK/2CHfBgk9nP2talSFCSuURxUFrD4lOCnUaJknMA01MeZjFVQW3dXvlSMjs23rkYixQJWHhwVaMGkYhxh45sWbpJ8FS+Dg8FpmRsRrrCUKnIVKLoNbBkQVl4MkQpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 01:58:45 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 01:58:44 +0000
Date: Sun, 23 Nov 2025 09:58:36 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 12/12] test_memcontrol.c:667:6:
 warning: variable 'fd' is used uninitialized whenever 'if' condition is true
Message-ID: <aSJqTIcZ486Tlo6z@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|PH0PR11MB5111:EE_
X-MS-Office365-Filtering-Correlation-Id: 34e31943-5051-4665-80c7-08de2a33d55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vkoI00UCuaYg9tTSYP157USolnrYPJuhXZdMNQF/VeGUBr524mLBpkBNYl4m?=
 =?us-ascii?Q?H4U7wUQqSdRd2EuLA8U3lSfAIR9mK40QMIZCi8HUSjp9HbjyfqPc302F8/A5?=
 =?us-ascii?Q?WcwFPDiWhkcUY6YhPjYQfeR02lOwZQ6FVq9JRW6dQSJsawzB0AmEcdgpRcFG?=
 =?us-ascii?Q?AH8x8iKbEc4ZFEmsbVg9Oz3D9xeYkAL3t2ARP4Uc5yuOT4rbPhUCPTjIC9r0?=
 =?us-ascii?Q?nb/2+n64UaF7KSpPgx1EMYkIlEskoczetCGM9Y1UtfRW4Sz9n8p2qab/uE4E?=
 =?us-ascii?Q?jGJLhC1cUu224N83mAcZ9Hv+0efvEdmGpjUGrYAmINykcqgs/KU2O7Dmtpot?=
 =?us-ascii?Q?Bi2CobswuSeQfun/uQdjvVAl+2beME4HennuOu1aybKvpj10Y6hiVpqAxda3?=
 =?us-ascii?Q?/Rz2fX0tpqfDPJYaG52b45vYVgYv4YUmZQLz1BlqgxjF+NsRpKUJwFAIKptv?=
 =?us-ascii?Q?gdd4TR0/PzZGlXrs3wsyyxjdgOThwzOSNUHqLQrKLHoufX8cgKJ6VPZJqVXh?=
 =?us-ascii?Q?4DvaFkO2MuAzquVp9cls3tBIavjWglvuDrY7iSBwrbvUgmBSF50dwCuu0LiV?=
 =?us-ascii?Q?PGncSdVcYiXftkueinLQpj2aHfRff6EuZtdmDjyrLPZGKKHl/LEix3N0ghnk?=
 =?us-ascii?Q?bpRr1L5gafpk0WYOgHwcNW5xuaP66Ewv9jQWwscfFdt/Il6igD5RqCEpmK8z?=
 =?us-ascii?Q?AJDZuq3ygvIUv9uLOcWsu/xFxXxuzc/B2H6zrEGDEHgPUloPE6xt5rFuh9DC?=
 =?us-ascii?Q?LA1rSNSOyYekRH1QNC4jr6iy14kxv9pkeN5x1XZRQFIVmnMo66mP74bbOQgi?=
 =?us-ascii?Q?FJ36fg6IcGQiM42uU+hcI4+J150wpxusVVSQEJ9TvmnQP12D28kjAF+6HoZF?=
 =?us-ascii?Q?u4geoZ4pIk8/Z6rSmcxO1CvYcXVcetnfOYCboiyECJcQUQynFdWbzYAyperm?=
 =?us-ascii?Q?Q0GJca/MrPTWX1T2yvP76MABvBgpf3EpDkVhpHVnFnMJjKNTMOoXf85lcPjb?=
 =?us-ascii?Q?vxINrcywaU/c8WdfGVB0R1K+jVtL7OsE/e6Pg3i5hLBAAezqW29KxB7O/xp7?=
 =?us-ascii?Q?N4X7ztD3m4oYHZXOY1pmt1OFw0cUA5VF4Pq7wSys2zZtf7wXDm93CX1rOd4P?=
 =?us-ascii?Q?M/0qPDKYI7pIms7T7nH0Tx7cmOa3HeMiVfLrw9X9Y3+hGmMEcGQMSEThibMh?=
 =?us-ascii?Q?gNrLuIABetqifQO/W/p206/zi8L2ON4++vMazNJzLtcsXVLJexvhQp8bLlOK?=
 =?us-ascii?Q?0mo9lp+EDvTArTxkE6UGrNTkqQU0KLfAPZRtK9slPizP0lnlo9eytIQW7MEZ?=
 =?us-ascii?Q?USM6RkxvqfRqJNtQYttoRolJsxQDJcaK6EbtiqAqwR5CpVjb9WA5As3AbTU+?=
 =?us-ascii?Q?2qC4DUhQcl9olcJPOQDYmuNAMDqei/bBOgX+VU07srMMP/W62DZ3+caA8+dG?=
 =?us-ascii?Q?h635Vc1V/yPjD4+ozHFy6JzO2vWguk+bZHCLttr0/k0Bwdgyds9gMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ctXatWTEofOHJqSddD3iOY6sZ9HpWOw9bQXIMIwlPowauLpVr3SPNNgjMXpF?=
 =?us-ascii?Q?M041HQnHEMi+VUQ7AFjmJBvyCa9Z4RHZp3jCsHRSCugFDRKEI2NXGzDcOfj9?=
 =?us-ascii?Q?2dWiC5CRtBeuk0nW0G5hoD+cjs2G4UjKnRKwDcqoaRuwM1GThMtRXRO+iApg?=
 =?us-ascii?Q?HIMusdXbcy3n98XH/6xgCMYuF8u7iBKUM/q/aGELi/75xhR2c9m1HXuZKjqk?=
 =?us-ascii?Q?3xCP/CZunWZX/6RJ3bfwC2PYvIvfZtBe9TuyxIEjna8/BANo0XrrJ+cIiGID?=
 =?us-ascii?Q?h9I5VJbpiAy7I24caCVJC4X40O6UYm4LvxBtfqaQUsAuon/VBtZs53Na/Ir5?=
 =?us-ascii?Q?SJ61Qbcm9cowQAqOwassx5iMIXcXDJ0GMcViWQy/uWJh0F6I+W1yMnUfxJ1v?=
 =?us-ascii?Q?21zIz65I2/gOEYyN5XMklGE+N7WEh8pZJ/azldCdPyJPnx8eblZgK7glN8EX?=
 =?us-ascii?Q?mrtM1qEojP6wxOjKGWTKDvg5rGpK4acL3HODf4scR/TD1+Hh3/7lbOYXO6q8?=
 =?us-ascii?Q?Ni7dMza7Z2YvOLCc6ReYAzQ/6RHpfvHg8mZnANeRgIfFsf95Y0HILeV/Qfe1?=
 =?us-ascii?Q?/jIPjBe4J2aLJiEZwMrNLFttvYLA8wyyrgOIjUKZdGDtZPAwDk7F5OicP1sf?=
 =?us-ascii?Q?n8AHrYKgvL0nVbTHIJkuxAPyct7ttUbUSGKOvJNrsm0La1AG1GnXLovl2bYt?=
 =?us-ascii?Q?6urcosFOkPpm/1qGnV5xOaWPGpCyiMRRX5L6qv/Ck5ZJpfAMeN878Y7f2K6Y?=
 =?us-ascii?Q?/chuqPfdX54zRKOpB1OEAinqYZTb27Ib8VsHexngGBa3OClYCS2cCa/4u66X?=
 =?us-ascii?Q?8yrqY0t8X7qDhrxMRG70fTzloNSRn8meeOW3L2otBJM2wiborHpetWRMjBPW?=
 =?us-ascii?Q?CWpmWDDDMrNMFCpX7hC6WF29HBubhWpdRwHm3fdVoVKTFoPZVQWF058fTe0W?=
 =?us-ascii?Q?zthZubchMoYmkBnivStgCmuWQWZ84T2p2R5si7X6/PzsrewLIFYrMG7OXXFK?=
 =?us-ascii?Q?ZosCezuJbMffslebUHmdfkIgbUpdElMbvwvBDLsv3oJI3UEw8zhQoMQ3jYYV?=
 =?us-ascii?Q?xEnj2tYgKu5DOkgh8LIZ6XDYaJqtiIq6HcNfIBuPurSSCCQ7+pUCAu8c/rzA?=
 =?us-ascii?Q?f3hETf5qTAfW5Qu85elNUprV52hPOTbx4Uynve3AwSxjrDW0/VRhcc02JUD7?=
 =?us-ascii?Q?1YjHKhoNT/6sHPIrXEHanp6zDFxCVQ6RjR8S69M0Wg9n6oNlFGv8PYgyGL5c?=
 =?us-ascii?Q?cedSxUk2CdhAROEPxq0qIPzue1hyY5B0NMdySAd4gcGGh4F2GX4GwaoXyBvo?=
 =?us-ascii?Q?rC2BjWTqBXh5o02l7sNJb+Vmj3g8QBhax42l5biWzh6IOhm0QfjeEZlhRXVP?=
 =?us-ascii?Q?i5CF9SkOosa5JErttTffs8l7On0hD5t+trOypGc46LMjE6Ra9Xsw5oHwmIjB?=
 =?us-ascii?Q?ZDj5wQs6jxE4/Z3/rzGQQqgurx3mp1zfkyF/agAS5CZmF4Bs27flsYbLk734?=
 =?us-ascii?Q?J/GKsOn3E+4IRKz4UjMrxi4tGauFRTGPiISGFrw7lTFfi73TBH3M8r+D/lbN?=
 =?us-ascii?Q?/M8eaHpxdkrci9hk0osNkRPIOwIl9qQqtM7wF4Fr72rTLVde+geYiX7EdNPR?=
 =?us-ascii?Q?Hw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 34e31943-5051-4665-80c7-08de2a33d55a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 01:58:44.7276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1mFThGXz9ZojCsdT4CpByXLoe758QCPP9+611xUp7v9wD/kWgh4LLEifGm17sgQdP4b4g3oFIN7Pax9nrOu1wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   bc9ddde9df0a25323311f8384a84f0309cb9f906
commit: 4d2ee43ac2a906833636db6d456370a567fa409c [12/12] selftests: fix LLVM build for i386 and x86_64
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221815.dsS3c2eQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221815.dsS3c2eQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221815.dsS3c2eQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> test_memcontrol.c:667:6: warning: variable 'fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     667 |         if (current != 0)
         |             ^~~~~~~~~~~~
   test_memcontrol.c:748:8: note: uninitialized use occurs here
     748 |         close(fd);
         |               ^~
   test_memcontrol.c:667:2: note: remove the 'if' if its condition is always false
     667 |         if (current != 0)
         |         ^~~~~~~~~~~~~~~~~
     668 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:663:6: warning: variable 'fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     663 |         if (cg_create(memcg))
         |             ^~~~~~~~~~~~~~~~
   test_memcontrol.c:748:8: note: uninitialized use occurs here
     748 |         close(fd);
         |               ^~
   test_memcontrol.c:663:2: note: remove the 'if' if its condition is always false
     663 |         if (cg_create(memcg))
         |         ^~~~~~~~~~~~~~~~~~~~~
     664 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:660:6: warning: variable 'fd' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     660 |         if (!memcg)
         |             ^~~~~~
   test_memcontrol.c:748:8: note: uninitialized use occurs here
     748 |         close(fd);
         |               ^~
   test_memcontrol.c:660:2: note: remove the 'if' if its condition is always false
     660 |         if (!memcg)
         |         ^~~~~~~~~~~
     661 |                 goto cleanup;
         |                 ~~~~~~~~~~~~
   test_memcontrol.c:654:25: note: initialize the variable 'fd' to silence this warning
     654 |         int ret = KSFT_FAIL, fd, retries;
         |                                ^
         |                                 = 0
   3 warnings generated.
--
>> test_cpu.c:240:35: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     240 |         struct cpu_hogger children[3] = {NULL};
         |                                          ^~~~
         |                                          {   }
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   test_cpu.c:411:31: warning: suggest braces around initialization of subobject [-Wmissing-braces]
     411 |         struct cpu_hogger leaf[3] = {NULL};
         |                                      ^~~~
         |                                      {   }
   /opt/cross/clang-87f0227cb6/lib/clang/20/include/__stddef_null.h:26:14: note: expanded from macro 'NULL'
      26 | #define NULL ((void*)0)
         |              ^~~~~~~~~~
   2 warnings generated.
--
   In file included from lib/assert.c:10:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   1 warning generated.
--
   In file included from lib/elf.c:8:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/elf.c:13:
   In file included from include/kvm_util.h:10:
   include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
>> lib/elf.c:81:29: warning: format specifies type 'ssize_t' (aka 'int') but the argument has type 'off_t' (aka 'long') [-Wformat]
      81 |                 "  rv: %zi expected: %i", offset_rv, 0);
         |                        ~~~                ^~~~~~~~~
         |                        %li
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
>> lib/elf.c:170:8: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     168 |                         "  seg_vstart: 0x%lx\n"
         |                                          ~~~
         |                                          %llx
     169 |                         "  vaddr: 0x%lx",
     170 |                         n1, seg_vstart, vaddr);
         |                             ^~~~~~~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/elf.c:170:20: warning: format specifies type 'unsigned long' but the argument has type 'vm_vaddr_t' (aka 'unsigned long long') [-Wformat]
     169 |                         "  vaddr: 0x%lx",
         |                                     ~~~
         |                                     %llx
     170 |                         n1, seg_vstart, vaddr);
         |                                         ^~~~~
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   4 warnings and 3 errors generated.
--
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
   In file included from include/kvm_util_base.h:10:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/guest_modes.c:5:
   In file included from include/guest_modes.h:5:
   In file included from include/kvm_util.h:10:
   include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   lib/guest_modes.c:17:20: error: use of undeclared identifier 'VM_MODE_DEFAULT'
      17 |         guest_mode_append(VM_MODE_DEFAULT, true, true);
         |                           ^
   1 warning and 4 errors generated.
--
   In file included from lib/io.c:8:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
>> lib/io.c:51:58: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
      51 |         TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
         |                                                           ~~~   ^~~~~
         |                                                           %zu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   lib/io.c:128:58: warning: format specifies type 'long' but the argument has type 'size_t' (aka 'unsigned int') [-Wformat]
     128 |         TEST_ASSERT(count >= 0, "Unexpected count, count: %li", count);
         |                                                           ~~~   ^~~~~
         |                                                           %zu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   3 warnings generated.
--
   In file included from lib/kvm_util.c:9:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
   In file included from lib/kvm_util.c:10:
   In file included from include/kvm_util.h:10:
   include/kvm_util_base.h:655:23: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     655 |         return ____vm_create(VM_MODE_DEFAULT, 0);
         |                              ^
   include/kvm_util_base.h:660:21: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     660 |         return __vm_create(VM_MODE_DEFAULT, nr_runnable_vcpus, 0);
         |                            ^
   include/kvm_util_base.h:671:32: error: use of undeclared identifier 'VM_MODE_DEFAULT'
     671 |         return __vm_create_with_vcpus(VM_MODE_DEFAULT, nr_vcpus, 0,
         |                                       ^
   In file included from lib/kvm_util.c:11:
   include/x86_64/processor.h:15:10: fatal error: 'asm/msr-index.h' file not found
      15 | #include <asm/msr-index.h>
         |          ^~~~~~~~~~~~~~~~~
   1 warning and 4 errors generated.
--
   In file included from lib/sparsebit.c:158:
>> include/test_util.h:136:37: warning: format specifies type 'unsigned long' but the argument has type 'uint64_t' (aka 'unsigned long long') [-Wformat]
     136 |                     "size not a power of 2: %lu", size);
         |                                             ~~~   ^~~~
         |                                             %llu
   include/test_util.h:54:50: note: expanded from macro 'TEST_ASSERT'
      54 |         test_assert((e), #e, __FILE__, __LINE__, fmt, ##__VA_ARGS__)
         |                                                  ~~~    ^~~~~~~~~~~
>> lib/sparsebit.c:890:15: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
     889 |         fprintf(stream, "%*s  idx: 0x%lx mask: 0x%x num_after: 0x%lx\n",
         |                                      ~~~
         |                                      %llx
     890 |                 indent, "", nodep->idx, nodep->mask, nodep->num_after);
         |                             ^~~~~~~~~~
>> lib/sparsebit.c:890:40: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
     889 |         fprintf(stream, "%*s  idx: 0x%lx mask: 0x%x num_after: 0x%lx\n",
         |                                                                  ~~~
         |                                                                  %llx
     890 |                 indent, "", nodep->idx, nodep->mask, nodep->num_after);
         |                                                      ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:930:53: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
     930 |         fprintf(stream, "%*snum_set: 0x%lx\n", indent, "", s->num_set);
         |                                        ~~~                 ^~~~~~~~~~
         |                                        %llx
   lib/sparsebit.c:1736:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1735 |                                 "nodep: %p nodep->num_after: 0x%lx",
         |                                                                ~~~
         |                                                                %llx
    1736 |                                 nodep, nodep->num_after);
         |                                        ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:1747:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1745 |                                 "  nodep: %p nodep->idx: 0x%lx "
         |                                                            ~~~
         |                                                            %llx
    1746 |                                 "MASK_BITS: %lu\n",
    1747 |                                 nodep, nodep->idx, MASK_BITS);
         |                                        ^~~~~~~~~~
>> lib/sparsebit.c:1747:24: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1746 |                                 "MASK_BITS: %lu\n",
         |                                             ~~~
         |                                             %u
    1747 |                                 nodep, nodep->idx, MASK_BITS);
         |                                                    ^~~~~~~~~
   lib/sparsebit.c:166:19: note: expanded from macro 'MASK_BITS'
     166 | #define MASK_BITS (sizeof(mask_t) * CHAR_BIT)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sparsebit.c:1761:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1759 |                                 "  nodep: %p nodep->idx: 0x%lx\n"
         |                                                            ~~~
         |                                                            %llx
    1760 |                                 "  MASK_BITS: %lu nodep->num_after: 0x%lx",
    1761 |                                 nodep, nodep->idx, MASK_BITS, nodep->num_after);
         |                                        ^~~~~~~~~~
   lib/sparsebit.c:1761:24: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1760 |                                 "  MASK_BITS: %lu nodep->num_after: 0x%lx",
         |                                               ~~~
         |                                               %u
    1761 |                                 nodep, nodep->idx, MASK_BITS, nodep->num_after);
         |                                                    ^~~~~~~~~
   lib/sparsebit.c:166:19: note: expanded from macro 'MASK_BITS'
     166 | #define MASK_BITS (sizeof(mask_t) * CHAR_BIT)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sparsebit.c:1761:35: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1760 |                                 "  MASK_BITS: %lu nodep->num_after: 0x%lx",
         |                                                                       ~~~
         |                                                                       %llx
    1761 |                                 nodep, nodep->idx, MASK_BITS, nodep->num_after);
         |                                                               ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:1813:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1811 |                                         "  prev: %p prev->idx: 0x%lx\n"
         |                                                                  ~~~
         |                                                                  %llx
    1812 |                                         "  nodep: %p nodep->idx: 0x%lx",
    1813 |                                         prev, prev->idx, nodep, nodep->idx);
         |                                               ^~~~~~~~~
   lib/sparsebit.c:1813:30: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1812 |                                         "  nodep: %p nodep->idx: 0x%lx",
         |                                                                    ~~~
         |                                                                    %llx
    1813 |                                         prev, prev->idx, nodep, nodep->idx);
         |                                                                 ^~~~~~~~~~
   lib/sparsebit.c:1831:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1826 |                                         "  prev: %p prev->idx: 0x%lx "
         |                                                                  ~~~
         |                                                                  %llx
    1827 |                                         "prev->num_after: 0x%lx\n"
    1828 |                                         "  nodep: %p nodep->idx: 0x%lx "
    1829 |                                         "nodep->num_after: 0x%lx\n"
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
         |                                               ^~~~~~~~~
   lib/sparsebit.c:1831:23: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1827 |                                         "prev->num_after: 0x%lx\n"
         |                                                             ~~~
         |                                                             %llx
    1828 |                                         "  nodep: %p nodep->idx: 0x%lx "
    1829 |                                         "nodep->num_after: 0x%lx\n"
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
         |                                                          ^~~~~~~~~~~~~~~
   lib/sparsebit.c:1832:13: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1828 |                                         "  nodep: %p nodep->idx: 0x%lx "
         |                                                                    ~~~
         |                                                                    %llx
    1829 |                                         "nodep->num_after: 0x%lx\n"
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
    1832 |                                         nodep, nodep->idx, nodep->num_after,
         |                                                ^~~~~~~~~~
   lib/sparsebit.c:1832:25: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_num_t' (aka 'unsigned long long') [-Wformat]
    1829 |                                         "nodep->num_after: 0x%lx\n"
         |                                                              ~~~
         |                                                              %llx
    1830 |                                         "  MASK_BITS: %lu",
    1831 |                                         prev, prev->idx, prev->num_after,
    1832 |                                         nodep, nodep->idx, nodep->num_after,
         |                                                            ^~~~~~~~~~~~~~~~
   lib/sparsebit.c:1833:6: warning: format specifies type 'unsigned long' but the argument has type 'unsigned int' [-Wformat]
    1830 |                                         "  MASK_BITS: %lu",
         |                                                       ~~~
         |                                                       %u
    1831 |                                         prev, prev->idx, prev->num_after,
    1832 |                                         nodep, nodep->idx, nodep->num_after,
    1833 |                                         MASK_BITS);
         |                                         ^~~~~~~~~
   lib/sparsebit.c:166:19: note: expanded from macro 'MASK_BITS'
     166 | #define MASK_BITS (sizeof(mask_t) * CHAR_BIT)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/sparsebit.c:1853:12: warning: format specifies type 'unsigned long' but the argument has type 'sparsebit_idx_t' (aka 'unsigned long long') [-Wformat]
    1848 |                                         "  prev: %p prev->idx: 0x%lx "
         |                                                                  ~~~
         |                                                                  %llx
    1849 |                                         "prev->num_after: 0x%lx\n"
    1850 |                                         "  nodep: %p nodep->idx: 0x%lx "
    1851 |                                         "nodep->num_after: 0x%lx\n"
    1852 |                                         "  MASK_BITS: %lu",
    1853 |                                         prev, prev->idx, prev->num_after,
         |                                               ^~~~~~~~~
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

