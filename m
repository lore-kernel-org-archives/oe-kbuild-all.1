Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D42134B6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 02:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725762051; cv=fail; b=WJGE+6pcLJZsbwB82Gi6cYP+NSMsnmz+CYTOdOwJS92icYDR/4GLXnA/7grkxv5uWbiZYVPsrpicu7CwqJZtqQS89kmP2o8q1XlHsHxRzCkhDkp/by0yaUiPl0Cm3w9D4xfeyJM5W8nWq59K4JdiPYkqn2vYRQBR49W6zvj/pg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725762051; c=relaxed/simple;
	bh=EQ8smpWkRpgjBWi55T11Elo3GCXxNe6I43c//CLdqrQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=rES75GuwN3mTTsuXBPYkPzBR0ifGm50xClc1pN+QhgRGnA0c7K7ma6wMVPxuAnPwQrrtvApKHIfXGuzotHcuSL5LnccKPBJ/sIeu9ePtybqUOH/cHxQumi5hlzEumA0i9qATIZYuMw2VBB/R8cn66XdmotaIek/BiayUz/SBiqM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i57NDGEQ; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i57NDGEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725762050; x=1757298050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EQ8smpWkRpgjBWi55T11Elo3GCXxNe6I43c//CLdqrQ=;
  b=i57NDGEQS6Btaco5s3vSSyCC5h8JTs0M2VrB7gAkzwMPOhRB0DejDz18
   RmMsz9st4oshj6x5Go1Y9UTQYRqlQSx+e94pajDV7dES/GOMLvuhgOWvA
   n/fUx/SQgaYSW1w7yPKnh/RlXkvyV7buATWSkiUinVRQXQvZ73UT0MdtC
   +sJO60I/Cu9PtBYet8k6hp1K/19WEwWn4mLhm6UahlD97fXi6ken1z8TA
   RjdLHWeP6h9QSVNCZnQbXq0n8OMNoMIN05cmRqsG+tz540fJkqGEm9EuL
   kcyq9gDWu1x0r9MmxZyP6cR/IxtWsiBVZTFUl88zThO6piYPWU/NDFRui
   A==;
