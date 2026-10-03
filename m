Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD4A222599
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Oct 2026 14:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038464; cv=fail; b=ArsDTVSk1dfRYnSkx43m/3a6xBT9GVFNkOqdRbOYuksr1mDyMNKgyfUXNpYd0Y3DfjkUKjLt5FJF3/9Fe9stXPm07cGOtys3nhkaTKRMWDFmCOicR4E8LVTPiKlAaKqshErduH0RNQSPJLX+qG+eCBUPzcrBFW6DYymiwtp3+4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038464; c=relaxed/simple;
	bh=WkxY2Y5HufyExf90ayXNQv37XftvogdXMKj5Wa+f2so=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=j9ETsgbdlfiN9eVBTORVYgdibIeETNNtK1potUNVew3c7KKoQS7L91bvPntxiGBfGHfJz68uC9JU1d5pQ+/IKGYZQOBPUzwxElbt22Da7uDOou10IuX9Kdq1PAdc/lKCLYptxYRyEoR/FT8jyUCr+77OzFjlRs47UQ/aK1l8UiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A4SZDnWx; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A4SZDnWx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791038461; x=1822574461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WkxY2Y5HufyExf90ayXNQv37XftvogdXMKj5Wa+f2so=;
  b=A4SZDnWxQ6S11HdgZN6Qkv4aAbrkfukoQX/HoslEj0StO/lT7A48YeM5
   dJbN9o5wl9pafkEZieQfoWyzXDs2PwM+o9AbZTNolGF7ittIWHO1pmVKN
   GpJKwLAbJ0BtUKt6PkJMjUoarxfK9i9227AM1R4Hh1crusb4w81oXfZVj
   Ajz0+ZOQXhKTwvVF8Ln291nAoAA929GlJwsVGq5RTiUpWljfJ/qNoOP7D
   /pP+4DAb++EXr+K7CUPAnc/PkkB06hhubNDuvqXTFXCjPLWTmxPgLMwYB
   r3l8puTnnweS8iI0JBzmQwPbspKpRnG36CxP7UYlNYWi45/7WJv/7x0MP
   Q==;
