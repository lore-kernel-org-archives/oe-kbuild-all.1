Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5285E1EEA49
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 01:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763863197; cv=fail; b=e+M3+pEB5sK+v7SNBufwTFpE/g6g2LpK4W3L5rWYsJpaJZCbPbHUpsm4838L2SxU7vPLFU9gkZmVZtDO1A6/HCBQ6OoMVELel9kJK+ekYfc/OWBEOsQODSn7VkUPKlJ6KEpDMyRB8ePO1JwXgiDPJhXe9wkEMm8O4XTeFRVz2Bg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763863197; c=relaxed/simple;
	bh=tutfig5YOh+1eYaMeRxZ4aXkViAWSn5EREppKVHeck4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=IW8bhp6OBr0+NXDQRmEQ1hgNUS+4XYm687zNg4oPiijYms6SibR+rJHErhd+2t3x5k6JdA8uQXdouaO7qSmlmTi06BpFkQ0AgrVCy2yBYQMkX28gL3YVd9RzefU3mMv3cl1petzvBfrSFG+W8NYJeHAV/NhkyV6eNqYXb71DrOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jKBPOuMZ; arc=fail smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jKBPOuMZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763863195; x=1795399195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tutfig5YOh+1eYaMeRxZ4aXkViAWSn5EREppKVHeck4=;
  b=jKBPOuMZmMVyrbAnfKsB/zpj/Qa3qNgSnGurottBpugCY0MLu0lthxcl
   q/zdEI76tFbRmW4TSLbc9OYjWo0G0Sm9AdY7KYH6+PuqoIMuq5w7AWO5T
   Owt70TyWqoCdg26NTs95K8pjhJAxYw1sDdk8ZmN+4c2O6r32yFE+NT2wT
   JTfghc/ivtOgdqjreRllJleST5Kot7EgF3sUGz6AfT+WUQU9a/SZcpqJR
   YLoGCoW5vo2k9kZp0a/OLeJxmrr8ximcyuasArS/Ul7Ibs9JqRWm7v3Kv
   HGXAMMXkXIkhan+ed3LK/7qiXWELrpmYAtpv4xfMlL7o4oFFFy2YH6s/r
   Q==;
