Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DBF4962B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 04:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725595974; cv=fail; b=RzHZb9+E8t1Jkqc3rzIWBg77PpTGwtuhLLsr28rvVWdu0sDOwI+kqz4mxgJtkfxpvcarYiTnBPvQl6kC33cwzwhsG4E1iFIggtcbTtNtwKZqMtQXLwNyVLpIYzFxPrebynHvqkjsst3INT9Way3S1FbYdKVZcNc9iVt6B44JUXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725595974; c=relaxed/simple;
	bh=WQybucpr1H5dRIQQudW1MD2u6LLfWFyTzB6eGntGGh0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=UbNz6sV29aso57jZjaSg/tzDY6kb9N50OzF0/vD2qGC//VhSMHMfYontEWQ1A/vFnRNJHaukZMv0tXRfaADtvtiEtgezSmLiq18z/vya5jouJEkN9JyB4/BlNjLSSUPZ/gfgXtAf679sLTgRrGBTLLyLZUtMNFDfSb160MdRKAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Go088jfV; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Go088jfV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725595972; x=1757131972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WQybucpr1H5dRIQQudW1MD2u6LLfWFyTzB6eGntGGh0=;
  b=Go088jfVA4a3LHAmqp2lJhAPgYYsKXNher0F1yMi7lVAy58wwRBNJHtu
   bk+v5fAeib9+fq30C9fovcjTATWycolesC5oGEKKbDTHs91Ft7An1KERI
   4ycEazrEmpNmig7q917P5g3p7lenPcRvppBA7egdOm9WTsc7GUTAXaGt9
   rPRgHTaT81EeL2tm6hvnD8FHG8qzwdquJyeHSHhYfyrFlZZYsLyNaeSIi
   eDa5lT6WwvfvdFzPmR/V0hPNeCsWcG1cwnNxdzSDebCAV63Za5HoiMLwV
   NhbMw1YD/tM3tUi8La+FeVfwFec9jDsTwYdYT4NO/mVQos6esWxKzxplN
   Q==;