X-CSE-ConnectionGUID: nnuvuF3+SfKHIqNPJiqm7w==
X-CSE-MsgGUID: /7vDSqQtTMGkZBXwUb/aBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90675426"
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="90675426"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:41:00 -0700
X-CSE-ConnectionGUID: jq6A/C3XRq+cPmunVBI6Fw==
X-CSE-MsgGUID: obNdSfXtRNiFrhnCT0I2BQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,138,1787036400"; 
   d="scan'208";a="276594159"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 07:41:00 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:41:00 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Sat, 3 Oct 2026 07:41:00 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.35) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Sat, 3 Oct 2026 07:40:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rg5OHSaasl0hZWwd+hEk3eRHllPLAaVFET+a5DblZPtLRz0h3kEA23uVqrN+hAyCsVkhp6jiN/ZByzbaDjj54YifvP3yRshnXobvkXDTs154S44QkCk+n9TLAY+elsQ9YXje56eadASVUbaSmluF4jUHpyS7IJI/7rvZBekLyctKb4ff9fIPzB4R/qM7jkafEPCLrc4cZxrPZs9vfWknwOMX+55/7O9lckR3IOppHl4jWhpYcNvv41Jzlcc8RvUrRvdcXRxB5Ku9R8uQ73Saka+raZQZQ1rW7JWCq0LhXbj39Df3JTPinwo8ddwlLcYfuxOJmphs+4g/KUsBlntLkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v9DoLR2Pzj/db1oy8b/PWncWrYhNe8qmW2Ygg0LmbPw=;
 b=sYupgN6p4sR2IY4D9+hLESJgkK6OYy6ngXgMNPSvdytNA4f/wKKNQ2Ox4flK9kxz2JPHtTXwA6pyFDMAiU9PhqGATi6MPytD/2rWB0MjGc043K/aLzln5Ww+7QoM2o7+7boyHPEjANlgMPaAWfcxrUf+l/xOmv0VdopH6SW/s8A81LtokrvoG1DHjHPJb8inv17cfs1xHjyB0e4xsrBwpN/cHq5hVkNClMh9sR9ej3YRsJGSmVCyg349F1A+kNUGBSI0OtJFAvJeZvdYTlSCKc1U6WIXp2yvuuS2iJmJEMhpjJjdU+OUHYl1K/CWcGyfQA0vPA6gRRcfAPIn+k8oJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ1PR11MB6081.namprd11.prod.outlook.com (2603:10b6:a03:48c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Sat, 3 Oct
 2026 14:40:58 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0472.016; Sat, 3 Oct 2026
 14:40:58 +0000
Date: Sat, 3 Oct 2026 22:40:49 +0800
From: kernel test robot <lkp@intel.com>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>, Harshal Dev
	<harshal.dev@oss.qualcomm.com>
Subject: Warning: drivers/tee/qcomtee/call.c:205 function parameter 'oic' not
 described in 'qcomtee_params_to_args'
Message-ID: <asET8X1V7N8KbSIk@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TYWP286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::10) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ1PR11MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bd2ef6e-2fce-466c-aee8-08df215c5658
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|10067099003|56012099006|6133799003|5023799004|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: Xp4pOsy0zddhI5SiuqFAWY1bf8HvXUq4RBwfav6U0ABZEZuXPNc6cDxMtshg51f4D6nsrOyZHC+hsOWQYZAMo8mES/I9mTUjP+UWw/vpPM+CWhGo5uEn1UGRbyqBf1t0MWORD8WbpBfMPOauZJrkt9Lhi2AOQpNNrdtLDx+f7qFu0TbG42KK2O6vJp2L1prc6QEw/n2JpR4kTzhbzys61GrNU0N1ZqT65fzpnTEFNx3pRZrvPALCyfORYv7Wlomzm9Oeq5GaUOzEPSO/At6McVjr6bj6FpMtiz8Nx6Eo0+ClA6RtN7Guf6b33IFJTTmH3DcYdW4zzkO8o/Z0Fwv5vGzeFsHUeR54kdYBBgJKz8aBd8dLKEzmlxEew84d1YHqYDPzx2LFRSn2ruvw6iY0hRbC2o1fyHIbaJxmLkobo8ALCWwNP3XbPzgEjdZpbZ39+MqNHQjSZxKj39YP3ueC7dsMCuub7oN18eL+aeI6bkBAxXfZr8PETsUG9q0IveyjdGYyx0z6Uyrw8tEypBDheZy9E19sl48SlYebFp4+C080WZzSsxmpvbLrqrivMVUMtdeEss3gO+x97J8782V2A0V2NS6EU2CgvUNJ+kwBLo3UybiPyQDC12Jaayh6UAJn
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(10067099003)(56012099006)(6133799003)(5023799004)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oKcD11SBAM+3o+ElkLjvW1RqsbiBL2mkfF7PN/brh81Xqd3X7Exq1I2VTA2u?=
 =?us-ascii?Q?1tOskRIw0SGgHyKruEFaEq1nEp/GQWBGaYIdye892nxPsJHGRr6bO2OIpsCf?=
 =?us-ascii?Q?JAT85r12/zhaZFwcVUlMiAiHNQFm51RIB+MYiAnF388wPFcoOTN5qzHwRROx?=
 =?us-ascii?Q?AlleB9e7FcieY2po2ACk5mgqcbwUg2H2xjarjodMDLNTex5Vk4HLLixOlia+?=
 =?us-ascii?Q?ZibayA+VcG2kCxVO2X8rGcx6U1yo7qx040YRRqTY1j0Ty4CFtPhb7Ubip9vL?=
 =?us-ascii?Q?HUJzq8cPbz6DgPT/1qCR9HJlCuwpETyO+tt86E6eXFlXiOWspcU70FzTZhyz?=
 =?us-ascii?Q?G6A7mNVwiwrvAN6JDcMSvPFdkkJC4J1JqiXcHUhCFzD5WdaQIs78UtE+LkXD?=
 =?us-ascii?Q?Vbuchv/muDU4xsbWXMTxwRcOdeh7XwHDZNTikhSRZtjZ3fsWfi9r8itRgba6?=
 =?us-ascii?Q?CtLxvbHavC4h1lGb0ukb5IpgO55Jv20CghmU7OHR1E9Zmqn8+XvKuvyKAIuS?=
 =?us-ascii?Q?IFrmk+bl10iDfDxxKGXfcjOy4UQqoZDFvaA2rfroLwTgZGX7r0lwJ+FFMrcx?=
 =?us-ascii?Q?WROwCRiJ3nDDCteQ0+tZCKXEBOvSK3gVkMwvSIuMlfl5+6AgxF7TCFQYHVOW?=
 =?us-ascii?Q?Qzdl9NxBAS/LiOzCDCzkB7NJRA8KVmP3lrw+6ilkvPDKLR7gKNpOOo8IlIIU?=
 =?us-ascii?Q?IHgUv2say9Yh6A02xBhTd+YV+8wPdFfsH8utq31dp2yjGTtGSjL5QnIyeTNS?=
 =?us-ascii?Q?O7LmkKlUCIHa3Y+VImyhjqz5faNEOrpzk4g+CsrScAD6fnGG4x5tjUJriO10?=
 =?us-ascii?Q?lHZbcRJM6ITJbp7jCqcYwneythE8S1wouy2tqFVjTemUROL+wQ1mEmwJCKmY?=
 =?us-ascii?Q?IJgXIxvJ/y+NrUeGxR9K1ZKeJUWku7g9shsWLmou8yU3ZZCpeWUMuDxJYA9z?=
 =?us-ascii?Q?5OE9wghKdgpGcK+ROZjrkfoOs4SH7BJ0rANkXfrwWFbwtQMUdXkdD5v9rqpX?=
 =?us-ascii?Q?J5Am1OkpvSgSf6HnznrTRxVtoE4SGeuczO4smOG5kLkWZN6dyidNUEU35M63?=
 =?us-ascii?Q?IlgWRZXLdcpnsu1x7N//4TweH1+iggJrwA5Mw6hvzIbWqUrOLLls6+6ANqMM?=
 =?us-ascii?Q?EHjUYSNu8A9cY2930++j/wKyiyp3dj7HSZlS3BGUHNdtTfieHTzdnix2O/JZ?=
 =?us-ascii?Q?5Ao34+eo0KfG8Ct4mGpDcCwDhmp25l4bgIn9PQ/8TjJmivheoZmS6ks/ZcZd?=
 =?us-ascii?Q?SgPvqWuhtd6Mb0ZmOGk43CR6oS7eJaqHIX57F7OKfDodiZ4XWrVGaFXZ5QZy?=
 =?us-ascii?Q?057SiYy1I5hPypEIV1M9F7wNloCP5uyVisbpVUnhNtnYiQd6uim2uEr1482G?=
 =?us-ascii?Q?7gLhvO3FMlSC9sTFXLn73oau5FUwpj37wovI75sIW4hMFq4cwgWLuyJoTcFU?=
 =?us-ascii?Q?tZ4ncXMYVt45Ls0bCnO+AcljDnJ6a4On2nDFUNgFufRwNpN5n87FNj1MjTMA?=
 =?us-ascii?Q?C/AYgZg4WeCH5m15AE/J6b2qPBM7N3Fy/2wJvpM/GqkxRVXmaAYA0DBsnKlh?=
 =?us-ascii?Q?0nmNlQbojMajsN9aj3J58wnbdFApjnCIAaARbQVx64X/l6c9A68/RaQ41S9U?=
 =?us-ascii?Q?s2CtagciTizXOsGRcTQWcvi6Yooh1xUSya+X17lLMGLG7pp44l7yDp4rv6cx?=
 =?us-ascii?Q?5BEtV7LHFsQJN8yzupn7Jv/hxDEOZIaDvLguXHqkfEkB5Sr8CqR92wnyNfNB?=
 =?us-ascii?Q?QoB13G/Hmg=3D=3D?=