X-CSE-ConnectionGUID: d7jJoanMQxybSsMxBb2Wbg==
X-CSE-MsgGUID: xdvjoAQ4RFmZ3aMcm6vGhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="65951731"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="65951731"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:58:25 -0800
X-CSE-ConnectionGUID: HDEEpijBSPG7yHHscevRwA==
X-CSE-MsgGUID: L3lAea/ES36NKDQJSB3ASA==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:58:25 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:58:24 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 22 Nov 2025 17:58:24 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.52) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 22 Nov 2025 17:58:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hiBkUDI7Prni/jHP9bjLaU7k+5oXk2tU9vIXcAFGSdy5R7kfnuUu/qDL0o210zYOvmGSjnXWoPJhTNkMe2nHdEbyganzjXLVledNHxDnAmod0izbqb+k3UK+hNosidB1dY/AATYjAHrApgvw8bwgrXbua0OlvcwQfSlQ1HQp1qUMHfUXAjfAETvt+T+OO8YkwNMmrIUGoCy3mcJQ3/7OcFaxP9AU5zn+8T78Sgx61D9SMoFLU6J6BYDaY6x8ZBRT9tiwpD8OtxAqG1flvj5pRs/V2Wmp0Lk6QEN1FAaBeJI6WhaNn47yUROPSAHXL6oIpHg2mTC931nyrBudlDZZGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4YMOGMYJoqaF9RKEgIIxg0trnitmiILlDG24pSKFLM=;
 b=tFv5r2Fbb2mHwB7suQCaBSpCKtBeiiG+bZX0/cMIqB9nMRnZoNeSB02PVGZ7/2zEiTtGDi9tGP06E1ZjniHco/7BAFfnMkSSDH9Abk2vJLApxgGSJC7lrN8mwn9hXwmDyla75ppDiaONi9wliqqtncjzKXFp7EZXMwZHt4nkUrdSVlBJt+5B0nNBKHkW6t2+KWvYwx9TMOYk4QzpOIzxL77hNH7aQQ0f6nq9aX8m25m+kHBADJedyzrHUoggFlwwB+8YnOWkdgkKBbyE2BUooKm462susC1paRWYJPmlCuE09P94DCS6QFAZxTN+utw+HJXifS1luuXGsTW65CK2PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by PH0PR11MB5111.namprd11.prod.outlook.com (2603:10b6:510:3c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Sun, 23 Nov
 2025 01:58:22 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9343.011; Sun, 23 Nov 2025
 01:58:22 +0000
Date: Sun, 23 Nov 2025 09:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
CC: <oe-kbuild-all@lists.linux.dev>, Paolo Abeni <pabeni@redhat.com>
Subject: [linux-next:master 9454/11041] unix_connreset.c:17:10: fatal error:
 stdlib.h: No such file or directory
Message-ID: <aSJqNiDJR3s0U48g@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
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
X-MS-Office365-Filtering-Correlation-Id: bee308ec-9932-409d-c224-08de2a33c829
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kkOJO5tJ41TGfFp975gzNIQTDDbrqRUrU0VUFRAI9GWonZdaPgJSFoZSqQ1W?=
 =?us-ascii?Q?vPUDX2Zcol304xRDebZbca6MKD+9HLUSJyh9VVL52FptB8VrsjGPsl0DR+JK?=
 =?us-ascii?Q?OIxVaIhFTWfvtB3+GxYyOOdHe653DR+6gVLS7ou4DeJH0kEgRJ/BTx/2aIRr?=
 =?us-ascii?Q?Nyjgnyr4U5fAn8lNFliHEWINJgTsy51eIuk5Nfp+tO11H27mEpOAtNaiPjN9?=
 =?us-ascii?Q?FzFmRXIaLOUQPXMsswOmZd3F9+s2EpoHkK2XXwLwK1q1hqFTDKPj7riPGgox?=
 =?us-ascii?Q?zMPpN1YrUZaaIzlvKbX8RWOs8VmiIk/YwmwpEipEZz6XVFmkm4NxHrctu0n/?=
 =?us-ascii?Q?UBApGfj8Qlslt2iB1Q8dEa8CTHn4t+XyJZnaRwxUGPjxGZIne6Yoi0O1LMLS?=
 =?us-ascii?Q?/Hzbe79+npU8FZm/oX1GvNlyQWC2TbOz7PZdc9KLc4LjI4Y0dca/bK+7V3Iq?=
 =?us-ascii?Q?V5tQRg5l9xtlynFnfn1rNkEOaI0x73iEqVmwwrUGXsYVIR0Xk5dsvBi2eJI8?=
 =?us-ascii?Q?8/pwAFsH6YDt5nBVTU55fyH1BDCohwCyBi41wWxLEFkeeFM07xLcXop15IOC?=
 =?us-ascii?Q?AOmIcNuw1nuUHwnqr78Z4yDJrtfi+Rq+GGZwCRcgc6c1BgM5z3n1shL7a3eb?=
 =?us-ascii?Q?kbWOXElqfrLXP6dcjxE2S4f91mOYTAo3l4trtiyA2U8J/lt+CMSqVGH0vMHg?=
 =?us-ascii?Q?FnbTfZFfe9IZwCitnP5mofv4nUckaxeEpfI0oYLAUFymVM5jvbEyYTTlueLi?=
 =?us-ascii?Q?RrQmktc4v0k/kRirtP/mxcMb2SW2lMIdKcSyREpB+RZyCwMp4FpU7LbSrE6G?=
 =?us-ascii?Q?CTpAqiZ7y57aDX6WqnANtgKBgDDO8RPA9dnT6Wd/ZAzehyxYesX1FBPv0De1?=
 =?us-ascii?Q?Z4LU/NFt24/Cry0aqRjQ3sce3sYRNUWR+2N9j1zWfr9ZcUIx1MOtLpR3zV/C?=
 =?us-ascii?Q?ZGB3gg3Opfxd+PJs6Hng6CW0C1vAj5GaLlyOzuFHhQkkxRJjrBJ8S0/+Nw15?=
 =?us-ascii?Q?KhoUxjMDaTaIk+ZBVF14kuE5nMJ/hon7BF4BXqKfBlkYRBD7cpRoLQjKsvo6?=
 =?us-ascii?Q?JnivuFr2Lyn4TECH8UAYqWos/s1YP6/DkLmtEwVY99hfg2AH9AZd6bwuPIlm?=
 =?us-ascii?Q?S51edZmC+xG3bg96Js/oP1XLKNEkcjMdU7ROz/N8Pq69RDwlrlUt1mbUFqLE?=
 =?us-ascii?Q?UIqeoVThV5C0bCBRdEMvBdbuurAbozaQ6XP7M9t6HgsJ2V9N3b+/7vYhM3oH?=
 =?us-ascii?Q?Uw+fBO4iw+lqcjBtAzJuhrIoQ/vgZWltZwhicSs/+CQzpCZ7n4Wkloe2V1z+?=
 =?us-ascii?Q?DMVbHefzBCncL4/Sq74mg+tU1c/gbkdC9zl7BBteoKie49XvG2bH5aapijzm?=
 =?us-ascii?Q?DwCorpjPdSu2Ey2CZu7OnJPF4qHICnAewkRGgsMSQSQtPV3Iht+LJ18O6YgI?=
 =?us-ascii?Q?ogceCK67SCm/0c7ShAr3eXhQZLc5/PNO5aW8ySTB85622q+tmobDoQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mVenqs4EfPrzZVkCNgbEXd3K1g9altC7G8og3i0bJktSXpl4t/LifdjVTQNr?=
 =?us-ascii?Q?VymnqaTboE158AsEFWUxCiO27mFwvR2AdKY2/W5LkL4qbt0z8UGYjv2AI1ot?=
 =?us-ascii?Q?V28l83RBNKR4MbvD9GVZMdfDq9ElsozjSP6UHSu3yvFWJcBBxIYnqb8C52ZO?=
 =?us-ascii?Q?i56lt88UlHcwlg4T8lJvhRxnjj+QwytDYq0un30WYcEFge8x3sTB0P6vYqgu?=
 =?us-ascii?Q?A2InZEVq3dWtPNWcm1gvpVRcKNy295KwuvbMogr4HaWnFpV4ObT0YmGdatXv?=
 =?us-ascii?Q?UOeqk6JTpL/Bri3c7aQxgaUIBqE4fIEGTi/lSCm+vxdwkXMcJhWw3iA9/tUl?=
 =?us-ascii?Q?9wY1fjC8zonfB+5ywvHoagm75dJap3mNc/4KK2qrGxvju6aAs/TC6Ktveb5Q?=
 =?us-ascii?Q?fX+uLSVrC29QG0537bah6Lb/1EP3czs5iGfb8RsRs37sOb0uSDZ4KR3TSw+c?=
 =?us-ascii?Q?40xoYukiTyM3uRFw+hsw1b7RJxnoKK5103JiWozPFpRD+NDFL2NJ/y9z6Ax3?=
 =?us-ascii?Q?XJoHhQSLdArZVG31El9kPrtMQRDeFplmSEOCx2k0QDvHt4zL2o/XdyJBQpBP?=
 =?us-ascii?Q?x49+vvcQJmbPEYCeFbcQnho8v96F0m6oaHINlSWTRTELeJKmJF+clTYt2cWc?=
 =?us-ascii?Q?tNtLhosEOKBjPrb7VDoqqc7tepbt/i8xPVJWQ5qAf0umaO3zl4dtOtp4L92o?=
 =?us-ascii?Q?Pi2jHzfqFSXlPu/Kloyx2rlFueHx12oABG3xBog2bPyqtq4KhTud7UwTjW2Q?=
 =?us-ascii?Q?yhHHsfuvTRHR1/THRgOCShkxLnEkPDJe5hJOMZ5rwnOzDxf5HpuI/7iyjTQL?=
 =?us-ascii?Q?MCMIRf2jXDjoySBmRwrF6IYhGkUycqM4LRByTczWprUc7r3bbLl9niwxh9et?=
 =?us-ascii?Q?mbur8CthDcxRF4HZqceBU73UOv1GXS6AWLfk8hWzNLzpxSg3ntOAj9b2hmuF?=
 =?us-ascii?Q?lSbkFR0WWyb/ZrzlYHwazNQb+Z2ilMPH7cNRN2frSmGROxvXd7pPlx7LaVnB?=
 =?us-ascii?Q?xjpJJfqMTfqHH6TnT7oHBXsaNt1qrhjoBP/dYSibpbK1vWHZv6khGGvgRVWz?=
 =?us-ascii?Q?SdpNNPefp29+AkwMUUy5osJdH4srceKVliYgfCOY27B0iNy0V1k2ILl3AkXL?=
 =?us-ascii?Q?g0GN6MhffMu34ixJztDETVHQQ0p0uy4Dg528kGeeggoOf0Od3FyfQ268+vF5?=
 =?us-ascii?Q?nKr0O68ivuBh58VyXPgMtL/9Waqbb9GsEWiq6E8IiOQGQHA4mF4TZxsWCrYt?=
 =?us-ascii?Q?6pD0xZqJ46gqZmtJcWPeLmJLQZxJ7XnLNoiF33dAuik19+V7nSfQ7zJljOyr?=
 =?us-ascii?Q?F+Rg5Hpl6DxOzmbkxa+0PMwpqarUMcyU8uFC2yVa+D3d+5F70ZaYdHk5JhPK?=
 =?us-ascii?Q?axHrkN7YJfMJJGi8HgWQJ/pAE992vSx/C5fpztSmHRlK6UE4B5r+uNpLK9bE?=
 =?us-ascii?Q?Z8KvIx43CHT5n3RFz2H6SOeOViqpT3bZzyV+k3SXPDvUDwcHep81n906zGMX?=
 =?us-ascii?Q?3CEwkHUzeoTnaE4aPPHlNGYWWkHnrm9HHSZ3Ko4ALVRFKrCu1cssXhVN21MV?=
 =?us-ascii?Q?GTL07KbSzKX45Y1jZFT4cr4fEUFbxyChXyEN6kdD9PT5thdXL+gSo6t6waqd?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bee308ec-9932-409d-c224-08de2a33c829
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2025 01:58:22.3848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aaov3dpwu4eZv0B82R2BI4KQkljQTxAnuOHJeGaCy1yYlX+Mj1aMv8l0eaRfhx5314EuEU5rCDVoQ37F+eIgSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5111
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 45a1cd8346ca245a1ca475b26eb6ceb9d8b7c6f0 [9454/11041] selftests: af_unix: Add tests for ECONNRESET and EOF semantics
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511221800.hcgCKvVa-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511221800.hcgCKvVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221800.hcgCKvVa-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> unix_connreset.c:17:10: fatal error: stdlib.h: No such file or directory
      17 | #include <stdlib.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

