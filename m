Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AC913C3F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 01:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640784; cv=fail; b=nuP7MltfSXZvfYA8BFi4pZ5Aq2f64q7fKxToHauTjmlf1KnSjYJ9edESqUmhdSz4FCN+tcErrzvZ9YqBZLDJ1UET06B6datJGHosQAuDm2iC3uRbMiGX+dEmbOZvkMlcmrdUi5eKaStJuaNR/i3bBcHM2R1mJKTj9jADRDUkaOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640784; c=relaxed/simple;
	bh=JTkKcqOnnVvrGCBJp3M2SUbfmHU252QrijkXtexV+3Y=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=WXm0kTXSizG+pxvDVkq2UXdvHX/WSAOC0+0CcK1HIxWwq64SCNoXnmg8gr1H0ttgsVbTEw/0xFnHmhaf2cKy8x7rKYYFWiFTvyVDc3pV/yJYgflBR69ybBJmECqI19/kBq3l9wDEIz5QpsPYhEHTdMqaSFg8YyrYQdeau8lO2Bc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gvX/JhDl; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvX/JhDl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640783; x=1796176783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JTkKcqOnnVvrGCBJp3M2SUbfmHU252QrijkXtexV+3Y=;
  b=gvX/JhDlmB//6RwH8oXpQxe16zLrF9P6cs+xC/jbEOepW1gbozVqBoBr
   sjo/HJ1JF7WC7jLXkpsndkB3waAr5taTt/dzYoBMd9VysCjTFfKsyw4kx
   GidTL99jRQU+oUiYqUo+kZ1n4IHiST+oh/b9l0i2BBR4IqlOT2x+Roh4F
   1P5ZPjUmNHR3/e/TFVI4XAyp7Zxj7wuM3hPLXRJ7tKWCfB/phy8P/WR8j
   jEn03oMPJlVuL2v/ONSE4s/Wft/F0mw2bb46qEG/SPqluLKGHcLeYYtle
   7zCRDzfMxvU0mj5JPK2qWo6KRwyqSoRK3D4e3cwvjArxDUzoRYFA9nlbL
   A==;
X-CSE-ConnectionGUID: fC0woGi6TTu4+0pJM5R0dA==
X-CSE-MsgGUID: 2PhdED1wTxi4Rj1GN/Ahvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="54150196"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="54150196"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:59:42 -0800
X-CSE-ConnectionGUID: VSfimiYrStizbNeyv5lbTw==
X-CSE-MsgGUID: lmjnE2bQR3SzXwMgcRrsDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="194114132"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:59:42 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:59:41 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 17:59:41 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.41) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:59:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vg2U9Vu5K0FqcN+/2pAG1/G3Aoqd4CiAwpcwmIXTqgF02qdwshiwjk7AvhSj61QauCQs5RzQE66wB3no8mYb3qdYeMEQqRLqsXcmqXqh0yd6+YAv1P1tOqJwywV8bF2B6633Hb5fFQQctHKg8dawSXEB/mwxe2eBNobNaX0jNmHCfLUEAo8D4osBSjcM2/6qKeWSnuk7AD8Ho9WCpHdR0DPz5lFYDH5RYoX1hPfELycDZ9HiQjVJmwnLp3nw2nMVXPWICgxF4WxwvTMuIwGzYCuuTzdLPbRTLsI+mzSq8l4Llt6DoF+KhcdhFqxRhEgM2Ptlzjb19mdGrzYgisah/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jeo0StywL9++//uYhj7IFmNaY1N492P8t5Q7luOx//0=;
 b=iYiccyD5jMZvS/QG8HwjFF5NU7sP/74wnAtLkhp9fd9yc6qoUjXNATzB5MUciD8GDMa3QnfTvuSvAwH0AzoQJhwq2VzF/IBERxNlZq8Znr4TAaOQ0zEl0mn/W8aZmD4dFKHi3ksz9I1mwTWh5QCb5Ul+Uq9EkiLyML9gwuFW6EwszLeXFU1YR/5SJ01SQDxq+Xfti2G19YLD5O4r8luOFGkJikDyKroPOJgigQDz9mwY8JK1FA4w9u8pZ2vB2iG/guMV5i2qo7SWrsQLPXh9XgCJT1nCev6p71fNtDOV58qDihVxWSLhSf1TnW9Y9fRVWr2B/OPmp3+iwDsdkjNmKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:59:39 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:59:39 +0000
