Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEAC33CF026
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 12:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791288479; cv=fail; b=WVxhR0eSY8sdVDgYUhUFcn1R8IG2ZVr3OCrUjcxKnrVfrtjTq9rKNU+JLohlak+46O699Uk15lNpdHlZdkDYoru7T7NsPlNVC4xgWowg0NR1guE/XSGNhXi2l+coQ1VJc9ra0hDc2eYprlo7QGmCI35qQNos9u5WHHfL2p91CMA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791288479; c=relaxed/simple;
	bh=oEPTC47DxpYU5kk5PZPKMbcH3c8HGQDiy+g10y1M0I4=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hvngva611Q4mZCChvSPb0vJZ70neGO333D+X+JGaySNpeHU0NO33Vd2R0V4idKj2bIgHZD8YBaqeN5/U1RIdC/aPpS4pCs/2FaHl/HwUJZzR14Q0bVoHc6XOMwh5B7FqdnOuggacYeLMys9y0Arsmk87XhdW3xbJa7CJkBokE/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5XXYyQt; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5XXYyQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791288478; x=1822824478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oEPTC47DxpYU5kk5PZPKMbcH3c8HGQDiy+g10y1M0I4=;
  b=R5XXYyQtDbVlc96xVt9uspLFOpp9WCAsaJHSswJf37SrDfd9oj4HKElT
   zVcSdwB8mdJBOIXLsZfjIu444qtnHd8MGdvGYFqaMuzP64uZNsyn+5obj
   c+geVHWJ7bEc/W7FnD8g/y8f4rw9FmkH8035kyeIO9d0JSN3E8hFbfRqf
   RnQvOGZY5s3Ddqply47k6KyV66z5Pi1mrOCniuqlKuiDwprfy8EN6ZZn8
   6CV+VtDjyjganZiWJzMA44amUBLLh07a60sWQja/bu57rYy6BQRoVIM+T
   wVrl0Drt5RMsr37iN7hbocqxbn1FhttnhGCFuO8Y3hdzyGA8NNVUDMY/i
   w==;
X-CSE-ConnectionGUID: z61Q7pqlRVGtlVUDV+9R1g==
X-CSE-MsgGUID: GgYEST2UQPWKFMxdIsCZfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="102136082"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="102136082"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:07:58 -0700
X-CSE-ConnectionGUID: qv/kaavCQCanloJg1Sjc0Q==
X-CSE-MsgGUID: qr9rTr/lRM2GyfP7bEEGeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="273503562"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 05:07:57 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:07:56 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 6 Oct 2026 05:07:56 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 6 Oct 2026 05:07:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9/e5JLpMMjPCasTgLy4ZBUsBxg0Yvwu0VQlIO2KFcCBFYzvkpv5xtvv5ihxluaBPUzdfjJhLvzhpKQkESAo53B9QrZ7XofDRX3Ti6/pwPVLN630j+CqAE2FnB87JOye0Ue9We/M1VwQyl/gigtUaJyDOdqzPwF5ovwm6Mmml+/nbB53eLcHRQqu21MwniCrqLhbWavt7SDkWNxDBKV2TXoUc4+HuCdREnW7ozbojeG7gXKFv8HITGNW6tUMrlmvDjQvqcHnPa2V+5EdD30jSM/mA8tmSmyE75/ea2vkgfykbHpbDHJwPnsnueiiLRBMzr0k/OScTpwbqVZ3wZfI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cATLWYnaojdYGhWG7s3v7OGdWCBHrNOdcaQQxSUxqhg=;
 b=lczl13IHLHUD7GfJwL/qaONU55oP4AZBy9NOylCsiOopzgS0GZC+amD9SVfG+diW9VweGE0hUItpjbQgubefsGATiE2MFunoPETqdEnS7Pxb5N86m677D94fIfOgW744ouvtb9LlI+zeEcsvX1IoytfYgGJUFdnB+asK9omTpxJHBGzpIN5l6d2ywh44uG/XjGBSiaqJbmjiwr9d7Uody3R3zDSYr8V6M7pLq20DPqtnOHVdXvtG8S7yAfmSZPWI8HprphxvBo1S+LeOw4H6jAh1zvvNcSIsFSVNJ+npVfrmCqFkSDn/03vr+n5GedH224Nh86CI2/O68n4nathsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Tue, 6 Oct
 2026 12:07:48 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Tue, 6 Oct 2026
 12:07:48 +0000
Date: Tue, 6 Oct 2026 20:07:39 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <kasong@tencent.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: include/linux/mm_inline.h:131:19: warning: overflow in conversion
 from 'long unsigned int' to 'int' changes value from '18446744073709551615'
 to '-1'
