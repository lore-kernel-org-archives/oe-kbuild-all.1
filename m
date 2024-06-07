Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E94C76
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 01:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717724811; cv=fail; b=cIhQCyrnGcpDnBZfuGaSwPY/Z/5W3WjkgszlDQnZDaEvAzD7IokIDB5gmMPxZggksfEmt26cbI5L47SzQpRlLnE78EWUFVeT6zl18+W8FdXsM7sjZiXmpGpUK8ASc07U4fBlqGfh1DDngLeTXM8pddizFrDPR7E51e4j/nXznE8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717724811; c=relaxed/simple;
	bh=2pABCEEGLsfTdEJABmHm80268wK0eC2u598KhpbnmbQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=oFuNbc13d8oMHsb9VtBECuXkJ5GNEvlZAZP8TAkAdCBhHpwB2xlm8Rlts1IPEJ5XlwB0DHQBvznWoUBFjBzOSuP3StjpeBFvLuryatAhiUKAdIB9WlagGR5akzBVRgYD8a4q8+sGJSbs+pi2W0wYkq2LQfXkQB2C7Dt/xqcsrj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gN/OBNsx; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gN/OBNsx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717724809; x=1749260809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pABCEEGLsfTdEJABmHm80268wK0eC2u598KhpbnmbQ=;
  b=gN/OBNsxlrkB5huEN73d+YEOYpH/x2qD+XykQ/QeeGiHjLod1CF/axwj
   eDPYLXOVQokuF0O9MjL/q6YNhruO5bGJwTl2VbnWiHvVDp1MMA3k7xh48
   7hJfzD8r2roCu0LeFIlKY7PFUnBDwztxF+qgftdrCKCs+oWQRWaTshEXg
   BxlCk9B7az6mRlEPXdPn+ca1G5aQuGUcKJH61QYZNxx1LbTEFWHT/ovBc
   MIkVfNGOMRHgv3cUGeGvEC53mLuzBwTe+SLyScOx/ztYeVhY6ZViwO4Va
   CrYnUwu2TiVl6NvduiwliYkbGneLwbx8AdUGzTIvpD4bLZM4/9t+sLt/O
   A==;
