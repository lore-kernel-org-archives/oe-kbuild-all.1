Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECD83D75CF
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 12:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790511979; cv=fail; b=eeHSLWSetlTEicPb+8jy7Of4DkdJ5KxO+rYsM8WDdM9HOfQDitM0CWy7yO7SUTfqxlhcexHUdoDbVi9bY/M/xBzz/NxntSa5MxIwPWxu8cLje+5+Zs1HlrNkxAH9rZF7+pjvk8vnBha4SQ+KS/VfrPNVQ0SxGg2BcSkBYGZpUNE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790511979; c=relaxed/simple;
	bh=jViOSYQTRiz03kKVgNX30Pf2a30IM3h2VQIsIKCoP3U=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=FgV6hpL5D2SOTTcXToP9x5O1ndNhTM5VN+66vr/097t9aM1EcOJhqNGXpf8Zwd5C3Oh1XUcjjClDdxFDP+KO1CvJ2ysnbjXo+XEQ7WBtmNhGNNIvj4udlW0zW3xiPqSGfnsQ2R1d74Pd8OKne3/P8ju40bQcNfWqZYDe5TVm5Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jM+VBf1F; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jM+VBf1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790511977; x=1822047977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jViOSYQTRiz03kKVgNX30Pf2a30IM3h2VQIsIKCoP3U=;
  b=jM+VBf1FhLvjuNzAuhBVTV3Cajd59b0iOFjzo8u97kNnyheScoxajES2
   GrCJEW8d8FLHwJxmywoz3yrTFxmQnYWMwRJFagmwMdd4S/BaYeUUwxXSO
   t0LAdTm2vBBfPS2gk/s1ZplHKS9Hgiu/SK79mNc6MDSpcjhQP9p/cv7GM
   acLZghOjvyddBugoiRlTmz+EXIaJwZK+iuH1DThhukiiDrtRINs+M2G+d
   HaHNbGKg0w7nqOe9UazhkXqqiMI1+JAOgwRM/fcjwbNKYUmvzf5IcG8DF
   vW0zQ9aZexQBOqovLLMiGQ0loO7f/Bw/UlGY0ilgcmSs6slgB1MR4nt0n
   w==;