Message-ID: <asTki775sfHniKBV@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SI1PR02CA0018.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::7) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: b8e5f264-8bfc-4d3e-7f61-08df23a26fce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|18002099003|6133799003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: H7H3ozPQH+NdSs/nJGHWAS/p1Zt5ZGYumKcLgHQ2cQDAeonea8MTxIJ6rfOqCyQSHyaMV/PYpq9F/lV5hwUMMNCUobArNDATwJOBcgUgG/NJ4i9FRAS96Y6QAv6A7kK1EcMxznTjcz+ZnhcKi4PtwHBXIrR0x2ghwGliGL7to3Nnm5aCTFmDey8F1qCMNwP2B2pABydywhmEV21ytWBcrN8WjRGYnVp5mmqIttXQD3JJl3TI1mief5BNMUJu+35+7fZyEqQTo3HrB3fAU7HwyCQZjCFeTBCrvBDE113yhkmuSy80y2UGBG/6bcJmYUd74hkB/JbyZ6M/XCeOxWwAJMvc+4TBXQPhat3/HjFw1qhULj7m3nAsd4iEeA3tqGq6sNFtasjFB7DJL1AvqvZtzpFm75mlIfFLVYw5QoMAhXVtxHPy1IZrw0cFS1sVN4qXyzb3AkquoM4gFmyGz5ghQJxiHFK6RnWxtWQ+g+7HkmggCq91+nLjmWCKi61v8G1IKYP+RxpQC8o8samS90W1lasJbO6W/kASZZhZ3YZeGnn5tZ4zFzbHI/U4OXiRBfh0mKOz44fMD6d/Rjaw1Hllvku6vJgC44Iw79V3BUo4UlPqRlKof4PWQ6AIKGIpmhxa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hLwvTca3aaqEV0ilChvBqwTBVu5pxOiKXpU2SRHk4tNmZCilIXbcCREyfFCu?=
 =?us-ascii?Q?GasCRF9KBr+2u20EqoqJSGOdbQuZCt7Vd2r6UpiPqQFueYvmbsgY+vDEc7D3?=
 =?us-ascii?Q?faz5T1bbMiClwFfJcrv68kTEvkT9eMpJy0hy5br2e0LFtTHBa3X4MJ+RP6/R?=
 =?us-ascii?Q?BfAneBXcwJ6HIhzLx6dY/xl9qH6kvIW9Vd0shjOGDBgeQ/zWZ3lUMBRHmhhm?=
 =?us-ascii?Q?0V871AUufDvChWr6Gb5KqvKXMBigqibnLYYW9nFF/QZFNf4knUXMFmoMM4ux?=
 =?us-ascii?Q?/Z9FnW0JGpqJhdhH+7VJKp+Ldy7FQOqgQFTYvhzjUNBJKPhA6qQ+NFyxxCH8?=
 =?us-ascii?Q?v13LeN4Ir5lSEWbtQThSx8zeXDXuXjuusi11xSVBkcH9o5KUjn/zN6iYTfQW?=
 =?us-ascii?Q?y7Ju+HytOh0XOoYX2sLyPnbwt0K7y8HyFFCOEGjDt/pWzwWCA3luL03HKUVx?=
 =?us-ascii?Q?eGUTtu2ETmsAyVTLA49DCvbasjhwG0blpzKZgC9AK9qYJGVQ4Y7hZjJEsvX7?=
 =?us-ascii?Q?s32PevnhnkIZ+n2ITBP9JO8X7Kf9+NLnYuJuRprhRsDfdTtF7hYgL+1szX/h?=
 =?us-ascii?Q?7C0RVsKAc1aiXNh5CZ8X5EGMjCyo/D9niW+jKcQPdlm375jPnbCecsUzsiNe?=
 =?us-ascii?Q?jJvMw7PDwm03ZJOSDFfNqEzooFWivL5gxMPr9c+zYNWXQH/kbKlfnijLEce7?=
 =?us-ascii?Q?pyw0A5qNYLejvIbYLVXIjvvXXA8F58TAS10bv2qTznCTbP6w8lZrl3WtxjqN?=
 =?us-ascii?Q?PqDs+autFurThrsh4237p9xDEtrP5k5JRup+F2biv3ladLdHCg/OOR38hpMr?=
 =?us-ascii?Q?EElgmlp+wcMECKrlgzADdNbuH79s7P5cn4TjjoQawuDXYXlhl7E6wJFLbExy?=
 =?us-ascii?Q?Ae5lESGKvj1E18wmMTr1HLzLBf43rbkOtWzGmbe28YCHQTVjIgzIpmak5BIs?=
 =?us-ascii?Q?ArhXSAdrXhmpW3rihq8A5kxs2RHznxNS3Dcx25wmsaEfxF6EFoybDF9UN331?=
 =?us-ascii?Q?A7/WwMzKBq3v4DoOaAu96NjUR6fHaMGSv8SGR2Ot/DVQSHMnuLFo70xp4VcH?=
 =?us-ascii?Q?K5xSZs9VXhDW2JdGWH7dZwPHv8+Ma4x28tG9+oSKVcLbw0uMwMnd9y0X3SME?=
 =?us-ascii?Q?uIQtpQOj5xxufwqPw1AZGeIVcZeBIwVI2uG3VEUSTb/VZRM391ESJ725HRWm?=
 =?us-ascii?Q?Ix9IxZYslv4exlvnKQ16Bkps8Hdoiwep97Z7oLnu2hgkFBnp+mPv0cYrvvaE?=
 =?us-ascii?Q?DVam/SvwlsHQQNw79NpH+dT5HKeceqTOJjrOY+9S7m0seDHGVqHBeKOYD5bs?=
 =?us-ascii?Q?cF0vLoxJ27wb6zduwxqLNriNayr2auojLNz3GVufcUIK6UjypHv880zY4SRp?=
 =?us-ascii?Q?mnJ6twvIp0cYkjEMMwlycWwlSFHsUTKubu0kpVYdI6A7hV7FJ9BTfN8R7HMS?=
 =?us-ascii?Q?CX3d/IqsBmcEHBrfAIlDxVUbDCR4vQwsv4oGW8d5tgcR3lBgd0sOA7ABMUBG?=
 =?us-ascii?Q?VP3ncOFeNlFScJLsZAP62Oz+vG2qS+wh4Ii/1YcS3j5+GgHa1cpUyRCFNNOb?=
 =?us-ascii?Q?cGPOxwQLVx70b8vRjoj2IwXVmtnsBE8Bfn/13qN1TSr5KgiWPazZKK4ueuP6?=
 =?us-ascii?Q?hBgPifCi+sOd+hnLZxf/jmGku2z4EAj/Y8lahD4C9pmOQNjTNcPZ21as5ZmC?=
 =?us-ascii?Q?SA/JJst1xqrIpc9AmKPA5z5/QEBE42cHtJcfofFyFJgKR2CCzLhDqUJ4+fh2?=
 =?us-ascii?Q?vf2cU3tG9A=3D=3D?=
