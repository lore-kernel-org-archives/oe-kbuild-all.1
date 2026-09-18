Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB63F5187D3
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 16:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749529; cv=fail; b=aUAeB8tSrRr/lVsyH+LUxV9Lh1MUQIPN7u1RcV+4frwTt5BECi3eGpFVX5w2LNBrD8ZKCATb0TeJ+WGXPbOQIaKnUu7By6PJEDCMeu5c1NdqPZ27Gu4rVPiyTeF1nzbvfrYu+eXzsRtSng8lMQHTmaujfFn0KUmsVRODNArHQSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749529; c=relaxed/simple;
	bh=V98ou/tZwU90fl9InAHm9bGNzuyTK4BPha41IIeW/l0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Prh/PR7sxSlzqgcrDxS/ouXciLpIq9lBCTPIBmurcVj2+ODVnXm60d6GQNFOfHT8YBohJZnwXR11O+m71DwB/BwnPn5j+GiXwSLjU6iCxVkdC8KJ3Pfm2O7FSXf6zwjgrSqixRSrMZ5d5PUP+r1xeQqaodnvi/CZ/+hE8QU68YI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BE3P7Y37; arc=fail smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BE3P7Y37"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789749528; x=1821285528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V98ou/tZwU90fl9InAHm9bGNzuyTK4BPha41IIeW/l0=;
  b=BE3P7Y37w6zzX2pp5rxERy949Rf1/YgBYvz1/rh0uL3sRAnDmFqbTXV+
   o7f4BPdnarIqK5ZI7ZwwTftnpPvaQhFtEZ6SaPfCG2aeAVFq2QXISOfJw
   0liT9kdKMxT9yQXFeAmfYM1C6Hcqce7EVaIO5X1a3XLf4SUENpWfyd2p0
   kVrTfh/Mcb87kyBQNxnm5XuOWC0Bly1/WIInuT9eb8HPBJe+t2tUuI5YX
   GWFFeFTVTGGJZtsCQF8V/Sug+wZuUsPFliSFgHaz27RtkC4VVwT2D/Cok
   XtmigbDCWKfzfy7wEOfGE4oYNVC2y7GCC+/jkugB9WExE2gNqDKlAJiEE
   A==;
X-CSE-ConnectionGUID: YwJgMvyCS3WC5omLIm522w==
X-CSE-MsgGUID: 2H64gGL4QWWex47787qKKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="89404426"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="89404426"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:38:47 -0700
X-CSE-ConnectionGUID: ijeQlrRkRYCV/pWuI9vkIQ==
X-CSE-MsgGUID: mBJHtMbySB6pkmZ8zLhk/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="276450598"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 09:38:47 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:38:46 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 09:38:46 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.20) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 09:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LU1QdNQu2zgOETHJIgpRSxRxctocJBN/wEaR8UIr0rb3hM3/3HGDz49SmebY3+0wEGL3HHd0hiwpQBhahrom66botA9fqR+TnqjZD8bimguY7d6XagU+FTXtYhZEE1Z4ULuVl0QL9ylfpp6IZK/cFpV199sk3toPKprO2Oj7+bSNzoolyjKol11OuaJOkYqw5N47RsQdkBT+wPVqjL1IkfWpWik2TjORFn2xW/Qla7ZI0h7VqottJgvoDop9bLcSwcgPpUrsofW4X10AePYNcgWWZB8YJUCO77LdCF5snYyAhrlW2irnbDRP9lt6J7nOxLtCj7ihFjmiOseMxOoNvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CiVzWrS34By/DXqQvXgT56LfFUt2Cy89jAty6VrKjE=;
 b=n1oG9T8QIjtxnRawpW8Tg3Vkt8xG+JGFlVVscsclUg0+W2A7l/bDA8e6/wGqT9vCgCHzHb8VWXmh/1caDU847tYe1z2uu0zvlBMRpm5mBnTS1b4zXTyXd65jfPkw3BNHK/ztvtW2lbUfWT7ZNFv1pL/C1/dTAl998yjLsBzw0wq0p1DmE4j57wrEpy8m3riuRKGfqanKBoYIDF5p+/1jugpzPcIbxlUfZWyHLNdNN4Stf/o7bk4crAFEsYz1Bb1dzJEm3qz4VV62gRJTB9nSl7fikyRROfEPE2uPYIE9oc1b6pQQaIwbtw6rYWOuNu+uRUYG0gOtZ6SblabIGcjNsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SJ2PR11MB7647.namprd11.prod.outlook.com (2603:10b6:a03:4c3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 16:38:38 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 16:38:37 +0000
Date: Sat, 19 Sep 2026 00:38:31 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android14-kiwi-6.1 274/274] load_address.c:81:25:
 warning: incompatible implicit declaration of built-in function 'strstr'
