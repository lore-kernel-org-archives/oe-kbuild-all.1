Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF11A79C0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 01:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715737370; cv=fail; b=rUw2ImN/89nKIR76cAynKWiE0udefjm93gESvIeQrIumK9M+ekvSebdyj73YO7WqlgtL4l/FtA+v3Qjj3dGVU6kZ2M0LT5D6rDQMtDK8RSIR9KZr5ygZJF0YUH38Ml0QkRN8B9Q/4r9G4i8fweVyjTSjwRh8kpAL5z01T12VSdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715737370; c=relaxed/simple;
	bh=fbKSrVObrJ+LfeqVbZiatrbmYdKb6/mN4HbahHRZMnQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=bo8FRF1V1Og+7jVCGuDjgdB1kxoBCdiS+qr/xv0QMjV4e6NJc/LlChb1X5Q75bEZiPGlWuCE8/aqsOoTLD3cWCD2ad57qfwcZbq60kJLvv4HY0kjjOvOuNmDtmggPohTZUycAgyb0+MRB4LJRhcgjfZXTcY3qctvhXolodorlIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+aq/YgA; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+aq/YgA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715737368; x=1747273368;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fbKSrVObrJ+LfeqVbZiatrbmYdKb6/mN4HbahHRZMnQ=;
  b=Y+aq/YgAs8hKgcHzfVTmB0FS45TCnTNnbNgVE31H78+ZNxLsQBVp1OOY
   NGo7i9z+BXiPVGhy20Io0f64VDWXW2U6Ifa8AXYskYubDjVS//MjwQvZ2
   kXF1DJAQWnu8ZueTfwv8YvsvPtjhhBv93WzQkPhL/JyUSwYGQieqyBzMx
   hDFu+CCjgO8wM9Y+CAQ7gTmSLgah2jmrGsc8C0J39yixDibhr1+YGDbZY
   LyfWVtpCYdwoqnVWCbiLhbohLXgl9XgV2MJ6zLy01p29ZJDXa0teLnUKN
   20IMUzDBRMxP6vpMCtRpTVxUN+Z1GXV9i1x4f9/cxAmTz6V7pKtoDn4kv
   A==;
