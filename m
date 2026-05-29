Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A9D347BC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 May 2026 05:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034209; cv=fail; b=XY1v4baxanL65EH7IwC+xFseTYDcYWpowTh9Qr4ARAOJPr8yG7ADfSMrCRNWLY0c6rNtyul94/TcqM0YQNNwxMUDF6FPqy2JGeUB1WRFSWncT3kRjsCO2obIVurOh7jdKjt8xUEqmFx/XhmLKcLhNclV9VDsIamQjIgLTTPrAxQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034209; c=relaxed/simple;
	bh=63NRreYtrpLm4LrZVTIR5l9hbC3mOzu45urlyZsWlnI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Mscq+C2sWZIO6w7wL3WcTA78WbMPzswpwZqZekQlW7it/EouUJJHfkKa5DlqoEZiDCRAiU7bs9AG7mvEYbYsbgfPnII+bbMFaBGTG6usJODm+tb2tvLbxmNauQLuhLSwveYdkHvEHd9sKp9+H1ui4KTQLaqHZwrrtUCg9TK0mIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a62y3Akr; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a62y3Akr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780034208; x=1811570208;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=63NRreYtrpLm4LrZVTIR5l9hbC3mOzu45urlyZsWlnI=;
  b=a62y3AkrYkuN23qiSfiBnwgRFfPhiiZsKXCAZGGQAyZP0vUYe/6oRZ6s
   jNiEOlsaAawfhk/9o9ZxMLpUKfk5FRY5gaO0hP79WBLGnxWo11onO1OaM
   E8KDgdwT9CiHX4yMW4SWA03U5+qJITfAUx2RsJU78dY0cdhYg0mPcaG41
   GU5aRFQPIMQ3BO74PuGI/606Y+rTNYxlsNv+aflEb6/cdLcVyDKiHlZ+N
   ZPBFL4nleFg2cyy5gyyGPP4m12pER7PLTBqiZ+PUchMbKB7Kvvw3swDIm
   bL0TeI6pLeelI5n4ymj/UHb4lMgEmLbAk6uoxAiLaN+SFObun8UY935wO
   A==;