Message-ID: <aq1pB5AdONkmkN+E@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: PH8PR02CA0018.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::8) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SJ2PR11MB7647:EE_
X-MS-Office365-Filtering-Correlation-Id: 10f43fa9-c90a-4ccd-f15f-08df15a34a0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: AbhtiPiRWxPpzpf6EwT/EAJo47foZSooojvmzJcOx0glzImbpqZnQDKvjqeB7jluZftstYF3SL+R+LDtiOZjt3b6TAf58S452RzpLJpincmlurdox6nU6zjolpM2o5h8Hd65EElmzWyIzxoASWNTbMxN9luGqq5mgTZMEGxmvaJ9lVw400omuHD42rfqLqWLyojkfhcKjIr1VOH2CsLpf3v2DoTVLVUTgFWlYfAcYPykxYamNTQ6cZdrzp6AZxApMMwrdVgcVv5nzS3g/3xQazOnNjf3Hp0b1rZjtNC1dDONJUdG1+0zodBdIV++YccHzcSPphgz+oYvFXXIMHTyUArlzQst/Gxfr7OmvmKs7JVixKhSh3LUaOkB+CQiLAjb+TsMwddcbX952BbzhbovKPcTALnUwhTwrSnCoj3Mt7D9MDru/tSwslROwSBCAsehyANTg7EnerVHSlDZDr+wUmSnMCP/7qQuLP4Il84TDt3pPmOyrzli7MzXAZKoyQsK2aZuRqX0kWhEqX3LkwzlAG3n6l3ZZPbjZxHpEQwYXGw8Fwo7tpkoTM0ge2vi1oHHO17RChamVS7QWoTJWZ7xhgPKvCylETCHfaHjEkb9TWIyP0nR24PnJ1gA/YfCZt2C
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?peGQnnQGp6QWi/95xwKuo/SQWQKxW1psQu/AEQ3b3wHw2WKXk/WfabI/G3jy?=
 =?us-ascii?Q?bNAgzXFrwuzYq0Bp7SzsTO6fqLhYsCOA1F5zgQGorAWkpeygXDu+592kVS5x?=
 =?us-ascii?Q?wja9LJ3a+GBajJPUHqZdJ9fb/MYIsSh4o1CD9Gb5hq5Gj+Ao/KprBNKHulwU?=
 =?us-ascii?Q?hrLP9V6eDZyu1H0CyGoUm8EAxWw+3YDKOezL0PFttmJkzPeR+W2JsVdCOHqH?=
 =?us-ascii?Q?KM/8HQ2ssXhRsUF3U0vLOAga4uIKwsyR3r1jopuYvCvPAQqVfTBsFIkXMR2M?=
 =?us-ascii?Q?DmSyvxow22ErK/ooH2Pmbi7etjFxmVgLofvIbr87PdS6XoiRVhL55zXODNDZ?=
 =?us-ascii?Q?Qg4Tecy5Jn20U/y1dT7MeCctoHa+rtN4yJGxgfT6CiCuaJWAxzwEreyyMgCq?=
 =?us-ascii?Q?NBQXSiGRMhcV+sXs0kMV2rxa9/Y5K8TLYUESRmhanYqTA74ZIDyVXxnRWpkE?=
 =?us-ascii?Q?L/Py8aRZyDYa+Xk+4qJbSj1IjK7ICO31S0Z64SG1e6xO9jRKYVm8V4IjwTIK?=
 =?us-ascii?Q?2TRp4msL/O5cZuBwelDL1B1C/AJndBvOa/EipYnPbOD+hU08Fp70TbUs2qff?=
 =?us-ascii?Q?dwe31BVePQEYd5HP+pU6TTLV335Zbsf7jUcM/FwEys5lKwGG+oVm5yWlcN83?=
 =?us-ascii?Q?K20bwvdP6F033lJKgQ9JI3OSeti32luj9IQ6avBsgpnljNY2qVfWOnuYj/mX?=
 =?us-ascii?Q?c5fk9wkbT/qdbDhyWey/WBsZz+UHJlKG5xulB1AJQCBimC3I+vx2ZqSCTzsX?=
 =?us-ascii?Q?Fjr47Pyjuj9z6vED1AOjxGBtID502DETgke5QPozGVSMS2Ccl5Qv2YPmjSBn?=
 =?us-ascii?Q?PWi5pc6Fq89Ayvp8coA7qNK5dSMZvwec6nisjUE6hcL58EWNt3ZW3aov0xX1?=
 =?us-ascii?Q?UMEia+C+cMXplLBkd7GVImkGuT1d4SPTtHzwmyRIW95j+SvXBRAym1PQ/5+J?=
 =?us-ascii?Q?VBacMO+aTVcHicpZQc8D/SfCJ2CIp9XXzGmrjQpg2dQxYKvZ/0OhG5JRhMFC?=
 =?us-ascii?Q?1naeimPum6EINZifQ8lsZVWZv2dzE/lSn4904ML2o9KAmMlJNRk4xv0outtP?=
 =?us-ascii?Q?G46MxcOylgVCnPl+rni1MQjTSxGHWem7uw1j/W1jmZ+iltSSVgmkqSo5Vgdp?=
 =?us-ascii?Q?oisyPQorUeSmj5oteO7gdd04dSe8q/rTUCAUCwrMIJ8HB9dfwggRCSouViIe?=
 =?us-ascii?Q?lt6+xHEyZXkud7Wkde6stDueX0Svz6nx+3oUhNYX6dedH9SR59xtaVLJjL+c?=
 =?us-ascii?Q?vtH0LKO/bGe3XmtBexDR7g0eADgsZOFngFBxx4NBv3ARDWurD4vB/lPVbi0w?=
 =?us-ascii?Q?4dDhoRHTKA1vdt7qCDeRZ8oeE4+6tLW/VSCjCithRl0gKVRSmazyCqbk9q3+?=
 =?us-ascii?Q?WYP5aTHY7Dh6XDhtU0yweYSW8SKUL1eFyliHtve4bg3JNL3nLCnm1X0jGoTa?=
 =?us-ascii?Q?/rEWQ1UoVkkBLAVVvUhWbye77ZgY5BJKDE1k1BgViIbLgXUUHoieiSiDZK4t?=
 =?us-ascii?Q?HCiX1LejXYl8WpQ5HDI3Q5xSXXcDCS9fc6To9WHZwKo9VRWulFh0kM19jB36?=
 =?us-ascii?Q?OfNUkN+Wb/D8cPaUy4qivVpxvpGcMEAKlDXhqesD3n/x6VUvF8zFfstMQwW1?=
 =?us-ascii?Q?36tw3Kr1i1EuPpkrNmdaLWP7beNooUWcH9Oo5FrEmZ+MI8lf53h43kD1XHQb?=
 =?us-ascii?Q?D4x8bjs+OdaYBifhLPK7Ri7J9urIcOtWqsg5YMlVVAy2vdxH09FIlQibWYj9?=
 =?us-ascii?Q?kUIBVlpTBQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: Wys/+dW3W2ii1i+HtK9GbKFCGHMAVeay6eTGLrHnqDXiveEp5l4SAyJ8Cm4unihSFUu5FIxfMeOOHevlxsL2DpigSU/CzTu4SdyoZNzYi876vALiWTxVPXFY0sAwDqSb9cyVZ/0X9QZjJlhOTXLZChltaygwNmEa1nwAab1S5ekKUMzDVpieoDvhVzmIjf3nik5cSONP78lozRJIKBPhlGKKYEcqt4OwE4iY0UW06tAKGnk2FFPXCIhgpeuFqB7dGYtOkMNNdwqIdGRzOYyaQC8Me+H/IIZeScQGDXTmDKw5DhdSivL6DPolobkjMO2x73Pjujznka09qIyT/pkwyQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 10f43fa9-c90a-4ccd-f15f-08df15a34a0c
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 16:38:37.8006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DnhZDm+58Y8SN1rw1TuvWk3SjUw49jpaVcYmry9Pu6ojvPMVrEHSHj4SLXufjQydCtKWSgP2UyEgETylf6PraQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7647
X-OriginatorOrg: intel.com

