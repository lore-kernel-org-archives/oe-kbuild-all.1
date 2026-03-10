Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762AB2BD11
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Mar 2026 00:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773103732; cv=fail; b=nCLy7iTm48cOG7cRHY9DwzNSCXRMPkZCgRpKhG1wE2fs+zOBTJzn/k/xLGPKBOraCjvcgCXRuBPuVBqvskiPoFFMu/SjrgnvBRe/9r4cBO581ttpa7W9Jfjnf+OimJGBjSHdh7U2bvubUve+U673+S6B2S21trh9ZckU479mTdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773103732; c=relaxed/simple;
	bh=JsOAPkC7Cde/1qn/h8yacRVG1vgojYkYRkM7/z5ca0w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=NGiynFSvsEwGa4vIFq5hzBWpkeNYbgWpUAzHvm8Hyz9iLqPnYc/SSwAYxUsaHiZTp85TOOEFnyhGXo52N0yf9riA2KNI8lP4zlRvRdtgdoeUwEvOe2ugiBuc5tOTpBiN1Ucr7D0hWYMWCdpg8iFvqRxAguT51aIR+SWUuMCU5ZQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0M7CvB1; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0M7CvB1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773103729; x=1804639729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JsOAPkC7Cde/1qn/h8yacRVG1vgojYkYRkM7/z5ca0w=;
  b=O0M7CvB1W91HCcO9vKu8LKJvBSlmbILLcZZxvhUHiuPshik9raCJ/kBN
   kWXD9JjqL5hUKsBZF4Y5+qmn9r/th3e4B42xWZXmRjm9dzTG5lyyNspOZ
   c49vzE/pih0o6JOKG1RKjah5B2k6jSOLsQYtUIRpHg1k8zEABAI9L2qk0
   kRUQWe6Yz5MKIAFgL8b1z3xq2+1HqpgsVZHb8yhEIL87sG3b7JhkNXsvE
   aHjYKE2JlwcE0/MQmENNYZ+YFWCVmM/kpNtZ4yRXNMvsK4MytxT2T4yoG
   tmnGrM209MDVpbI8jVEzrbNUVBwkeoye2x+EZ48/2UPcqUP50S6RpePZB
   g==;
X-CSE-ConnectionGUID: zeBFpR53Qd+m7cX87pplDg==
X-CSE-MsgGUID: xPZ7XU+GSZelAeG/oaJBrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="99608728"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="99608728"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 17:48:48 -0700
X-CSE-ConnectionGUID: DynX6ZxeROGWAp5T/0B7uA==
X-CSE-MsgGUID: 4nwf8YUsS9SX2GQZ0gkFbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; 
   d="scan'208";a="242937155"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 17:48:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 17:48:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 17:48:47 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 17:48:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0aIFkOvmbO1pBLDuyPdMbqhYkZE7eBubuBboeAIPMljhczoBuMQXX4i94CO7r6/R2J18RRwo+jN5hktTOxQ+E4fsM3bMEnbl03fgST+jm3dByiuIjKZ5B3ai+LKQ1w/slYm6YpXFwOvo6kGtgkYc1m5E3BX4d4Kb7PuVuwlwJt2evWUExhdM+V6CfTQwL1OSADQmUx3gUQyLY2pwhOmsrdf+u8P+nWqHzhOaeiTTAZCpafwpWv8Hi9o5hvv4OlIeSoiVxBUuxKlKQisfeeEpwwJm7HB41RpPaZT3ktQ3NDZLVVLgh8D3SOWco3UHT0cZdt55dX1r5EfLci7Y6aAag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0pKJfyb3qaa1tWtF4103Q4rGqENOkh9h8/NusrDr+ks=;
 b=ivVe2vwx/f00zs0y3PAYqs31MtVyDGdnPg7v5imys8/RwjzBl82KCzSWDAJh3etBcY+me6MzGVMh9JuRh04CF7vSbjOYLClUrDwGnIkey+886mUajhPSXWmsiq9lsor6wQc1vCAQgdbx02qyT+jmpL4h/STJChz9E0hi8IVYZLp9nMtlvyITOUFS34D3WUiGM4d8SfAjhVwWD7XVRPM9hLJfSccgc/mcHg/HhtxIkqGZlb25SE89wppZalF5Wp0zRgU6+QMOq9E2qfzPfuVgouwCX6iox1EoJCObT9aMa21aJMrSSHcOpJNScyEm0O/h8cvjCPEuK0SMAbN6XCWDIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.10; Tue, 10 Mar
 2026 00:48:44 +0000
