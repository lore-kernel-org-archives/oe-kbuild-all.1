Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD526ED3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Dec 2025 06:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764570540; cv=fail; b=SvJqjmeYzkvcwpHMeY2akyTIxAYmaihAMeTroP5JwCUrb6P6rpReOgMPd3/qYqu6s3pDTPdD9P7V5de7fYld1PM9uYdwsV0isb4iaG9jSB8Jptl03bEojc7TH477Akle/ArOGP8u3xK0palm1tTlIHusCTzW/ZRwE/Vkj9TERX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764570540; c=relaxed/simple;
	bh=4SmTjFdFeVLhMY82c2SEa3uxgAVnYA4iG3Kd+BaTcgE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=dTCcUgEZgwv8HaZN04enbBu05nyrA7hNGWKlr5Tq50Kh0qEQp769eRzRsPLMkoOCzk1v+HZ2W9M4wv3f+XSXV/cQy7mDFUumSxvTLphUPeLyo1f075oPe/sHHB5eGBuhw8+Sn4KslTPdA2TVzV/la0g1AaLj7odNnyRitsNlHwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7Ec7PLW; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7Ec7PLW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764570539; x=1796106539;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4SmTjFdFeVLhMY82c2SEa3uxgAVnYA4iG3Kd+BaTcgE=;
  b=G7Ec7PLWEaa+Z72gh6eB+8w2hCPtIbY1KqfDHKLtV1mPgCo8wdsLpVW1
   IAt8jS7Cxt+sCDsuNHCf87CxJ3LUn9s9JYhJk2aPfLEA4azm2zx76GraP
   D/Un7UX6kQc6OFM2z5LDgiieAooGD6rr1ASxyUNO9qPupke275Y81o/01
   dLQ8NvwxYxkF/16S94JAwrnXPo+TqYTjn84oQKl/a0LSnQ7lqCpaz3NY9
   4IsGoheEnriIhvT7YhoDIKrVt2wUfbjAZhI2p68HvulCcVUb0VzPzC3SM
   UX+hnkwyZoW+LRSXAzg1iXCdMAT3srXtmxtuGOta+alIs0JnV3p9hmdvS
   w==;
