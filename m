Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA7D53176EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 03:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789700640; cv=fail; b=ZaR1SIJFxM/906LYoEdXwJ6P9dZzSe092L5J/3p1oeEnETNP02zxqBb6pjD8VMrfaa+TjVSGfJF/1PWNzb91QoznPJnfA5K2wvmjrr9DD6fkfaHgiEzcNEWdfwrjGWuSpCdAtxHMdlB5rDP6hsVSQFu4gzStaRxX7cLmaBtHZP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789700640; c=relaxed/simple;
	bh=F9DkAZS4PCiHXj0LBRhufTAAsxzwKNR0ZCE1aVZ+2Qo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ht8K29wDAMUpN/vIDhrmLtquCINi3tIAahNotuRt8qEgWA10YjNvVsayC/dUn1qPZ6JvwzB5uRBr3J1Gkie8BEbqYC6KedgAFyQ/noPW5r+ImU4oOCoOV97fJw0duaSed2QNEWtukO23SrnkL9r5sPjDCIwBAhhzAPZnmoKO86U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1bsZ9HY; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1bsZ9HY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789700637; x=1821236637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F9DkAZS4PCiHXj0LBRhufTAAsxzwKNR0ZCE1aVZ+2Qo=;
  b=m1bsZ9HYRqBcyFkEHhPNyjhjbb/SYN+8Q+Vw+hhOEkxk9zaasNmL0d40
   L2lIKZQlIg8wIxWQXtwGXZdPmccwAacogfA3xZZdN67dj72SzzjjjL47x
   eizrkTtSjiDylXXq6Nc97BgA8x8bXeAGwFQ/mvzXd/jzkPk+m9l2+BnMh
   TVR69inI1hqtTmSa8aOGGIh53UcE5nP9MsbVBBGyqXdYg0rWWMFoXhuqy
   b70OzB0KCmNuMig0c+x7glGikXwsZJBkns9HfP4+op2FIhqcOvCv9CbMM
   qc/lURMX+ve8vZX3CuWxi9ZiSU69ggDdBeu9m92ydySnz3/ll5fsR3+XA
   Q==;