X-CSE-ConnectionGUID: BTEhr6xsTyi9yqNiYBRR3w==
X-CSE-MsgGUID: mTRxluitTRCRIJMCGc0MEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24632373"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24632373"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 19:20:49 -0700
X-CSE-ConnectionGUID: GEmCNF70Tq6scoANBTqKpg==
X-CSE-MsgGUID: i2E5RVdbQwivwTtNUI3UOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="67056570"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Sep 2024 19:20:48 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 19:20:48 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 7 Sep 2024 19:20:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 7 Sep 2024 19:20:47 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 7 Sep 2024 19:20:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlGfnM/90IDToMn+TChkE2Yxn6qXSjNWBwbaq1QfrioOuMz8LpA9cHKBW5VLgLH+OTQFjJym0vXOWugyv8YnKPFy50ArlKXkCL92W+hLiRTEe3TO1s1KCk4aF2Xn5n+MOQgGcZoVU0QeIrB5VH0tTFd1joMnYRkTb3JCNdhru6WcuRGtb+omcCBnjoenQGpAQ7Q9gQnddH8CioJY+0a82N+AmHgLz1xTGWqhSbdiPp/L91cFBktqttgHbYgvYlVcflyYM7SfbNn6owYpdB1SmfqFTyzCAOQq5gZuPOit1iXpBDVZ/+vWygx+8egyAh0np9liFO9iDLnJf+smYjuvjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Hgra9VXT1BwZYNoOkDv+Ld4D+/66Ya/5uSo4O3lyeA=;
 b=cKoynTxOFKFz55TY3nhXuzakxO+6X2bgrtn/DtcU8hLLs4lpJJ2FBU80AOwiq30jzB6QFxMJo0cv8ToQDRN3SjWs1U5YwnMGw256XSWiFXKLoWhMHVL1sWQcPwcxCtZ+cB/OEG2ZwbOOb0lrTsntx0lzbb8EeOkeMXzVgcBzhAqCk39Rn2qVULpfD4eVMMnAwUGJcOc4OPUsP9AFtQpZDAxxsPtH2raXv7SZefvxKG0qF5DEKUebZOPsg9NzilPWGeqhqZoF7Mamnu34whZaQs80gxoXg5JLkPFnGT1AlaKAzCS6DxToDM6Zdpxha5JWLMmGvyFjnLj3Gzhg5Y8ciQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by LV3PR11MB8725.namprd11.prod.outlook.com (2603:10b6:408:21e::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Sun, 8 Sep
 2024 02:20:39 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.024; Sun, 8 Sep 2024
 02:20:38 +0000
Date: Sun, 8 Sep 2024 10:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason A. Donenfeld" <zx2c4@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [linux-next:master 10218/10296] vdso_test_getrandom.c:281:40:
 warning: | has lower precedence than ==; == will be evaluated first
Message-ID: <Zt0J7YN9Asclh2Yw@rli9-mobl>
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
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|LV3PR11MB8725:EE_
X-MS-Office365-Filtering-Correlation-Id: d3c2d48d-8e74-4b65-539b-08dccfacd406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LQ2rzoXWpC6N/UXWikzjDFp+5zzWhxwiejkzCwmjtsEbtF5DK1MjVUa9yuhk?=
 =?us-ascii?Q?u1V7Tmzhn723sH7PICJsei9T4xKuigVmFMU3nWXUCDaLms+GviWicmR0803a?=
 =?us-ascii?Q?XyYAsjbn9lmajvLoocVCQYBsMU7LXlIWn9nalU4VA6Dq8Vny6Bnqg6hbuXMy?=
 =?us-ascii?Q?v7M4LEC1XPydj+Z5HpOoMaMnM9JZwTwDG3tQESlUtuqcXWaDam9LRsyI+L9a?=
 =?us-ascii?Q?/GaZWcMe7AJMhop/DU+mK8xmyv8EEajt6SYr+0Ns9hsr/+3ky4tMkzvX+guU?=
 =?us-ascii?Q?Cxdw6vaceGhZo/AAEN+J61Q7EgwiCllqy7tBjkvaz8dJ3RxgN02QItrrYLh0?=
 =?us-ascii?Q?F3gCAupOogNxHKSH1xqKYYSYdccfQ+qh+b3fsKgDek/Xls2Ez2iUkFZwTzjd?=
 =?us-ascii?Q?gOG/gZT2/Vto4cVCbn9hlGyfbU44+UpDwXb5sc3Jt9hqtL1OKhpd7Ab6wpfH?=
 =?us-ascii?Q?dTIctTSCcKC+vjvE4ipg9eQ+HXOvb27rPZ/8fyL5uCCF3XOmeZ08VHn7qW7Q?=
 =?us-ascii?Q?bfgkCF5scRg0B6Lciichy/o99Av4PoORTMbJubFtCq3b+tfbJRW22vIrxqRm?=
 =?us-ascii?Q?8aMGTryezJ8z/7dPGrMmvGgpkZp4l4HW1gTT8zFtscZoOFPQqCCYvkItdoIM?=
 =?us-ascii?Q?HBN3p5/x9GwOAomrYXdrUGcgpD1aXl8NBss5mKgiHpcXyWxU80XrabP9+wVD?=
 =?us-ascii?Q?MczyR7Mx4PvUBr5MGAcDKdWnBL7Ym5cVNc/TWl8yoUAxVWrX5WC0RVb+O+6j?=
 =?us-ascii?Q?sxqGJ1TXS2DR6R6p+hraHH9aLklF5oFRH3xlITEYvium2CaLT1HBMRTnIXOk?=
 =?us-ascii?Q?7TYeOT0SI73SyISB1/54abR1fe6vzJaCzwfu3yhRsq4FmRpNwDFQHqqgmYJk?=
 =?us-ascii?Q?ASa0Dea4CrbEMfa+tPFYcYCG0RKPN3xb6J6OxGoCVg2VXw1maKDU+rq/OsPw?=
 =?us-ascii?Q?f6SZ+oAZREEJKHvD5dmEkxykCUDHtBCuZVMU6PeE5uNTorqye/YDTwmuR5Om?=
 =?us-ascii?Q?mHGNtQ5BACC+aePHBkfnBqk1yy5pZiU8/M/OM7k0FpftMlywq9cu5iyxCpIU?=
 =?us-ascii?Q?q3a/+tNQ/q+fjbQ6pc3wmOa4nJtfhVQaJFaxhk4vD+ZRhWFt4Iia3IbcT/vs?=
 =?us-ascii?Q?MsOIj3PJLVzbP20ow1PQpLimv0ulMoAofzM1zBKJsW2+HqfLA9RwEy0a7lqt?=
 =?us-ascii?Q?be9wmqh7GhtKI7uLMCEDy1j6bnmUDF3XYVneF0irsa+Pq96TAatm4gipnJKk?=
 =?us-ascii?Q?X5+hmXl53ERcJVuR0BzetxVmKZgzKTeSFpwtcHBC0Wt9dEeu4QBBV+xMb2EW?=
 =?us-ascii?Q?DNsj+idm5UpiYXdBB/wPb9wheT0JZDch1GeT+Hu6AQFlinaKGqQdrmPnqgv4?=
 =?us-ascii?Q?QONCxO0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AOY4ZK8ln3IDKGFD9DX76gzBp8qfFsL+4uZq39MQ5K3ZAO+PvLf92W1PPPhj?=
 =?us-ascii?Q?6U6YIwhS1oKCDIm6FYdQofLiZa8B0fyv9ODucbnaMJOChfBDSTfXy666DXv8?=
 =?us-ascii?Q?+JP5v3GxNfigEgHktpocBPVZCPxrTk9u792AIxvDlwH816z/Y2SoZsWir3W4?=
 =?us-ascii?Q?pVCWWLlq+0Ug/Tg6h2q8uwI0udZAvrIOvnxIIfkvwVKE3wjAEkKUo33afF8u?=
 =?us-ascii?Q?LBXbyPxMVb1y1tt0Q01o0IV4xzatjNb7+96O0C82VhrP5zGuGLHNkuKOeE2z?=
 =?us-ascii?Q?Nqx1r3M2/0wUpJ+aO1cMY3fJAdHl8qG3MgMyQaQkPuxb3LhHHrtQsJfUPGpF?=
 =?us-ascii?Q?yMXEW7jL0RMhAwPsS9gkzRqgC0qRVyfyijG5+9qKG5OvnIakTXro3Qd+UFCy?=
 =?us-ascii?Q?DVtdRoYEBIfuL1IEiVrCNiUTnBThqc2Rq0fMw4BRla0SHSKsX2j4bH/qeuTJ?=
 =?us-ascii?Q?0DeHN3dSDKLuUXSLi9PgDUZfzsJSJzZ9n8/ru+PkmKZOmTnql8ha0LWmRyDK?=
 =?us-ascii?Q?A7m2Je8ukzjH/AP4PEw055kQVliR0dyGf4vty6dvdKpkdwpcLocxA4d4nw42?=
 =?us-ascii?Q?H1MG8nlqQwW/tHKJLtVHJXxG9w4YQO09hDPlYhDXqxUAKWQ/HeRAzgWsNueG?=
 =?us-ascii?Q?6XVAhN/weDD3bLnDdDC2WjpivZ5aeI+uq8h901tbax9VzNSdYm58oPYxQIG9?=
 =?us-ascii?Q?pfcSB5282hkagZK2R/foxwgrZlFjBHXi4/i2TEijsPakTwk/f2zE8wdSk3Dt?=
 =?us-ascii?Q?aDF/wsqmNS8wGnp4kktuvVUKNnuCr5IGIQOVOJHYlasRpF6VL4MWdXL6OeHB?=
 =?us-ascii?Q?vdDCiBgyv5d1dxWJgnvbZB9AVlaQ2hAd/sejTWgnnu+SQtTB5+6ZXntaxixM?=
 =?us-ascii?Q?aeX/LqARUBH/9/O5fyCxAtom9XGfWnaZKPim9yZasyu/l3NoXpEv0rozFK99?=
 =?us-ascii?Q?J5XXz3HN1nQic3h7GeoVbnWsFn+nWB/vPjoqP9RemqCgmN4iSXhMATHqWM8+?=
 =?us-ascii?Q?zP8ymI+Msj2OHpIfEEFbtGopOgKDdZe5guBJCmaCGi68uq4CcPkH3cpUjb5l?=
 =?us-ascii?Q?ZnQMcInjbltBpKKyf3m28CMF5BZ0wK23W6gBuFXDTJEomBhWuH+e684TkUqN?=
 =?us-ascii?Q?R+CWZY7twxqEY3umaleAc7tVn+YwzIkp85diULM8/kinIqUpMC8aO2qJjM91?=
 =?us-ascii?Q?wDFZT6JfAI3IibVSjf03RqNgCW3DZavtQYGBnNxsI8Phk6T0bm2pwI1PJRAl?=
 =?us-ascii?Q?Hat8HqoTv3L6o+D6pxXTpcDJU2us1YLbLFDpSmlpm0AfqfQ0XTqQUvxN62Hy?=
 =?us-ascii?Q?ftWjyxjHqu6Hby40J7dUrN+wszAVu3MX8LjHVuhBakoZfBtfVWkWsOGX34cO?=
 =?us-ascii?Q?TTdsdze6gJWJJCjWov6kvTDzbrk02jBmUtInSbH3vWwyy7O/IXCKsY6cR1QZ?=
 =?us-ascii?Q?LwTtblaD/mKVxupheL6turpKaUYyMUmCkNdQ5W/BbE0sqZe5NtZTaEt7WF6F?=
 =?us-ascii?Q?sU6yjBV8i+WvlPDyf+64IPCfg/afv0DIFo1fNGOikewMV9OYgafEbpSWsHBW?=
 =?us-ascii?Q?igSnAj3+n2D/J4zf8vW/RqCXEr37ePyMm1rviLlh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3c2d48d-8e74-4b65-539b-08dccfacd406
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2024 02:20:38.4743
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wVp9uOoWq9zKkbCb4OOaA8C/7d4UlRK0aToN3XOU80RzahOFdZG5fQ3IXmyub4YUoQoq+worUlRDFvQRZnUbqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8725
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9aaeb87ce1e966169a57f53a02ba05b30880ffb8
commit: 212857cd099510461127f40ae7dc21092d0c0dd1 [10218/10296] selftests: vDSO: ensure vgetrandom works in a time namespace
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080600.YI5mIBVR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409080600.YI5mIBVR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vdso_test_getrandom.c:281:40: warning: | has lower precedence than ==; == will be evaluated first [-Wparentheses]
     281 |                 else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^
   vdso_test_getrandom.c:281:40: note: place parentheses around the '==' expression to silence this warning
     281 |                 else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
         |                          ~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^
   vdso_test_getrandom.c:281:40: note: place parentheses around the | expression to evaluate it first
     281 |                 else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
         |                                              ~~~~~~~~^~~~~~
   1 warning generated.


vim +281 tools/testing/selftests/vDSO/vdso_test_getrandom.c

4920a2590e91bc Jason A. Donenfeld 2024-07-07  241  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  242  static void kselftest(void)
4920a2590e91bc Jason A. Donenfeld 2024-07-07  243  {
4920a2590e91bc Jason A. Donenfeld 2024-07-07  244  	uint8_t weird_size[1263];
212857cd099510 Jason A. Donenfeld 2024-09-05  245  	pid_t child;
4920a2590e91bc Jason A. Donenfeld 2024-07-07  246  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  247  	ksft_print_header();
212857cd099510 Jason A. Donenfeld 2024-09-05  248  	ksft_set_plan(2);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  249  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  250  	for (size_t i = 0; i < 1000; ++i) {
4920a2590e91bc Jason A. Donenfeld 2024-07-07  251  		ssize_t ret = vgetrandom(weird_size, sizeof(weird_size), 0);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  252  		if (ret != sizeof(weird_size))
4920a2590e91bc Jason A. Donenfeld 2024-07-07  253  			exit(KSFT_FAIL);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  254  	}
4920a2590e91bc Jason A. Donenfeld 2024-07-07  255  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  256  	ksft_test_result_pass("getrandom: PASS\n");
212857cd099510 Jason A. Donenfeld 2024-09-05  257  
212857cd099510 Jason A. Donenfeld 2024-09-05  258  	assert(unshare(CLONE_NEWUSER | CLONE_NEWTIME) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  259  	child = fork();
212857cd099510 Jason A. Donenfeld 2024-09-05  260  	assert(child >= 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  261  	if (!child) {
212857cd099510 Jason A. Donenfeld 2024-09-05  262  		vgetrandom_init();
212857cd099510 Jason A. Donenfeld 2024-09-05  263  		child = getpid();
212857cd099510 Jason A. Donenfeld 2024-09-05  264  		assert(ptrace(PTRACE_TRACEME, 0, NULL, NULL) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  265  		assert(kill(child, SIGSTOP) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  266  		assert(vgetrandom(weird_size, sizeof(weird_size), 0) == sizeof(weird_size));
212857cd099510 Jason A. Donenfeld 2024-09-05  267  		_exit(0);
212857cd099510 Jason A. Donenfeld 2024-09-05  268  	}
212857cd099510 Jason A. Donenfeld 2024-09-05  269  	for (;;) {
212857cd099510 Jason A. Donenfeld 2024-09-05  270  		struct ptrace_syscall_info info = { 0 };
212857cd099510 Jason A. Donenfeld 2024-09-05  271  		int status, ret;
212857cd099510 Jason A. Donenfeld 2024-09-05  272  		assert(waitpid(child, &status, 0) >= 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  273  		if (WIFEXITED(status)) {
212857cd099510 Jason A. Donenfeld 2024-09-05  274  			if (WEXITSTATUS(status) != 0)
212857cd099510 Jason A. Donenfeld 2024-09-05  275  				exit(KSFT_FAIL);
212857cd099510 Jason A. Donenfeld 2024-09-05  276  			break;
212857cd099510 Jason A. Donenfeld 2024-09-05  277  		}
212857cd099510 Jason A. Donenfeld 2024-09-05  278  		assert(WIFSTOPPED(status));
212857cd099510 Jason A. Donenfeld 2024-09-05  279  		if (WSTOPSIG(status) == SIGSTOP)
212857cd099510 Jason A. Donenfeld 2024-09-05  280  			assert(ptrace(PTRACE_SETOPTIONS, child, 0, PTRACE_O_TRACESYSGOOD) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05 @281  		else if (WSTOPSIG(status) == SIGTRAP | 0x80) {
212857cd099510 Jason A. Donenfeld 2024-09-05  282  			assert(ptrace(PTRACE_GET_SYSCALL_INFO, child, sizeof(info), &info) > 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  283  			if (info.entry.nr == __NR_getrandom &&
212857cd099510 Jason A. Donenfeld 2024-09-05  284  			    (info.entry.args[0] == (uintptr_t)weird_size && info.entry.args[1] == sizeof(weird_size)))
212857cd099510 Jason A. Donenfeld 2024-09-05  285  				exit(KSFT_FAIL);
212857cd099510 Jason A. Donenfeld 2024-09-05  286  		}
212857cd099510 Jason A. Donenfeld 2024-09-05  287  		assert(ptrace(PTRACE_SYSCALL, child, 0, 0) == 0);
212857cd099510 Jason A. Donenfeld 2024-09-05  288  	}
212857cd099510 Jason A. Donenfeld 2024-09-05  289  
212857cd099510 Jason A. Donenfeld 2024-09-05  290  	ksft_test_result_pass("getrandom timens: PASS\n");
212857cd099510 Jason A. Donenfeld 2024-09-05  291  
4920a2590e91bc Jason A. Donenfeld 2024-07-07  292  	exit(KSFT_PASS);
4920a2590e91bc Jason A. Donenfeld 2024-07-07  293  }
4920a2590e91bc Jason A. Donenfeld 2024-07-07  294  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