X-CSE-ConnectionGUID: kf1aUjCgQrCWLaTv6WxnMg==
X-CSE-MsgGUID: HfcJAkA7T3uIUtvaY07mdA==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14547238"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="14547238"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 18:46:48 -0700
X-CSE-ConnectionGUID: cOPQzJ9AQXOlrB+DMokshg==
X-CSE-MsgGUID: NIjL32L8T9C6tuog1jdX3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="38004115"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 06 Jun 2024 18:46:48 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 18:46:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 18:46:47 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 18:46:47 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 18:46:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdcPd9xxfT1hH178K8G33raeDaaolYAbtGGu3qhKHp6ZDWNeE+HwzTejUeA/KcIKDoJk2r0GR0IQG7bRPJclzYqi3pQ3tYTX5vIJcTTvgWBfkeSo6mPGVRRowBKhG8I57goi63Aq6lQSWUyjPR/Im93iO9GwqJxQ+5OgX1BeqQvCQm9PmU6kcGvL0kA4XhqT8QLJ9VBuGNrELQM8jHqhzDz3eiLc3EegTImy/Dc75+fr4ahVZxEr4klP2s6oKlmCwl17Rnwzr4514N71c70ZBZf7bpbdNOYmMheNhDcHYBsO7AXqgADzjdxzLfGgF8EOEhyDXU8jcz8Y8Fd+N1aGAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UEjQ/SrsmPnbokpTL3+idvekNKZro7ItlrSbnPLJE6M=;
 b=JEh9T/2U4EVT7iql22d7uAFgV9A75hcTY5YSHkNR6KlWDY3DYwkR7y506EOTbv0im33QrssC81LT8egnVzwjVcHWM403FunaidJ39SYSOvqzwAb9MBW3xAj4BDE8MtAp8KQJOlbGws4ZRkU5WMQOTmiQUGo/rsyFnhwbA5+oOl959m93zwHSVXXMM8aYK8bb13fJ/Nwo17WBPoakXGSrOwQAoTnMU2GlcdXMt+Y4yfQW90CjM4el8Pasgnyb5ZQ+RWKKpD678+dlSFKoRVyU1m50Coh28gasMjkC12P/Db2QwBXUI+qyKNcJCK5IhI0xe9uEiiaUgVN12k1HRw/qKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
 by PH7PR11MB7662.namprd11.prod.outlook.com (2603:10b6:510:27d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 7 Jun
 2024 01:46:44 +0000
Received: from SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690]) by SN6PR11MB3230.namprd11.prod.outlook.com
 ([fe80::c2dd:7cf8:6008:b690%5]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 01:46:44 +0000
Date: Fri, 7 Jun 2024 09:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: Han Gao <gaohan@iscas.ac.cn>
CC: <oe-kbuild-all@lists.linux.dev>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
Subject: [esmil:th1520 35/35]
 arch/riscv/boot/dts/thead/th1520.dtsi:197.18-204.5: Warning
 (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property
Message-ID: <ZmJmfQKFOISg1GJz@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0174.apcprd04.prod.outlook.com (2603:1096:4::36)
 To SN6PR11MB3230.namprd11.prod.outlook.com (2603:10b6:805:b8::29)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3230:EE_|PH7PR11MB7662:EE_
X-MS-Office365-Filtering-Correlation-Id: 75768af6-0985-4cff-bc95-08dc8693af74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ezuffxUde+l51JoQZKSqoBeVheplKDIshsXZ+DwK3o4GHdkRSF5nnxVvCfPy?=
 =?us-ascii?Q?4XVl/wP5SGVGHGbSOL1YwVsUOqR4TMYsa0boZ7H1vhlVAHHWBtgZ9GCSHlPV?=
 =?us-ascii?Q?oYuN0u3/5vGQu6dcQxJ+1fPiXuZpwFACpCXJfMUiuTaHZGPnwVL1Cc4f+sE6?=
 =?us-ascii?Q?tCY4ywQVU/ffFtq6A4muAvbXiknK0uMSzxudjtEgeFtbEGzjD/86Km46ManT?=
 =?us-ascii?Q?G5/t8kZpLcfQdjCCyERjKk1Sw7LAEL8TkCSHo9pXU1PRPCHZEunofzrz3khf?=
 =?us-ascii?Q?ydROiR0elC2O+Em0kNg3iX/oyvUuZBCxbyiLOSSrVRjUcM8jnluPiGSZ3rhF?=
 =?us-ascii?Q?cv1AnXq64Q97+1oZbo94Ki/01Te6S1YXZp4M55PmY7pk49SV8/X46v6ZY1Eg?=
 =?us-ascii?Q?hIKlO55NnN7rnInGI0cybuBEUTAkid4+r7yI8UZAJV7k0Dx0qsrq/67vqLbF?=
 =?us-ascii?Q?vz7BPEWHuxbLyJEYOVG+m+HqjLkKXKMNzrz8JtSqkdawl6TKQ5DcYor5XA5E?=
 =?us-ascii?Q?KFcpvwnq+Y7wFL4yrKyNgkZ/hPmQKLtp7QHboSwNv8j4PO4ggfQxT9VmbFE+?=
 =?us-ascii?Q?Kt6htFuauBVyPXOwYldOO9heLz49f+WXvrPptlxaFyiKeF7wwcIuDuian8ca?=
 =?us-ascii?Q?0DH4ywN2i9I8ckd3KZlZiaQNmjYMONwL3CQsJuZZlhPHxmNRqa/Pn2y5fOdP?=
 =?us-ascii?Q?uXdOfhJcK4itYxDcNiPcDN19FybzYrkV/X2itC5a+Gpr5g+NeJd2vRvJWj/2?=
 =?us-ascii?Q?SuStovfvSjssjzi7jgi9ZDZjHQUJa7kUzYfMG235CpOtOcxeqpV+zExbVIvj?=
 =?us-ascii?Q?cIsgDNQU4Dqo50/pupVArKWsatXKG6Bh/M+ugHkp0sw/uYyzbvCxjd5QEYx1?=
 =?us-ascii?Q?sKmVQQERmG5QyrA2PWzlbGpLpl4+tPop5lxhOxC1E/WlTvRYe6KpBNaweIBd?=
 =?us-ascii?Q?WXQZY2nyDmyXqpYvjirXvIeuDsTnBvvj0aL43efP2yMsroh8abnrm2RqqaCO?=
 =?us-ascii?Q?w2piRQc6Uho3TLgPkXVnI9DOkPxK4O9kMPKhE5sbzdbVYd5KlrPJjuPA5sg1?=
 =?us-ascii?Q?QePPrwtYL1k/k0vH4GWeem4lSBtoRW6I0H0jOF/9aW2FyrIHR7Xgz3/+PNXs?=
 =?us-ascii?Q?US9+r47JZkGFK4XZRHw8T8cWFGVubXekEmf3sarDuCY5HAfHMuamw7v/DUBc?=
 =?us-ascii?Q?zTEnFJHFqbzCt2edA+r+jSEKp/ezIDHLGBqoB/LSM0CAKw5/JNSmZ7lTU2Xo?=
 =?us-ascii?Q?b9fJ2QEQOnXggzQmz0a3wj4XYpp3EH2z/SKQREDybw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3230.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b4eBtK0FMZLH++ap5gBrQABOvuGnQQoys+0cTNZ59quMqSQneum7uPBbIlXw?=
 =?us-ascii?Q?LgnRM6cYNoMFZ08M9Ha9m0X+1PGg31CSRtAClyWu8GCqzxg47TmQjwuzKE+A?=
 =?us-ascii?Q?11nJKz5kze9VqsahE1YH24YrsWYHFcNLCcOgoHLpYIRt899jEw54MFpAyg87?=
 =?us-ascii?Q?xvC8S+f8tRmfZ5EOhxTh4eIxDOsk5l3v/Mw+WkEFevYwXQZFve7ErFWZSJLK?=
 =?us-ascii?Q?2/CWdiiFX4aWkmFdVrjSBFmYpyS1FWt7EGTt7bicfVV36aNPafpDpkdIPduI?=
 =?us-ascii?Q?DL/fK7PLZi+7Q4/utcIXlrywK/R0R+WPStRoBE9XQwf6wsg6dDng2r25DYuR?=
 =?us-ascii?Q?LfVKx9sMfIstc0oDGch29jI9Vlq591L4lw1L2Jais6lnf9o3G1V+Qafg18Gg?=
 =?us-ascii?Q?uxmslBL92PNfM7rK6nHUTavvxeFd8FY55v4Diw180wrQ+0dTf/YQg1LIojro?=
 =?us-ascii?Q?OMcdagryPVE5qZmQxaskIPgL5lyKGxwfv0Dd439DmSN73a32piFOJKPaTZZ5?=
 =?us-ascii?Q?36/zjBxIf5gJZ5CC3CzEIEsbT9XzutS6KlRzOIW9Dg4cByXdd/VonhqG7CDC?=
 =?us-ascii?Q?K2mJw14Qb9dXxXNPAagk8+RaDrbfj3k/GLCfb6A44RvMtf5ubD7KXNs23FbP?=
 =?us-ascii?Q?uG7yLTDrveC/ZRAr3q7yPeKQPRhvvP7ooMoOrlvNKZfhkacLfZ2cQIsrybrN?=
 =?us-ascii?Q?wOmrB+E/aQqWfj+apeYB0Dc4MDcTNlIF/dbVIuqFBpgEmRwd2itS1tudgvzU?=
 =?us-ascii?Q?btB8ZZIlPGKez4p1Jt46OWVW44WeJ9lrq3C6zyW+N4iI8FUO2sEOl1tL4sYq?=
 =?us-ascii?Q?h2nVIX405H7J5egGKQQnWjvrVuiajIvmKCp0ybc6pA0WvccZAgzEbWSWTnWY?=
 =?us-ascii?Q?spKkPnK40o/+CswyAVi6LV2KL7g0pS4fT0zMmkKkniiBbbkSvgKsHfboyNyR?=
 =?us-ascii?Q?t8gLdoF4G1g/VMgvv/IqMBvor4XFuQxjXuUmDrWE5awyk/3g5406Ps0BnmZb?=
 =?us-ascii?Q?ya0wuUduXM5wJMvITjtJTzX3qU7H8ZfsODrN57em+3My5lcN1g5tf4jK+Lpr?=
 =?us-ascii?Q?AMZlrEHeNWCJIBbl0pIb1zpgmiDY6T3WaIcliDAQxcwvL3F+LZIJWD3iUIPS?=
 =?us-ascii?Q?VuiZxx77u9ChLXauMJA55RrAZYYAozJGRdoeDIk3JAI4yePyWWBrGMtHBftk?=
 =?us-ascii?Q?pQ2fs8GfOEvcFrvaZ0LItlxM11zU3HnGqTb6uzRYMhFPy/xENyhu1RuAzC2E?=
 =?us-ascii?Q?qNmNaVOQv8t9TJhGunPZusGbTtC1WMBACxq4qbeMmShqMpZhyT7Vtr06n0T8?=
 =?us-ascii?Q?Fq2awJgekSaZWRZhnKfa49qctyVAH5FMy99m/FZFh/n4hGVfnWWIshV4HDZt?=
 =?us-ascii?Q?CF2+GoruWpb+o5LOWRof+j1N9OQwDgarJPDDkOBDEf+a+wwqJjzMW2PMgvOz?=
 =?us-ascii?Q?qlcnJRt5Ukj2H7dsSkIz/NYQ6yesSeTsG+KFVGDTl2+imYg6ftslRsm5iMiR?=
 =?us-ascii?Q?FpOOTThoj/vnQNMCPGnooWKzRR0jJXq40M8go7fW4Zf3jpsfxJpPQ1SlQOaI?=
 =?us-ascii?Q?JyOs8NkHDzad7IHhtSSD4G0KOmsRLFfIYxTgCtNn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75768af6-0985-4cff-bc95-08dc8693af74
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3230.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 01:46:44.6296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEb+vnFwtphvWRq0DpRD6hAj+7AAxXRXHslvCzWEmc3I7/7SK79E+Lhdml1DQ9UMjtZGJZvkdM5CAes6rLUs0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7662
X-OriginatorOrg: intel.com

tree:   https://github.com/esmil/linux th1520
head:   d384daffa9d042ac6e45388cdedb7b15b48cd567
commit: d384daffa9d042ac6e45388cdedb7b15b48cd567 [35/35] [NOT-FOR-UPSTREAM] riscv: dts: thead: Add TH1520 CPU reset node
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240606/202406062315.3z4bjqAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202406062315.3z4bjqAq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/thead/th1520.dtsi:197.18-204.5: Warning (simple_bus_reg): /soc/cpurst: missing or empty reg/ranges property

vim +197 arch/riscv/boot/dts/thead/th1520.dtsi

8e396880a864b8 Jisheng Zhang        2023-06-18    8  
8e396880a864b8 Jisheng Zhang        2023-06-18    9  / {
8e396880a864b8 Jisheng Zhang        2023-06-18   10  	compatible = "thead,th1520";
8e396880a864b8 Jisheng Zhang        2023-06-18   11  	#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   12  	#size-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   13  
8e396880a864b8 Jisheng Zhang        2023-06-18   14  	cpus: cpus {
8e396880a864b8 Jisheng Zhang        2023-06-18   15  		#address-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   16  		#size-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   17  		timebase-frequency = <3000000>;
8e396880a864b8 Jisheng Zhang        2023-06-18   18  
8e396880a864b8 Jisheng Zhang        2023-06-18   19  		c910_0: cpu@0 {
8e396880a864b8 Jisheng Zhang        2023-06-18   20  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   21  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   22  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   23  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   24  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   25  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   26  			reg = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18   27  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   28  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   29  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   30  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   31  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   32  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   33  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   34  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   35  
8e396880a864b8 Jisheng Zhang        2023-06-18   36  			cpu0_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   37  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   38  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   39  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   40  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   41  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   42  
8e396880a864b8 Jisheng Zhang        2023-06-18   43  		c910_1: cpu@1 {
8e396880a864b8 Jisheng Zhang        2023-06-18   44  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   45  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   46  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   47  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   48  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   49  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   50  			reg = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   51  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   52  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   53  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   54  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   55  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   56  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   57  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   58  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   59  
8e396880a864b8 Jisheng Zhang        2023-06-18   60  			cpu1_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   61  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   62  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   63  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   64  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   65  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   66  
8e396880a864b8 Jisheng Zhang        2023-06-18   67  		c910_2: cpu@2 {
8e396880a864b8 Jisheng Zhang        2023-06-18   68  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   69  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   70  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   71  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   72  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   73  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   74  			reg = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18   75  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   76  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   77  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   78  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18   79  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18   80  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18   81  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18   82  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18   83  
8e396880a864b8 Jisheng Zhang        2023-06-18   84  			cpu2_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18   85  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18   86  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18   87  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18   88  			};
8e396880a864b8 Jisheng Zhang        2023-06-18   89  		};
8e396880a864b8 Jisheng Zhang        2023-06-18   90  
8e396880a864b8 Jisheng Zhang        2023-06-18   91  		c910_3: cpu@3 {
8e396880a864b8 Jisheng Zhang        2023-06-18   92  			compatible = "thead,c910", "riscv";
8e396880a864b8 Jisheng Zhang        2023-06-18   93  			device_type = "cpu";
8e396880a864b8 Jisheng Zhang        2023-06-18   94  			riscv,isa = "rv64imafdc";
0804f3bec9e9a3 Conor Dooley         2023-10-22   95  			riscv,isa-base = "rv64i";
0804f3bec9e9a3 Conor Dooley         2023-10-22   96  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zicntr", "zicsr",
0804f3bec9e9a3 Conor Dooley         2023-10-22   97  					       "zifencei", "zihpm";
8e396880a864b8 Jisheng Zhang        2023-06-18   98  			reg = <3>;
8e396880a864b8 Jisheng Zhang        2023-06-18   99  			i-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  100  			i-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  101  			i-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  102  			d-cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  103  			d-cache-size = <65536>;
8e396880a864b8 Jisheng Zhang        2023-06-18  104  			d-cache-sets = <512>;
8e396880a864b8 Jisheng Zhang        2023-06-18  105  			next-level-cache = <&l2_cache>;
8e396880a864b8 Jisheng Zhang        2023-06-18  106  			mmu-type = "riscv,sv39";
8e396880a864b8 Jisheng Zhang        2023-06-18  107  
8e396880a864b8 Jisheng Zhang        2023-06-18  108  			cpu3_intc: interrupt-controller {
8e396880a864b8 Jisheng Zhang        2023-06-18  109  				compatible = "riscv,cpu-intc";
8e396880a864b8 Jisheng Zhang        2023-06-18  110  				interrupt-controller;
8e396880a864b8 Jisheng Zhang        2023-06-18  111  				#interrupt-cells = <1>;
8e396880a864b8 Jisheng Zhang        2023-06-18  112  			};
8e396880a864b8 Jisheng Zhang        2023-06-18  113  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  114  
8e396880a864b8 Jisheng Zhang        2023-06-18  115  		l2_cache: l2-cache {
8e396880a864b8 Jisheng Zhang        2023-06-18  116  			compatible = "cache";
8e396880a864b8 Jisheng Zhang        2023-06-18  117  			cache-block-size = <64>;
8e396880a864b8 Jisheng Zhang        2023-06-18  118  			cache-level = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  119  			cache-size = <1048576>;
8e396880a864b8 Jisheng Zhang        2023-06-18  120  			cache-sets = <1024>;
8e396880a864b8 Jisheng Zhang        2023-06-18  121  			cache-unified;
8e396880a864b8 Jisheng Zhang        2023-06-18  122  		};
8e396880a864b8 Jisheng Zhang        2023-06-18  123  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  124  
8e396880a864b8 Jisheng Zhang        2023-06-18  125  	osc: oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  126  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  127  		clock-output-names = "osc_24m";
8e396880a864b8 Jisheng Zhang        2023-06-18  128  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  129  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  130  
8e396880a864b8 Jisheng Zhang        2023-06-18  131  	osc_32k: 32k-oscillator {
8e396880a864b8 Jisheng Zhang        2023-06-18  132  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  133  		clock-output-names = "osc_32k";
8e396880a864b8 Jisheng Zhang        2023-06-18  134  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  135  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  136  
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  137  	aonsys_clk: clock-73728000 {
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  138  		compatible = "fixed-clock";
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  139  		clock-frequency = <73728000>;
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  140  		clock-output-names = "aonsys_clk";
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  141  		#clock-cells = <0>;
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  142  	};
5f78c4c45380f9 Emil Renner Berthing 2023-12-04  143  
8e396880a864b8 Jisheng Zhang        2023-06-18  144  	apb_clk: apb-clk-clock {
8e396880a864b8 Jisheng Zhang        2023-06-18  145  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  146  		clock-output-names = "apb_clk";
8e396880a864b8 Jisheng Zhang        2023-06-18  147  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  148  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  149  
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  150  	gmac_axi_clk: gmac-axi-clock {
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  151  		compatible = "fixed-clock";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  152  		clock-frequency = <100000000>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  153  		clock-output-names = "gmac_axi_clk";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  154  		#clock-cells = <0>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  155  	};
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  156  
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  157  	gmac_clk: gmac-clock {
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  158  		compatible = "fixed-clock";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  159  		clock-frequency = <500000000>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  160  		clock-output-names = "gmac_clk";
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  161  		#clock-cells = <0>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  162  	};
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  163  
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  164  	i2c_ic_clk: clock-50000000 {
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  165  		compatible = "fixed-clock";
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  166  		clock-frequency = <50000000>;
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  167  		#clock-cells = <0>;
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  168  	};
ce9a935ce82ecc Thomas Bonnefille    2024-05-17  169  
8e396880a864b8 Jisheng Zhang        2023-06-18  170  	uart_sclk: uart-sclk-clock {
8e396880a864b8 Jisheng Zhang        2023-06-18  171  		compatible = "fixed-clock";
8e396880a864b8 Jisheng Zhang        2023-06-18  172  		clock-output-names = "uart_sclk";
8e396880a864b8 Jisheng Zhang        2023-06-18  173  		#clock-cells = <0>;
8e396880a864b8 Jisheng Zhang        2023-06-18  174  	};
8e396880a864b8 Jisheng Zhang        2023-06-18  175  
a77f02e8489673 Drew Fustini         2023-12-06  176  	sdhci_clk: sdhci-clock {
a77f02e8489673 Drew Fustini         2023-12-06  177  		compatible = "fixed-clock";
a77f02e8489673 Drew Fustini         2023-12-06  178  		clock-frequency = <198000000>;
a77f02e8489673 Drew Fustini         2023-12-06  179  		clock-output-names = "sdhci_clk";
a77f02e8489673 Drew Fustini         2023-12-06  180  		#clock-cells = <0>;
a77f02e8489673 Drew Fustini         2023-12-06  181  	};
a77f02e8489673 Drew Fustini         2023-12-06  182  
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  183  	stmmac_axi_config: stmmac-axi-config {
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  184  		snps,wr_osr_lmt = <15>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  185  		snps,rd_osr_lmt = <15>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  186  		snps,blen = <0 0 64 32 0 0 0>;
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  187  	};
109a8d2cfc1895 Emil Renner Berthing 2023-12-06  188  
8e396880a864b8 Jisheng Zhang        2023-06-18  189  	soc {
8e396880a864b8 Jisheng Zhang        2023-06-18  190  		compatible = "simple-bus";
8e396880a864b8 Jisheng Zhang        2023-06-18  191  		interrupt-parent = <&plic>;
8e396880a864b8 Jisheng Zhang        2023-06-18  192  		#address-cells = <2>;
8e396880a864b8 Jisheng Zhang        2023-06-18  193  		#size-cells = <2>;
759426c758c705 Jisheng Zhang        2023-09-12  194  		dma-noncoherent;
8e396880a864b8 Jisheng Zhang        2023-06-18  195  		ranges;
8e396880a864b8 Jisheng Zhang        2023-06-18  196  
d384daffa9d042 Han Gao              2023-09-21 @197  		cpurst: cpurst {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