Received: from PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b]) by PH0PR11MB7710.namprd11.prod.outlook.com
 ([fe80::dc6:ac78:d884:137b%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 00:48:43 +0000
Date: Tue, 10 Mar 2026 08:48:36 +0800
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [cornelisnetworks:for-upstream_20260309-1128 16/31] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'device'
Message-ID: <aa9qZAIiHmVCtCnr@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To PH0PR11MB7710.namprd11.prod.outlook.com (2603:10b6:510:298::9)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7710:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: d830d084-2d5e-4f80-8624-08de7e3ec7bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: utiJVoODm7Mw79iWdBtQfb5n+bJqr+3OhNUIU+aCOd9qCzeDBgyziMHk/z1Frh6O+geQ6GZgWP/sVlSW+6C8E503XhgfhZcPj/BM4frCoAz8lOR7cNHXamY+OEXj9hPE2+y7GH7bgbWxyN33GkNzfnSQfk0D+ELv8aIKdipSOSpUfl4HQoKX+JtPWvve+CWmtC6J7XLjz9TGLoLXtCtlbc9TmDp2kydNfvFfMtZa9Y/x2s/Ok9F9m7AAYhsA1aF99FQs/zw869HXDR29ctSjtLBSuw8seCW9+YZOz/5xyDYZ5oEBzMYkOUgO81D/KYkO63hIvB2WMVS0cMEwBMW6wXZ4pNY/InXgQZ3XWoHclCKbky4u9I10EgVd1hOsdxQXWlOnUbv2dHhWJ1sIvxNOO+9LCrP3XgiBrZJ2uCVUZpXcFT8x6hMA+U+gFfGZ/kEb87oa1R6v7e8sfH6Lq2naW7n39U5aixoevKCEct9MCHOzXxAEj94J8bSMql3VcokNQVQBqKA2ahkSaHvLbskVyh2QPiJq06mcPHUurgsXPOdhTW9UkeDL+fWgncSopzWDmFd9t5p9FTxWWHfwEoDy1ns69hGpHETVbrOlrqswYkORJud/5/BCPLNJy5Ay208GlrXbfbTRAOCq8o+6O3K0IDD0aKElqHEPC7Ri7YSyV5srSjsP50FKp2qnRWdgWcg/
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB7710.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yaMKN3viCj9MyDTxCAhCdm+8gmkbhtPcqsrZUrvMmw6TOpOFOYQRUQRe1bAQ?=
 =?us-ascii?Q?Dz7rEIWTqddWgVU9MurmDRXn/KQgb/TlyKK/DhYJ7FyQostbVB34WhhbHveY?=
 =?us-ascii?Q?DXATbrum1KIyr+T9HYqS084DU/fjAOeInmjUNbVo1qECe+vtL2OVHKKqv7JK?=
 =?us-ascii?Q?1wVfqQrKVLjssUVoPGy3MI3ovo8C5FhhYPyf4EpOWx0dhZyekiooIm95XsjI?=
 =?us-ascii?Q?OGFuCBK4kTbljp7BU2pizWWE6E1HJrXMG8DzGkFqtAcqb0eUyvYIBd5NeopT?=
 =?us-ascii?Q?GhzdXD+jKxcwlBqjwmzt+0Q/Ro/60zEqKilDwRlV4BGj/fjXNoL6LiqLRDuV?=
 =?us-ascii?Q?8a2csGe+Nk0m8FsA9ql1nVlZeyYkJhHIohiNaIp1IbQJGEyXwU8qOP7L25j8?=
 =?us-ascii?Q?JkmhP9pwCtVV7PJYzsZgCDr0jT3fQZ1vEnsK3yxqfXFG7R1+bSB5Zgc1g5Bt?=
 =?us-ascii?Q?WDw/BNxcEdcJ5kVIQLwcnwa6Y5kMcwGdGZDsr/6tybRVqCdk7bhaeA+FI9vv?=
 =?us-ascii?Q?81qYRUMhzdh01jQBsk0+tbBJaUh8rcAQ+QMuYdVJ8EVCqn0ig3B9Z6T8dx/a?=
 =?us-ascii?Q?KIsInEOM4O5yD7K/4fjvOxSzeY7hF8S7xyHcLdvMlb2c2zvo9rHMIVgdtnVC?=
 =?us-ascii?Q?MBYl2VAqH2RhRyo28vjko5Y8UFIwh8pzHiN4EAsmZ5hm1fS7kp1Vj7A23HKG?=
 =?us-ascii?Q?xTC/O+9lc+sslAh2SCi/2GLKL0s7vdK6PnMV4+DiNKeguU0rofAwii5M4aFW?=
 =?us-ascii?Q?C8LeEOSC5WThEgFxnCJIaQqVW/WnGfAziBBt+f5ygcOVxSgwkH9yc7Pey7H2?=
 =?us-ascii?Q?Tih5XxBoljHrR5Typ/9R2be27whSb/2oVaTglN3atCZiGommr1iyDyYY4g1M?=
 =?us-ascii?Q?UDJLXrk+kss6wmduUs6J2sSZFw/MF1MsBKwBv+gdB/MpZDryweAKq5/7IN+E?=
 =?us-ascii?Q?dr+G1/0yxqxwPVkKIsmxc8qXu7CG4uWrXyBGl0oxK5B8d05BHvLKFuqkvI3Z?=
 =?us-ascii?Q?53a8LLR+yRFSrwcWizQGMuuZ7e4k7UGGuS+i3ROeRVw+2/Tkd0hCQrIzZKRN?=
 =?us-ascii?Q?e/nr2oEoRIpmTOmdsQH/iO7/kz+0zlnl3hNqCHlzBtgtxFUKUMq9PHIBcA35?=
 =?us-ascii?Q?olFguHxAekRozHENE9u1PleOQZozmGiNX+5PLmoTVVIYxA8cJUAbjAw4vDCZ?=
 =?us-ascii?Q?uPKGwME/4HrD4+tc7b82OOJftCyAbkxZ5zuWl3Dp8/kPGqM1Q/UorPGe4mBX?=
 =?us-ascii?Q?a9GgrrYcZdIAJ7pOVL9nAhcrTLkOH2OIHTynw3wqYOi1YjnwPFryb3cIB4OM?=
 =?us-ascii?Q?ppn/BU6v3y/lUHwFzVPIgZWvBf8aNA3bm7Y+MDQDeN7/V0N8dEkgc10xLeB2?=
 =?us-ascii?Q?bfPfWmlZ8ioOrBLHsOQrwzSutOd0nI7vIlNtjC/4XrqAgb22dhl2l+RZDl9g?=
 =?us-ascii?Q?MVfJ6zFm4nUX+wYetvizlv12c9Ikng3Rf7p0BrelPdnCbGCu1y225OFj+Rgg?=
 =?us-ascii?Q?ad55m2DoKtX+uEyShfXROsF+EsOLk+hTZBekr4ZHYdGuE9bPLA5wLFEkfNRX?=
 =?us-ascii?Q?Aqvgsd0FBEel1RorrltXdW40ZoUKf5XrEMpErulXqcG2Vd2Gs2Hc2AqjZd/R?=
 =?us-ascii?Q?9HkewZsnxlwnVXWT8qzabccQ8F+MV/INGJwJtgqTegUCfoZIQCwzshxZ/BIV?=
 =?us-ascii?Q?YgeSJ+dWF5LECL2O1DO8UZtJ4opDRMsACa298mVtTna1Mc891aqGs10QSzCJ?=
 =?us-ascii?Q?2Foi3I11dg=3D=3D?=
X-Exchange-RoutingPolicyChecked: TMGr+V7Jx8aUJfpcCb8nNC0a6hrh9Sq02w9yjvj0m1qJO3Ecaeya0nagEQygcdFw8VlzN29VBcr0b5mDSR4NS77q3CK/A1kJGeHpdFHYe/7EMMq/9+8kV0dMJUClwf//79j1+0wD3cWtd+JWo19viSmuk864S0BzdGon0ZlNv9/x0FjqwdXEDbDLy1nqlK6L2JjYoc2FTGS16+gPPM+Rmt1x+plTxJO4VRyOpb7/cQ0I6mduItWvlu6R8ANHVG5cwrQ610+US4J0PHCgyqstpTWLB8WvldZ8sAd8aTrCUZvXGnA+JRDO35WL44YHhcJ+HnTkgmGhpFZ5hjGk63kBng==
X-MS-Exchange-CrossTenant-Network-Message-Id: d830d084-2d5e-4f80-8624-08de7e3ec7bf
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7710.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 00:48:43.8885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FrH2ZeWA8SNCAk0vDdORC30IDb7n7+8+EhK6bBzCKNXu6DAKg3P0YF45MffuMeUR3u4Sy4s4+wWJKY5tl9Iamg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
X-OriginatorOrg: intel.com

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260309-1128
head:   d191c7a412f62e5ccc4db69ec6667382ee2ce9c4
commit: 881a273c267f689d40465e5a1006a24f530c2f92 [16/31] RDMA/hfi2: Add initialization and firmware support
reproduce: (https://download.01.org/0day-ci/archive/20260309/202603092131.gL1LenYG-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'device'
#551: FILE: drivers/infiniband/hw/hfi2/affinity.c:520:
+		 * evenly among devices, then the first device device to be

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