X-CSE-ConnectionGUID: X7/3b+EKTlmYaXEbjgJoeA==
X-CSE-MsgGUID: FC6rG81wSQa/ZlmdnXAOFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="35492665"
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="35492665"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 21:12:52 -0700
X-CSE-ConnectionGUID: 0QqPJpt9SPCAleylBUj9CA==
X-CSE-MsgGUID: UzlePdNBQ9maysb50Q7g8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,206,1719903600"; 
   d="scan'208";a="103315234"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 05 Sep 2024 21:12:52 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 21:12:51 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Sep 2024 21:12:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Sep 2024 21:12:51 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Sep 2024 21:12:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQyMPlJ0n72j39t+V6A9wLCiPDVbwDnddD7pfCXvyO+6jv5jmrj1V8TuKH47G8yt8nLQxjI/udHqk0mAoAN7tkCFS0f45CW+zxVjgQvbNRLuMC8MNlyb9jDsmJug5kLq+LQ2GmuWy/jWH51RuGuiStyqWpGTWoMR2v/uvIygYR2nq/9/qiiGtWvPYX2EXnLwxqbXOJWCa6z87FlC4cvIySh7KShZKIIobDt7q8e68ucdvV4ZYNzLd3sPTFLzL7ls1OzdtQY17dTceXd7aa9Rk8G+oZUyCEgbVB9+AvtezcC3f+jmMe7/tpFzACjssByvsetiezQ9VdDJrslRTImNCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/QrInh8QZM/gOJksXXsq3tKPm2KG2TjLJdWryu638NE=;
 b=mpq13gmVqAEZ78bAmgG5YX9I1eItxmhm0w/43VmEkYLSprLU3Mf5x+4wx79jRNfVsuo1AdMdqdZuZaI7YJqwyakBV6Q51+G5SCGkaTFceC7ELYYa/Ck22edXtHBBBa6z1WG+BZ97Hf5bcgQuHA+STJub5HKozSpQ2+u3uNEMLd66qWMIiI9CQ1TpjhowLN4CwLGqHnfmoOF87lPeaIvbLxzsQVGXP8bzTL6rC/CLN4a0oSbXTEGQtH9sjGqOKu3HoBfU2YlImGClNvK9cqgzqUgJZSDf5npxyHg77wNYxbYH78tcDwffLUMfcsk9Y0Z7eDdApyiOr234wTdYKNx0wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW4PR11MB6838.namprd11.prod.outlook.com (2603:10b6:303:213::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.17; Fri, 6 Sep
 2024 04:12:48 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7918.024; Fri, 6 Sep 2024
 04:12:48 +0000
Date: Fri, 6 Sep 2024 12:12:40 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [davidhildenbrand:virtio-mem-s390x-new 4/5] lib/Kconfig.debug:1890:
 syntax error
Message-ID: <ZtqBOHTxfz2RDg0Y@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0173.apcprd04.prod.outlook.com (2603:1096:4::35)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW4PR11MB6838:EE_
X-MS-Office365-Filtering-Correlation-Id: c06caebf-e057-40b9-633b-08dcce2a2a78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eSfYV1bTGHaAqtJyqXP5HIvaVSaBCh5Wn8BGX7E+hACG7oZRvTzD5VtjbRD9?=
 =?us-ascii?Q?Oa7FoFd50wbiyAevVTc0h3bi4f/5T5SOa7qcUz86eH+1IbDo16wAlqJyRQDt?=
 =?us-ascii?Q?g5Vq/Shz3qc/Pod/71K8YjAwFP08+bqmIR5IKQdkSW7NRShgB+mlEzidbz0C?=
 =?us-ascii?Q?pcr1+Pr5hWypxHrKjDucyjRxJlMp+PBEMpjtfVIyAEfhvV1EYLTdubAmj3TS?=
 =?us-ascii?Q?xrW/8mbQWOhSI1lXCtYRcNKYBs6Uc6xwPy7Xk4Mm/ykH0gqPCfAO2BNn0MNj?=
 =?us-ascii?Q?DK/SGi5evAD9RyIt5vJFRTMMjWa/lorHjOWs8Hydq2dHXdo2IB2U3RTc6ELa?=
 =?us-ascii?Q?G6OOugbrlRxh4PkB05gZxGNSqSYW95a8RBWeLab1cnIKN+X7trRsrAIsZMcA?=
 =?us-ascii?Q?QRrZSTFCSkxYv7dqVJbAIhkERJoHDNpEDBCUHCthore5motnMwgCgAdFyceM?=
 =?us-ascii?Q?fsm1FedpED95wB55cQEcJFergFVq0Uz+bGfoD5SjSfrJUVnJqVQcqifGiPLf?=
 =?us-ascii?Q?RxwLVdn3UOuqPmXDkrQvZB2QmHgG5G6IsSfxd1Ste6Kg4ejhEtEA4c13BMp6?=
 =?us-ascii?Q?PPe5lv6UsQ3wQWhDdsxra9WiUTI0fufRYUxwyYiP1ytbhGgARTqcxLzY4YPe?=
 =?us-ascii?Q?8OrQHiU/Oc9XHdc/vAyikhnID2FNTSfiwDnv/9DGUZsiJ86Fb7+YQZMN7OOH?=
 =?us-ascii?Q?9CLix8/q0Zv27kKckCj2sOpKN7tBF2M3HheGhdptXjZkD3iR2EeX45k35mSR?=
 =?us-ascii?Q?oH0fecPfciNjYLVeymxwBS+ogvtR3IFPpGadt+CDNYkQVCpFYu51VJY5Xw3S?=
 =?us-ascii?Q?UGnrY3yA2yM4hpGVK7tVljeaJ/+zEgCPG2EHa9yIQr8ti8y5iISObS2YqTBj?=
 =?us-ascii?Q?vqMlxQ04QhJi7H/6sSKfMqbBI1Rt481WJt397ZO/YvuCN0dHjyCgpREygukB?=
 =?us-ascii?Q?3Zhvb55D7ezBwih4vE/8W2Aa29JLAyXgUGIIEfsCGNBNRbjg/e4vO4yyKicg?=
 =?us-ascii?Q?gsJ8iUO+TWQeEhFN3icPLN39uFJGIa3xMMThZCX/nO4sjRd6v13gC8kE9isV?=
 =?us-ascii?Q?ww5ny404gJg0zluREo9ApPocia7KXFDKblxjxXZSYX86BaDFsAHa65HvzymU?=
 =?us-ascii?Q?wDnfgL5VtYFSIjB1uK+CVJWhDlIbldJHdSzX2onHVQLxOONDJJD3uYj27nqZ?=
 =?us-ascii?Q?gwB4ktQpVnn4lnT8RsOYfOrpHwlK7GLf3JZkGhUWsh4RR69MFCHLrPrrvQAk?=
 =?us-ascii?Q?cQZqokEa1JAEgyQk+y81XaHycQiLI9YGCLvh+h+ffEUl8z+I5Zm/EYbomjc6?=
 =?us-ascii?Q?pusoBmB3l6kaHCY24PduFEHzm2KSdn40kqHv1BQF1R82hduwa++ubsPuul5o?=
 =?us-ascii?Q?hF3VCRI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bx2eA0JyqTax1Q31MPU+RLyA2FY6S667CrRo1aWYgM/auN0q+GaXB9Wa7roX?=
 =?us-ascii?Q?aWaJ9VVyMUjyauK0aTee92DLqr0ehsHOTz+x2RkXDMPSvg7LmHCkJ9wZIUWe?=
 =?us-ascii?Q?S5xk0vOJo5TwkIehoUlho6ZaRiKe3fOKDqYdSDgaLPp1tVfxFUKMhjWJg61p?=
 =?us-ascii?Q?icuMhBlSZxBGEQkQOzyXK1p2ZgaJfaiiHquNpphiPQBC3N5ppJIeByv422tk?=
 =?us-ascii?Q?S8ZAci2Sc/AzzQd5JQrm385FBE0H02eQX7d7t2b0lqFghh95GvxAFaeZDpZz?=
 =?us-ascii?Q?8zdjt9p2XHTEuUwCclpv6OKCqggUQVmPkQfp3pzSnBcAMsJWdc+A5NJNRwCn?=
 =?us-ascii?Q?PvLRJIfHofvf724nhSint4lhONb88C1DbJGOdwTnRzBagY2P/6JZoKxj/oG5?=
 =?us-ascii?Q?0LE4TrSGifpKgUxKXJGA/h+vfOse+vKLnQ/jO+nNyrtUNaPmyaYUYp9IB7KZ?=
 =?us-ascii?Q?Q2w4tmM53X8UfS9sFkgQjk3F3iOdPRlC0O3sQ3xD8TsA0LsA6chEz1vFQIQb?=
 =?us-ascii?Q?pY73NWW/dUucZ6nmM8/YvOZ3hHz1RqH0oox+XJgFI84vW3UJKfL9fTdSXPfe?=
 =?us-ascii?Q?cIzWU14+7eImYD7O+AVtg9jSFQlmVLtjLZuqRp2KcpvMe45yltYiFwiVmife?=
 =?us-ascii?Q?V+4O01jsubAuvFtijH7tzX+ikADnQUdvbSoD5M+z9DtfndWfesOk1hb66r8G?=
 =?us-ascii?Q?2aJO1ZnNEYvHYYdaf+zflXyYkHrymy6Ish8HWtsiIv+uBw2MpumtIpn7eC+Q?=
 =?us-ascii?Q?LqI6elsdARu5InAo7J2qhwW9oaiDPDbs8VIe21/UOlgAqG5xgtPzUwLh+GQr?=
 =?us-ascii?Q?qnTAAnIq5Hp3nMO/3Gzq4JR6Qdbcbfr9i5BWMiO/dViVrnUmnHiPHDdFUWur?=
 =?us-ascii?Q?mtkR2fsSre19C2A9VaEKR6e7frBubCZ975X0toXfOyIcv3w4NZd3+wGjWkxM?=
 =?us-ascii?Q?eK9oPexJMRy9nSez0LbT1gz/XgkiC9LAvi1+8vBndchyZEJhlt8WTxe/pQ6q?=
 =?us-ascii?Q?GxC87xAIJepvr9/8PeEKFCYQajTxyU1YNGS4vc1+DK5YzxCdzzYYmey6ifGR?=
 =?us-ascii?Q?dG8NaJ0KTDdUpeKX7FWPPj3ew+TL0qRrHQiWCOKwiLJRzc84n52foNHNGSXk?=
 =?us-ascii?Q?ODf5+nVcCC2LomcvIADJ7SuTp3zN4We2xMVyvV7T96tQs/BfBFHXaWEoHSYe?=
 =?us-ascii?Q?+5gRWn2YQguz++Mk3NyYFMXjsnOaE6d2OpwrD2c8RszpHf/BlyustY/pelXz?=
 =?us-ascii?Q?zvqLCsHLdChCz7pzZV/+69rwtF3PK2eFlBJbU4yuiSMGPunWryiq6BFY1zEi?=
 =?us-ascii?Q?UuqApKR7zx6c6tyowAQFhqtQFMR/wu8NdnwDpE9Xpkzym3t9g1AE6Jehn4ws?=
 =?us-ascii?Q?UGbm3Z5A58Y3W0JTfZjjNzhXwiQxWskD5sXmkxPPrmSvjrFxQxge/M+Atbgd?=
 =?us-ascii?Q?Xz9uIVAZyWpfpjw2YTRZcXct+C273fRLPGtFmhZ9AS7Wwi04LI5T0Ym0POId?=
 =?us-ascii?Q?BM7SMjidTQH+stZ2uE0i+tcVMUxQe/jf/Dg9RelqNIyr0uA1Ue+wLztZbqhh?=
 =?us-ascii?Q?Ad9qyAHCMGM5qUOWWkZUIwcZRI6m2FrhT/I4gYh99OzRdxMK0/Old7KaU5Ss?=
 =?us-ascii?Q?jg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c06caebf-e057-40b9-633b-08dcce2a2a78
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 04:12:48.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKhpK0kP1X1Xf3kx8gqkQtEeTTUZNWmujwf1KCEnrMAIXYVd+D33d0c3EYUzV0ZvPFqz9mu0qQCiTKs7QBRq8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6838
X-OriginatorOrg: intel.com

tree:   https://github.com/davidhildenbrand/linux virtio-mem-s390x-new
head:   20ec4366bab8de03f08ac131659b8aaaf97fb222
commit: 2a876920cbbc3c1ed61d1cd847cfc939f7b7d003 [4/5] lib/Kconfig.debug: default STRICT_DEVMEM to "y" on s390x
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409051953.0QbErOvn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409051953.0QbErOvn-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/Kconfig.debug:1890:warning: ignoring unsupported character '|'
>> lib/Kconfig.debug:1890: syntax error
   lib/Kconfig.debug:1890: invalid statement
   lib/Kconfig.debug:1891: invalid statement
   lib/Kconfig.debug:1892:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1892: unknown statement "If"
   lib/Kconfig.debug:1893:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1893:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1893: unknown statement "of"
   lib/Kconfig.debug:1894:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1894: unknown statement "access"
   lib/Kconfig.debug:1895:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1895: unknown statement "be"
   lib/Kconfig.debug:1896:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896: unknown statement "enabled"
   lib/Kconfig.debug:1897:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1897: unknown statement "use"
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899: unknown statement "If"
   lib/Kconfig.debug:1900: unknown statement "file"
   lib/Kconfig.debug:1901:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1901: unknown statement "data"
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1902: unknown statement "users"
   lib/Kconfig.debug:1904:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1904:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1904: unknown statement "If"
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:680: oldconfig] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
   lib/Kconfig.debug:1890:warning: ignoring unsupported character '|'