Date: Tue, 2 Dec 2025 09:59:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, Alex Williamson <alex@shazbot.org>, "Alex
 Mastro" <amastro@fb.com>, Raghavendra Rao Ananta <rananta@google.com>
Subject: [linux-next:master 12705/13171]
 tools/testing/selftests/vfio/lib/iommu.c:2:10: fatal error: dirent.h: No
 such file or directory
Message-ID: <aS5H/6JO3M92fbDZ@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: a385ce90-9f13-44d3-b56b-08de3146738f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SMAq4Pl69OKI05QhgMYPXNknhzAXi29bYcyydJOIyWEuNQaLRMgLXjqnWCRV?=
 =?us-ascii?Q?G4+ptHiwIeQHsNNbYzBV9+ub7rVP334WCd/o/ZdJb70tuim/mMFtvGUreQWU?=
 =?us-ascii?Q?cgE2Sfrp7NwyD92AhqpPGMNxsjcda0TIuUCN7PsvSP2WjxqqRB8B0xOtcvpd?=
 =?us-ascii?Q?uMgcLf9hxJVh2NtuPmXtQMms1aac8Tp8IpLJIyDnweOkaIE2tDyQZL0RkdoQ?=
 =?us-ascii?Q?L91PmC62Witk6XBCM1afjYtqxb/Amb3XH4lTa0vdRH1WmCFzDI9w3fep8r/y?=
 =?us-ascii?Q?dW08quMjIK5Jx1HDuLDlj0Zs+YXE1QKa1B1Pgzo0L7Xr5HzABJjqqpjFcYA5?=
 =?us-ascii?Q?Dd2ZX5kFmXl/XOOHXblSIq7eqVGmf7B/n/RlG1iS9XkC9BThltGDsTLJRtBu?=
 =?us-ascii?Q?lAzZC0nNOpG6nqL1xZWKq1aV2HA4kAUNAuLkg+wCjnoS8Gfaip8KaNcDFqe2?=
 =?us-ascii?Q?zy1qM182MowNCkb857sATwazWT6VnO35xHz/8ER5iah4pTFpinwNC/h5kKTv?=
 =?us-ascii?Q?HHmRWzjDCpPG6BPWUTcYEEC9+S4+0AgHpPpoSluh+G1YCNS7wp2clcj+LbiA?=
 =?us-ascii?Q?qksttQc97yPWDKyyHq5r3n/9uG58cG1pLOULcg4GlaXmK2S+yJQvbNAny+Gb?=
 =?us-ascii?Q?7ZagiQrfbQvFhxDbm6wg6xtNx2OtiRTzUJ/cLlmlyh2BFoxC84aVYmHFxUXl?=
 =?us-ascii?Q?N8yZ5fIHgLsEG8GTCNqwzZGDoLWmDqAbAFqWTnwLqpMfqN6XcpMiT8i6XKqh?=
 =?us-ascii?Q?BwgNvzBn3a9aoSwXb4rFltyQ/YRhNBhihRC3c8N659ORJHOno+VSBQ6mARyl?=
 =?us-ascii?Q?+ON16fKTWpJ+2A8Ovviy5YDjrMirOMasx2KnmnatMZnNSnxbESaMQT7LGt/1?=
 =?us-ascii?Q?FKqRxNwbvWj+b2bq0nIAdFWqWAGjOhclOwth3wEE5TchL3GeDy5MTafIX1+q?=
 =?us-ascii?Q?pITmS4d++27ink0BnOmtPcvnoISUeTaZ2vPuuzcbtIiQdqSG56LTxOMSWIaE?=
 =?us-ascii?Q?4KFSKgXmYA4ot/ueqsLWHMg8hfYRI0CcilDeb4qeWYEZhe1L+ZO5jOtGwUo2?=
 =?us-ascii?Q?6Yol9VtOnXythQWWYEjuSqRfvjuZ1pUYXKDGlI1vByAtdlsRL884GF1msw+K?=
 =?us-ascii?Q?KKKDx+l5pMT6oSuRX/ATnY2Epj9LcX1hJVz+1EwFL6v+s9UQ/a7Krth1z8wV?=
 =?us-ascii?Q?9+4Q8iHLgFK0ULdwQUVRYTtNMlKWioHD5WSX7fsXmnBkOR2t6IUdgHlV+U/l?=
 =?us-ascii?Q?nOzbcKvRccBmt/H2U3XTCiP7D8fZiGuKPO6jVVPMxuB9OkT/U/qBD4N+K/9X?=
 =?us-ascii?Q?QRthYaeL7wHZx9ddauIJr1RvJ3UvL5PhEsLdnwFpWN81NlFOE8Mx43y3+4Ge?=
 =?us-ascii?Q?kIUY85t7/cMKBAqvc8gEYo82w0pKam3bN6s/5KtlDkKklAfFHKrCTdL8NCL8?=
 =?us-ascii?Q?RMPrZq8gp3V3mIdaF4mBImu/uPIbK2GPrwhdZPFN5jKezyUEXfpriA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wV796/6LHQM/laQTt5oxq9ChgO+786kn7kTnkco8/RuLMS7jTt2DV6PDPQEp?=
 =?us-ascii?Q?fomAZkxa7cRKTTK8OsblY0A9suabL1InzLtdRfeRwTBQY5YcsBxw2+R4+11k?=
 =?us-ascii?Q?a8c0M6MmguTjK0Y+XLPMMV73fMZJDZld1F66IIeJDZrTFE04U9kVMt7QO6QA?=
 =?us-ascii?Q?YvRPFSJEdq9/dRJdqzmROY/NM1MuJi1xS5Pi4xgeb0QJZz1d2UJCfFGV2dpI?=
 =?us-ascii?Q?SMlW+RVEhXYrZnrG+bur13Mf70c8ztag22bwOSqQKMlS2UjGHzwTx3K72ART?=
 =?us-ascii?Q?GYZ0BT+2QbDYNDoei0rf2pHp2+1hmHn6D/4buK9lekYH0Ni9FTM7zbC3TmOL?=
 =?us-ascii?Q?OckM/3K5C45tKPkc01qnsOUFmz7GeCgc4c6ghZUcHuNixkjfUzdWQd0Rart+?=
 =?us-ascii?Q?jce5dUQWbJrPvkX7Ev8E6V7GLQnXvVrYMs3qmQexMyfRC7jwcPC9U2LqZBoR?=
 =?us-ascii?Q?VmmKK0bMM8V+KAoWjDDR6JYN9MM8qe4dzCmx2GMcWfGnC7HsC8xMkQumIoRD?=
 =?us-ascii?Q?R0GZ2YeATFChmzklTIpV04+gRH0zmyY5ChPdRmZ/Cf8sF5DqhLSBBCCFzAio?=
 =?us-ascii?Q?q02q7PMnwb0uaF3hEKw/OroO0ucNYbiblxEFvSWOgG+m1U1qermBXoGg3Ofq?=
 =?us-ascii?Q?7X1nkMfYsBvgDll2odJ1plDlyDUzcTs4dqxizgdwJcBnBVcH079lDwQ2TaW9?=
 =?us-ascii?Q?X4clp9AZiyrST+kUunuZOPy9FwzqeZky1NOpQ9xv8QgsioCwE/4mYmO6rBEP?=
 =?us-ascii?Q?XPpkri4BxLzwemq2umtIQ+Bo7nrM5UHmvs6xcrWZ+h85smjVrmP680KdB64e?=
 =?us-ascii?Q?xrsKE3CNvtd4+CT+e6IRwvZwOFhAfJDfr2uEE8CjbXuUWI+BEGPpzBg+5MA+?=
 =?us-ascii?Q?VcxaLAMAZLzlLkHlUFqN2pJRwtGtdS75AvbJF7kwkw6Q++BOsQzEB1P5IaC8?=
 =?us-ascii?Q?4Ti6NefNG2PAqykpnVQD2n3ITxV7o7sgbepTsDOHRSR+DZFmoTlXXCqS7rtb?=
 =?us-ascii?Q?3CN4ogqnfaZKegvTpIFXWqaKjb/YZNNiVE1lCbJN0yDj87Zey1+f4lUfdbnt?=
 =?us-ascii?Q?N6X98u1JpUCtBo7DaqxQnPwImmMDsytOjMTtNaPcEL/vfn1w1kOG5Xz2Ohng?=
 =?us-ascii?Q?0uZF4mSrAqjNqHrw9TUT0W4wWEhjT8gtQNLMODQJHqjT2VqTp5XUoNDiKSVb?=
 =?us-ascii?Q?hp0LVblzQjcKy0n8O98PWOtpfLKX/exqIylNC0Eh9eTRsmxGLuWBk3tGZ3T7?=
 =?us-ascii?Q?LnouB1ppSTooFrjM6RFDDV4HZxyeWW9MVGpkMMG6y6bvhMfl+Xsg7OkJAcvB?=
 =?us-ascii?Q?SPeJqn1jt9JctDr165BzE063Xa5cDvjHoEmnbDBel6d4xdg0pgql74SjKkAl?=
 =?us-ascii?Q?29YxanjlhZd0L7AvyR429GQ3GHir1LeLfnwhDVNdVrfKa4vJi1MkfQKq9jeK?=
 =?us-ascii?Q?nOybZ+46NfLwL4lxrv/Z7Gt2tYpTb1S+rBHiOpCLTZOoJei3VDybk+XVt/A7?=
 =?us-ascii?Q?xNXgzJjqLAAayRLXDA4Ur8kE995XUPfZbm3JtYw5dm/7iOYJb+0ukrTY+yMF?=
 =?us-ascii?Q?wMvM0HSb3jeqbBUgs8T2EyaQpAftvAaC2eq25NgacuIMw6OHM2Az7A0dusUC?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a385ce90-9f13-44d3-b56b-08de3146738f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:59:39.2275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CP2bwFXmjQYUaMCoKPmcOdCE5+W6fDgRQNIFZymmy2qSrPvioJUFao1pEcqirewFRnXPVCr3mt6H+AJYciVKuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: 2aca571089b2cc333ed5ad0ada4902aa6f7c0d3c [12705/13171] vfio: selftests: Move IOMMU library code into iommu.c
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512012202.dhYThS64-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512012202.dhYThS64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512012202.dhYThS64-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/iommu.c:2:10: fatal error: dirent.h: No such file or directory
       2 | #include <dirent.h>
         |          ^~~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/lib/iommu.c

2aca571089b2cc David Matlack 2025-11-26 @2  #include <dirent.h>
2aca571089b2cc David Matlack 2025-11-26  3  #include <fcntl.h>
2aca571089b2cc David Matlack 2025-11-26  4  #include <libgen.h>
2aca571089b2cc David Matlack 2025-11-26  5  #include <stdint.h>
2aca571089b2cc David Matlack 2025-11-26  6  #include <stdlib.h>
2aca571089b2cc David Matlack 2025-11-26  7  #include <string.h>
2aca571089b2cc David Matlack 2025-11-26  8  #include <unistd.h>
2aca571089b2cc David Matlack 2025-11-26  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