X-CSE-ConnectionGUID: IrAZi8IrSiGSLtlRKiMIKg==
X-CSE-MsgGUID: UahHfPTITrWAOm06JQq9dw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="23165298"
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="23165298"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:42:48 -0700
X-CSE-ConnectionGUID: X+nAgJPbQ5Wj5UQ0VkYMvA==
X-CSE-MsgGUID: IH6IgMDHRLyorC6K6+iGYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,160,1712646000"; 
   d="scan'208";a="35770390"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 14 May 2024 18:42:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 14 May 2024 18:42:47 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 14 May 2024 18:42:47 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 14 May 2024 18:42:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEt/MiQuzpb+5iGoZP66JO/fBCub4zsoRUpTiFfO0aQImsYJwlm4LL6DWpyWRV2hpK/pjO+0q7xkf9mzhxTeDvJ1t39d7U/OC/RHj7mG+uteQryO1dQkTUOx+WyvxSLyoEy5cW3iArG+myhApasd54bZTxZuMKt54Q8VXoMfegXGrW3eMsTVhWaVCUsllxiFI5Ljq905ff9iZYjYLMxH0vE6Apb5v9qfqpmzGL93XX++kwAwD7AoplSTbsEYzw/e+XuO+LeP2wFM4mCWjLCVh2MLMFP5uxbS6Sy5riUzfukuS9NKKNX0hLeB6DmBlnv/XiMH2be1ZdkHe8UnP8bmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5JJWQxWrv5wwjcmOzynrlbZ7p+wwzv6aj+ImS9nWH8=;
 b=UA5Dawj2RcQknshAauL9CClgCKZU+kJuEPphusl/SEfKaL1pVHw3w/xvUUUVZosZOzb1wanrHQl0BClPK6J/d2JZiCW5riV+ADbhVIvrxcWQo6r2EZ/4QYbULUJmDfaHF71K9chJFT4oNWn/RB9iiLwScxiB+nDe5HOY3hpU3ZDSjzHKcN4Xcx2qBZgWJGwfGm1Qh393MV5thTclG2LT4VJ2r2eret5//GDTsfjt76C6gEYGYnquxDHBfQqyjRL3kdxzWfTNz+6QOurmnUc+B5FSg5oAZ14AjTgyYDQ2uO32olk/fIcvzQMufHfnoRDrWnSvXZ4HLz9vEa+gBqqH6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
 by DM4PR11MB7182.namprd11.prod.outlook.com (2603:10b6:8:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 01:42:45 +0000
Received: from SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45]) by SA1PR11MB8393.namprd11.prod.outlook.com
 ([fe80::1835:328e:6bb5:3a45%5]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 01:42:45 +0000
Date: Wed, 15 May 2024 09:42:44 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Edward Liaw <edliaw@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, Sean Christopherson <seanjc@google.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: [sean-jc:x86/gnu_source 41/42]
 tools/testing/selftests/kvm/rseq_test.c:223:undefined reference to
 `rseq_register_current_thread'
Message-ID: <202405141601.VXdtmd3C-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::13)
 To SA1PR11MB8393.namprd11.prod.outlook.com (2603:10b6:806:373::21)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR11MB8393:EE_|DM4PR11MB7182:EE_
X-MS-Office365-Filtering-Correlation-Id: fdabbeda-27f8-49a2-65f0-08dc7480517b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?U6NFF4HUhuDRkyyuzzHr+R61BlCknTwKTuHpKLv2ZlzV+q82Ku6gEUKfoHTA?=
 =?us-ascii?Q?yToWpqlJmk5vYp74PL2pPJnUyYmbRcxcqAGsILGcgf9s91pGRhXFbXBZTdMu?=
 =?us-ascii?Q?czxJ4Sg2GaHtGFQ5NKmYCe4f8HWdZHEylyiaI5HUkZL5ZiO1Iweoa+P1BN3q?=
 =?us-ascii?Q?GlcrTyIx3oJI81EEeox5wfUl6kEhzfPMx8FxBtamV8Qa0MieovaLb2PQqMs/?=
 =?us-ascii?Q?fEhDTTNzrc+OdytdiUkeWf+sHVWkEgyyU8+7dux0ATQfVv5rOqPu/An9wXKT?=
 =?us-ascii?Q?rP0Kmz3Mkuy58Cbqeq5r0Lju+6gJveBrI66BtN0hd0vdu5Ake254XUByh0MW?=
 =?us-ascii?Q?X43Sa8rpiKeJxgGZivnzxFsR/qjvbBHewY92zEsgIOEr/Afu60G8RaSeU1Oq?=
 =?us-ascii?Q?cSQ4tqUEuUMUyA/zSk1Td1cEMwSsrvZT7aDPcX6RqX+lwyvQokbsI/HRtXTl?=
 =?us-ascii?Q?Bs54cVpLSAy3va3T2QKXeQlZ4ntqalYOtdNvZ4+6wiuwG0LXfqIGoyFX5Xr7?=
 =?us-ascii?Q?9Bqez0ssV5bqet/LWcXOE4Ll7w8BgsbRkPmrkBjYOdTnulhwwLMFXMbACBzx?=
 =?us-ascii?Q?xggw46MM3WsbwhoPuTJIUTYfAMX5hqu/SNvOc2Lscq6Ak6MM4zttAs3dgsOR?=
 =?us-ascii?Q?u9Lw5UC/9EpnwfcCEOnsyy5ciF+EUBhZpab2wohYnVb4TlX+Rn8ubiDDP3iB?=
 =?us-ascii?Q?QsNytcmlmefV0GSL4F84OaDxiHBrJnFoMjP3ULYq7OpoHNNV0j4kHOc1L8ZW?=
 =?us-ascii?Q?73tT/5UYUvzLeO9qI8fVjbnejBckyzl7tyMkFDHwL8aRxQphNoPu8Vmo2wak?=
 =?us-ascii?Q?7o9gidEgYycrPfxtnJlRQZqKr+6M3jUlH8zxq6MtYhPE6hwisTqmkZC0nbBs?=
 =?us-ascii?Q?+ugI2XZ2VFN7chJ1+icjYkSJLgwFoqQne7C6fWzgOiaQT3qB8cG07RfJmXxJ?=
 =?us-ascii?Q?YGj6wBvruIeWZsQ22i9EtT/LNc4k+9Gh/xhLBv2figbUi3OnvPWpQKHuKoKV?=
 =?us-ascii?Q?eckD+M3A2kYqqvzJIjLrRjCqsWJrcQSSMYixSGUFH+bIcfcR+zgUrgSHD7Xw?=
 =?us-ascii?Q?QTYx+JO7DTuGnXlWCB+3Rk/ppXgZd1/2AqhWfwmVG/T2jMCkbngaPd+xMu0v?=
 =?us-ascii?Q?DUdVTlvw+kvtQM17JTpWd6Ep7czgV2i26yH2JpZvJEDaPzKYXAL2+rMVDKrv?=
 =?us-ascii?Q?6+kzZAiQE56oBokzJVhbqc8sVrV67DUDhecyuAM0njyTIiKPlFLLUSZIpcA?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR11MB8393.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ON3ym2ghKbvYC/q9XzFmI49y1Z6PvkiQJzFCKjePOTRJg7BRNsXqh7PFrkt5?=
 =?us-ascii?Q?YNCKWaNPCzT/XgaMLoipUa0Db6d4kPefIL0jVD9Zum8buCuoB2lJSQa2HDVz?=
 =?us-ascii?Q?bLUAgFSE7gRmQ43AiCLyUwIg4EDs5JuGOhCc79zO8inzxKX2i9tdAqGtJ2Yx?=
 =?us-ascii?Q?YD39Hcz/fU9mdF0usUY14efos69lUE6Uh1En5m/Em0TkMdlAURMqaESdWSCU?=
 =?us-ascii?Q?J9UJnU+RpYiFYwCGNEbchUXv16ylVdXArvy+qdTW0NjHEbKz43gt3sLjreLE?=
 =?us-ascii?Q?yhJs1pKofOUO9lyA3toOGuYoabOJQD4U6GaX7pSMEXnpHc2RckSN1kcJ+LhI?=
 =?us-ascii?Q?AUVwBL1LAWNi6f2zfVJWV33BIZIXf+Qx386tj/HPCMART4pP2YWs4gicNGXL?=
 =?us-ascii?Q?Oo1d2XCyrTZumcL50N0MsjpDTvkKnbYwZVv98sIsLLYKHUStSs00PgdN+tJi?=
 =?us-ascii?Q?sku65sbJRPOGCAEu9Tz/2UA2DlDnxcTNgItZfq2iAOpHCOBPaSUCUSKKyD40?=
 =?us-ascii?Q?4adyyirYm8Vges2hHHtdpmi7JbO9HyVwS2goQWASZWq8tPl/H3PPqmQLUqup?=
 =?us-ascii?Q?I7fySlaIdPO9iRF+lKKTTc4YQvX0tLfO3dZkkXdTO686Ds00spcn+uH+bimW?=
 =?us-ascii?Q?IWIgFk90O0syUFiwriUmtaUx5kO3BuZ6D5OVRyIcJ4RLVUPDbrNftNH11cuB?=
 =?us-ascii?Q?Bz0xSwfBSVkjlLk4jOsUit9Lq7KGLQgpq2bvzF7q+Y4XNY+ObgMDcGRfDaHD?=
 =?us-ascii?Q?eZyOlFVWjimdhuk4UEVoZA9HQsoMSOkk8fPF9Dzjm6THj9NmQWJqX72Z/JX+?=
 =?us-ascii?Q?xjhgEHGyOZnP4CWhrwyHSaW54hYaJKv6/5Q5wMy+l1y4IQGSJ29hlU7xWod0?=
 =?us-ascii?Q?+u6DJAHBgHTrgRViOoO0XRXsL+aeferNzMMO3qaN9Oblgf1KTsod+CUCDWah?=
 =?us-ascii?Q?iAZnDMHvt6bLtc2YyM8K/mIz7IP0LUS9rdDYFyk0WV7Dq8Lb8jswfyFmTyt2?=
 =?us-ascii?Q?I/l4wrZrUc1rhVUljJMVepIEULTnLIJBv0WmvmOOqmQ7CKTZOU3rRvW50AgM?=
 =?us-ascii?Q?HFNGL2ETO5gxDWXklfGfgGkd+hbLzcTuF8WTsZsLbNbWDd4hFNQ031NiRr0E?=
 =?us-ascii?Q?q6Ati87DWlKZWRpvqO48WVHZwJmR3VI0zKGekx9+wdunaY+KBOWn389CLcCz?=
 =?us-ascii?Q?N1g0N9gO80nCDBP1COJ7i/woBeG7QkX7CPThf+SxZOdyq5j3QYx0NFrTuTSC?=
 =?us-ascii?Q?pD8NwbKtY+yUPc4SDQBPoSDDQVaxnijhnsdEgtbtBNCOEDFrvo0H2dFeOfYx?=
 =?us-ascii?Q?enGe03pRBTirNk+MfwF9uskT2sd+mHfyYF1/BWI+G/5c0Hxg2SET43MPjSAL?=
 =?us-ascii?Q?XvA/Mb4D2CY/72+uz5duERznt/Tu4pvzertLIle5Np2sdTcyRwjNgcTYL6yZ?=
 =?us-ascii?Q?XWTwqx0jpveEp8PEsxpIQvbwS7TACcjSuWPMw69fBrDL8LCBjeoDkPYlJVQP?=
 =?us-ascii?Q?yWEjEY1XAsB5PpbdrV1+eKkgrLyFgan43doKVf/pb9AcvFDAlDjI6sddIkZq?=
 =?us-ascii?Q?E+absG4sFEZggNLNjAldUBu9put352fGDhhW04bz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdabbeda-27f8-49a2-65f0-08dc7480517b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8393.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 01:42:45.4137
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lZimgtgQ1anM92n7kN1lRYm3L7pJKnB+hWYoiHIglsRm/UHcUQErTnJ+rHZ3cG0UiVw0lJBq5kOoQcU4tTHz8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7182
X-OriginatorOrg: intel.com

Hi Edward,

First bad commit (maybe != root cause):

tree:   https://github.com/sean-jc/linux x86/gnu_source
head:   174e2813ab91474be393ada0051bd7479a777023
commit: cc63298ca9d5d24b37a730484b8a71b359652f46 [41/42] selftests: Drop define _GNU_SOURCE
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202405141601.VXdtmd3C-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   rseq_test.c: In function 'main':
>> rseq_test.c:223:13: warning: implicit declaration of function 'rseq_register_current_thread' [-Wimplicit-function-declaration]
     223 |         r = rseq_register_current_thread();
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> rseq_test.c:261:29: warning: implicit declaration of function 'sys_getcpu'; did you mean 'SYS_getcpu'? [-Wimplicit-function-declaration]
     261 |                         r = sys_getcpu(&cpu, NULL);
         |                             ^~~~~~~~~~
         |                             SYS_getcpu
>> rseq_test.c:264:36: warning: implicit declaration of function 'rseq_current_cpu_raw' [-Wimplicit-function-declaration]
     264 |                         rseq_cpu = rseq_current_cpu_raw();
         |                                    ^~~~~~~~~~~~~~~~~~~~
>> rseq_test.c:294:9: warning: implicit declaration of function 'rseq_unregister_current_thread' [-Wimplicit-function-declaration]
     294 |         rseq_unregister_current_thread();
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   At top level:
--
   /usr/bin/ld: kselftest/kvm/rseq_test.o: in function `main':
>> tools/testing/selftests/kvm/rseq_test.c:223:(.text.startup+0x14f): undefined reference to `rseq_register_current_thread'
>> /usr/bin/ld: tools/testing/selftests/kvm/rseq_test.c:261:(.text.startup+0x230): undefined reference to `sys_getcpu'
>> /usr/bin/ld: tools/testing/selftests/kvm/rseq_test.c:264:(.text.startup+0x270): undefined reference to `rseq_current_cpu_raw'
>> /usr/bin/ld: tools/testing/selftests/kvm/rseq_test.c:294:(.text.startup+0x310): undefined reference to `rseq_unregister_current_thread'
   collect2: error: ld returned 1 exit status


vim +223 tools/testing/selftests/kvm/rseq_test.c

20ecf595b513b4 Zide Chen           2024-05-02  195  
61e52f1630f547 Sean Christopherson 2021-09-01  196  int main(int argc, char *argv[])
61e52f1630f547 Sean Christopherson 2021-09-01  197  {
20ecf595b513b4 Zide Chen           2024-05-02  198  	bool skip_sanity_check = false;
61e52f1630f547 Sean Christopherson 2021-09-01  199  	int r, i, snapshot;
61e52f1630f547 Sean Christopherson 2021-09-01  200  	struct kvm_vm *vm;
2494a6d80fb58c Sean Christopherson 2022-02-15  201  	struct kvm_vcpu *vcpu;
61e52f1630f547 Sean Christopherson 2021-09-01  202  	u32 cpu, rseq_cpu;
20ecf595b513b4 Zide Chen           2024-05-02  203  	int opt;
20ecf595b513b4 Zide Chen           2024-05-02  204  
20ecf595b513b4 Zide Chen           2024-05-02  205  	while ((opt = getopt(argc, argv, "hu")) != -1) {
20ecf595b513b4 Zide Chen           2024-05-02  206  		switch (opt) {
20ecf595b513b4 Zide Chen           2024-05-02  207  		case 'u':
20ecf595b513b4 Zide Chen           2024-05-02  208  			skip_sanity_check = true;
20ecf595b513b4 Zide Chen           2024-05-02  209  			break;
20ecf595b513b4 Zide Chen           2024-05-02  210  		case 'h':
20ecf595b513b4 Zide Chen           2024-05-02  211  		default:
20ecf595b513b4 Zide Chen           2024-05-02  212  			help(argv[0]);
20ecf595b513b4 Zide Chen           2024-05-02  213  			break;
20ecf595b513b4 Zide Chen           2024-05-02  214  		}
20ecf595b513b4 Zide Chen           2024-05-02  215  	}
61e52f1630f547 Sean Christopherson 2021-09-01  216  
61e52f1630f547 Sean Christopherson 2021-09-01  217  	r = sched_getaffinity(0, sizeof(possible_mask), &possible_mask);
61e52f1630f547 Sean Christopherson 2021-09-01  218  	TEST_ASSERT(!r, "sched_getaffinity failed, errno = %d (%s)", errno,
61e52f1630f547 Sean Christopherson 2021-09-01  219  		    strerror(errno));
61e52f1630f547 Sean Christopherson 2021-09-01  220  
7ed397d107d461 Sean Christopherson 2022-05-27  221  	calc_min_max_cpu();
61e52f1630f547 Sean Christopherson 2021-09-01  222  
66d42ac73fc680 Gavin Shan          2022-08-10 @223  	r = rseq_register_current_thread();
66d42ac73fc680 Gavin Shan          2022-08-10  224  	TEST_ASSERT(!r, "rseq_register_current_thread failed, errno = %d (%s)",
66d42ac73fc680 Gavin Shan          2022-08-10  225  		    errno, strerror(errno));
61e52f1630f547 Sean Christopherson 2021-09-01  226  
61e52f1630f547 Sean Christopherson 2021-09-01  227  	/*
61e52f1630f547 Sean Christopherson 2021-09-01  228  	 * Create and run a dummy VM that immediately exits to userspace via
61e52f1630f547 Sean Christopherson 2021-09-01  229  	 * GUEST_SYNC, while concurrently migrating the process by setting its
61e52f1630f547 Sean Christopherson 2021-09-01  230  	 * CPU affinity.
61e52f1630f547 Sean Christopherson 2021-09-01  231  	 */
2494a6d80fb58c Sean Christopherson 2022-02-15  232  	vm = vm_create_with_one_vcpu(&vcpu, guest_code);
61e52f1630f547 Sean Christopherson 2021-09-01  233  
e923b0537d28e1 Gavin Shan          2022-07-19  234  	pthread_create(&migration_thread, NULL, migration_worker,
561cafebb2cf97 Jinrong Liang       2022-08-02  235  		       (void *)(unsigned long)syscall(SYS_gettid));
61e52f1630f547 Sean Christopherson 2021-09-01  236  
61e52f1630f547 Sean Christopherson 2021-09-01  237  	for (i = 0; !done; i++) {
768e9a61856b75 Sean Christopherson 2022-06-02  238  		vcpu_run(vcpu);
768e9a61856b75 Sean Christopherson 2022-06-02  239  		TEST_ASSERT(get_ucall(vcpu, NULL) == UCALL_SYNC,
61e52f1630f547 Sean Christopherson 2021-09-01  240  			    "Guest failed?");
61e52f1630f547 Sean Christopherson 2021-09-01  241  
61e52f1630f547 Sean Christopherson 2021-09-01  242  		/*
61e52f1630f547 Sean Christopherson 2021-09-01  243  		 * Verify rseq's CPU matches sched's CPU.  Ensure migration
0fcc102923dee9 Gavin Shan          2022-08-10  244  		 * doesn't occur between getcpu() and reading the rseq cpu_id
0fcc102923dee9 Gavin Shan          2022-08-10  245  		 * by rereading both if the sequence count changes, or if the
0fcc102923dee9 Gavin Shan          2022-08-10  246  		 * count is odd (migration in-progress).
61e52f1630f547 Sean Christopherson 2021-09-01  247  		 */
61e52f1630f547 Sean Christopherson 2021-09-01  248  		do {
61e52f1630f547 Sean Christopherson 2021-09-01  249  			/*
61e52f1630f547 Sean Christopherson 2021-09-01  250  			 * Drop bit 0 to force a mismatch if the count is odd,
61e52f1630f547 Sean Christopherson 2021-09-01  251  			 * i.e. if a migration is in-progress.
61e52f1630f547 Sean Christopherson 2021-09-01  252  			 */
61e52f1630f547 Sean Christopherson 2021-09-01  253  			snapshot = atomic_read(&seq_cnt) & ~1;
61e52f1630f547 Sean Christopherson 2021-09-01  254  
61e52f1630f547 Sean Christopherson 2021-09-01  255  			/*
0fcc102923dee9 Gavin Shan          2022-08-10  256  			 * Ensure calling getcpu() and reading rseq.cpu_id complete
0fcc102923dee9 Gavin Shan          2022-08-10  257  			 * in a single "no migration" window, i.e. are not reordered
0fcc102923dee9 Gavin Shan          2022-08-10  258  			 * across the seq_cnt reads.
61e52f1630f547 Sean Christopherson 2021-09-01  259  			 */
61e52f1630f547 Sean Christopherson 2021-09-01  260  			smp_rmb();
68efe8f7a1c516 Mark Brown          2023-01-06 @261  			r = sys_getcpu(&cpu, NULL);
68efe8f7a1c516 Mark Brown          2023-01-06  262  			TEST_ASSERT(!r, "getcpu failed, errno = %d (%s)",
68efe8f7a1c516 Mark Brown          2023-01-06  263  				    errno, strerror(errno));
66d42ac73fc680 Gavin Shan          2022-08-10 @264  			rseq_cpu = rseq_current_cpu_raw();
61e52f1630f547 Sean Christopherson 2021-09-01  265  			smp_rmb();
61e52f1630f547 Sean Christopherson 2021-09-01  266  		} while (snapshot != atomic_read(&seq_cnt));
61e52f1630f547 Sean Christopherson 2021-09-01  267  
61e52f1630f547 Sean Christopherson 2021-09-01  268  		TEST_ASSERT(rseq_cpu == cpu,
250e138d876838 Andrew Jones        2023-12-06  269  			    "rseq CPU = %d, sched CPU = %d", rseq_cpu, cpu);
61e52f1630f547 Sean Christopherson 2021-09-01  270  	}
61e52f1630f547 Sean Christopherson 2021-09-01  271  
61e52f1630f547 Sean Christopherson 2021-09-01  272  	/*
61e52f1630f547 Sean Christopherson 2021-09-01  273  	 * Sanity check that the test was able to enter the guest a reasonable
61e52f1630f547 Sean Christopherson 2021-09-01  274  	 * number of times, e.g. didn't get stalled too often/long waiting for
0fcc102923dee9 Gavin Shan          2022-08-10  275  	 * getcpu() to stabilize.  A 2:1 migration:KVM_RUN ratio is a fairly
0fcc102923dee9 Gavin Shan          2022-08-10  276  	 * conservative ratio on x86-64, which can do _more_ KVM_RUNs than
0fcc102923dee9 Gavin Shan          2022-08-10  277  	 * migrations given the 1us+ delay in the migration task.
20ecf595b513b4 Zide Chen           2024-05-02  278  	 *
20ecf595b513b4 Zide Chen           2024-05-02  279  	 * Another reason why it may have small migration:KVM_RUN ratio is that,
20ecf595b513b4 Zide Chen           2024-05-02  280  	 * on systems with large low power mode wakeup latency, it may happen
20ecf595b513b4 Zide Chen           2024-05-02  281  	 * quite often that the scheduler is not able to wake up the target CPU
20ecf595b513b4 Zide Chen           2024-05-02  282  	 * before the vCPU thread is scheduled to another CPU.
61e52f1630f547 Sean Christopherson 2021-09-01  283  	 */
20ecf595b513b4 Zide Chen           2024-05-02  284  	TEST_ASSERT(skip_sanity_check || i > (NR_TASK_MIGRATIONS / 2),
20ecf595b513b4 Zide Chen           2024-05-02  285  		    "Only performed %d KVM_RUNs, task stalled too much?\n\n"
20ecf595b513b4 Zide Chen           2024-05-02  286  		    "  Try disabling deep sleep states to reduce CPU wakeup latency,\n"
20ecf595b513b4 Zide Chen           2024-05-02  287  		    "  e.g. via cpuidle.off=1 or setting /dev/cpu_dma_latency to '0',\n"
20ecf595b513b4 Zide Chen           2024-05-02  288  		    "  or run with -u to disable this sanity check.", i);
61e52f1630f547 Sean Christopherson 2021-09-01  289  
61e52f1630f547 Sean Christopherson 2021-09-01  290  	pthread_join(migration_thread, NULL);
61e52f1630f547 Sean Christopherson 2021-09-01  291  
61e52f1630f547 Sean Christopherson 2021-09-01  292  	kvm_vm_free(vm);
61e52f1630f547 Sean Christopherson 2021-09-01  293  
66d42ac73fc680 Gavin Shan          2022-08-10 @294  	rseq_unregister_current_thread();

:::::: The code at line 223 was first introduced by commit
:::::: 66d42ac73fc680dbd7a1402f8b44967426522d0f KVM: selftests: Make rseq compatible with glibc-2.35

:::::: TO: Gavin Shan <gshan@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

