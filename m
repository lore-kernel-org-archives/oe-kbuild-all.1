Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19E329B8D0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778512144; cv=fail; b=Du6z3LWLk7PaXK+zuJz0oldQUWf//TaOTejDX3v8tbIyMskdntdvt6xtTdZDfaSELFJJ2EZcbVIUr7VnTpZf5g7ibkD4hHi3m/JOxQU4f46cnKK6RScbk4nAoTLh78jR3HG0bBcqwsGOT4SNg6AJ1drZa/Ns9PNS4w82bJ2r584=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778512144; c=relaxed/simple;
	bh=nDohOsINVe+C/l5Fr3BfwAyHNXMkHlzlUmY8JMeKTmk=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CBmmxzB2A8sHJueIwC9hvydEUNm7lyy6+wOMzMCVKg233YRqqBqaSWOwv0khy2gTtKibjoAm3ZtcDCYkR+YTjh3ZEuGBX3ceKB+Ci4OSMnVycDLSGFxnsuivJJh+BFEgT/050aTZDnxlrsOBY1wgizx87fGbC0ssamtuiasJwAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahiIIMKG; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahiIIMKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778512143; x=1810048143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nDohOsINVe+C/l5Fr3BfwAyHNXMkHlzlUmY8JMeKTmk=;
  b=ahiIIMKGkhMXWABcg3xXrmdsRu/HkWqXHWKM9dLMqsktDP78sexU/JH+
   YT18A4bDNRWv/tC9UGeL5DpyojgLEd4qY0GexKoa8x8aDu2zoSNycAozw
   IumnQb8kOg8fIhSKEDXPDRFl/Ag8Tg5qeXCxJ5x9xQOXuCVzal2oVR80L
   MtWQXiVkwLhDZyZIAxJMsxGD/eSxBa+xpENtldAUc6G9+Spf/dnoF3gFb
   iFmJMu4Sf+7+gImLEC6StNC5bwVKqHl2VYoZam+DQl60PddNiZH2tr5Lf
   dRHygIDkER8vuuDSVNO90o0V+kspRqcQv+ltOtJnbI5+Bbc4Kzk2kNZN5
   w==;
