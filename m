Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665FA13A3F7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Feb 2025 05:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740202133; cv=fail; b=ooPwrtvEbMCT5s4w/7q9G3mZdDcUETKUWU130rl609wA4N6rI+hQvN8tKVFZ4yiKdigsjlVrJUcMCWVXg/SkbqGU6DKhke4Fxx4ilhPWEobQ/vGnQZNl6TOc237pdUQnsJaLd5aI4ak8e6p+nQgsjDL4dV3OOmMihcZfNSwObZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740202133; c=relaxed/simple;
	bh=Ax4jO0M4wWL2z8nka5c8iWXd96vlpngo+2kteUxFLzY=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=i64FHJVN58lZD1rn2ZtHLX+06Bm+XnhouU2I06lio0OycaU+mdo03h9GMw6abwI3gBe6WaUOM+rczy5oqyQ3FTtlTNHBJKiBRJORHtIV5UlPGZe0tw3Viv/X7tTrOAZVq1XUReYyB/lJUvkY3JYjrEQvZH6IwV/sGy73R6FYaBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHN3zGP5; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHN3zGP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740202132; x=1771738132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ax4jO0M4wWL2z8nka5c8iWXd96vlpngo+2kteUxFLzY=;
  b=kHN3zGP5iTHBNnPhiCwqYplSfxfGiZfH5KW8uWq6SC7msZPSTYxXhIzU
   HPp+TqnBWS5R35dWAXBlevYjGpvFA8goumG2dbg8Yjqmskw6OuD9egB1e
   WcUDXwSOyCtI6oCtysXkx9VLF2dvvP9ig9Vyp9rSX8FV0xrP6R1SFVlch
   hecOUMFyjZqaUanBugbLo6duWIu5ewf4U6VQKDN3/WXwsf8vT8fl1qHK7
   y7qHyZXyCMtr4jooi80wK7ygOCwnGbE0iuZoxgr+wzlkFTmyq30KFoyx0
   8dI59Qlh60+NIiQckN5/pappDp5ARYt62OWvLvAuL5DG/QQGzBxydsxMM
   A==;