>> lib/Kconfig.debug:1890: syntax error
   lib/Kconfig.debug:1890: invalid statement
   lib/Kconfig.debug:1891: invalid statement
   lib/Kconfig.debug:1892:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1892: unknown statement "If"
   lib/Kconfig.debug:1893:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1893:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1893: unknown statement "of"
   lib/Kconfig.debug:1894:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1894: unknown statement "access"
   lib/Kconfig.debug:1895:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1895: unknown statement "be"
   lib/Kconfig.debug:1896:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1896: unknown statement "enabled"
   lib/Kconfig.debug:1897:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1897: unknown statement "use"
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1899: unknown statement "If"
   lib/Kconfig.debug:1900: unknown statement "file"
   lib/Kconfig.debug:1901:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1901: unknown statement "data"
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '/'
   lib/Kconfig.debug:1902:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1902: unknown statement "users"
   lib/Kconfig.debug:1904:warning: ignoring unsupported character ','
   lib/Kconfig.debug:1904:warning: ignoring unsupported character '.'
   lib/Kconfig.debug:1904: unknown statement "If"
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:680: olddefconfig] Error 2
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +1890 lib/Kconfig.debug

045f6d7942be24 Changbin Du       2019-12-17  1882  
045f6d7942be24 Changbin Du       2019-12-17  1883  config ARCH_HAS_DEVMEM_IS_ALLOWED
045f6d7942be24 Changbin Du       2019-12-17  1884  	bool
045f6d7942be24 Changbin Du       2019-12-17  1885  
045f6d7942be24 Changbin Du       2019-12-17  1886  config STRICT_DEVMEM
045f6d7942be24 Changbin Du       2019-12-17  1887  	bool "Filter access to /dev/mem"
045f6d7942be24 Changbin Du       2019-12-17  1888  	depends on MMU && DEVMEM
527701eda5f196 Palmer Dabbelt    2020-07-09  1889  	depends on ARCH_HAS_DEVMEM_IS_ALLOWED || GENERIC_LIB_DEVMEM_IS_ALLOWED
2a876920cbbc3c David Hildenbrand 2024-09-04 @1890  	default y if PPC || X86 || ARM64 | S390
045f6d7942be24 Changbin Du       2019-12-17  1891  	help
045f6d7942be24 Changbin Du       2019-12-17  1892  	  If this option is disabled, you allow userspace (root) access to all
045f6d7942be24 Changbin Du       2019-12-17  1893  	  of memory, including kernel and userspace memory. Accidental
045f6d7942be24 Changbin Du       2019-12-17  1894  	  access to this is obviously disastrous, but specific access can
045f6d7942be24 Changbin Du       2019-12-17  1895  	  be used by people debugging the kernel. Note that with PAT support
045f6d7942be24 Changbin Du       2019-12-17  1896  	  enabled, even in this case there are restrictions on /dev/mem
045f6d7942be24 Changbin Du       2019-12-17  1897  	  use due to the cache aliasing requirements.
045f6d7942be24 Changbin Du       2019-12-17  1898  
045f6d7942be24 Changbin Du       2019-12-17  1899  	  If this option is switched on, and IO_STRICT_DEVMEM=n, the /dev/mem
045f6d7942be24 Changbin Du       2019-12-17  1900  	  file only allows userspace access to PCI space and the BIOS code and
045f6d7942be24 Changbin Du       2019-12-17  1901  	  data regions.  This is sufficient for dosemu and X and all common
045f6d7942be24 Changbin Du       2019-12-17  1902  	  users of /dev/mem.
045f6d7942be24 Changbin Du       2019-12-17  1903  
045f6d7942be24 Changbin Du       2019-12-17  1904  	  If in doubt, say Y.
045f6d7942be24 Changbin Du       2019-12-17  1905  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

