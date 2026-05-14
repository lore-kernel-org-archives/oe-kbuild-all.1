Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F7E3FCB29
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 14:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778767682; cv=fail; b=HlAtFNaRYgWKle1GR3Hm737zF/6zbggANfLU77r6EPt651sBA4Eyw7gRZTjUrcaxlGpJ1GcHhko2L9rT6QWmMCwFwTh4qeSgYE0HKs2S3Kd5uA/AMyuvxGM7vEyWqojSs5rZjVhqyK6jzEZv3meFf36WjX84P2GU2mgi5845kMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778767682; c=relaxed/simple;
	bh=kLKS1ARCLTqTGtfzlyCDpZf1TTuuFfPtwX/kJGCeOMI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=hXtuHnkbAZkQPhg0yOSpEcx2wJ6Q02eWwz6rCfLObfpddeQScXHMKpt4cJcZQCHh527qsDZD5GkTICRar+XZTjWTyN6P1kOW94o7ppVg0PEfyYCFjBtBeeeO5f2sAqGzUYLin5HIwXC/6oSpdhFs/wpiCpB4iqYJUnFnAyOSnmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3rffvCT; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3rffvCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778767679; x=1810303679;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kLKS1ARCLTqTGtfzlyCDpZf1TTuuFfPtwX/kJGCeOMI=;
  b=n3rffvCTFzZnslMf/Y6ui7bgUTMpyRjUC/Iol3G5stL99ag/O+m/ketU
   9cBR+vDnkRrINbaJShUj28Zk+ZG0+H2E6A5uV0dwu9/ykl1Hzvio+sYZ3
   kkU9oO9DL7+DQX6Ozx1JdnKdYCF4tDfo0icaXBC9YBp59BsUQCm+KbLOK
   4lMHXZNgcldQa4RiKWnxUv8Zuj7tPOnTIfM8P7GYc7txHrgWqTtkMsH2B
   5nsWRY64P7EiMx2uaP30zxu7jayR5AGEBNO/qyXzMEntOXKG6hp+wTT+C
   3wthq5dL3ieEGLmNT8d1ys0RaEs+oSZViHWy3ucSwjheBhJckS4fQJOVJ
   g==;