X-Exchange-RoutingPolicyChecked: qIQpCox4r6pF5KWLsRfLa+Hk18R1xfkyD+UT8ZSa00nwm9++v800zGsZgLiVqkX9VEq8RZJTv9jZQU/weUF57SX6S/AUZFEN9xPb6IzWVX87cHdNHfutlpxujZx81oNN+spSM7jEw34hacsKq58Q6tLKGTdCC0gu2hMY8R+NtAgIM2Cy9q2i6UYyVMjCX175BJD5FqL9mwR6yZqkIn2RAq4VaP/92Ol6fbuFCZau3be2mZzMnUXgjfFbMjpk8OUMPHFuPfzhDZxX4OYGdLtg6S57E2KD9ZoLfgDJYz7ax3jNsUuho+3hx0aafmYrBbP4CcoZDpm8QY/k3lBkybyjeg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b8e5f264-8bfc-4d3e-7f61-08df23a26fce
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 12:07:47.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cZXF2YheDOQUtRTk1XP2oY2IM/inKyvqcx+oUnAlV7JjW4SXhXLIuxcv3uLSRGXIOZl7nmvKe6o5a61isQKyKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Kairui-Song-via-B4-Relay/mm-memcontrol-allow-update-of-LRU-statistic-without-holding-LRU-lock/20261003-205512
head:   fb7e985a90aa08774d1149de30384a36bb55bafb
commit: a24ab9c3982c5dca7d02d319bddb26221bbe433c mm/mglru: make folio lru referenced times count a generic API
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20261004/202610041009.rRGnlvdY-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610041009.rRGnlvdY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610041009.rRGnlvdY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/fork.c:47:
   include/linux/mm_inline.h: In function 'lru_get_gen_flags':
>> include/linux/mm_inline.h:131:19: warning: overflow in conversion from 'long unsigned int' to 'int' changes value from '18446744073709551615' to '-1' [-Woverflow]
     131 |         int gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
         |                   ^


vim +131 include/linux/mm_inline.h

49ccf47e2e054a Kairui Song 2026-09-06  121  
49ccf47e2e054a Kairui Song 2026-09-06  122  /**
49ccf47e2e054a Kairui Song 2026-09-06  123   * lru_get_gen_flags - Return the LRU generation number from folio flags.
49ccf47e2e054a Kairui Song 2026-09-06  124   * @flags: folio flags
49ccf47e2e054a Kairui Song 2026-09-06  125   *
49ccf47e2e054a Kairui Song 2026-09-06  126   * Returns: A number between 0 and (MAX_NR_GENS - 1), inclusive. Returns
49ccf47e2e054a Kairui Song 2026-09-06  127   * -1 if the flags indicate the folio is off the list (e.g., isolated).
49ccf47e2e054a Kairui Song 2026-09-06  128   */
49ccf47e2e054a Kairui Song 2026-09-06  129  static inline int lru_get_gen_flags(unsigned long flags)
ac35a490237446 Yu Zhao     2022-09-18  130  {
49ccf47e2e054a Kairui Song 2026-09-06 @131  	int gen = ((flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
ac35a490237446 Yu Zhao     2022-09-18  132  
49ccf47e2e054a Kairui Song 2026-09-06  133  	/* Exclude the legal -1 from the unsigned MAX_NR_GENS comparison */
49ccf47e2e054a Kairui Song 2026-09-06  134  	VM_WARN_ON_ONCE(gen != -1 && gen >= MAX_NR_GENS);
49ccf47e2e054a Kairui Song 2026-09-06  135  	return gen;
49ccf47e2e054a Kairui Song 2026-09-06  136  }
49ccf47e2e054a Kairui Song 2026-09-06  137  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