X-CSE-ConnectionGUID: 9g7ujVYJSAqWPLMz2xwZag==
X-CSE-MsgGUID: oagGyGOQRO6601aTpGjZyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="79298074"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="79298074"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:09:03 -0700
X-CSE-ConnectionGUID: ehXNU6hJRzOXZwOl3Wh5pw==
X-CSE-MsgGUID: 8+uPBs3TRMqZgjDTIHfNnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="239293104"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 08:09:02 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 08:09:01 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 11 May 2026 08:09:01 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.68) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 11 May 2026 08:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d66EE+9+4zsvAywUjkK/Hs0H3z3+rmELmV841kddh7xESndy4WhTVt5IpowSW9YmJawc5A64OlcC661Hj0cpoBrSHNSDaJ/uihdO2QR4/Hzpuo6KEJa1P4/iMG7J1XUcZ8LDNoA4VZ7AFvVU+lpv4MhcYLt1M1JhgSshOPJHZwS0MCaet+K+/tWybmjTA7B2wBq5LqU4r2dzAsCdyXROrIhIeYsSZ9d9HCniRrmcnkosBlHGL6Wnhj2YkOpO2WYkG/K/PcWfZpSCaH25n1Hq8UzwrAOhJJc8UgljIrEQcFIYQi+kedj+C7NH1YTJqBQZLs5xZ035VL79d9kNo/80Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljChdEZorp+AhW+n33Rwjf8xEWJwu8OdLdSVGmP60nk=;
 b=P8KLS2BLb1R7XmLEfTFZ1J92WTAZGwRWK2eohj72JND5B6vFWz0D/Gijpo+NpC/bLB6Kd9LlABMFPl0S0eFtQAbMR5VCtgySqEIAyh0sGfyfJuNogs+T7QaaSLvM73jBO2GiI0RzDmTwYZhOddDhNW7T22ImUyoJRzVhlRv3dpacx1AeV4iHpYawT9bOoIuF2akZhGNP7kRd64nqWS/aWUBEVi+bPmRLGdHTrXz3vBxL6x8Uvp5coyt5tUxy9+j5VgmAFvmFvWJg+C5eV4reqN+X7+ZSBV/XF0CxDFxWvCdvLrbDFlZvyjRdeXhQw75FRitb7CPeJXnFDfZMfDzjXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by IA3PR11MB9061.namprd11.prod.outlook.com (2603:10b6:208:57c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.22; Mon, 11 May
 2026 15:08:56 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 15:08:56 +0000
Date: Mon, 11 May 2026 23:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghong Song <yonghong.song@linux.dev>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: kernel/bpf/verifier.c:4093:32: warning: variable 'cur' set but not
 used
Message-ID: <agHw/97aPOw2+EXT@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KU2P306CA0076.MYSP306.PROD.OUTLOOK.COM
 (2603:1096:d10:3a::6) To CH0PR11MB5428.namprd11.prod.outlook.com
 (2603:10b6:610:d3::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|IA3PR11MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: 7237db3d-0e7f-40f3-2d7b-08deaf6f38b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|3023799003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info: hePTG1w+tIjuHMAGI/kNp7G1sJnaJBEeY6DDMpHHeg0jIf97/iHIxaWUtNM4hS6raYsMe5Z8BKGU0T+FP1vU8HaFi8Gic9zLJhm966KuKoZvgDvpx1E/DcnQ11BoUP5CH8eYa/MGjvRVqIQyyNExMLXZAC7MrEqTNh9bW+f5YnR/o0yYvBdYevrE0pnEqz/UVXCPLujJGZGEmDLKEOT1Ov0mjQ4sWPvIe2DLUNs6tzHAoJdMZxjgVvBfhvuVIOV/ai9Uyu4iK5c7Wo04v8FCKEMGHh43Najj1/7TCZLuHlRqWCuHnFD3Uo8WHCgRMi03BipBue4Sr8p/U6qKpjQIjhW+MLRdbOwbLL67JwO8gyU4/nE/s/1jc9pcASkavWjazquvyrjt0CduJoTqhrWEeCUpo1EJ4kiaFeVemvXPw2viRgSJDJHQz7mD6VYs1UZiDU7iksIsQWpOtz5cJF1y0ZaLGtCK7k4u9hr8aAL76tadSniAU8fwOJJi3FiYCxaaxh4UFVEJBXJDMeCY+ws6nDoW+beirYz6eMk/X9CTp8EMGWbdz1v8SO4On4hQorumfbB1m6TMi6cRHEtE1+kf9TfT+m/e8K133DG5ihUYzY+Qw7eR2WBO2d92QR8eyak+1QCbhf5M1jV7xlvOsqp3QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(3023799003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7fE4GJOVA9J5dZKgWSR6PFtiwwygHn+5q3EuI+inaDRSokkhD7CJEpliR5b5?=
 =?us-ascii?Q?Ay0bBQeQwwwAj3w/3GUNqrpCJa0Ek7iM+A8GRREyizClDY/u0H9cFkVdQix1?=
 =?us-ascii?Q?03Ie/ORaqchR2lm3ieIzDSbZVUMC9Oz9Vohr0rJvOVLK8P/8SrCBJc2f1l30?=
 =?us-ascii?Q?HH+Usbwb2Cu86e2roBcBEdbi2Mn4O42HUllOjP1aYc9RTPVYaX2YpC96tJ5m?=
 =?us-ascii?Q?UdKIRXSKYDh5idXNFRoad/qSRJNC7jnhkoJtDvBhcyqcz0PqmNVEjqcX4dyq?=
 =?us-ascii?Q?jw6vwSt2v3+J7AV7tL51YmzexnYTkSJ61vEbkiGDqcSRiXtsDaQ6qugQYQaP?=
 =?us-ascii?Q?CJchQZS4qkUysuIDY6t69iOcuAvXY0eCbCPdEaXiRfAPb5fMdT5Irkd7p4Ad?=
 =?us-ascii?Q?chT8jV2XFask0C3RZAsAIhvab1MLPAlonLKtpzpK5LuQFwD90d5ygGm6eS8O?=
 =?us-ascii?Q?iZN3onI+B7ikYJWEE/0bSe0xgpJ5ME+8y4Jn79KE1DaH5kyl4bv5XrlUhoGH?=
 =?us-ascii?Q?n2g5I2qux92KkmwwpS5vQ+pVZ3zadLU9Koj37/nQkFgaWTrrMaAhIBZS2dkP?=
 =?us-ascii?Q?rLgZDqJzuk5l3agAZGLrfZOIAhyJ0DW63eEw/9+PSmU/CYyTvIMwBh6WjzMw?=
 =?us-ascii?Q?S89Yi9y6Nie9m6h3FzAFvvmB3gtvOjZodIAG3Umr1ML3j47se7fl2kVDEtvj?=
 =?us-ascii?Q?c/Eq8FdsuqTY9Tl4tIFPsnulE7h2TZKA36sUXiKXna6g3x+rCr7HY9xwEJWY?=
 =?us-ascii?Q?q6nxPA4u6DVGv34yz5KMOuy8BtdVURqZ0keEU7A1aKW6LixuX2cLESnni6Cm?=
 =?us-ascii?Q?Lth5TkMP0LvOJQ+wkj0h5ge+rM3Gpzk7OCMukjGU6Ygl5WOzCGzTW6Z/3lpD?=
 =?us-ascii?Q?ydF6g4qYZ+3OYA11iG8kyAOU+LHyiV5wG+KmFBzygS07h2RIUjGaZhve0djA?=
 =?us-ascii?Q?b1u3xk28I7rfYYpuP8dTg3b5wofnBhBbjkTHBErlVoXPq2r+Ca68qFdH15U3?=
 =?us-ascii?Q?5mjHBM9am+pX7j7kOvJngvaCLaYXN5Ozvhwl7Fa7W7PEK2IuIYAxJkwaDAcf?=
 =?us-ascii?Q?Vdg+6wspnXtLlqp16h3T47VV81DasEr4kJ+IsMjTjn4NYbKlCU0z6INZIJ5j?=
 =?us-ascii?Q?oVMzoSGypmCpd5AdeU+/JERN8yMEEAu2aDGEIfBx/jrsNkzA+4nnfnfrXIZK?=
 =?us-ascii?Q?YwjtqWlBLspTdL5n4rK06B6GUqLZPf82/DxpJda1jInTpHY7x4QcDy68rMZX?=
 =?us-ascii?Q?XtGQMkgTRku7CppPJa5qAsPDh95xMlEeMcOe46t93hNDqFFk9Y/cc8hMilZd?=
 =?us-ascii?Q?YHzTTukLcGzIOkkc/7c1q4wEiFQTfrMmiini7oiHgMbpDy8c4A3I0pIWSU2B?=
 =?us-ascii?Q?8wdZXpsmIjkH9E2JkuSwPJI8anN30v1AAz1h4K1GfZqjp6kx7HM/iNlLshDF?=
 =?us-ascii?Q?gOroqXJJBWS9KmTiqK9CvhDVZPoT7rOwLFrVaYy3DMN0MKLCa6UpXOj3jiA6?=
 =?us-ascii?Q?6ykmkSKX0m8YbDIsA6PM4vZnnkfWUkcs4H7vxBDsii/rD0J/Uyuc0nF8qPb2?=
 =?us-ascii?Q?qOVA8j2wB0whXr2qEoVMjQoKe8w7dncwb9F3P3akjtMadc0ZVpnwk6XsucP8?=
 =?us-ascii?Q?1OZ2TdsY2xzphRJC8sPQ5DxGVQMdbnNYVQMM4g6y7mHuU/ok4cR0Pxw6XVDu?=
 =?us-ascii?Q?oHgaXAhNhqFUvaE1tm1fegvreHX/vjI5dz6aC3xtzLaAI4rcL/ZvtobcltXf?=
 =?us-ascii?Q?TUKIrW9c8A=3D=3D?=
X-Exchange-RoutingPolicyChecked: DwnhTYHGvBtjA8mxk3R2jyApPSUVR24OiDNztGlSZgzgKfGroTxPkWRQOLRz1R9Gr8dHUZFwWMSU6cG7Spm9PSjO3ieq8rwDOaDILk8PWwgComNBXIVT9iaKElQFt52Ko7C8+SAlYm2R5O1K3iYJTXTnVmlJqEEK69YBGjGgxpJ0C/j9peA/ZaiqZfyw1fSanRY8DsKqF4bU+8+13VG57OKUahb1EVDOCEGXkoBuqj7n6K2JoY3j0lgx1Yp+YsJfRRN9Urb2gymwaPXcvi1FNBPLzXUfe78A+sAL4nvFrt7J9bXq4nznvims7nQvqQ1c1kymXpDb4uCqx3HU06Ogpw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7237db3d-0e7f-40f3-2d7b-08deaf6f38b9
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5428.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 15:08:56.6816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: didyliCTtnAh0oEZBmkA5SfMlzWltt6N3UVaC6hAczC0dRWdk1cPcYlxoV9aBKxE5BVYg+836ShexTTEMVcohQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9061
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Yonghong-Song/bpf-Convert-bpf_get_spilled_reg-macro-to-static-inline-function/20260511-112428
head:   089e6bd1b56ba97a33e4029819cb8294af6f5ea5
commit: f378c36d9e685e6223e02b81b0462e69734ed4d7 bpf: Support stack arguments for bpf functions
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260511/202605111202.qmh6zPoP-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260511/202605111202.qmh6zPoP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605111202.qmh6zPoP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/verifier.c: In function 'check_stack_arg_write':
>> kernel/bpf/verifier.c:4093:32: warning: variable 'cur' set but not used [-Wunused-but-set-variable]
    4093 |         struct bpf_func_state *cur;
         |                                ^~~


vim +/cur +4093 kernel/bpf/verifier.c

e4298d25830a86 Daniel Borkmann 2019-01-03  4082  
f378c36d9e685e Yonghong Song   2026-05-07  4083  /*
f378c36d9e685e Yonghong Song   2026-05-07  4084   * Write a value to the outgoing stack arg area.
f378c36d9e685e Yonghong Song   2026-05-07  4085   * off is a negative offset from r11 (e.g. -8 for arg6, -16 for arg7).
f378c36d9e685e Yonghong Song   2026-05-07  4086   */
f378c36d9e685e Yonghong Song   2026-05-07  4087  static int check_stack_arg_write(struct bpf_verifier_env *env, struct bpf_func_state *state,
f378c36d9e685e Yonghong Song   2026-05-07  4088  				 int off, struct bpf_reg_state *value_reg)
f378c36d9e685e Yonghong Song   2026-05-07  4089  {
f378c36d9e685e Yonghong Song   2026-05-07  4090  	int max_stack_arg_regs = MAX_BPF_FUNC_ARGS - MAX_BPF_FUNC_REG_ARGS;
f378c36d9e685e Yonghong Song   2026-05-07  4091  	struct bpf_subprog_info *subprog = &env->subprog_info[state->subprogno];
f378c36d9e685e Yonghong Song   2026-05-07  4092  	int spi = -off / BPF_REG_SIZE - 1;
f378c36d9e685e Yonghong Song   2026-05-07 @4093  	struct bpf_func_state *cur;
f378c36d9e685e Yonghong Song   2026-05-07  4094  	struct bpf_reg_state *arg;
f378c36d9e685e Yonghong Song   2026-05-07  4095  	int err;
f378c36d9e685e Yonghong Song   2026-05-07  4096  
f378c36d9e685e Yonghong Song   2026-05-07  4097  	if (spi >= max_stack_arg_regs) {
f378c36d9e685e Yonghong Song   2026-05-07  4098  		verbose(env, "stack arg write offset %d exceeds max %d stack args\n",
f378c36d9e685e Yonghong Song   2026-05-07  4099  			off, max_stack_arg_regs);
f378c36d9e685e Yonghong Song   2026-05-07  4100  		return -EINVAL;
f378c36d9e685e Yonghong Song   2026-05-07  4101  	}
f378c36d9e685e Yonghong Song   2026-05-07  4102  
f378c36d9e685e Yonghong Song   2026-05-07  4103  	err = grow_stack_arg_slots(env, state, spi + 1);
f378c36d9e685e Yonghong Song   2026-05-07  4104  	if (err)
f378c36d9e685e Yonghong Song   2026-05-07  4105  		return err;
f378c36d9e685e Yonghong Song   2026-05-07  4106  
f378c36d9e685e Yonghong Song   2026-05-07  4107  	/* Track the max outgoing stack arg slot count. */
f378c36d9e685e Yonghong Song   2026-05-07  4108  	if (spi + 1 > subprog->max_out_stack_arg_cnt)
f378c36d9e685e Yonghong Song   2026-05-07  4109  		subprog->max_out_stack_arg_cnt = spi + 1;
f378c36d9e685e Yonghong Song   2026-05-07  4110  
f378c36d9e685e Yonghong Song   2026-05-07  4111  	cur = env->cur_state->frame[env->cur_state->curframe];
f378c36d9e685e Yonghong Song   2026-05-07  4112  	if (value_reg) {
f378c36d9e685e Yonghong Song   2026-05-07  4113  		state->stack_arg_regs[spi] = *value_reg;
f378c36d9e685e Yonghong Song   2026-05-07  4114  	} else {
f378c36d9e685e Yonghong Song   2026-05-07  4115  		/* BPF_ST: store immediate, treat as scalar */
f378c36d9e685e Yonghong Song   2026-05-07  4116  		arg = &state->stack_arg_regs[spi];
f378c36d9e685e Yonghong Song   2026-05-07  4117  		arg->type = SCALAR_VALUE;
f378c36d9e685e Yonghong Song   2026-05-07  4118  		__mark_reg_known(arg, env->prog->insnsi[env->insn_idx].imm);
f378c36d9e685e Yonghong Song   2026-05-07  4119  	}
f378c36d9e685e Yonghong Song   2026-05-07  4120  	state->no_stack_arg_load = true;
f378c36d9e685e Yonghong Song   2026-05-07  4121  	return 0;
f378c36d9e685e Yonghong Song   2026-05-07  4122  }
f378c36d9e685e Yonghong Song   2026-05-07  4123  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