Hi Kees,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   9fced71ef28951d69d24623acfa1f8db4d22c798
commit: add3a49ae91a1f6390b3fbf14a7ec9c6231bfbd6 [274/274] selftests/exec: Build both static and non-static load_address tests
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 4 months ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260918/202609181621.4NlqCGqN-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609181621.4NlqCGqN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609181621.4NlqCGqN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   load_address.c: In function 'main':
   load_address.c:65:69: error: implicit declaration of function 'strerror'; did you mean 'perror'? [-Wimplicit-function-declaration]
      65 |                 ksft_exit_fail_msg("FAILED: /proc/self/maps: %s\n", strerror(errno));
         |                                                                     ^~~~~~~~
         |                                                                     perror
   load_address.c:81:25: error: implicit declaration of function 'strstr' [-Wimplicit-function-declaration]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:10:1: note: include '<string.h>' or provide a declaration of 'strstr'
       9 | #include "../kselftest.h"
     +++ |+#include <string.h>
      10 | 
>> load_address.c:81:25: warning: incompatible implicit declaration of built-in function 'strstr' [-Wbuiltin-declaration-mismatch]
      81 |         interp_needed = strstr(argv[0], ".static.") == NULL;
         |                         ^~~~~~
   load_address.c:81:25: note: include '<string.h>' or provide a declaration of 'strstr'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