X-CSE-ConnectionGUID: XOgIJBndSg+BClJRm+DntQ==
X-CSE-MsgGUID: 9DsR4zVwT/ejhn6nqYNcfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11352"; a="52430522"
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="52430522"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 21:28:51 -0800
X-CSE-ConnectionGUID: V3hQQ9AWT4OlSTyMsLwSFg==
X-CSE-MsgGUID: BILhtAwAT2SDPk6o7+jrVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,306,1732608000"; 
   d="scan'208";a="115269318"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 21:28:51 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 21 Feb 2025 21:28:50 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 21 Feb 2025 21:28:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 21 Feb 2025 21:28:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uO2RnGUkQiKCwBGjwhhlFh76ckNvEM2TpxfvnFLJ7JshZNpfYCKDJZ+4MSxDaEeNDBOcRtVRWwS2r2ilZ2Jf0joPErupShbMuy7mFuRAB+omJFpWUtKJLOq4HDQTrp/HWX2VzxGCOWhWsvpTGyuIdLv7YRtmr64AWh+Pn1tptF2ea48mFzYKx+hMQrrbU4R8/LIocSnWisKec0ANzqrEmdaMO02c3jCc1EPtFwUlwyWB0MVMeqOLdes9tGWbrCTR3d6aEjSe16UsswJnBqmSRryMngxqz78ade734PCLtEmjk1ajMUvtB7tfqqxVCCfWs0Y//PsP/AH/Z30hzY2YQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Km/O24PRkhCsr2hINbwOQ1QDex6Kso9VK1D81YLxcc=;
 b=hrAzBqS8r+tW7pJMEUi4wPqQhxcglA3yH7zgxss860xliX9LNZIn5YwDUPe1CO0kyBC+qvlIBjX7Ef3QS0bGE0/7b4B9Pk9WEBXbfcFz/TKtbfhlEXB+sh7b4k1ceF2PDT6dj4hOnNLKHr1MqvqNVlH4jToQL7PXRXUKMHNgCYBrZ6Fiy+JFRiAZRfp8j8c7TNpfIori4JhXXNWUQHQPg3pjPiTf6/Ixj7TBOO/8SqIcUNcf9JOP4ukWKQ7m6WOt7TF1jMqG5x4Q3Xma2hoZCVpgLRYUyfUkdroBf1ib1ftn/YSR3SQcwLqL6ll8I+ibfTlh4W0cdkl0o9snRagOVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CH3PR11MB8209.namprd11.prod.outlook.com (2603:10b6:610:15d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sat, 22 Feb
 2025 05:28:47 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 05:28:47 +0000
Date: Sat, 22 Feb 2025 13:28:39 +0800
From: kernel test robot <lkp@intel.com>
To: <kernel@openeuler.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [openeuler:OLK-6.6 1958/1958] include/linux/fortify-string.h:406:19:
 warning: writing 1 byte into a region of size 0
Message-ID: <Z7lghxiGc+WY0riq@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0170.apcprd04.prod.outlook.com (2603:1096:4::32)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CH3PR11MB8209:EE_
X-MS-Office365-Filtering-Correlation-Id: a5619c7c-479d-4890-65cd-08dd5301c7b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LmtUnSxW5MIhsszHNWrxG/aQIm42t/d6urNNVjI4DyaDpd5VnXxMIHpmYXma?=
 =?us-ascii?Q?E9xNxonKXuCvhDi2yb8e+DGdHiUYRehOL+Ap4AgOJJ5VduILOak9Sgb7DXnX?=
 =?us-ascii?Q?UFuOdhy4FgtrGyPMTECkCAlgb5KRM5ytRQIA/4uifcIVqZl6oDpoyiRpLhi1?=
 =?us-ascii?Q?TwyZFJtTetwbooaHSal68faZi1Xu8eh0i6abC+KvZTOd/4QoXU4EEhlUTf7n?=
 =?us-ascii?Q?k5m2iiCsMZ9tjz2LURY3HevKP3NFAQ2Fd4AOvBYtc3hZHWTBpsZv7ISuFoId?=
 =?us-ascii?Q?OQlNYh4SeivsVqcJGyKmwFIFljbkCW9Vg+KQsm89kS9k6gTLZBbb1A7Yrj7k?=
 =?us-ascii?Q?JKjy6xA6EtfxzLH27+AEQxuYVTn3oWlJiO3K4mZ9n4e43vXyDJGvFEwjcdJm?=
 =?us-ascii?Q?QgDxl8be1O5bMlUhbJyI96kWDwG7lCWFvUFC+gT8UyY4e8/SJU2JlXwcRC8V?=
 =?us-ascii?Q?Akzx83lS8cLXw2IXfRh9mzDozNAjyqkgs4hyxZktiiuf7ZtJ8hKun1HnnA8/?=
 =?us-ascii?Q?gfOumDOxyWDG5WoHYmnIdksnfzf36mQjVAaxzIq/N0Tj5p+FBJRwSiQQSWaA?=
 =?us-ascii?Q?rWXae5tggWYMblFTpwgqdkSfI5OGb93pTPXaEKe/qo+jr5OxNGKmmDUxEpa+?=
 =?us-ascii?Q?X/mR1pLB3vFd/ffwl8HkxjocO3NqMRdXlofuSM/9I+TFYzhQomcoTjCZbo9h?=
 =?us-ascii?Q?mkxJOAwmKXPuXZr0Y+vEBjIQoY5TIiNOMDr8S1lW24sdYmB8UA4iG3hQAk1x?=
 =?us-ascii?Q?7MJ92osWid8XXHUEjnZ9y6kkBOAyVNXt3eHrxuuMCfy1CXBHjy7dFeL9d+o/?=
 =?us-ascii?Q?KdxqGWykvixxeFawyAjV4aUKIVZ9vg4WtOUj3wgzY1C68rBmhyJAiN62okGV?=
 =?us-ascii?Q?Jnfd/fboP7y0J5ycXvFcQKV/RfQrhu5gjijtrQwiZ1H1fmrrsTeHyFQw7uOh?=
 =?us-ascii?Q?UHUk8R+X4Mv2BstgB1kvdXLTvuN0AlL++U15bgxYKEJ8YQjnVMP5dbW5N4cv?=
 =?us-ascii?Q?vVeqAvXNi9JcVDv/iqTOOGWoDlltPMkwnZVPalI7s304EeVFFuFlK50cY6Te?=
 =?us-ascii?Q?0C0SWglnm00AP+v4bn9av/l7Pqchi04Wo0ufn1og0mlkjzS+vPtPBWrD4Gxe?=
 =?us-ascii?Q?hx1oAKYR4kP4xdNRLm2BVYz5cC/7IwJYeNlJxSH+lWxsgdApNyqOSUGg7Ijh?=
 =?us-ascii?Q?QdVeGlmicneOsoOJBI+xLBPrtDKt76pQrnubQuMeIs4IxghkdFO5z2eavewX?=
 =?us-ascii?Q?BRcmBL8J4+sH57SzwokZgWAUMOJcufWv5jEDMrzoYV2vvn6Gt5bsSEG3qut8?=
 =?us-ascii?Q?7SKlow0OQxsIBXyQ9EHzYWiz7UUyefP5CT5TgrfXiPYGAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k/8t9N/DJ8iEAhBICcNV5pcm5q19oz6d8wYJ8eH1NHovqNgFkdyLF7iqOWBb?=
 =?us-ascii?Q?YTGeArYpFHpb8u8uqH90oGtw/ltctv7xiY9gAjm25pwEFUKslwy9ev06FG6n?=
 =?us-ascii?Q?hS/7YmIr2nkQAabEjEgtz5hbOiIQFMuHz/XiwDgkuYPsTJdQNI0cx8Yam/Dg?=
 =?us-ascii?Q?AunM7KZJrN34NylpftMMbSgxp7DKS0dfDpFOwCYE6zrUa95AQeCStJTaURr6?=
 =?us-ascii?Q?xiPoEt8vGEUYCH1K4Hu9iMDXvDBC8TLVWe3j0zCKGlk19G1o7qQ3/pwOpr6z?=
 =?us-ascii?Q?FBoCno93ItKW0z/F7m6KW9VvVPHEVWcj19cW9hrA7UgLRrOjCCsjrJSIMNk8?=
 =?us-ascii?Q?sA/dHOcPdyegqLRrgXO3EVEnPzZ6I7YvCYOMfz1CwG0bLUCo3IN+PrCZF1yd?=
 =?us-ascii?Q?6QoO31q7bfhvDUlF2AeK+AQjvavXI2wb+Qw4XR/DwRS0I6MiazLmjEJbYOE7?=
 =?us-ascii?Q?dVjnBlXAnF5PS4IB9BP0LdzPMbSk2exNsSrquuC3xzq/Eo3b39VyHqbikznl?=
 =?us-ascii?Q?Gz7XHDWMNaVTCCO2oBNZ7Uvxz4ncrVYb1FruFNP4McrU7QpxxHuWDjfC62fi?=
 =?us-ascii?Q?+S4lSHCTHu1s/yZvPZm5/Tc+a5+mRJpiL6c9nQuvxz1a5JTC+01PV8tERLyY?=
 =?us-ascii?Q?LePYmQdFpLi46B4hakUAuwCQAesmt93mc0qksGkKwi8USgslSpMjvaldDH9z?=
 =?us-ascii?Q?Djgdv3TRJa42108xhIDfWL8TxzDjG04fODSGedl9VZK9/+/eYC/DezHv/h96?=
 =?us-ascii?Q?s4PqYA1cQxAuTV9Erh/t8JyTDOJ5vlcfrt2op759KNQ5hKPqIrEn0MOzG98r?=
 =?us-ascii?Q?l19EqW68d83Hd9P+cJ2TaE4eC337fIZ/qHGzsrvLTT23sHdTx/ts7ywArVRs?=
 =?us-ascii?Q?ZIVLrH7PG969b2CSLPA6MLI5K+k3Ea2zBNxjay/4PL3+V0y43EMcf/LIsBEw?=
 =?us-ascii?Q?GmTpKecf+Ssxw8jgTuEUDRVZj50t2vvDdfTL7ygbrAWpfThN1aKfLli64657?=
 =?us-ascii?Q?gbRHY1fcGouYDpnn7qFCoMfY1t9u75iUvDfoViH1v6AUJFNbQVEyj2NCopqO?=
 =?us-ascii?Q?NMShAJozlB9NQ0WShAtnduSrcB/3Fn5EWst9HrnqiGXDpx6CanGIV8hHa7+/?=
 =?us-ascii?Q?GFPaFWbqANSVg562kAgOBlAyG4Wa002V+5FZ3Wx7O+0C+5BC60XAQTBUUj3K?=
 =?us-ascii?Q?9oUpCUzWuV825JuLdtK0ysloXhNXsnHqk2JJO4i9xk/AIYkj1K7ZAyjqO1xL?=
 =?us-ascii?Q?oAJJtMOFti0EY1FhVlIiUiVTXbDf8e0n7kTPyNt7KzUifROrprlmyp04eZWF?=
 =?us-ascii?Q?83xp6Fyk6ufngiYgYCpZYbQzCE8CsnshfThXctt2t8db1ELBStozlYXtJfLb?=
 =?us-ascii?Q?lbCCfFaRil0R2bWm73cA+PtwYXlHMtVPpYIksZdkYZrQ1c0Gznue/2c4V4Cj?=
 =?us-ascii?Q?Ql8iXUCoHyFzBzbYhi7NqOicmaWMoZIHiUlKM7K/vBI66oS0AU+hZV7taVwF?=
 =?us-ascii?Q?ujv8aNN0RBvk2xdR9yYInyyK5N1Tlb84TodTNtMgPFlVcgq5Nc4RmR1nSaTB?=
 =?us-ascii?Q?9vBmzntH1+4NPU288Dq0NzVKBDwEcKsv8FeSp0pz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a5619c7c-479d-4890-65cd-08dd5301c7b3
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2025 05:28:47.1756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nIb9afdab0R4wYxW2nq5eYsJhTJTjclQOHTZ1UMDx22ip53TLhe+7BypVR9EhIp8lWY1qve40M2pMHUGet06jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8209
X-OriginatorOrg: intel.com

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   74286da1995dd8a99c67a9fb3cf658d2557f143d
commit: 6d4ab2e97dcfbcd748ae71761a9d8e5e41cc732c [1958/1958] extrawarn: enable format and stringop overflow warnings in W=1
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 6 months ago
config: x86_64-randconfig-101-20250222 (https://download.01.org/0day-ci/archive/20250222/202502221328.nkA6ehke-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250222/202502221328.nkA6ehke-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502221328.nkA6ehke-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/string.h:254,
                    from include/acpi/platform/aclinux.h:52,
                    from include/acpi/platform/acenv.h:160,
                    from include/acpi/acpi.h:22,
                    from drivers/acpi/acpica/nsnames.c:8:
   In function 'strlcat',
       inlined from 'strcat' at include/linux/fortify-string.h:432:6,
       inlined from 'acpi_ns_build_prefixed_pathname' at drivers/acpi/acpica/nsnames.c:378:4:
>> include/linux/fortify-string.h:406:19: warning: writing 1 byte into a region of size 0 [-Wstringop-overflow=]
     406 |         p[actual] = '\0';
         |         ~~~~~~~~~~^~~~~~
   In file included from include/acpi/platform/aclinux.h:58,
                    from include/acpi/platform/acenv.h:160,
                    from include/acpi/acpi.h:22,
                    from drivers/acpi/acpica/nsnames.c:8:
   drivers/acpi/acpica/nsnames.c: In function 'acpi_ns_build_prefixed_pathname':
   include/linux/slab.h:586:16: note: at offset -2 into destination object of size [0, 9223372036854775807] allocated by '__kmalloc'
     586 |         return __kmalloc(size, flags);
         |                ^~~~~~~~~~~~~~~~~~~~~~


vim +406 include/linux/fortify-string.h

a28a6e860c6cf2 Francis Laniel 2021-02-25  346  
605395cd7ceded Kees Cook      2023-04-02  347  /* Defined after fortified strlen() to reuse it. */
605395cd7ceded Kees Cook      2023-04-02  348  extern size_t __real_strlcat(char *p, const char *q, size_t avail) __RENAME(strlcat);
605395cd7ceded Kees Cook      2023-04-02  349  /**
605395cd7ceded Kees Cook      2023-04-02  350   * strlcat - Append a string to an existing string
605395cd7ceded Kees Cook      2023-04-02  351   *
605395cd7ceded Kees Cook      2023-04-02  352   * @p: pointer to %NUL-terminated string to append to
605395cd7ceded Kees Cook      2023-04-02  353   * @q: pointer to %NUL-terminated string to append from
605395cd7ceded Kees Cook      2023-04-02  354   * @avail: Maximum bytes available in @p
605395cd7ceded Kees Cook      2023-04-02  355   *
605395cd7ceded Kees Cook      2023-04-02  356   * Appends %NUL-terminated string @q after the %NUL-terminated
605395cd7ceded Kees Cook      2023-04-02  357   * string at @p, but will not write beyond @avail bytes total,
605395cd7ceded Kees Cook      2023-04-02  358   * potentially truncating the copy from @q. @p will stay
605395cd7ceded Kees Cook      2023-04-02  359   * %NUL-terminated only if a %NUL already existed within
605395cd7ceded Kees Cook      2023-04-02  360   * the @avail bytes of @p. If so, the resulting number of
605395cd7ceded Kees Cook      2023-04-02  361   * bytes copied from @q will be at most "@avail - strlen(@p) - 1".
605395cd7ceded Kees Cook      2023-04-02  362   *
605395cd7ceded Kees Cook      2023-04-02  363   * Do not use this function. While FORTIFY_SOURCE tries to avoid
605395cd7ceded Kees Cook      2023-04-02  364   * read and write overflows, this is only possible when the sizes
605395cd7ceded Kees Cook      2023-04-02  365   * of @p and @q are known to the compiler. Prefer building the
605395cd7ceded Kees Cook      2023-04-02  366   * string with formatting, via scnprintf(), seq_buf, or similar.
605395cd7ceded Kees Cook      2023-04-02  367   *
605395cd7ceded Kees Cook      2023-04-02  368   * Returns total bytes that _would_ have been contained by @p
605395cd7ceded Kees Cook      2023-04-02  369   * regardless of truncation, similar to snprintf(). If return
605395cd7ceded Kees Cook      2023-04-02  370   * value is >= @avail, the string has been truncated.
605395cd7ceded Kees Cook      2023-04-02  371   *
605395cd7ceded Kees Cook      2023-04-02  372   */
605395cd7ceded Kees Cook      2023-04-02  373  __FORTIFY_INLINE
605395cd7ceded Kees Cook      2023-04-02  374  size_t strlcat(char * const POS p, const char * const POS q, size_t avail)
605395cd7ceded Kees Cook      2023-04-02  375  {
605395cd7ceded Kees Cook      2023-04-02  376  	const size_t p_size = __member_size(p);
605395cd7ceded Kees Cook      2023-04-02  377  	const size_t q_size = __member_size(q);
605395cd7ceded Kees Cook      2023-04-02  378  	size_t p_len, copy_len;
605395cd7ceded Kees Cook      2023-04-02  379  	size_t actual, wanted;
605395cd7ceded Kees Cook      2023-04-02  380  
605395cd7ceded Kees Cook      2023-04-02  381  	/* Give up immediately if both buffer sizes are unknown. */
605395cd7ceded Kees Cook      2023-04-02  382  	if (p_size == SIZE_MAX && q_size == SIZE_MAX)
605395cd7ceded Kees Cook      2023-04-02  383  		return __real_strlcat(p, q, avail);
605395cd7ceded Kees Cook      2023-04-02  384  
605395cd7ceded Kees Cook      2023-04-02  385  	p_len = strnlen(p, avail);
605395cd7ceded Kees Cook      2023-04-02  386  	copy_len = strlen(q);
605395cd7ceded Kees Cook      2023-04-02  387  	wanted = actual = p_len + copy_len;
605395cd7ceded Kees Cook      2023-04-02  388  
605395cd7ceded Kees Cook      2023-04-02  389  	/* Cannot append any more: report truncation. */
605395cd7ceded Kees Cook      2023-04-02  390  	if (avail <= p_len)
605395cd7ceded Kees Cook      2023-04-02  391  		return wanted;
605395cd7ceded Kees Cook      2023-04-02  392  
605395cd7ceded Kees Cook      2023-04-02  393  	/* Give up if string is already overflowed. */
605395cd7ceded Kees Cook      2023-04-02  394  	if (p_size <= p_len)
605395cd7ceded Kees Cook      2023-04-02  395  		fortify_panic(__func__);
605395cd7ceded Kees Cook      2023-04-02  396  
605395cd7ceded Kees Cook      2023-04-02  397  	if (actual >= avail) {
605395cd7ceded Kees Cook      2023-04-02  398  		copy_len = avail - p_len - 1;
605395cd7ceded Kees Cook      2023-04-02  399  		actual = p_len + copy_len;
605395cd7ceded Kees Cook      2023-04-02  400  	}
605395cd7ceded Kees Cook      2023-04-02  401  
605395cd7ceded Kees Cook      2023-04-02  402  	/* Give up if copy will overflow. */
605395cd7ceded Kees Cook      2023-04-02  403  	if (p_size <= actual)
605395cd7ceded Kees Cook      2023-04-02  404  		fortify_panic(__func__);
605395cd7ceded Kees Cook      2023-04-02  405  	__underlying_memcpy(p + p_len, q, copy_len);
605395cd7ceded Kees Cook      2023-04-02 @406  	p[actual] = '\0';
605395cd7ceded Kees Cook      2023-04-02  407  
605395cd7ceded Kees Cook      2023-04-02  408  	return wanted;
605395cd7ceded Kees Cook      2023-04-02  409  }
605395cd7ceded Kees Cook      2023-04-02  410  
55c84a5cf2c72a Kees Cook      2023-04-04  411  /* Defined after fortified strlcat() to reuse it. */
55c84a5cf2c72a Kees Cook      2023-04-04  412  /**
55c84a5cf2c72a Kees Cook      2023-04-04  413   * strcat - Append a string to an existing string
55c84a5cf2c72a Kees Cook      2023-04-04  414   *
55c84a5cf2c72a Kees Cook      2023-04-04  415   * @p: pointer to NUL-terminated string to append to
55c84a5cf2c72a Kees Cook      2023-04-04  416   * @q: pointer to NUL-terminated source string to append from
55c84a5cf2c72a Kees Cook      2023-04-04  417   *
55c84a5cf2c72a Kees Cook      2023-04-04  418   * Do not use this function. While FORTIFY_SOURCE tries to avoid
55c84a5cf2c72a Kees Cook      2023-04-04  419   * read and write overflows, this is only possible when the
55c84a5cf2c72a Kees Cook      2023-04-04  420   * destination buffer size is known to the compiler. Prefer
55c84a5cf2c72a Kees Cook      2023-04-04  421   * building the string with formatting, via scnprintf() or similar.
55c84a5cf2c72a Kees Cook      2023-04-04  422   * At the very least, use strncat().
55c84a5cf2c72a Kees Cook      2023-04-04  423   *
55c84a5cf2c72a Kees Cook      2023-04-04  424   * Returns @p.
55c84a5cf2c72a Kees Cook      2023-04-04  425   *
55c84a5cf2c72a Kees Cook      2023-04-04  426   */
55c84a5cf2c72a Kees Cook      2023-04-04  427  __FORTIFY_INLINE __diagnose_as(__builtin_strcat, 1, 2)
55c84a5cf2c72a Kees Cook      2023-04-04  428  char *strcat(char * const POS p, const char *q)
55c84a5cf2c72a Kees Cook      2023-04-04  429  {
55c84a5cf2c72a Kees Cook      2023-04-04  430  	const size_t p_size = __member_size(p);
55c84a5cf2c72a Kees Cook      2023-04-04  431  
55c84a5cf2c72a Kees Cook      2023-04-04 @432  	if (strlcat(p, q, p_size) >= p_size)
55c84a5cf2c72a Kees Cook      2023-04-04  433  		fortify_panic(__func__);
55c84a5cf2c72a Kees Cook      2023-04-04  434  	return p;
55c84a5cf2c72a Kees Cook      2023-04-04  435  }
55c84a5cf2c72a Kees Cook      2023-04-04  436  

:::::: The code at line 406 was first introduced by commit
:::::: 605395cd7ceded5842c8ba6763ea24feee690c87 fortify: Add protection for strlcat()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