X-CSE-ConnectionGUID: trCA6GPxT0yzpIOq3oUvYg==
X-CSE-MsgGUID: aq25Q7LXTdqovJ1I3spe2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="90019365"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="90019365"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:07:57 -0700
X-CSE-ConnectionGUID: tKQ0rtSoSKWNs00p9f4Uvw==
X-CSE-MsgGUID: 3JGJs6lDR22Y0epMze7Zrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="261916725"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:07:57 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:07:56 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 14 May 2026 07:07:56 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.56) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 14 May 2026 07:07:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=it9F1fl20mk2qIWr5d0oTIrARCUl/lqcm+P2VdpyhUTeMSeyWecZ68xpNLMCzcAU9ADmxUqrpHp0JAU1dW1bMtnITCX5a0+gOJkAQckEmhkjeGx9P1vJQ5EjjBMOA0vTcDKz5Et3hlgGCHc6COb2XR+d+PDOu3Vs9p9fBDKEiBhl7+LPU20rd792oVRn0cBdld2q8VPbui5RD7LUFoaHOb5t4yG5gzLLQBvzk2HRNfMOgjslgNY07LULhw2cTfOwEsW17Gs3X4V1b8DBfWDjVadFiJAG8xZQBzCQ8ZBt//ma0kZbqHmtVdkPITwI7/ekapfNUw8J+lHWS+TvCD63RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3b+c+0MXuU6M30erljQWV0qzrR3ZPZYeW7nswKbtqFw=;
 b=jhGZHG6HKrnBw5HbtvaoQLbqSraX8jT+JW7yRkVWhUnCZ6GY6ntMbi8ll8Q5JQ+IZUWKl+qGsK/9h19w+6V5R52ip1YI779cAw6wBNf4t3zu7sYKI88RRQ+gk0c4CNjemIkYESjVp7rAKYFKpr7Xhtsnb6+wJvsJ43wVdnTkdPmH4cUF9sdEnqBGwaYs6I1qXBe5KX5ma2yCInNZXPtF6gJl4KlQU9zY7eWTcfvEa8VsRwwC2kxkWo446wLqMbiH/elmD1B1WFNnddjeiTj0VfmL/KqP+MIvM1XvyAqwc+I0/gAcdymez9SZkA3jk4dBrjevTDWa0fQvzVhVoIETUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by SA0PR11MB4751.namprd11.prod.outlook.com (2603:10b6:806:73::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Thu, 14 May
 2026 14:07:49 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9913.009; Thu, 14 May 2026
 14:07:49 +0000
Date: Thu, 14 May 2026 22:07:40 +0800
From: kernel test robot <lkp@intel.com>
To: Ackerley Tng <ackerleytng@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: x86/sev_smoke_test.c:231:13: warning: 'test_sev_smoke' defined but
 not used
Message-ID: <agXXLGCqNMLRT/Wj@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0060.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::19) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|SA0PR11MB4751:EE_
X-MS-Office365-Filtering-Correlation-Id: 8669e46c-f003-4eac-2f89-08deb1c22dee
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|11063799003;
X-Microsoft-Antispam-Message-Info: DL971zCEINspND+iJ/eoTbjnjCEBEsWZI780erSYScU2UoDlq2Qzo2R6lX96rFzZNBBkYSyXoe6u89SbRxBIb0L6M/Zm8wZt43hhNs8sQTtB3rz7Vm4HGKmYRtZj522OUWhPVKfn97Kf9F25eZv6Jk/j2z8L3MAfBr0KeSEGqUnCxdYKNmu1xXUAde62enLk2qyX6gp4QRWmtQxjiVkJ1vLZdl3QzWW6dZqVsDuhIMOaVioZ9gtwMKBo2EoRvnb/s6YJCdPv7HpOUH1x//5abi2CDYZoc8P6iv+BL/IHd18pUj4DFjK6+EXrDS6Hxfc6uxmqhUV6TLL7NPoYNF+HtVqhXA9Kcl0RtckrcCxV4vdE9C0h8EZmarQf5D1/ZpEE9TWTFE7Zd4JZVTTVUzmNei/Fz88VGhApTOJaMqACXESVGiLKhP+wMkR/Rs8UjYjcOvKWDpsGTGNKjgQqhQLyQeoHciz81pp95x7OW9gGAt5eorxvET9mg+wwxZIRWVGQ9knZjiGKuiCTtV+aq99Zxi+8b4QEAarj0w0eIOnfvw4blvL6d4lrx3nSZgm4ZeASTC0CtoMjcPsBhXyVQ7zuExp89RfDn64SV1JLXhSbaTUdcOL5ni1PJ1+iilHMyrgP9UHXrUWrOwC5tlFCfOw8kA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(11063799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YzuKRmkF1CM1GMcMVidpWmOr7Nv6gPCab002i+DviXu0AV/aui8hW2Gv2n+t?=
 =?us-ascii?Q?LIVO8nw+PnfHSJPX69ILCBgSV7kg3YpcxmHp9+eWbQa+ETmtWttcR+ObUk8K?=
 =?us-ascii?Q?xquncppRmpRJqYxBwmNkLqgdLJiAOykSIbovI2Mwud5tiPz0ObsWeyVuGzRz?=
 =?us-ascii?Q?EEi4Qitb7Qt8TDaLNQZ1ljvVXRAG4JAhjkTrNOu8MYFOVeYKs9MJKb7/nyXU?=
 =?us-ascii?Q?ne9cAKGCQz+0YdksY3MXqYFmrL+hSYnaQ5UXhPa++WHBi8gmj4zL9IA3ehp8?=
 =?us-ascii?Q?AXJTdqCi6B1gJaFKENyUJCYpFreNooFQ5j/SRmE7vS0p+c6THdSSrG4WS7Rq?=
 =?us-ascii?Q?FevRvQMGaRosous1jkoNFG6Xsdwi85D+kQyUTn4W1Jov7CIYToltVfigFLRf?=
 =?us-ascii?Q?iOBrQPi4qx0KyIoEzRC+VHOnLRot5dDjncdxVI2Vi0RWMFCSKrm2VbBJTO1Y?=
 =?us-ascii?Q?YK+Y9iV1EGbC7sgEbeRIMphx7mleQQT4gvKBLwSN5cPfd8L54u/LqiiXv996?=
 =?us-ascii?Q?oSm8gK4hj3XsoxkicmlLdjbZkq9fCc+ezI8ERIKFBixjnASrCVA0IrqDnDmA?=
 =?us-ascii?Q?wNhowupNCbL9WFChCa7t5hjjwjrU+rmXag7+wxQHhxocrW1D46uuMXAV0fjJ?=
 =?us-ascii?Q?t0rA9A1o4Thik1Zw5djQnY2eiu7xZz4OQLLcLzYILDqk/1A8d0So1gMy6ltD?=
 =?us-ascii?Q?6ATx5Rz0eDbaKgzc3LHEcIXph/l62qzNMEp9zpsWuhKba6qqblTdsXh88A80?=
 =?us-ascii?Q?u3L/9Fk8vcu3Ya5v+9SJuPJrWXp+A4GtuSPLYhzVQPgmJJSYUkJVthuJdD5K?=
 =?us-ascii?Q?cs48Rc+ZKhg3WkSyAdEDvXFEwhlaNLtn8E3OYTlPgxVg3a00H7E1fAh5LrG1?=
 =?us-ascii?Q?JAQnrVZvm1lY23/peDxzTESjzv1TGmlAMBm4gtpLqj7UHerUM9sGz3NngBvL?=
 =?us-ascii?Q?MWR9PFrjgL9CsiBb2pn23M72p7sQiOIRVxKFp30MhQ8YDLmh0pOQHAKyAp+a?=
 =?us-ascii?Q?/y9XiHQL9jSsKMV4rjvPwK0smREH+qS+hVlH8NjJA5jhmcFUNkEQ9Ck2VVLs?=
 =?us-ascii?Q?PeWWwGZQsZOyTpnrMR7QHkVI+LFewflN94NnAmmc4R9eh6sOEPOGpSNIuMgO?=
 =?us-ascii?Q?OGFCLGG+Bo1haCb0EhORaoWReltlzSjN0ZAIRzqitGLaBobcaRrPLX4JKhtS?=
 =?us-ascii?Q?L+XKCRPVBwctg9vNC7uPztOskiQVHbIU5eYZAZF+RWfQGgzfUsV4Lysf/Lkn?=
 =?us-ascii?Q?6xfCNn6ypZ4DyFA1/Xu8rmYLro8w0/3jh60X0Mcivf7yPkv5l9oHIyAFZ8xN?=
 =?us-ascii?Q?hsWphKgv+afaOAdKAvpF1oiC811oL/lX+QkMuIv6bW8d7hT6r9dy3eK1ig6P?=
 =?us-ascii?Q?1zdNXDxpSTTwTOqV8UiAIiR43yak5EtNnETv5slXsMcdFx0w/4bbYXD3dKap?=
 =?us-ascii?Q?esD+QA1xAHz7/JbWkeI9NMvYbGC4rxY42EXlBE33LPbHikUqfejR0geoNuld?=
 =?us-ascii?Q?MzeOAE3HnmD7FFtmBHNQrZobq/an7i1OkQBCy3NqPiPWF31oxrsAf42j7MWx?=
 =?us-ascii?Q?QL5npG7bjXhsM22NlAWkvROqzXN4WvhRMnmOw5kP0Gguq6lQDZj630yQrXy9?=
 =?us-ascii?Q?MEv1g/GnZlcbXE7utx8MXxKKBO70q3ULTh/fXgO2/sB14I/OnwHaw5aF8Bfr?=
 =?us-ascii?Q?lnqSlYkIYMqR/0NztL1sZTLwo83/M1sCfvSlSMptxjX3juz+G0ZDzRGMyF4O?=
 =?us-ascii?Q?N/mtsmIjag=3D=3D?=