X-CSE-ConnectionGUID: yHMN2/B0SvW1xWVu70vUUw==
X-CSE-MsgGUID: VvMw+HKGQpmv6pRERq/psA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="77968404"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="77968404"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:28:58 -0800
X-CSE-ConnectionGUID: 3SzzXqR/RJ2ET2ZwiFyrTA==
X-CSE-MsgGUID: VCC08kHlTnuDcSEF6qpwWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="194400942"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2025 22:28:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:28:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sun, 30 Nov 2025 22:28:58 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sun, 30 Nov 2025 22:28:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opyeqemdiDiEW8TyRndYPT/gBmeAXgmZBSHSvcxP5EzHU5V134yCvosJcaQR4rwf1CpdmgthFdRk+9RJ6zKf2/B/W5FGKozGVM6emDdxDa8AfARvNVYdWl9IhHeq5UiVoYTSmZNRRAdDhkUQ3xabdwlNT1isJAsy23LD3dcqcF8RUxbwUgp0jimOFmvQtCvHubRIbjbHwyfmIsCN3nm1THG38c0wJ0e9nHnDCmGZDS4CBPCdcDDdk0NtWecB1F4brBC9aQRVwJnmwbFYjJErPQAlul6BXGIOCx95cJgabF5apWd1RNvfJ3SsES3UVCSbvMAPQEEeTrEJWq0J4zjBEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4w94CE7dAB1TiAw4cp+mdboSXZJs9aZW8gmxTkHU2Cc=;
 b=hbw6r0uU/anH6YPy47YvscMzGl5Q4puqXznhWRndAmLHgtYtOj0wF0p9PZ6urEtkTmus0flbISZej+Dcdtoghn23f1R/W9NCQx3eUdanfF3y12c9KLYxCb9fQVZolxbitPXjQCJr2mvQkb3P5nTJJgNXIRMltx7ZE7skDJIo/Q1NqixUzsLDrVHcJPxhD2E61hbBBMSZz80dZ2Z22m+WIEjt8c6QyR3kNIkzb88f/+cXVF2PbuWLEWYsAGgQqQ8ShFRpMRbcI2obkOFEzax28gNjWRFeuY7M9v3XAauO3z94STxOeWUgR0jHYEJ1YbtVp6Kd3ssIuf5AeIVOWGbYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by CO1PR11MB5156.namprd11.prod.outlook.com (2603:10b6:303:94::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 06:28:55 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 06:28:55 +0000
Date: Mon, 1 Dec 2025 14:28:47 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [jarkko-tpmdd:tpm2-session 10/18]
 drivers/char/tpm/tpm2-cmd.c:211:20: error: invalid use of void expression
Message-ID: <aS01nwL71ytAqKZv@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|CO1PR11MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 56af4bda-3bc2-458f-c219-08de30a2e6fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s7r0YF2XHzP/3rhNqG9/Poo+UCL5dLXqn3TQoQbjtMqxXjr174IUbTcxjvRl?=
 =?us-ascii?Q?l9zLoCdmFW8bb2cprT3UaeOpPqqe8Zy+UUmxIXLKz8bLu6U9m/asPpPMqsTn?=
 =?us-ascii?Q?ozc2Ele6nBW0Bm7JwI/wGWlluFDwcnxJQzq9JIdu0vM/iXXkavA23VeV6rUL?=
 =?us-ascii?Q?hhKkNxBSdSBVvWzMMlWHXrhoh5bK014ALipQjZRBIB665YBiGflLE503fosw?=
 =?us-ascii?Q?yH5Pm07aniqDbTpaI4FQiUMW8r47gjUJeC4PWU0wbgME7QI9h9Zdjx6DJtCg?=
 =?us-ascii?Q?7AQpT8qglosfZf42V8vat3ciiBfUIYAWtTYCnW7mcK8/LzFw2gmVpzuS33Tl?=
 =?us-ascii?Q?KDhYhLG+AjHspUilb1+gFt6QDzLCk4ub2Lh2ZE4oFngc2blr2bEpZbKgfoLh?=
 =?us-ascii?Q?n0B9qpK6yQnry3mf1ITT9ZYhx5Mmr9JZxQPgW24E4mU3vqdw0oXhaRBNYNPi?=
 =?us-ascii?Q?OY5ZWHY3I+C/x13x9SNR/p6I6AjRda8H4CqRm1zGTOwTNx3sHBIZweL2S0zT?=
 =?us-ascii?Q?4Ot/sfZlSvc7DjnD6bjYmttz6O+dde3fLMuZ0JOBpXFJapeHCWcj7RFoL6PW?=
 =?us-ascii?Q?7C3MSZCMTFPBuvIf3NndX3W0Kpe7pCKl1pqYB+J1rrKebm44MqumeCdngn8p?=
 =?us-ascii?Q?aroGraeDtadf2L+guJkQ24bsqxU8cHLbDVZG7vnIayURCaPGBz6Jiuk9aX1m?=
 =?us-ascii?Q?IKnljtAcRs9IPkJa7JwSIwEuwR1nkolWTDZoq5XBMCeA3pKOWq4gcEs67YiG?=
 =?us-ascii?Q?Lvil4L6GNX5eWLnCKBFLDJu+sTRPwH4hVH4uPFij/J8bh0gGUVabqArBRCjb?=
 =?us-ascii?Q?7bXg/tXCn/L/eKRyzv60zx6P6MrEZG5wS4xdtw1o1LgBySZkIeoi7ICBNxQh?=
 =?us-ascii?Q?ceUyoRsMPGR5gc0pOySZ5pb5i5NwxuR6I35pH63hT20mfkdTrNb0N9NOxEvg?=
 =?us-ascii?Q?XLpUONLVioy3bpHxT1iOKJ5gXheAVKZa5QsGdlLYeHKcvxE8khkxSO1rG7g3?=
 =?us-ascii?Q?93hnHu8BQhgMCKqJrKBOBIqVgxhksaY9A80vweuEVdpLJBhIAUmW7GWijApj?=
 =?us-ascii?Q?ngubUIOzqa7NzlyMhHNRVqXkTORNyLpUBeAqvtRDR8+z+Rkp9c91CoDr4iQ1?=
 =?us-ascii?Q?0Uok2gWwJzJp2ufufo5XPhIXcF9q4iGnMdwhykPAItjlr62/ZNymL5u5NvYn?=
 =?us-ascii?Q?scEjMmVOKOXA7u142LQyQEM2fb7rz8qTSrh/3nC6Rs1E7/aqaKBFwDOz67p3?=
 =?us-ascii?Q?VXeSIU6cFbe5W07hJdjK97qCavfYhuS6zeewUbDY6WCdJQ2W0nv2kYQFG8/m?=
 =?us-ascii?Q?dEbi8sKCes5KF5bf5H4dnNqSpKozH3/re4QDBy88g1giAJZazMWDHRuPQfVq?=
 =?us-ascii?Q?ABp/cT7kLQ57sqrELwM3I5NJcDq4h+Bmeps8NtkxaCLGw5+wYhdC4pZJwSeh?=
 =?us-ascii?Q?WXaiSH9UAuQ1/n7mMvD/qHs7mbgQi9RnFfMC04T1m64NLYVdvF294w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w7Uez0xAlJZvGy1toQ03ofKiLhnvUFhwjLrFtDG/W4VP5LOWVcwcSWhTecPN?=
 =?us-ascii?Q?REKvz5NfUX+YM6M+gI4t17euEEHuYgu2QCrz+5SCpn1UV9yq9eqBXGP5ZBFg?=
 =?us-ascii?Q?lcnW133ywMRmiTAvKmruJbwGBEDJlttrlaBwrbfQS7p1OavNfXL2p1sgtKkc?=
 =?us-ascii?Q?34/cUVs0noyguCvCbmDD5RGvvFulax4CpLON1r9AUJnNWiDtVdl2/vzAFYzf?=
 =?us-ascii?Q?yTnGE9eq0HB3eMWNiJOGtO/G73L+qWkD8F133WdHz7NvrLojJEzY6rZZb6ve?=
 =?us-ascii?Q?RctNjp7HWIvVi5geHs8vcU1kKpHCJbFEUsqXoOrNIh9CRqLoC7j9urii9XTx?=
 =?us-ascii?Q?NBJjX+HIoOjn8RhnRzaxUTb34A1KHhWmKctv2NVtEMF0xXSQT4SuqMly21zc?=
 =?us-ascii?Q?U7RkTKRt9/O7Tr26Yop3gbIM08rU4TJgdG3FIu7OhWS/qnzXZ6tFf/uCVp0Y?=
 =?us-ascii?Q?FGg01yDDGyZ5LjmF4aat+Vc3ov4yUX9+ZjcGC0kVUmcJ3v7tlJSpbBfSWYaM?=
 =?us-ascii?Q?bj05cw20v0AIUIc9LMhuKEI1ds4HtWXuZHryZRLkqe3u0PJ9mRprYC7TG6wi?=
 =?us-ascii?Q?J1NdGObjY1EQHu2V36vzvhRQjWb0EaGf8dNoIN0QPcqXw7VWTpfw8/bW80hk?=
 =?us-ascii?Q?uHkSAu3/lUXHIbUI2cQWT413bnvWKs5pjMCGlTnFULpHF30xN7L8PFmUeBf0?=
 =?us-ascii?Q?gv9dlt42wKPGVeUV0wYSeSZsfjmyAK2hee7gWo2HtcKo22b42ws/uQmaicmw?=
 =?us-ascii?Q?AvWfOmicgHUrwCmtLST5xQ7QbgpjkA+EzBXjRbfNiCzb2BJgMd44hV24T6OT?=
 =?us-ascii?Q?yMrS7FHt/0garRmCSefBYJGq4V3V5j2Xvl4F9xTqEa5+UxlpW796JjGuAlf4?=
 =?us-ascii?Q?Xo3AOsz6+EzhhlhLfLOoMxQwIFO7qXl7VrV7MWe1hPxuYv9sRVFkbGuvJQjo?=
 =?us-ascii?Q?gOfW81sJuWD1gbEICmXVzyjBOIBz1Ixxc5V618/etRHMFJqQXj42g5YKurcU?=
 =?us-ascii?Q?pKkoV9rh6VVDQn2WY0BGM0gQDkybvvJnOwr3HghlGx6If4cWct32hzf2CCDI?=
 =?us-ascii?Q?17i1VwmHnZ/pIstzULWGr1qGe90vGONkJU8ArU7EIDXpEugu4WlVg+dOM40C?=
 =?us-ascii?Q?kmMuLsrsj8oIs/3efJRPkKplGG4neR70WtCFcTHuVI04OS7o/9pQv4lwVbOZ?=
 =?us-ascii?Q?xbXI7FhjyidF6HqRIqk0MfucjaUjaHhjXV628xqZ+ugnAMDzNJEk5a150GyC?=
 =?us-ascii?Q?H6uobfwvbqZfGO9RtqxIapZbsPFJmv62NccY4GYmLEHOKqVdVtCDLP963nhU?=
 =?us-ascii?Q?JZzn+lxRFD7bUTn+6xeqsKEu1HxPfe2zWCbvOBH8ujEFp1B//ua5th2QQOyM?=
 =?us-ascii?Q?TvSDUT70SoRe5zFYbIUlvdOXqh/83M0BRwM+0mIKAsfTq+EurYvMMoqqx4Vb?=
 =?us-ascii?Q?mDi9EKbmRscA2YLEsYcmdJUwBdpRlXlJ9d6E0KADdaGuhE3//wD3+lZ8Rb+h?=
 =?us-ascii?Q?HpGZyq8MiDtw6+PZn8t1D1U2hGdz5k03xwi4cBlDVPpWqafoh3A3Kc6LDEQs?=
 =?us-ascii?Q?m3Vtaw0qHM0Hhb/nRc/QAVn40Fa1uBZb4AB+DZqc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56af4bda-3bc2-458f-c219-08de30a2e6fa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 06:28:55.3995
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDuJ4HQ0eimLMP4SLPKLJJWKImwH4H8RXbZlpz7cz4f82Fs4WUS4nry4V9a2+8Dm78tRhOlmtkmlB1eysYonVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5156
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git tpm2-session
head:   9e1990f86d12b41f0b37d9414385587a5e79591c
commit: c094b019ad89433d0fc5e6b9bff002697178cfb2 [10/18] tpm2-sessions: address out-of-range indexing
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251201/202512011304.Aw3Wu3Zo-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251201/202512011304.Aw3Wu3Zo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512011304.Aw3Wu3Zo-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_pcr_extend':
>> drivers/char/tpm/tpm2-cmd.c:211:20: error: invalid use of void expression
     211 |                 rc = tpm_buf_fill_hmac_session(chip, &buf);
         |                    ^
   drivers/char/tpm/tpm2-cmd.c: In function 'tpm2_get_random':
   drivers/char/tpm/tpm2-cmd.c:276:21: error: invalid use of void expression
     276 |                 err = tpm_buf_fill_hmac_session(chip, &buf);
         |                     ^


vim +211 drivers/char/tpm/tpm2-cmd.c

7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  159  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  160  /**
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  161   * tpm2_pcr_extend() - extend a PCR value
794c6e109b5938 Winkler, Tomas  2016-11-23  162   *
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  163   * @chip:	TPM chip to use.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  164   * @pcr_idx:	index of the PCR.
c1f92b4b04ad70 Nayna Jain      2017-01-30  165   * @digests:	list of pcr banks and corresponding digest values to extend.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  166   *
794c6e109b5938 Winkler, Tomas  2016-11-23  167   * Return: Same as with tpm_transmit_cmd.
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  168   */
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  169  int tpm2_pcr_extend(struct tpm_chip *chip, u32 pcr_idx,
aa042475938f58 Roberto Sassu   2019-02-06  170  		    struct tpm_digest *digests)
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  171  {
c1f92b4b04ad70 Nayna Jain      2017-01-30  172  	struct tpm_buf buf;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  173  	int rc;
c1f92b4b04ad70 Nayna Jain      2017-01-30  174  	int i;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  175  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  176  	if (!disable_pcr_integrity) {
6519fea6fd372b James Bottomley 2024-04-29  177  		rc = tpm2_start_auth_session(chip);
c1f92b4b04ad70 Nayna Jain      2017-01-30  178  		if (rc)
c1f92b4b04ad70 Nayna Jain      2017-01-30  179  			return rc;
27184f8905ba68 Jarkko Sakkinen 2024-11-13  180  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  181  
6519fea6fd372b James Bottomley 2024-04-29  182  	rc = tpm_buf_init(&buf, TPM2_ST_SESSIONS, TPM2_CC_PCR_EXTEND);
6519fea6fd372b James Bottomley 2024-04-29  183  	if (rc) {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  184  		if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  185  			tpm2_end_auth_session(chip);
6519fea6fd372b James Bottomley 2024-04-29  186  		return rc;
6519fea6fd372b James Bottomley 2024-04-29  187  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  188  
27184f8905ba68 Jarkko Sakkinen 2024-11-13  189  	if (!disable_pcr_integrity) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  190  		rc = tpm_buf_append_name(chip, &buf, pcr_idx, NULL);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  191  		if (rc) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  192  			tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  193  			return rc;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  194  		}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  195  
6519fea6fd372b James Bottomley 2024-04-29  196  		tpm_buf_append_hmac_session(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  197  	} else {
27184f8905ba68 Jarkko Sakkinen 2024-11-13  198  		tpm_buf_append_handle(chip, &buf, pcr_idx);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  199  		tpm_buf_append_auth(chip, &buf, 0, NULL, 0);
27184f8905ba68 Jarkko Sakkinen 2024-11-13  200  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  201  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  202  	tpm_buf_append_u32(&buf, chip->nr_allocated_banks);
c1f92b4b04ad70 Nayna Jain      2017-01-30  203  
0b6cf6b97b7ef1 Roberto Sassu   2019-02-06  204  	for (i = 0; i < chip->nr_allocated_banks; i++) {
c1f92b4b04ad70 Nayna Jain      2017-01-30  205  		tpm_buf_append_u16(&buf, digests[i].alg_id);
879b589210a9a0 Roberto Sassu   2019-02-06  206  		tpm_buf_append(&buf, (const unsigned char *)&digests[i].digest,
879b589210a9a0 Roberto Sassu   2019-02-06  207  			       chip->allocated_banks[i].digest_size);
c1f92b4b04ad70 Nayna Jain      2017-01-30  208  	}
c1f92b4b04ad70 Nayna Jain      2017-01-30  209  
c094b019ad8943 Jarkko Sakkinen 2025-11-30  210  	if (!disable_pcr_integrity) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30 @211  		rc = tpm_buf_fill_hmac_session(chip, &buf);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  212  		if (rc) {
c094b019ad8943 Jarkko Sakkinen 2025-11-30  213  			tpm2_end_auth_session(chip);
c094b019ad8943 Jarkko Sakkinen 2025-11-30  214  			return rc;
c094b019ad8943 Jarkko Sakkinen 2025-11-30  215  		}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  216  	}
c094b019ad8943 Jarkko Sakkinen 2025-11-30  217  
47a6c28b6861b1 Jarkko Sakkinen 2018-11-05  218  	rc = tpm_transmit_cmd(chip, &buf, 0, "attempting extend a PCR value");
27184f8905ba68 Jarkko Sakkinen 2024-11-13  219  	if (!disable_pcr_integrity)
6519fea6fd372b James Bottomley 2024-04-29  220  		rc = tpm_buf_check_hmac_response(chip, &buf, rc);
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  221  
c1f92b4b04ad70 Nayna Jain      2017-01-30  222  	tpm_buf_destroy(&buf);
c1f92b4b04ad70 Nayna Jain      2017-01-30  223  
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  224  	return rc;
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  225  }
7a1d7e6dd76a20 Jarkko Sakkinen 2014-12-12  226  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