X-CSE-ConnectionGUID: kOBbOQ3+RPClgomKNSnGvg==
X-CSE-MsgGUID: AEejSmUPT1+1AsjMrPVm/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80735939"
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="80735939"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 22:56:47 -0700
X-CSE-ConnectionGUID: 5g7a5kdaTVuSQPKX+UDJSw==
X-CSE-MsgGUID: 4itqc+l+RQ6RHMTzGw1feA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,174,1774335600"; 
   d="scan'208";a="247850761"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2026 22:56:47 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 22:56:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 22:56:46 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.19) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 22:56:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKu6QouLq4Djv+XxwjvmVWdo+JbAg6ZDxvJhmPluOBUXVXw/HltEgWeNNUQLS+HomSU8gOxzj8zLSSYoU3aKrbONRmmpqgXXP0G5htGBW36Vy/pdw11I26UpTXFxriDkLqy7pKxiNi+ZXtaHMfsaXsh1pep346nilzvEmsfFSGUjUckkUFSXB/FsBu2EUBjZp3k8rPj8KuDQSImi6ikMZOd2g7ziSjLXTxnpL1MyWxlz7kEysDy91lfxUh4tLG4kKx6iUca6qxe+/8DQlUxqiq4tyncXM1GnPkUGCu3DpBTO7TwqLhLvIrYCor9xZcuQFRDOk9FmVZymbq74kr09eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ugm+CzqMKuumHpD0BC14hr2Zw2vOWsCk+E9nXxsEkg=;
 b=vGI644aEL7mvB3v/A/qDQCALeMq0/ii/5G2/vNL2oYvKha6EMuDBFYi7xDW+bvnIR/VPgcaQhMVh4dm7288ZSqPXwjKWI+sf2AKd4YUjXBS2BNreiZhZTvHigHNtmsKNz4I+Nz90bLkuyX/LzmECSW0oLQp8MRTMbM0tbF/Ft+a7nktDibvsGRwHfwDFY7O8bOQZD4b4n1jx8Ly/7Jjpp41pvDpso7CUck8Oc2+whSIuRrtv6Gp2grqUVhsP8GmHOd2Di1XPxaPII9kAa1n3QTzqAfUJD6c0XaC9QeG/eFiM6fucsHEZRkxCtC2Tq1mWhOvFiIZ0wyYOK8jYFApKNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by MW4PR11MB7164.namprd11.prod.outlook.com (2603:10b6:303:212::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Fri, 29 May
 2026 05:56:43 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 05:56:43 +0000
Date: Fri, 29 May 2026 13:56:35 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [dwmw2:ffclock 10/10] aarch64-linux-gnu-ld: Unexpected GOT/PLT
 entries detected!
Message-ID: <ahkqk/h203Ac9Bi5@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TPYP295CA0034.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:7::14) To BYAPR11MB3493.namprd11.prod.outlook.com
 (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|MW4PR11MB7164:EE_
X-MS-Office365-Filtering-Correlation-Id: 01e2671a-63e8-4e21-bcb7-08debd470f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: WG4SQJ1dlaYGUK0/GiUjbMqA5gL/pB5vppsMvLkAkioTYHtTvi+aXYeLgmY/br4K1ZZ8qjB1nhPM1CDTBazRaod8h+6RRj1IMDakaB3aU0xyDyw8tWEGipXlmdh7g67yKVeVjEGwh1/rhmD8JedOUlaW8JlcN9QE5YHmZGTnAExawOO+6QgxzzLEmacyOZ4iIXB+Y7sfFbcGCAAv83UCNvbUoG7g9Yep5WT6RpTyvmXBmplr74YkTJkCmhnUYF6L0jktOL0UtueP2FxNG1nbwK/i+d83UZdaMjh9Jv+RI0CHqEjokJ4iTDEI3cQ+v1T42vLDIll9ToddTSuBrc2ki2uEzgcSrXx9IZGWmluL3aRbJtYjHnybtEYo/fLBvR8RG9E1AF3a5KyT5EpICBv0i+gj4udWtVKw4KTxbf4reSA13axDrQUNAQIKsw9JXeMsNFSLkfRG7e0k4KZp5faA4EEc2ze/G2ZU9jlrTAhsRFX4M0USITPLhqSZAnkiLZ7rgbCXIpX9DMdC4qBw2yXuhiheUkb5UInQeoW8xxwLH0p/ihR6hBVu6sc3DKL+r8IbCA4jC+Lvwzz5bi7nnezAQ6SvZUpmeIxFjbi3120+3c/SD/yyh8im6Z0OPiIOclnbOs3ZvhEJB0b/rG63PBErIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Oo02HOyX59WhI+Cl7iLpXTbXlXhpiT8wb7wG+L46WR32m2Kqf1+rAZxiVu59?=
 =?us-ascii?Q?KCjub0wcMiT3LtB4rWj5rDtREXcIngYzNEBQ5tz6e4ocgBrKRUvHdOE55W6f?=
 =?us-ascii?Q?Q3vaJ8JuY+0BqYM+6HltvEauZ7scMkp5PDoLc4HfWYK1VAlkRd+jl51SvOy9?=
 =?us-ascii?Q?5wb2suRKREis/a77v5O44Vy/LIiP5t1YWBOOhWutbv4qMi1o58ibpTbhp4aC?=
 =?us-ascii?Q?CZUFsUBVDAPT1FshXNrpGUuEf9N6xpLRSjc12s+bNjHMWH8iala3PqbPbJtQ?=
 =?us-ascii?Q?hp1j1LogsyUib8Gg0VrSNNpmCeuc3MGazxvDD40nTWiNkqIP7r3W5jvgIxrc?=
 =?us-ascii?Q?tQ3sMy/y5d9+FQYuhjmYXiHoVehzn02LLBstF1iKa6rv6t5aMVWWWLrupYwH?=
 =?us-ascii?Q?MBgoi2A4yRTpLBqFi7e2Y11rUhpAXNvMYFfGHg03agul7+oQVdJmV87Vxb38?=
 =?us-ascii?Q?4KBEOzyO2tjtH8OKRd4R73sukZ9PQ+C67uuYg9+NDCgT+3rqLDBZO6kQvGY5?=
 =?us-ascii?Q?kUhn4gwSQzfigoDxMpiuj44DtKFV8kqAwT2vK59y4AL8tC8rfhX2EPV3JKfy?=
 =?us-ascii?Q?O12nLVQSA6rMLgSx+VHAx5IF4IxvFlcaU0TbqJ0gjezMKH6oJY3x0J4UQiSP?=
 =?us-ascii?Q?clJ2n3KxHUuSf7jH78u0J7TdlTqS4g5KfrGBAfOyaCVJhjOfIdAMuad73GJH?=
 =?us-ascii?Q?fQeDrDMn9fKnkpFmb5mVKDZV5JFLoE+OLpT+5nUtqZgKq/kmnSICkftWO6Sk?=
 =?us-ascii?Q?7aUKD2mSYa7Vx4+7IqT3tcDqB9ljeAUCPpiU1X4d28CdyUxjRCNLh3ys59D/?=
 =?us-ascii?Q?KKkaxs8eIs/oKDvYE8TY8ArXP7Pht2mViXHtZ4IAYIxhuPKMJOd4Fwdc1O/j?=
 =?us-ascii?Q?Q02gshRg8E/gJEw/oTDkxYsu5kUlx9XJWF2oh9d0ULwd8Z+3VDRudAsK71AB?=
 =?us-ascii?Q?1Bc0pIpUadQ5nJAhBXM3LRUZyCJsrOdgq8FgdhPjjZiPFK/ZccJwmkgmSyhi?=
 =?us-ascii?Q?IsHxxTsQxt9a5oHwsNR8i6jHBbsVDASYBVMUKNrX1JmU9Wm8X4RtmiPm3+Yy?=
 =?us-ascii?Q?JJFjGN7PW3I3RmuVAV2pQP7FYLK1UhP+ND2wsKJDJOkaX9wNpaq9Z2MJ8DUA?=
 =?us-ascii?Q?/hpuJc5CID3ZaIvImzPTxU2SLyltANOKeGYO/89BB1JvQxiypVXnUnzK/u5x?=
 =?us-ascii?Q?XNRCFw4LWh0hTd6s+5lIwq6Rzmgi4A0cilLg18yL3py5HWbEpSEFXVTbxuTG?=
 =?us-ascii?Q?wAG0VhlcEQ/gWCi1ZRGhdMc0Z+aegLvYxp8QxBI+I6k3y/V3dXDIzrCTQjp2?=
 =?us-ascii?Q?IVg7b/BLdGI/rkRc3twXk5SSGGsCTYXwJMTFQ7k0xcsg5oIhek+4lUJa+e9f?=
 =?us-ascii?Q?DhN8EzmS57BYSU/Rb7TEIjLe+fDYrbuyRIWCtFGz+Nhb8FIEkRsNd/V0phbP?=
 =?us-ascii?Q?yd7ldBN4vgLRBUyPvN0/1fH55BFNpbEq+g0ogiZOZvqogjbpgmzrgFPsWZir?=
 =?us-ascii?Q?QaGHuWbISAfZodL6pH03U/JfJ4dlGe3dOLLb/X55fpYOU0UUDX3Az2QnfcO4?=
 =?us-ascii?Q?EN97+jglUYdiaFUONGB3lu0lpUVwJaAy+NKK46yIldkxtB9OwxlMwGEXqqID?=
 =?us-ascii?Q?gETckjiKaN0S0WIQb9GZ50M0tCRjR6Olnppq0zzJ3J9XTVUb6e/8K/Y3wDTZ?=
 =?us-ascii?Q?SWOyFKwDaRNKskh34Xt5KBW5zn9MJWgzj4UBsNcVpf20+yrO/iCKlj7TVnKa?=
 =?us-ascii?Q?n1bWr23YgA=3D=3D?=
X-Exchange-RoutingPolicyChecked: BOgL4Cph+oKgoYJ8hwzizrGtp3mNXvTBtTOasD3Ybu7aKv/zW7CmNHEbuEcyac/b8+rQW7I4XcQRuwwQtfFpgXPAFBOjHBBDgZ/humM4FoE866J384uCTY1yT5n3KztiOuGurHS+uUJqP4NccU1vRlKxfLDRoieSsHMohhYf9K4jUz3JnZIfTsRWxzNGfKnwoEmwnB/UPO91Hmy9UYnWyqtQMSqvnyFtCe9PvIM1Zq/nmRUjsS1OtjJqV0IyZ7ByID2EHvm/nm61ffZH+rQOUZXrwZfJWVL7ded43tkeJI+/B6kkMivjzDrxyIq/AIwELxaBJDPfalB4JmffVPH2nA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e2671a-63e8-4e21-bcb7-08debd470f34
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 05:56:43.1931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: foDkx9AQP96a3pDvAhngiszK8e+kJ/2C+PAEP9AsyIUeoZAIWvvLfwFYu2to9U4g0OAnbbHDPxB7nCftPdTmTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7164
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/dwmw2/linux ffclock
head:   0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b
commit: 0b56bf62998ffb14cc4fb5ab4781f6b3e5f60f0b [10/10] kernel/time: Add /dev/vmclock_host miscdev
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260528/202605281743.Pqcf2Ld3-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260528/202605281743.Pqcf2Ld3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605281743.Pqcf2Ld3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gnu-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-gnu-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-gnu-ld: kernel/time/timekeeping.o: in function `timekeeping_adjust':
   kernel/time/timekeeping.c:2563:(.text+0xa24): undefined reference to `ntp_get_status'
   aarch64-linux-gnu-ld: kernel/time/timekeeping.c:2564:(.text+0xa2c): undefined reference to `ntp_get_time_state'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