X-CSE-ConnectionGUID: R+iKeWLYQJWXaSOEQSgbUA==
X-CSE-MsgGUID: wk6QPkMFRKCd70n4oLjtiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77744853"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77744853"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 20:03:54 -0700
X-CSE-ConnectionGUID: 3uLcWLkJR8WnHfha2rZpLA==
X-CSE-MsgGUID: WUC5wTk3Qs+Uh/I/TISGqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="267912484"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 20:03:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:03:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 17 Sep 2026 20:03:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.16) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 17 Sep 2026 20:03:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBs7My1lE2rGX2Nev5fmpyp2nyEi65AUHms1lkQAYIAubEet07+JV6IT8NP1q7Bc9V2O42W085zuRsZfgVx8xcx81REe6jg++UXgCZOhEQwEqB5Ac17Q+nAkOqY90fwAqYL4fH97fHkyft/JwpEzCr/l1GDNBr7Sni0OdUE3/8rqskRR4C8oXzkMFg3tIg77FC2FLaUFIq0vtg00N+t32gF+YvditBNLuKEznFhoBYKw6J++ti3vT1cJfLM0eYHDLuVRI1NjkIHDp/GqLH4RTgjO2IeNNfrr5y70r/hXvLyQ+X/TMBUw33S9IFjsWV3e3y7pSDSXeAxp9/HR5nwOkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ifgbuq5ISRnjG/rXp0v7D6wNRqAsCJkRx3lFSgAM/KA=;
 b=kHUWj+UdumL8io7zpiGGlw0rCRhG9fuUSGA84R3aXE1iEpFQeJJPYIdcxkQKlFrd3SKJALtNt5i+ahohXNd+2aulukocW+5f4HkWyFs+wxMxyHW2cwC1z7M6DG1pRuZgEaiqYwHi0DEYB3Nw1NMAp3zd/0RCxnX6HQEeD+fcC8+G+7yLj1J2NSNpmJ+xorHl4eb+lEtqwNR5UElov6SAoEs7ycI9oLstxigs++DMaGpihDSbBuOtvrn6y8liggHYWLsQAb7cSKnvs2tavl9L6xOL4/igjfUXa38lBQ9MIl2eU09xGegr2ozSH3CgZXPJZ0ni3bX9F01wYJprO5PdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB362586.namprd11.prod.outlook.com (2603:10b6:8:4c4::14)
 by SN7PR11MB8028.namprd11.prod.outlook.com (2603:10b6:806:2df::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 03:03:49 +0000
Received: from DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a]) by DS6PR11MB362586.namprd11.prod.outlook.com
 ([fe80::71a6:38f9:43ed:8f8a%6]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 03:03:49 +0000
Date: Fri, 18 Sep 2026 11:03:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: <oe-kbuild-all@lists.linux.dev>, David Matlack <dmatlack@google.com>
Subject: [jgunthorpe:mlx5st 5/11] include/arm64/processor.h:194:9: warning:
 "dma_wmb" redefined
Message-ID: <aqyqDN4uVGwgxqL1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0134.apcprd02.prod.outlook.com
 (2603:1096:4:188::14) To DS6PR11MB362586.namprd11.prod.outlook.com
 (2603:10b6:8:4c4::14)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB362586:EE_|SN7PR11MB8028:EE_
X-MS-Office365-Filtering-Correlation-Id: 9419fdb1-d6b6-4ef2-e898-08df15317659
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|18002099003|56012099006|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: twVQf+RJxz3vbHLZDm0zt7VzqlnNzQNLkw1ASNuamKRFFnOuOu4q02TRIKh5l7lwPIu7Y7OQUw2y4u5wZ9Qif3HB09VkrdtsgYDDM5/t2WFTm5qah1XDVlPQaVsOTtjGRIjpIY9yjNE1sMEm4a/G1kWhq0Wbq8KbKS3uhzakd8ECxi/s7kS1+EJXMq2rek7IkYzNnaJ5dW6R46S6owmcE3sjBMKOt/40xgG+c5FcVPguQCjxmzPXICYPHJOrexRO4Bc6Gyu27ntEDlOPa9YyVqNebNjfkNeHSZC7COs1iZyPjSaJxXTu/UZnmBpgbgCWJCYGtjBBQX+ivXULbWFPf9j0RvAQjNHVOZEQttBZuYnRNOryLqpQ/Xw8y+D6o97463HsLAdpAK62Ndy/pOe5SlfLq/kC0AgQR9h+jmFMtwSPtbMTEHlucCijX5fDWDEWBbcHPJzWGjzuXt3rz6hZNOq/MSk3ZSJhdi9R74RXMGJxgyDlyvXNpu8UuWljVYI2aQeflGvRcikZbZc0Nq4laqT9IfdX3KkGb8ZHNxQppP5aPph3qBDdOLUP2B1eMixm6zb1AdGrFyR0tWATljAtnNPief9pCN5y/1fq2xDwzBuFu6H8RBHddko1Hp0NUdbq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS6PR11MB362586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(18002099003)(56012099006)(11063799006)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?63125lYeOLcls6VLm1Fyg9ZNv71ff+FpODqZvxmSsHw3dJeYAd4fcDSODClM?=
 =?us-ascii?Q?NMsFtMKJ+KWLmwHJQdDz31vXLNG9W6pcIuWUvgyGzWIGc8fQajBByWYoRmaN?=
 =?us-ascii?Q?CrmoR44z+k5t+DbME8Lsx3ENQYEGxkWhtm3T0LKxQrA1LxZ6D+8HSQjtg06u?=
 =?us-ascii?Q?uK4WIxWOQ16AFuJwET5djW2T/E/yfTYPP79iM9+h9dnNEjNp45brvnKx0nD3?=
 =?us-ascii?Q?+4SuQahj0g+bLrfFUWJtrx+TVovSuTbK/jbFENqmODHFbk2SHShEQaQ8PFS5?=
 =?us-ascii?Q?/exKcooJJHEVN6qJIV9gEdBT00e99bToYVkoqOstz+GPmCnmmgVkiY/dP5BT?=
 =?us-ascii?Q?QEyX3KUTFXXGRCD2Z9pBEcbvAg9/ufBp0rqLFKSB03O5y3C4yyFlDwGkwrHa?=
 =?us-ascii?Q?3NmG1MdGTbaC+/o6QC6/PYyKa1W0sUs7cRQIDJzrRrOTcJbHiUnmjWIAbLV9?=
 =?us-ascii?Q?9nmKrFs9LGqVZFy0KCH/M+PwBvdo0Wpza/o90Y3yvl9yO8MBGlchl0XHiO6H?=
 =?us-ascii?Q?kBNIOSm2yJ/zRK50CEmqhG50YXbWoda+URbkO3AnivQm58dhVW4Xdn9faGRx?=
 =?us-ascii?Q?aYt5BtIlt8SrPrqjuO2KflJv5aXcQ5PO9o36mW8yEVocNFjUuavmLY1VNyJs?=
 =?us-ascii?Q?hAW9PYlZaMXRO8y2PqaJBAix8h/WCgxnMXcsV2voIv9m+XIN6HoisHdWrK14?=
 =?us-ascii?Q?jae7meOXWReMrTK7OEACaKwfgqXD1h7LHJpu4DFLEnzNq5ekYcjqNDPRIHsW?=
 =?us-ascii?Q?oELLFtfgkN29cSJGmgydExIWLtUmFDkaZwr4JDy1+tfHc1N46BMgdu2oKzoC?=
 =?us-ascii?Q?ESU7OrVN036eesgVbkxVwIgmXLBk56blHwb6J3pTy1gF0wmWBIWTiQ3LqQpW?=
 =?us-ascii?Q?p879bb7K5k3VwVZSp2Na//ba1+/LJhtNhRP91I4Mn2eY7Hl2/FHwXc2kOTiF?=
 =?us-ascii?Q?BJbcsDiSnQWh20tUmI0H5yGXNqzSBYm+lVcH5AXQndYs0uEfSNzrUpq1Flfd?=
 =?us-ascii?Q?wSnyOJ4DODCMoODWAS2inuBpBcwkAu/jIKTjz982F8WAnH/e9Vu6t4DsQMWb?=
 =?us-ascii?Q?+w53OWkPNAlZNzb4LLD8+0wqIZsKWD4t2/a8ppR0LLFUXbwWNb8jz7u2U1a+?=
 =?us-ascii?Q?FXt6KMjihFCiL+chVG0BEAF/wTf8WPuktY1WBC0LPvOln1/fhPKr5RkKl51K?=
 =?us-ascii?Q?YQcUNBwwldDrDEyErMV79mmoXaPygJHtZBhGtTfYP5umpw+29b8i7qnBHlkh?=
 =?us-ascii?Q?YNR9tq6b8RHajNEAERDD9tBgovwyxr9kXlr7Id5jFXF0QEDv+FAjHJpR31dc?=
 =?us-ascii?Q?y9iTfJN4OWwuR3EyBRiwcx5MecsC8oP01sVF924FGkYS0yl/z1X2Z5Wx+f+t?=
 =?us-ascii?Q?R/Xt0oP7zmi7oL3sQ0VWeiGFuY7YNyUReajOqc8pUnZTIDUm2PJZFkIkTgZR?=
 =?us-ascii?Q?OWyEv99y2PlazJHITyb9yV1mT2MD3H8hGKcKvhZviWtYyAObEz+TDhnsdzn2?=
 =?us-ascii?Q?Of97GRjweu5tauq/sdzzWkrsjZdqOLDA0GFI16+Yvr8NBahJxA5N03nOj75U?=
 =?us-ascii?Q?bi4dSPeokVKieboE6TPFx8sWcRct57ZsZ/S6NAXb03tP8VWfkcqLQfXjbXGR?=
 =?us-ascii?Q?NRDKKn3xDwVTkUtqLdXfWm1VS+6/AvlhB2gOs5LclcPZaSgch5rCy31Bt6Zd?=
 =?us-ascii?Q?W2fIu8Y52gwcvonqJBTgNUnw7rd8dL0TB8JmLDxz21qdAClOMTNz8eFv3sQY?=
 =?us-ascii?Q?sric97i0zg=3D=3D?=
X-Exchange-RoutingPolicyChecked: o0kjZeoj1R+cZsy065h4i2NyG4kvNO74d+MnX3iCB3L/bp1qdY8bE8XRXVrhflrKWgFz/bF9QFeJBFC34d68fUhIiQJoxzEv997X6ZE3R9eIVinyuhiI6J0o8EfQXz9TAys1HTyDvcnyxe5TOb2aC1qbuhdcNCVaWyqTrqXcL1zLQAHHUtO+tyHSgkI5nXbqbY9NxHz0c5yp+RZA397PLAhwoW9brKKM0ffuNOsJXCI9ND9vix+vcIiee79fEQSoBnqxYjybTQeU4CWquzskWZvhr1An8aNdldbZWED3qpkBWZqa+ro3Zc45lFEmBaaWSLpex/0CqUdyOR757iI8VQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9419fdb1-d6b6-4ef2-e898-08df15317659
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB362586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 03:03:49.4861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xF8flUtKsDHjQPSkJLu26ZBbt+/Lnuxd/eTUtE2NgvG1fkwg8+VKInmMdd9lwWcQdEb9xM48tGqBvbtWdXs85w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8028
X-OriginatorOrg: intel.com

tree:   https://github.com/jgunthorpe/linux mlx5st
head:   f7ab66f9ba0846c425096e6d13eafb3784c6b1c8
commit: 8cc7121f791f18e5c8c95d47d45795548243d24f [5/11] selftests: Add additional kernel functions to tools/include/
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260917/202609171844.Jd38gQPv-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171844.Jd38gQPv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609171844.Jd38gQPv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from dirty_log_test.c:22:
>> include/arm64/processor.h:194:9: warning: "dma_wmb" redefined
     194 | #define dma_wmb()       dmb(oshst)
         |         ^~~~~~~
   In file included from tools/testing/selftests/../../../tools/include/asm/barrier.h:8,
                    from dirty_log_test.c:17:
   tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:29:9: note: this is the location of the previous definition
      29 | #define dma_wmb()       asm volatile("dmb oshst" ::: "memory")
         |         ^~~~~~~
>> include/arm64/processor.h:197:9: warning: "dma_rmb" redefined
     197 | #define dma_rmb()       dmb(oshld)
         |         ^~~~~~~
   tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:28:9: note: this is the location of the previous definition
      28 | #define dma_rmb()       asm volatile("dmb oshld" ::: "memory")
         |         ^~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   In file included from tools/testing/selftests/../../../tools/include/asm/barrier.h:8,
                    from include/arm64/gic_v5.h:6,
                    from arm64/no-vgic.c:12:
>> tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:28:9: warning: "dma_rmb" redefined
      28 | #define dma_rmb()       asm volatile("dmb oshld" ::: "memory")
         |         ^~~~~~~
   In file included from arm64/no-vgic.c:10:
   include/arm64/processor.h:197:9: note: this is the location of the previous definition
     197 | #define dma_rmb()       dmb(oshld)
         |         ^~~~~~~
>> tools/testing/selftests/../../../tools/include/asm/../../arch/arm64/include/asm/barrier.h:29:9: warning: "dma_wmb" redefined
      29 | #define dma_wmb()       asm volatile("dmb oshst" ::: "memory")
         |         ^~~~~~~
   include/arm64/processor.h:194:9: note: this is the location of the previous definition
     194 | #define dma_wmb()       dmb(oshst)
         |         ^~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