X-Exchange-RoutingPolicyChecked: QmyVKqbQugcpiYrC9n7aRh+JJpQ2onpJN8LthD3y8dD9P0PIeFfgqTdCQ7HyLnvI60zP5su8savN1Ys5yXTQMbgWLbzPAfLeHTc3D159KeRsn6aWu3wbkO6PCValFmNkR9csQmNI0ArjmAJW1Jzfxv+5oQIAfmyGiSbopH/+7ILM2bVXnHoaeyOikS6uxDMsfjclVC9Gxw89WLa5hnABuskhxpoAxwt+BwMT88CUO1C3Pgm358i5/hR84Scd8nJo+ASS7Sw2PUDzqCBJmpyrhxhuk6KYpM7jvAoYvm3IrkG+FEmSN7QjzA6i4I3f6iNX0WEcTbFEM8R3kkG+lmVPfg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8669e46c-f003-4eac-2f89-08deb1c22dee
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2026 14:07:48.9954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2rN/qEkG/fu8TXhGfniLQ0JLhtU6tFT/rlpwy3p9fluVftJTqaRqEyBy9pnwJTYsXTpsFAmjHqRS061sXQlzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4751
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Ackerley-Tng/KVM-selftests-Initialize-guest_memfd-with-INIT_SHARED/20260512-184801
head:   bdb144cb86b6b1bf65cdbd4097bf557b940e24e4
commit: bdb144cb86b6b1bf65cdbd4097bf557b940e24e4 KVM: selftests: Test conversions for SNP
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260513/202605130053.LhXDf3Xj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260513/202605130053.LhXDf3Xj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605130053.LhXDf3Xj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> x86/sev_smoke_test.c:231:13: warning: 'test_sev_smoke' defined but not used [-Wunused-function]
     231 | static void test_sev_smoke(void *guest, u32 type, u64 policy)
         |             ^~~~~~~~~~~~~~
>> x86/sev_smoke_test.c:73:13: warning: 'guest_sev_code' defined but not used [-Wunused-function]
      73 | static void guest_sev_code(void)
         |             ^~~~~~~~~~~~~~
>> x86/sev_smoke_test.c:43:13: warning: 'guest_snp_code' defined but not used [-Wunused-function]
      43 | static void guest_snp_code(void)
         |             ^~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