X-CSE-ConnectionGUID: 6DF14YWUQ5uK/0+kd81XXw==
X-CSE-MsgGUID: LJE+3LnDRL+8ffuPvLBJZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="90272419"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="90272419"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 05:26:16 -0700
X-CSE-ConnectionGUID: LhIGtDFySbu4VJZ6hNevLA==
X-CSE-MsgGUID: UqKGi6c6Th+fccI6y3xJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="273412136"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 05:26:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 05:26:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Sun, 27 Sep 2026 05:26:15 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.0) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Sun, 27 Sep 2026 05:26:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jo9KaHf0ecGzJ4scVrK1OLv5ooYYtohWY0sX5leRVUt7jB2g+VAtO8aQOFFmAI/YKPK+m5KSsaEqrtetDv8oWFJcCtmBT5D+vXQKnRYY/fklOZ8nyHAk9/bb2PxoK8xTOq+SC8/puFnRvP9eyZNkFKOaTSruMXbR4REQmLrTPqVsA0rfmgOAg8tRLqL67QBDxCZdrbgJl0Z2pCPZmOazzDOahVOQO53MAxShRmJdp1q0G5cn1eunQeR9XbO6+g83giD/jPeeKc8F/SXSi5kq22alKcDk6I+/3VesO2o/IzruOjHh5HtLOrrSwoIpv6/sp7Te9RhNe8gYCPSx8uMd8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dxrN2Sk/DUGrrRyw/SHR0u7KAvu17NHJZyh7EVYeJKA=;
 b=k68eKhsfc+mkJbbmqQUWkK1fJITWR/XR85R/WKmD89mjQFUgXQAOWXf1b/YxnnyU/L+olUk1242rygidu/GKDV8PG5ulpzKtlwZwYXwRF7eiiApsz8mjoaJ4/oc3M+nMTivPUWW6v9e6SAqkTfs+eG71TGxlEV9AXqtRXHUrROywRFjC0jCMAihbJ5969oixCEMAWoWto0S4HYsTuOTYVry/DdJVXDsq1gHcYPJpoDnnqRbiKVw8zqrmRA+T02U69rT6vyMh6Xyl7D4sih6gKHxqUHbgMldx823HqkayxwFDFeNHHXKmFJGnzHt9aGTpzTxhICg7FmV7CdU8PD7sAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by IA1PR11MB6291.namprd11.prod.outlook.com (2603:10b6:208:3e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Sun, 27 Sep
 2026 12:26:12 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0451.022; Sun, 27 Sep 2026
 12:26:12 +0000
Date: Sun, 27 Sep 2026 20:26:04 +0800
From: kernel test robot <lkp@intel.com>
To: <cros-kernel-buildreports@googlegroups.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [android-common:android12-kiwi-5.10 284/284] userfaultfd.c:146:33:
 warning: format '%d' expects a matching 'int' argument
Message-ID: <arkLXGs4pio4pE0a@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TY4PR01CA0053.jpnprd01.prod.outlook.com
 (2603:1096:405:372::6) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|IA1PR11MB6291:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba997c9-a25d-4440-1deb-08df1c92840c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|56012099006|11063799006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: a8EPbKjwh68NbWmwNV/tsyw3BsP74dFzzAPwc+/abMD8n0MPzaTswLVnthkYmlerOwKvj75WdMmfjS/9xlKhRAlYgaEzWNwQ4UP4dFgwZNwqsXa6A1LvDb3dbrz2Q1uyCTA/neFV4lwC+Mv/NJmkiVIikNzwPUC/0Qqmy9mbjREJIj+NbBA1tAcSjUk+1MDQ0ZnAOz1jcKzw5LwFg6n8Na6GK3oJ2nVQ7DUQiTTcd50aMd0zd0MAYlk/3tedc2FBEEG0DsqWTRcFOwKMVigkXKbUNxDrm3x8+cJrvK8UatsN9W3fZDhVV0N+QobF4F2ryrkRhim0nl+t3srQ93lw6lEAkwX0VJ7vT2jtjrFJgdRYuTrxRLtZ5HIdZfiUhp0h3+EbJZ/OI9hHvuCjN5EXQcLhBrjtcDT4gmTY0iqaH8qH5geM6eImfurUuHjHlbomPW7LWWWag3MJ9LNEDxAaNZ46tit+68yQ2yZT1Ot3WSGsmFKjkLSqKdUDfsywndTHw866yEeE1SB9sicSLOE4O9XBcC46Gx+TZKbDmFhmY3lHotDj19Wr58UtVnH59UxIw1Xy1sN4FltJeo7P85j4mT99FVDxbq/6au+gPR3RLTepOhGWjDvD4ERKmkdDEoO7
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4REif3eD+EFxsOZBsHOBvygnja7z2p6cL5ksio9zNA/IDLc6X8PoNNZPI2l0?=
 =?us-ascii?Q?d7qqbk4blXMfcXyI4HFTKggIra6QBazExU3Aks15j7GMVOYHzBGCorx7KoQl?=
 =?us-ascii?Q?63Xjx6gEtWsTXlGwr+GU5sN+//ixfaT05/wk7MoDI4KnID+lvNRCCAPlhBPI?=
 =?us-ascii?Q?EcF3xpz9xdTczTnmTNblC7SazIcKOaRkZdNZy1AJX1ldgiG3PSg/+15ph106?=
 =?us-ascii?Q?a3TSnZGmzI3sq2MADT9S4QpeNAZByn4MeMoDLyVAui5S/SwbVESxddW6812T?=
 =?us-ascii?Q?sECSG4OQA3LU76Vwix+G78vndWZqviQH15TVZzD3R8l4ATrZMDLPddF1RGJI?=
 =?us-ascii?Q?cj7Xy7Se2OupThNlC6hj8fjN21e5wW3SROgUTUP2hIAHaR7nByn9I21/5BpH?=
 =?us-ascii?Q?H4bc2tYXN21fNRrBnZxU8O7YVNnSWkrJGSGWfzX8pGOrReCaxRg1+rNlD5Rm?=
 =?us-ascii?Q?ELQumYFM20St46KvkSaNyp2Nd2sc2XgXF83s1SFHH2b5PUnY5O+ueGGj3PNh?=
 =?us-ascii?Q?8KjDomqBsepn+8fgv11eoeqDPmudK/Sy/2szkP4+gpskwZ71gb8lsXFXcsTl?=
 =?us-ascii?Q?xz5HOAfJ8ImuGB1Ff7HZz9hqy/vUND7l3lg4imn9J7r6zLdpnp+Nm2XGxs1H?=
 =?us-ascii?Q?3oJ1jpImjYsZjhgl1a/Ur3nJFOBzlzGC44TmEGy4Wfhl2ojPfabYdmBG91A/?=
 =?us-ascii?Q?ukkPj708199H78XqQksr7TMjh+sDK4aLrQ8J6zZEzoS2wtzZSb9xOK+KR581?=
 =?us-ascii?Q?79SmO2+44hZl7Vrsr8bycD28x8KradpMHRADousLTEwtNTlbUryZDprtlUyM?=
 =?us-ascii?Q?o6vTWK5Wrr7rfC9PofUkql6A+qSYH/wl+JTX4VpqTyjKArclnqsRAl5kuBJR?=
 =?us-ascii?Q?c40xe5cWDZW/TPzYNju5xa86XI/hh/0PCUBZpXD4z8V6hkcGEG8mBzWztpWD?=
 =?us-ascii?Q?pOkd7cR6FjwQ3GCeAdYWVdOjomMjS/x2I9Jpr7buJuLOl6mzx1Js9wGdoyef?=
 =?us-ascii?Q?hLyEI8O+crC/cAdGpaqmyJSYG6USwEk8apYqgo1nmets1PyLjgm63nJVO/Vp?=
 =?us-ascii?Q?wqVERvN9U+PsJOiCryNkh5XMhlfWTQkyMCsY8vBQDcQo+5e/6154KTK2BHBs?=
 =?us-ascii?Q?PpTQ3UNM13k0y1BT0fdsgHHgJnsE1rUrmehZw0ijQnTS0NKF/hIetda2e4xV?=
 =?us-ascii?Q?dBkJDR3kwOAClMw9xi+jc4rrN73F++a1FVPlgyEzlv15uQV2gMj0G2u31Bt0?=
 =?us-ascii?Q?RRnSFQcHHb90hm8yqTiVkaZKPaFuVys6JLWryCMtDiSJnkOi4qkxWLGiB/fQ?=
 =?us-ascii?Q?PX1KNUikfwK2uIneAD6WkroXGjYH0D66O33/ysdfUzVoOpncS1VkgfjHGr36?=
 =?us-ascii?Q?67uHZMbjTeh9z4I7+XW1jaJEHavsEnLUwuwHPMUXhtRSnKYEJMUUziM0Sug3?=
 =?us-ascii?Q?Gb/ErA3tqYJ4kinnR5d4OjyKdEvSIR+p1enJzHLNjcY4hNJuE8S0TkdyOyot?=
 =?us-ascii?Q?746RVVkKIv7ksTHd4HHbgBY/waWvYPkDmo9pCkX3BviRDJEqm3GMS7A5srBd?=
 =?us-ascii?Q?gbW7Cp9ngcirIMmQ1jxNj/xsygFuG+Bec7hApbXukVVinbNUfQqeAsR8dyYG?=
 =?us-ascii?Q?kQSsx7KVqf0kHG27ZtvZY7w1GPBaeZvGiZSbJr4xTmru8KhNaTsIHgV7Xuts?=
 =?us-ascii?Q?TWGV73YlVe19dRl1Ewax1rc+7tFAw6/2+VHVhDY37pim429f89hC+PA1rO+t?=
 =?us-ascii?Q?xyyULo7MWQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: fa2KeDT9R4aWEC09LxNKRxsCgNHq+qukhpxdDk8i8AwLlHF74Kzfzo0OWPu4XE9KGTCYqwHDKybtyWfwK02A4cWUSpKlP43WNH2oljFjmJfCi76HcfjB1Fx3/8BHvnLZ3/1BHJQ3Ia83LNKfbxXj1c+6jpvBbxIw26xsBxyi+SeMb0DqXEfBHy9Jiw93dPfQdIddK0BZUxAx4JMECXSPe5/9EqzwY+Az5M+ETyjtyyJUYYRwpXXRocUKRy3x411d09G3OLup3zzuG5lywePjeW2zBp9bwdvwhp2cBPEsPVN/LaKDaiTcXAxVWl1nY3GNjH13xI4lRK+zPc5pbho1dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba997c9-a25d-4440-1deb-08df1c92840c
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2026 12:26:11.9024
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FYWzuPPmO9x14hx1+nlPLFaMdd6BADMpiCUR5InXQN1VMKFz1/uRz0GXWG5Y56sdIlWG7oLy3YqmsmcmkR5Cyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6291
X-OriginatorOrg: intel.com

Hi Axel,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9b45a047ff0f19af584920a93cd8020b8538a5c3
commit: 72863addaa15829a3fb85b34053b2620db0dbb10 [284/284] FROMGIT: userfaultfd/selftests: exercise minor fault handling shmem support
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260927/202609271344.2fAjNUNu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271344.2fAjNUNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609271344.2fAjNUNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   userfaultfd.c:445:39: error: unknown type name 'uint64_t'
     445 | static inline void uffd_test_ctx_init(uint64_t features)
         |                                       ^~~~~~~~
   userfaultfd.c:445:39: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'wp_range':
   userfaultfd.c:470:51: error: expected ')' before 'PRIx64'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                                                   ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c:60:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      59 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      60 | 
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:483:62: error: expected ')' before 'PRIx64'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:483:62: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:494:91: error: expected ')' before 'PRId64'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:494:91: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
>> userfaultfd.c:146:33: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c: In function 'retry_copy_page':
   userfaultfd.c:558:57: error: expected ')' before 'PRId64'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:558:57: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:561:54: error: expected ')' before 'PRId64'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:561:54: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__copy_page':
   userfaultfd.c:583:51: error: expected ')' before 'PRId64'
     583 |                         err("UFFDIO_COPY error: %"PRId64,
         |                                                   ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:583:25: note: in expansion of macro 'err'
     583 |                         err("UFFDIO_COPY error: %"PRId64,
         |                         ^~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