X-Exchange-RoutingPolicyChecked: aANX1fQJ0cOlGsPzfqzpfKhbugu5VQPs/rsbvnVYiRDC1MCEdVLYsCnLzJDc5S/U/FqsjuldpA+F+a2OjFKgIAoxUPSKasQVRrU4+LrSsEXCMbnu4xx3f4TZITF38+7wfugrAgAIgOccR2EN8CxXg1EFG/R89fnCn9cbMO0FOkM/rpxrYqt27oMEkhRiNF5/U1xBZRV5VaA/XbjU1USWSJrgdA07NaRyVhWsuk6GK300v9wyFUAXsBWBTn9mgcLU34MxcZVMgI3Tt/4Dj3KZLm8yLRLeVqxp1FgwJ/O80kqme86qn9ja3Ry4iA+VqKp0Ocl3GULey0a4ILgVh5P6lA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bd2ef6e-2fce-466c-aee8-08df215c5658
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2026 14:40:58.0039
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uc5v5jxrQYGCemshQQXF8OihTnGiGCD83R7uEpV3O85OD04uQNqVsu1chjjo2BjNxi0tJgGua3NcWKrrxPjdtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6081
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Harshal-Dev/tee-qcomtee-Track-the-object-invocation-context/20261001-163233
head:   b59502937f7cb9085e9c5daf5541dc8f0e1286dc
commit: 571ae3850d0efea9b1d925385c6b44d4cb639d8e tee: qcomtee: Allow object invokes from kernel clients
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021436.HDQInaZk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021436.HDQInaZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610021436.HDQInaZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tee/qcomtee/call.c:205 function parameter 'oic' not described in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:205 Excess function parameter 'ctx' description in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:279 function parameter 'oic' not described in 'qcomtee_params_from_args'
>> Warning: drivers/tee/qcomtee/call.c:279 Excess function parameter 'ctx' description in 'qcomtee_params_from_args'
   Warning: drivers/tee/qcomtee/call.c:408 function parameter 'origin' not described in 'qcomtee_object_invoke'
>> Warning: drivers/tee/qcomtee/call.c:205 function parameter 'oic' not described in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:205 Excess function parameter 'ctx' description in 'qcomtee_params_to_args'
>> Warning: drivers/tee/qcomtee/call.c:279 function parameter 'oic' not described in 'qcomtee_params_from_args'
>> Warning: drivers/tee/qcomtee/call.c:279 Excess function parameter 'ctx' description in 'qcomtee_params_from_args'
   Warning: drivers/tee/qcomtee/call.c:408 function parameter 'origin' not described in 'qcomtee_object_invoke'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

